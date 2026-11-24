# Linear Arboricity Conjecture

**Partial research.** The unrestricted conjecture remains open. The argument below gives the exact conjectured upper bound for even maximum degree and sufficiently long factor cycles. It also gives bounded path components, allowing passage to locally finite infinite graphs. A separate source audit identifies two gaps in the large-girth argument of Mishra. Priority for the layered construction is provisional. See [issue #319](https://github.com/1337isnot1337/solved-conjectures/issues/319).

## Statement and scope

A linear forest is a disjoint union of paths. The Linear Arboricity Conjecture of Akiyama, Exoo and Harary asserts that every finite simple graph of maximum degree $\Delta$ has an edge partition into at most $\lceil(\Delta+1)/2\rceil$ linear forests. Equivalently, every nonempty $d$-regular finite simple graph with $d\ge1$ has linear arboricity exactly $\lceil(d+1)/2\rceil$. The lower bound follows by counting edges in forests on the graph's vertex set. For the equivalence, a graph of maximum degree $d$ embeds in a $d$-regular simple graph, for example by the completion argument below with girth parameter three. See [Akiyama–Exoo–Harary (1981)](https://doi.org/10.1002/net.3230110108) and [Gao–Shan, Introduction](https://arxiv.org/abs/2405.18494).

**Theorem.** There are absolute constants $\gamma \gt 0$ and $k_0$ with the following properties for every integer $k\ge k_0$. Set $t=\lceil k^\gamma\rceil$ and $L=\lceil k+8k/t\rceil$.

1. Suppose that a finite simple graph has a decomposition into $k$ spanning 2-factors, and every cycle of the prescribed decomposition has length at least $L$. Its edges partition into $k+1$ linear forests, with at most $4L-4$ edges in each component. More precisely, any partition of the oriented factor cycles into consecutive blocks of lengths between $L$ and $2L-1$ has a transversal of one edge per block whose components are directed paths of length at most $t-1$.
2. Every finite or locally finite simple graph of maximum degree at most $2k$ and girth at least $L$ has an edge partition into $k+1$ linear forests with that same uniform component bound. For infinite graphs these are topological linear forests in the sense of Aurichi, Monteiro and Rodrigues.

In particular, girth at least $k+8k^{1-\gamma}$ suffices. The first statement is a condition on factor cycles and can hold even when the ambient graph contains short cycles. The second gives equality for nonempty finite $2k$-regular graphs, since $k$ forests on $n$ vertices can cover at most $k(n-1)$ of their $kn$ edges.

## 1. Choosing a linear forest through the blocks

We use the graph case of [Delcourt–Postle, Theorem 2.11](https://doi.org/10.1112/jlms.70660) ([arXiv:2204.08981](https://arxiv.org/abs/2204.08981)). For some $\alpha\gt0$ and all sufficiently large integers $D$, a simple edge-colored graph of maximum degree at most $D$ has a full rainbow matching if every color has at least $D(1+D^{-\alpha})$ edges and each color is itself a matching. The general theorem allows bounded monochromatic degree and bounded codegree, and this specialization takes $r=2$ and $\beta=1/2$.

Choose $\gamma=\min\{1/8,\alpha/(2(1+\alpha))\}$. Orient each factor cycle consistently. At every vertex there are $k$ incoming and $k$ outgoing arcs, and within a block there is at most one of each. Independently choose a level $h(v)$ uniformly from $\{1,\ldots,t\}$ for every vertex. In each block designate exactly $L$ arcs as candidates. Retain a candidate $u\to v$ when $h(v)=h(u)+1$. Construct a bipartite graph with copies $v^+,v^-$ of each vertex $v$, and one edge $u^+v^-$ for every retained arc $u\to v$. The color is the arc's block. The graph is simple, since the original graph is simple and each original edge is oriented and used at most once. Each color is a matching, since the original arcs in the block have distinct tails and distinct heads.

We show that levels can be chosen so that the maximum degree of the bipartite graph is at most

```math
D=\left\lceil \frac{k}{t}+\frac{k}{t^2}\right\rceil
```

and every color has at least $(k/t)(1+3/t)$ edges.

**Degree events.** Conditional on $h(v)$, each of the in-degree and out-degree of $v$ among retained candidates is either zero (at the appropriate boundary level) or a sum of at most $k$ independent Bernoulli variables with probability $1/t$. The neighbors tested by either sum are distinct. Its mean is at most $k/t$, and Hoeffding's inequality bounds the probability of exceeding $D$ by $\exp(-2k/t^4)$. The same bound holds without conditioning.

**Block events.** Let $X$ be the number of retained candidates in a block. Each candidate survives with probability $(t-1)/t^2$, so for $t\ge4$,

```math
\mathbb E X=L\frac{t-1}{t^2}
  \ \ge\ \frac{k}{t}\left(1+\frac{7}{t}-\frac{8}{t^2}\right)
  \ \ge\ \frac{k}{t}\left(1+\frac5t\right).
```

Changing one endpoint level changes at most two indicators within this block. There are at most $2L$ endpoint variables. The bounded-differences inequality therefore bounds the probability that $X\lt(k/t)(1+3/t)$ by

```math
\exp\left(-\frac{2(2k/t^2)^2}{8L}\right)
  \ \le\ \exp\left(-\frac{k}{2t^4}\right)
```

for all sufficiently large $k$, when $L\le2k$.

**Simultaneous avoidance.** Each event depends on at most $4k$ levels. Each level participates in at most $2k+2$ degree events, as a center twice and through at most $2k$ incident candidate arcs. It participates in at most $2k$ block events, because each such event uses a distinct block of incident candidate arcs. Thus an event is dependent on at most $4k(4k+2)$ other events in the variable-intersection dependency graph. All the displayed failure probabilities are at most $p=\exp(-k/(2t^4))$. Since $t=O(k^\gamma)$ and $\gamma\le1/8$, the symmetric Lovász local lemma applies for all sufficiently large $k$, uniformly in the number of vertices and blocks.

**Rainbow matching.** We have $D\to\infty$, $D^{-\alpha}\le1/t$ eventually because $\alpha(1-\gamma)\gt\gamma$, and $D\le(k/t)(1+5/(4t))$ eventually because $k/t^2\to\infty$. For $t\ge2$ this gives

```math
D(1+D^{-\alpha})\le\frac{k}{t}\left(1+\frac5{4t}\right)
                              \left(1+\frac1t\right)
                   \le\frac{k}{t}\left(1+\frac3t\right).
```

All hypotheses of the rainbow matching theorem hold. Its matching selects exactly one arc per block, with at most one arc entering and at most one arc leaving each original vertex. An undirected cycle in those arcs would have one incoming and one outgoing arc at every vertex and would thus be a directed cycle. Levels strictly increase on selected arcs, which rules this out and bounds the length of every directed path by $t-1$.

For a cycle of length $m\ge L$, take $\lfloor m/L\rfloor-1$ successive blocks of length $L$ followed by the remaining block of length in $[L,2L-1]$. After removal of one selected edge per block, each run of remaining edges lies in at most two consecutive blocks, with at most $2L-2$ remaining edges from each block. For the one-block cycle, the remaining run has length at most $2L-2$. The $k$ residual factor forests and the selected forest partition all edges. This proves part 1.

## 2. Finite regular completion and compactness

**Completion lemma.** Let $H$ be a finite simple graph of maximum degree at most $d$ and girth at least an integer $g\ge3$. It embeds as an induced subgraph of a finite simple $d$-regular graph of girth at least $g$. For a forest we regard girth as infinite.

For $d=0$ the claim is immediate, and for $d=1$ each isolated vertex can be given a new neighbor. For $d\ge2$, let $B$ be a finite simple $d$-regular graph of girth at least $g$, which exists by [Erdős–Sachs, Satz 2](https://www.renyi.hu/~p_erdos/1963-16.pdf). Take two disjoint copies of $H$. For each of the $d-\deg_H(v)$ missing incidences at a vertex $v$, use a fresh copy of $B$ with one edge $xy$ deleted, and join $x$ to the first copy of $v$ and $y$ to the second. Every vertex now has degree $d$, and each copy of $H$ remains induced. Any simple cycle using an attachment edge must use both attachment edges of that copy of $B$, which form a cut. Its internal $x$–$y$ path has length at least $g-1$, because restoring $xy$ closes a cycle in $B$. Cycles using only internal edges inherit the girth of $H$ or $B$. This proves the lemma.

For finite $G$, apply the lemma with $d=2k$ and $g=L$. Petersen's 2-factorization theorem gives a decomposition of the completed graph, whose factor cycle lengths are at least $L$. Part 1 applies, and restriction of the forests to $G$ preserves the component bound.

For infinite $G$, each finite subgraph inherits the degree and girth conditions. Color its edges with $k+1$ colors using the preceding result. For each individual finite forbidden monochromatic subgraph (a three-edge star, a cycle, or a path with $4L-3$ edges), avoidance is a closed condition in the product of the finite edge-color sets. Any finite set of conditions can be realized by coloring their finite union. Compactness gives a coloring obeying all conditions. Each color class has maximum degree two, is acyclic, and has components of at most $4L-4$ edges. In [Aurichi–Monteiro–Rodrigues, Definition 1.3](https://arxiv.org/abs/2610.02065), an end is adjoined to a color class only if the class contains a ray in that end. Here every component is a finite path, so each color is also a topological linear forest.

## 3. Limitation of a fixed factorization

The leading constant 1 in the cycle-length condition is necessary for a general result choosing an edge of every cycle of a fixed factorization. For any integer $k\ge3$, take the graph with vertex set $(\mathbb Z/k\mathbb Z)^k$ and edges joining vertices differing by $1$ or $-1$ in just one coordinate. The $k$ coordinate 2-factors each consist of $k^{k-1}$ disjoint cycles of length $k$, for a total of $k^k$ cycles. Any transversal uses at least $k^k$ edges on $k^k$ vertices and contains a cycle. This obstruction concerns the prescribed factors. The graph itself has 4-cycles for every $k$ and does not satisfy the large-girth hypothesis as $k$ grows.

## 4. Sources and proof audit

- The original statement and the impact of the exact degree threshold are described in [Akiyama–Exoo–Harary](https://doi.org/10.1002/net.3230110108) and [Gao–Shan](https://arxiv.org/abs/2405.18494). The robust-expander and asymptotic degree bounds address different hypotheses or conclusions. [Christoph et al., arXiv:2507.20500](https://arxiv.org/abs/2507.20500) give an additive bound of order $\log n$, which does not yield the single additional forest here when the order can be arbitrarily large.
- [Wdowinski, §4.1](https://arxiv.org/abs/2301.09933) uses a matching meeting all monochromatic directed cycles when girth is at least $4k$. His [thesis, §3.3.1, after Theorem 3.10](https://hdl.handle.net/10012/20814) notes a $(2+o(1))k$ threshold from applying Delcourt–Postle in the underlying graph, where maximum degree is at most $2k$. Here the split graph uses separate incoming and outgoing capacities. The layers make the resulting arc set acyclic, so a shared original endpoint between two selected arcs is allowed.
- [Mishra, arXiv:2512.11240v1, §§3.1–3.2](https://arxiv.org/abs/2512.11240v1) claims a matching of representatives for girth at least $2k$. In the displayed network, a unit entering an edge node is routed to one endpoint, since the total outgoing flow must equal one. A unit-capacity vertex arc bounds only the number of edges charged to that endpoint. For a concrete instance, use two edge-disjoint triangles $vab$ and $vcd$. Send one unit on each route $S\to vab\to va\to a\to T$ and $S\to vcd\to vc\to c\to T$. All displayed cycle and vertex constraints hold, yet the selected edges $va,vc$ share $v$. A full instance in the stated degree and girth class is the torus $C_4\mathbin{\square}C_4$, with the rows and columns as its two factors. In rows $y=0,1$ take $((2,y),(3,y))$ charged to $(3,y)$, and in rows $y=2,3$ take $((0,y),(1,y))$ charged to $(1,y)$. In columns $x=0,1,2$ take $((x,0),(x,1))$ charged to $(x,1)$, and in column $3$ take $((3,2),(3,3))$ charged to $(3,3)$. The eight charges are distinct. The row-0 and column-2 selections meet at $(2,0)$. The example concerns the claimed flow-to-matching inference. It makes no assertion against the large-girth theorem itself.
- The cyclic-layer completion in [Mishra, §3.6, Lemma 1](https://arxiv.org/abs/2512.11240v1) also has a gap. For a single base vertex of deficiency four the stated construction uses shifts $\pm s,\pm t$ with four distinct nonzero residues. The layer sequence $0,s,s+t,t,0$ always makes a 4-cycle, regardless of the size of the cyclic group. The Erdős–Sachs attachment construction in §2 supplies a separate proof of the completion statement.
- [Aurichi–Monteiro–Rodrigues, arXiv:2610.02065v1, Lemmas 3.3–3.4 and Theorem 3.6](https://arxiv.org/abs/2610.02065v1) use the matching-transversal and completion assertions from Mishra. Our proof recovers their topological upper bound for sufficiently large $k$ at a lower girth threshold through bounded components. It does not recover the stronger matching-transversal assertion or settle the arbitrary-$k$ claim at girth $2k$.
- Literature checked November 24, 2026 via primary papers and the OpenAI mathematics preprint index, searching current exact statements, girth thresholds, factorizations, oriented cycle transversals and rainbow matching. No full resolution of the original conjecture or prior statement of the theorem above was located. The proof uses established results with the hypotheses displayed above. No Lean verification, specialist review or priority claim is recorded.

The missing general step is a replacement for the long-block assumption that handles many short factor cycles. The counting obstruction in §3 requires either selecting a different factorization or allowing recolorings that go beyond one break per original cycle.
