# Runner and hyperplane extension candidates

These sources are unregistered candidates. Their first complete gates are
pending. The separate extension workflow uses the existing source rebuild,
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
| `hyperplane-endpoint-components` | Full-support maximizer rigidity, the primitive residue-line criterion, exact unit-line cardinality, smooth reciprocal series, uniform residue-class density, and one-relation/divisibility counting bounds. | These are component statements. The full endpoint-density formula, recursive subspace theorem, and exact quasipolynomial theorem remain unassembled. |
| `six-P` when its source is present | A complete modulo-`P` support certificate and short-direction checks classify every primitive tight six-speed tuple avoiding `P`. | Each per-prime theorem retains the five-speed runner bound. All eight prime certificates and the geometric avoidance argument must still be assembled and their lower-runner inputs discharged. |

The finite producers are untrusted data generators. Native diagnostic runs
are not premises of any Lean theorem. Complete numerical six-speed wrapper
files enable their named tasks automatically; a missing imported data block
fails dependency planning. No absent prime task is counted as a pass.

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
