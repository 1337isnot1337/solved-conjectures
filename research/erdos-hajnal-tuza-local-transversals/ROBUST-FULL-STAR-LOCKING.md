# Near-full star supports cannot be reused widely at small slack

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
This works for all abstract petal systems, not just sequences
near the affine lower bound. It isolates a limitation on how
an efficient abstract construction can share its points.

Fix $`1\le\delta<s`$ and $`0\le\theta<1/(2(\delta+1))`$.
Suppose petals $`W_S`$ are indexed by $`s`$-subsets of
$`[m]`$, and each disjoint pair has intersection at most
$`\delta`$. For an exterior point $`v`$, its support is
$`\mathcal H_v=\{S:v\in W_S\}`$. If this support contains
at least a $`1-\theta`$ fraction of the star at some
coordinate $`x`$, choose one such coordinate $`x(v)`$
and call $`v`$ strong. Choose the coordinates arbitrarily
and independently for distinct strong points.

For every $`s`$-cut $`T`$, the number of strong points
$`v\in W_T`$ with $`x(v)\notin T`$ is at most
```math
\delta^2+
\delta\bigl(2(\delta+1)^2\theta\bigr)^{1/\delta}(m-1)
```
for all sufficiently large $`m`$ depending on $`s,\delta`$.
In particular at $`\delta=1`$ this is $`1+8\theta(m-1)`$.
When the strong-star deficit tends to zero, every petal
has $`o(m)`$ such off-center incidences. The bound
does not assume near-optimal order or control the other
(non-strong) supports.

## Proof

Fix $`T`$. For a particular $`x\notin T`$, at most $`\delta`$
strong points of $`W_T`$ have chosen center $`x`$. Otherwise
take $`\delta+1`$ such points. At least a $`1/2`$ fraction of
all cuts in the star at $`x`$ contain all these points, by
the union bound on the star deficits. Only $`O_s(1/m)`$ of
the star cuts meet $`T`$, so a cut disjoint from $`T`$ would
share at least $`\delta+1`$ points with $`W_T`$.

Let $`D`$ be the distinct chosen centers of the off-center
strong points, and let $`d=|D|`$. For each $`x\in D`$, pick one
such point $`v_x\in W_T`$. These are distinct since each has
one chosen center. Call a $`\delta`$-set
$`R\subseteq[m]\setminus\{x\}`$ bad for $`x`$ if the fraction
of cuts extending $`\{x\}\cup R`$ that omit $`v_x`$
is at least $`1/(2(\delta+1))`$.

Write $`M=\binom{m-1}{s-1}`$. There are at most $`\theta M`$
cuts in the $`x`$-star that omit $`v_x`$. Each such cut
contains exactly $`\binom{s-1}{\delta}`$ choices of $`R`$.
Each $`R`$ has $`\binom{m-\delta-1}{s-\delta-1}`$ extensions
in that star. Double counting, the number of bad $`R`$'s
for $`x`$ is at most
```math
2(\delta+1)\theta\binom{m-1}{\delta}.
```

Now any $`(\delta+1)`$-set $`J\subseteq D`$ contains some
$`x`$ for which $`J\setminus\{x\}`$ is bad. If not, at least
half the cuts extending $`J`$ contain every $`v_x`$,
$`x\in J`$, by the union bound. Because $`J\cap T=\varnothing`$
and $`s`$ is fixed, the fraction of these extensions meeting
$`T`$ is $`O_s(1/m)`$. This remains true if $`s=\delta+1`$,
when there is just the extension $`J`$ itself. Hence one
extension disjoint from $`T`$ would share all the
$`\delta+1`$ distinct points with $`W_T`$, impossible.

Counting the possible bad witnesses for all $`J`$ gives
```math
\binom d{\delta+1}
\le 2(\delta+1)\theta d\binom{m-1}{\delta}.
```
If $`d\le\delta`$ the theorem is immediate. Otherwise divide
by $`d/(\delta+1)`$, and use
$`\binom{d-1}{\delta}\ge(d-\delta)^\delta/\delta!`$ and
$`\binom{m-1}{\delta}\le(m-1)^\delta/\delta!`$.
Multiplying the bound for $`d`$ by the at-most-$`\delta`$
points per chosen center gives the claim.

## Consequences

If $`N_{\rm str}`$ is the number of strong points, their
total contribution to petal sizes has the upper bound
```math
\sum_{v\ {\rm strong}}|\mathcal H_v|
 \le M N_{\rm str}+
 \binom ms\, O_{s,\delta}(1+\theta^{1/\delta}m).
```
Thus along a sequence with $`\theta=o(1)`$ the near-full
stars contribute at most the one-star baseline per point,
up to a normalized $`o(m^2)`$ error after division by $`M`$.
This is uniform over the rest of the construction.
In particular there can be only $`o(m^2)`$ points with
two different $`1-o(1)`$-full centers: the second center
gives $`(1-o(1))M`$ off-center incidences at that point.
Together with the [strict-gap result](AFFINE-ORDER-SHARPNESS-CRITERION.md),
this suggests looking for leading sharing gains among points
without a near-full center, as in the finite-plane examples.
The exact nondivisible leading constant and the original
compatible-hypergraph problem are not determined.
