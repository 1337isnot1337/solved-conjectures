# Runner geometry candidates

These sources are unregistered candidates. They are not part of the accepted
root imports and do not establish a completed classification or the complete
hyperplane theorem. Their first hosted checks are pending at publication.

The separate `Lean loneliness geometry candidates` workflow checks four
independent scopes. It rebuilds every project dependency, checks each required
endpoint, audits all owned theorem declarations including private declarations,
and independently replays the exact dependency closure with stock `leanchecker`.
Only `propext`, `Classical.choice`, and `Quot.sound` are permitted. Receipts
record source, configuration, verification-code, and compiled-artifact hashes.
Failed receipts are retained with their error and completed checks.

| Scope | Candidate statement | Remaining mathematical inputs or work |
| --- | --- | --- |
| `basis` | A primitive integer vector extends to an integer basis. Minimizing a natural prefix-Gram potential supplies a basis fixing that vector and satisfying the adjacent squared-length ratio. The Gram product is the literal determinant. | The first-vector-preserving ratio basis is not asserted to satisfy the full Korkine–Zolotarev conditions. All new geometry proofs except the vector/scalar-extension interface await their first source checks. |
| `nearest-plane-value` | Rounding modulo a prefix gives a bound on the value of the containing rational subspace. Coordinate coalescence gives the squared prefix inequalities. | Lower-dimensional runner bounds remain explicit. Spectrum arguments need the additional plane-gap hypotheses specified in the written proofs. |
| `small-sharp` | The exact six-spectrum arithmetic table implies the stronger conditional global norm cutoff 21,829, which also suffices for the displayed four- and five-parameter searches. | Basis, prefix, and determinant premises remain explicit. The generic rational-subspace covolume statement is separate. |
| `hyperplane` | Fourier character orthogonality, finite-frequency density control, an exceptional numerator count, and an explicit denominator lower count. | The denominator starts from an integer positive distinct velocity. The real-admissibility bridge, uniform probability assembly, recursive subspace theorem, exact quasipolynomials, and endpoint density remain open. |

The deterministic hyperplane maximum and the existing finite arithmetic tables
have separate earlier receipts. This document does not extend those receipts to
the new candidates. The Haar-distribution candidate remains in its existing
`hyperplane-haar` lane. Initial residue enumeration and ten-speed lifting trees
remain under the separate finite-certificate work.

To inspect a closure without running Lean:

```sh
python3 scripts/verify_loneliness_geometry.py basis --plan
```

To run its source, axiom, and kernel gates:

```sh
python3 scripts/verify_loneliness_geometry.py basis
```
