include("constants.jl")

"""Performs bracketing to determine the initial bounds on a minimum."""
function bracket(fn, δ, limit=100)
    α = 0
    q = 0
    
    α_values = []
    for i=1:3
        α += G^q*δ
        push!(α_values, α)
        q += 1
    end
    f_0, f_1, f_2 = [fn(α_values[i]) for i in 1:3] # q-2, q-1, q

    for _ = 1:limit
        if f_1 < f_0 && f_2 > f_1
            return (α_values[begin], α_values[2], α_values[end])
        end

        α += G^q*δ
        push!(α_values, α)
        α_values = α_values[2:end]
        q += 1

        f_0 = f_1
        f_1 = f_2
        f_2 = fn(α[end])
    end
end
