# Lean scope: conditional norm reduction for nine through thirteen speeds

The exact 81-module dependency closure of
[LonelinessTightNormBounds](../lean/Conjectures/LonelinessTightNormBounds.lean)
proves the norm cutoff and prime-selection step used in the nine-speed and
eleven-through-fourteen-runner equality arguments. The conclusion retains
the lower-dimensional lonely-runner inequalities as explicit hypotheses.

## Exact statement

Let `k∈{9,10,11,12,13}` and let `v : Fin k → ℕ` satisfy:

- every coordinate is positive;
- the gcd of the coordinates is one;
- the actual real-time loneliness value of `List.ofFn v` is at most
  `1/(k+1)`;
- `LonelyRunnerBound m` holds for every `1≤m<k`.

The final theorem does not require coordinate injectivity. Here
`LonelyRunnerBound m` means that every nonempty list of distinct positive
natural speeds of length at most `m` has actual loneliness value at least
`1/(m+1)`. This hypothesis is visible in both final theorem types.

Then Lean proves

```math
\sum_{i=1}^{k}v_i^2\le B_k
\quad\text{and}\quad
\exists p\in P_k\ \forall i,\ p\nmid v_i.
```

The literal cutoffs and finite prime sets are defined in
[LonelinessModularTightPrimeDefs](../lean/Conjectures/LonelinessModularTightPrimeDefs.lean).
The prime-set cardinalities below are descriptive counts of those literal lists.

| Number of speeds `k` | Verified squared-norm cutoff `B_k` | Primes in the literal list `P_k` |
| --- | ---: | ---: |
| 9 | 333055029458264 | 28 |
| 10 | 134109197352809224 | 61 |
| 11 | 70686894467424129757 | 44 |
| 12 | 47711408571608044810046 | 91 |
| 13 | 40476043859539475774890749 | 62 |

The two final endpoints are
`Loneliness.NormGeometry.tight_natural_squaredNorm_le` and
`Loneliness.NormGeometry.exists_original_prime_of_tight`.

## What is proved internally

The proof constructs an integer basis extending the primitive speed vector,
then derives the projected Euclidean geometry, Gram determinants and the
required reduced basis. The coordinate-coalescence and nearest-plane
arguments derive the prefix constraints from the explicit lower-runner
hypotheses and the actual loneliness assumption.

The product minimization uses the checked KZ inequalities and all 7,936
finite subset-certificate rows for dimensions eight through twelve.
The rational prefix-product margins yield the displayed natural cutoffs.
The prime-data modules prove primality, coprimality and the exact integer
AM–GM margins; the forced-divisor argument yields a listed prime that
divides no speed. These geometric, product, finite-data and prime-selection
claims are not additional premises of the two final endpoints.

## Remaining obligations

This is a conditional reduction. It does not prove
`LonelyRunnerBound m` for all the smaller dimensions required by its
applications. It does not prove that every tuple modulo a selected prime
belongs to the listed survivor families, exhaust the lift trees, or prove
uniqueness of an integer equality case.

The full nine-speed and eleven-through-fourteen-runner result directories
therefore remain partial. Their already-checked explicit examples and this
norm reduction are components of the classifications.

## Exact verification evidence

[Run 44530735399 / job 135583044214](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44530735399/job/135583044214)
checked source commit `8162a5dfbe89e441600e7a3bbcc03b573df0880e` with Lean 4.35.0 and Mathlib
`56a005855ea17e0b0958f73ec801ae140b0a1679`.

All 81 project sources were freshly compiled with warnings as errors and
no linter override. The all-owned audit checked 1,696 raw declarations,
including 1,445 theorems and 538 private declarations. All 25 required
endpoints were checked to have theorem kind. Only `propext`,
`Classical.choice` and `Quot.sound` were allowed as transitive axioms.

All 81 exact singleton targets then passed the unchanged stock kernel
checker in fresh one-worker processes. Source compilation took 589.557
seconds in total; the audit took 11.774 seconds; kernel replay took 570.603
seconds. The receipt binds the exact source and object bytes, compiler and
checker binaries, helpers, commands, logs and raw declaration inventory.

- [Unchanged raw receipt](verification/loneliness-large-norm-exact-44530735399/receipt.json),
  SHA-256 `fba4b952a87271f9691e983dd69dafc0be5c07617e412884eb82f2894ec2fef5`.
- [Preservation record](verification/loneliness-large-norm-exact-44530735399/preservation.json),
  which authenticates the actual original archive and preserves its scope flags.
- Original artifact `14535137698`, ZIP SHA-256
  `b6678fb2e27c872d01a2bbd6bea9982abc42411e79999b6c4113961195ab3366`.
- [Historical receipt](verification/loneliness-large-norm-original-44468683880/receipt.json),
  retained unchanged with its earlier theorem-only audit and warning policy.

The current proof gate freshly checked the six proof-script warning repairs
in its frozen source model. It reused no proof acceptance from the historical
run. The preservation exporter ran no new Lean check.

Registration adds 64 previously unregistered proof modules and all 25 required
endpoints, with every source blob in the passed closure guarded. The
accepted list then has 1,033 proof modules plus two roots. Verification of
the merged accepted package remains a separate gate.
