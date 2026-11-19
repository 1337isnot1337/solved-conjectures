# Li contribution under verification

The original 38-module Lean development was contributed by
[aadrianvv](https://github.com/aadrianvv) in
[PR #35](https://github.com/1337isnot1337/solved-conjectures/pull/35), at head
`fb700255fed86b6ac29b4980ff4704fa46adab63`.

This checkpoint stages that contribution and compatibility repairs for a
separate verification run, together with five supplementary modules. These
sources are candidates outside the accepted
root imports. The full source, axiom, and kernel checks are pending. The PR
merge and the result-status update will follow the checked integration.

The proposed scope is the explicit 31-vertex tree, its degree and leaf facts,
the full elementary coefficient `+29` for every finite colour set of size at
least 31, the exact connected-partition count `8`, and all `6,842` integer
partition types. The supplementary modules assemble these into an actual
connected vertex-partition statement and prove all five elementary
coefficients supported on `e₂,e₃`: `29`, `83`, `−6304`, `−6800`, and `−8384`.
Each coefficient is transported to every finite colour type of cardinality
at least 31. The negative coefficient also gives an explicit failure of
coefficientwise elementary positivity. These statements remain candidates
until the complete gate passes.

## Compatibility and reproduction repairs

The review updates deprecated conditional lemmas to their current names,
removes unused simplification arguments and an unused section instance, and
uses the current neighbour-set instance. The tree, theorem statements, and
literal partition witnesses retain the contributor's definitions.

The coefficient-table generator reproduces the repaired `LiCompute.lean`.
The independent partition-generator path now uses the actual 15-edge/15-edge
split. Its output reproduces the original 6,842 masks and canonical digest.
The generator's emitted positive-part tuples also round-trip through its
checker. These Python checks support transcription and reproduction; Lean
checks the mathematical certificates.

## Exact verification gate

`scripts/verify_li_exact.py` reads the sealed manifest in
`docs/li-exact-sources.json`. It checks all 43 sources from a fresh project
object directory with warnings treated as errors. It then checks literal
mathematical statements, audits every owned declaration including private
declarations, and replays every module with the unchanged stock kernel
checker. The only permitted transitive axioms are `propext`,
`Classical.choice`, and `Quot.sound`.

The manifest records the original contribution, exact source hashes, 68
required theorem names, pinned configuration, and verification-helper hashes.
The workflow is `.github/workflows/lean-li-exact.yml`. A successful source
preflight or publication of this checkpoint is not a completed proof check.

Coordination and subsequent receipts are tracked in
[issue #39](https://github.com/1337isnot1337/solved-conjectures/issues/39).
