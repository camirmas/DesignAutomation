using Test

using DesignAutomation

@testset "bracket" begin
    fn(x) = 2 - 4 * x + exp(x)
    res = [round(i, digits=3) for i in bracket(fn, .5)]
    @test res == [.5, 1.309, 2.618]
end
