using DesignAutomation

include("functions.jl")

@testset "Exhaustive Search" begin
    x_range = [-2, 6]

    (x, fx, f_calls) = exhaustive_search(levy3, x_range, 4; verbose=false)

    @test x == [1.0, 1.0, 1.0, -2.0]
    @test fx + 1 ≈ 1 # answer is approx 0
    @test f_calls == 81^4
end
