# Erdős–Sauer conjecture

**Exact bounded-overlap regime.** If $`r\ge5`$ and every $`r`$-edge is contained in at most three copies of $`K_{r+1}^{(r)}`$, the original decomposition bound holds at every order. The bound of two copies was already proved in the [earlier research note](https://github.com/1337isnot1337/solved-conjectures/blob/0b069c98/docs/erdos-sauer-research.md). This does not make a claim for arbitrary overlaps.

We prove a cover theorem in the larger setting of any finite family of $`k`$-sets, $`k\ge6`$, where every $`(k-1)`$-face lies in at most three members. Write $`\nu`$ for the largest subfamily whose members share no $`(k-1)`$-face, and $`\tau`$ for the least number of such faces hitting every member. Then $`\tau\le(k-1)\nu`$.

## Conflict graph and its clique number

Let $`J`$ have one vertex for each member and an edge whenever two members share a face. Its independence number is $`\nu`$, and its maximum degree is at most $`2k`$. Each face contained in three members makes a marked triangle in $`J`$, and selecting that one face covers all three members. Similarly any adjacent pair can be covered with one face.

A clique of $`J`$ either has a single fixed face common to its members or lies inside a common $`(k+1)`$-set. For a proof, take two members $`F+a,F+b`$ sharing face $`F`$. Any member adjacent to both either contains $`F`$ or has the form $`F-z+\{a,b\}`$ with $`z\in F`$. If one of the latter exists then no other member containing $`F`$ can use an extra vertex different from $`a,b`$, because it would be nonadjacent to that member. All members then lie in $`F+\{a,b\}`$. Under the face-degree hypothesis the common-face type has size at most three, and the other type has size at most $`k+1`$. Thus $`\omega(J)\le k+1`$.

By the [fractional form of Reed’s bound](https://www.combinatorics.org/ojs/index.php/eljc/article/download/v21i4p48/pdf/) (in fact the cited primary paper proves a stronger local version),
```math
|V(J)|\le\chi_f(J)\nu
\le\frac{\Delta(J)+1+\omega(J)}{2}\nu
\le\frac{3k+2}{2}\nu.
```
The first inequality follows directly by summing the fractional coloring's stable-set weights over vertices, since each stable set has size at most $`\nu`$.

## Two bounds from disjoint marked triangles

Choose a maximum vertex-disjoint collection of marked triangles, of size $`t`$, and delete their vertices. The remaining face-degrees are at most two, since otherwise one could add another marked triangle disjoint from the chosen ones. The residual conflict graph has maximum degree at most $`k`$. A maximum ordinary matching of a conflict graph leaves an independent set of unmatched vertices. Cover each matched pair by a shared face and each unmatched vertex by a face. A residual graph of order $`N'`$ and independence number at most $`\nu`$ is therefore coverable using at most $`(N'+\nu)/2`$ faces. Counting the $`t`$ marked triangles as well gives
```math
\tau\le t+(|V(J)|-3t+\nu)/2\le\frac{3k+4}{4}\nu-t/2.
```
In particular, if $`t\ge\nu`$, this is at most $`(k-1)\nu`$ for $`k\ge6`$.

For $`t<\nu`$, use the residual degree bound more directly. On each component other than a $`K_{k+1}`$, [Brooks’s theorem](https://doi.org/10.1017/S030500410002168X) gives order at most $`k`$ times its independence number; the matching cover costs at most $`(k+1)/2`$ per unit of independence number. A $`K_{k+1}`$ component can be covered by $`\lceil(k+1)/2\rceil`$ faces by pairing its members, with a singleton if needed. Summed over components, the residual cover thus costs at most $`\lceil(k+1)/2\rceil\nu`$. Hence
```math
\tau\le t+\lceil(k+1)/2\rceil\nu
< (1+\lceil(k+1)/2\rceil)\nu
\le(k-1)\nu
```
for $`k\ge6`$ and $`\nu>0`$. The case $`\nu=0`$ is empty.

For [Erdős Problem 719](https://www.erdosproblems.com/719) take $`k=r+1`$ and the family of complete-clique vertex sets. A minimum face cover leaves a clique-free $`r`$-graph, so $`|E(G)|-\mathrm{ex}_r(n,K_{r+1}^{(r)})\le\tau\le r\nu`$. This gives the claimed exact decomposition inequality in the stated bounded-overlap regime.

**Remaining case at bounded overlap.** With at most three cliques per face, the same argument covers $`k=5`$ if the conflict graph has no $`K_6`$: the fractional coloring bound is then $`|V(J)|\le8\nu`$, so the first estimate suffices for $`t\ge\nu`$, and the residual estimate is $`t+3\nu<4\nu`$ otherwise. Thus the only excluded structural case at $`k=5`$ has a full top consisting of the six $`5`$-sets in a $`6`$-set. Handling these tops or the $`k=4`$ case requires additional work.
