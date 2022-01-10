include("constants.jl")
include("bracket.jl")
include("types.jl")

"""
Performs the Golden Search optimization method. Includles bracketing to
determine initial bounds on the minimum.

Arguments:
    fn: objective function
    bounds: (optional) user-provided [lower, upper] starting boundary
    δ: step size
    ϵ: tolerance
    limit: maximum number of iterations

Returns:
    `Response` struct if successful, else `nothing`
"""
function golden_section(fn; bounds=nothing, δ=.01, ϵ=.0001, limit=1000)
    if !isnothing(bounds)
        α_l, α_u = bounds
        α_a = α_l + (1 - 1/G)*(α_u - α_l)
    else
        brackets = bracket(fn, δ)

        if isnothing(brackets)
            return
        end
        α_l, α_a, α_u = brackets
    end

    α_b = α_l + 1/G*(α_u - α_l)

    for i = 1:limit
        f_α_a = fn(α_a)
        f_α_b = fn(α_b)

        if abs(α_u - α_l) < ϵ
            x = (α_u + α_l) / 2

            return Response(x, fn(x), i)
        end

        if f_α_a < f_α_b
            α_u = α_b
            α_b = α_a
            α_a = α_l + (1 - 1/G)*(α_u - α_l)
        elseif f_α_a > f_α_b
            α_l = α_a
            α_a = α_b
            α_b = α_l + 1/G*(α_u - α_l)
        else
            α_l = α_a
            α_u = α_b
            α_a = α_l + (1 - 1/G)*(α_u - α_l)
            α_b = α_l + 1/G*(α_u - α_l)
        end
    end
end
