"""
Simple representation of the results of an optimization method.
"""
struct Response
    minimizer
    minimum::AbstractFloat
    iterations::Int
    converged::Bool
end

struct TreeNode
    value
    depth::Int

    function TreeNode(value, depth=0)
        new(value, depth)
    end
end
