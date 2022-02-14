using DesignAutomation

@testset "Cyclic Coordinate Search" begin
    fn(x) = (x[1]-5)^2+2*(x[2]-5)^2
    x0 = [0., 0.]
    res = ccs(fn, x0)
    
    @test res.minimizer ≈ [5.0, 5.0]
    @test res.minimum + 1 ≈ 1 # answer is approx 0
    @test res.iterations == 3
    @test res.converged == true

    fn(x) = (2*x[2]-3*x[1]^2)^4 + (5-2*x[1])^2
    x0 = [0., 0.]
    res = ccs(fn, x0)
    
    @test res.minimizer ≈ [2.5, 9.375]
    @test res.minimum + 1 ≈ 1 # answer is approx 0
    @test res.iterations == 4
    @test res.converged == true
end
