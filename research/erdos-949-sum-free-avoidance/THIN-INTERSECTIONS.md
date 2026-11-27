# Erdős’s sum-free avoidance conjecture

**Partial result: thin translate intersections.** Let $G$ be an infinite torsion-free abelian group of cardinality $\kappa$, and let $S\subset G$ be sum-free. Suppose $H\le G$ has cardinality less than $\kappa$, and that there is a cardinal $\lambda<\kappa$ such that
\[
|S\cap(S+t)|\le\lambda\qquad(t\notin H).
\]
Then there is $A\subset G$ of size $\kappa$ with $(A\cup(A+A))\cap S=\varnothing$. This covers uniformly bounded and uniformly countable difference multiplicities in $\mathbb R$, and allows unbounded multiplicities in a subgroup of size less than continuum. If $\kappa$ is regular, the uniform bound can be replaced by the separate bounds $|S\cap(S+t)|<\kappa$ for all $t\notin H$.

## Eligible vertices

Let $D=\{x:x,2x\notin S\}$. In any torsion-free group this set has cardinality $\kappa$. For nonzero $x$, if all of $x,2x,3x,4x,5x$ were in $S\cup\{z:2z\in S\}$, these two sum-free sets would yield a two-coloring of $\{1,\ldots,5\}$ without a monochromatic Schur triple. In fact 1 and 2 must have opposite colors, 4 and 1 must agree, and 3 must disagree with 1 because $1+3=4$. Then $1+4=5$ and $2+3=5$ force incompatible colors for 5. The map sending $x$ to one eligible $i x$ is at most five-to-one by torsion-freeness.

Choose $U\subset D$ containing exactly one representative of every coset of $H$ which meets $D$. Then $|U|=\kappa$: otherwise $D$ would be contained in the union of fewer than $\kappa$ cosets each of size $|H|<\kappa$, a contradiction. Put an edge between distinct $x,y\in U$ if $x+y\in S$. For distinct $x,y$ their common neighbors inject into $S\cap(S+(x-y))$ via $z\mapsto z+x$. Therefore the graph codegrees have the asserted bound, and an independent set of size $\kappa$ suffices. Diagonal sums were taken care of by $D$.

## Graph lemma, including singular cardinalities

Let a graph have $\kappa$ vertices. Every pair of distinct vertices has at most $\lambda<\kappa$ common neighbors. There is an independent set of size $\kappa$.

If some vertex has $\kappa$ neighbors then inside its neighborhood every vertex has degree at most $\lambda$. Greedy recursion works: for $m<\kappa$ previously selected vertices, the number used or excluded is at most $m(1+\lambda)<\kappa$. The same argument works on the whole graph whenever all degrees are subject to any uniform bound below $\kappa$. It remains to handle the case of degrees below $\kappa$ and cofinal in $\kappa$.

Write $\tau=\operatorname{cf}(\kappa)$ and choose a sequence of cardinals $\kappa_i<\kappa$ cofinal in $\kappa$, indexed by $i<\tau$. At stage $i$, write $P$ for the union of the independent sets previously picked. It has size less than $\kappa$ because fewer than $\tau$ sets, each of cardinality less than $\kappa$, have been used. For any vertex $v\notin P$, its neighborhood has at most $|P|(1+\lambda)$ vertices either in $P$ or adjacent to $P$. In the singular case, choose a center $v$ with degree above $\max\{\kappa_i,\lambda,|P|,\aleph_0\}$. If it lies in $P$, delete $v$ from $P$ permanently before adding the new block. Such deletions can destroy up to $\tau$ vertices in total, so when $\tau<\kappa$ they cannot reduce the size of the final set below $\kappa$. Never reintroduce a deleted center: fewer than $\tau$ such exclusions have accrued, and the cardinal threshold can be enlarged to include their number. In the remaining neighborhood of $v$, the maximum degree is at most $\lambda$. Greedily choose an independent block of size at least $\kappa_i$ there. At all subsequent stages this block remains independent from surviving prior blocks. The union of all blocks minus the set of deleted centers is independent and has size $\kappa$.

If $\kappa$ is regular, no block argument is needed, and individual codegrees less than $\kappa$ suffice. If a vertex has $\kappa$ neighbors, its neighborhood has degrees less than $\kappa$; if not, the whole graph has degrees less than $\kappa$. In either case a union of fewer than $\kappa$ excluded neighborhoods still has size less than $\kappa$ and greedy recursion works.

## Scope

The original [Erdős Problem 949](https://www.erdosproblems.com/949) is the case $G=\mathbb R$ with no thinness hypothesis. The [discussion](https://www.erdosproblems.com/forum/thread/949) and [working report](https://www.erdosproblemaday.com/report/949) record the previously settled Sidon case. The condition here concerns nonzero *difference* multiplicities, not sum multiplicities. It is independent of any Lebesgue regularity assumption. No solution of the full problem is claimed.
