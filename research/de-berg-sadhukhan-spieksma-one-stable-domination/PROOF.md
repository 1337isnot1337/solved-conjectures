# de Berg–Sadhukhan–Spieksma’s one-stable domination conjecture

**Answer: yes.** There is a deterministic insertion-only
algorithm with at most one change per arrival. For every time
prefix whose maximum arrival degree is d, the algorithm
maintains a dominating set at most

```math
2d+1+\sqrt{(d+1)(3d+1)}
```

times the optimum for that prefix. The algorithm does not
need to know d. This resolves the all-d question posed in the
[authors’ conclusion](https://arxiv.org/html/2412.13358v1#S5),
not just a fixed-degree case or a change of comparator.

## Algorithm

A vertex arrives with its edges to vertices already present.
The closed arrival neighborhood R(v) contains the new vertex
v and all its revealed neighbors. Keep a selected set D
and a nonnegative counter for each vertex, initially zero.

* If D meets R(v), do nothing.
* Otherwise increment the counters of every vertex in R(v).
  Add a vertex in R(v) with maximum current counter to D,
  breaking ties by earliest arrival.

Call the second type of arrival **forced**. Each forced
arrival adds a new vertex, because its neighborhood did not
already meet D. It also dominates the arriving vertex. Old
vertices remain dominated because the algorithm never deletes
selections. Thus the algorithm is 1-stable and feasible at
every step. It scans each arrival neighborhood a constant
number of times and keeps only the counters and a selected
flag for each vertex.

## Incidence budget

Fix an arbitrary nonempty prefix. Let U count its forced
arrivals and let r = d+1. Each forced arrival contributes at
most r increments. The score of a selected vertex at
selection counts increments to that vertex up to and
including that step. No vertex is selected twice, so the
sum of paid scores is at most rU. In particular this charges
an incidence only once even when many candidate neighborhoods
overlap.

Let S be a minimum ordinary dominating set of the prefix,
with size k. Assign each forced arrival to a member of S in
its closed neighborhood in the prefix. Call the assignment
*forward* if the assigned dominator arrived later than the
forced vertex. Each member of S has at most d earlier
neighbors, so if B is the number of forward assignments,
then B is at most dk.

For an optimal vertex w, let m(w) count the remaining
assignments to w. At each of those arrivals w belongs to the
closed arrival neighborhood. By the j-th such arrival its
counter has reached at least j, because it was incremented
at all j forced occurrences. The vertex selected on that
step has a score at least as large. Since every such
assignment corresponds to a different forced step,

```math
rU\ \ge\ \sum_{w\in S}\frac{m(w)(m(w)+1)}2
\ \ge\ \frac{(U-B)^2}{2k}.
```

The first inequality counts all scores only once. The last
uses Cauchy–Schwarz and the fact that the m(w) sum to U−B.
Solving the quadratic inequality and using B at most dk gives

```math
\frac{U}{k}
\ \le\ \frac Bk + r+\sqrt{r^2+2r B/k}
\ \le\ 2d+1+\sqrt{(d+1)(3d+1)}.
```

Since the prefix was arbitrary, the guarantee holds after
every arrival, against an optimal set chosen afresh for that
prefix. For d = 0 each vertex is isolated and the algorithm
is exactly optimal.

## Order of growth is optimal

As observed in the original paper, first reveal d isolated
vertices, then one vertex adjacent to all d. Before the
last arrival, every isolated vertex has to be selected.
After the last arrival, one change cannot remove an old
vertex while adding the center. Hence any 1-stable algorithm
still uses at least d vertices when the optimum is one. This
gives a lower bound of order d in the exact model of the
question.

[verify.py](verify.py) independently exercises the
implementation against brute-force prefix optima on all
ordered graphs through six vertices. It checks feasibility,
stability, the once-only score budget and the accounting
inequality. The proof above is independent of the tests.
