"""
Performs an exhaustive search for a function using a discretized search space.

The total number of function calls will be d^n, where d is the number of
dimensions, and n is the length of the discretized search space.

    Args:
      fn (Function): Objective function
      x_range (Array): Range of x values to explore
      dimensions (Int64): Dimensionality of search space
      spacing (Float64, optional): Discretization
      verbose (Bool, optional): Print results

    Returns:
      Tuple: (x, fx, f_calls) where x is the minimizer, fx is the minimum, and
      f_calls is the number of function calls made.
"""
function exhaustive_search(fn::Function, x_range::Array, dimensions::Int64;
                           spacing=.1, verbose=true)
    f_calls = 1

    i = 1
    k = [1 for _ in 1:dimensions]
    min_x, max_x = x_range
    x_values = collect(min_x:spacing:max_x)
    n_x_values = length(x_values)
    x = [x_values[begin] for _ in 1:dimensions]
    x_star = copy(x)
    f_star = fn(x_star)
    n = length(x)

    while i <= n
        k[i] += 1

        if k[i] > n_x_values
            x[i] = min_x
            k[i] = 1
            i += 1
            continue
        end

        x[i] = x_values[k[i]]

        fnew = fn(x)
        f_calls += 1

        if verbose && (f_calls % 1000000 == 0)
            println("Iterations: $(f_calls)\nx*: $(x_star)\nf*: $(f_star)\n")
        end

        if fnew < f_star
            f_star = fnew
            x_star = copy(x)
        end

        i = 1
    end

    if verbose
        println("Iterations: $(f_calls)\nx*: $(x_star)\nf*: $(f_star)\n")
    end

    return x_star, f_star, f_calls
end
