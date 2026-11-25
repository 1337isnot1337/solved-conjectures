# Independent review of the two additional cases

The original contribution is [PR #646 by tomdif](https://github.com/1337isnot1337/solved-conjectures/pull/646).
The earlier certificates, verifier and search tools remain credited to [aadrianvv](https://github.com/aadrianvv).

For a speed `v`, shift `s`, and integer `k`, the times with
`|s + v*t - k| ≤ γ` form the closed interval
`[(k-s-γ)/v, (k-s+γ)/v]`. I sorted these intervals exactly over the
rationals and extended a covered prefix whenever an interval started
at or before its right endpoint. The resulting chains cover `[0,1]`,
so integer-speed periodicity gives the same upper bound at all real
times. In each case the listed time has distance at least the claimed
`γ` for every runner, proving equality, not just a counterexample.

| Runners | Exact γ | Attaining time | Intervals in checked chain |
|---:|---:|---:|---:|
| 55 | 63961/3600000 | 1997183/28800000 | 1301 |
| 56 | 56991/3250000 | 10079331/52000000 | 1336 |

Both values are strictly less than `1/(n+1)`. The independent check used
the original JSON, not the contributor's search code. The package's
published verifier is a separate reproduction path. The result addresses
these two cases of [Zhang, v3, Question 8.5](https://arxiv.org/html/2608.13599v3#S8),
not its minimization clause or any case beyond 56. This exact replay was
not a Lean formalization and does not establish outside priority.

## PR #660: stronger certificates and the new case 57

Tomdif authored [original commit `81e11cdf`](https://github.com/1337isnot1337/solved-conjectures/commit/81e11cdf5ae900cb507fc872a6c8f89702d926e1).
It replaces only the two rows in the preceding review and appends 57.
The original records remain preserved in #646. Aadrianvv’s 37 rows,
covering 18 through 54, are byte-equivalent as parsed JSON and were not changed.

| n | Exact global maximum | A time attaining it | Closed cover intervals |
| ---: | ---: | ---: | ---: |
| 55 | 1183599/67000000 | 1569067/33500000 | 2835 |
| 56 | 5419/312500 | 34858381/100000000 | 3029 |
| 57 | 43021/2500000 | 3886629/20000000 | 3068 |

For each row an independent exact-rational review checked the speed
distinctness, positivity, shift range, and strict comparison with
`1/(n+1)`. It sorted and merged all intervals
`[(k-s-γ)/v,(k-s+γ)/v]` meeting `[0,1]`. Their union covers the period.
The displayed times independently give distance at least `γ` from
every integer track position. These upper and lower checks establish
equality for the listed speeds and shifts, not optimality over all
choices of speeds and shifts.

The reviewed standard-library verifier also passed all 40 certificates
in quick mode. The diff changes only two Markdown documents, the
certificate data and three expected-range constants in the verifier.
No optimization/search script, workflow or dependency changed or was
run. [Zhang’s Question 8.5](https://arxiv.org/html/2608.13599v3#S8)
is answered here for the covered sizes only. Neither Lean verification
nor external refereeing is claimed.
