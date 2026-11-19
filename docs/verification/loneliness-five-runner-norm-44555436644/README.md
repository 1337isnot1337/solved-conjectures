# Five-speed norm and prime avoidance: verified component

This checkpoint verifies the norm ceiling and prime-avoidance component in
`Conjectures.LonelinessFiveRunnerNorm`. It does not establish the complete
five-speed lower bound or either finite classification.

## Exact statements

For a vector `v : Fin 5 → ℕ`, assume every coordinate is positive,
`(List.ofFn v).foldr Nat.gcd 0 = 1`, and
`Loneliness.value (List.ofFn v) ≤ (1 / 6 : ℝ)`. The checked endpoints are:

- `Loneliness.FiveRunnerNorm.squared_norm_le`: `∑ i, (v i)^2 ≤ 347142`.
- `Loneliness.FiveRunnerNorm.exists_prime_avoiding`: there exists a prime in
  `{149, 151, 163, 167, 173}` that divides none of the five coordinates.

Neither theorem assumes distinct coordinates. The auxiliary theorem
`lower_runner_bound` supplies `CoordinateSubspace.LonelyRunnerBound m` for
all `m < 5`. The gate checks all 15 declared component obligations, including
the exact dual certificate, prime facts, forced divisor 60, and product margin.
Its audit also checks the actual quantified endpoints with the literal norm
ceiling and selected prime list. The complete obligation inventory appears in
[receipt.json](receipt.json).

## Verification evidence

[GitHub Actions run 44555436644](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44555436644)
completed successfully at commit
`3f009008f33dcf3cb3f5383e11b818f8c1695aaf` (attempt 1).
The fresh gate compiled all 108 project modules in the exact dependency closure
with Lean 4.35.0, one worker, and warnings treated as errors. It did not reuse
project proof objects. The unchanged stock `leanchecker` then replayed exactly
those 108 modules in an isolated `Conjectures` prefix; the transcript has no
omitted, duplicate, or extra project module. Replay took 348.189 seconds.

The audit checked 2,824 owned declarations, including 2,243 theorems and
34 private declarations. The only permitted transitive axioms were
`propext`, `Classical.choice`, and `Quot.sound`. The raw and parsed inventories
are preserved in [all-owned.audit.log](all-owned.audit.log) and
[declaration-inventory.json](declaration-inventory.json).

Artifact [14544704963](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44555436644/artifacts/14544704963)
contains the original source, materialized proof objects, stdout logs,
process records, and receipt. Its ZIP SHA-256 is
`81fa0ccc6d7c77fe5ab565d5e447386b5ecec3ec06db17646b11f3fec8e40bb2`.
The original receipt SHA-256 is
`b8ede55766a7a2be86b9597a61cc18ea501c031a4caeae2a7b892be0ed624500`.

The downloaded ZIP digest matches GitHub's artifact metadata and upload log.
Artifact authentication compared every source and controller hash with the
published Git blobs, every materialized object facet with the receipt,
every source/audit/replay log with its recorded hash and process record,
and the complete private axiom inventory and replayed-module set.
[artifact-authentication.json](artifact-authentication.json) records these checks.
[published-inputs.json](published-inputs.json) contains the exact source,
controller, compiler, checker, and dependency revision expectations.

## Reproduction and scope

At the recorded commit, use the pinned toolchain and dependency revisions:

```sh
python3 scripts/verify_five_runner_norm.py --plan
cd lean
lake env python3 ../scripts/verify_five_runner_norm.py
```

The gate requires an empty stage and compiles every project dependency afresh.
The imported Mathlib and toolchain packages are pinned dependencies; this
checkpoint does not claim to rebuild those packages from source.

Only `LonelinessFiveRunnerNormData` and `LonelinessFiveRunnerNorm` are new
accepted modules for this checkpoint. Their other 106 project dependencies
were already in the accepted root closure and prebuild registry, with source
bytes matching this verified run. The separate full five-speed finite gate
and its numerical classification remain outside this checkpoint's acceptance.
