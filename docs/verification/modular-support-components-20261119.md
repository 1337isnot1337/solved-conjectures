# Verified modular support and binary-lift components

These four component gates passed fresh strict source compilation, the complete
owned-declaration audit including serialized private names, and replay with the
unchanged pinned Lean kernel checker. Each required endpoint is a theorem.
The only permitted axioms are `propext`, `Classical.choice`, and `Quot.sound`.

The registration adds the exact 55 generated multiplicity source files from the
authenticated passing artifact. Their source hashes agree with the frozen
source model and with the fresh source-check receipt. Existing accepted imports,
required theorem names, and replay targets are preserved.

| Component | Fresh project modules | Required endpoints | Passing run |
| --- | ---: | ---: | --- |
| Support multiplicities and finite-tree consumer | 98 | 63 | [44567771879](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44567771879) |
| Unit-orbit transport | 26 | 8 | [44567771805](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44567771805) |
| Literal seven-speed binary roots | 34 | 58 | [44565549252](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44565549252) |
| Byte population counts and bounded-check equality | 8 | 15 | [44573794011](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44573794011) |

The module closures overlap. These counts must not be added to obtain a count
of distinct verified modules or theorems.

## Multiplicities and the finite-tree interface

`LonelinessModularSupportMultiplicity` enumerates the possible multiplicities
over a finite support for every deficit between tuple length and support size.
The representative theorems retain the complete list permutation, including
repeated entries. They prove representative length, sortedness, support,
uniqueness, membership, and completeness.

Two complete initial-support examples are included. For nine entries,
denominator ten and prime seventeen, the surviving support is
`[1,2,3,4,5,6,7,8]`; its deficit one gives eight representatives.
For five entries, denominator six and prime seven, the surviving support is
`[1,2,3]`; its deficit two gives six representatives.

`LonelinessModularSupportFiniteSound` connects these representative covers to
an actual tuple represented by a checked closed binary tree. Its terminal and
one-odd soundness premises remain explicit. The component does not provide a
new complete binary-lift computation or an unconditional integer
classification.

The initial failed multiplicity run remains failed. Its generated exact-list
proof could not reduce an imported sorting implementation. The passing retry
rewrites to the existing insertion-sort equality before ordinary kernel
decision. It retains the same numerical representatives and generic proof
statements.

Evidence:
[original receipt](modular-support-multiplicities-44567771879/receipt.json),
[preservation record](modular-support-multiplicities-44567771879/preservation.json),
[source and audit evidence](modular-support-multiplicities-44567771879/evidence.tar.gz).

## Unit-orbit transport

`LonelinessModularSupportOrbits` proves transport through a checked invertible
modular multiplier and a complete representative list. The composite witness
keeps both the unit equation and the full tuple permutation. It supports
arbitrary tuple length and arbitrary support deficit.

This is a conditional transport result. It does not supply a concrete exhaustive
orbit table or remove the initial-support and terminal-soundness obligations.

Evidence:
[original receipt](modular-support-orbits-44567771805/receipt.json),
[preservation record](modular-support-orbits-44567771805/preservation.json),
[source and audit evidence](modular-support-orbits-44567771805/evidence.tar.gz).

## Literal seven-speed binary roots

`LonelinessTightSevenBinaryRoots` checks the three displayed tight shapes at
each of the seventeen original primes. These are 51 literal roots, with all
128 ordered Boolean lifts at each root: 6,528 checked branches. The branches
comprise 6,426 strict witnesses, 51 all-even reductions, and 51 short-direction
reductions.

The direction-recovery theorem retains `LonelyRunnerBound 6` as an explicit
hypothesis. This check does not show that all initial supports reduce to those
51 roots. It therefore does not complete the seven-speed equality
classification.

Evidence:
[original receipt](tight-seven-binary-roots-44565549252/receipt.json),
[preservation record](tight-seven-binary-roots-44565549252/preservation.json),
[source and audit evidence](tight-seven-binary-roots-44565549252/evidence.tar.gz).

## Byte population counts

`LonelinessModularCoverByteCounts` proves, for every natural number, that its
byte-table evaluator equals the existing binary population count and
`Nat.bitIndices.length`. The public result has no input-size or fuel
hypothesis. The finite byte table is checked by the ordinary kernel.

`LonelinessModularCoverByteCuts` proves that the corresponding capacity, leaf,
fragment and bounded-check predicates equal the existing predicates. Its
soundness theorem follows from that equality.

The replacement source initially failed to infer the dependent motive of
`Nat.bitCasesOn`. The successful retry supplies that motive explicitly; the
controller, predicates and resource limits are unchanged. The earlier local
benchmark was interrupted after its shared data module passed, so it provides
no comparison of the two evaluators' running times.

Evidence:
[original receipt](modular-cover-byte-counts-44573794011/receipt.json),
[preservation record](modular-cover-byte-counts-44573794011/preservation.json),
[source and audit evidence](modular-cover-byte-counts-44573794011/evidence.tar.gz).

The passing source commit is
[`529aecd39bc98bd90dc3fa399dd4e3069540948e`](https://github.com/1337isnot1337/solved-conjectures/commit/529aecd39bc98bd90dc3fa399dd4e3069540948e).
The verified result is a universal equality of counters and checks. It does not
certify additional numerical support coverage.

## Merged-package status

The component receipts keep their original source commits, job identities,
source and object hashes, and raw receipt bytes. Artifact transport after a
temporary execution outage did not rerun Lean or change the original receipts.

These component passes do not constitute a passing run of the merged accepted
package. The separate complete package build, axiom audit and stock replay
remain tracked by the accepted Lean workflow.
