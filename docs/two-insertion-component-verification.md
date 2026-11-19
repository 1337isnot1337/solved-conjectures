# Two-insertion component verification

## Current complete verification

The literal two-speed interval statement is checked for every natural
$`p\ge3`$ and every two positive integer speeds $`b,c`$, with no upper bound:
there is a real $`t\in[1/(p+2),1/p]`$ such that both distances to the nearest
integer are at least $`1/(p+2)`$.

The closure proves the measure estimate, endpoint divisibility, explicit
perturbed reciprocal times, all eight small-parameter certificates, and the
bound that reduces the remaining second-speed search to finitely many cases.
No numerical table or large-speed cutoff is assumed.

The insertion theorem applies to every base that stays separated on the
whole prescribed interval. The proof verifies that interval property directly
from the stated Goddyn–Wong gcd criterion for simultaneous accelerations,
and proves the lower bound after common dilation. The arithmetic criterion
is the stated hypothesis of the result, not an unproved external theorem.

The same closure checks the three-insertion obstruction: throughout
$`[1/6,1/3]`$, the clearance of `[4,6,10]` is at most $`1/7`$. It also checks
the actual five-speed witness for `[1,2,4,6,10]` at $`3/8`$.

At source commit `9f51470529423e8135c08de881cd56f5b1fd9a95`,
[run 44524198858/job 135562276051](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44524198858/job/135562276051)
freshly checked all 27 modules with warnings treated as errors and no linter
override. The audit covered all 563 owned declarations, including 424
theorems and 11 private declarations, and required all 49 named endpoints
to be theorems. Every module was then replayed as an exact singleton target
in a fresh process by the unchanged pinned stock checker, with one worker.
Only `propext`, `Classical.choice` and `Quot.sound` were allowed.

The [unchanged raw receipt](verification/two-insertions-exact-44524198858/receipt.json)
has SHA-256
`215df211e3e47abf148fd306cf43eef6cd1827a4b1b4cb61140743b2de36f55a`.
[Preserved audit, inventory, logs and controls](verification/two-insertions-exact-44524198858/)
and the [archive verification record](verification/two-insertions-exact-44524198858/preservation.json)
authenticate the original artifact `14529194546`, whose ZIP SHA-256 is
`bed76da06d98fda0721def565d9d451a3a79ce2071fe7ebe708bc723e8d7c248`.
All 27 checked source hashes were guarded at registration. The accepted
registry gains 18 proof modules and 49 named endpoints, bringing its
prebuild list to 904 proof modules plus the two roots.

This completes the original insertion note. The general lonely-runner
conjecture and the separate spectrum/classification notes remain outside
this result. Verification of the merged accepted package is separate.

## Historical component checks

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

### Historical checked statements

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

### Historical receipt recovery and source boundary

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
but that source change required a fresh acceleration receipt. The complete
strict check described above now covers the current registered closure.

The general lonely-runner conjecture is not asserted here. Repository-wide
formalization remains incomplete, and Li remains deferred.
