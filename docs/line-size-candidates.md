# Erdős 607 candidate verification

The separate `Lean line-size candidate proofs` workflow checks six source
closures. These files remain outside the accepted package until their gates
pass and their statements are reviewed.

| Candidate | Required scope |
| --- | --- |
| `geometry` | Finite real-plane carrier construction, exact line-size realization, and equality of the actual record count with the canonical tuple count, including collinear and small-cardinality cases. |
| `profile` | The exact integral constant, unique saddle point, curvature, global phase bound, and mean/variance identities for the literal functions in the proof. |
| `euler-kernel` | A smooth regular part of the finite Euler-product logarithm, including its actual value at zero and its formula away from zero. |
| `euler-correction` | A uniform endpoint correction, a bounded Stirling remainder, and the exact finite Euler-product correction with its square-root factor. |
| `tuples` | Canonical core/tail reconstruction, exact cost weights, cumulative finite counting, and the formal identity relating exact and cumulative cost series. |
| `generating-function` | The full coefficient formula, the separate exceptional cores, and the locally finite formal generating function for every tuple cost. |

Each job checks every project source in dependency order with warnings treated
as errors, audits all theorem
declarations and custom axioms owned by that closure, and runs the unchanged
pinned independent kernel checker through `scripts/replay_lean.py --root`.
Only `propext`, `Classical.choice`, and `Quot.sound` are allowed. The receipt
records the commit, every project source hash, pinned configuration hashes,
and the gates that actually completed. A failed or interrupted job does not
provide a passing receipt.

After a source error the workflow checks unrelated files to expose their
diagnostics. It skips every dependent source and fails the task before the
axiom and kernel gates. This does not permit partial source success to count
as a passing candidate.

The workflow selects closures affected by a source change. Changes to its
verification scripts or pinned configuration select every candidate. It does
not modify the separate loneliness and Graffiti candidate workflow.

Even successful jobs for all six candidates would not prove the final sharp
asymptotic. The exact generating function, corrected Euler-product estimate,
local Fourier limit, uniform tail bounds, and final coefficient prefactor are
additional obligations recorded in the result's `LEAN_PLAN.md`.
