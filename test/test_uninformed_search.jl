using Test

@testset "uninformed search" begin
    @testset "bfs" begin
        #  1
        # 2 3
        fn2(node::DesignAutomation.TreeNode) = node.value * 2
        fn3(node::DesignAutomation.TreeNode) = node.value * 3
        s_fns = [fn2 fn3]
        seed = 1

        res = bfs(seed, 2, s_fns)

        @test res.value == 2
        @test res.depth == 2

        #    1
        #   2 3
        #  4 6 12
        fn2(node::DesignAutomation.TreeNode) = node.value * 2
        fn3(node::DesignAutomation.TreeNode) = node.value * 3
        s_fns = [fn2 fn3]
        seed = 1

        res = bfs(seed, 6, s_fns)

        @test res.value == 6
        @test res.depth == 3
    end

    @testset "dfs" begin
        #  1
        # 2 3
        fn2(node::DesignAutomation.TreeNode) = node.value * 2
        fn3(node::DesignAutomation.TreeNode) = node.value * 3
        s_fns = [fn2 fn3]
        seed = 1

        res = dfs(seed, 2, s_fns, 3)

        @test res.value == 2
        @test res.depth == 2

        #     1
        #    2 3
        #  4 6 6 9
        fn2(node::DesignAutomation.TreeNode) = node.value * 2
        fn3(node::DesignAutomation.TreeNode) = node.value * 3
        s_fns = [fn2 fn3]
        seed = 1

        res = dfs(seed, 6, s_fns, 3)

        @test res.value == 6
        @test res.depth == 3
    end
end
