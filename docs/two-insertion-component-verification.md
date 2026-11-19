# Two-insertion component verification

The exact candidate snapshot `9c7610e7d04788a34f54395a20cc2dda965f45bb`
passed both component gates below. These receipts record their historical
checked sources; they do not silently certify later source changes or register
the modules in the accepted package.

| Component | Project modules | Audited project theorems | Passing job |
| --- | ---: | ---: | --- |
| Two insertions and acceleration bridge | 26 | 419 | [135485511719](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44502085020/job/135485511719) |
| Three-insertion interval obstruction | 5 | 101 | [135485511835](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44502085020/job/135485511835) |

Each task completed source builds, the transitive all-project-theorem axiom
audit, and independent replay of every module in its exact closure by the
unchanged pinned `leanchecker`. Only `propext`, `Classical.choice`, and
`Quot.sound` were allowed. The gate checked that the source and verification
input hashes did not change while running.

The source stage used `lake build`; this is not a claim that the entire closure
passed the newer strict all-linter source policy. The generated axiom audit
used warnings as errors with `-Dlinter.all=false`. No mathematical axiom or
native computation was accepted.

## Checked statements

The acceleration closure proves the arbitrary two-speed insertion theorem
for every integer `p ≥ 3`, the critical base, the small cases, the unbounded
branch, and the bridge to the stated Goddyn–Wong acceleration criterion.
The conclusion gives an actual real time in `[1/(p+2), 1/p]` with the required
clearance `1/(p+2)`, for arbitrary positive inserted speeds. The acceleration
multipliers remain subject to the paper's stated arithmetic criterion.

The obstruction closure proves that the actual clearance of `[4,6,10]`
is at most `1/7` throughout `[1/6,1/3]`. Consequently three arbitrary
insertions cannot satisfy the analogous interval guarantee at threshold
`1/6`. It also verifies the actual five-speed witness for `[1,2,4,6,10]`
at time `3/8`.

The exact required theorem names, project closures, source SHA-256 hashes,
gate hashes, and completed check names are preserved in the original receipts:

- [Acceleration receipt](verification/two-insertion-accelerations-9c7610e7.json)
- [Obstruction receipt](verification/two-insertion-obstruction-9c7610e7.json)

## Receipt recovery and current-source boundary

The original artifact ZIPs were downloaded by the read-only
[receipt export run](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44507055103/job/135501279783).
It verified the archive hashes, the unique receipt entry, the exact source
commit, both expected module and required-theorem counts, and all three
completed checks before exporting their JSON.

| Component | Artifact ID | Original ZIP SHA-256 |
| --- | --- | --- |
| Accelerations | `14517984497` | `3a8059fcdc99a64a17645c229c7d910daef337dba0fa517158d1aa00fdb117fd` |
| Obstruction | `14517804621` | `093f3d294274a896508147ea59d34fdd801af2ae5cf96179de1d7e89db2ec1af` |

At comparison snapshot `66c69ad1455a1d0cf615f4ec6d12e0b0b2dc7818`, every
obstruction source and gate input has the same Git blob as at the checked
snapshot. The acceleration closure differs only in
`LonelinessFiveFamily.lean`: an unused theorem-argument name was changed to
satisfy the strict source linter. Its quantified proposition is unchanged,
but this source change requires a fresh acceleration receipt before the
current exact closure is described as checked.

The general lonely-runner conjecture is not asserted here. Repository-wide
formalization remains incomplete, and Li remains deferred.
