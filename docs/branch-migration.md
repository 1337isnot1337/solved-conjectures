# Research branch migration

This is the temporary research staging branch, not a publication branch. The planned permanent branches are `main` for finalized, reviewed work and `research` for everything in progress. No historical review has been closed by this stage.

## Preserved reviews

| Work | Existing review | Exact preserved tip |
| --- | --- | --- |
| Matrix multiplication crossing-wire barrier | [#254](https://github.com/1337isnot1337/solved-conjectures/pull/254) | `064a36a5381f8a66972f8695f2e221c0175556df` |
| Kovalev rational certificate, partial formalization | [#278](https://github.com/1337isnot1337/solved-conjectures/pull/278) | `fcd2e314a35f2b7243ce8f0ef17bda7936c48518` |
| Kauers–Koutschan symbolic certificate, partial formalization | [#281](https://github.com/1337isnot1337/solved-conjectures/pull/281) | `9886cc6f428a5f8db3941f0705c4a0e3410b4abe` |
| Lean source-export workflow, not activated here | [commit](https://github.com/1337isnot1337/solved-conjectures/commit/a4412f0d5d495d209faf20ec94785e0d6f20737a) | `a4412f0d5d495d209faf20ec94785e0d6f20737a` |

The exact tips are ancestors via preservation commit `0394c9492052370fed409ee89a23da9a6df6c130`. This staging branch additionally carries the first three changes' source files, with no new verification or final-result claims. Review discussions stay on their existing PRs.

## Remaining cutover

1. Stop starting new research on `main` and creating extra branches during migration.
2. Verify the latest tip of `research/omega-crossing-extension` is preserved, then retire it so Git can create the flat `research` branch. GitHub closes a PR whose head is removed, while retaining its conversation and reviews; see #254 above.
3. Create `research` from the staged tree and verify it before removing current-work files from the publication branch. Never replace concurrently changed files without a comparison.
4. Keep the other active reviews intact until their unmerged work is safely integrated or archived with a clear continuation. Remove transient branches once their work is preserved and their reviews are no longer active.
