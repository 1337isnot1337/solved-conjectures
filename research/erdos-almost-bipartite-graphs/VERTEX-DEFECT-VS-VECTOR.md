# Hereditary near-bipartiteness does not bound vector chromatic number

This strengthens the [fractional separation](VERTEX-DEFECT-VS-FRACTIONAL.md).
It concerns the argument for the historical exact-size question;
it is not a resolution of the uncountable existence question.

**Theorem.** For every $`\epsilon>0`$, real $`q\ge2`$ and integer
$`g_0`$, there is a finite graph $`G`$ of odd girth at least $`g_0`$
with ordinary vector chromatic number $`>q`$, such that every
induced subgraph on $`S`$ vertices becomes bipartite after deleting
at most $`\epsilon|S|`$ vertices. In particular, ordinary vector
chromatic number is unbounded even among graphs of Hall ratio
at most $`2+\eta`$ for any fixed $`\eta>0`$.

The [existing result in #836](https://github.com/1337isnot1337/solved-conjectures/issues/836)
separates bounded Hall ratio (at most $`4+\eta`$) from vector
chromatic number using a related unbalanced model and bilinear
concentration. The proof here uses uniform weighted-cut control
on a high-girth template and the pseudoforest cleanup to reach
hereditary near-bipartiteness, hence the sharper Hall threshold.
The near-two Hall statement for fractional chromatic number alone
was already announced by [Davies–Hatzel–Yepremyan](https://www.math.princeton.edu/events/graphs-large-fractional-chromatic-number-and-small-hall-ratio-2026-04-16t190000).
No claim is made that their unpublished details cannot give
stronger conclusions.

## The template

Fix a target cut excess $`0<\delta<1/(\pi(q-1))`$.
Take $`a,h,L,g`$ as in
[the fractional note](VERTEX-DEFECT-VS-FRACTIONAL.md), additionally
requiring $`g\ge g_0`$. There is a finite template $`\Gamma`$
of girth at least $`g`$, with $`c`$ vertices and $`m`$ edges,
such that
```math
\mathop{\mathrm{MaxCut}}(\Gamma)\le (1/2+\delta/2)m,\qquad
\sqrt{c/m}\le\delta/2.
```

For completeness, choose a fixed large $`d`$ depending on
$`\delta`$, and sample $`G(M,d/M)`$. Its edge count is
$`(d/2+o(1))M`$ with probability tending to one. Any fixed cut has
expected size at most $`dM/4`$. An upper Chernoff bound, followed
by a union bound over at most $`2^M`$ cuts, shows that with
probability tending to one every cut has size at most
$`(1+\delta/2)dM/4`$, provided $`d`$ is large enough.
The expected number of cycles of lengths below the fixed $`g`$
is bounded as $`M\to\infty`$. With high probability there are
at most $`M^{1/3}`$ of them and maximum degree at most $`M^{1/3}`$
(the degree bound follows by a binomial tail and a union bound).
Deleting one vertex from each such cycle removes $`o(M)`$ edges
and vertices. It cannot increase the maximum cut size. The
resulting graph has $`m=(d/2+o(1))M`$ and $`c=(1-o(1))M`$.
The excess from the cut bound is at most $`\delta/4+o(1)`$,
and increasing $`d`$ as needed gives both displayed inequalities.

## Uniform control of weighted cuts

Use the unbalanced random graph on $`V_1,\dots,V_c`$ described in
[the fractional note](VERTEX-DEFECT-VS-FRACTIONAL.md): for each
edge $`ij`$ of $`\Gamma`$, $`i<j`$, each $`u\in V_i`$ makes one
independent uniform choice $`f_{ij}(u)\in V_j`$. Give each such
edge $`u f_{ij}(u)`$ weight $`1/(m n_i)`$, with $`n_i=|V_i|`$.
Every template edge contributes total weight $`1/m`$, so all
edge weights sum to one.

For any assignment of signs $`\sigma:V(G)\to\{-1,1\}`$, put
$`x_i=n_i^{-1}\sum_{u\in V_i}\sigma(u)`$.
Write $`J_i=\{j>i:ij\in E(\Gamma)\}`$ and $`d_i=|J_i|`$.
We claim that with probability $`1-o(1)`$, simultaneously for
every sign assignment and every $`i`$,
```math
\left|
\sum_{j\in J_i}\frac1{n_i}\sum_{u\in V_i}
  \sigma(u)\,\sigma(f_{ij}(u))-
\sum_{j\in J_i}x_i x_j
\right| \le 2\sqrt{d_i}.
```

The case $`d_i=0`$ is exact. Otherwise fix the signs on all
parts later than $`i`$ and let
```math
Z_u=\left|\sum_{j\in J_i}
       (\sigma(f_{ij}(u))-x_j)\right|.
```
The inside sum is centered with variance at most $`d_i`$, so
$`\mathbb E Z_u\le\sqrt{d_i}`$. The $`Z_u`$'s are independent
for different $`u`$ and lie in $`[0,2d_i]`$. Hoeffding gives
```math
\Pr\!\left(\frac1{n_i}\sum_u Z_u>2\sqrt{d_i}\right)
\le \exp(-n_i/(2d_i)).
```
There are at most $`2^{2n_{i+1}}`$ choices for all later signs,
where $`n_{i+1}/n_i\to0`$ and $`d_i`$ is fixed. The union bound
therefore tends to zero. For any signs on $`V_i`$, the
absolute value in the claim is bounded by the average of
the $`Z_u`$'s. Sum the failure estimates over the finitely
many $`i`$.

Now any $`x_i\in[-1,1]`$ are the means of independent signs
on $`\Gamma`$. Its deterministic cut inequality therefore gives
$`\sum_{ij\in E(\Gamma)}x_i x_j\ge-\delta m`$.
The total correlation error in $`G`$ is at most
$`\sum_i2\sqrt{d_i}\le2\sqrt{cm}`$. Switching from correlation
to cut fraction divides the error by $`2m`$. Consequently
every cut has weight at most
```math
1/2+\delta/2+\sqrt{c/m}\ \le\ 1/2+\delta .
```

## Simultaneous near-bipartiteness and large vector number

The local earlier-part sparsity event from the fractional
note holds with probability $`1-o(1)`$ for every fixed
template, independently of its independence ratio. Its proof
uses only the separated part sizes and the one-choice rule.
The preceding cut event also holds with probability $`1-o(1)`$,
so fix a realization satisfying both. The template has odd
girth at least $`g`$. The pseudoforest fragmentation and parity
gluing in §2 of that note now apply with the same budgets,
giving the required vertex deletions for every induced subgraph.

If $`G`$ had a vector $`q`$-coloring, its unit vectors would
satisfy $`\langle v_u,v_v\rangle\le-1/(q-1)`$ on every edge.
A random hyperplane separates the ends of every such edge
with probability at least
```math
\frac12+\frac{\arcsin(1/(q-1))}{\pi}
\ge \frac12+\frac1{\pi(q-1)}.
```
The expected normalized weighted cut would then exceed
$`1/2+\delta`$, contradicting the cut bound. Thus the ordinary
vector chromatic number exceeds $`q`$. This is the standard
random-hyperplane formula from
[Goemans–Williamson](https://doi.org/10.1145/227683.227684);
it follows by looking at a uniform angle in the two-dimensional
span of the edge's vectors.

Since an induced bipartite subgraph has an independent side
of at least half its order, $`\rho(G)\le2/(1-\epsilon)`$.
For any $`\eta>0`$ fix $`\epsilon>0`$ with
$`2/(1-\epsilon)\le2+\eta`$. At the endpoint Hall ratio
exactly two, a graph is bipartite, because an odd cycle
already has ratio above two. Thus the threshold statement
is exact. This finite result does not assert an uncountably
chromatic graph on $`\aleph_1`$, or a comparable bound on
edge deletions.
