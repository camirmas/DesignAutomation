# DesignAutomation :robot:

 > Implementations of optimization algorithms for OSU ME 617 (Design Automation)

## Installation

`Pkg.add("https://github.com/camirmas/DesignAutomation")`


## Usage

```julia
using DesignAutomation

fn(x) = (x-4)^2
res = golden_section(fn)

res.minimizer # 4.000009596893628
res.minimum # 9.210036731151505e-11
res.iterations # 23
```

Current features:
- bracketing (Golden Ratio)
- Golden Section search
- Cyclic Coordinate Search (CCS)
- Hooke & Jeeves search
