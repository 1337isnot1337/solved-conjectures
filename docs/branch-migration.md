# Research branch migration

The permanent `research` branch is live. It contains the staged research corpus and newer work. `main` is reserved for finalized, reviewed material.

## Preserved reviews

| Work | Existing review | Exact preserved tip |
| --- | --- | --- |
| Matrix multiplication crossing-wire barrier | [#254](https://github.com/1337isnot1337/solved-conjectures/pull/254) | `064a36a5381f8a66972f8695f2e221c0175556df` |
| Kovalev rational certificate, partial formalization | [#278](https://github.com/1337isnot1337/solved-conjectures/pull/278) | `fcd2e314a35f2b7243ce8f0ef17bda7936c48518` |
| Kauers–Koutschan symbolic certificate, partial formalization | [#281](https://github.com/1337isnot1337/solved-conjectures/pull/281) | `9886cc6f428a5f8db3941f0705c4a0e3410b4abe` |
| Lean source-export workflow, not activated here | [commit](https://github.com/1337isnot1337/solved-conjectures/commit/a4412f0d5d495d209faf20ec94785e0d6f20737a) | `a4412f0d5d495d209faf20ec94785e0d6f20737a` |

The exact tips are ancestors via preservation commit `0394c9492052370fed409ee89a23da9a6df6c130`. The current research tree carries the first three changes' source files, with no new verification or final-result claims. Review discussions stay on their existing PRs.

## Cutover record

- GitHub retired `research/omega-crossing-extension`, clearing the namespace for the permanent `research` branch. PR #254 remains the historical discussion and review record.
- The source snapshots from #278 and #281 are already in `research`; no full formalization or promotion to `main` is implied. Any remaining checks can continue on `research`. Keep their PR histories and the exact tips linked above.
- See [migration issue #295](https://github.com/1337isnot1337/solved-conjectures/issues/295) for verification and temporary-ref cleanup status.
