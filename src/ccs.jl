using LinearAlgebra
using LineSearches, Optim

"""
Implements the Cyclic Coordinate Search optimization method. Uses a Golden
Section line search to determine step size.
"""
function ccs(fn, x0, ϵ=.001, max_iter=100)
    algo_hz = Newton(linesearch = HagerZhang())
    k = 0
    n = length(x0)
    x = copy(x0)
    results = [(x0, fn(x0))]

    for k = 1:max_iter

        for i = 1:n
            d = zeros(n)
            d[i] = 1

            α_fn(α) = fn(x + α .* d)
            res = Optim.optimize(α_fn, x, method=algo_hz)

            α = res.minimizer
            x += α .* d

            fx = fn(x)

            push!(results, (copy(x), fx))

            if norm(x-results[end-1][1]) < ϵ
                return Response(x, fx, k)
            end

            k += 1
        end
    end
end
