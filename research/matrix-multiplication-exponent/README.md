# Can crossing wires determine the matrix multiplication exponent?

**Research status.** We prove that the scalar inequalities below have sharp square bound $9/4$, even with arbitrarily many auxiliary parties. More generally, adding these inequalities preserves the conic optimum for every rectangular shape. The value of the complex matrix multiplication exponent remains undetermined by this argument. [Tracking issue #250](https://github.com/1337isnot1337/solved-conjectures/issues/250)

## The tensor question

Write $W_{ij}(q)$ for the dimension-$q$ identity tensor shared by parties $i,j$, with one-dimensional factors elsewhere. Regrouping the three wires of a triangle by party gives the trilinear matrix multiplication tensor $M_q$. For a normalized spectral point $\phi$ on complex three-tensors, set $d_{ij}=\log_2\phi(W_{ij}(2))$. Such a point is additive on direct sums, multiplicative on tensor products, monotone under restriction, and takes the value $r$ on the full diagonal tensor of size $r$. Multiplicativity and Strassen's duality give

```math
\omega_{\mathbb C}=\max_\phi\log_2\phi(M_2)=\max_\phi(d_{12}+d_{23}+d_{31}).
```

Thus an upper bound of 2 on every genuine perimeter would settle the question. Each of the three one-party matrix flattenings gives a permutation of $(1,1,0)$ and attains 2. Amanov, van den Berg and Zuiddam (AVZ), Theorems 1.1 and 5.4, prove the upper bound $9/4$ and its optimality for their specified operations on formal tensor expressions. Zhou's Theorem 1.2 gives the independent starting constraint that $J-2D$ is copositive for a normalized distance matrix $D$. His Proposition 6.2 computes the weighted triangle optimum. The question here is whether auxiliary-point crossing and extension constraints can narrow that feasible region. [AVZ, v1](https://arxiv.org/abs/2610.30054v1) · [Zhou, v3](https://arxiv.org/html/2610.34273v3)

## A scalar extension theorem

Take a symmetric nonnegative $3\times3$ matrix $D$ with zero diagonal. Assume its entries satisfy the triangle inequalities and $a^T(J-2D)a\ge 0$ for every $a\ge 0$, where every entry of $J$ is one. For a finite label set $P$ with positions $x_i$ in a real Euclidean space define

```math
 g(P)=2\max_{\mu\in\Delta(P)}
       \sum_{i,j\in P}\mu_i\mu_j\lVert x_i-x_j\rVert,
 \qquad g(\varnothing)=0.
```

Here $\Delta(P)$ is the probability simplex. The maximum exists by compactness. We interpret $g(P)$ as a proposed base-two logarithmic charge for a binary unit on $P$. Singletons have charge zero. A pair at distance $d$ has charge $d$, since $4t(1-t)$ has maximum one.

**Theorem.** Every such triangle extends to its entire closed Euclidean convex hull, with charges on every finite set of labels there, satisfying all of the following simultaneously.

1. Distances restrict to $D$. For each $P$, $0\le g(P)\le1$ and $g(P)J-2D_P$ is copositive. Charges increase under inclusion. The charge of the original triple is preserved when any auxiliary labels are added to that triple.
2. For every finite tree connecting $P$, with arbitrary auxiliary vertices, $g(P)$ is at most the sum of its edge lengths.
3. For every random map $\pi$ from a finite enlarged label set to old labels, fixing each old label, one can place the new labels so that for **every** subset $P$ of enlarged labels,
   $g(P)\le\mathbb E[g(\pi P)]$. All old charges are preserved. This can be iterated.
4. Every choice of eight labels satisfies the crossing inequality of Proposition B.3, and every Euclidean midpoint satisfies the squared midpoint identity.

Items 2–4 are the tree bound, the restriction of the logarithmic extension bound to units and wires, and the metric crossing bound used here. The tensor extension in the source quantifies over all tensors. [VP versus VNP, Lemma A.2, Propositions A.7–A.8 and B.3, Theorem C.1, pinned paper and formalization](https://github.com/anthropics/formal-math/tree/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp)

**Proof.** Realize the three side lengths by a Euclidean triangle, allowing collinear or coincident vertices. Let $H$ be its convex hull. Copositivity on the original labels is equivalent to $g(\{1,2,3\})\le1$ by normalizing a nonzero nonnegative vector to sum to one. For any point $x\in H$ choose a distribution on the original vertices whose mean is $x$. Draw $X,X'$ independently from any probability distribution on a finite labeled subset of $H$. Replace them independently by random vertices $V,V'$ using these distributions, even when $X=X'$. Conditional Jensen gives

```math
 \mathbb E\lVert X-X'\rVert\le\mathbb E\lVert V-V'\rVert.
```

The replacements are independent with the same marginal. Their expected distance is therefore at most half the original triple's charge. Taking the maximum proves that adding auxiliaries cannot increase this charge. Extending a probability vector by zeros proves monotonicity and the reverse bound when the original vertices are present. For each subset $P$, the definition itself proves localized copositivity by homogeneity.

For the tree bound draw two independent labels with law $\mu$ on $P$. Their distance is at most the length of their unique tree path. An edge separating masses $t$ and $1-t$ lies on that path with probability $2t(1-t)$. Doubling expected path length assigns that edge coefficient $4t(1-t)\le1$. Maximize over $\mu$.

For the random map set $x_i=\mathbb E[x_{\pi(i)}]$. These barycenters belong to $H$, and old positions are fixed. For any $i,j$ Jensen gives $\lVert x_i-x_j\rVert\le\mathbb E\lVert x_{\pi(i)}-x_{\pi(j)}\rVert$ using the **same** map on both indices. Sum with weights $2\mu_i\mu_j$. For each map realization the sum on the right uses the pushforward of $\mu$, so is at most $g(\pi P)$. Maximization gives item 3. The placements do not depend on $P$.

For crossing let the endpoints be $x,v,y,u$ and the hubs $o,o',w,w'$. For $p,q\ge0$ take vectors $\xi,\eta$ pointing along $x-v,y-u$ of lengths $p,q$, respectively, using zero on a zero displacement. Then the demanded left side is $L=\langle\xi,x-v\rangle+\langle\eta,y-u\rangle$. Split these displacements along the two paths through $o,o'$ and apply Cauchy–Schwarz on each segment. Split them next through $w,w'$ in opposite orders. Writing $d(a,b)=\lVert a-b\rVert$, the two estimates are

```math
\begin{aligned}
 L &\le p[d(x,o)+d(v,o')]+q[d(y,o)+d(u,o')]+\lVert\xi+\eta\rVert d(o,o'),\\
 L &\le p[d(x,w)+d(v,w')]+q[d(u,w)+d(y,w')]+\lVert\xi-\eta\rVert d(w,w').
\end{aligned}
```

The two hub coefficients $r,r'$ satisfy $r^2+(r')^2=2(\lVert\xi\rVert^2+\lVert\eta\rVert^2)\le2(p^2+q^2)$ by the parallelogram identity. They work for all choices of the four hubs. Finally $m=(x+v)/2$ satisfies $d(z,m)^2=(d(z,x)^2+d(z,v)^2)/2-d(x,v)^2/4$. This proves the theorem.

## Consequences for square and rectangular multiplication

On an equilateral triangle of side $s$, the charge on the vertices equals $2s\max_\mu(1-\sum_i\mu_i^2)=4s/3$. Taking $s=3/4$ gives full-unit charge exactly one and perimeter $9/4$. Conversely, testing copositivity with the uniform distribution gives $1\ge4(d_{12}+d_{23}+d_{31})/9$. Thus $9/4$ is sharp for the scalar system. The flattening triples $(1,1,0)$ also have charge one, as can be seen by placing two vertices at the same end of a unit interval.

For any nonzero nonnegative triangle weights, the conic feasible set is compact: the pair constraints give $d_{ij}\le1$. Its maximum weighted objective is positive because some flattening separates a positively weighted edge. At any maximizer the triple charge is one, since rescaling all entries by $1/g$ would otherwise preserve feasibility and strictly improve the objective. The theorem extends this maximizer with exactly normalized full-unit charge, including after enlarging the ambient set. The reverse bound follows by restricting to the original three labels. This proves preservation of the optimum for every weighted triangle, including rectangular shapes with a zero weight.

The construction assigns charges to units and wires. It supplies no value on a general three-tensor and hence no spectral point witnessing a lower bound above 2. The proof rules out deriving a better perimeter from items 1–4 alone. Applying tensor additivity, general covers, or a new degeneration can impose further restrictions. AVZ's operational theorem concerns a different, explicitly generated preorder. Neither barrier establishes optimality for arbitrary tensor algorithms.
