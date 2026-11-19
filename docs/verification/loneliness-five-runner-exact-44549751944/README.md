# Complete five-speed bound and tight equality classification

This checkpoint verifies an unconditional lower bound at `1/6` for at most
five distinct positive integer speeds and the complete primitive and
gcd-normalized five-speed classification at that threshold. It is an
independent finite proof of the bound already registered through the Renault
formalization. The full five-speed spectrum below `1/5` remains separate.

## Exact statements

`Loneliness.Modular.FiveRunner.five_runner_bound` and
`Loneliness.CoordinateSubspace.five_speed_lonelyRunnerBound` prove
`CoordinateSubspace.LonelyRunnerBound 5`: every nonempty list of at most five
distinct positive natural-number speeds has actual loneliness at least `1/6`.
No smaller-runner, geometric, prime-classification, or finite-certificate
hypothesis remains.

For every positive `v : Fin 5 → ℕ` with gcd one and actual loneliness at most
`1/6`, `Loneliness.Modular.FiveRunner.primitive_classification` proves that
`List.ofFn v` is a permutation of exactly one of these retained directions:

- `[1, 2, 3, 4, 5]`;
- `[1, 3, 4, 5, 9]`.

Both retained directions have actual value `1/6`, and `primitive_value_eq`
proves equality for every tuple satisfying those hypotheses. The primitive
classification does not require distinct coordinates as an additional premise.

`complete_normalized_classification` applies to every positive list of length
five with actual loneliness at most `1/6`. Its gcd-normalized list is a
permutation of one of the same two literal directions. This supplies the
complete tight-five classification; it does not classify other values in the
interval `(1/6, 1/5)` or complete the five-speed spectrum theorem.

The generated [audit source](src/FiveRunnerExactAudit.lean) contains four
explicit quantified assertions with these literal lists. The complete named
obligation inventory is preserved in [receipt.json](receipt.json).

## Finite proof and certificate coverage

The geometric argument proves squared norm at most `347142` for a positive
primitive five-speed vector with value at most `1/6`. The forced divisor `60`
and the exact prime-product margin yield a prime dividing none of its five
coordinates. The selected primes are `149, 151, 163, 167, 173`.

| Prime | Minimum-pair roots | Support frames | Retained rows |
| --- | ---: | ---: | ---: |
| 149 | 73 | 1171 | 10 |
| 151 | 74 | 1478 | 10 |
| 163 | 80 | 1596 | 10 |
| 167 | 82 | 1430 | 10 |
| 173 | 85 | 1395 | 10 |
| Total | 394 | 7070 | 50 |

Every support of size at most five is covered. The 118 generated prime
modules reproduce byte-for-byte from the published producers. Their frame
proofs state the original bounded-check propositions. The Fuel checker has
proved unconditional equality with the original checker, and ordinary
`decide +kernel` checks the numerical propositions. The source generator and
search code do not become trusted mathematical assumptions.

## Verification evidence

[GitHub Actions run 44549751944](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44549751944),
job `135649983909`, completed successfully at
`1ffeb0932ac9a5674f2d416757d786a85e43ffde`.
It compiled all 250 project sources afresh with Lean 4.35.0, one worker,
`-M4500`, and warnings treated as errors. Fresh source checks took a total
of 2324.416 seconds; the final theorem source took 2.757 seconds.

The audit checked 28,383 owned/raw declarations, including 23,357 theorems and
118 private declarations. All 7,586 required theorem endpoints and all four
literal statements passed. The only permitted transitive axioms were
`propext`, `Classical.choice`, and `Quot.sound`. The unchanged stock
`leanchecker` then replayed exactly the 250 staged project modules, with no
missing, repeated, or extra module, in 1804.712 seconds.

Artifact [14551506873](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44549751944/artifacts/14551506873)
has ZIP SHA-256
`018afd2acad8e32dff6ea07429e068afc8894e43f8375becb4df13e38d76e6c1`.
The unchanged original receipt has SHA-256
`4bcd923b04ce812cab68abd91ed8c6ee102f594a1f59bd310752dbfd79aeb542`.

Authentication checked all 1,009 archive members. It matched all 250 proof
sources and 21 recorded controls to their original Git blobs, pinned all 17
imported repository Python modules, reproduced every finite certificate,
and compared every source/audit/replay process record and materialized object
facet with its recorded hash. It revalidated the complete raw/private axiom
inventory and exact replayed-module set. The generation inventory matches
byte-for-byte; the generation log matches after excluding only elapsed-time
measurements. See [artifact-authentication.json](artifact-authentication.json)
and [published-inputs.json](published-inputs.json).

## Preserved bytes and reproduction

All 509 original receipt, generated-audit, generation, log, and process-record
files are preserved. Only the two largest files are compressed:
[declaration-inventory.json.gz](declaration-inventory.json.gz) and
[logs/all-owned.audit.log.gz](logs/all-owned.audit.log.gz). Decompression restores
the exact original bytes. [preservation.json](preservation.json) records every
original and stored path, encoding, byte length, and SHA-256. Project proof
sources remain available at the recorded Git commit; object facet hashes
remain in the original receipt and the downloadable artifact.

At the recorded commit, use the pinned toolchain and dependency revisions:

```sh
python3 scripts/verify_five_runner_exact.py --plan
cd lean
lake env python3 ../scripts/verify_five_runner_exact.py
```

This invokes the fresh gate. Its imported Mathlib and toolchain packages are
pinned dependencies; the receipt does not claim that those packages were
rebuilt from source. Registration and the subsequent merged-package gate
remain distinct from this original complete component verification.
