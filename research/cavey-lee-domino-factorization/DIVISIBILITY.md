# Full divisibility in the Cavey–Lee factorization conjecture

Let \(P_\lambda(z;q,t)\) be the domino-tiling polynomial of [Cavey–Lee, arXiv:2501.17765v1, (3) and Conjecture 5.1](https://arxiv.org/pdf/2501.17765#page=24). For every partition \(\lambda\) of Durfee rank \(r\) the full conjectured factor product divides:
\[
 \boxed{\quad
 P_\lambda(z;q,t)=
       R_\lambda(z;q,t)\!
       \prod_{\substack{i,j\ge0\\i+j<r}}(z+q^i t^j),
 \qquad R_\lambda\in\mathbb Z[z,q,t].
 \quad}
\]
This does **not** prove the coefficientwise nonnegativity of \(R_\lambda\), which is an additional assertion of Conjecture 5.1. The companion arguments establish coefficientwise nonnegativity separately for each axis product in both parameters, and for the full product at \(t=1\) and at \(q=1\).

## A hook filtration in ordinary Macdonald functions

Work over \(\mathbb Q(q,T)\) with independent indeterminates. Denote by \(P_\mu(X;q,T)\) and \(Q_\mu(X;q,T)\) the usual dual Macdonald bases. Write \(g_m=Q_{(m)}\) for \(m>0\), \(g_0=e_0=1\), and use the standard identities
\[
 g_m[X]=h_m\!\left[\frac{1-T}{1-q}X\right],
 \qquad
 \langle p_\rho,p_\rho\rangle_{q,T}
   =z_\rho\prod_{i}\frac{1-q^{\rho_i}}{1-T^{\rho_i}}
\]
(with distinct \(p_\rho\)'s orthogonal). The two Pieri rules for multiplication by \(g_m\) and \(e_m\) have horizontal and vertical strip support, respectively. Every allowed strip has a strictly positive coefficient for \(0<q,T<1\), from the product formulas; these assertions apply to the \(Q\) basis as well, by its positive change of normalization from \(P\) on this real domain. See Macdonald, [*Symmetric Functions and Hall Polynomials*, Chapter VI, §§2, 4, 6](https://math.berkeley.edu/~corteel/MATH249/macdonald.pdf).

A partition lies in an \((a,b)\)-hook if \(\mu_{a+1}\le b\). We prove the following support statement:
\[
 \mu_{a+1}\le b,\qquad
 [s_\lambda]\,Q_\mu[(1-q)X;q,T]\ne0
 \quad\Longrightarrow\quad
 \lambda_{a+b+1}\le a+b. \tag{1}
\]

Fix the total degree \(n\). For each partition \(\mu\) in the \((a,b)\)-hook, write \(\alpha=(\mu_1,\ldots,\mu_a)\) for its top \(a\) parts (using zeros if needed), and \(\beta=(\mu_{a+1},\mu_{a+2},\ldots)\) for its tail. Consider
\[
 M_\mu(X)=\prod_{i=1}^{a}g_{\alpha_i}(X)\,
          \prod_{j=1}^{b}e_{\beta'_j}(X).
 \tag{2}
\]
These elements form a basis of the span of \(Q_\mu\) over the \((a,b)\)-hook partitions of degree \(n\). Here is a triangularity proof.

Apply first the horizontal Pieri rules and then the vertical ones. The horizontal phase constructs a shape \(\gamma\) of length at most \(a\); the next \(b\) vertical strips add at most \(b\) cells in any one lower row. Every final shape \(\kappa\) is therefore in the \((a,b)\)-hook. Moreover, \(\gamma\) dominates \(\alpha\). Indeed the first \(k\) horizontal strips form a shape of length at most \(k\), with \(\sum_{i=1}^k\alpha_i\) cells; all these cells are in the first \(k\) rows of \(\gamma\). Thus each top-\(a\) prefix sum of \(\kappa\) is at least that of \(\mu\).

If these prefix sums all tie, the horizontal phase must end at \(\gamma=\alpha\) and no vertical strip can have added any cell to the first \(a\) rows: their total size at the end of the horizontal phase already equals that of the final top \(a\) rows. After restricting to the tails and transposing, the vertical phase is a horizontal sequence with strip sizes \(\beta'_1,\ldots,\beta'_b\). The same prefix-sum argument shows that the conjugate of the final tail dominates \(\beta'\). Thus \(Q_\kappa\) can occur in (2) only if its tuple consisting of top-\(a\) prefix sums followed by conjugate-tail prefix sums is lexicographically at least that of \(\mu\); these tuples determine the partitions. The diagonal coefficient of \(Q_\mu\) is nonzero: build the top rows one at a time and then the tail columns one at a time. This is an allowed Pieri chain, whose contribution is positive at \(0<q,T<1\); all other contributions are nonnegative there. The finite triangular matrix is therefore invertible over \(\mathbb Q(q,T)\), proving the basis assertion.

Apply plethysm by \(1-q\) in (2). Each factor \(g_j[(1-q)X]=h_j[(1-T)X]\) expands as
\(\sum_{\ell}(-T)^\ell h_{j-\ell}(X)e_\ell(X)\), and each factor \(e_j[(1-q)X]\) likewise expands as
\(\sum_{\ell}(-q)^\ell e_{j-\ell}(X)h_\ell(X)\). Thus each summand is a product of at most \(a+b\) ordinary \(h\)'s and at most \(a+b\) ordinary \(e\)'s. Apply the Schur horizontal Pieri rule to the \(h\)'s first, producing shapes with at most \(a+b\) rows. The vertical strips from the remaining \(e\)'s enlarge each lower row by at most \(a+b\). Every final shape has \(\lambda_{a+b+1}\le a+b\). Since \(Q_\mu\) for \(\mu\) in the hook is a linear combination of (2), this proves (1).

## Vanishing factors without cancellation

Set \(T=t^{-1}\), let \(n=|\lambda|\), and work now over \(\mathbb Q(q,t)\). By the modified Macdonald normalization,
\[
 \widetilde H_\mu[X;q,t]
 =t^{n(\mu)}J_\mu[X/(1-T);q,T],
\]
which is a nonzero scalar multiple of \(P_\mu[X/(1-T);q,T]\). Thus these latter functions form an eigenbasis of \(\nabla\), with eigenvalues \(E_\mu=q^{n(\mu')}t^{n(\mu)}\). The normalization is for example equation (2.2) in [*Probabilistic operators for non-attacking tableaux and a compact formula for the symmetric Macdonald polynomials*](https://www.cambridge.org/core/journals/forum-of-mathematics-sigma/article/probabilistic-operators-for-nonattacking-tableaux-and-a-compact-formula-for-the-symmetric-macdonald-polynomials/D2A0A492ED4CF1D28EB933C217792DA4).

The coefficient \(c_{\lambda\mu}\) of the eigenbasis function \(P_\mu[X/(1-T);q,T]\) in \(s_\lambda(X)\) is
\[
 \begin{aligned}
 c_{\lambda\mu}
 &=\langle s_\lambda[(1-T)X], Q_\mu(X;q,T)\rangle_{q,T}\\
 &=\langle s_\lambda(X), Q_\mu[(1-q)X;q,T]\rangle_{\mathrm{Hall}}.
 \end{aligned} \tag{3}
\]
The first equality is duality after substitution. For the second, on each power-sum factor the \(1-T^{\rho_i}\) from the substitution cancels the denominator of the Macdonald inner product, leaving \(1-q^{\rho_i}\) on the other argument relative to the Hall inner product.

In particular, if \(c_{\lambda\mu}\ne0\), then \(\mu\) contains every cell \((j+1,i+1)\) with \(i,j\ge0\) and \(i+j<r\). Missing that cell would mean \(\mu_{j+1}\le i\); (1) with \(a=j,b=i\) and (3) would give \(r\le i+j\), a contradiction.

For a single letter \(u\) and any homogeneous \(f\) of degree \(n\), the Hall Cauchy identity gives
\[
 f[1-u]=\Big\langle f,\ \sum_{k=0}^{n}(-u)^k h_{n-k}e_k
                           \Big\rangle_{\mathrm{Hall}}.
\]
The minus in \(1-u\) is an alphabet difference. Substituting the ordinary variable \(u=-1/z\) and applying Cavey–Lee's Theorem 1.1 yields
\[
 \begin{aligned}
 P_\lambda(z;q,t)
 &=\operatorname{sgn}(\lambda)\,
       z^n(\nabla s_\lambda)[1-u]\big|_{u=-1/z}\\
 &=\operatorname{sgn}(\lambda)\sum_{\mu\vdash n}c_{\lambda\mu}E_\mu\,
      z^nP_\mu\!\left[\frac{1-u}{1-T};q,T\right]\Big|_{u=-1/z}.
 \end{aligned}
 \tag{4}
\]
Macdonald's evaluation formula (Chapter VI, §6, (6.17)) is
\[
 P_\mu\!\left[\frac{1-u}{1-T};q,T\right]
 =\prod_{c\in\mu}
    \frac{T^{l'(c)}-u q^{a'(c)}}{1-q^{a(c)}T^{l(c)+1}}.
\]
In (4), after substituting \(u=-1/z\) and multiplying by \(z^n\), the factor for a cell \(c=(j+1,i+1)\) is a nonzero scalar times \(z+q^i t^j\). Every term with nonzero \(c_{\lambda\mu}\) contains every one of the asserted cells. The full product therefore divides term by term over the fraction field; no cancellation is needed for the divisibility. Since the product is monic in \(z\) and \(P_\lambda\) has integer polynomial coefficients, monic polynomial division gives \(R_\lambda\in\mathbb Z[z,q,t]\).

This is an integral factorization result. Coefficients of the individual terms in (4) are not asserted to be nonnegative, so the argument does not prove the quotient’s positivity. The original square family is already covered by Cavey–Lee's Theorem 1.3. Searches by title, authors, arXiv number, exact conjecture, and the above mixed-Pieri specialization found no earlier report of this all-shape divisibility argument; this is a bounded priority check.
