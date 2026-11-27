# A square-root gap for normalized algebraic connectivity and its complement

There is an absolute constant $`c>0`$ such that every simple graph $`G`$ on $`n\ge3`$ vertices satisfies
```math
\lambda_2(G)+\lambda_2(\overline G)\le 2-\frac{c}{\sqrt n}.
```
Here $`\lambda_2`$ is the second-smallest eigenvalue of the normalized Laplacian $`D^{-1/2}(D-A)D^{-1/2}`$, taking an inverse square root of zero to be zero. This is the positive square-root gap intended by Conjecture 2 of Kempton, Zaitzeff and Muthuprakash, whose display uses a subtracted big-O term. Their Proposition 8 already furnishes an even-order focus family whose gap is asymptotic to $`\sqrt{2/n}`$, proving that the exponent is optimal. We do not determine the best constant or classify extremizers. [Primary problem, §4.2](https://arxiv.org/pdf/2606.12751v1#page=14)

## Finite orders and connectivity

If either graph is disconnected, its normalized Laplacian has second eigenvalue zero, as isolated vertices give zero rows and each connected component gives a nullvector. The other graph has normalized Laplacian trace at most $`n`$, hence second eigenvalue at most $`n/(n-1)\le3/2`$ for $`n\ge3`$. At order two the pair consisting of the edge and the empty graph has sum two.

Suppose both graphs are connected, and put $`\theta=1-\lambda_2(G)`$ and $`\beta=1-\lambda_2(\overline G)`$. Both are nonnegative: each graph contains two nonadjacent vertices and their principal submatrix in normalized adjacency is zero, so its second-largest eigenvalue is at least zero. With $`d`$ the degree column and $`s=\sum_i d_i`$, the top eigenvector of normalized adjacency is proportional to $`D^{1/2}\mathbf1`$. All remaining eigenvalues are at most $`\theta`$. Congruence by $`D^{1/2}`$ gives
```math
H=\theta D+(1-\theta)dd^{\mathsf T}/s-A\succeq0 .
```
If $`\theta=0`$ and $`i,j`$ are nonadjacent, then $`w=e_i-(d_i/d_j)e_j`$ has $`w^{\mathsf T}Hw=0`$ and therefore $`Hw=0`$. Their nonempty adjacency columns are positive multiples of each other, hence identical. Thus nonadjacency together with equality is an equivalence relation, and $`G`$ is complete multipartite. Connectedness requires at least two parts and its complement is disconnected, a contradiction. In particular the sum is strictly less than two at every fixed admissible order.

It now suffices to exclude a sequence of pairs of connected complementary graphs with $`n\to\infty`$ and $`(\theta+\beta)\sqrt n\to0`$. If the infimum of the scaled gap over all orders were zero, the strict finite-order gaps and the disconnected bound would give exactly such a sequence. All $`o(1)`$ estimates below are along the purported sequence. This compactness argument yields an absolute positive constant without assigning it a numerical value.

## Simultaneous estimates for adjacency rows

Let $`P`$ be the orthogonal projection onto the complement of the span of $`\mathbf1,d`$. Complementary degrees are $`(n-1)\mathbf1-d`$, so the same projection works for both graphs. Define $`\bar H`$ from $`\overline G`$ as above and $`L=1+n(\theta+\beta)=o(\sqrt n)`$. Since $`A+\bar A=J-I`$, on the range of $`P`$ we have
```math
0\preceq PHP\preceq P(H+\bar H)P=P(I+\theta D+\beta\bar D)P\preceq LP .
```
For each vertex $`i`$, positive-semidefinite Cauchy–Schwarz against unit vectors in the range of $`P`$ gives $`\|PHe_i\|^2\le L H_{ii}`$. Using $`P d=0`$ and $`H_{ii}\le \theta d_i+d_i^2/s`$ yields the uniform bound
```math
\frac{\|PAe_i\|}{\sqrt{d_i}}
 \le \theta\sqrt{d_i}+\sqrt{L\bigl(\theta+d_i/s\bigr)} .
\tag{1}
```
It holds also for complementary neighborhoods with their own degrees, volume and $`\beta`$. In particular $`\theta\sqrt n=o(1)`$ and $`L\theta=o(1)`$, and likewise for $`\beta`$.

The normalized Laplacian cut test used below is
```math
\lambda_2(F)\le e_F(S,S^c)\left(\frac{1}{\mathrm{vol}_F(S)}+
                         \frac{1}{\mathrm{vol}_F(S^c)}\right).
\tag{2}
```
It follows by inserting a function constant on each side of the cut, with degree-weighted mean zero, in the Rayleigh quotient. We apply it only to connected graphs with both volumes positive.

Pass to a subsequence on which $`s/n^2`$ converges. Exchanging the graph and its complement if necessary, it suffices to treat a limit in $`(0,1)`$ or a zero limit.

## Both graph densities have positive limits

In this case (1) is $`o(1)`$ uniformly over **all** vertices in **both** graphs, because $`s,\bar s`$ are bounded below by a positive multiple of $`n^2`$. At least one row $`U=N(i_0)`$ has size bounded away from both zero and $`n`$ as a proportion of $`n`$. Otherwise a subsequence would split all vertices into those of degree at most $`o(n)`$ and those of degree at least $`n-o(n)`$, uniformly. The density limit forces both classes to have size proportional to $`n`$. The first class permits only $`o(n^2)`$ cross edges and the second forces all but $`o(n^2)`$ of the possible cross edges, a contradiction.

Write $`q_U=(\mathbf1_U-(|U|/n)\mathbf1)/\|\mathbf1_U-(|U|/n)\mathbf1\|`$ for the unit centered indicator. Its entries are uniformly $`O(n^{-1/2})`$ and the centering denominator is of order $`\sqrt n`$. By (1), $`q_U`$ is within $`o(1)`$ in Euclidean norm of the centered degree line (the span of $`d-(s/n)\mathbf1`$), which is therefore nonzero. Choose its unit vector $`q`$ with $`\|q-q_U\|=o(1)`$.

A row supported on $`b=o(n)`$ vertices has unit indicator with constant projection of magnitude $`\sqrt{b/n}=o(1)`$ and inner product with $`q_U`$ of magnitude $`O(\sqrt{b/n})=o(1)`$. Its projection onto $`q`$ is also $`o(1)`$. Its projection onto the range of $`P`$ thus has norm tending to one, contradicting (1). The same applies to a small complement row. After passing to a subsequence if needed, **all** original degrees therefore lie between $`\epsilon n`$ and $`(1-\epsilon)n`$ for one $`\epsilon>0`$.

Every unit centered row indicator is now uniformly $`o(1)`$ from either $`q_U`$ or $`-q_U=q_{U^c}`$, again by (1) and the uniform lower bound on centering denominators. For sets of densities in $`[\epsilon,1-\epsilon]`$, distinct membership at one coordinate contributes at least a fixed positive multiple of $`1/n`$ to the squared distance of their unit centered indicators: at that coordinate one entry is positive and the other negative, both of magnitude at least a fixed multiple of $`1/\sqrt n`$. Consequently every row differs in $`o(n)`$ places, uniformly, from either $`\mathbf1_U`$ or $`\mathbf1_{U^c}`$.

Set $`s_j=1`$ on $`U`$ and $`-1`$ off $`U`$, and choose $`r_i\in\{-1,1\}`$ according to this row choice. The matrix with entries $`(1+r_i s_j)/2`$ differs from $`A`$ in $`o(n^2)`$ entries. By symmetry of $`A`$, it has at most $`o(n^2)`$ ordered asymmetric entries. Its entries at $`ij`$ and $`ji`$ disagree precisely when $`r_i s_i\ne r_j s_j`$. If $`m`$ of these products are positive, then $`2m(n-m)=o(n^2)`$. Hence, after choosing one overall sign, $`r_i=\pm s_i`$ for all but $`o(n)`$ indices. Up to $`o(n^2)`$ entries, either the graph or its complement is now the union of the two cliques on $`U,U^c`$ (diagonal entries have at most $`O(n)`$ effect). Their cut has $`o(n^2)`$ edges and both sides have volume of order $`n^2`$. Formula (2) gives a normalized connectivity tending to zero, contradicting that both tend to one.

## One graph has density tending to zero

Let $`\mu=s/n=o(n)`$ and $`\delta=\min_i d_i\ge1`$. Choose $`C=C_n\to\infty`$ so slowly that $`C\mu/n\to0`$ and $`CL/n\to0`$; for instance take the square root of the smaller of $`n/\mu,n/L`$. Call the vertices with $`d_i\le C\mu`$ typical. All but $`o(n)`$ are typical by the degree sum, and their degrees are uniformly $`o(n)`$. For a typical vertex, $`Ld_i/s\le LC/n=o(1)`$, so (1) is again uniformly $`o(1)`$.

The unit neighborhood indicator of a typical vertex has constant component $`\sqrt{d_i/n}=o(1)`$. It is thus within $`o(1)`$ of one of the two unit vectors on the centered degree line. This line cannot be zero. All typical rows choose the same sign: two nonnegative unit vectors have nonnegative inner product and cannot be close to opposite unit vectors. Fix the neighborhood $`U`$ of a minimum-degree vertex, which is typical. All typical unit indicators are uniformly $`o(1)`$ from $`\mathbf1_U/\sqrt\delta`$.

For two sets with sizes $`a,b`$, the inner product of their unit indicators is at most $`\sqrt{\min(a,b)/\max(a,b)}`$. Therefore, uniformly on the typical vertices, $`d_i=(1+o(1))\delta`$ and $`|N(i)\cap U|=(1-o(1))\delta`$. Summing the latter yields at least $`(1-o(1))n\delta`$ incidences into $`U`$. Thus $`\sum_{u\in U}\bar d_u=o(n\delta)`$. Markov's inequality gives a subset $`U_0\subseteq U`$ with $`|U_0|=(1-o(1))\delta`$ on which $`\bar d_u=o(n)`$ uniformly; use the square root of the average missing incidence fraction as threshold. In particular $`U_0`$ is nonempty eventually.

For the dense complement, (1) is uniformly $`o(1)`$ at every vertex. Each unit complement neighborhood of a vertex of $`U_0`$ has negligible constant component and hence is close to the same centered degree line. Nonnegativity forces its sign to agree with $`\mathbf1_U/\sqrt\delta`$. The size-and-overlap argument again gives $`\bar d_u=(1+o(1))\delta`$ and $`|N_{\bar G}(u)\cap U|=(1-o(1))\delta`$ uniformly on $`U_0`$. Removing $`U\setminus U_0`$ loses $`o(\delta)`$ vertices. Thus the complement cut of $`U_0`$ has size $`o(\mathrm{vol}_{\bar G}(U_0))`$. Its complement has volume of order $`n^2`$, because $`\mathrm{vol}_{\bar G}(U_0)=O(\delta^2)=o(n^2)`$. Formula (2) gives $`\lambda_2(\bar G)=o(1)`$, again a contradiction. This proves the theorem.

## Provenance

Cinna's repository [tracking record #495](https://github.com/1337isnot1337/solved-conjectures/issues/495) announced the result and specified the simultaneous degree-projected row inequalities and complement-cut contradictions in sparse and positive-density regimes. This manuscript was reconstructed in the WadeDavis research session from that description after a complete earlier proof artifact was not located. It preserves the original argument's attribution and does not assume that these reconstructed details reproduce the missing manuscript verbatim. The authors of the original conjecture supplied the sharpness construction. The reconstructed manuscript passed a separate [internal mathematical review](REVIEW.md).
