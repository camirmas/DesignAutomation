using DesignAutomation

include("./functions.jl")

@testset "Random Hill Climbing" begin
    x0 = [6.0, -2.0, -2.0, 6.0]
    res = random_hill(levy3, x0; max_failed=16, verbose=true)
    res = random_hill(levy3, x0; h=.01, max_failed=16, verbose=true)

    x0 = [4.2, -1.2, 2.4, -3.8]
    res = random_hill(levy3, x0; max_failed=16, verbose=true)
    res = random_hill(levy3, x0; h=.01, max_failed=16, verbose=true)

    x0 = [0.0, 0.0, 0.0, 3.2]
    res = random_hill(levy3, x0; max_failed=16, verbose=true)
    res = random_hill(levy3, x0; h=.01, max_failed=16, verbose=true)

    x0 = [1.0, 1.0, 1.0, 1.0]
    res = random_hill(levy3, x0; max_failed=16, verbose=true)
    res = random_hill(levy3, x0; h=.01, max_failed=16, verbose=true)
end
