# Bollobás–Erdős–Tuza maximal-independent-set conjecture

## A sublinear upper bound for graphs with no fixed induced biclique

**Theorem.** Fix integers $`s,t\ge2`$ and $`0<c<1`$. Every $`n`$-vertex graph $`G`$ with no induced $`K_{s,t}`$ has a set of size $`O_{c,s,t}(n/\log\log n)`$ meeting every inclusion-maximal independent set of size at least $`cn`$.

In particular, this proves the first assertion of [Erdős #611](https://www.erdosproblems.com/611) for complements of graphs with no induced $`K_{s,t}`$. It also proves the stronger large-maximal-set assertion in [Cooper–Hollars, Conjecture 7.2](https://arxiv.org/html/2607.15486v1#S7.SS2) in this class, without assuming that all maximal independent sets are large. The unrestricted problem stays open.

### 1. A small test for one independent block

Let $`A`$ be an independent set of size at least $`cn/2`$, and write $`d_A(v)=|N_G(v)\cap A|/|A|`$. We construct a set $`T_A`$ of size $`O_{c,s,t}(n/\log\log n)`$ such that every maximal independent set $`I`$ avoiding $`T_A`$ satisfies
```math
|I\cap A|<(c/2)|A|.
```

All logarithms below are natural, and we work at sufficiently large $`n`$. Set $`a_j=(\log n)^{-2(2s)^j}`$. For indices $`j\ge0`$ with $`a_j\ge n^{-1/(4s)}`$, the disjoint degree bands
```math
D_j=\{v\in V(G):a_{j+1}\le d_A(v)<a_j\}
```
number $`\Theta_s(\log\log n)`$: the index inequality is $`2(2s)^j\log\log n\le (\log n)/(4s)`$. One of these bands has size $`O_s(n/\log\log n)`$. Fix such a $`j`$, put $`a=a_j`$ and $`D=D_j`$, and set $`K=\{v:d_A(v)\ge a\}`$. Vertices outside $`K\cup D`$ have $`d_A(v)<a^{2s}`$.

For any independent set $`I`$, each $`s`$-subset of $`A`$ has at most $`t-1`$ common neighbors in $`I`$. Such neighbors cannot belong to the subset itself, and picking $`t`$ would give an induced $`K_{s,t}`$ since both sides are independent. Every $`v\in K`$ is a common neighbor of at least an $`(a/2)^s`$ fraction of the $`s`$-subsets of $`A`$: write the ratio of the two binomial coefficients as a product and use $`a|A|\ge2s`$. Double counting gives
```math
|I\cap K|\le (t-1)(2/a)^s.
```
Let $`L=\lceil(t-1)(2/a)^s\rceil`$ and $`\delta=c/2`$.

Choose a multiset of $`m=\lceil (L+3)\log n/\delta\rceil`$ vertices uniformly and independently from $`A`$, and let $`H`$ be its support. For each subset $`W\subseteq K`$ of size at most $`L`$ with $`|A\setminus N_G(W)|\ge\delta|A|`$, the probability that $`H\subseteq N_G(W)`$ is at most $`(1-\delta)^m\le n^{-L-3}`$. There are at most $`n^{L+1}`$ such $`W`$ to check, so with probability at least $`1-n^{-2}`$, $`H`$ is not contained in any of their neighborhoods. Here and below $`N_G(X)`$ denotes the union of open neighborhoods of vertices of $`X`$.

On the other hand, for every vertex $`v\notin K\cup D`$ the probability of membership in $`N_G(H)`$ is at most $`m d_A(v)<ma^{2s}`$. The expected size of $`N_G(H)\setminus(K\cup D)`$ is at most $`nma^{2s}`$, and with probability at least $`1/2`$ its size is at most twice that. Both desired properties can therefore hold for the same $`H`$. Fix one and take
```math
T_A= H\ \cup\ D\ \cup\big(N_G(H)\setminus(K\cup D)\big).
```
Since $`a\ge n^{-1/(4s)}`$, we have $`m=O_{c,s,t}(n^{1/4}\log n)`$. Since $`a\le(\log n)^{-2}`$, the last term has size $`O_{c,s,t}(na^s\log n)=O_{c,s,t}(n/(\log n)^{2s-1})`$. The medium-degree band dominates the stated total bound.

If a maximal independent set $`I`$ misses $`T_A`$, every $`h\in H`$ must have a neighbor in $`I`$. All such neighbors lie in $`K`$, because $`I`$ avoids both $`D`$ and $`N_G(H)\setminus(K\cup D)`$. Thus $`H\subseteq N_G(W)`$ for $`W=I\cap K`$, and $`|W|\le L`$. The sampling property forces $`|A\setminus N_G(W)|<\delta|A|`$. Independence gives $`I\cap A\subseteq A\setminus N_G(W)`$, as required. This is the step that uses maximality, not maximum cardinality.

### 2. Cover every large maximal independent set

Repeatedly remove disjoint independent blocks $`A_i`$ of size at least $`cn/2`$ until the remaining graph on $`R`$ has independence number less than $`cn/2`$. There are at most $`2/c`$ blocks. Construct each $`T_{A_i}`$ in the original graph, not only in the graph remaining when $`A_i`$ was removed. Their union has size $`O_{c,s,t}(n/\log\log n)`$. A maximal independent set $`I`$ avoiding this union has
```math
|I|\le |I\cap R|+\sum_i |I\cap A_i|
       < cn/2+(c/2)\sum_i |A_i|\le cn.
```
This proves the theorem. The finitely many small orders can be handled by enlarging the implied constant.

### 3. A growing induced biclique is necessary for a linear transversal

Fix $`0<c,\epsilon<1`$. There is an $`\eta=\eta(c,\epsilon)>0`$ such that, for sufficiently large $`n`$, if every transversal for the maximal independent sets of size at least $`cn`$ has at least $`\epsilon n`$ vertices, then $`G`$ contains an induced $`K_{r,r}`$ with $`r=\lfloor(\log n)^\eta\rfloor`$.

Take $`J=\lceil 8/(c\epsilon)\rceil`$ and $`\eta=1/(2J)`$. If $`G`$ has no induced $`K_{r,r}`$, repeat the proof using $`s=t=r`$ and precisely the first $`J`$ bands. For $`0\le j<J`$, the choice $`a_j=(\log n)^{-2(2r)^j}`$ gives
```math
\log(1/a_j)=O_{c,\epsilon}((\log n)^{(J-1)/(2J)}\log\log n).
```
In particular $`a_j|A|\ge 2r`$ for sufficiently large $`n`$. The same definition of $`L`$ gives $`\log(L+1)=O_{c,\epsilon}(\sqrt{\log n}\log\log n)=o(\log n)`$, so the support of the sample has size at most $`m=n^{o(1)}`$. The expected residual neighborhood is $`nma_j^{2r}=o(n)`$: since $`m=O_c((L+3)\log n)`$ and $`a_j\le(\log n)^{-2}`$, we have $`ma_j^{2r}=O_c(r(2a_j)^r\log n+a_j^{2r}\log n)=o(1)`$. The selected degree band costs at most $`n/J`$ vertices per independent block. Thus the transversal has size at most $`2n/(cJ)+o(n)<\epsilon n`$, a contradiction.

Consequently the strong conjecture holds along any graph sequence whose largest induced balanced biclique has side length $`(\log n)^{o(1)}`$. Large bicliques alone are not sufficient for a large transversal: a complete bipartite graph itself has transversal number at most two.

### Prior work and scope

[Cheng and Xu, JGT 109 (2025), 514–517](https://doi.org/10.1002/jgt.23246) ([preprint](https://arxiv.org/abs/2405.18264)) prove a sublinear transversal for **maximum** independent sets under the same induced-subgraph exclusion. The degree-band idea is related to their proof. Their hitting argument replaces vertices to increase the size of a maximum set; it does not hit smaller maximal sets. Here the bounded high-degree part comes from double counting and the hitting argument uses domination of a sample by that part, followed by a decomposition into independent blocks. [Cooper–Hollars](https://arxiv.org/abs/2607.15486) distinguish the two conjectures and prove results for cographs and split graphs. The exact target, its stronger formulation, follow-up references, the induced-biclique terminology, and both repository branches were checked on 26 November 2026; no statement covering all large maximal sets in this class was located in the inspected sources. This is a bounded search, not a priority guarantee. This result does not change the unrestricted status or count as another resolved conjecture. See [tracking issue #830](https://github.com/1337isnot1337/solved-conjectures/issues/830).
