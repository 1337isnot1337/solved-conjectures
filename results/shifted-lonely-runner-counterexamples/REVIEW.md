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
