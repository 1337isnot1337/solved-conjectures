# Circular graph alphabets for Ellzey’s conjecture

The quantum-torus elementary coefficient reduction for unit interval graphs extends verbatim in content to circular indifference digraphs once its commutation proof uses Ellzey’s two-color components. This is a reduction, not a positivity proof. It is modeled on Section 2 of [Elementary positivity of chromatic quasisymmetric functions](https://github.com/openai/math/tree/main/preprints/Elementary-Positivity-of-Chromatic-Quasisymmetric-Functions-September-24-2026).

Let $G$ be a circular indifference digraph on vertex set $V$, $u=\sum_{a\in V}\mathbf e_a$, $M$ the number of directed arcs, and $q=v^2$. The argument actually applies to the whole induced-forbidden class of Ellzey’s Theorem 5.5, which includes the circular indifference digraphs by her Lemma 5.6. On $\mathbb Z^V$ set
```math
 \Omega(\mathbf e_a,\mathbf e_b)=[a\to b]-[b\to a],
 \qquad X_p X_r=v^{\Omega(p,r)}X_{p+r}.
```
Let $`E_k=\sum_{I\ \mathrm{independent},\,|I|=k}X_{\sum_{a\in I}\mathbf e_a}`$. Then $E_jE_k=E_kE_j$. In fact for a term of $E_jE_k$ with independent sets $(I,J)$, the intersection $I\cap J$ has no arcs to any vertex in $I\cup J$. On the remaining two-colored induced subdigraph, the components are directed paths or even directed cycles (Brittney Ellzey, [arXiv:1709.00454](https://arxiv.org/abs/1709.00454), Lemma 5.4 and Corollary 5.7). This includes isolated vertices as paths of length zero, and a bidirected edge as a cycle of length two if it occurs. Interchange the two memberships in each odd-vertex directed path, leaving even paths, cycles and doubled isolated vertices unchanged. This exchanges the aggregate sizes. It preserves every contribution to $\Omega$ in total, because an odd-vertex path has equally many alternating forward and reverse contributions between its two parts, and the untouched components are unchanged. The total exponent $a_I+a_J$ is also unchanged. This is a weight-preserving involution.

Consequently one can evaluate symmetric polynomials on the abstract alphabet specified by $e_i(Y)=E_i$, with $E_i=0$ once $i$ exceeds the independence number. The usual dual Cauchy identity gives
```math
 [e_\lambda]X_G(x;q)=v^M[X_u]\,m_\lambda(Y).
```
Indeed the $X_u$ coefficient of $\prod_i(\sum_k x_i^kE_k)$ enumerates independent color classes partitioning $V$. Its skew exponent is $`\mathop{\mathrm{asc}}-\mathop{\mathrm{desc}}=2\mathop{\mathrm{asc}}-M`$, including both arcs of a bidirected edge. Taking the coefficient after the dual Cauchy identity gives the stated formula. One may work with finitely many colors and then stabilize.

For squarefree coefficient extraction there is an even broader variant. Suppose every induced subdigraph of $G$ has symmetric chromatic quasisymmetric function. Work in the nonnegative-exponent torus modulo the two-sided ideal spanned by all non-squarefree monomials. The coefficient at any squarefree support $S$ in $E_iE_j$ is, up to $`v^{-\#\mathop{\mathrm{arcs}}(G[S])}`$, the coefficient of $x_1^i x_2^j$ in the chromatic quasisymmetric function of $G[S]$ on two colors. The coefficient for $E_jE_i$ swaps $i,j$ and is equal by symmetry. Thus the $E_i$ commute in this squarefree quotient, which is all the extraction needs. This establishes the same reduction for every digraph with hereditarily symmetric chromatic quasisymmetric functions.

The remaining obstacle is extracting monomial positivity in $v$ for $[X_u]m_\lambda(Y)$. The unit interval proof identifies these symmetric-alphabet values with theta sections using a triangular arrangement of appended anchor vertices and a sequence of linear interval rotations. Neither that identification nor the underlying insertion-digit lemma for linearly ordered nonedge ascents follows just from the two-color components. For example, cutting a directed cycle at an arbitrary point destroys the claim that all earlier neighbors of a vertex form a suffix: the cut edge has its earlier endpoint at the first vertex in the linear order. A genuinely cyclic replacement for the anchor transport is needed.

