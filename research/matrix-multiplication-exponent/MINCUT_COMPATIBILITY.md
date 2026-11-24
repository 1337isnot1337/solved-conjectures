# Compatibility of the scalar countermodel with minimum-cut bounds

**Research status.** This note proves an additional property of the scalar model used in the auxiliary-party audit. It shows that adding all graph min-cut inequalities of the form stated below still does not remove the equilateral `9/4` witness. It does not construct a tensor spectral point and does not determine the matrix multiplication exponent. No claim of novelty is made.

## A finite metric theorem

Let `V` be a nonempty finite vertex set, let `x_v` be a point in a finite-dimensional real Euclidean space for each `v in V`, and let `w_uv >= 0` be an undirected edge weight for each unordered pair of distinct vertices. Zero weights allow absent edges. Write

```math
d(u,v)=\lVert x_u-x_v\rVert,
\qquad L_w(d)=\sum_{\{u,v\}\subseteq V}w_{uv}d(u,v).
```

Let `P` be a terminal subset with at least two labels, allowing their positions to coincide. Define its terminal min-cut value by

```math
\lambda_P(w)=\min\left\{
\sum_{u\in S,\ v\notin S}w_{uv}:
S\subseteq V,\ S\cap P\ne\varnothing,\ P\setminus S\ne\varnothing
\right\}.
```

Each crossing edge is counted once in this expression. Define the scalar unit charge

```math
g(P)=2\max_{\mu\in\Delta(P)}
\sum_{i,j\in P}\mu_i\mu_jd(i,j).
```

**Theorem.** For every such graph, positions, and terminal set,

```math
L_w(d)\ge\lambda_P(w)g(P).
```

For an empty or singleton terminal set, `g(P)=0`, so the same inequality is interpreted as trivial without defining a terminal min-cut.

## Proof

Fix a probability distribution `mu` on `P`. First consider an arbitrary real-valued function `y` on `V`. For each real threshold `t`, put

```math
S_t=\{v\in V:y_v\le t\},\qquad
m_t=\sum_{i\in P\cap S_t}\mu_i,\qquad
c_t=\sum_{u\in S_t,\ v\notin S_t}w_{uv}.
```

If `0<m_t<1`, both sides of this cut contain a terminal, so `c_t>=lambda_P(w)`. Since `4m_t(1-m_t)<=1`, it follows that

```math
4\lambda_P(w)m_t(1-m_t)\le c_t.
```

If `m_t` is zero or one, the left side is zero and the same inequality holds. Integrate in `t`. All functions vanish outside the finite range of the vertex coordinates, apart from irrelevant endpoint choices. The elementary threshold identities are

```math
\int_{\mathbb R}c_t\,dt
=\sum_{\{u,v\}}w_{uv}|y_u-y_v|,
```

and

```math
\int_{\mathbb R}2m_t(1-m_t)\,dt
=\sum_{i,j\in P}\mu_i\mu_j|y_i-y_j|.
```

For the second identity, two independent terminal samples with law `mu` lie on opposite sides of the threshold with probability `2m_t(1-m_t)`; integrating their separation indicator gives their coordinate distance. Thus

```math
2\lambda_P(w)\sum_{i,j\in P}\mu_i\mu_j|y_i-y_j|
\le\sum_{\{u,v\}}w_{uv}|y_u-y_v|.
```

Now take `y_v=<Z,x_v>`, where `Z` is a standard Gaussian vector in the ambient Euclidean space. For each vector `z`,

```math
\mathbb E|\langle Z,z\rangle|
=\sqrt{\frac{2}{\pi}}\,\lVert z\rVert.
```

Indeed, the scalar product is a centered normal random variable of variance `norm(z)^2`; integrating the one-dimensional normal density gives the displayed absolute first moment. All sums are finite. Taking expectations in the previous inequality and cancelling the positive factor `sqrt(2/pi)` yields

```math
2\lambda_P(w)\sum_{i,j\in P}\mu_i\mu_jd(i,j)
\le L_w(d).
```

Maximize over the compact probability simplex to obtain the theorem. The argument also covers `lambda_P(w)=0` and coincident positions. End of proof.

The proof uses only a nonnegative integral representation by cut metrics. It therefore applies to every finite metric with such a representation, including distances inherited from an `L1` space. The Euclidean case is all that the present countermodel needs.

## Tensor relevance and its limit

For a weighted graph tensor, a normalized spectral point evaluates its product of wires by

```math
\log_2 F\!\left(\bigotimes_{\{u,v\}}W_{uv}(q_{uv})\right)
=\sum_{\{u,v\}}(\log_2q_{uv})d_{uv}.
```

If a graph tensor has an asymptotic restriction to a diagonal tensor on a terminal set `P` at rate `lambda`, monotonicity gives the necessary scalar inequality `sum w_uv d_uv >= lambda g(P)`. The finite metric theorem proves that the Euclidean charge model satisfies every such inequality whose rate is at most the terminal min-cut value. This statement is purely a compatibility check; it does not assert that every terminal min-cut rate is achievable as a tensor distillation rate.

For the case `P=V`, the all-party weighted graph subrank formula is an imported result: Zhou, *Asymptotic Rank of Weighted Graph Tensors via Completely Positive Bounds*, [arXiv:2610.34273v3, Theorem B.5](https://arxiv.org/html/2610.34273v3), proves that the base-two logarithm of weighted graph asymptotic subrank equals the weighted minimum cut over every field. Zhou credits Vrana and Christandl, Theorem 1 and Section 3 of the reference numbered 50, for the earlier logarithmically weighted minimum-cut formula in entanglement conversion. In this case the necessary inequality is

```math
\sum_{\{u,v\}}w_{uv}d_{uv}\ge
\mathop{\mathrm{MinCut}}(w)\,g(V).
```

The Euclidean model satisfies this inequality for every finite graph and every nonnegative choice of weights, not only for trees.

## Consequence for the auxiliary-party audit

Take the original three positions to be an equilateral Euclidean triangle of side `3/4`. Its scalar unit charge is

```math
g(\{A,B,C\})
=2\cdot\frac34\max_{\mu}
\left(1-\sum_i\mu_i^2\right)
=1,
```

while its wire perimeter is `9/4`. The scalar construction was supplied in the companion [PR #254, commit `064a36a`](https://github.com/1337isnot1337/solved-conjectures/blob/064a36a5381f8a66972f8695f2e221c0175556df/research/matrix-multiplication-exponent/README.md). Its normalization can be checked directly. Place any finite family of auxiliary points in the convex hull of the three old vertices. Given a distribution on all these points, replace each sampled point independently by an old vertex with that point's barycentric probabilities. Convexity of the norm makes the expected distance of the replaced pair at least the original expected distance. The two replaced vertices have the same marginal probability distribution on the old triangle. Their expected distance is at most $1/2$, by the displayed old-triangle maximum. Hence $g(V)\le1$. Since the old vertices remain available, $g(V)\ge1$, and equality follows. The same proof gives $g(P)=1$ for every subset containing all three old vertices.

For completeness, one joint random retraction of the auxiliary labels also gives all the required scalar extension inequalities at once. Place each auxiliary label $v$ at $x_v=\mathbb E x_{\pi(v)}$, where the random map $\pi$ fixes the old vertices. Jensen's inequality gives $d(v,w)\le\mathbb E d(\pi(v),\pi(w))$, using the same random map for both labels. For any probability distribution on a subset $P$, sum this inequality over two independent samples from that distribution, then bound the resulting energy at each map by $g(\pi(P))/2$. Taking the maximum over the original distribution proves $g(P)\le\mathbb E g(\pi(P))$. A fixed joint law is used throughout this argument.

The finite metric theorem above applies to every such enlargement and every graph on its vertices.

Therefore adding all the weighted graph min-cut inequalities considered here, even simultaneously for every terminal subset and every nonnegative graph weighting, does not force the original perimeter down to two. The witness remains a scalar assignment; its values on arbitrary tensor sums and general tensors have not been supplied. Full spectral additivity and multiplicativity on those tensors remain outside this countermodel.

The same assignment also satisfies all of Zhou's path-strengthened completely-positive graph upper bounds. On every finite enlargement, the companion scalar theorem gives nonnegative symmetric distances, triangle inequalities, and copositivity of `J-2D` when the full unit charge is one. Thus `D` is a feasible point in the maximization defining `U_CP^Delta(W)`, and for every nonnegative weight matrix,

```math
\sum_{i<j}W_{ij}D_{ij}\le U_{\mathrm{CP}}^{\Delta}(W).
```

Together with the finite metric theorem for `P=V`, this gives

```math
\mathop{\mathrm{MinCut}}(W)
\le\sum_{i<j}W_{ij}D_{ij}
\le U_{\mathrm{CP}}^{\Delta}(W)
```

for all these weights and all auxiliary configurations in the construction. These are pointwise spectral lower and upper tests. Maximum cut instead lower bounds the maximum over spectral points; it is not a lower bound that each individual spectral point must meet. No compatibility with arbitrary tensor covers or tensor sums follows from these graph tests.

## Hypergraph min-cuts for the normalized triangle witness

There is also a finite cut-packing certificate for hyperedges. Its scope here is the original terminal triple and terminal supersets containing that triple; it does not assert the analogous inequality for every other terminal subset.

Let the three old labels be `A,B,C` with pairwise distance `3/4`, and allow any finite metric enlargement `V`. Put `rho=1/3` and, for each old label `a`, define the cap function

```math
f_a(x)=(\rho-d(a,x))_+.
```

Their positive supports are disjoint because `2rho=2/3<3/4`. For a nonempty hyperedge `H` define

```math
\delta(H)=\sum_{a\in\{A,B,C\}}
\left(\max_{x\in H}f_a(x)-\min_{x\in H}f_a(x)\right),
```

and put `delta(empty)=0`.

**Lemma.** Every hyperedge satisfies `delta(H)<=g(H)`.

**Proof.** If `H` meets no positive cap then `delta(H)=0`. If it meets only one, the single nonzero oscillation is at most the diameter of `H`, because `f_a` is one-Lipschitz. The charge `g(H)` is at least its diameter: place probability one half on each endpoint of a diameter.

If `H` meets two caps, select points `x,y` attaining the two cap maxima, with distances `u,v` to their respective old centers. Each cap has minimum zero on `H`, because `H` also contains a point in the other disjoint cap. Hence

```math
\delta(H)=\frac23-u-v
\le\frac34-u-v
\le d(x,y)\le g(H).
```

If `H` meets all three caps, select maximizing points `x_A,x_B,x_C`, and let their distances to their own centers be `u_A,u_B,u_C`. All three minima are zero, so `delta(H)=1-sum_a u_a`. Apply the defining maximum for `g(H)` to the uniform distribution on the three selected points. Triangle inequalities give

```math
\begin{aligned}
g(H)&\ge\frac49\bigl(d(x_A,x_B)+d(x_B,x_C)+d(x_C,x_A)\bigr)\\
&\ge\frac49\left(\frac94-2(u_A+u_B+u_C)\right)\\
&=1-\frac89(u_A+u_B+u_C)\\
&\ge1-(u_A+u_B+u_C)=\delta(H).
\end{aligned}
```

This exhausts the cases. End of proof.

Now let `w_H>=0` be arbitrary weights on hyperedges `H subseteq V`. Define `lambda_ABC` to be the minimum total weight of hyperedges crossing a cut that separates at least two of the three old terminals. A hyperedge crosses a cut when it has at least one vertex on each side.

For every `a in {A,B,C}` and every threshold `0<t<rho`, the cut `{x:f_a(x)>t}` contains old terminal `a` and excludes the other two. Its hyperedge cut capacity is therefore at least `lambda_ABC`. Integrate in `t` and sum over the three cap functions. A fixed hyperedge contributes exactly its cap oscillation, by the threshold identity. The lemma yields

```math
\sum_Hw_Hg(H)
\ge\sum_Hw_H\delta(H)
\ge3\rho\lambda_{ABC}
=\lambda_{ABC}.
```

This is a direct finite metric theorem; no tensor distillation theorem is used in its proof.

In the Euclidean convex-hull countermodel, every terminal superset `P` containing the original triple has `g(P)=1`. Its terminal min-cut is at most `lambda_ABC`, since every cut separating the original triple also separates `P`. Consequently the same certificate gives

```math
\sum_Hw_Hg(H)\ge\lambda_P(w)g(P)
\qquad(\{A,B,C\}\subseteq P\subseteq V).
```

In particular, all-party hypergraph min-cut lower bounds also leave the normalized triangle witness feasible. The cap proof alone does not settle terminal sets omitting at least one of the original vertices. A separate [tree-terminal theorem](TREE_TERMINAL_MINCUT.md) proves the inequality for every terminal triple, and more generally for any terminal metric that embeds isometrically in a finite tree, with arbitrary ambient metric auxiliaries. Neither proof supplies values on arbitrary tensors or establishes compatibility with arbitrary tensor covers.

## A stronger scalar witness

[TRIPOD_COUNTERMODEL.md](TRIPOD_COUNTERMODEL.md) supplies a different normalized perimeter-$9/4$ scalar model on a three-arm metric tree. Every terminal subset in that model is a tree metric, so the tree-terminal theorem verifies all hypergraph mincut tests simultaneously. That model also satisfies intersecting submodularity of partial-unit charges and the full crossing and coherent-extension requirements. It is a scalar countermodel, with no general tensor spectral point constructed.
