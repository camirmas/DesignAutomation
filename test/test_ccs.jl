using DesignAutomation

@testset "Cyclic Coordinate Search" begin
    fn(x) = (x[1]-5)^2+2*(x[2]-5)^2
    x0 = [0., 0.]
    res = ccs(fn, x0)
    
    @test res.minimizer == [5.000009596893628, 5.000009596893628]
    @test res.minimum == 2.7630110193454514e-10
    @test res.iterations == 2
end
