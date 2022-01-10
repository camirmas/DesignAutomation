using DesignAutomation

@testset "Cyclic Coordinate Search" begin
    fn(x) = (x[1]-5)^2+2*(x[2]-5)^2
    x0 = [0., 0.]
    res = ccs(fn, x0)
    
    @test res.minimizer == [5.000000000000287, 4.999999999999858]
    @test res.minimum == 1.2269074772811875e-25
    @test res.iterations == 4

    fn(x) = (2*x[2]-3*x[1]^2)^4 + (5-2*x[1])^2
    x0 = [0., 0.]
    res = ccs(fn, x0)
    
    @test res.minimizer == [2.5000000000414278, 9.37508062857279]
    @test res.minimum == 6.761975408914261e-16
    @test res.iterations == 2
end
