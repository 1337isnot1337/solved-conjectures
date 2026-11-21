# Erdős 617: near-clique intersections and a residue coverage bound

21 November 2026. This checks one further structural route requested by the parent agent. The deductions are necessary conditions, not a solution of Erdős 617. No priority or completed-bounty claim is made.

## Inherited palette inequality

Let r be at least six. Let F be an induced subgraph of a spanning edge-deletion reduction of one color of a hypothetical balanced r-coloring. For a vertex set W of order m with r at most m less than 2r, each of the other r−1 original color graphs has independence number at most r and therefore at least m−r edges on W. These disjoint edges are missing from F. Thus

```math
\overline e_F(W)\ge (r-1)(m-r).
\tag{1}
```

Deleting edges from the chosen color preserves this lower bound on nonedges. It does not require the reduced graph to be part of a new complete coloring.

This is the same inherited palette mechanism recorded in the earlier [local-independence research](https://erdosproblems.ai/wiki/research/erdos_617/independent/growing_local_independence_range), Section 1. The arguments below are direct deductions from (1).

## 1. The proposed overlap restriction is valid

Let Q and Q' be distinct cliques of order r−1. Put

```math
k=|Q\cap Q'|,\qquad a=r-1-k.
```

Their union has m=r−1+a vertices. Its only possible nonedges run between the two private parts, each of size a. Hence its number of nonedges is at most a². When a is at least two, (1) requires at least (r−1)(a−1) nonedges.

For 2 at most a at most r−3,

```math
(r-1)(a-1)-a^2=a(r-1-a)-(r-1)\ge r-5>0.
```

The middle expression is a concave quadratic, whose minimum on the stated interval occurs at an endpoint; both endpoint values are r−5. This is a contradiction. Distinctness excludes a=0, so

```math
|Q\cap Q'|\in\{0,1,r-2\}.
\tag{2}
```

The calculation is uniform in r. No finite verification is used.

## 2. In a K_r-free subgraph, a large overlap forms an isolated pair

Assume now that F is K_r-free. If the intersection in (2) has order r−2, then Q∪Q' is an r-vertex graph D isomorphic to K_r minus one edge. Write its two nonadjacent endpoints as a,b and its common complete core as C. Thus Q=C∪{a} and Q'=C∪{b}.

Every vertex x outside D has at most two neighbors in D. Indeed, D has C(r,2)−1 edges, while (1) on D∪{x} gives

```math
e_F(D\cup\{x\})\le\binom{r+1}{2}-(r-1)
=\binom r2+1.
```

Consequently d_D(x) is at most two.

Let T be any other clique of order r−1. If T is contained in D, it is Q or Q', since a clique cannot contain both a and b. Otherwise a vertex of T outside D shows that |T∩D| is at most two. If the intersection had size two, its two vertices would be adjacent and hence would both belong to at least one of Q,Q'. Their intersection with that clique would then have size exactly two, contrary to (2), because r−2 is at least four. Therefore

```math
T\notin\{Q,Q'\}\quad\Longrightarrow\quad |T\cap D|\le1.
\tag{3}
```

In particular each (r−1)-clique belongs to at most one pair with intersection r−2.

## 3. Coalescing the pairs gives blocks with pairwise intersection at most one

Merge each large-overlap pair into its K_r-minus-an-edge union. Keep every remaining (r−1)-clique as a block of its own. Each block is therefore either K_(r−1) or K_r minus an edge. These blocks cover precisely the vertices lying in an (r−1)-clique.

A single-clique block meets every other block in at most one vertex, by (2)–(3). Consider two merged blocks D and D'. Each of the two defining cliques of D' meets D in at most one vertex, so |D∩D'| is at most two.

If equality held, the shared vertices would be the two nonadjacent endpoints in D', because no defining clique could contain both. They would also be the unique nonadjacent pair in D. Therefore the two blocks have no common edge. Their union has 2r−2 vertices and at least

```math
2\left(\binom r2-1\right)=r(r-1)-2
```

edges. Inequality (1), however, gives the upper bound

```math
\binom{2r-2}{2}-(r-1)(r-2)=(r-1)^2.
```

The lower bound exceeds the upper bound by r−3, a contradiction. Thus all distinct coalesced blocks meet in at most one vertex. Their internal edge sets are disjoint. This does not say their vertex sets partition F, that the block-intersection graph is acyclic, or that there are no edges between blocks.

## 4. The connected critical residue must have substantial near-clique coverage

Use the hypotheses of `erdos617-connected-small-packing.md`. In particular H is connected, all its q full K_r's are disjoint, q is at least three, s=r−q is at least two, and a minimum-degree vertex v belongs to the residue and has no neighbor in the full-clique union. Write d=d_H(v), so d is at most r−1.

After deleting N[v] and all q full cliques, let F be the surviving induced graph. The companion proof gives

```math
m=|F|=rs-d,\qquad \alpha(F)\le s-1,\qquad\omega(F)\le r-1.
```

Let t count the vertices of F lying in a clique of order r−1. For the local clique parameter c_F(x),

```math
\sum_{x\in F}c_F(x)\le (r-2)m+t.
```

The uniform-vector specialization of Abiad–Kumar–Pragada, [Theorem 2.2](https://borowiecki.dev/pdf/2609.00210), therefore gives

```math
e(F)\ge\frac{m^2}{s-1}-\frac{(r-1)m+t}{2}.
\tag{4}
```

The companion connected-case proof used instead m²/(s−1)−rm/2. Thus (4) improves its total lower bound E(d) by (m−t)/2. The disjoint edge sets in that proof consequently give

```math
t\ge m+2(E(d)-B).
```

Both m and E(d) decrease as d increases to r−1. Substituting that endpoint and the already checked identity for E(r−1) yields

```math
\boxed{
t\ge r(r-2q)+q(q-1)^2+1+\frac{2}{r-q-1}.
}
\tag{5}
```

The bound is rational; the integer t must be at least its ceiling. Since q(q−1)<r in the connected case, (5) forces most of the surviving residue into the block system from Section 3 as r grows. This is only a coverage condition. The argument has not ruled out a block system satisfying it.

## Remaining obstruction and stopping point

The one route pursued here was to organize all near-cliques in the minimum-degree residue into blocks and combine that organization with the local clique sum. It produces (2), the pairwise-linear block structure, and (5).

The missing step is a quantitative contradiction between that block structure, the small independence number of the residue, and the inherited palette bounds. The blocks can intersect at single vertices and have additional cross edges; the proof above supplies neither an adequate packing theorem nor an independent transversal for them. No claim that such a contradiction follows is made. No larger numerical range was tested. The full conjecture remains unresolved in this work.
