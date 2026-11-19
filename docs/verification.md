# Verification

[Home](../README.md) · [Catalogue](../CONTENTS.md) · [Lean status](lean-status.md)

## Requirements

- Python 3.12, matching CI. Python checks use the standard library.
- A C++20 compiler available as `c++` for distance-graph checks and the lonely-runner spectrum/equality verifiers. Some Python entry points compile and launch C++ programs themselves.
- For formal proofs: Lean and Mathlib pinned in [the shared Lean package](../lean/). Use its `lean-toolchain` and `lake-manifest.json`; do not substitute a different toolchain.

Run commands from the repository root with Python assertions enabled (do not use `python -O`). Keep the whole checkout: some verifiers reuse code in sibling result directories.

## Computational checks

These are the commands in [the verification workflow](../.github/workflows/verify.yml). They include finite tests, exact certificates, and exhaustive searches; their mathematical roles are explained in the corresponding proof notes. A passing computation is not a claim that a full theorem has been formalized.

The workflow also regenerates the two compact CUT certificate sources with
`results/cut-arithmetic-periodicity/generate_weight_certificates.py` into a
temporary directory and compares them byte for byte with the checked-in files.
Generation alone does not check a proof. The accepted Lean workflow checks the
finite tables, their collision and lower-option interpretation, and both actual
recursive-game identities through `CutPeriodWeightTheorem`.

```bash
python3 results/l-solitaire-limit-shapes/verify.py
python3 results/pham-denominator-degree/verify.py
python3 results/pham-denominator-degree/verify.py --dual --brute-depth 13
(cd results/pham-denominator-degree && python3 -m unittest discover -s tests -v)
python3 results/graffiti-pc-318/verify.py
python3 results/li-coefficient-sign/verify.py
python3 results/li-coefficient-sign/independent_check.py
python3 results/batista-egyptian-fractions/verify.py
python3 results/erdos-607-line-sizes/verify.py
python3 results/rectangle-partition-asymptotics/verify.py
python3 results/spivey-multiplayer-war/verify.py
python3 results/cut-family-b/verify.py
python3 results/cut-arithmetic-periodicity/verify.py
c++ -std=c++20 -O3 results/distance-graph-densities/verify.cpp -o /tmp/verify-distance-graphs
/tmp/verify-distance-graphs
python3 results/distance-graph-densities/counterexample.py
python3 results/two-difference-motzkin/verify.py
python3 results/symmetric-four-point-density/verify.py
python3 results/nonmixed-gap-packing/verify.py
python3 results/haralambis-three-differences/verify.py
python3 results/five-speed-spectrum/verify.py
python3 results/tight-six-speeds/verify.py
python3 results/six-speed-spectrum/verify.py
python3 results/tight-seven-speeds/verify.py
python3 results/tight-eight-speeds/verify.py
python3 results/eight-speed-spectrum/verify.py
python3 results/seven-speed-spectrum/verify.py
python3 results/tight-eleven-to-fourteen/verify.py
python3 results/tight-nine-speeds/verify.py
```

The latest workflow is the executable reference when new checks are added.

## Lean proofs

```bash
bash scripts/verify_lean.sh
```

The script builds each accepted module sequentially, builds the shared root imports, runs `ProofAudit.lean` with warnings treated as errors, and independently rechecks the listed compiled modules with `leanchecker`. The audit covers private declarations as well as public theorems, and rejects project axioms even when unused. Sequential builds keep large finite reductions from competing for memory. [The Lean workflow](../.github/workflows/lean.yml) runs the same audit in CI.

`scripts/replay_lean.py` checks that the replay list exactly matches the project
source-import closure. It stages those compiled objects, including their server
and private data, and replaces only the project entry in Lean's import path.
The unchanged pinned `leanchecker` then replays the two project namespaces.
This avoids repeated dependency-directory scans and excludes unfinished cached
modules. It does not change the kernel or omit any accepted proof module.

After building and auditing a separate candidate, replay its exact local import
closure from `lean/` with:

```bash
lake env python3 ../scripts/replay_lean.py --root Conjectures.DenominatorTheorem
```

The helper derives the closure from the selected source, requires every project
source and compiled object, stages only that closure, and propagates checker
failure. Cross-namespace candidates use the complete accepted-module mode.
`python3 scripts/test_replay_lean.py` checks the closure, staging, missing-object,
and failure-propagation rules with isolated fixtures. The kernel executable is
unchanged in both modes.

The [status report](lean-status.md) records the exact statements checked and dependencies that remain. Partial certificates do not establish the full conjecture. Accepted proofs permit only `propext`, `Classical.choice`, and `Quot.sound` as transitive axioms, as required by [the repository instructions](../AGENTS.md).

## What the checks establish

`results/graffiti-pc-318/verify.py` uses only the Python standard library. It checks all 419,235 labeled graphs on 2–7 vertices with at most `n+1` missing edges; 7,337 satisfy the original hypothesis and each passes the total-domination test. A sharp five-vertex counterexample to a one-unit relaxation is separately verified. See [the all-order proof](../results/graffiti-pc-318/PROOF.md), **credited to [@JesterInABarrel](https://x.com/JesterInABarrel/status/2123233964827812334)**. This is not a Lean proof.

`results/l-solitaire-limit-shapes/verify.py` is the original embedded PDF attachment, extracted byte-for-byte. The finite search checks all pick-layer sets and integer partitions for deck sizes 1 through 14 and separately verifies the specific counterexample for sizes 1 through 1000. Exhaustive tests do not replace the general argument in the PDF.

`results/pham-denominator-degree/verify.py` checks a finite certificate of 26 coefficients and applies Pham's *proved* degree bounds to deduce the entire rational-function identity. Optional `--dual` checks a second exact identity.

The Li verifier also checks all 6,842 partition types of 31 and the coefficient `+29` using exact edge-cut and coloring calculations. Its independent parity-based check is included. The original PDF has the verifier embedded as an attachment.

## Reporting a check

Record the commit, command, toolchain, and result. Distinguish computational tests, source builds, axiom audits, kernel replay, and hosted CI. Do not infer that an unrun check passed.

## Loneliness on a fixed hyperplane

Run `python3 results/loneliness-on-a-hyperplane/verify.py` for exact circle maxima, endpoint congruences, and shifted examples. The limiting theorem is proved in the [mathematical argument](../results/loneliness-on-a-hyperplane/PROOF.md).

## Complete rectangle proof and finite plane certificates

The accepted Lean root includes the full growing-rectangle theorem, including
its real-position tiling interpretation and uniform quantifiers over `w ≥ h`.
Its 46 proof modules passed source checks and independent kernel replay; the
final rectangle audit checked 587 theorem declarations. See the
[exact statement and receipt](../results/rectangle-partition-asymptotics/LEAN.md).

The accepted plane development includes all 64 finite certificate blocks and
their normalization and geometric soundness proofs. The matrix checks all
122,880 indexed cases by kernel reduction. The two complete hosted matrix
runs passed; [the source receipts](../results/five-speed-spectrum/plane-certificate-receipts.json)
bind their sources and generator. Run `python3 scripts/verify_plane_certificates.py --row N` for one row, with `0 ≤ N < 8`. The full accepted package is checked
by `scripts/verify_lean.sh`.

The accepted four-speed coordinate cutoff 5,832 is unconditional. The plane
classification and five-speed cutoff 279,841 retain `FourSpeedGap` as an
explicit premise. Neither the finite matrix nor that conditional cutoff is
a proof of the exhaustive five-speed classification.
