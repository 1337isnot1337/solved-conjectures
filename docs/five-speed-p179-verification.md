# Five-speed p179 component verification

The registered component proves
`Loneliness.FiveSpeedCertificate.RootQuickCertificates.P179.sound :
Loneliness.FiveSpeedRoot.GlobalRootCover 179`.
The theorem has no coverage hypothesis. For every five-tuple of natural
speeds, its conclusion is a modular witness, a zero coordinate, a signed
collision, two short relations, or the folded 134 case, as defined by
`Loneliness.FiveSpeedRoot.RootOutcome`.

This is the complete root-cover component at prime 179. The other root
primes and the remaining coverage obligations of the full five-speed
classification still require their own proofs.

## Checked snapshot and receipt

| Item | Evidence |
| --- | --- |
| Snapshot | [`c5d11dd3e2c3420aa1fca61f9634a29f7295dfba`](https://github.com/1337isnot1337/solved-conjectures/commit/c5d11dd3e2c3420aa1fca61f9634a29f7295dfba) |
| Candidate task | `root-quick179` |
| Hosted run | [44473660614](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44473660614) |
| Successful job | [135389037274](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44473660614/job/135389037274) |
| Original artifact | [14505984269](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44473660614/artifacts/14505984269) |
| Target modules | 14 |
| Complete local project closure | 44 modules |
| Required theorem names | 50 |
| Audited imported project theorems | 6,971, including existing dependencies |
| Source, gate, and toolchain hashes | 51 SHA-256 entries |
| Exported object hashes | 44 `.olean` and 7 `.ilean` files |

The [original receipt](verification/five-speed-root-quick179-c5d11dd3.json)
was recovered from `receipts/root-quick179.json` in the original hosted
artifact. Its historical status remains
`checked candidate; not registered in accepted roots`; that field records
the state when the gate ran. This registration does not rewrite the receipt.

The original archive SHA-256 is:

```text
d4514866c33ee2ac70b3288a7757877ad89f9612f8f4f854424e67cdb2a4d3e0
```

The archived receipt SHA-256 is:

```text
5fb38c899c951f533a028500510d9e8050fcf31ed5ae08b1fecba19d2797254f
```

The digest-checked receipt recovery is recorded in
[export run 44501687684](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44501687684)
and [job 135482809221](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44501687684/job/135482809221).

## Exact verification scope

The original source commands used:

```text
lake env lean -j1 -M4500 -DwarningAsError=true -Dlinter.all=false
```

All 44 project sources compiled. Compiler warnings were treated as errors,
while `linter.all` was disabled. This receipt does not establish all-linter
cleanliness. The accepted verification scripts are not weakened for this
registration.

The audit required all 50 named endpoints to exist as theorems. It audited
every theorem owned by the 44-module closure, including private declarations,
and checked transitive axioms against exactly `propext`, `Classical.choice`,
and `Quot.sound`. The log reports 6,971 audited project theorems.

The job then ran `lake env leanchecker` separately for each of the same
44 modules. All invocations completed successfully before the receipt was
exported. The log records an official Lean 4.35.0 release installation and
Lean commit `eb6cafb7290e8bd5f2937522d8d804f58f02bafc`. The toolchain file,
manifest, workflow, and checking scripts match the receipt. The checker
was invoked without a replacement or a verification-skipping option.
The receipt does not contain a checker-binary checksum.

The pinned Mathlib revision is
`56a005855ea17e0b0958f73ec801ae140b0a1679`.

## Source matching and registration

At integration review commit
`a48f80f5f0e7d5e27d9429c324ad07097d070161`,
all 51 recorded SHA-256 values were recomputed from the snapshot files and
matched the recovered receipt. The corresponding Git blob IDs and modes
were identical on the integration base. Parsing the actual project imports
also reproduced the receipt's exact 44-module dependency order, with no
omitted local import.

The single root import
`Conjectures.LonelinessFiveSpeedRootQuickP0179`
covers all 44 modules and all 14 target modules. Registration adds that
import, 35 previously unregistered entries to the sequential verification
list, and the gate's exact 50 required names to `ProofAudit.lean`.
The other nine closure modules were already registered.

The [p179 inventory](../results/five-speed-spectrum/root-quick179-candidate.json)
lists the 14 target files, unchanged source hashes, 40 nontrivial bases, and
50 required endpoints. The [hosted component index](five-speed-receipts/hosted-component-index.json)
records this pass separately from the other five-speed components.

Proof code, literal certificate data, the candidate gate, the axiom whitelist,
and the kernel replay procedure are unchanged. This component registration
does not assert a pass for a newly merged whole-package run.

Work is coordinated in [issue 7](https://github.com/1337isnot1337/solved-conjectures/issues/7#issuecomment-7005927487).
