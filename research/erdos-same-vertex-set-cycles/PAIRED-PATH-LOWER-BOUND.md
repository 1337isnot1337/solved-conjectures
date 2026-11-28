# The log-log lower barrier already holds for paired paths

Partial progress on [Erdős #585](https://www.erdosproblems.com/585), not a solution of the two-cycle problem. This adapts the layered random model of [Pyber–Rödl–Szemerédi](https://doi.org/10.1006/jctb.1995.1004), as described in [Janzer–Sudakov, Section 2](https://arxiv.org/html/2204.12455). A related layered union bound appears in [Janzer–Janzer–Steiner–Sudakov](https://doi.org/10.1112/blms.70262). The degree/edge-count argument below excludes bounded-degree subgraphs even with a positive fraction of degree deficit, not just regular subgraphs. No claim of paper priority is made.

**Theorem.** Fix an integer $`D\ge3`$ and a real $`d`$ with $`2D(2D-1)/(D^2+D-1)\lt d\le D`$. For every sufficiently large $`N`$, there is a simple bipartite $`N`$-vertex graph with $`\Omega_{D,d}(N\log\log N)`$ edges and no nonempty subgraph simultaneously of maximum degree at most $`D`$ and average degree at least $`d`$. The host can also be made to have girth tending to infinity.

In particular, with $`D=4,d=3`$, there is no pair of edge-disjoint nontrivial simple paths on the same vertex set. A bipartite witness on $`s`$ vertices would have $`2s-2`$ edges. For $`2\le s\le6`$, this exceeds the bipartite edge maximum $`\lfloor s^2/4\rfloor`$. Thus $`s\ge7`$, yielding average degree $`4-4/s\ge24/7>3`$ and maximum degree at most four. Combining this construction with [Janzer–Sudakov's 4-regular subgraph theorem](https://arxiv.org/abs/2204.12455) determines the extremal order $`\Theta(N\log\log N)`$ for the *relaxation* that asks for a subgraph of maximum degree at most four and average degree at least three. The theorem does not give the same upper bound for paired paths or cycles.

## Model

Put $`r=d/2`$, and $`\kappa=r(D-1)/(D-r)-(D-1)/D>1`$. Choose a fixed $`\alpha`$ with $`0<\alpha<1`$ and $`(1-\alpha)\kappa>1`$, then an integer $`M\ge2/\alpha`$. Start with a side $`B`$ of size $`n`$. For each integer $`j`$ with $`(\log n)^{1/4}\le M^j\le(\log n)^{1/2}`$, let $`h_j=M^j`$ and put $`|A_j|=n_j=\lfloor n\exp(-h_j)\rfloor`$ on the other side. Every vertex of $`B`$ independently selects one uniformly random neighbour in each layer $`A_j`$. Write $`J`$ for the number of layers. The host has exactly $`nJ`$ edges, $`J=\Theta_M(\log\log n)`$, and $`n+o(n)`$ vertices. In particular $`\sum_j n_j\le2n e^{-\min_j h_j}`$ for all sufficiently large $`n`$: after the first term the ratios of the bounding terms $`n e^{-h_j}`$ are at most $`1/2`$.

## Any candidate must use many edges on the large-layer side of the transition

One can discard isolated vertices from a hypothetical subgraph $`H`$ without decreasing its average degree. Let $`b=|V(H)\cap B|\ge1`$ and let $`a_j,m_j`$ count its vertices, respectively its edges, in layer $`j`$ (edges are assigned to their unique $`A_j`$ end). Put $`a=\sum a_j`$, $`m=\sum m_j`$. Then

```math
r(a+b)\le m\le D\min(a,b), \qquad a_j\le m_j\le\min(b,D a_j).
```

In particular $`a\le(D/r)b`$, and $`b\le((D-r)/r)a`$, so $`L=\log(n/b)\ge\min_j h_j-O_{D,r}(1)`$ uniformly over feasible profiles. This lower bound on $`L`$ tends to infinity faster than $`J`$.

Call a layer early at $`h_j\le\alpha L`$, late at $`h_j\ge2L`$, and intermediate otherwise. There is at most one intermediate layer, since two consecutive $`h_j`$ differ by a factor of $`M\ge2/\alpha`$. The intermediate layer contributes at most $`b`$ edges. In fact its contribution to $`m-a`$ is at most $`(1-1/D)b`$, since $`a_j\ge m_j/D`$. The late layers contribute at most $`2D n e^{-2L}=2D b e^{-L}`$ edges, by the size bound and the maximum degree on their $`A`$ vertices. Also

```math
m-a\ge rb+(r-1)a
\ge rb+(r-1)\frac{r}{D-r}b
=(\kappa+(D-1)/D)b.
```

The second inequality uses $`r>1`$ and $`a\ge rb/(D-r)`$. Consequently

```math
\sum_{\text{early }j}(m_j-a_j)
\ge m-a-(1-1/D)b-2Db e^{-L}\ge(\kappa-o(1))b.
```


## Uniform first moment

For fixed $`b,(a_j),(m_j)`$, union bound over the $`b`$ vertices of $`B`$, the $`a_j`$ selected vertices of $`A_j`$, and which $`m_j`$ of the selected vertices of $`B`$ must send their layer-$`j`$ edges into that $`A_j`$ subset. Since the choices from distinct pairs (vertex of $`B`$, layer) are independent, the probability is at most

```math
\binom nb\prod_j\binom{n_j}{a_j}\binom b{m_j}(a_j/n_j)^{m_j}
\le \exp\big(bL+O_D(b\log(J+2))\big)
\prod_{j:a_j>0}(a_j/n_j)^{m_j-a_j}.
```

A layer with $`a_j=m_j=0`$ contributes one. To check the exponential overhead, use $`\binom{n_j}{a_j}\le(e n_j/a_j)^{a_j}`$, $`\sum a_j=O_D(b)`$, and
$`\sum_{m_j>0}m_j\log(e b/m_j)\le m\log(eJb/m)`$ by concavity, with $`m\le Db`$. Every remaining product factor is at most one since $`m_j\ge a_j`$. For an early nonempty layer, $`n_j\ge(n/2)e^{-h_j}`$ and $`a_j=O_D(b)`$, so

```math
\log(n_j/a_j)\ge(1-\alpha)L-O_D(1).
```

Use the early deficit lower bound to see that the probability for this profile is at most $`\exp(-\gamma bL)`$ for some $`\gamma>0`$ and all sufficiently large $`n`$, uniformly over feasible profiles; here $`(1-\alpha)\kappa>1`$ supplies the fixed margin in the exponent. There are at most $`((D+1)(b+1))^{2J}`$ profiles for fixed $`b`$, whose logarithm is $`O_D(Jb)=o(bL)`$. Absorb this and sum over $`b\ge1`$, using $`L\ge\min_j h_j-O_{D,r}(1)`$. A geometric series shows that the probability of any forbidden subgraph is $`o(1)`$.

## Enforcing girth without changing the density order

For length $`2k`$, first choose the $`k`$ ordered vertices in $`B`$, then the layer and identity of each of the $`k`$ vertices on the other side. The expected number of cycles is at most

```math
n^k\left(\sum_j \frac1{n_j}\right)^k.
```

Indeed each chosen opposite vertex has two prescribed edges, costing $`n_j^{-2}`$ in its layer, while its identity has $`n_j`$ choices. Restrict this count to distinct vertices and distinct choices from every pair (vertex of $`B`$, layer); if a simple cycle would demand two different neighbours from the same pair, its probability is zero. For $`k\le(\log n)^{1/4}`$ the displayed bound is $`\exp(O((\log n)^{3/4}))`$, using $`n/n_j\le2\exp((\log n)^{1/2})`$. Summing over these lengths gives $`n^{o(1)}`$ in expectation. By Markov, with probability $`1-o(1)`$ one can remove at most $`n^{1/2}`$ edges to kill all such cycles. Deleting edges cannot create a forbidden subgraph. Finally take $`n=\lfloor N/2\rfloor`$ and add isolated vertices up to order $`N`$. This proves the theorem.

The lower bound for the *seed* means a linear-density existence theorem for two paths cannot replace the hard part of the [paired rotation program](DISJOINT-RESERVE-ROTATIONS.md). What remains is an upper bound for seeds at the log-log scale and a compatible double closure, or a different attack on the original cycle question.

## A sharp weaker theorem: bounded-degree tree packing

For every fixed $`k\ge2`$ and $`D\ge2k`$, the smallest edge count that forces $`k`$ edge-disjoint trees on the same nontrivial support, with their union of maximum degree at most $`D`$, is $`\Theta_{k,D}(N\log\log N)`$.

For the lower bound, choose $`d`$ strictly between $`2D(2D-1)/(D^2+D-1)`$ and four, which is possible since the former is less than four. A union on $`s`$ vertices has average degree $`2k(1-1/s)`$. It also contains a cycle since it has $`k(s-1)>s-1`$ edges, so in the large-girth hosts above any such union must have $`s`$ at least the girth. This makes its average degree greater than $`d`$, which is forbidden.

For the upper bound, Janzer–Sudakov give a nonempty $`2k`$-regular subgraph $`G_0`$. In $`G_0`$ choose an inclusion-minimal vertex set $`S`$ of size at least two inducing at least $`k(|S|-1)`$ edges; the whole vertex set qualifies. Keep exactly $`k(|S|-1)`$ edges in $`S`$. Every subset $`T\subseteq S`$ now spans at most $`k(|T|-1)`$ edges for $`|T|\ge1`$, by minimality for proper sets and construction for $`S`$. The [Nash-Williams forest covering theorem](https://dwest.web.illinois.edu/regs/arbrat.html) partitions these edges into $`k`$ forests on $`S`$. Each has at most $`|S|-1`$ edges, so all attain that bound and are trees spanning $`S`$. The union has maximum degree at most $`2k\le D`$. Since each of the other spanning trees contributes at least one edge incident to every vertex, an individual tree in this upper-bound construction has maximum degree at most $`2k-(k-1)=k+1`$. In particular, the case of two trees is sharp even when each is required to be subcubic and their combined maximum degree is at most four. Reducing the individual degree bound from three to two is the unresolved branching-to-paths step.

For $`k=2`$, a minimal common-support path pair is more specific than an arbitrary two-tree packing. Its union has fewer than $`2(|T|-1)`$ edges on every proper $`T`$ with at least two vertices: if equality held, the restrictions of both paths to $`T`$ would be connected spanning subpaths and give a smaller seed. Thus the union is a generic rigidity circuit that decomposes into two Hamilton paths. [Balanced generic circuits without long paths](https://doi.org/10.1016/j.disc.2012.03.031) gives nondecomposable examples, so finding a circuit by the arboricity argument does not itself suffice.
