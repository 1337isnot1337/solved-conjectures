# Erdős 607 candidate verification

The separate `Lean line-size candidate proofs` workflow checks three source
closures. These files remain outside the accepted package until their gates
pass and their statements are reviewed.

| Candidate | Required scope |
| --- | --- |
| `geometry` | Finite real-plane carrier construction, exact line-size realization, and equality of the actual record count with the canonical tuple count, including collinear and small-cardinality cases. |
| `profile` | The exact integral constant, unique saddle point, curvature, global phase bound, and mean/variance identities for the literal functions in the proof. |
| `euler-kernel` | A smooth regular part of the finite Euler-product logarithm, including its actual value at zero and its formula away from zero. |

Each job builds every project source in dependency order, audits all theorem
declarations and custom axioms owned by that closure, and runs the unchanged
pinned independent kernel checker through `scripts/replay_lean.py --root`.
Only `propext`, `Classical.choice`, and `Quot.sound` are allowed. The receipt
records the commit, every project source hash, pinned configuration hashes,
and the gates that actually completed. A failed or interrupted job does not
provide a passing receipt.

The workflow selects closures affected by a source change. Changes to its
verification scripts or pinned configuration select every candidate. It does
not modify the separate loneliness and Graffiti candidate workflow.

Even successful jobs for all three candidates would not prove the final sharp
asymptotic. The exact generating function, corrected Euler-product estimate,
local Fourier limit, uniform tail bounds, and final coefficient prefactor are
additional obligations recorded in the result's `LEAN_PLAN.md`.
