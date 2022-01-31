using Test

using DesignAutomation


@testset "A* example A" begin
    # node = DesignAutomation.airport_dfs(3, "../src/data/A.csv", 10)
    # print(node.matrix)

    node = DesignAutomation.airport_a_star(3, "../src/data/A.csv", 8)

    expected = [
        -1  -1  -1  -1  -1
        -1   0   0   0  -1
        -1   1   2   0  -1
        -1   1   0   0  -1
        -1   1   2   0  -1
        -1   1   0   0  -1
        -1   1   2   0  -1
        -1   0   0   0  -1
        -1  -1  -1  -1  -1
    ]

    @test node.matrix == expected
    @test node.g == 4
    @test node.h == 0
    @test node.depth == 8
end


@testset "A* example B" begin
    node = DesignAutomation.airport_a_star(4, "../src/data/B.csv", 8)

    expected = [
        -1  -1  -1  -1  -1  -1  -1
        -1   0   0   1   0   0  -1
        -1   0   2   1   2   0  -1
        -1   0   0   1   0   0  -1
        -1   0   2   1   2   0  -1
        -1   0   0   0   0   0  -1
        -1  -1  -1  -1  -1  -1  -1
    ]

    @test node.matrix == expected
    @test node.g == 3
    @test node.h == 0
    @test node.depth == 8
end


@testset "A* example C" begin
    node = DesignAutomation.airport_a_star(6, "../src/data/C.csv", 9)

    expected = [
        -1  -1  -1  -1  -1  -1  -1  -1  -1
        -1   0   0   0   0   0   0   0  -1
        -1   0   0   2   0   2   0   0  -1
        -1   0   2   1   1   1   2   0  -1
        -1   0   0   2   0   2   0   0  -1
        -1   0   0   0   0   0   0   0  -1
        -1  -1  -1  -1  -1  -1  -1  -1  -1
    ]

    @test node.matrix == expected
    @test node.g == 2
    @test node.h == 0
    @test node.depth == 9
end


@testset "A* example D" begin
    node = DesignAutomation.airport_a_star(9, "../src/data/D.csv", 18)

    expected = [
        -1  -1  -1  -1  -1  -1  -1  -1  -1  -1
        -1   0   0   0   0   0   0   0   0  -1
        -1   1   2   0   0   2   0   0   0  -1
        -1   1   0   2   0   1   2   0   0  -1
        -1   0   1   1   1   1   0   0   0  -1
        -1   0   2   0   2   0   1   2   0  -1
        -1   0   0   0   0   2   1   0   0  -1
        -1   0   0   0   0   0   2   0   0  -1
        -1   0   0   0   0   0   0   0   0  -1
        -1  -1  -1  -1  -1  -1  -1  -1  -1  -1
    ]

    @test node.matrix == expected
    @test node.g == 8
    @test node.h == 0
    @test node.depth == 18
end


@testset "A* example E" begin
    node = DesignAutomation.airport_a_star(9, "../src/data/E.csv", 19)

    expected = [
        -1  -1  -1  -1  -1  -1  -1  -1  -1  -1
        -1   1   0   0  -1  -1  -1  -1  -1  -1
        -1   1   2   0   0  -1  -1  -1  -1  -1
        -1   1   0   2   0   0  -1  -1  -1  -1
        -1   0   1   1   1   2   0  -1  -1  -1
        -1   0   2   0   1   0   2   0  -1  -1
        -1   0   0   2   1   1   1   2   0  -1
        -1   0   0   0   2   0   2   0   0  -1
        -1   0   0   0   0   0   0   0   0  -1
        -1  -1  -1  -1  -1  -1  -1  -1  -1  -1
    ]

    @test node.matrix == expected
    @test node.g == 9
    @test node.h == 0
    @test node.depth == 19
end


@testset "A* example F" begin
    node = DesignAutomation.airport_a_star(11, "../src/data/F.csv", 23)

    expected = [
        -1  -1  -1  -1  -1  -1  -1  -1  -1  -1  -1  -1  -1
        -1   0   1   0   0   0  -1  -1  -1   0   0   0  -1
        -1   0   0   1   2   0  -1  -1   0   0   0   0  -1
        -1   0   2   1   0   0  -1  -1   0   2   0   0  -1
        -1   0   0   1   2   0  -1  -1   0   1   2   0  -1
        -1   0   2   1   0   2   0  -1   1   0   0   0  -1
        -1   0   0   0   1   1   1   1   1   2   0   0  -1
        -1   0   0   0   2   0   2   0   2   0   0   0  -1
        -1   0   0   0   0   0   0   0   0   0   0   0  -1
        -1  -1  -1  -1  -1  -1  -1  -1  -1  -1  -1  -1  -1
    ]

    @test node.matrix == expected
    @test node.g == 11
    @test node.h == 0
    @test node.depth == 23
end
