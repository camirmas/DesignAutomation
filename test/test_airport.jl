using Test

using DesignAutomation

@testset "get_neighbors" begin
    m = [1 2 3
         4 5 6
         7 8 9]

    expected = [1, 2, 3, 4, 6, 7, 8, 9]

    res = DesignAutomation.get_neighbors(m, (2, 2))

    @test res == expected
end

@testset "example A" begin
    node = DesignAutomation.airport_dfs(3, "../src/data/A.csv", 10)
    print(node.matrix)
end
