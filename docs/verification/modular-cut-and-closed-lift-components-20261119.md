# Initial cut pilot and prime-251 closed binary lifts

Both components passed their complete declared source, declaration-audit and
stock-kernel gates from commit `8abe17f1b329ca1df0ae81f4e0b2c4425d1b03a6`.
This registration adds only source-identical checked modules. The original
receipts still describe the pre-registration checkpoint and are preserved
unchanged.

| Component | Run / job | Modules | Required endpoints | Owned declarations | Private declarations |
| --- | --- | ---: | ---: | ---: | ---: |
| Bounded initial-cut pilot | [44577155795 / 135747613861](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44577155795/job/135747613861) | 53 | 54 | 1,218 | 91 |
| Prime-251 closed binary lifts | [44577160577 / 135747634805](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44577160577/job/135747634805) | 33 | 23 | 961 | 10 |

## Exact accepted scopes

The cut pilot proves the complete initial list for five speeds, denominator
six and prime eleven. At seven speeds, denominator eight and prime 251, it
proves the validity of all 19 listed rows and cuts 0, 1, 2 and 3 of the
minimum-pair-four root. It does not prove the remaining prime-251 cuts or
initial-support coverage.

The producer reproduced 135 generated source files, of which exactly 30
belonged to the compiled, audited and replayed closure. Those 30 files are
registered here. The other 105 are not registered or treated as checked
Lean proofs.

The closed binary-lift proof checks all 19 ordered multiplicity roots at
prime 251. It contains 2,451 states and 19 full 128-child branches, with
maximum depth two. Its terminal cases comprise 2,298 strict witnesses,
112 one-odd cases, 16 all-even cases and six short-direction cases.
The classification endpoint retains the six-speed runner bound and the
premise that the actual tuple is represented by one of the 19 roots.
Initial-support exhaustiveness and the complete seven-speed classification
remain unproved by this component.

## Verification and evidence

Each gate freshly compiled its exact project closure with warnings treated
as errors, audited every owned and raw/private serialized declaration, and
replayed the exact project prefix with the unchanged stock kernel.
The only permitted axioms were `propext`, `Classical.choice`, and `Quot.sound`.
No local Lean rerun was substituted for the original hosted evidence during
preservation.

The cut artifact contained 390 authenticated evidence files. Its original
ZIP SHA-256 is
`7792b92cf2af2c2f5a27079c36f3d2d6c82cc55177907c6848cec56ac8d5e75c`;
its raw receipt SHA-256 is
`39b7628525eaf912cc18162efc13f63ca2a3e6fc0d722f73152464209d67b92b`.
See the unchanged [receipt](modular-support-cut-fragments-44577155795/receipt.json),
[preservation record](modular-support-cut-fragments-44577155795/preservation.json),
[declaration inventory](modular-support-cut-fragments-44577155795/declaration-inventory.json.gz)
and [evidence archive](modular-support-cut-fragments-44577155795/evidence.tar.gz).

The closed-lift artifact contained 173 authenticated evidence files. Its
original ZIP SHA-256 is
`e7eb7f02902f06082c21a70dcaf7f78b0aef76ba65f00416d3a3d9db9c2814da`;
its raw receipt SHA-256 is
`06ba4323290ebfa69b3ffa1f3582eb840dfa6d5a1ab9e2a3dc1c39ab7f627bf3`.
See the unchanged [receipt](modular-closed-lifts-44577160577/receipt.json),
[preservation record](modular-closed-lifts-44577160577/preservation.json),
[declaration inventory](modular-closed-lifts-44577160577/declaration-inventory.json.gz)
and [evidence archive](modular-closed-lifts-44577160577/evidence.tar.gz).

## Registration boundary

The union contains 77 source modules. Existing source guards match the
accepted bytes; the 30 new generated files match the passing cut artifact.
Registration adds four root imports, 68 previously absent required theorem
names and 33 explicit prebuild/replay modules. It preserves all earlier
registry entries, including the independently registered seven-speed norm
component.

The [registration manifest](modular-cut-and-closed-lift-registration-20261119.json)
records the exact additions, source guards, new source blobs and preserved
evidence blobs. The merged package has a separate complete source, audit
and kernel-replay obligation. No result-directory completion status changes.
