# Erdős–Hajnal local triangle conjecture

**Quantitative phase repair.** Retain the secants of the Hermitian unital of order $q$ independently with probability $p$, where $d=pq\ge C\log q$ for a sufficiently large absolute $C$. With high probability, the following holds simultaneously after any deletions of at most $d/5$ retained secants through each point and for every assignment of bits $s(P,L)$ to the surviving incidences. Let $B$ be the number of geometric nonconcurrent triangles of surviving secants with odd cut parity. There are bits $a(L)$ and $b(P)$ such that
```math
\#\{(P,L):s(P,L)\ne a(L)+b(P)\}\le K B/(q^2d^2)
```
for an absolute $K$. All bit arithmetic is modulo two. Equivalently, the fraction of incidences that need changing is at most a constant times the fraction of geometric nonconcurrent triangles that fail the parity test. This strengthens the [zero-error theorem](PHASE-RIGIDITY.md) and its [deletion version](RESILIENT-PHASE-RIGIDITY.md). Spindle-freeness is not a parity condition, so this does not settle [Erdős #813](https://www.erdosproblems.com/813).

## Host estimates

Write $J$ for the point graph defined by the surviving lines. For any two distinct roots $P,Q$, let $C_0(P,Q)$ consist of their common neighbors off the joining line $PQ$, whether or not that line survives. As in the preceding notes, these witnesses are the edges of a bipartite grid $H_{PQ}$ on the surviving lines through $P$ and $Q$, with $PQ$ excluded. Set $N=q^2-1$. The full grid is $q$-regular and has no four-cycles, so its centered adjacency matrix has norm at most $\sqrt{2q-3}$. The scalar and matrix Chernoff estimates in the zero-error note give minimum degree at least $0.9d$, maximum degree at most $1.1d$, selected side sizes at most $1.1pN$, and centered norm at most $0.1d$ in all sampled grids simultaneously. The upper degree bound uses the same scalar union bound as the lower bound. After deletions the minimum degree is at least $0.7d$; the other upper bounds persist by restriction. Both sides survive, as each had at least $0.9d$ vertices and at most $d/5$ are deleted from a side. Every surviving side in fact has $\Theta(pN)$ vertices, by the scalar size lower bound $0.9pN$ before deletion. Consequently $|C_0(P,Q)|=\Theta(qd^2)$. Allowing common neighbors on $PQ$ adds at most $q$, so the total common neighborhood is $O(qd^2)$.

The triple-witness estimate in the deletion note gives at least $c d^3$ common neighbors off the three root-pair lines for every triple of distinct roots even after deletion. The point degree in $J$ is $O(q^2d)$: each point lies on at most $O(qd)$ sampled lines by scalar Chernoff, and each supplies $q$ point neighbors. All subsequent arguments are deterministic given these events.

## Expansion of the witness graph

Let $U$ be a subset of at most half the vertices of $H_{PQ}$, with side sizes $s,t$. The centered norm bounds its internal edges by $qst/N+0.1d\sqrt{st}$. Since $s+t\le 1.1pN$, its average internal degree is at most $0.65d$. Thus at least $0.05d|U|$ edges leave $U$, even after deletion.

Use this to bound the edge expansion of the line graph of $H_{PQ}$, which has the witnesses as vertices. Let $D$ be a set of $a\le |E(H_{PQ})|/2$ grid edges, and write $k_v=\deg_D(v)$, $m_v=\deg_{H_{PQ}}(v)$, $S=\sum_v\min(k_v,m_v-k_v)$. The line-graph boundary of $D$ is
```math
\sum_v k_v(m_v-k_v)\ge 0.35d S.
```
If $S\ge a/2$, this suffices. Otherwise let $Y$ be the vertices at which edges of $D$ are in the majority, breaking ties arbitrarily. Its degree volume differs from $2a$ by at most $S$, so both $Y$ and its complement have volume at least $1.5a$. The upper degree bound gives both sets size at least $1.5a/(1.1d)$. Each edge crossing $Y$ has at least one minority incidence. The grid expansion therefore gives $S\ge e(Y,\bar Y)\ge c_1 a$. In either case the line-graph boundary is at least $c_2 d a$, with constants independent of the pair and deletions.

## From local paths to a global phase

For a retained point edge $PQ$, put $f(P,Q)=s(P,PQ)+s(Q,PQ)$. Call a point triangle bad if its three values sum to one. Collinear triangles are never bad; the noncollinear bad point triangles correspond one-to-one to the $B$ odd geometric triangles. For each pair of distinct roots, define $g_{PQ}(R)=f(P,R)+f(Q,R)$ on $C_0(P,Q)$, and let $F(P,Q)$ be its majority bit, choosing either bit in a tie.

Suppose two witnesses $R,S$ are adjacent in the grid's line graph. They share a surviving line through exactly one of the two roots, say $P$. Then $g_{PQ}(R)+g_{PQ}(S)$ equals the parity of $QRS$, since $PRS$ has zero parity. For each particular bad triangle and each choice of its opposite root $Q$, the other root $P$ has to lie on $RS$, allowing at most $q-1$ choices. Thus the sum of these line-graph boundaries over all unordered root pairs is at most $3qB$. By expansion the total number of minority events $`(\{P,Q\},R)`$, with $g_{PQ}(R)\ne F(P,Q)$, is $O(qB/d)$.

For an anchor $U$ define $b_U(P)=F(U,P)$ when $P\ne U$ and $b_U(U)=0$. Test each **surviving** point edge $PQ$ for $f(P,Q)=b_U(P)+b_U(Q)$. If it fails and $U,P,Q$ are distinct, each of their at least $cd^3$ off-line common witnesses $R$ certifies at least one of three defects: the triangle $PQR$ is bad, or $`(\{U,P\},R)`$ is a minority event, or $`(\{U,Q\},R)`$ is one. Indeed, without these defects, substituting the two witness paths in the test cancels $f(U,R)$, and the good triangle gives $f(P,Q)$.

A bad triangle can be charged by at most $O(q^2d)$ anchor tests and witnesses, by choosing the witness among its three points and then taking $U$ adjacent to it. A minority event can be charged at most $O(qd^2)$ times: choose which of its two roots is the anchor, and the remaining endpoint of the tested edge must be adjacent to both the non-anchor root and the witness. Hence the total number of certificates is $O(q^2d B + qd^2\cdot qB/d)=O(q^2d B)$. Dividing by the witness lower bound gives $O(q^2 B/d^2)$ failed tests across all anchors distinct from the endpoints.

For anchors equal to an endpoint, if $f(P,Q)\ne F(P,Q)$ at least half of $C_0(P,Q)$ give bad triangles $PQR$. Each bad triangle can be charged on at most three edges, so these anchor tests fail at most $O(B/(qd^2))$ times in total. Averaging over the $q^3+1$ anchors now supplies one bit function $b$ failing on at most $O(B/(qd^2))$ surviving point edges.

On each surviving line $L$, take $a(L)$ to be the majority of $s(P,L)+b(P)$. If $m$ incidences on that line disagree with $a(L)$, then $m(q+1-m)\ge m(q+1)/2$ pairs of points on $L$ are failed edges. Every surviving point edge is counted on its unique joining line. Summing gives the claimed repair cost.

For the fractional form, the number of surviving incidences is $\Theta(q^4d)$, by uniform pencil concentration and the deletion allowance. The number of geometric nonconcurrent triangles is $O(q^6d^3)$, since $J$ has $O(q^5d)$ edges and each edge has at most $O(qd^2)$ common neighbors. These estimates suffice to compare the two fractions.

## A consequence for small independence number

Let $M$ be the number of surviving lines and let $\alpha$ be the independence number of their split graph. Partition the lines by $a(L)$. Any retained split edge within one class uses an erroneous incidence, because the common point potential cancels in the comparison. One bad incidence can account for at most $O(qd)$ such edges by uniform pencil concentration. Consequently the two equal-phase classes together have at most $O(B/(qd))$ internal edges. Each class has independence number at most $\alpha$, so the graph formed by deleting cross-class edges has independence number at most $2\alpha$. The elementary average-degree independence bound yields
```math
2\alpha\ge \frac{M^2}{M+O(B/(qd))}.
```
In particular, if $\alpha\le M/4$, then $B\ge c_3 qd M^2/\alpha$. This applies to cuts fully coordinated across pencils. It does not imply the existence of a spindle: an odd geometric triangle may have either one or three split edges.

For context, triangle-test soundness is a standard interpretation of one-dimensional coboundary expansion; see [Dikstein, Liu and Wigderson](https://www.math.ias.edu/~avi/PUBLICATIONS/DiksteinLiuWig2024.pdf). Here the test is on six-cycles of a random incidence subgraph, and the proof uses the sampled grids and witness charging above, not a building or a local-to-global expansion theorem.
