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

The [signed analytic route audit](signed-analytic-route-obstruction.md) retains the exact alternating floor discrepancies. Using Hensley–Richards' unconditional rough-number theorem, it proves that integrating over a threshold does not make every individual prime increment nonnegative. That is an obstruction to the proposed induction, not a counterexample to the complete hinge inequality.

A follow-up averages over every prime order. Its allocation identity is exact, but the required joint-overlap inequality remains unproved. The note gives the reciprocal form of that missing assertion and an abstract six-coordinate countermodel showing why marginal counts alone do not establish it. The countermodel is not an arithmetic interval. A [bounded exact diagnostic](probe_order_average.py) found no violating coordinate in its selected inputs; [the output](order-average-probe.json) supports no universal conclusion.

All conditional statements retain their hypotheses. The current completion count for this target is zero.

## Review of an unmatched formal claim

[PR 235](https://github.com/1337isnot1337/solved-conjectures/pull/235), inspected at commit `edb8760ce951d8a3f4affae3e2b55a8fcd6923df`, claims an asymptotic formalization but states only `∃ c : ℝ, c ≤ 2`. Its proposed cover predicate ends in `True`, and its workflow writes a success message without invoking Lean. The coordinator requested changes in [review 6007726911](https://github.com/1337isnot1337/solved-conjectures/pull/235#pullrequestreview-6007726911). That artifact proves no interval-cover assertion, supplies no kernel-verification evidence, and does not close this target.
