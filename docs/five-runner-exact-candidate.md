# Five positive speeds at the threshold 1/6

Status: verified and registered. The full fresh source, axiom, and stock-kernel
gate passed in [run 44549751944](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44549751944).
The [authenticated checkpoint](verification/loneliness-five-runner-exact-44549751944/README.md)
records its complete 250-source, 7,586-theorem, 7,070-frame scope.
`Conjectures.LonelinessFiveRunnerTheorem` is registered with the accepted root.
This work is coordinated in [issue 36](https://github.com/1337isnot1337/solved-conjectures/issues/36).

## Statements

The final module proves the unconditional theorem
`Loneliness.CoordinateSubspace.five_speed_lonelyRunnerBound` of type
`LonelyRunnerBound 5`. This means that every nonempty list of at most five
distinct positive integer speeds has loneliness value at least `1/6`.

It also proves the primitive classification at or below `1/6`: a positive
integer tuple of length five with gcd one must be a permutation of
`[1,2,3,4,5]` or `[1,3,4,5,9]`. Both directions have actual global value `1/6`.
The normalization theorem transfers this classification to arbitrary positive
five-element lists. Distinct folded residues are not an extra premise of the
finite search.

These statements concern the lower-bound threshold. The separate full
five-speed spectrum classification below `1/5` still has its own obligations.

## Proof components

`LonelinessFiveRunnerFinite` proves soundness of the complete support search.
Every support of size at most five is included. The retained rows use the
proved four-speed runner bound and actual short-vector certificates to recover
one of the two primitive integer directions.

`LonelinessFiveRunnerNormData` gives 16 exact dual rows for the four-variable
KZ product certificate. The resulting product lower bound is `7/2430000`.
`LonelinessFiveRunnerNorm` applies the existing geometric construction to the
actual speed vector and proves the integer squared-norm bound `347142`.
Its lower-dimensional runner inputs are discharged from the existing
one-through-four-speed theorems.

The selected primes are `149, 151, 163, 167, 173`. Their product is
`105953033267`. The exact margin is

```
347142^5 < 5^5 * (60 * 105953033267)^2.
```

Together with the forced divisor `60`, this yields a selected prime dividing
none of the five speeds. The five concrete modular certificates then supply
the primitive classification.

| Prime | Minimum-pair roots | Support frames | Retained rows |
| --- | ---: | ---: | ---: |
| 149 | 73 | 1171 | 10 |
| 151 | 74 | 1478 | 10 |
| 163 | 80 | 1596 | 10 |
| 167 | 82 | 1430 | 10 |
| 173 | 85 | 1395 | 10 |
| Total | 394 | 7070 | 50 |

The search and source generators are untrusted. Their complete output is
reproduced from the primes and compared with the literal Lean sources before
verification. Generated counts do not establish the mathematical result.

## Checker implementation

`LonelinessModularCoverFuelCounts` proves that a structurally recursive binary
counter equals `Nat.bitIndices.length` for every natural number.
`LonelinessModularCoverFuelCuts` proves equality with the original bounded
support checker for all inputs. Each generated numerical theorem still states
that the original `Cuts.boundedCheck` returns `true`; its proof uses that
unconditional equality followed by `decide +kernel`.

A local diagnostic checked eight original propositions from the six-speed
prime-379 certificate, including its largest capacity calculation and
witness, split, and retained cases. The Fuel version passed strict source
checking and exact singleton stock replay. Its source run took 100.404 seconds
(69.9 seconds importing and 27.2 seconds type checking); stock replay took
73.322 seconds. The matched Fast version was interrupted after 300 seconds
without completion. No completed speed ratio or whole-prime result follows
from this diagnostic.

## Acceptance requirements

The fresh exact gate compiled the entire final theorem import closure
with warnings treated as errors, audited every owned declaration including raw
private declarations, required the actual theorem endpoints, and replayed every exact module with the pinned stock checker. The kernel gate
uses one `Conjectures` prefix invocation against an isolated object directory
whose module inventory is exactly the final theorem closure. It requires each
expected module exactly once in the replay log, with no missing or extra target. The only permitted
transitive axioms are `propext`, `Classical.choice`, and `Quot.sound`.

All five complete prime certificates, the geometric bound, prime avoidance,
normalization, and the final runner-bound theorem passed. Registration
preserves the existing independent Renault proof. The combined accepted-package
gate remains separate from this original complete component verification.
