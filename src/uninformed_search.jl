using DataStructures

include("types.jl")

"""
Depth First Search.
"""
function dfs(val, target, s_fns, max_depth)
    path = []
    nodes = Stack{TreeNode}()
    push!(nodes, TreeNode(val, 1))

    while !isempty(nodes)
        node = pop!(nodes)

        if node.depth > max_depth
            continue
        end

        push!(path, node.value)

        if node.value == target
            return node
        end

        for fn in s_fns
            new_val = fn(node)
            new_node = TreeNode(new_val, node.depth+1)
            push!(nodes, new_node)
        end
    end
end

"""
Breadth First Search.
"""
function bfs(val, target, s_fns)
    path = []
    nodes = Queue{TreeNode}()
    enqueue!(nodes, TreeNode(val, 1))

    while !isempty(nodes)
        node = dequeue!(nodes)

        push!(path, node.value)

        if node.value == target
            return node
        end

        for fn in s_fns
            new_val = fn(node)
            new_node = TreeNode(new_val, node.depth+1)
            enqueue!(nodes, new_node)
        end
    end
end
