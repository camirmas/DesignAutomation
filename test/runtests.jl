test_modules = [
    "test_bracket",
    "test_golden_section",
    "test_ccs",
]

for mod in test_modules
    println("Testing: $mod")
    include("$mod.jl")
end
