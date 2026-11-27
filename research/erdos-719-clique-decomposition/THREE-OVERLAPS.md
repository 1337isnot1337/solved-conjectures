# Erdős–Sauer conjecture

**Exact bounded-overlap regime.** If $r\ge8$ and every $r$-edge is contained in at most three copies of $K_{r+1}^{(r)}$, the original decomposition bound holds at every order. The bound of two copies was already proved in the [earlier research note](https://github.com/1337isnot1337/solved-conjectures/blob/0b069c98/docs/erdos-sauer-research.md). This does not make a claim for arbitrary overlaps.

We prove a cover theorem in the larger setting of any finite family of $k$-sets, $k\ge9$, where every $(k-1)$-face lies in at most three members. Write $\nu$ for the largest subfamily whose members share no $(k-1)$-face, and $\tau$ for the least number of such faces hitting every member. Then $\tau\le(k-1)\nu$.

## Conflict graph and disjoint triple-stars

Let $J$ have one vertex for each member and an edge whenever two members share a face. Its independence number is $\nu$, and its maximum degree is at most $2k$. Each face contained in three members creates a triangle marked with that face. Distinct triples of members created this way cannot share an edge, because any pair of distinct $k$-sets shares at most one $(k-1)$-face. A marked triangle can be covered by one face. Any adjacent pair can also be covered by one face.

The desired inequality is additive across the connected components of $J$, as no face covers members in two components. Consider one component of order $N$ and independence number $\alpha$.

First suppose the component is not $K_{2k+1}$. By [Brooks’s theorem](https://doi.org/10.1017/S030500410002168X), $J$ on this component has chromatic number at most $2k$, hence $N\le2k\alpha$. Take a largest vertex-disjoint collection of marked triangles, of size $t$, and delete their vertices. A residual face can be in at most two residual members, because otherwise another marked triangle could be added. Thus the residual conflict graph has maximum degree at most $k$.

A maximum ordinary matching of any conflict graph leaves an independent set of unmatched vertices. Cover each matched pair by a shared face and each unmatched vertex by one face. Consequently an $N'$-vertex induced residual graph of independence number at most $\alpha$ is coverable using at most $(N'+\alpha)/2$ faces. Applying this after taking the $t$ marked triangles gives
\[
\tau\le t+(N-3t+\alpha)/2\le (2k+1)\alpha/2-t/2.
\]
This is at most $(k-1)\alpha$ whenever $t\ge3\alpha$.

Otherwise use the sharper size bound on the residual graph. On each component other than a $K_{k+1}$, Brooks gives order at most $k$ times the component’s independence number, so the same matching cover uses at most $(k+1)/2$ faces per unit of independence number. A $K_{k+1}$ component is coverable by $\lceil(k+1)/2\rceil$ faces by pairing its vertices and using one singleton if needed. The summed residual cover is therefore at most $\lceil(k+1)/2\rceil\alpha$. If $t<3\alpha$, then
\[
\tau\le t+\lceil(k+1)/2\rceil\alpha
<\big(3+\lceil(k+1)/2\rceil\big)\alpha\le(k-1)\alpha
\]
for all $k\ge9$.

## The full-degree complete component

If the component is $K_{2k+1}$, every one of the $k$ faces of every member must be in exactly three members: its $2k$ distinct neighbors exhaust the maximum of two per face. The marked triples on the component vertices therefore form a Steiner triple system. In particular each point lies in $k$ triples and there are $k(2k+1)/3$ triples in all.

Greedily choose three disjoint marked triples. After choosing at most two, their occupied vertices can touch at most $6k$ triples by the degree sum, and $k(2k+1)/3>6k$ for every $k\ge9$. Thus the third exists. Cover these three triangles with three faces and pair the remaining vertices in the complete graph. The number of faces is
\[
3+\left\lceil(2k+1-9)/2\right\rceil=k-1=(k-1)\alpha .
\]
This proves the cover theorem.

For [Erdős Problem 719](https://www.erdosproblems.com/719) take $k=r+1$ and the family of complete-clique vertex sets. A minimum face cover leaves a clique-free $r$-graph, so $|E(G)|-\mathrm{ex}_r(n,K_{r+1}^{(r)})\le\tau\le r\nu$. This gives the claimed exact decomposition inequality in the stated bounded-overlap regime.
