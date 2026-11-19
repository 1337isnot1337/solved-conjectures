# Endpoint and quantitative runner candidates

These modules are unregistered source candidates. None of the gates below
has a completed receipt at this checkpoint. Each uses the existing exact
dependency-closure gate: source rebuild, an ownership-based audit of every
project theorem, and independent replay with the pinned stock Lean kernel.
Allowed axioms remain `propext`, `Classical.choice`, and `Quot.sound`.

The gates are separate so that an error in the finite enumeration does not
prevent checking independent arithmetic or hyperplane arguments.

| Task | Statement to be checked |
| --- | --- |
| `six-classification-bound` | The five-speed runner bound and primitive six-speed tight classification imply the six-speed runner bound for arbitrary positive lists of at most six entries. |
| `hyperplane-endpoint-geometry` | For a primitive full-support normal, equality with the unshifted hyperplane maximum is equivalent to the actual velocity circle hitting the specified finite-order canonical residue. |
| `hyperplane-endpoint-density` | The endpoint-equality event in the literal positive, pairwise-distinct box sample has limiting probability given by the totient and finite Euler product. Nonprimitive velocities remain in the sample. |
| `hyperplane-rate-sharpness` | The normal `(1,1,-1)` and velocities `g(1,2,3)` give an actual value `1/4`, a positive gap from the profile `1/3`, and two-sided bounds of order `1/N` for the uniform failure probability. |
| `hyperplane-compact-subgroup` | Finite Fourier approximation and nontrivial-character cancellation control the actual integer velocity circles in a compact torus subgroup. |
| `hyperplane-subspace-classification` | For a fixed shift and closed sublevel below the real-subspace maximum, the bad integer velocities form a finite union of proper integer-equation slices. The induction uses the torus closure of the actual subspace. |
| `seven-quantitative-arithmetic` | Exact determinant, adjacent-ratio, and prefix inequalities give the area and rounding-error bounds at norm cutoff `7*42^10`. |
| `seven-rational-gap` | The real-time pair-sum maximum theorem gives a bounded denominator and an explicit gap above `1/7`. |
| `seven-minor-bound` | Actual integer minors and repeat-line generators are bounded using the first Gram--Schmidt residual and two-coordinate Cauchy--Schwarz. |
| `seven-quantitative-basis` | A positive primitive seven-speed tuple above the cutoff lies in an actual two-dimensional rational prefix plane with the required area and value bounds. |
| `seven-repeat-patterns` | Bounds on all actual repeated-speed directions imply the canonical signed six-speed patterns and normalized plane data. |
| `seven-tangent-gap` | A failure of a complementary-pair relation produces an explicit point with clearance at least `229/1596`. |
| `seven-product-family` | Every primitive positive product list with base `[1,2,3,4,5,6]` and value below `1/7` has exact value `s/(7*s+1)` for an unrestricted integer `s >= 1`. |
| `seven-product-directions` | Every positive integer direction in an actual signed standard product plane gives a permutation of the complete seven-entry product list. |
| `seven-large-norm-family` | Every positive primitive seven-speed tuple with value below `1/7` and Euclidean norm at least `7*42^10` is a permutation of `[1,2,3,4,5,6,7*s]` and has value `s/(7*s+1)`. |

The geometric seven-speed statements retain `LonelyRunnerBound 5` and
`PrimitiveSixClassification` as explicit theorem inputs where required.
They are not axioms, and these candidates do not complete the seven-speed
result while those inputs remain undischarged. The small-norm alternatives
also remain a separate obligation. The scalar product-family theorem has
no lower-runner input; membership in that family is proved by other modules.

The hyperplane subspace theorem is separate from exact quasipolynomial
counting. No eventual counting statement is substituted for an all-positive-
integer statement, and no general Ehrhart theorem is assumed.

Inspect a task without running Lean:

```sh
python3 scripts/verify_loneliness_final_extensions.py seven-large-norm-family --plan
```

Run the full source, axiom, and kernel gate for a task:

```sh
python3 scripts/verify_loneliness_final_extensions.py hyperplane-endpoint-density
```
