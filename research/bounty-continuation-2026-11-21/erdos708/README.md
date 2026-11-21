# Erdős 708: the unresolved coefficient-two bound

21 November 2026. Coordination: [issue 233](https://github.com/1337isnot1337/solved-conjectures/issues/233). This work has not solved the problem or produced a new award-ready formalization.

## Exact paid target

For a set A of n distinct integers at least two, put M=max A. Let g(n) be the least universal number of positions needed from any interval I of M consecutive integers so that the product of the selected positions is divisible by the product of A. The target is

```math
g(n)\le (2+o(1))n.
```

Erdős's [1992 primary paper, printed pp. 34–35](https://hrj.episciences.org/125/pdf), offers US$100 or 1000 rupees, whichever is greater, for a proof or disproof of this asymptotic assertion. The [Combinatorics Foundation policy](https://www.combinatoricsfoundation.org/erd%C5%91s-problems) describes a discretionary payment route after the required mathematical acceptance and publication. No submission, payment approval, or receipt of funds is claimed.

The stronger exact bound g(n)≤2n would suffice. One finite counterexample to that stronger statement would not disprove the asymptotic paid target. Previously identified exact-cardinality wording defects are not new mathematical counterexamples.

## What the source check changed

The [transfer audit](uniform-prime-cutoff-prior-audit.md) records a valid construction that we initially investigated as a possible new bridge. Ziming Wang's October 2026 manuscript already gives the all-interval construction, without our regime split. Its minimal-counterexample corollary is also a consequence of that prior proof. Neither is credited as a new result.

The [independent quadratic proof review](wang-quadratic-proof-review.md) checks Wang's stronger existing theorem

```math
M\ge16n^2\quad\Longrightarrow\quad g(A,I)\le2n,
```

where g(A,I) denotes the minimum size for this particular instance. The review checks the least-divisor slack, the weighted Hall argument, and prime-power accounting. It is a written proof review, not a Lean verification.

Wang's raw finite envelope already transfers a uniform fractional coefficient-two bound to the desired integer asymptotic bound. Five-prime-support results in the same source are restricted prior results. The later paper that described a quadratic-to-cubic interval gap omitted Wang's earlier quadratic theorem and all-interval transfer.

## Remaining mathematical obligation

One sufficient inequality uses arbitrary weights 0≤w_p≤1 on primes below Q. Write

```math
X_w(m)=\sum_{p<Q}w_pv_p(m).
```

The unproved assertion is

```math
\sum_{m=1}^{M}(X_w(m)-2)_+
\le
\sum_{b\in I}(X_w(b)-1)_+.
```

Under this inequality, smooth-input fractional duality and vertex rounding give a cover of the smooth originals with cost at most twice their number plus π(Q−1). Taking Q=4n+1 and applying Wang's existing extension would give

```math
g(n)\le2n+\pi(4n)=(2+o(1))n.
```

The hypothesis is still missing. The quadratic theorem allows attention to M<16n², but does not prove the inequality there. Positive kernel arguments for bounded prime support do not automatically extend to arbitrary support; this limitation is already recorded in Wang's historical obstruction notes.

All conditional statements retain their hypotheses. The current completion count for this target is zero.
