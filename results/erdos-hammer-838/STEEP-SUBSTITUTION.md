# Erdős–Hammer convex-subset conjecture: a multiscale upper construction

**Partial result.** Write $`f(N)`$ for the minimum number of subsets of
at least three points in convex position among general-position planar
sets of size $`N`$. With $`L=\log_2 N`$, we obtain
```math
\log_2 f(N)\le \tfrac12L^2+O(L^{3/2}\sqrt{\log_2 L}).
```
The known lower bound is $`\tfrac14L^2-O(L^{3/2}\sqrt{\log_2 L})`$.
The exact constant and even existence of the logarithmic limit remain
open. The upper-bound geometry below is elementary.

## Steep substitution

All point sets used in the construction have distinct first coordinates
and no three collinear points. A **cup** is a nonempty subset whose
successive secant slopes from left to right strictly increase; a
**cap** has strictly decreasing slopes. The conditions are vacuous for
subsets of size one or two. Denote by $`U(P),D(P),F(P)`$ the numbers of
cups, caps, and nonempty convex-position subsets of $`P`$.

Given two such finite sets $`B,Q`$, replace each $`b\in B`$ by
$`b+\delta T_\epsilon Q`$, where
```math
T_\epsilon(u,v)=(\epsilon u+\epsilon^2v,u).
```
Choose $`\epsilon>0`$ so that the first-coordinate order in the image is
exactly the order of $`u`$ and every image secant has slope greater
than $`A=1+\max_{b\ne b'}|\operatorname{slope}(bb')|`$. Indeed, the
image slope is $`(\epsilon+\epsilon^2\Delta v/\Delta u)^{-1}`$.
Since $`\det T_\epsilon=-\epsilon^2`$, the internal first-coordinate
order is preserved and cups become caps, and vice versa. Next choose
$`\delta>0`$ so small that the clusters occupy disjoint abscissa
intervals in the order of $`B`$, every cross-cluster secant has slope
less than $`A`$, and every triple drawn from distinct clusters has its
center triple's orientation. These finitely many strict conditions hold
by continuity. The resulting set $`B[Q]`$ is in general position:
triples in one cluster are carried by an invertible affine map; those
meeting two clusters have an internal and a cross secant with different
slopes; the rest have the center orientation. Each hypothesis can also
be met with rational parameters for rational templates.

**Chain rule.** In a cup of $`B[Q]`$ meeting more than one cluster,
only the last occupied cluster can contribute two or more vertices.
An earlier internal edge has slope larger than a later cross edge,
contrary to the cup condition. Likewise, a cap can have multiple
vertices only in its first occupied cluster. The occupied centers form
a cup or cap of the same type, because a matching transversal inherits
the strict slope inequalities and its ordered triple signs equal the
center signs. The possibly repeated cluster contributes a chain of
the opposite type in $`Q`$.

**Polygon rule.** If a convex subset meets at least two clusters, its
occupied centers form a convex subset of $`B`$. Otherwise a nonvertex
center would lie strictly inside a triangle of three other centers by
planar Carathéodory and general position. Any chosen transversal
retains those triple orientations and hence still has an interior
point in the corresponding triangle, contradicting convex position.

In a convex subset the upper hull from left to right is a cap and
the lower hull a cup. Fix the subset's leftmost and rightmost points.
For an occupied cluster strictly between their clusters, all its
chosen points are strictly on the same side of the line joining those
endpoints, by orientation preservation. They therefore lie on only
one hull chain; the chain rule permits at most one such point. In the
first occupied cluster the lower hull uses only the global leftmost
point. All further points of that cluster are on the upper hull, so
the entire first part is a cap. By the same reasoning the entire last
part is a cup. In the original $`Q`$-coordinates the two parts are
respectively a cup and a cap. A subset of size two also satisfies this
rule.

## Macro template

For integers $`a,b\ge0`$, construct $`B_{a,b}`$ with
$`\binom{a+b}{a}`$ points, no cup larger than $`a+1`$, and no cap
larger than $`b+1`$. If $`ab=0`$, use one point. Otherwise insert
$`B_{a-1,b}`$ to the left of $`B_{a,b-1}`$, with all cross slopes
greater than all slopes internal to either copy. A suitable vertical
translation of the right copy gives this separation. A cup crossing
the split contains at most one point on the right, a cap at most one
on the left. By induction their sizes are at most $`a+1`$ and
$`b+1`$, respectively; Pascal's rule gives the size. This is the
classical Erdős–Szekeres cup–cap construction.

Set $`B=B_{r,r}`$, $`r\ge1`$, and $`M=\binom{2r}{r}`$. Its cups and
caps have size at most $`r+1`$. Its convex subsets have size at most
$`2r`$, because the upper and lower hull chains share two endpoints
when the size is at least two. With $`S=U(B)+D(B)+F(B)+M`$, we have
```math
 \log_2 S=O(r^2),\qquad
 \ell:=\log_2 M=2r-O(\log_2(r+1)).
```
The first bound follows by bounding every family by
$`\sum_{j=1}^{2r+2}\binom Mj\le (2r+2)M^{2r+2}`$. The second
follows from $`4^r/(2r+1)\le\binom{2r}{r}\le4^r`$.

## Iteration and count

Start from a singleton $`Q_0`$, then let $`Q_{t+1}=B[Q_t]`$.
Write $`n_t=M^t,\ H_t=\max(U(Q_t),D(Q_t))`$, and $`F_t=F(Q_t)`$.
The geometric rules give
```math
 H_{t+1}\le S n_t^r H_t,\qquad
 F_{t+1}\le M F_t+S n_t^{2r-2}H_t^2 .
```
Indeed, a subset lying in one cluster contributes at most the
appropriate chain or convex count times $`M`$. For a mixed chain,
at most $`r`$ occupied centers lie outside the possibly repeated
cluster, so they contribute at most $`n_t^r`$. For a mixed convex
subset, at most $`2r-2`$ centers lie outside the two extremal clusters.
The number of occupied-center patterns is at most the corresponding
term in $`S`$.

Since $`H_0=F_0=1`$, the chain recurrence yields
```math
 H_t\le S^t M^{r t(t-1)/2}.
```
The mixed-convex term is then at most
$`S^{2t+1}M^{r t(t+1)-2t}`$. By induction,
```math
 F_t\le (2S)^{2t} M^{r t(t-1)}\qquad(t\ge0).
```
In the induction step the single-cluster term is at most half of this
envelope at $`t+1`$, as $`M\le S`$ and the exponent increase
is $`2rt\ge0`$. The mixed term is also at most half of the envelope
because $`M^{-2t}\le1`$ and $`S^{2t+1}\le (2S)^{2t+2}/2`$.

For arbitrary $`N`$, take $`t=\lceil L/\ell\rceil`$ and restrict
$`Q_t`$ to any $`N`$ points. For fixed $`r`$, this gives
```math
 \log_2 f(N)\le (r/\ell)L^2+O_r(L),
 \qquad \limsup_{N\to\infty}\frac{\log_2 f(N)}{L^2}\le\frac12
```
by taking $`r\to\infty`$. More quantitatively, the uniform bounds and
$`t\le L/\ell+1`$ give
```math
 \log_2 f(N)\le \tfrac12L^2+
 O\left(\frac{\log_2(r+1)}r L^2+(L+r)r\right).
```
Take $`r=\lceil \sqrt{L\log_2 L}\rceil`$ for large $`L`$.
Both error terms are $`O(L^{3/2}\sqrt{\log_2 L})`$.

## Literature and claim boundaries

- [Erdős, *Some more problems on elementary geometry*
  (1978), pp. 52–53](https://users.renyi.hu/~p_erdos/1978-44.pdf) is
  the original question (attributed to a prompt from Hammer) and
  order-of-growth result. See [Erdős Problems #838](https://www.erdosproblems.com/838).
- [Erdős–Szekeres, *On some extremum problems in elementary geometry*
  (1960/61), pp. 53–62](https://users.renyi.hu/~p_erdos/1960-09.pdf)
  contains the classical cup–cap construction.
- [Holmsen–Nassajian Mojarrad–Pach–Tardos, *Two extensions of the
  Erdős–Szekeres problem*, Theorem 1.3](https://www.renyi.hu/~tardos/suk.pdf)
  sharpened [Suk's theorem](https://doi.org/10.1090/jams/869) to
  $`ES(k)\le2^{k+O(\sqrt{k\log k})}`$. Double-counting $`k`$-subsets
  inside all $`ES(k)`$-subsets gives
  $`f(N)\ge\binom Nk/\binom{ES(k)}k`$.
  Taking $`k=\lfloor L/2\rfloor`$ gives
  $`\log_2 f(N)\ge\tfrac14L^2-O(L^{3/2}\sqrt{\log_2L})`$.
- A [July 2026 working report](https://www.erdosproblemaday.com/report/838)
  records the previous interval $`[1/4,1/(2\ln2)]`$ in base-2
  normalization. Its improvement over the older upper coefficient
  $`1`$ comes from a product bound for a single explicit
  Erdős–Szekeres construction. The bound here is independent of that
  count.
- [Rafik Zeraoulia, *Threshold Constants, Cluster Measures, and a
  Dynamical Window-Compression Theorem for the Erdős–Hammer
  Problem*](https://www.researchgate.net/publication/408580227_THRESHOLD_CONSTANTS_CLUSTER_MEASURES_AND_A_DYNAMICAL_WINDOW-COMPRESSION_THEOREM_FOR_THE_ERDOS-HAMMER_PROBLEM)
  studies cluster methods towards the lower bound and records the
  same known $`1/4`$. Its displayed general upper bound uses the
  ordinary $`2^{k-2}`$-point construction and coefficient $`1`$.

Searches for the exact problem title, “minimum number of convex
subsets,” “steep cluster,” substitution in cup–cap sets, and constants
$`1/2`$, $`0.5`$, $`0.639326`$ did not find this upper bound. This is a
priority check, not proof of novelty or external verification.
