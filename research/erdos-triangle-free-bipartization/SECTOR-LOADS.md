# Sector-load criterion for the circular Erdős bound

For the circular model of the [Erdős deletion problem](https://www.erdosproblems.com/23), the failure of all one-sector cuts puts a necessary lower bound on the mass imbalance of *three consecutive sectors*. This gives a positive criterion complementary to the unrestricted [one-sector obstruction](TWO-SECTOR-CUTS.md). It applies to product weights, permits arbitrary edge deletions, and has no graph-order restriction.

Fix odd \(q\ge3\). Divide the original circle into \(q\) equal sectors, relabeling as in [TWO-SECTOR-CUTS.md](TWO-SECTOR-CUTS.md), so any edge joins sector \(i\) to sector \(i+1\) and its within-sector coordinate strictly increases. Let \(s_i\) be the mass of sector \(i\); all subscripts are cyclic. If any sector is empty all edges can be crossed. Otherwise, for positive costs \(c_i\), assume
```math
s_i\le \frac{c_{i-1}}{s_{i-1}}+\frac{c_{i+1}}{s_{i+1}}
\qquad\text{for every }i.
```
Then some cut that splits only one sector \(j\) has missed weight at most \(c_j\). In particular,
```math
\beta\le\max_i\frac{s_i\,s_{i-1}\,s_{i+1}}{s_{i-1}+s_{i+1}}.
```
With total mass one, any embedding and grid for which the right-hand side is at most \(1/(q+2)^2\) therefore proves the sharp Erdős bound for that graph. For example it suffices if all sector masses are at most \(\sqrt2/(q+2)\). Conversely, if the sharp bound failed for a circular graph, **every rotation** of the grid would contain an \(i\) with \(s_i> (s_{i-1}^{-1}+s_{i+1}^{-1})/(q+2)^2\). This condition constrains the mass in the original \(q\)-sector grid, rather than the antipodal imbalance in [ANTIPODAL-BALANCE.md](ANTIPODAL-BALANCE.md).

## Proof

Color the other \(q-1\) sectors alternately. They form a path of even order, so the two sectors adjacent to \(j\) get opposite signs. A point of coordinate \(t\) in sector \(j\) can be colored to pay the smaller of its edge masses into those two sectors. This is at most
```math
\min\{\mu_{j-1}((-\infty,t)),\,\mu_{j+1}((t,\infty))\},
```
where each \(\mu_i\) is the within-sector coordinate measure. Points in the split sector are independent and make these choices independently.

If no split sector \(j\) achieves cost at most \(c_j\), then for each \(j\) there must be a coordinate \(t_j\) with both displayed masses strictly larger than \(c_j/s_j\). The prefix and suffix tests use open intervals, so ties do not contribute. If either cutoff is at least the entire relevant sector mass, this is already a contradiction.

For a sector \(i\) define \(L_i\) as a left quantile at cumulative mass \(c_{i+1}/s_{i+1}\), and \(R_i\) as a right quantile at tail mass \(c_{i-1}/s_{i-1}\). Use the first coordinate from the respective end through which the cumulative mass is **strictly larger** than the threshold. The assumed sector inequality implies \(R_i\le L_i\): otherwise the prefix through \(L_i\) and the suffix through \(R_i\) would be disjoint, yet their weights would sum to more than \(s_i\).

The witnesses \(t_j\) now imply \(L_{j-1}<t_j<R_{j+1}\). Hence \(L_{j-1}<R_{j+1}\le L_{j+1}\) for every \(j\). Iterating that strict order around the finite step-two cycle is impossible. This proves the criterion.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
