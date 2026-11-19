# Exact component receipts recovered on 19 November 2026

Each JSON file is the unmodified mathematical receipt recovered from its exact
GitHub Actions artifact. The export checked the complete ZIP SHA-256, source
commit, task, module count, required-theorem count, passed status, and exact
completed-check list before exposing the JSON. No failed or cancelled run is
included.

[Successful read-only export](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44511978735/job/135518243745).

| Component | Exact snapshot | Modules | Required endpoints | Artifact | Receipt |
| --- | --- | --- | --- | --- | --- |
| evaluator | `df244bd98eb43f1efc32d92d8e002dc461be58bb` | 65 | 15 | `14522030744` | [JSON](motzkin-evaluator-df244bd9.json) |
| rational-intervals | `ad125705ce715d289be1a89a74e42d6ac095402b` | 46 | 8 | `14524491171` | [JSON](motzkin-rational-intervals-ad125705.json) |
| prime-257 minimum-pair-20 | `10ebb0e4cc69c25871fd339f8207ced070a018d7` | 33 | 14 | `14524375870` | [JSON](loneliness-support257-10ebb0e4.json) |
| fibers | `e911b12c6ee8eb2ae02a0226e855f9314b24237e` | 2 | 5 | `14521441889` | [JSON](hadamard598-fibers-e911b12c.json) |

## Archive SHA-256 values

- Artifact `14522030744`: `4cc7787fc6c4a140cf9a3525dbd96192700f4ef8c078cb974b692505daa61920`.
- Artifact `14524491171`: `645dae844cea4f67ddd2faece901d7a1682960d29ab262ed39c8f49f74ca4576`.
- Artifact `14524375870`: `05f2744e1e6dc470a21de5c4e398a46b8166f3686f94ed50d35da4e2c7179a80`.
- Artifact `14521441889`: `4581a436091ff320303611f9a60364daec0166ee6cd22afa4334cbb7cd1618b0`.

## Registration and source comparison

The evaluator, rational-interval, and prime-257 scopes add 47 proof modules to
the previous 687 registered prebuilds, for 734 proof modules. Their three targets
are imported by `Conjectures`, all missing dependencies are in the sequential
prebuild list, and all 37 required endpoints are included in `ProofAudit`.
Every source and gate-input path in these three receipts matched the frozen
Git blob before registration. The component receipts retain their original
snapshot commits; the merged package requires its separate full gate.

The two fiber-module sources and pinned configuration match their passing
snapshot. Its candidate gate and workflow have changed since that snapshot;
this record preserves the historical receipt and does not relabel it as a
check of the current gate. The fiber module remains outside the accepted root
pending the full length-598 obstruction.

Precise mathematical scopes and remaining hypotheses are in
[the status report](../lean-status.md).
