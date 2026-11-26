# Geometric covering comparisons for the truncated square

Lean verifies two competing convex sets in the four-shape covering formulation of Conjecture 6.1. It uses planar Lebesgue measure and the supremum of the scales at which the two unit segments and two normal triangles have translates inside the competitor. Coordinates for both competitors use the horizontal reflection in the written proof. The source’s identification with Ekeland–Hofer–Zehnder capacity, its formula for the proposed trapezoid and the separate strict inequality for every convex body remain outside this formalization. [Primary source, §6.2](https://arxiv.org/abs/2603.12495v2) · [Written argument](PROOF.md) · [General strict bound](STRICT-BOUND.md).

For all truncation legs $`0<a,b<1`$, Lean proves that the area of the truncated square is $`1-ab/2`$. The explicit parallelogram has area $`1/(2-a)`$ and covering scale one. Its inverse covering ratio is

```math
\frac{2-ab}{2-a}=1+\frac{a(1-b)}{2-a}.
```

At $`a=1/2`$ and $`b=9/10`$ this is exactly $`31/30<4340/3971`$, where the second value evaluates the source’s trapezoid formula. Lean also proves strict improvement for every fixed $`0<a<1`$ throughout a left neighbourhood of $`b=1`$. [Parallelogram and placements](../../lean/Conjectures/MeylenderThalmaierParallelogram.lean) · [Truncated-square area](../../lean/Conjectures/MeylenderThalmaierCutArea.lean) · [Geometric comparison](../../lean/Conjectures/MeylenderThalmaierComparison.lean).

For $`a=1/10`$ and $`b=9/10`$, Lean checks the five supporting half-planes and the vertices of the independent rational pentagon. It checks explicit placements of all four shapes, proves its covering scale is one using the vertical span, and computes its Lebesgue area by integrating the widths of three vertical strips. The area is $`1092843/2070250`$, and the exact inverse-ratio comparison is

```math
1 < \frac{208733013}{207025000} < \frac{783100}{753571}.
```

[Original rational certificate](PENTAGON.md) · [Convexity and covering scale](../../lean/Conjectures/MeylenderThalmaierPentagon.lean) · [Area and exact fractions](../../lean/Conjectures/MeylenderThalmaierPentagonArea.lean).

## Verification

The independent research and publication runs strictly compiled and replayed nine project modules with the pinned Lean 4.35.0 stock kernel. Both audits covered 190 declarations, including 155 theorems, 46 private declarations and all 31 required endpoints. Only the three permitted axioms occur in the closure. The receipt lists the endpoints, proof and verifier hashes, commands, and counts. [Verification receipt](verification/covering-receipt.json).

Run these checks from the repository root.

```sh
python3 results/meylender-thalmaier-truncated-square/check_pentagon.py
python3 scripts/verify_lean_target.py --root Conjectures.MeylenderThalmaierPentagonArea --require MeylenderThalmaier.geometric_eventually_better --require MeylenderThalmaier.pentagon_geometric_counterexample --out /tmp/truncated-square-covers
```

If you use this result, please credit Lou Meylender and Thomas Thalmaier for the conjecture, Alexey Balitskiy, Ivan Mitrofanov and Alexander Polyanskii for the covering formulation, and cite Cinna Davis’s site together with the particular proof or certificate you use. [Cinna Davis](https://itsdavis.com/) · [Source record](https://github.com/1337isnot1337/solved-conjectures/tree/main/results/meylender-thalmaier-truncated-square).
