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

## Exact fractional chromatic numbers for Burling and twincut graphs

The two recursive constructions give arbitrarily large ordinary chromatic number. Their fractional chromatic numbers can also be calculated exactly. Their growth, combined with the theorem of Mohar and Wu, implies that neither sequence has bounded maximum dichromatic number. The unboundedness of fractional chromatic number for the class of Burling graphs is already known. The calculation here concerns the exact values for the original finite sequence and for the twincut sequence. Charbit and Sereni give the same recurrence as the twincut recurrence below for the distinct Zykov sequence, using a related lower-bound argument. [Burling recursion as stated by Felsner et al., Section 1](https://doi.org/10.37236/7052) · [Twincut construction, Section 2](https://arxiv.org/abs/2304.04296) · [Burling fractional unboundedness, reported by Steiner](https://doi.org/10.1007/s00493-025-00164-0) · [Charbit–Sereni on Zykov products](https://iti.mff.cuni.cz/series/2010/485.pdf)

Write a fractional colouring with palette of length $t$ as a set $C_v\subseteq[0,t)$ of measure one for each vertex $v$, with disjoint sets on adjacent vertices. These sets can be finite unions of half-open intervals. To pass from a fractional colouring by weighted stable sets to this description, allocate an interval to each weighted stable set and trim any excess coverage at a vertex. For $S\subseteq V(G)$ put $C(S)=\bigcup_{v\in S}C_v$. We will split a palette into two parts in any prescribed ratio by splitting every interval of the common refinement in that ratio. The split then divides every $C(S)$ in that same ratio. Each part can be placed by a measure-preserving piecewise translation into any available palette region of sufficient measure.

**Burling graphs.** For the sequence $B_k$ of Felsner et al., $\chi_f(B_1)=1$ and $\chi_f(B_k)=(k+2)/2$ for $k\ge2$. Indeed, put $s_k=(k+1)/2$. The recursion starts at a single vertex with that singleton as the distinguished stable set. It uses a master copy of $B_k$ and, for each distinguished set $S$ in the master, another copy of $B_k$. For each distinguished set $X$ in that other copy it adds a vertex $v_{S,X}$ adjacent to exactly $X$. The new distinguished sets are $S\cup X$ and $S\cup\{v_{S,X}\}$.

Inductively every fractional colouring of $B_k$ has a distinguished set $S$ with $|C(S)|\ge s_k$. For the step, take such an $S$ in the master and such an $X$ in its associated copy. If $|C(S)\cup C(X)|\ge s_k+1/2$, we are done. Otherwise $|C(S)\setminus C(X)|\lt1/2$, and the palette of $v_{S,X}$ is disjoint from $C(X)$. Consequently $|C(S)\cup C_{v_{S,X}}|\gt s_k+1/2$. This establishes the induction and also gives $\chi_f(B_{k+1})\ge s_k+1$, since the palette for $v_{S,X}$ avoids $C(X)$ of measure at least $s_k$.

For the upper bound, we maintain a colouring of $B_k$ of palette length $w_k$ with every distinguished set having union measure exactly $s_k$. Take $w_1=1$ and $w_k=s_k+1/2$ for $k\ge2$. For the step set $s=s_k$ and use a palette of length $s+1$, placing the master colouring unchanged. For every master set $S$, split the palette of its associated copy in the ratios $1-1/(2s)$ and $1/(2s)$, placing the first part inside $C(S)$ and the second outside. This fits since $w_k\le s+1/2$, so the two lengths are at most $s-1/(4s)$ and $1/2+1/(4s)$, respectively. Thus every copy probe $X$ has $|C(X)\setminus C(S)|=1/2$ and $|C(X)\cap C(S)|=s-1/2$. The remaining palette outside $C(X)$ has measure $1/2$ inside $C(S)$ and $1/2$ outside $C(S)$. Give it all to $v_{S,X}$. Now both new distinguished sets have palette union measure $s+1/2$. This gives the asserted colouring of $B_{k+1}$, of palette length $s+1=w_{k+1}$.

**Twincut graphs.** For a rooted tree with $h$ levels, start at a single root. At level $j\ge2$ the children of every node at level $j-1$ induce a copy of the same graph $H_j$. Add one vertex for each root-to-leaf branch, adjacent to all nodes of its branch. There are no edges except those of the sibling graphs and the branch adjacencies. Set $t_j=\chi_f(H_j)$ and define
```math
s_1=1,\qquad s_j=s_{j-1}+\max\{0,1-s_{j-1}/t_j\}.
```
Then the fractional chromatic number of this graph is $\max(\max_{2\le j\le h}t_j,1+s_h)$, with the first maximum omitted at height one.

For the lower bound, consider a branch prefix whose palettes have union $U$ of measure $u$. Among the children in its next sibling graph $H_j$, there is a vertex with $|C_v\cap U|\le u/t_j$. Otherwise all restricted palettes could be scaled by the reciprocal of their minimum measure to give a fractional colouring of $H_j$ of length strictly smaller than $t_j$. The new palette union is therefore at least $u+\max\{0,1-u/t_j\}$. This function is nondecreasing in $u$ because $t_j\ge1$. Starting at the root, one can find a full branch of union measure at least $s_h$. Its branch vertex needs a disjoint palette of measure one. Each $H_j$ is a subgraph, giving the other lower bound.

Conversely, use a palette of length $q=\max(\max_jt_j,1+s_h)$. Give the root any palette of measure one. At each next sibling graph split an optimal palette of length $t_j$ to place length $\min(t_j,s_{j-1})$ within the ancestor union and the rest outside. This fits since $s_{j-1}\le s_h$ and $q\ge t_j$. For every child the palette union along its branch prefix then has measure exactly $s_j$. The complement of any full branch's union has measure at least one and supplies its branch vertex.

For the twincut graph $G_k$, the tree has height $k-1$, and for levels $2\le j\le k-1$ its sibling graphs are copies of $G_j$. Thus $a_k=\chi_f(G_k)$ satisfies $a_1=1$ and $a_{k+1}=a_k+1/a_k$. In detail, $s_1=1=a_2-1$, and if $s_{j-1}=a_j-1$ then $s_j=a_j-1+1/a_j=a_{j+1}-1$. Squaring the recurrence gives $a_{k+1}^2=a_k^2+2+a_k^{-2}$, so $a_k^2=2k+O(\log k)$.

Mohar and Wu give a maximum dichromatic number of order at least $t/\log t$ when $t=\chi_f$. It follows that $\delta(B_k)=\Omega(k/\log k)$ and $\delta(G_k)=\Omega(\sqrt{k}/\log k)$. An Erdős–Neumann-Lara counterexample family would require a different construction. [Mohar–Wu, Theorem 1.3](https://doi.org/10.1017/fms.2016.28)

## Graphs from the counterexample to the Erdős–Hajnal high-girth conjecture

Kohlmeyer and Kruer disproved the high-girth subgraph conjecture using underlying graphs of line digraphs of acyclic graphs. Nguyen and Walczak sharpened the construction to produce graphs of unbounded chromatic number all of whose $C_4$-free subgraphs are 3-colourable. The construction also permits orientations requiring unboundedly many colours to avoid monochromatic directed four-cycles. [Nguyen–Walczak, Theorems 1.3 and 2.1](https://arxiv.org/abs/2609.40192)

Let $D$ be a finite simple digraph partitioned into nonempty sets $V_1,\ldots,V_m$, with all arcs going from a lower to a higher index. Suppose its maximum outdegree is at most $d\ge1$. Write $L(D)$ for the undirected graph of its arcs, adjacent when consecutive in a directed path. Give each vertex of $V_i$ weight $1/|V_i|$. Suppose each independent set of the underlying graph of $D$ has total weight at most $m/T$. For an integer $q\ge1$, assume
```math
|V_i|\ge 4d\log_2(2qd)\sum_{j>i}|V_j|\quad(i<m),
\qquad
t=\left\lceil\log_2(1024qd(d+1))\right\rceil .
```
If $(3/4)T\gt 2^q(q(t-1)+1)$, then $L(D)$ has an orientation in which every $q$-colouring has a monochromatic directed four-cycle.

**Proof.** Orient the edges of $L(D)$ independently at random. Consider a vertex $v$ of $D$ and any choice of colours and a linear order on its outgoing arcs. Call an incoming arc $e$ *compatible* if for some colour with at least $t$ outgoing arcs, its forward edges in the orientation of $L(D)$ to those arcs form a suffix in their order. The signs for the $r$ edges from $e$ to an outgoing block of size $r$ are uniform on $2^r$ possibilities, of which $r+1$ are suffixes. Thus the chance that $e$ is compatible is at most $q(d+1)2^{-t}$.

Fix a layer $V_i$ and fix the choices of colours and orders at vertices in the higher layers. For $u\in V_i$, call $u$ bad if any arc out of $u$ is compatible at its head. The probability of this is at most $dq(d+1)2^{-t}\le2^{-10}$. These events are independent across $u\in V_i$, because different incoming arcs at each junction use disjoint sets of edges of $L(D)$. For $n_i=|V_i|$ the probability of at least $n_i/4$ bad vertices is at most $2^{n_i}(2^{-10})^{n_i/4}=2^{-3n_i/2}$. Over all vertices in higher layers the number of choices of colours and orders is at most $(q^d d!)^{\sum_{j>i}n_j}\le 2^{n_i/4}$. The failure probability on each layer $i<m$ is thus at most $2^{-n_i}$, and these bounds sum to less than one because the $n_i$ are distinct positive integers. The final layer has no bad vertices. Fix an orientation for which every choice of colours and orders at higher layers leaves at least three quarters of each layer good.

Suppose there is a $q$-colouring of the arc vertices with no monochromatic directed four-cycle. For every junction $v$ and every colour, its incoming and outgoing arcs of that colour induce an oriented complete bipartite graph. It is acyclic, since every cyclic orientation of a complete bipartite graph has a directed four-cycle. Choose the order on outgoing arcs of each colour from a topological order of that bipartite digraph, concatenating the orders over the colours. Any incoming arc whose colour appears on at least $t$ outgoing arcs is now compatible at that junction. Retain the good vertices of $D$ for these choices. Their combined weight is at least $(3/4)m$.

At a retained vertex $v$ let $P(v)$ be the set of colours with at least $t$ outgoing arcs in the original $D$. An arc $u\to v$ with both endpoints retained and $P(u)=P(v)$ must have colour outside this common palette. If its colour belonged to the palette at $v$, $u$ would be bad. There are at most $q(t-1)$ arcs of colours outside the tail palette at any tail. Thus on vertices with any one palette the underlying graph has an acyclic orientation of maximum outdegree at most $q(t-1)$ and is $(q(t-1)+1)$-colourable by reverse topological order. Over at most $2^q$ palettes this gives at most $2^q(q(t-1)+1)$ independent sets partitioning the retained vertices. Their total weight cannot reach $(3/4)m$ under the given bound on $T$. This contradiction proves the assertion.

The proof of Nguyen and Walczak's Theorem 2.1 supplies such a base $D$ for arbitrarily large $T$, with $d=O(T^2\log T)$ and the stated weights. Each vertex has at most one arc to each higher layer, and the decay of the layer sizes in their construction can be taken as fast as the separation inequality above requires. Their Lemma 5.3 bounds the weight of independent sets with the same weights. Use the maximum-degree threshold $d+\binom d2$ there for their 3-colourability conclusion on $C_4$-free subgraphs of $L(D)$. Our orientation gives the simultaneous lower bound
```math
\delta(L(D))\ge \log_2 T-2\log_2\log_2 T-O(1),
```
by taking $q=\lfloor\log_2 T-2\log_2\log_2 T-C\rfloor$ for a sufficiently large constant $C$. Meanwhile $\chi_f(L(D))\le4$, since independent fair bits assigned to the base vertices select each arc with probability $1/4$ as a $0$-to-$1$ arc, and these selected arcs always form an independent set of $L(D)$.
