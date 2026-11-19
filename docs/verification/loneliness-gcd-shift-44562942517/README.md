# Conditional gcd shift test: verified component

This checkpoint verifies the arbitrary-modulus shift test in
`Conjectures.LonelinessGcdShift`, together with its counting dependency.
The bound `Loneliness.CoordinateSubspace.LonelyRunnerBound 8` remains a
hypothesis. This checkpoint does not establish an unconditional nine-speed
bound or a complete nine-speed classification.

## Exact statement

Let `v : Fin 9 → ℕ` have positive, pairwise distinct coordinates. Assume the
lower bound `1/9` for every nonempty list of at most eight distinct positive
integer speeds. Choose an integer `d ≥ 2`, and let
`E = {i | d ∤ v i}`. For `gᵢ = gcd(v i, d)`, the checked theorem is:

```text
E is nonempty and ∑ i ∈ E, gᵢ * ceil(2*d / (10*gᵢ)) < d
    ⇒ (1 / 10 : ℝ) < Loneliness.value (List.ofFn v).
```

The endpoint is `Loneliness.GcdShift.nine_speed_shift_test_of_exception`.
The gate also checks the literal positive floor-cost version, the positive
ceiling-cost version, residue transport modulo a multiple of `d`, and the
general gcd-weighted count of grid points in an open distance interval.
The exact quantified Lean statements are part of the generated audit source,
whose hash is recorded in [receipt.json](receipt.json).

The floor weight uses natural-number division:
`gᵢ * ((2 * (d / gᵢ) + 9) / 10)`. The exceptional set or positive-cost condition
is essential and remains present in each corresponding statement. All 20
named component obligations are required to be theorems; the complete list
appears in [receipt.json](receipt.json).

## Verification evidence

[GitHub Actions run 44562942517](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44562942517)
completed successfully at commit
`4f97f1e9936e089a7f33b8d6093ea820661c1f31`.
The gate compiled all 17 project modules in the exact dependency closure
with Lean 4.35.0, one worker, and warnings treated as errors. It reused no
project proof objects. The main source check took 3.008 seconds.

The audit checked 399 owned declarations, including 319 theorems and
10 private declarations. All 20 required theorem endpoints and five explicit
quantified assertions passed. The only permitted transitive axioms were
`propext`, `Classical.choice`, and `Quot.sound`. The unchanged stock
`leanchecker` replayed exactly the 17 staged project modules, with no missing,
extra, or duplicate module, in 22.424 seconds. The raw audit, parsed inventory,
and stock replay transcript are preserved in this directory.

Artifact [14551820201](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44562942517/artifacts/14551820201)
contains the original source files, materialized proof objects, process
records, logs, and receipt. The original ZIP SHA-256 is
`c4c42a658db5c3a7ceaef56d229f20793c9817b9ef1abed132d427fcbbc000b0`.
The original receipt SHA-256 is
`fa7467c262fee9594a147672965ed6bb183aa9b9250b4f584c6a9fae12e09453`.

Artifact authentication checked the ZIP against GitHub's metadata and the
upload log. It compared every source and all 22 control files with the
published Git blobs, all object facets with their recorded hashes, and every
successful source, audit, and replay record with its exact command and raw
log. It independently revalidated the raw/private axiom inventory and the
exact replayed-module set. [artifact-authentication.json](artifact-authentication.json)
and [published-inputs.json](published-inputs.json) preserve those checks.

## Reproduction and scope

At the recorded commit, use the pinned toolchain and dependency revisions:

```sh
python3 scripts/verify_gcd_shift.py --plan
cd lean
lake env python3 ../scripts/verify_gcd_shift.py
```

The gate requires an empty stage and recompiles every project dependency.
Mathlib and the toolchain packages are pinned dependencies; this checkpoint
does not claim to rebuild those packages from source.

The later signed-unit and folded-representation transports, the finite
`shiftReject` predicate, auxiliary-primitivity arguments, and any complete
finite lift census are outside this receipt. They require their own source,
statement, audit, and kernel checks. This component preserves the eight-speed
bound as a mathematical hypothesis.
