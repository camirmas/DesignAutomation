using LinearAlgebra

include("golden_section.jl")

"""
Implements the Cyclic Coordinate Search optimization method. Uses a Golden
Section line search to determine step size.
"""
function ccs(fn, x0, ϵ=.001, max_iter=20)
    k = 0
    n = length(x0)
    x = copy(x0)
    results = [(x0, fn(x0))]

    for k = 1:max_iter

        for i = 1:n
            d = zeros(n)
            d[i] = 1

            α_fn(α) = fn(x + α * d)
            res = golden_section(α_fn)

            # golden section found a step size that improves x
            if !isnothing(res)
                α = res.minimizer
                x += α * d
            end

            fx = fn(x)

            push!(results, (copy(x), fx))

            if norm(x-results[end-1][1]) < ϵ
                return Response(x, fx, k)
            end

            k += 1
        end
    end
end
