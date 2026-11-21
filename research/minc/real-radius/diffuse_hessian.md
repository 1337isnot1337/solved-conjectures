# Real van der Waerden radius

Let $J_N$ have every entry $1/N$ and define $P_N(B)=\mathop{\mathrm{per}}(J_N+B)/(N!/N^N)$ for centered real matrices (all line sums zero). Write $F_N(B)=\det(I-B^TB)^{-1/2}$. Suppose $\|B_N\|_F$ is bounded, $\|B_N\|_{\rm op}\le\rho<1$, and the largest Euclidean norm of a row or column tends to zero as $N\to\infty$. For $j=0,1,2$,
```math
 \sup_{E\text{ centered},\ \|E\|_F=1}
 \left|\frac{d^j}{dz^j}\big[P_N(B_N+zE)-F_N(B_N+zE)\big]_{z=0}\right|\longrightarrow0.       \tag{1}
```
In particular, the Hessian of $P_N$ has least eigenvalue at least $(1+\rho)^{-2}-o(1)$ on the full centered space. The perturbation $E$ may concentrate on a fixed number of rows. No entrywise positivity assumption enters the proof.

[McCullagh](https://arxiv.org/abs/1205.5723) introduced the determinant approximation. The [Hilbert–Schmidt limit](hilbert_schmidt_limit.md) above established the value comparison here, and the [small-operator perturbation estimate](small_operator_perturbations.md) gave unrestricted Hessians when the centered operator norm tends to zero. Differentiating a value estimate only along diffuse perturbations would give less than (1).

## Two marked edges

Apply the [centered partition formula](small_operator_perturbations.md) to the sum $\sigma_h(B+zE)$ of all subpermanents of order $h$. For fixed $h$ it sums labeled bipartite multigraph contractions, with minimum degree at least two. In the coefficient of $z^j$, exactly $j$ edges carry the label $E$ and the rest carry $B$. A vertex of degree at least three must therefore meet an edge carrying $B$ when $j\le2$. Its contraction tends to zero uniformly in $E$. Indeed, orient the graph so that this vertex is on the left. First sum at each right vertex using Hölder, bounding the product by the product of the incident row norms. The resulting left sums factor. At the selected vertex bound the chosen $B$ row norm in the maximum norm, leaving at least two incident factors estimated in their Euclidean norms. All remaining edges cost at most their Frobenius norms, by the same Hölder estimate. Reversing the graph uses the maximum column norm when needed.

What survives consists of alternating cycles, including double edges. For $M=B+zE$ their exponential generating series in the total number of labels is
```math
 \exp\!\left(\sum_{a\ge1}\frac{w^{2a}}{2a}
              \mathop{\mathrm{tr}}((M^TM)^a)\right)=F_N(wM).
```
An alternating cycle with $2a$ labels has color-preserving symmetry factor $2a$, including the two edge orders of a double edge. Its two partition Möbius signs multiply to $+1$. Taking the coefficient of $z^j$ assigns its $j$ perturbation edges automatically. Thus the fixed $[w^hz^j]$ coefficients of $P_N(wM)$ and $F_N(wM)$ differ by $o(1)$ uniformly in $E$. The normalization $N^h/(N)_h$ in $P_N$ tends to one in each fixed degree.

Choose $R>1$ and $s>0$ so that $R(\rho+s)<1$. On $|w|\le R$, $|z|\le s$ the complex coefficient estimate for the permanent gives uniform bounds, taking its geometric ratio strictly below $1/R$ before scaling by $w$. [Coefficient bound](hilbert_schmidt_limit.md), [complex extension](small_operator_perturbations.md). For the determinant use the displayed exponential series with the ordinary transpose, since it continues the real formula holomorphically. Its trace terms have absolute values at most $\|M\|_F^2\|M\|_{\rm op}^{2a-2}$. Cauchy estimates in both variables now bound the $w$ tails of each of the first three $z$ coefficients geometrically at $w=1$. This proves (1).

For the curvature set $K=\left(\begin{smallmatrix}I&B\\B^T&I\end{smallmatrix}\right)$ and $V=\left(\begin{smallmatrix}0&E\\E^T&0\end{smallmatrix}\right)$. The Hessian of $\log F_N=-\tfrac12\log\det K$ on $E$ equals $\tfrac12\|K^{-1/2}VK^{-1/2}\|_F^2\ge\|E\|_F^2/(1+\rho)^2$. Since $F_N\ge1$ and exponentiation adds a nonnegative squared derivative, (1) gives the claimed curvature of $P_N$. The argument concerns diffuse bases and does not give Sinkhorn's unrestricted radius. [Problem 13](https://yair-lavi.com/mincs-list/problem-13/index.html)
