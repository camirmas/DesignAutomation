using LinearAlgebra
using LineSearches, Optim

"""
Implements the Cyclic Coordinate Search optimization method. Uses a Hager-Zhang
linesearch to determine step size.
"""
function ccs(fn, x0, ϵ=.001, max_iter=100)
    algo_hz = Newton(linesearch = HagerZhang())
    i = 1
    k = 0
    n = length(x0)
    results = [(x0, fn(x0))]
    e_hat = Matrix(1I, n, n)

    while k < max_iter
        x, _ = results[end]

        if i == n + 1
            d_k = x - results[k-n+1][1]
            i = 1
        else
            d_k = e_hat[:, i]
        end

        α_fn(α) = fn(x + α .* d_k)
        res = Optim.optimize(α_fn, x, method=algo_hz)

        α = res.minimizer
        x_new = x + α .* d_k
        f_new = fn(x_new)
        push!(results, (x_new, f_new))

        k += 1
        i += 1

        if norm(x_new-x) < ϵ
            return Response(x_new, f_new, k)
        end

    end
end
