# Chollet’s conjecture for graph Laplacians

For the ordinary Laplacian $L$ of every finite undirected simple graph and every principal submatrix $B=L[S,S]$,
$$
 \operatorname{per}(B\circ B)\le\operatorname{per}B\prod_{i\in S}B_{ii}.               \tag{1}
$$
Consequently the ordinary two-matrix Chollet comparison holds for graph Laplacians, including different graphs on the same vertex set, by Cauchy–Schwarz on permutation monomials and the PSD diagonal-product bound. Equation (1) answers the stronger graph-Laplacian question in Section 6 of [Pant and Singh](https://arxiv.org/html/2604.24192v2#S6). The named [Minc entry, Conjecture 30](https://yair-lavi.com/mincs-list/conjecture-30/), asks for all PSD matrices, so this theorem contributes zero unrestricted resolutions.

## Blocks of minimum degree two

Let $H$ be a simple graph of minimum degree at least two, let $d_i$ be its degrees, and normalize any principal submatrix of its Laplacian by its diagonal to get a correlation matrix $A$ on $S$. Its squared off-diagonal moduli on edges are $w_{ij}=1/(d_id_j)$. Write $E_S$ for the induced edges. The proof below uses only positive semidefiniteness and these moduli.

For each matching of the induced graph, Lieb's principal-block inequality gives $\operatorname{per}A\ge\prod_{ij\text{ matched}}(1+w_{ij})$. Assign independent continuous priorities to the edges of $H$ and select each edge having smaller priority than every edge with a common endpoint. This gives a matching in $H$, whose restriction is a matching on $S$. An edge $ij$ is selected with probability $1/(d_i+d_j-1)$. Averaging the logarithmic bound gives
$$
 \log\operatorname{per}A\ge\sum_{ij\in E_S}\frac{\log(1+w_{ij})}{d_i+d_j-1}.        \tag{2}
$$

A permutation term in $\operatorname{per}(A\circ\bar A)$ is a collection of disjoint transpositions and directed simple cycles of length at least three. Dropping disjointness, taking logarithms, and using $\log(1+x)\le x$ gives
$$
 \log\operatorname{per}(A\circ\bar A)
 \le\sum_{e\in E_S} w_e^2
       +2\sum_{\gamma}\prod_{v\in\gamma}d_v^{-2}.                                    \tag{3}
$$
The sum uses each unoriented simple cycle in $H[S]$ once, including cycles with chords. The weight follows because each vertex on a cycle appears in two edge denominators.

Define the edge surplus and the vertex weight by
$$
 s_{ij}=\frac{\log(1+w_{ij})}{d_i+d_j-1}-w_{ij}^2,\qquad a_i=\frac{d_i-1}{d_i^2}\le\frac14 .
$$
The following edge estimate is the needed local comparison:
$$
 b_{ij}:=\frac{d_i+d_j-2}{2}s_{ij}\ \ge\ \frac{a_i a_j}{6}.                       \tag{4}
$$
Indeed $\log(1+w)\ge w-w^2/2$ implies
$$
 b_{ij}\ge w_{ij}^2\frac{d_i+d_j-2}{2(d_i+d_j-1)}
            \big[(d_i-1)(d_j-1)-\tfrac12\big].
$$
The fraction is at least $1/3$ and the bracket is at least $\tfrac12(d_i-1)(d_j-1)$. In particular all surpluses are nonnegative.

Consider a simple cycle $\gamma$ of length $l\ge3$. For an oriented edge $i\to j$ of that cycle, start at that edge and continue a walk by choosing uniformly among all neighbors other than the preceding vertex. The probability of following this cycle up to its first return to $i$ is
$$
 p_{i\to j}(\gamma)=\prod_{v\in\gamma\setminus\{i\}}(d_v-1)^{-1}.
$$
For fixed $i\to j$ the events of following different simple cycles in this way are disjoint, even when their lengths differ. A simple cycle returns to its starting vertex exactly at its end. Thus their probabilities sum to at most one in the ambient graph, and the same upper bound holds using only cycles in $H[S]$.

Pool the following contributions to $\gamma$ from its edges:
$$
 \sum_{ij\in\gamma}\frac{p_{i\to j}(\gamma)+p_{j\to i}(\gamma)}2\,s_{ij}
 = \frac{\sum_{ij\in\gamma} b_{ij}}{\prod_{v\in\gamma}(d_v-1)}.                       \tag{5}
$$
For each edge of $\gamma$, $a_i a_j\ge4^{l-2}\prod_{v\in\gamma}a_v$ since every other factor is at most $1/4$. Hence (4) gives
$$
 \sum_{ij\in\gamma} b_{ij}\ \ge\ \frac{l4^{l-2}}6\prod_{v\in\gamma}a_v
 \ \ge\ 2\prod_{v\in\gamma}a_v .
$$
The last inequality includes the limiting coefficient at $l=3$. Consequently (5) dominates the full weight $2\prod_{v\in\gamma}d_v^{-2}$ in (3). Summing over cycles spends at most $s_{ij}$ from each edge, by the disjoint first-return events in each of its two orientations. The right side of (3) is therefore at most the right side of (2). This proves (1) on every principal submatrix of the Laplacian of $H$, after undoing the diagonal normalization.

## Bridges, cut vertices and isolated vertices

Each two-connected block on at least three vertices has internal minimum degree at least two, so its own Laplacian satisfies the hereditary strong comparison just proved. A bridge is a copy of $K_2$; its Laplacian and every principal submatrix satisfy the strong comparison directly. Isolated vertices give a zero diagonal.

Pant and Singh's Theorem 4.3 proves that a one-point sum of hereditarily strong real PSD matrices is hereditarily strong. In the one-point sum the diagonal entries at the identified vertex add. This is exactly how ordinary graph Laplacians combine along the block-cut tree. Apply their theorem repeatedly and use multiplicativity on connected components to obtain (1) for every finite simple graph. [Pant and Singh, Sections 4–5](https://arxiv.org/html/2604.24192v2#S4)

## Scope and prior work

The published inputs are Lieb's permanent inequality and the hereditary one-point-sum theorem. Pant and Singh's paper proves the strong comparison for graphs assembled from bipartite blocks and cycles, and the ordinary comparison also for complete blocks. It asks the unrestricted simple-graph question explicitly. Searches for the all-graph conclusion, Laplacian Hadamard squares and nonbacktracking bounds found that paper and graph-specific extremal results. Priority remains subject to independent literature review. The present proof uses unit edge weights; arbitrary weighted graphs are a separate question. [Lieb](https://www.jstor.org/stable/24901474), [Pant and Singh, concluding question](https://arxiv.org/html/2604.24192v2#S6)

The [exact replay](verify_laplacians.py) checks the assignment of each simple cycle to its oriented edges using rational first-return probabilities and the rational lower estimate in (4). It also compares the permanents directly for the test graphs and their one-vertex deletions.
