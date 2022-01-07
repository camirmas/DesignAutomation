# DesignAutomation :robot:

 > Accessible implementations of optimization algorithms 

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

## Todos

- [ ] Gracefully handle error conditions in case of bracketing failure
- [ ] Generate documentation from function docstrings
- [ ] Publish to [General Registry](https://github.com/JuliaRegistries/General)

