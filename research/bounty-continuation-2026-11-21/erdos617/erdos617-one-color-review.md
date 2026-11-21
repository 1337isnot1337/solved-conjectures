# Erdős 617: an infinite obstruction to a one-color proof route

21 November 2026. The general Erdős–Gyárfás balanced-coloring conjecture remains unresolved. This note independently verifies a construction proposed by the `conjectures_bounties` agent. It refutes a proposed auxiliary inequality, not the paid conjecture. Novelty is not claimed. A subsequent targeted search found the same pentagon-core construction in Section 5 of the [earlier independent research record](https://erdosproblems.ai/wiki/research/erdos_617/independent/growing_local_independence_range), stated there with near-equal block sizes for all `r>=11`. The proof below is an independently checked explicit equal-block subfamily, not a newly discovered obstruction.

The original target and prior packing arguments are recorded in [earlier repository note](../../../docs/erdos-gyarfas-balanced-coloring.md) and [issue 45](https://github.com/1337isnot1337/solved-conjectures/issues/45). The conjecture asks whether every `r`-edge-coloring of `K_(r^2+1)`, for `r>=3`, has an `(r+1)`-vertex set omitting a color. See Erdős and Gyárfás, [Conjecture 1](https://doi.org/10.1016/S0012-365X(98)00323-9).

## The proposed one-color implication

In a hypothetical counterexample, each color graph `G` has

```math
|V(G)|=r^2+1,\qquad \alpha(G)\le r,
\tag{1}
```

and every set `S` of `r+1` vertices obeys

```math
e(G[S])\le\binom r2+1.
\tag{2}
```

Condition (2) follows because the other `r-1` colors must each occur at least once in `S`. Averaging the total number of edges over the colors gives the budget

```math
B_r=\frac1r\binom{r^2+1}{2}=\frac{r^3+r}{2}.
```

A tempting route is to prove that every graph satisfying (1) and (2) has more than `B_r` edges. The following infinite family disproves that implication.

## Counterfamily

Let

```math
r=5k+2\quad(k\ge1),\qquad a=2k+1=\frac{2r+1}{5}.
```

Let `H=C_5[K_a]`: replace each vertex of a pentagon by an `a`-vertex clique, join consecutive cliques completely, and put no edges between nonconsecutive cliques. Define

```math
G=(r-2)K_r\ \sqcup\ H.
\tag{3}
```

The notation means disjoint union; the `r-2` cliques and `H` have no edges between components.

### Order and independence number

The core has `5a=2r+1` vertices and independence number two. Hence

```math
|V(G)|=(r-2)r+2r+1=r^2+1,
\qquad
\alpha(G)=r-2+2=r.
```

### Exact edge budget

The core has

```math
e(H)=5\binom a2+5a^2=\frac{15a^2-5a}{2}.
```

Substitution into (3) yields

```math
\boxed{\quad
B_r-e(G)=\frac{(3r-1)(r-2)}{10}>0.
\quad}
\tag{4}
```

Thus the graph is strictly below the average color budget for every parameter in the family.

### Local edge cap: sets crossing components

Consider a set of `r+1` vertices that meets at least two components of (3). If one component supplies `b` vertices, with `1<=b<=r`, then there are at least `b(r+1-b)>=r` absent cross edges. Therefore it has at most

```math
\binom{r+1}{2}-r=\binom r2
```

edges, which is stronger than (2).

### Local edge cap: sets wholly inside the core

For a subset of the core, let `x_i` be the number of selected vertices in pentagon block `i`, with indices modulo five. Its absent edges number

```math
F(x_0,\ldots,x_4)=\sum_{i=0}^4x_ix_{i+2},
\qquad 0\le x_i\le a.
```

For `2a<=m<=3a`, the minimum of `F` under `sum x_i=m` is exactly

```math
\mathop{\mathrm{min}} F=a(m-2a).
\tag{5}
```

Here is a direct proof that also applies to integral selections. If two coordinates are strictly between zero and `a`, transfer mass from one to the other while keeping their sum fixed. The resulting function of the transferred amount is concave if those two blocks contribute a term to `F`, and affine otherwise. Its minimum occurs at an endpoint, where at least one of the two coordinates reaches zero or `a`. Repeating leaves at most one nonboundary coordinate. Consequently a minimum has two full blocks and a partial block of size `b=m-2a`, with the evident boundary interpretations when `b` is zero or `a`.

If the full blocks are nonconsecutive in the original pentagon, they already contribute `a^2>=ab` absent edges. If they are consecutive, every third pentagon block is nonconsecutive to at least one of them, contributing at least `ab`. Equality is attained by putting the two full blocks and the partial block consecutively around the pentagon. This proves (5).

For the required size,

```math
m=r+1=\frac{5a+1}{2},\qquad
m-2a=\frac{a+1}{2}.
```

Since `a>=3`,

```math
a\frac{a+1}{2}\ge r-1
\quad\Longleftrightarrow\quad
(a-1)(a-3)\ge0.
```

Thus at least `r-1` edges are absent, proving (2) for sets entirely in the core as well. Together with (4), this proves the full infinite counterfamily to the auxiliary implication.

## The stronger hereditary palette constraint

The construction cannot be a color graph of a balanced coloring. The other colors impose more than (2).

Write `m=qr+s` with `0<=s\lt r`, and define

```math
T_r(m)=r\binom q2+qs.
```

By the complementary form of Turán's theorem, every graph on `m` vertices with independence number at most `r` has at least `T_r(m)` edges. Applied separately to all `r-1` other color graphs on any vertex set `S`, this forces

```math
\boxed{\quad
e(G[S])\le\binom{|S|}{2}-(r-1)T_r(|S|)
\quad\text{for every }S.
\quad}
\tag{6}
```

For the core in (3), `|S|=2r+1`, so `T_r(2r+1)=r+2`. The right side of (6) is `r^2+2`. But

```math
e(H)-(r^2+2)=\frac{r^2+r-11}{5}>0
```

for every parameter considered. Hence the core violates (6). This precise obstruction explains why the valid one-color counterfamily cannot be extended to a balanced coloring.

## Consequence for the full proof attempt

The two readily extracted one-color conditions (1) and (2) are insufficient, even together with a strict edge-budget inequality. A full proof must retain more information from the other colors. Constraint (6) is one such necessary condition, but this review does not establish that it is sufficient to force the conjecture.

No fixed-color case was claimed as new, and this argument was not a search for larger finite cases. The family and its exclusion are proved uniformly in the parameter. The remaining research route is to combine (6), independence-critical induced subgraphs, and structural information about monochromatic clique packings, or to find a scalable graph family satisfying all of those necessary conditions.
