# Verification

[Home](../README.md) · [Catalogue](../CONTENTS.md) · [Lean status](lean-status.md)

## Requirements

- Python 3.12, matching CI. The Hadamard audit uses NumPy. The Frankl window enumeration uses NumPy and SciPy.
- A C++20 compiler available as `c++` for distance-graph checks and the lonely-runner spectrum/equality verifiers. Some Python entry points compile and launch C++ programs themselves.
- For formal proofs: Lean and Mathlib pinned in [the shared Lean package](../lean/). Use its `lean-toolchain` and `lake-manifest.json`; do not substitute a different toolchain.

Run commands from the repository root with Python assertions enabled (do not use `python -O`). Keep the whole checkout: some verifiers reuse code in sibling result directories.

The [Hadamard order-2396 replay](../results/hadamard-2396/) compares the C++ output with the archived pairs and runs a separate Python audit.

The partial-result entries contain their replay commands for the [Frankl generator theorems](../results/frankl-generator-families/), [two-speed insertion](../results/lonely-runner-two-insertions/) and [abelian cover certificate and sharpness example](../results/erdos-gyarfas-abelian-covers/). Their current formalized scope and remaining dependencies are recorded in the [Lean status](lean-status.md).

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

## Selecting accepted-package checks

The full Lean workflow derives the transitive source closure of both
accepted roots and `ProofAudit`. Any change to that closure, the pinned
configuration, or the verification scripts runs the complete build, axiom
audit, and unchanged independent kernel checker. Missing roots, missing
imports, unknown change information, and manual runs also select the full
gate. Only candidate-only or documentation-only changes can skip it.

A skipped job is not a new proof receipt. Each unregistered candidate has
its own complete closure checks. Negative controls check transitive public
imports, missing-source handling, newly registered candidates, and stale
dependent-object rejection after a candidate source error.

## Frankl high-girth theorem

Run `python3 scripts/verify_frankl_high_girth_theorem.py --jobs 4` from the
repository root after preparing the pinned Lean package. This focused gate
rebuilds the exact 64-module theorem closure with warnings treated as errors,
audits every owned declaration against the standard three-axiom whitelist,
requires 35 named endpoints, and replays every project module with the
unchanged stock checker. It rejects changed source, object, compiler,
checker, or gate hashes.

[Successful hosted run](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44516856625) ·
[Original receipt](verification/frankl-components-44516856625/high-girth-theorem.json).
This verifies the complete high-girth frequency theorem. The cyclic
span-four theorem has separate finite graph, transport, coverage, and final
assembly gates. The registered full package is checked by
`scripts/verify_lean.sh`.

## Complete two-speed insertion gate

From the repository root with the pinned toolchain and Mathlib cache:

```sh
python3 scripts/verify_two_insertions_exact.py --plan
python3 scripts/verify_two_insertions_exact.py
```

The exact source model fixes all 27 project modules, 49 required theorem
endpoints, the toolchain configuration, and all transitive gate helpers.
The gate rebuilds every project source with warnings treated as errors and
no linter override, audits all owned declarations and raw private names,
then replays each of the 27 modules as an exact singleton target with the
unchanged stock checker in a fresh one-worker process. It rehashes the
sources, helpers, compiler, checker, every compiled facet, and proof
evidence before writing a passing receipt.

[Run 44524198858/job 135562276051](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44524198858/job/135562276051)
passed for source snapshot `9f51470529423e8135c08de881cd56f5b1fd9a95`.
It checked 563 owned declarations, including 424 theorems and 11 private
declarations. The [original receipt](verification/two-insertions-exact-44524198858/receipt.json)
and [authenticated original evidence](verification/two-insertions-exact-44524198858/)
are public. Receipt preservation performs byte and policy validation;
it is not an additional Lean proof run. This component pass is separate
from the full merged-package gate.
