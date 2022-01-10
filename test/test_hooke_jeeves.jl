using DesignAutomation

@testset "Hooke & Jeeves" begin
    fn(x) = (x[1]-5)^2+2*(x[2]-5)^2
    x0 = [0., 0.]
    res = hooke_jeeves(fn, x0)
    
    @test res.minimizer == [5.000000000000004, 5.000000000000004]
    @test res.minimum == 5.916456789157589e-29
    @test res.iterations == 37
    @test res.converged == true

    fn(x) = (2*x[2]-3*x[1]^2)^4 + (5-2*x[1])^2
    x0 = [0., 0.]
    res = hooke_jeeves(fn, x0)
    
    @test res.minimizer == [2.4999999999999996, 9.37500000000003]
    @test res.minimum == 7.888609052210118e-31
    @test res.iterations == 99
    @test res.converged == true

    x0 = [2., 9.]
    res = hooke_jeeves(fn, x0; r=.5, h0=.5, max_iter=24)
    
    @test res.minimizer == [2.5, 9.25]
    @test res.minimum == 0.00390625
    @test res.iterations == 24
    @test res.converged == false
end
