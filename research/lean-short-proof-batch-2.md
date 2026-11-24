# Short Lean proofs: second batch

Tracking: [issue #503](https://github.com/1337isnot1337/solved-conjectures/issues/503). The first exact publication candidate is [PR #529](https://github.com/1337isnot1337/solved-conjectures/pull/529).

| Result | Exact Lean coverage | Left to formalize |
| --- | --- | --- |
| [Benfield–Lippard](../lean/Conjectures/BenfieldLippardParity.lean) | `BenfieldLippardParity.benfieldLippard_conj10_4`: odd largest stable gap and odd gap count for every exponent at least two, using the original positive-power definition. | Stronger modular statements in the written note. |
| [Burstein](../lean/Conjectures/BursteinDescentTop.lean) | `Conjectures.BursteinDescentTop.not_descent_top_shape_wilf` and `not_ascent_bottom_shape_wilf`: exact 15-versus-16 witness on a valid self-conjugate Ferrers board, with the source's occurrence and refinement conditions. | The stronger counterexample family for every suffix. |
| [Gravgaard–Lee](../lean/Conjectures/GravgaardLeeLuroth.lean) | `GravgaardLeeLuroth.gravgaardLee_original`: every allowed large-digit threshold yields a positive-length ordinary sum interval of actual Lüroth series. | Distinct mixed/bounded-digit conjectures. |
| [Gawron–Miśka–Ulas sign density](../lean/Conjectures/GawronMiskaUlasDensity.lean) | `Conjectures.GawronMiskaUlasDensity.not_natural_density_zero_in_source`: refutes the original zero-density assertion using exact power-series coefficients, integer sign, and real natural density. | Separate valuation conjecture and its stronger all-exponent extension. |
| [Coulangeon–Lazzarini](../lean/Conjectures/CoulangeonLazzarini.lean) | `CoulangeonLazzarini.euclidean_coulangeon_conj21_false`: actual discrete full-rank Euclidean lattice with its first two nonempty shells checking the 2-design moments and the third failing. | Arbitrary-delay and indecomposability supplements. |
| [Wagner](../lean/Conjectures/WagnerLaguerreOperator.lean) | `WagnerLaguerreOperator.wagner_conjecture_4_3_false`: the real entire function exp + 1 is in the positive shifted class and fails even at the first operator of the source family. | No stronger classification asserted. |
| [Ferroni–Morales–Panova](../lean/Conjectures/FMPCylindric.lean) | `no_nonnegative_source_count_polynomial` and `no_nonnegative_full_column_count_polynomial`: one fixed admissible unpinned cylindric shape disproves coefficient nonnegativity under both adjacent and across-hole column readings. | The separate positive theorem for standard periodic partition boundaries remains written only. |

These seven modules passed strict Lean 4.35.0 compilation at the pinned Mathlib revision, an audit of all owned declarations including private ones, stock kernel replay of the exact local module closure, and independent source comparison. The proof modules are on the work branch and are not yet registered on `main`.

When publishing, preserve the existing significance order and the exact source scope in the README, `CONTENTS.md`, and `docs/lean-status.md`. Add the modules and endpoints to both Lean registries, recheck the exact candidate site and rerun the relevant kernel closure. Do not count a supplement as checked solely because its original conjecture has a complete proof.
