# Steinerberger’s quantitative Feldheim-tail conjecture

The Lean development proves the failure of both original existential bounds for one absolutely continuous, nonnegative probability distribution with unbounded support. The bounds fail for every real threshold `z > 0`. This is one complete formalization of the existing named repository entry.

## Source and attribution

Stefan Steinerberger posed the two questions in [*A Sharp Estimate for Probability Distributions*, arXiv:1801.00663v3, §1.3, pp. 2–3](https://arxiv.org/pdf/1801.00663). The same questions appear in §24 of his March 31, 2026 problem list. The original preprint expressly assumes an absolutely continuous distribution on the nonnegative half-line that is not compactly supported; the expectation formulation also requires a finite mean.

The formalization follows the quadratic-hazard disproof already recorded in [`PROOF.md`](PROOF.md), first committed by Cinna Davis in [`6a8c0b0ac8c5a903405782b0a0df03c9ad78cdc6`](https://github.com/1337isnot1337/solved-conjectures/commit/6a8c0b0ac8c5a903405782b0a0df03c9ad78cdc6). This identifies the repository argument and its recorded contributor. The repository's priority qualification remains: its searches did not locate an earlier full counterexample, which does not establish worldwide priority. Feldheim and Feldheim's earlier qualitative limsup theorem is a separate result.

## Exact formal statement

For a real probability measure `μ`, `eventRatio μ z` is defined using the actual product measure `μ.prod μ`:

```math
\frac{\Pr(X+Y\ge 2z,\ \min(X,Y)\le z)}
     {\Pr(X+Y\ge 2z,\ \min(X,Y)\ge z)}.
```

`numeratorEvent` and `denominatorEvent` use these inequalities directly. Real-valued probabilities are obtained with `Measure.real`. Every denominator for the witness law is proved strictly positive. The coordinate maps on the product space are proved independent and identically distributed.

`AdmissibleLaw μ` requires probability mass one, absolute continuity with respect to real Lebesgue measure, nonnegativity almost everywhere, and positive mass above every real threshold. The latter property is also used to prove explicitly that no compact set carries the full mass. `IsMedian μ m` is the usual pair of half-mass inequalities for `Iic m` and `Ici m`.

The top-level endpoints are:

- `Conjectures.SteinerbergerFeldheim.medianGuess_false`: negation of the original median-normalized existential conjecture.
- `Conjectures.SteinerbergerFeldheim.meanGuess_false`: negation of the original mean-normalized existential conjecture.
- `Conjectures.SteinerbergerFeldheim.counterexample`: one common admissible law, a positive median, a finite positive expectation, and failure of both bounds for every positive threshold, with positive denominator.
- `Conjectures.SteinerbergerFeldheim.median_bound_fails_for_every_median`: the median inequality fails for every median of the witness law. The development proves that this law has a unique median.

## Proof components

`SteinerbergerFeldheimAnalysis.lean` proves the scalar analytic estimates. It defines

```math
S(x)=e^{-x-x^2/200},\qquad
f(x)=(1+x/100)S(x),
```

and proves the uniform bound

```math
I(z)=\int_0^1\left(1+\frac z{100}(1-t)\right)e^{-z^2t^2/100}\,dt
\le\frac{401}{400}\qquad(z>0).
```

The proof follows the two parameter regimes in the recorded argument. For `z²/100 ≤ 1/2`, convexity of the exponential gives the secant bound, and a proved quadratic Taylor inequality gives the required deficit. For the other regime, the proof combines a uniform `7/8` bound with Mathlib's Gaussian half-line integral. Mathlib's proved bound `π < 4` closes the numerical constant. All polynomial integrations and algebraic inequalities are kernel-checked.

The same module proves that the survival integral satisfies

```math
0<\mu\le\frac{9903}{10000},\qquad \frac1\mu>\frac{401}{400},
```

using the exponential moments of orders zero, two, and four. Its explicit median value is

```math
m=\sqrt{10000+200\log2}-100.
```

It proves `m + m²/200 = log 2`, `m > 1/2`, and `(log 2)/m > 401/400`.

`SteinerbergerFeldheimLaw.lean` constructs the measure with density `f` on `Ioi 0`. It proves normalization by integrating the derivative of `-S`; establishes absolute continuity and absence of atoms; computes every nonnegative survival tail; verifies the two median half-masses; and proves that the actual expectation is the survival integral. Integrability of the identity random variable follows from the proved finite tail integral through the layer-cake formula.

`SteinerbergerFeldheimJoint.lean` computes the original joint probabilities. The denominator event is exactly `Ici z ×ˢ Ici z`. The numerator splits into the two symmetric crossing events, whose intersection has probability zero. Product-measure integration and the affine substitution `x = z - z*t` give the exact identity

```math
\operatorname{eventRatio}(\mathrm{law},z)=2zI(z)\qquad(z\ge0).
```

`SteinerbergerFeldheim.lean` combines these facts to prove the two strict opposite inequalities and their quantified conjecture negations. It also proves uniqueness of the median and absence of compact full-mass support.

## Scope and verification

The formal result uses the exact distribution hypotheses of the original preprint. The separate globally smooth perturbation, strict log-concavity, asymptotic rate supplements, and smaller-constant existence results recorded elsewhere in the entry are outside these endpoints. They receive no additional completion count.

The isolated verification script rebuilds all four modules with Lean 4.35.0 and warnings treated as errors, invokes the repository's generated all-owned declaration audit including private serialized declarations, and runs the unchanged pinned `leanchecker` over the exact four-module project closure. Only `propext`, `Classical.choice`, and `Quot.sound` are permitted transitively. Source and object hashes are checked before and after replay. The receipt and declaration inventory record the exact checked snapshot. The four modules and endpoints are registered in the project root, proof audit, and ordinary repository verification script. The dedicated runner and workflow provide the same scoped checks on future changes. Repository-wide verification, site checks, and publication are recorded separately in `PUBLICATION.md`; they are not inferred from the scoped receipt.
