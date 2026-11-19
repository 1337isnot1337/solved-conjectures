# Span-four candidate verification

The cyclic schedule, admissibility, and assembly components have local proof
receipts. The assembly is conditional on eleven finite checks. The concrete
window lists, rank tables, and weight tables have not all been supplied.

The hosted gate is separate from accepted registration. It does not change
the accepted roots or mark the full span-four theorem complete.

## Candidate commands

```sh
python3 scripts/verify_frankl_span_four_candidate.py assembly --plan
python3 scripts/verify_frankl_span_four_candidate.py assembly --preflight
python3 scripts/verify_frankl_span_four_candidate.py assembly
```

Other selectors are `schedule`, `admissible`, `cyclic-injective`,
`irredundant`, `assembly-core`, `family-transfer`, `weight-rows`,
`weight-batches`, `small-cyclic-weights-pilot`, and `word-coverage`. The schedule
selector has 28 project modules and does not import the Vaughan matching
certificate. The pilot has 25 modules and 24 private two-row proof chunks.

On a push or pull request, the workflow selects maximal affected closures.
A full selection runs WeightBatches, the literal-weight pilot, and standalone
WordCoverage. Only WeightBatches imports the matching certificate, and each
job checks all endpoints of its contained candidates. Unrelated Frankl changes
do not start these jobs. Manual dispatch can select one component directly.

## Publication preflight

`frankl-span-four-source-inventory.json` records each source hash, project
import list, private certificate theorem name, and the inspected public
commit. Planning uses this inventory even when a source is absent. Missing
sources do not silently remove a selected job.

Preflight must succeed before the workflow installs Lean. It reports every
missing source and distinguishes peer-owned dependencies. It also rejects
source, import, or pinned-configuration mismatches. It does not download
missing files or publish peer files.

At the inventory's reference commit
`38e45960720e5b11362dd153b186d2331b980d47`, the nine peer dependencies were
still unpublished:

- `FranklCyclicGenerators`, `FranklCyclicWords`, `FranklCyclicRank`
- `FranklLocalEnumeration`, `FranklLocalEnumerationMap`
- `FranklCyclicPairs`, `FranklCyclicCertificates`, `FranklCyclicRankList`
- `FranklLocalEnumerationCore`

The inventory separately records the team's candidate sources that also
await publication. The exact nine unchanged peer sources have a separate
`frankl-span-four-peer-prerequisites.json` provenance inventory, following the
coordination notices on issues 19 and 20. Their owner retains the graph,
rank, and weight-data work. Changing a dependency requires a reviewed
inventory update; an old receipt does not cover changed source bytes.

## Verification evidence

For the selected closure, the gate:

1. Rebuilds every project dependency with warnings treated as errors.
2. Requires materialized public, server, and private object facets.
3. Imports every project module with `import all`, checks every project
   theorem's axioms, and requires every named endpoint to be a theorem.
4. Asserts visibility of each listed private finite-certificate proof.
   The assembly inventory includes 534 Vaughan/Pasch nodes and 63 period-nine
   nodes, for 597 in total.
5. Runs the unchanged pinned stock checker on the exact dependency closure.
   The reported replay set must equal the expected module set, without
   duplicates. A zero exit code with missing or extra modules fails.
6. Rechecks source, configuration, gate, object, and checker hashes.

Only `propext`, `Classical.choice`, and `Quot.sound` are permitted axioms.
The receipt, generated audit, and logs are uploaded even when a job is
blocked or fails. Artifacts use the prefix `frankl-span-four-`.

The preparation tests cover selection, explicit missing-source reporting,
period-nine private names, stale or missing object facets, and incomplete,
duplicate, or excessive replay output. They do not replace Lean verification.

## Reviewed extensions

WeightBatches, generic weight rows, the literal-weight pilot, and WordCoverage
were activated only after their complete local source/audit/kernel receipts
were received. The inventory records those receipt hashes. The pilot checks
only 16 original rows at each of periods seven, eight and nine; it does not
establish the full 9,088-row weight table. WeightBatches supplies a generic
coverage-and-lookup transfer. WordCoverage supplies generic overlap
enumeration. Neither supplies an unverified graph or rank table.

Further activation requires a complete source/audit/kernel receipt, exact
source/import hashes, required endpoints, and any new private-node inventory.

The local-mask verifier and workflow remain separate and unchanged by this
candidate gate.
