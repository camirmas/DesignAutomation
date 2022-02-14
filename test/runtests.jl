using Test

test_modules = [
    "test_bracket",
    "test_golden_section",
    "test_ccs",
    "test_hooke_jeeves",
    "test_uninformed_search",
    # "test_airport",
    "test_exhaustive_search",
    "test_random_hill"
]

for mod in test_modules
    @testset "$(mod)" begin
        include("$mod.jl")
    end
end
