module DesignAutomation

include("bracket.jl")
include("golden_section.jl")
include("ccs.jl")
include("hooke_jeeves.jl")
include("uninformed_search.jl")
include("airport.jl")
include("exhaustive_search.jl")
include("random_hill.jl")

export bracket, golden_section,
    ccs, hooke_jeeves,
    dfs, bfs,
    exhaustive_search, random_hill

end # module
