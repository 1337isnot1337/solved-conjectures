# Erdős–Neumann-Lara conjecture

For an undirected graph $G$, let $\delta(G)$ be the maximum dichromatic number of an orientation of $G$. Its dichromatic number is the minimum number of vertex colours with no monochromatic directed cycle. Erdős and Neumann-Lara ask whether bounding $\delta(G)$ bounds the ordinary chromatic number $\chi(G)$ independently of the graph. The ordinary statement remains open in the sources checked. [Erdős, pp. 16–18](https://www.renyi.hu/~p_erdos/1980-30.pdf) · [Problem 761](https://www.erdosproblems.com/history/761) · [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/69)

Mohar and Wu prove a fractional analogue, and Harutyunyan, Picasarri-Arrieta and Puig i Surroca prove a list analogue. Harutyunyan and Puig i Surroca prove a lower bound for Kneser graphs. Aboulker, Havet, Pirot and Schabanel give the bound $\chi(G)\le 2\delta(G)(1+\lfloor\log_2 |V(G)|\rfloor)$. The first result below substitutes a bound in terms of maximum degree. The second gives an asymptotic result for finite shift graphs, for which Soukup had proved a directed-cycle colouring theorem in the uncountable setting. Exact-phrase, author, and citation searches turned up no resolution of the ordinary conjecture or a statement of either quantitative bound below. [Fractional version](https://doi.org/10.1017/fms.2016.28) · [List version](https://arxiv.org/abs/2603.01020) · [Kneser graphs](https://www.combinatorics.org/ojs/index.php/eljc/article/download/v32i3p1/pdf/) · [Order bound](https://doi.org/10.37236/12862) · [Soukup, Theorem 4.5](https://arxiv.org/abs/1608.06981)

## Maximum degree and orientations of dense subsets

**Theorem.** Every finite graph $G$ of maximum degree $\Delta\ge1$ admits an orientation in which every acyclic induced subgraph has average degree less than $2\log_2\Delta+10$. Consequently

```math
\delta(G)\ge \frac{\chi(G)}{\lceil 2\log_2\Delta+10\rceil}.
```

More generally, fix $0\le\eta\lt1/2$, and let $h_2$ be the binary entropy function. There is an orientation such that for every connected induced subgraph $H$ of average degree at least $(2\log_2\Delta+10)/(1-h_2(\eta))$, making the induced orientation acyclic requires deleting more than $\eta|E(H)|$ arcs. This is a local degree-dependent guarantee on every graph. A separate result of Lei, Wang and Wang obtains strong feedback-arc bounds for particular triangle-free graphs. [Lei, Wang and Wang (2026)](https://arxiv.org/abs/2607.22044)

**Proof.** For a connected graph $H$ of order $s$, let $\tau(H)$ be its spanning tree count. The number of acyclic orientations is $T_H(2,0)\le2^{s-1}\tau(H)$ by the spanning-tree expansion of the Tutte polynomial, since each tree has at most $s-1$ internally active edges. If an orientation can be made acyclic by deleting $j$ arcs, a linear order consistent with the remaining arcs gives an acyclic orientation differing on at most $j$ edges. The entropy bound on Hamming balls in $\{0,1\}^{|E(H)|}$ therefore gives

```math
\Pr(H\text{ requires deletion of at most }\eta |E(H)|\text{ arcs})
\le 2^{s-1}\tau(H)\,2^{-(1-h_2(\eta))|E(H)|}
```

in a uniformly random orientation. [Stanley on acyclic orientations](https://doi.org/10.1016/0012-365X(73)90108-8) · [Tutte polynomial, spanning-tree expansion](https://www.math.lsu.edu/~oxley/bryox.pdf)

Take these bad events for connected induced subgraphs $H$ at or above the indicated average degree. Write $X=V(H)$ and assign each event the local-lemma weight

```math
x_X=\tau(H)(8\Delta)^{-|X|}.
```

For a fixed vertex $v$, the sum of $\tau(G[X])$ over connected $s$-vertex sets $X$ containing $v$ is at most $(4\Delta)^{s-1}$. Each counted tree is a rooted tree on distinct graph vertices, with root $v$. Fix an order of the neighbours of each vertex to choose the order of children. There are at most $4^{s-1}$ shapes of ordered rooted trees, and at most $\Delta^{s-1}$ ways to choose the images of children for each shape. Therefore the sum of $x_X$ over the events whose sets contain $v$ is at most $1/(4\Delta)$.

Events on disjoint vertex sets are independent, and we can use every intersecting set as a possible dependency. For any $X$ the sum of weights of the other events that intersect it is at most $|X|/(4\Delta)$. Each individual weight is at most $1/4$, so $\log(1-x_Y)\ge-2x_Y$ and the product of $1-x_Y$ over the dependency neighbourhood is at least $\exp(-|X|/(2\Delta))\ge2^{-|X|}$. At the stated threshold the probability of the bad event for $X$ is at most $\tau(G[X])(16\Delta)^{-|X|}$, which is at most its weight times that product. The asymmetric Lovász local lemma avoids every bad event.

For $\eta=0$, a disconnected acyclic induced subgraph at the threshold would have a connected component at the threshold. Thus every acyclic colour class and all its induced subgraphs have average degree below $2\log_2\Delta+10$. Each class is therefore $\lceil 2\log_2\Delta+10\rceil-1$-degenerate and has a proper colouring with at most $\lceil 2\log_2\Delta+10\rceil$ colours. Refining the acyclic colouring proves the bound for $\delta(G)$. In particular, the conjectured implication holds along every family with $\chi(G)\to\infty$ and $\log\Delta=o(\chi(G))$.

## Finite shift graphs

For fixed $r\ge2$, let $S_r(n)$ have the increasing $r$-tuples of $[n]$ as vertices, and join $(x_1,\ldots,x_r)$ to $(x_2,\ldots,x_{r+1})$ for every increasing $(r+1)$-tuple. Set $S_1(n)=K_n$ and write $\log_2^{(j)}$ for the $j$-fold iterated logarithm.

**Theorem.** For fixed $r\ge2$,

```math
\delta(S_r(n))\sim\chi(S_r(n))\sim\log_2^{(r-1)}n.
```

In fact there is an orientation requiring that many colours even to avoid monochromatic directed four-cycles, up to a term $O(\log\log n)$ when $r=2$ and a term $O_r(1)$ when $r\ge3$.

**Proof.** Naturally orient $S_{r-1}(n)$ in the increasing shift direction, including the increasing tournament when $r=2$. Its arcs correspond to the vertices of $S_r(n)$. Each junction $u$ of this natural orientation gives a complete bipartite subgraph between the tuples that are incoming arcs and those that are outgoing arcs at $u$. Choose an orientation of $S_r(n)$ in which, at every junction, every two $t$-sets on opposite sides induce a directed cycle, where $t=\lceil4\log_2 n\rceil$. This is possible for sufficiently large $n$ by independent random orientations. For any fixed two sets the chance of acyclicity is at most $(2t)!2^{-t^2}$ because each acyclic orientation has a topological ordering. There are at most $n^{r-1+2t}$ choices over all junctions and pairs of sets, and the product of these two bounds tends to zero. In an oriented complete bipartite subgraph a shortest directed cycle must have length four. A longer directed cycle has a chord between the first and fourth vertices that produces a shorter directed cycle in either direction.

Suppose a colouring with $q$ colours avoids monochromatic directed four-cycles. Assign to each junction $u$ the set $P(u)$ of colours occurring at least $t$ times on its outgoing arcs. Every colour in $P(u)$ occurs fewer than $t$ times on its incoming arcs. For each naturally directed edge $u\to v$ of $S_{r-1}(n)$, let $c$ be the colour of its tuple in $S_r(n)$. Call the edge exceptional if $c\notin P(u)\setminus P(v)$. At most $q(t-1)$ exceptional edges at a junction can be charged to rare outgoing colours, and at most $q(t-1)$ to rare incoming colours. There are therefore at most $2q(t-1)\binom{n}{r-1}$ exceptional edges. All other edges connect different palettes.

For $r=2$, let $m_i$ be the sizes of the palette classes of the $n$ junctions. Every increasing pair in a class is exceptional, so
```math
\frac{n^2/2^q-n}{2}\le\sum_i\binom{m_i}{2}\le 2q(t-1)n .
```
Thus $2^q\ge n/(1+4q(t-1))$. Apply this to a minimum colouring. The ordinary chromatic number is an upper bound for $q$ and is $O(\log n)$, giving $q\ge\log_2 n-O(\log\log n)$.

For $r\ge3$, choose uniformly a subset of $m=\lfloor n^{1/(2r)}\rfloor$ alphabet symbols. Any exceptional edge is specified by $r$ symbols, all retained with probability at most $(m/n)^r$. The expected number retained is at most $2qtn^{r-1}(m/n)^r=o(1)$ for a minimum colouring, since $q=O(\log n)$. Thus there is a choice on which no exceptional edge survives. The palettes properly colour $S_{r-1}(m)$ with at most $2^q$ colours, so $q\ge\log_2\chi(S_{r-1}(m))$.

For completeness, a proper colouring of $S_r(n)$ gives disjoint incoming and outgoing colour sets at each junction. Taking the outgoing sets gives a proper colouring of $S_{r-1}(n)$ with at most $2^{\chi(S_r(n))}$ colours. Conversely, from a proper $C$-colouring of $S_{r-1}(n)$ assign distinct equal-cardinality subsets of $[b]$ as palettes for the $C$ colours, with $\binom{b}{\lfloor b/2\rfloor}\ge C$. Colour each arc by an element in its tail palette and outside its head palette. At any junction the incoming and outgoing colours are disjoint, so this properly colours $S_r(n)$. Since one can choose $b=\log_2 C+O(\log_2\log_2(C+2)+1)$, induction gives the stated asymptotic for $\chi(S_r(n))$, and in particular the $O(\log n)$ upper bounds used above. The palette lower bound also gives $\log_2\chi(S_{r-1}(m))\ge\log_2^{(r-1)}m=\log_2^{(r-1)}n-O_r(1)$ for $r\ge3$. A dicolouring must avoid monochromatic directed four-cycles, so the same lower bounds apply to $\delta(S_r(n))$.
