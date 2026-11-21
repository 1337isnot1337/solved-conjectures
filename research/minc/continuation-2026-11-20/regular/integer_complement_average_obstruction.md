# Integrality of the minimum permanent: an averaging obstruction

Research date: 21 November 2026 UTC.

This note disproves a stronger averaging assertion considered in the
whole-matching replacement route to
[MINC Conjecture 24](https://yair-lavi.com/mincs-list/conjecture-24/index.html).
It does not disprove the conjecture or the existence of a useful individual
replacement. In particular, the constructed matrices are not asserted to
be global minimizers.

## The assertion being tested

Let `B` be a nonnegative integer regular matrix, let `P` be a permutation
matrix, and suppose the degree of `A=B+P` is at most its order `n`.
Assume the zero support of `B` has perfect matchings. One possible route
to Conjecture 24 was to prove

```math
\mathbb E_{Q}\operatorname{per}(B+Q)
\le\operatorname{per}(B+P),                         \tag{1}
```

where `Q` is uniform over the permutation matrices disjoint from `B`,
provided `P` overlaps `B`. Such an inequality would produce a
collision-reducing replacement with no larger permanent.

Inequality (1) is false in this full integer-residual generality, even
when all line sums of `B+P` are strictly below `n`. The binary-residual
version investigated in the earlier checkpoint is not disproved here.

## Inputs already established in the C6 lane

Use the `k`-regular binary Jerrum graph `H=G_(k,f)`, with

```math
n=k^2f+1,\qquad k\ge3.
```

Its distinguished missing edge `(s,t)` satisfies

```math
\frac{\operatorname{per}H(s\mid t)}{\operatorname{per}H}
=\frac{(k-1)^f}{k}.                               \tag{2}
```

The graph and the exact counts are prior work, presented in
[Wanless (1999), Example 1, p. 275](https://users.monash.edu.au/~iwanless/papers/HolDjokLAA.pdf).
The source page was inspected as an image because its text layer is damaged.
It gives the full-matching count
`k ((k-1)!)^(kf) (k-1)^((k-1)f)` and the distinguished cofactor
`((k-1)(k-1)!)^(kf)`, whose ratio is (2).

The recent repository
[C6 checkpoint](https://github.com/1337isnot1337/solved-conjectures/issues/139#issuecomment-7056258663)
also supplies the following uniform-complement marginal estimate. For
`Q` uniform among perfect matchings of `J-H`,

```math
\mathbb P(Q_{ij}=1)
\ge\frac{n-2k-2}{(n-1)(n-2)+n-2k-2}
>\frac1{2n}                                      \tag{3}
```

at every complement edge, when `n >= 4k+4`.

For clarity, the counting proof of (3) is short. Given a complement
matching omitting `(i,j)`, use the two matching edges incident with its
endpoints and a third edge. At least `n-2k-2` choices of the third edge
permit a three-edge switch inserting `(i,j)`. Conversely, a matching
containing `(i,j)` has at most `(n-1)(n-2)` inverse choices. Double counting
gives the first inequality. Comparing numerator and denominator gives
the second under the displayed order condition. This is reuse of the
reviewed C6 argument, not a new graph construction.

## Integer scaling changes the endpoint conclusion

Set

```math
m=kf-1,\qquad B=mH.
```

Take any supported permutation matrix `P <= H`, which exists by regularity.
Then

```math
A=mH+P
```

is a nonnegative integer matrix with constant line sum

```math
K=mk+1=k^2f-k+1=n-k<n.                             \tag{4}
```

Thus it lies in the parameter domain of Conjecture 24. The matrices
`Q` disjoint from `B` are exactly those disjoint from `H`.

Entrywise, `mH+P <= (m+1)H`, so

```math
\operatorname{per}(B+P)
\le (m+1)^n\operatorname{per}H.                    \tag{5}
```

Expand the permanent of `mH+Q` by the number of entries chosen from `Q`.
All terms are nonnegative. Keep the term with no such entry and the
single-entry term at `(s,t)`. Equations (2)--(3) give

```math
\mathbb E_Q\operatorname{per}(B+Q)
>m^n\operatorname{per}H
 \left(1+\frac{(k-1)^f}{2nkm}\right).              \tag{6}
```

Also

```math
\left(1+\frac1m\right)^n
\le e^{n/m}\le e^{k+2}<3^{k+2},                   \tag{7}
```

because `n/m = k + (k+1)/(kf-1) <= k+2` for `k>=3`, `f>=1`.
For each fixed `k>=3`, the quantity `(k-1)^f/(2nkm)` tends to infinity.
Thus (6) exceeds (5) for all sufficiently large `f`.

There is an explicit all-order subfamily with no numerical permanent
search. Take `k=3` and `f>=25`. At `f=25`,

```math
2^{25}=33{,}554{,}432
>2\cdot226\cdot3\cdot74\cdot3^5
=24{,}383{,}592.
```

The ratio `2^f/((9f+1)(3f-1))` increases for `f>=3`:
after cross multiplication, this is the inequality
`27f^2-60f-22 > 0`. Hence the strict inequality persists for every
`f>=25`, and (5)--(7) prove

```math
\boxed{\quad
\mathbb E_Q\operatorname{per}(B+Q)
>\operatorname{per}(B+P)
\quad}
```

for every supported choice `P <= H` in that infinite family.

Every candidate replacement still strictly lowers collisions. If
`C(X)=sum_(i,j) binom(x_ij,2)`, then

```math
C(B+P)-C(B+Q)=\langle B,P\rangle-\langle B,Q\rangle=mn.
```

The failure is in permanent averaging, not in feasibility or collision
reduction.

## What remains unproved

At a hypothetical global minimizer of Conjecture 24, chosen with least
collision count among minimizers, every legal replacement has larger
permanent or fails to improve collisions at equal permanent. Such a
minimizer may obey additional cofactor constraints absent from this family.
The present obstruction therefore gives no contradiction at a global
minimizer.

A successful whole-matching proof still needs a selected replacement or
a distribution that uses those global-minimizer constraints. Uniform
averaging over the complement cannot be asserted for arbitrary integer
residuals. The existence of an individual `Q` with nonincreasing permanent,
even in the displayed family, is not decided by the strict average in
(6). No full conjecture is resolved or added to the completion count.
