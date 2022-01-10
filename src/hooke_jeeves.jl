using LinearAlgebra

"""
Implements the Hooke & Jeeves direct search method.

Arguments:
    fn: objective function
    x0: starting point
    h0: starting step size
    h_min: minimum step size
    r: reduction factor for step size

Returns:
    `Response` struct if successful, else `nothing`
"""
function hooke_jeeves(fn, x0; h0=1/10, h_min=.01, r=1/2, max_iter=1000)
    x = copy(x0)
    n = length(x)
    e_hat = Matrix(1I, n, n)
    k = 0
    h = h0
    x_b = x
    fx = fn(x)
    results = [(x, fx)]

    while k < max_iter
        for i = 1:n
            x, fx = results[end]
            # try searching in each linearly independent direction
            x_new = x + h * e_hat[:, i]
            f_new = fn(x_new)

            if f_new <= fx
                k += 1
                push!(results, (x_new, f_new))
            else
                x_new = x - h * e_hat[:, i]
                f_new = fn(x_new)

                if f_new <= fx
                    k += 1
                    push!(results, (x_new, f_new))
                end
            end
        end

        x, fx = results[end]
        # if the base hasn't changed, reduce step size
        if x_b == x
            h *= r

            # convergence reached
            if h < h_min
                return Response(x, fx, k, true)
            end
        end

        # perform acceleration step
        x_new = 2x - x_b
        x_b = x
        f_new = fn(x_new)

        if f_new <= fx
            k += 1
            push!(results, (x_new, f_new))
        end
    end

    println("Maximum iterations reached.")
    x, fx = results[end]
    return Response(x, fx, k, false)
end
