# Lean lower bounds for at most three speeds

[`LonelinessSmallRunner.lean`](../../lean/Conjectures/LonelinessSmallRunner.lean)
proves the lonely-runner lower bounds for one, two, and three speeds, and
transfers them to rational subspaces.

The theorem `value_ge_one_div_length_add_one` states that every nonempty list
$`D`$ of positive integer speeds with $`|D|\le3`$ satisfies

```math
\mathop{\mathrm{value}}(D)\ge\frac1{|D|+1}.
```

Repeated entries are allowed. For a bound in terms of the number of distinct
speeds, apply the theorem to the list of distinct speeds, whose value is the
same.

## Proof dependencies

`Loneliness.Packing.one_div_length_add_one_le_density` proves the lower bound
for the maximal density of a set avoiding the differences in $`D`$. Its proof
uses a finite greedy construction, repeats a finite block with a separating
gap, and passes to arbitrarily large blocks.

`Haralambis.density_eq_value` proves that this maximal density equals the
actual circle loneliness value for every positive triple. Its proof allows
repeated differences.

The new module proves that both density and loneliness value depend only on
the list's support. A one-speed or two-speed list can therefore be padded
with repeated entries when applying Haralambis's equality. The greedy lower
bound is applied to the original list, so the constants remain $`1/2`$,
$`1/3`$, and $`1/4`$, respectively.

`lonelyRunnerBound m hm` discharges the predicate
`Loneliness.CoordinateSubspace.LonelyRunnerBound m` whenever $`m\le3`$.
This predicate says that every nonempty list of at most $`m`$ distinct
positive integer speeds has value at least $`1/(m+1)`$.

## Subspace consequences

Let $`E_{\mathbb Q}\subseteq\mathbb Q^n`$ have real span $`E`$, and assume
that no coordinate vanishes identically on $`E`$. The coordinate-coalescence
construction produces an integer-speed line in $`E`$ with at most
$`n-\dim E+1`$ distinct absolute speeds. Therefore, when that number is at
most three,

```math
M(E)\ge\frac1{n-\dim E+2}.
```

`subspace_value_lower` proves this inequality with no remaining lonely-runner
hypothesis. In five coordinates the following three theorems provide exactly
the larger-subspace bounds used in the norm reduction:

| Theorem | Dimension | Lower bound |
| --- | ---: | ---: |
| `five_coordinate_dimension_three` | 3 | $`1/4`$ |
| `five_coordinate_dimension_four` | 4 | $`1/3`$ |
| `five_coordinate_dimension_five` | 5 | $`1/2`$ |

These are bounds for the existing `Loneliness.SubspaceDensity.spaceValue`,
defined as a supremum of the actual nearest-integer clearance.

## Verification

The module compiles with the pinned toolchain and passed independent
`leanchecker` replay. Seven headline declarations were audited transitively;
their only axioms are `propext`, `Classical.choice`, and `Quot.sound`.

The four-speed gap and the lattice product estimate are not consequences of
these three-speed lower bounds. They remain separate inputs to the full
five-speed classification.
