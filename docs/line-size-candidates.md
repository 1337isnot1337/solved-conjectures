# Erdős 607 candidate verification

The separate `Lean line-size candidate proofs` workflow checks nine source
closures. Geometry, profile, and the smooth Euler kernel are registered in
the accepted package; these tasks also provide strict regression checks.
The other closures remain candidates until their gates pass and their
statements are reviewed.

| Candidate | Required scope |
| --- | --- |
| `geometry` | Finite real-plane carrier construction, exact line-size realization, and equality of the actual record count with the canonical tuple count, including collinear and small-cardinality cases. |
| `profile` | The exact integral constant, unique saddle point, curvature, global phase bound, and mean/variance identities for the literal functions in the proof. |
| `euler-kernel` | A smooth regular part of the finite Euler-product logarithm, including its actual value at zero and its formula away from zero. |
| `euler-correction` | A uniform endpoint correction, a bounded Stirling remainder, and the exact finite Euler-product correction with its square-root factor. |
| `analytic-estimates` | Uniform Riemann errors for the geometric mean and variance, a truncated-integral bound for the Euler sum, and a global Gaussian bound for the literal core weights. |
| `geometric-fourier` | A trigonometric energy lower bound, finite-product damping, the exact complex characteristic factor, and its quantitative second-order logarithmic expansion. |
| `tuples` | Canonical core/tail reconstruction, exact cost weights, cumulative finite counting, and the formal identity relating exact and cumulative cost series. |
| `generating-function` | The full coefficient formula, the separate exceptional cores, and the locally finite formal generating function for every tuple cost. |
| `generating-evaluation` | Absolute convergence of the actual geometric-record generating function for norm less than one, its explicit infinite core formula, and uniform convergence on every smaller closed norm disk. |

Each job checks every project source in dependency order with warnings treated
as errors, audits all theorem
declarations and custom axioms owned by that closure, and runs the unchanged
pinned independent kernel checker through `scripts/replay_lean.py --root`.
Only `propext`, `Classical.choice`, and `Quot.sound` are allowed. The receipt
records the commit, every project source hash, pinned configuration hashes,
and the gates that actually completed. A failed or interrupted job does not
provide a passing receipt.

At commit `42fff1a2f87955f29c25beb0d16f23d46e91b489`, the geometry,
Euler-kernel, and tuple jobs passed all three gates. The tuple job audited
307 theorem declarations and independently replayed its nine-module closure.
The profile job exposed unused tactics under its stricter source settings;
the previous source, axiom, and kernel receipt remains tied to its recorded
hashes. The repairs require a new unchanged-source receipt. The generating
function stopped at a gap-series type-inference error. The Euler-correction
job found namespace and normalization errors in its Stirling and trapezoid
prerequisites. These candidate repairs are not passing proof receipts.

At commit `65435fc2a7c4ba78244522ad3cfa692ca896efc4`, the repaired profile
passed all strict sources, the complete 120-declaration axiom audit, and
independent replay of all five project modules. Its
[exact strict receipt](line-size-profile-strict-receipt.json) records the
unchanged source and gate hashes. The earlier
[tuple receipt](line-size-tuples-hosted-receipt.json) records its exact
nine-module closure. The new analytic-estimate and geometric-Fourier tasks
remain unregistered candidates; source presence alone gives them no checked
status.

After a source error the workflow checks unrelated files to expose their
diagnostics. It skips every dependent source and fails the task before the
axiom and kernel gates. This does not permit partial source success to count
as a passing candidate.

The workflow selects closures affected by a source change. Changes to its
verification scripts or pinned configuration select every candidate. It does
not modify the separate loneliness and Graffiti candidate workflow.

Even successful jobs for all nine candidates would not prove the final sharp
asymptotic. The exact generating function, corrected Euler-product estimate,
local Fourier limit, uniform tail bounds, and final coefficient prefactor are
additional obligations recorded in the result's `LEAN_PLAN.md`.
