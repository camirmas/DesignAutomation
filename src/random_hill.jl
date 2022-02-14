using LinearAlgebra

"""
Performs a random hill climb solution for a discretized search space.

    Args:
      fn (Function): Objective function
      x0 (Array{Any}): Starting point
      h (Float64, optional): Discretization
      max_failed (Int64, optional): Max number of failed moves before exiting.
        Defaults to the dimensionality of the design space.
      verbose (Bool, optional): Optionally print results

    Returns:
      tuple: (x, fx, f_calls) where x is the minimizer, fx is the minimum, and
      f_calls is the number of function calls made.
"""
function random_hill(fn::Function, x0::Array{Float64};
                     h=.1, max_failed=nothing, verbose=false)
    x = copy(x0)
    fx = fn(x)
    n = length(x)
    failed = 0
    f_calls = 1

    # use an I matrix to randomly determine direction
    e_hat = Matrix(1I, n, n)

    if isnothing(max_failed)
        max_failed = n
    end

    while failed < max_failed
        d = e_hat[:, rand(1:n)] # randomly choose basis vec
        d *= rand([-1, 1]) # randomly choose pos/neg
        
        xnew = x + h*d
        fnew = fn(xnew)
        f_calls += 1

        if fnew < fx
            fx = fnew
            x = xnew
            failed = 0
        else
            failed += 1
        end
    end

    if verbose
        println("Iterations: $(f_calls)\nx*: $(x)\nf*: $(fx)\n")
    end

    return x, fx, f_calls
end
