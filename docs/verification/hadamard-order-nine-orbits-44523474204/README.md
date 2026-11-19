# Order-nine automorphism subgroups and orbits

This checkpoint registers the existing `HadamardLegendreOrderNineGroup` and
`HadamardLegendreOrderNineOrbits` modules. Their source bytes are unchanged
from commit `91b7afd6c31b5654e0d7aa0517a270c0b802eedc`.

For any abelian group of order nine, an odd-order subgroup of its actual
additive automorphism group has order dividing three. If the subgroup is
nontrivial, it has order three and fixes exactly three elements. Its remaining
orbits are the two nonzero cosets of the fixed subgroup. The action therefore
has exactly five orbits.

These statements verify the order-nine action assertions in the
[Legendre-pair argument](../../../results/hadamard-2396/PROOF.md). They do not
exclude order 27 for the original length-1197 multiplier group. The finite
quotient and no-lift argument remains separate.

## Verification evidence

The original [run 44523474204, job 135557905916](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44523474204/job/135557905916)
passed fresh strict compilation, its theorem-axiom audit, and stock kernel
replay of the exact four-module closure:

| Module | Registration in this checkpoint |
| --- | --- |
| `Conjectures.HadamardBorderSymmetryPrime` | Already accepted dependency |
| `Conjectures.HadamardLegendreOrderNine` | Already accepted dependency |
| `Conjectures.HadamardLegendreOrderNineGroup` | Newly registered |
| `Conjectures.HadamardLegendreOrderNineOrbits` | Newly registered |

Artifact `14529746143` was authenticated against ZIP SHA256
`4ed12c2a33f8351eef05c3367beed818f92145fbc8541fa3c6ef7ece27704af0`.
The unchanged [hosted receipt](hosted-receipt.json) has SHA256
`361761f88eefa9d8b5131eb2377bf9cb647445aa5408e7a3846bc7eaaacd76d5`.
The [original job log](hosted-job.log) records each of the four stock replay
targets exactly once. Every source and pinned package configuration matches
the current publication tree. Every original gate hash was also checked
against the original Git commit.

A fresh local check compiled all four sources with warnings treated as
errors. The subsequent [complete declaration audit](all-owned-audit.log)
checked all 68 owned and raw declarations: 64 theorems, nine private
declarations, and all 13 required endpoints. Its exact serialized inventory
is in [declaration-inventory.json](declaration-inventory.json). The only
permitted transitive axioms were `propext`, `Classical.choice`, and `Quot.sound`.

The local repeat of stock replay reached the driver's wall-time limit after
624.63 seconds, with exit code 124 and no diagnostics. This outcome is kept
unchanged in [local-receipt.json](local-receipt.json). The passing kernel
evidence for this checkpoint is the authenticated hosted run. The local
source and complete declaration-audit results are additional checks.

[preservation.json](preservation.json) binds the source, gate, runtime,
compiled-object, and evidence hashes and records both outcomes. Verification
of the complete merged accepted package remains a separate gate.

The four mathematical source files are unmodified. This checkpoint adds two
prebuild targets, one root import, and 13 required theorem names.
