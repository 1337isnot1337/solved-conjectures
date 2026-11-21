# Lih--Wang's convexity inequality on PSD permutation orbits

**Status:** All-order quantitative strengthening on a proper subclass of Minc Conjecture 34; **not** an unrestricted resolution. The *qualitative chord inequality on symmetric PSD matrices* was already a consequence of Kopotun (1996), as explained below; the permutation-orbit extension of that qualitative result is immediate. The strengthened quadratic envelope and curvature bound are verified here but external priority for these quantitative estimates is unknown. **Zero** completed MINC entries. No Lean.

## Original named conjecture

Lih and Wang conjectured that for all nonnegative doubly stochastic A, n>=3, and 0<=t<=1/2,

~~~math
\operatorname{per}(J_n+t(A-J_n))
\le (1-t)\operatorname{per}(J_n)+t\operatorname{per}(A).
~~~

The [current specialist page](https://yair-lavi.com/mincs-list/conjecture-34/index.html) still lists this unrestricted assertion as open.

## Theorem (all orders, proper class)

Let S be any real symmetric *positive-semidefinite* doubly stochastic matrix of order n>=2, and P,Q arbitrary independent permutation matrices. Set A=PSQ and beta_n=n!/n^n. For **every** t in [0,1], the stronger inequality holds:

~~~math
\boxed{\operatorname{per}(J_n+t(A-J_n))
\le\beta_n+t^2(\operatorname{per}(A)-\beta_n)
\le\beta_n+t(\operatorname{per}(A)-\beta_n).}
~~~

The linear-chord inequality is strict when 0<t<1 unless A=J_n. The interpolation polynomial is strictly convex when A is not J_n; quantitatively,

~~~math
\frac{d^2}{dt^2}\operatorname{per}(J_n+t(A-J_n))
\ge\frac{(n-2)!}{n^{n-2}}\|A-J_n\|_F^2>0.
~~~

This includes nonsymmetric A and arbitrary n, but only the specified orbit.

## Complete proof

Define the sum of all k-by-k subpermanents of X as

~~~math
\sigma_k(X)=\sum_{\substack{|I|=|K|=k}}\operatorname{per}(X[I,K]),
\qquad \sigma_0(X)=1.
~~~

By multilinear expansion around J_n,

~~~math
\operatorname{per}(J_n+tX)
=\sum_{k=0}^n \frac{(n-k)!}{n^{n-k}}\sigma_k(X)t^k. \tag{1}
~~~

Take X=S-J_n. Since SJ_n=J_nS=J_n, S has eigenvalue 1 on the all-ones line and is PSD on its orthogonal complement; hence X is PSD. Also X has zero row and column sums. In particular, sigma_1(X)=0.

**Positive-coefficient lemma.** For every real PSD X and all k>=1, sigma_k(X)>=0. To see this, put

~~~math
u_k=\sum_{\substack{i_1,\ldots,i_k\\\text{pairwise distinct}}}
e_{i_1}\otimes\cdots\otimes e_{i_k}.
~~~

Expanding the tensor quadratic form gives

~~~math
\langle u_k,X^{\otimes k}u_k\rangle=k!\sigma_k(X)\ge0.
~~~

For each pair of unordered k-element row and column sets, the ordered assignments generate k! copies of the permanent of the corresponding submatrix. As X is PSD, so is X^{tensor k}; hence the quadratic form is nonnegative.

For any X with zero row and column sums, inclusion--exclusion gives the exact identity

~~~math
\sigma_2(X)
=\frac12\sum_{i\ne j}\sum_{k\ne l}x_{ik}x_{jl}
=\frac12\|X\|_F^2.
~~~

Thus the coefficient c_2 of t^2 in (1) is (n-2)! ||X||_F^2/(2n^(n-2)), which is strictly positive unless S=J_n. All higher coefficients c_k are nonnegative.

Write f(t)=beta_n+sum_(k=2)^n c_k t^k; at t=1, sum c_k=per(S)-beta_n. For all 0<=t<=1 and k>=2, t^k<=t^2<=t, so

~~~math
f(t)\le\beta_n+t^2\sum_{k=2}^n c_k
\le\beta_n+t\sum_{k=2}^n c_k.
~~~

Further, f''(t)=sum_(k=2)^n k(k-1)c_k t^(k-2) >= 2c_2. For 0<t<1 and S!=J_n, c_2>0 and t^2<t, which proves strictness of the chord.

Finally, PJ_nQ=J_n, and the permanent is invariant under independent row and column permutations, so

~~~math
\operatorname{per}(J_n+t(A-J_n))
=\operatorname{per}(P[J_n+t(S-J_n)]Q)=f(t),
\quad \operatorname{per}(A)=\operatorname{per}(S).
~~~

Also ||A-J_n||_F=||S-J_n||_F. Therefore all bounds extend to arbitrary P and Q, with no commutation requirement.

## Limits, source audit and verification

**This is not a proof of Lih--Wang for arbitrary doubly stochastic matrices.** The positivity of all centered subpermanent sums is guaranteed here only by the PSD hypothesis (or other separate assumptions). It proves a proper all-order class and **cannot count as one of ten full resolved entries**.

**Prior-art correction:** [Kopotun (1996)](https://doi.org/10.1016/0024-3795(94)00228-2) proved the full-interval Lih--Wang chord inequality when a normal doubly stochastic matrix has its spectrum in the sector |arg z|<=pi/(2n), as explicitly reported on the [current MINC Conjecture 34 page](https://yair-lavi.com/mincs-list/conjecture-34/index.html). Every symmetric PSD doubly stochastic S meets this hypothesis. Since J_n and the permanent are invariant under independent row/column permutations, the qualitative chord statement for A=PSQ follows immediately from Kopotun. Accordingly **the qualitative all-order class is prior art and is not claimed as new**. [Hwang (1989)](https://doi.org/10.1090/S0002-9939-1989-0960645-2) also established monotonicity toward the boundary for symmetric PSD stochastic directions, recorded on [MINC Problem 8](https://yair-lavi.com/mincs-list/problem-8/index.html). The **stronger quadratic upper envelope and uniform curvature constant** are elementary consequences of the PSD tensor coefficient expansion here; whether they have appeared elsewhere has not been established. See [Udayan--Somasundaram 2024](https://doi.org/10.1515/spma-2024-0006), the repository [Lih--Wang audit](sign-matrices/lihw_source_audit.md), and work on [centered subpermanent sums](inequalities/research.md).

The same two-sided orbit is covered by the separate [Gyires partial-class theorem](gyires_psd_permutation_orbits.md), but these are **two proper-class results**, not two completed full MINC problems.

[Exact standard-library rational coefficient diagnostic](verify_lihw_psd_orbit_convexity.py), tested for 60 instances across orders two through six. These tests are only arithmetic cross-checks, not finite-dimension proofs.