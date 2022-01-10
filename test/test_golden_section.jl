using Test

using DesignAutomation

@testset "golden_section" begin
    # basic quadratics
    fn(x) = (x-4)^2
    expected = DesignAutomation.Response(
        4.000009596893628,
        9.210036731151505e-11,
        23
    )

    @test golden_section(fn) == expected

    fn(x) = 2 - 4*x + exp(x)
    expected = DesignAutomation.Response(
        1.3863011401228174,
        0.4548225556123473,
        22
    )

    @test golden_section(fn; δ=.5) == expected

    # quadratic
    fn(x) = 3*x^2 + 12/x^3 - 5
    expected = DesignAutomation.Response(
        1.4309864897989497,
        5.238362559941962,
        22
    )

    @test golden_section(fn; δ=.5) == expected

    # quadratic, with bounds
    expected = DesignAutomation.Response(
        1.4309790387227168,
        5.238362556883395,
        24
    )

    @test golden_section(
        fn; bounds=[.5, 6], δ=.5) == expected

    # sin
    fn(x) = sin(x)
    expected = DesignAutomation.Response(
        4.712370276668626, # 3π/2
        -0.9999999998250855,
        24
    )

    @test golden_section(fn) == expected
end
