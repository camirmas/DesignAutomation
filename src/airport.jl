using CSV, DataFrames
using DataStructures

function read_csv(filename)
    println("Reading CSV...")
    m = CSV.read(filename, DataFrame; header=false)
    return Matrix{Int}(m)
end

struct AirportNode
    matrix
    depth::Int
    terminals::Int
end

function is_goal(node::AirportNode, terminals)
    # check if we have the proper number of terminals
    return node.terminals == terminals
end

function get_neighbors(matrix, (row, col); diagonal=true)
    if diagonal
        neighbors = []
        for nrow=row-1:row+1
            for ncol=col-1:col+1
                if nrow == row && ncol == col
                    continue
                else
                    push!(neighbors, matrix[nrow, ncol])
                end
            end
        end
    else
        top = matrix[row-1, col]
        right = matrix[row, col+1]
        bottom = matrix[row+1, col]
        left = matrix[row, col-1]
        neighbors = [top, right, bottom, left]
    end

    return neighbors
end

"""
Rule 1 states that at any given index, a 0 can become a 2 if:
    - Bordering a 1 on side
    - Other 3 sides are 0
"""
function check_rule_1(node, (row, col))
    state = node.matrix

    if state[row, col] != 0
        return false
    end

    neighbors = get_neighbors(node.matrix, (row, col); diagonal=false)

    # we're looking for [0, 0, 0, 1]
    return sort(neighbors) == [0, 0, 0, 1]
end

"""
Rule 2 states that at any given index, a 0 can become a 1 if:
    - Neighbors existing “1”, even if diagonally
    - Doesn’t cause a violation in Rule 1 (handled in transition function)
"""
function check_rule_2(node, (row, col))
    if node.matrix[row, col] != 0
        return false
    end

    neighbors = get_neighbors(node.matrix, (row, col))

    return 1 in neighbors
end

"""
Transition function for adding new walkways.
"""
function transition_walkway(node, (row, col))
    state = node.matrix

    if state[row, col] != 0
        return
    end

    if !check_rule_2(node, (row, col))
        return
    end

    new_m = copy(node.matrix)
    new_m[row, col] = 1
    new_node = AirportNode(new_m, node.depth+1, node.terminals)

    # check the new_m for rule 1 violations
    # new node cannot be directly next to a 2
    neighbors = get_neighbors(new_node.matrix, (row, col); diagonal=false)

    if 2 in neighbors
        return
    end

    return new_node
end

"""
Transition function for adding new terminals.
"""
function transition_terminal(node, (row, col))
    if !check_rule_1(node, (row, col))
        return
    end

    new_m = copy(node.matrix)
    new_m[row, col] = 2
    new_node = AirportNode(new_m, node.depth+1, node.terminals+1)

    return new_node
end

"""
Depth First Search Airport Terminal solver.
"""
function airport_dfs(terminals, seed_file, max_depth)
    s_fns = [
        transition_terminal,
        transition_walkway
    ]
    nodes = Stack{AirportNode}()
    initial_state = read_csv(seed_file)
    println("Running Airport Terminal Solver...")
    seed = AirportNode(initial_state, 1, 0)
    push!(nodes, seed)
    last_node = seed
    i = 0

    while !isempty(nodes)
        node = pop!(nodes)
        last_node = node
        state = node.matrix

        i += 1
        if i % 100000 == 0
            println("\n\nIterations: $(i). Stack size: $(length(nodes))")
        end

        if node.depth > max_depth
            continue
        end

        is_goal(node) = node.terminals == terminals

        if is_goal(node)
            return node
        end

        # Run walkway and terminal transition functions on current matrix
        # and add valid nodes to the stack.
        rows, cols = size(state)
        for row=1:rows
            for col=1:cols
                for fn in s_fns
                    new_node = fn(node, (row, col))    

                    if isnothing(new_node)
                        continue
                    end

                    push!(nodes, new_node)
                end
            end
        end
    end
    println("failed. final state:\n$(last_node.matrix)")
end
