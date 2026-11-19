# Runner and hyperplane extension candidates

These sources are unregistered candidates. Both support interpretations
and both reduced prime-selection closures have passed their complete gates.
The other extensions still require their own completed receipts.
The separate extension workflow uses the existing source rebuild,
all-owned-theorem axiom audit, and stock-kernel replay implementation. The
receipt hashes both the extension registry and the underlying verification
code. Allowed axioms remain `propext`, `Classical.choice`, and `Quot.sound`.

| Task | Exact scope | Inputs or work still required |
| --- | --- | --- |
| `seven-support` | Complete support coverage and binary trees imply one of the three published primitive seven-speed directions. Their exact values are already proved. | The six-speed runner bound and all numerical coverage/tree checks remain explicit inputs. The ordinary plane gap and parity argument are derived from that runner bound. |
| `seven-primes` | The improved geometric norm ceiling and forced divisor make the first twelve original primes sufficient. | Runner bounds in strictly fewer than seven speeds remain explicit. The original seventeen-prime definitions are unchanged. |
| `eight-support` | Complete support coverage and binary trees imply the consecutive primitive eight-speed direction. Its exact value is already proved. | The seven-speed runner bound and all numerical coverage/tree checks remain explicit inputs. No mixed-modulus checker is assumed. |
| `eight-primes` | The improved geometric norm ceiling and forced divisor make the first twenty original primes sufficient. | Runner bounds in strictly fewer than eight speeds remain explicit. The original twenty-six-prime definitions are unchanged. |
| `hyperplane-laws` | All-threshold CDF convergence for fixed torus shifts and for the actual normalized finite mixture of Haar pushforwards. | The source proofs await checking. The finite mixture is a probability measure when the sample is nonempty, as it eventually is under real admissibility. |
| `hyperplane-endpoint-components` | Full-support maximizer rigidity, the primitive residue-line criterion, exact unit-line cardinality, smooth reciprocal series, uniform residue-class density, and one-relation/divisibility counting bounds. | These are component statements. Endpoint density and recursive subspace classification now have separate source candidates; exact quasipolynomial counting remains unfinished. |
| `hyperplane-series` | The reciprocal series over integers supported on the prime factors of the endpoint modulus is summable and equals the finite Euler product. | This independent source branch has its own complete gate. |
| `hyperplane-residues` | Residue classes in the literal ordered positive distinct sampling box have uniform limiting frequency, with an explicit boundary count. | This is an independent component gate; exact quasipolynomial counting remains separate. |
| `hyperplane-hit-density` | A unique smooth-scale partition of the actual finite-order hitting event gives its Euler-product density by dominated convergence. The unshifted CDF is also identified. | These new sources are unverified. The final identification with maximum-equality velocities remains separate. |
| `large-norm` | The geometric prefix bounds and exact product tables imply norm ceilings and original-prime avoidance for nine through thirteen speeds. | All strictly lower-dimensional runner bounds remain explicit mathematical inputs. The twelve-dimensional certificate is split into eight files after a memory failure; its exact rows are preserved and the new source layout awaits checking. |
| `six-P` when its source is present | A complete modulo-`P` support certificate and short-direction checks classify every primitive tight six-speed tuple avoiding `P`. | Each per-prime theorem retains the five-speed runner bound. All eight prime certificates and the geometric avoidance argument must still be assembled and their lower-runner inputs discharged. |

The finite producers are untrusted data generators. Native diagnostic runs
are not premises of any Lean theorem. Complete numerical six-speed wrapper
files enable their named tasks automatically; a missing imported data block
fails dependency planning. No absent prime task is counted as a pass.

At `b6b58f4`, the eight-speed support interpretation passed its complete
36-module closure and 768-theorem axiom audit, followed by independent kernel
replay in [job 135354309892](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44463069467/job/135354309892).
Its lower-runner and numerical-certificate premises remain explicit. This
receipt does not assert the full eight-speed classification.

At `a4d614f`, the seven-speed support closure passed 38 modules and its
851-theorem ownership audit. Each of the seven- and eight-speed reduced
prime-selection closures passed 50 modules and 914 audited theorems. All
three also passed independent kernel replay in
[run 44464817260](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44464817260).
These receipts preserve the lower-runner and numerical-certificate premises
listed above.

The generic six-speed support closure passed all 42 modules and 902 audited
theorems at `876addb2`, with independent replay in
[job 135364063710](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44466067017/job/135364063710).
Its numerical p257 probe has not passed: a later source repair separately
checks the initial masks before using their literal values in the tree.

The endpoint-equality formula, sharpness example, recursive subspace
classification, and seven-coordinate quantitative consequences use the
separate [final extension guide](loneliness-final-extension-candidates.md).

The completed basis and prime-arithmetic components are separate from these
new extensions. At source commit `9a7cb8a`, the basis closure passed all 16
modules and its 285-theorem ownership audit, and prime arithmetic passed all
21 modules and its 463-theorem audit, with independent replay in
[run 44461710960](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44461710960).

Inspect one closure without starting Lean:

```sh
python3 scripts/verify_loneliness_extensions.py hyperplane-laws --plan
```

Run all three gates for that exact closure:

```sh
python3 scripts/verify_loneliness_extensions.py hyperplane-laws
```
