struct AirportNode
    value
    depth::Int
    terminals::Int
end

function is_goal(node::AirportNode, terminals)
    # check if we have the proper number of terminals
    return node.terminals == terminals
end

function check_neighbors(matrix, (row, col))
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

    return neighbors
end

"""
Transition function for adding new walkways.
"""
function transition_walkway(node, (row, col))
    neighbors = check_neighbors(node.matrix, (row, col))

    if 1 in neighbors
        new_m = copy(node.matrix)
        new_m[row, col] = 1
        new_node = AirportNode(new_m, node.depth+1, node.terminals)

        # check the new_m for rule 2 violations

    end
end

"""
Check if a terminal can be added to the given matrix at a point.
"""
function check_terminal(matrix, (row, col))

end

"""
Transition function for adding new terminals.
"""
function transition_terminal(matrix, (row, col))
end
