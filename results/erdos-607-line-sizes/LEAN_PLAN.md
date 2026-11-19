# Erdős 607 formalization obligations

The target is the complete asymptotic in `PROOF.md`, including its constant,
for the number of records of actual finite sets of distinct real-plane points.
An abstract tuple count or a conditional analytic transfer does not complete it.

## Finite geometry

The current `LineSize*` work uses `Point = ℝ × ℝ`, Mathlib affine lines, and
`linePoints P a b = P.filter (fun x => x ∈ line[ℝ,a,b])`.

1. Prove the necessary incidence cost bound. When lines have distinct recorded
   sizes, they are distinct affine lines. Each new line meets each previous
   line in at most one point. The zero-index cost is `∑ i<k, (d i-i)` in naturals.
2. Isolate the unique positive core `r`: `i < d i` exactly for `i < r`.
   Strict decrease gives `d i ≥ 2*r-1-i` on the core and `d i ≤ r` in the tail.
   The cost is `∑ i<r, d i - r*(r-1)/2`.
3. Construct arbitrarily many pairwise nonparallel real carrier lines. The
   finite point set consists of all their pair intersections. Maintain no
   triple concurrency and no three-point line other than a carrier.
4. Add a new carrier outside a finite set: all old intersection points and,
   for every old carrier, its intersections with old secants distinct from
   that carrier. This also excludes vertical unintended secants. Mixed triples
   are handled by the number of new intersection points they contain.
5. Enumerate carriers and use only canonical pairs `i < j`. Their intersection
   map is injective. A selected intersection is on carrier `m` exactly when
   `m=i` or `m=j`; unrestricted ordered-pair injectivity would be false.
6. Select the complete graph on the first `r` carriers. For each tail carrier
   `j`, select its intersections with core indices `i < d j`. Prove each tail
   degree is `d j` and each core degree is at most `d i`.
7. Fill each core carrier to its required size using points outside finitely
   many intersections and secants. Each added point is on exactly that carrier
   and introduces no other three-point line. Count the resulting points as
   the exact cost, then pad to any larger `n` with generic points.
8. Prove ordinary-line existence for noncollinear finite configurations, and
   handle collinear configurations and `n=1,2` explicitly. This is required
   to show that each feasible tuple gives exactly one full record.

`LineSizeCost`, `LineSizeGeometry`, `LineSizeCore`, `LineSizeGraphCounts`,
`LineSizeCoreGaps`, `LineSizeOrdinary`, and the pinned Sylvester–Gallai port have
passed local source, axiom, and independent kernel checks. The import closures
for the ordinary-line, selected-graph, and core-gap components contain 4, 3,
and 3 project modules respectively; all their source hashes were frozen for
replay. The port's license and provenance are recorded under
`lean/Conjectures/LineSizeImported`.

The complete carrier construction, filling, padding, and actual-record chain
now passes source checks, the 342-theorem ownership audit, and independent
replay of its exact 20-module closure. `lineSizeCount_eq_tupleCount` is
accepted for every natural point count. All eight geometric obligations
above are discharged.

## Exact enumeration

Prove a bijection between feasible size tuples and their positive cores plus
permitted tails. Subtract the odd staircase from the core. For `r≥3`, tails
have multiplicity `2^(r-3)`, doubled when the smallest core entry is at least
two. Handle `r=1,2` separately with minimum cores `(3)` and `(4,2)`.

Derive the displayed formal power series `G(q)` from these bijections and
identify the coefficient of `G(q)/(1-q)` with the actual geometric record
count. The empty tuple and the one-line tuple must retain their exact meanings.

Canonical tuple/core/tail reconstruction, exact cost weights, and the
cumulative exact-cost identity are now accepted from the nine-module,
307-theorem hosted receipt. The complete explicit series and its analytic
evaluation remain candidates.

## Sharp asymptotic

The finite Euler-product estimates from the rectangle lane may be reused,
but the local limit and coefficient extraction remain separate obligations.
Use `t=sqrt(A/n)` and `u0=log 2`. Prove:

- the exact dilogarithm integral and `Phi(u0)=A`;
- the uniform corrected Euler-product estimate near `u0`, by Stirling and
  a smooth Riemann-sum endpoint correction;
- the global Gaussian bound `Phi(u)≤A-(u-u0)^2`;
- the mean/variance expansions and `h=3`, `M'(u0)=3*u0`,
  `V0=2*A-3*u0^2>0`;
- Fourier inversion for the exact geometric-sum coefficient;
- the three frequency-band estimates, the local Gaussian limit, and a uniform
  `O(t^(3/2))` point-mass bound;
- the Gaussian sum over core lengths, with all tails controlled uniformly;
- the final constant and the negligible polynomial contribution.

A possible alternative combines the core-length mixture before Fourier
inversion. Its total limiting variance is
`V0 + M'(u0)^2/h = 2*A`. The analytic generating function then has real-axis
asymptotic `(sqrt 6/16)*t^(-1)*exp(A/t)` after cumulative counting. This still
requires the local complex limit and domination; the real-axis estimate alone
does not establish the sharp coefficient asymptotic.

The public repository `xiangyazi24/AnalyticCombinatorics`, commit
`7a1157d76b30c95d646f2e908762702859fb83b8`, contains a potential four-file,
694-line Cauchy/Gaussian assembly dependency closure ending in
`Ch8.SaddlePoint.GaussianCore`. It uses Lean/Mathlib 4.29 and Apache 2.0.
Its dominated-convergence theorem states measurability, pointwise convergence,
and an integrable dominating function as explicit hypotheses. These must be
proved for this generating function. The candidate is not yet ported or
locally verified, and it supplies none of those problem-specific hypotheses.

## Acceptance

Keep unfinished sources outside accepted roots. Register a component only after
source compilation, the ownership-based axiom audit, and independent replay by
the pinned unchanged kernel. Preserve the exact final quantifiers and constant.

## Checked analytic profile

The literal profile and singular-endpoint integral now pass their five-module
source, 137-theorem axiom, and independent kernel checks. The exact saddle
value, unique critical point, curvature, global Gaussian phase bound, and
mean/variance identities are discharged. The uniform corrected Euler product
is now accepted as well: its eight-module closure passed strict sources,
the 122-theorem axiom audit, and independent kernel replay at `0bacde8`.
The generating-function development, local Fourier limit, and coefficient
assembly remain additional obligations.

## Current analytic route

The new candidates work with the literal finite product of geometric
characteristic factors. A summed cubic logarithmic error becomes
`O(sqrt(t)*abs(y)^3)` under `theta=t*sqrt(t)*y` on a bounded scaled-core range.
The fixed Fourier prefix provides an integrable frequency envelope. For short
cores, half of the core Gaussian supplies the missing frequency damping.

A separate floor-defined lattice step converts the scaled infinite sum to
an actual product-measure integral. Its dominated-convergence theorem keeps
the actual coefficient bound, measurability, and pointwise limit as explicit
hypotheses. Those hypotheses and the Gaussian constant must be discharged
for the present generating function. None of these new candidate implications
is a substitute for the final sharp asymptotic.
