# Partial Lean verification of the Asgarli–Ghioca–Yip blocking pencil

For a finite field of order $`q`$ and a degree $`d\ge 2`$, let $`b_d(q)`$ be the least number of distinct translates $`y=x^d-s`$ whose projective closures meet every rational line. Lean proves the logarithmic upper bound unconditionally. The [written proof](PROOF.md) also gives a logarithmic lower bound; its effective point count for growing families remains open in Lean.

## Unconditional bounds

[`blockingNumber_log_upper`](../../lean/Conjectures/AsgarliGhiocaYipBlockingPencil.lean) proves the bound below over every finite field. The blocking predicate uses homogeneous coordinates, so the statement includes vertical lines and the line at infinity.

```math
b_d(q)\le \left\lfloor\frac{2\log q}{-\log(1-1/d)}\right\rfloor+1.
```

* [`exists_regular_seeds`](../../lean/Conjectures/AsgarliGhiocaYipSeed.lean): if $`q\ge 4d^2`$, then for every nonzero $`c`$ there is a nonzero $`u`$ such that at least $`q/(4d)`$ values of $`a`$ make $`cY^d+uY-a`$ separable and root-free over the base field.
* [`single_graph_missing_lines`](../../lean/Conjectures/AsgarliGhiocaYipSeed.lean): for **any** degree-$`d`$ polynomial, at least $`q(q-1)/d`$ distinct lines miss the projective closure of its graph. The proof counts ordered pairs of distinct points by their secant slope and uses the degree bound on each fiber. It has no large-field assumption.

## The lower bound for a growing family

For $`k`$ graphs of degree $`d`$ with a common nonzero leading coefficient, put $`D=d^{dk}`$. [`RegularOrderingEstimate`](../../lean/Conjectures/AsgarliGhiocaYipBlockingPencil.lean) asks for at least $`q/2`$ simultaneous root orderings over nonzero scales for each regular root-free seed when $`k\ge 1`$ and $`D^8\le q`$. These are [bijections between geometric root sets](../../lean/Conjectures/AsgarliGhiocaYipOrderedRoots.lean) that [commute with Frobenius](../../lean/Conjectures/AsgarliGhiocaYipRootLabels.lean). The count is of orderings, not of distinct scales.

Lean bounds the number of orderings over each scale by $`D`$, then bounds the number of seed–scale pairs giving the same [projective line](../../lean/Conjectures/AsgarliGhiocaYipLines.lean) by $`d-1`$. From the estimate, `missing_lines_of_ordering_estimate` deduces at least $`q^2/(8d(d-1)D)`$ missing lines when $`q\ge 4d^2`$ and $`1\le k\le\log q/(8d\log d)`$. For the monomial pencil, `pencil_bounds_of_ordering_estimate` consequently gives $`b_d(q)>\log q/(8d\log d)`$.

Both theorems take `RegularOrderingEstimate` as an explicit hypothesis. Lean checks the arithmetic after discarding the exceptional fibers, but does not yet construct the absolutely irreducible component and prove the uniform point count used in the [written argument](PROOF.md#counting-good-parameters). The separate [exact Frobenius minimum](FROBENIUS.md) and [reflexive-family extension](REFLEXIVE.md) are outside this formalization.

## Verification

The [receipt](verification/receipt.json) records strict Lean 4.35.0 compilation and stock kernel replay for the five proof modules. The [axiom audit](verification/TargetAudit.lean) checks all 128 owned declarations (114 theorems, 36 private declarations), including seven named endpoints. The only transitive axioms are `propext`, `Classical.choice` and `Quot.sound`.

After building `Conjectures.AsgarliGhiocaYipBlockingPencil` from `lean/`, run `lake env lean -j1 -DwarningAsError=true ../results/asgarli-ghioca-yip-blocking-pencil/verification/TargetAudit.lean` and `lake env python3 ../scripts/replay_lean.py --root Conjectures.AsgarliGhiocaYipBlockingPencil` to repeat the audit and replay.
