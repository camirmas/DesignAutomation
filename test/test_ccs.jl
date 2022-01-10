using DesignAutomation

@testset "Cyclic Coordinate Search" begin
    fn(x) = (x[1]-5)^2+2*(x[2]-5)^2
    x0 = [0., 0.]
    res = ccs(fn, x0)
    
    @test res.minimizer == [5., 5.]
    @test res.minimum == 0.
    @test res.iterations == 2

    fn(x) = (2*x[2]-3*x[1]^2)^4 + (5-2*x[1])^2
    x0 = [0., 0.]
    res = ccs(fn, x0)
    
    @test res.minimizer == [2.4999925903043896, 9.369964709290048]
    @test res.minimum == 1.0058343546430942e-8
    @test res.iterations == 46
end
