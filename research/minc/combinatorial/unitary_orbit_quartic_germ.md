# Maximum permanent on a unitary orbit: the fourth-order near-scalar germ

Research checkpoint: 20 November 2026 (America/Chicago). This is an exact all-order local reduction for Minc Problem 1, not a formula for its general spectral maximum. No full Minc entry, finite-order result, or separately named conjecture is counted. The proof below has exact rational coefficient checks but has not been independently refereed.

## Statement

For a nonnegative spectrum, put

$$
M_n(\lambda)=\max_{U\in\mathcal U_n}
\operatorname{per}(U\operatorname{diag}(\lambda)U^*).
$$

Fix any real vector \(x=(x_1,\ldots,x_n)\) with \(n\ge2\) and \(\sum_i x_i=0\). Put \(s_j=\sum_i x_i^j\). Consider \(\lambda_i(\varepsilon)=1+\varepsilon x_i\), positive for all sufficiently small real \(\varepsilon\). Define the compact, nonempty zero-diagonal orbit

$$
\mathcal Z_x=\{H=U\operatorname{diag}(x)U^*:H_{ii}=0\ (1\le i\le n)\}.
$$

For \(H\in\mathcal Z_x\), write

$$
r_i(H)=(H^2)_{ii}=\sum_{j\ne i}|h_{ij}|^2,\qquad
q_4(H)=\sum_{\substack{S\subseteq[n]\\|S|=4}}\operatorname{per}H[S,S],
$$

with \(q_4=0\) for \(n<4\). The scalar

$$
\Gamma_n(x)=\max_{H\in\mathcal Z_x}
\left[
q_4(H)+\sum_{i=1}^n
\left(r_i(H)-\frac{s_2}{n}\right)^2
\right]
\tag{1}
$$

is attained.

**Theorem.** In every order \(n\ge2\),

$$
\boxed{\quad M_n(1+\varepsilon x)
=1+\frac{s_2}{2}\varepsilon^2
+\frac{s_3}{3}\varepsilon^3
+\Gamma_n(x)\varepsilon^4+o(\varepsilon^4).\quad}
\tag{2}
$$

For every choice of maximizing matrix
\(B_\varepsilon=I+\varepsilon H_\varepsilon\), uniformly over all
maximizers,

$$
\|\operatorname{diag}H_\varepsilon\|_2=O(|\varepsilon|),
\qquad
(B_\varepsilon)_{ii}=1+O(\varepsilon^2).
\tag{3}
$$

These statements also hold for negative sufficiently small
\(\varepsilon\). They give a local constant-diagonal limit, not Mehta's
false claim that a global maximizer always has constant diagonal.
When \(x=0\), (2) holds trivially with \(\Gamma_n(0)=0\).

## Permanent coefficients through degree three

For any square matrix \(H\), the identity-edge expansion gives

$$
\operatorname{per}(I+\varepsilon H)
=\sum_{k=0}^n\varepsilon^k q_k(H),\qquad
q_k(H)=\sum_{|S|=k}\operatorname{per}H[S,S].
\tag{4}
$$

Let \(H=H^*\) have trace zero. Set \(d_i=h_{ii}\) and
\(r_i=\sum_{j\ne i}|h_{ij}|^2\). Then exact expansion of the two- and
three-vertex principal permanents gives

$$
q_1(H)=0,\qquad
q_2(H)=\frac{\operatorname{tr}H^2}{2}-\sum_i d_i^2,
\tag{5}
$$

$$
q_3(H)=\frac{\operatorname{tr}H^3}{3}
-2\sum_i d_i r_i.
\tag{6}
$$

For (6), the diagonal triple products sum to
\(\sum_{i<j<k}d_id_jd_k=\sum_i d_i^3/3\), since
\(\sum d_i=0\). The one-fixed-point terms equal
\(\sum_{i<j}|h_{ij}|^2\sum_{k\ne i,j}d_k
=-\sum_i d_i r_i\). The oriented three-cycles contribute
\(2\operatorname{Re}\sum_{i<j<k}h_{ij}h_{jk}h_{ki}\).
On the other hand,

$$
\operatorname{tr}H^3
=\sum_i d_i^3+3\sum_i d_i r_i
+6\operatorname{Re}\sum_{i<j<k}h_{ij}h_{jk}h_{ki},
$$

which proves (6). All higher coefficients in (4) are uniformly
bounded on the compact orbit of \(\operatorname{diag}x\).

Since \(\operatorname{tr}H^j=s_j\) on that orbit, (5)--(6) give

$$
\begin{aligned}
\operatorname{per}(I+\varepsilon H)
={}&1+\varepsilon^2\left(\frac{s_2}{2}-\|d\|_2^2\right)\\
&+\varepsilon^3\left(\frac{s_3}{3}-2d\cdot r\right)
+\varepsilon^4q_4(H)+O(|\varepsilon|^5),
\end{aligned}
\tag{7}
$$

uniformly in \(H\). A Fourier unitary has squared moduli \(1/n\),
so conjugating \(\operatorname{diag}x\) by that unitary gives
\(H_0\in\mathcal Z_x\); in particular \(\mathcal Z_x\) is nonempty.

Comparing a maximizing \(H_\varepsilon\) to \(H_0\), using the
boundedness of \(r\) and \(q_4\), yields constants \(C_1,C_2\)
depending only on \(x,n\) such that

$$
0\le-\varepsilon^2\|d\|_2^2
+C_1|\varepsilon|^3\|d\|_2+C_2\varepsilon^4.
$$

Solving this quadratic bound proves (3). It also shows that every
accumulation point of \(H_\varepsilon\) lies in \(\mathcal Z_x\).

## The fourth-order upper bound

For a maximizing matrix, let \(v_\varepsilon=d/\varepsilon\), a bounded
real vector with \(\sum_i(v_\varepsilon)_i=0\). Divide (7) minus its
universal quadratic and cubic terms by \(\varepsilon^4\):

$$
-\|v_\varepsilon\|_2^2
-2v_\varepsilon\cdot r(H_\varepsilon)
+q_4(H_\varepsilon)+O(|\varepsilon|).
\tag{8}
$$

Because \(v_\varepsilon\) has zero coordinate sum,

$$
-\|v_\varepsilon\|^2-2v_\varepsilon\cdot r
\le\left\|r-\frac{s_2}{n}\mathbf1\right\|^2;
\tag{9}
$$

this is simply completion of a square. Pass along an arbitrary
convergent subsequence of maximizing \(H_\varepsilon\). Its limit is
in \(\mathcal Z_x\), so continuity and (9) show that the limsup of
(8) is at most \(\Gamma_n(x)\).

## Attaining the fourth-order bound

For \(H_0\in\mathcal Z_x\) with connected off-diagonal support graph,
the map

$$
K\longmapsto\operatorname{diag}[K,H_0]
\quad(K^*=-K)
\tag{10}
$$

surjects onto the real vectors of coordinate sum zero. Indeed, on
any edge \(ij\) with \(h_{ij}\ne0\), choose
\(K_{ij}=c h_{ij}\), \(K_{ji}=-\overline{K_{ij}}\)
and all other entries zero. The resulting diagonal of the commutator
is \(2c|h_{ij}|^2(e_i-e_j)\). Such edge differences span the trace-zero
space when the support graph is connected.

Choose \(K\) in (10) so that

$$
\operatorname{diag}[K,H_0]
=-\left(r(H_0)-\frac{s_2}{n}\mathbf1\right)=:v.
$$

The Hermitian path \(H_\varepsilon=e^{\varepsilon K}H_0e^{-\varepsilon K}\)
remains on the same unitary orbit and satisfies

$$
\operatorname{diag}H_\varepsilon
=\varepsilon v+O(\varepsilon^2).
$$

Substitution in (7) gives the exact fourth-order coefficient

$$
q_4(H_0)-\|v\|^2-2v\cdot r(H_0)
=q_4(H_0)+\left\|r(H_0)-\frac{s_2}{n}\mathbf1\right\|^2.
\tag{11}
$$

It remains to justify that connected zero-diagonal matrices are dense
in \(\mathcal Z_x\). Suppose \(x\ne0\). Since \(H_0\) has zero diagonal
and is nonzero, its support has an edge. If that graph has separate
components, select a vertex \(i\) incident to an edge in one component
and any vertex \(j\) of another. A sufficiently small nontrivial real
two-coordinate rotation mixing \(i,j\) preserves every diagonal entry
at zero: \(h_{ii}=h_{jj}=h_{ij}=0\). It preserves connectivity within
the two old components (their existing incident edges are merely
scaled by a nonzero cosine), and creates an edge joining them through
a neighbor of \(i\). Iterating over components gives a connected
zero-diagonal matrix arbitrarily close to the original \(H_0\),
still on exactly the same unitary orbit. This also covers isolated
zero rows. The case \(x=0\) is trivial.

The functional in (1) is continuous, so connected matrices
approximate its maximum. Applying (11) to these matrices proves
the matching liminf bound. Combined with the previous limsup
bound, this proves (2).

## A separate spectral monotonicity

There is an independent all-order consequence of the nonnegative
coefficient representation already in the prior source audit.
For a unitary \(U\), the polynomial

$$
\operatorname{per}(U\operatorname{diag}(\lambda)U^*)
=\sum_{|\alpha|=n}w_\alpha(U)\lambda^\alpha,
\qquad w_\alpha(U)\ge0,
\tag{12}
$$

comes from the Fischer norm of the product of the row linear forms.
For strictly positive \(\lambda=e^y\), the logarithm of (12) is a
log-sum-exp of affine forms in \(y\), hence convex.
Taking its supremum over \(U\) shows that

$$
y\longmapsto\log M_n(e^{y_1},\ldots,e^{y_n})
\tag{13}
$$

is convex. It is permutation-invariant, hence Schur-convex.
Consequently, if \(\log\lambda\) majorizes \(\log\mu\) for two
positive spectra, then \(M_n(\lambda)\ge M_n(\mu)\).
No additive-majorization claim or strict equality classification
is made. This is a structural comparison, not the missing numerical
formula for general spectra.

## Exact reproducible checks

The companion standard-library script
[verify_unitary_orbit_quartic.py](verify_unitary_orbit_quartic.py)
checks (5)--(6) for 24 traceless rational symmetric matrices
of orders three through five. Independently it constructs the
truncated adjoint action \(e^{\varepsilon K}He^{-\varepsilon K}\)
and expands the permanent through degree four for two rational,
connected zero-diagonal cores. The coefficients are

- Order three: \(1,0,14,12,98/3\), with \(q_4=0\) and drift gain \(98/3\).
- Order four: \(1,0,20,34,131\), with \(q_4=49\) and drift gain \(82\).

These are checks of the exact coefficient algebra, not order-specific
resolutions of Problem 1.

## Source status and remaining gap

The live [Minc Problem 1](https://yair-lavi.com/mincs-list/problem-1/index.html)
still asks for the entire maximum as a function of an arbitrary
nonnegative spectrum. The earlier
[source audit](unitary_orbit_source_audit.md) documents the
1986 commutation criterion, completed order-three case, false
constant-diagonal shortcut, and Sidney Holden's September 2026
Gröbner-elimination prescription, including its disputed completion
status and complete one-exceptional-eigenvalue formula.
The [full source dossier](https://github.com/ajt60gaibb/OpenProblemsInNLA/blob/main/matrix-inequalities-and-norms/MI-16/solution.tex)
was checked for its use of near-scalar perturbations, Taylor
coefficients, and fourth-order local analysis; no overlapping
statement was identified in this bounded text check.
Exact phrases were also searched in current public sources.
That is not an exhaustive novelty certificate, and the present
theorem has no external mathematical review.

The missing implication is an explicit evaluation of (1) for
general spectra, followed by control away from the scalar
regime. The quartic functional still requires optimization over
an entire zero-diagonal unitary orbit. Replacing that optimization
with generic elimination or the previously solved exceptional
spectrum case would not resolve the open structural task.
