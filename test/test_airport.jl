using Test

using DesignAutomation

@testset "check_neighbors" begin
    m = [1 2 3
         4 5 6
         7 8 9]

    expected = [1, 2, 3, 4, 6, 7, 8, 9]

    res = DesignAutomation.check_neighbors(m, (2, 2))

    @test res == expected
end
