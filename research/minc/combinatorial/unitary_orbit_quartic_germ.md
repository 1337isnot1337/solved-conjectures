# Maximum permanent on a unitary orbit: the fourth-order near-scalar germ

Research checkpoint: 20 November 2026 (America/Chicago). This is an exact all-order local reduction for Minc Problem 1, not a formula for its general spectral maximum. No full Minc entry, finite-order result, or separately named conjecture is counted. The proof below has exact rational coefficient checks and two independent internal reviews. It has not been externally refereed.

## Statement

For a nonnegative spectrum, put


```math
M_n(\lambda)=\max_{U\in\mathcal U_n}
\mathop{\mathrm{per}}(U\mathop{\mathrm{diag}}(\lambda)U^*).
```


Fix any real vector $`x=(x_1,\ldots,x_n)`$ with $`n\ge2`$ and $`\sum_i x_i=0`$. Put $`s_j=\sum_i x_i^j`$. Consider $`\lambda_i(\varepsilon)=1+\varepsilon x_i`$, positive for all sufficiently small real $`\varepsilon`$. Define the compact, nonempty zero-diagonal orbit


```math
\mathcal Z_x=\{H=U\mathop{\mathrm{diag}}(x)U^*:H_{ii}=0\ (1\le i\le n)\}.
```


For $`H\in\mathcal Z_x`$, write


```math
r_i(H)=(H^2)_{ii}=\sum_{j\ne i}|h_{ij}|^2,\qquad
q_4(H)=\sum_{\substack{S\subseteq[n]\\|S|=4}}\mathop{\mathrm{per}}H[S,S],
```


with $`q_4=0`$ for $`n<4`$. The scalar


```math
\Gamma_n(x)=\max_{H\in\mathcal Z_x}
\left[
q_4(H)+\sum_{i=1}^n
\left(r_i(H)-\frac{s_2}{n}\right)^2
\right]
\tag{1}
```


is attained.

**Theorem.** In every order $`n\ge2`$,


```math
\boxed{\quad M_n(1+\varepsilon x)
=1+\frac{s_2}{2}\varepsilon^2
+\frac{s_3}{3}\varepsilon^3
+\Gamma_n(x)\varepsilon^4+o(\varepsilon^4).\quad}
\tag{2}
```


For every choice of maximizing matrix
$`B_\varepsilon=I+\varepsilon H_\varepsilon`$, uniformly over all
maximizers,


```math
\|\mathop{\mathrm{diag}}H_\varepsilon\|_2=O(|\varepsilon|),
\qquad
(B_\varepsilon)_{ii}=1+O(\varepsilon^2).
\tag{3}
```


These statements also hold for negative sufficiently small
$`\varepsilon`$. They give a local constant-diagonal limit, not Mehta's
false claim that a global maximizer always has constant diagonal.
When $`x=0`$, (2) holds trivially with $`\Gamma_n(0)=0`$.

## Permanent coefficients through degree three

For any square matrix $`H`$, the identity-edge expansion gives


```math
\mathop{\mathrm{per}}(I+\varepsilon H)
=\sum_{k=0}^n\varepsilon^k q_k(H),\qquad
q_k(H)=\sum_{|S|=k}\mathop{\mathrm{per}}H[S,S].
\tag{4}
```


Let $`H=H^*`$ have trace zero. Set $`d_i=h_{ii}`$ and
$`r_i=\sum_{j\ne i}|h_{ij}|^2`$. Then exact expansion of the two- and
three-vertex principal permanents gives


```math
q_1(H)=0,\qquad
q_2(H)=\frac{\mathop{\mathrm{tr}}H^2}{2}-\sum_i d_i^2,
\tag{5}
```



```math
q_3(H)=\frac{\mathop{\mathrm{tr}}H^3}{3}
-2\sum_i d_i r_i.
\tag{6}
```


For (6), the diagonal triple products sum to
$`\sum_{i\lt j\lt k}d_id_jd_k=\sum_i d_i^3/3`$, since
$`\sum d_i=0`$. The one-fixed-point terms equal
$`\sum_{i\lt j}|h_{ij}|^2\sum_{k\ne i,j}d_k
=-\sum_i d_i r_i`$. The oriented three-cycles contribute
$`2\mathop{\mathrm{Re}}\sum_{i\lt j\lt k}h_{ij}h_{jk}h_{ki}`$.
On the other hand,


```math
\mathop{\mathrm{tr}}H^3
=\sum_i d_i^3+3\sum_i d_i r_i
+6\mathop{\mathrm{Re}}\sum_{i\lt j\lt k}h_{ij}h_{jk}h_{ki},
```


which proves (6). All higher coefficients in (4) are uniformly
bounded on the compact orbit of $`\mathop{\mathrm{diag}}x`$.

Since $`\mathop{\mathrm{tr}}H^j=s_j`$ on that orbit, (5)--(6) give


```math
\begin{aligned}
\mathop{\mathrm{per}}(I+\varepsilon H)
={}&1+\varepsilon^2\left(\frac{s_2}{2}-\|d\|_2^2\right)
\\ &+\varepsilon^3\left(\frac{s_3}{3}-2d\cdot r\right)
+\varepsilon^4q_4(H)+O(|\varepsilon|^5),
\end{aligned}
\tag{7}
```


uniformly in $`H`$. A Fourier unitary has squared moduli $`1/n`$,
so conjugating $`\mathop{\mathrm{diag}}x`$ by that unitary gives
$`H_0\in\mathcal Z_x`$; in particular $`\mathcal Z_x`$ is nonempty.

Comparing a maximizing $`H_\varepsilon`$ to $`H_0`$, using the
boundedness of $`r`$ and $`q_4`$, yields constants $`C_1,C_2`$
depending only on $`x,n`$ such that


```math
0\le-\varepsilon^2\|d\|_2^2
+C_1|\varepsilon|^3\|d\|_2+C_2\varepsilon^4.
```


Solving this quadratic bound proves (3). It also shows that every
accumulation point of $`H_\varepsilon`$ lies in $`\mathcal Z_x`$.

## The fourth-order upper bound

For a maximizing matrix, let $`v_\varepsilon=d/\varepsilon`$, a bounded
real vector with $`\sum_i(v_\varepsilon)_i=0`$. Divide (7) minus its
universal quadratic and cubic terms by $`\varepsilon^4`$:


```math
-\|v_\varepsilon\|_2^2
-2v_\varepsilon\cdot r(H_\varepsilon)
+q_4(H_\varepsilon)+O(|\varepsilon|).
\tag{8}
```


Because $`v_\varepsilon`$ has zero coordinate sum,


```math
-\|v_\varepsilon\|^2-2v_\varepsilon\cdot r
\le\left\|r-\frac{s_2}{n}\mathbf1\right\|^2;
\tag{9}
```


this is simply completion of a square. Pass along an arbitrary
convergent subsequence of maximizing $`H_\varepsilon`$. Its limit is
in $`\mathcal Z_x`$, so continuity and (9) show that the limsup of
(8) is at most $`\Gamma_n(x)`$.

## Attaining the fourth-order bound

For $`H_0\in\mathcal Z_x`$ with connected off-diagonal support graph,
the map


```math
K\longmapsto\mathop{\mathrm{diag}}[K,H_0]
\quad(K^*=-K)
\tag{10}
```


surjects onto the real vectors of coordinate sum zero. Indeed, on
any edge $`ij`$ with $`h_{ij}\ne0`$, choose
$`K_{ij}=c h_{ij}`$, $`K_{ji}=-\overline{K_{ij}}`$
and all other entries zero. The resulting diagonal of the commutator
is $`2c|h_{ij}|^2(e_i-e_j)`$. Such edge differences span the trace-zero
space when the support graph is connected.

Choose $`K`$ in (10) so that


```math
\mathop{\mathrm{diag}}[K,H_0]
=-\left(r(H_0)-\frac{s_2}{n}\mathbf1\right)=:v.
```


The Hermitian path $`H_\varepsilon=e^{\varepsilon K}H_0e^{-\varepsilon K}`$
remains on the same unitary orbit and satisfies


```math
\mathop{\mathrm{diag}}H_\varepsilon
=\varepsilon v+O(\varepsilon^2).
```


Substitution in (7) gives the exact fourth-order coefficient


```math
q_4(H_0)-\|v\|^2-2v\cdot r(H_0)
=q_4(H_0)+\left\|r(H_0)-\frac{s_2}{n}\mathbf1\right\|^2.
\tag{11}
```


It remains to justify that connected zero-diagonal matrices are dense
in $`\mathcal Z_x`$. Suppose $`x\ne0`$. Since $`H_0`$ has zero diagonal
and is nonzero, its support has an edge. If that graph has separate
components, select a vertex $`i`$ incident to an edge in one component
and any vertex $`j`$ of another. A sufficiently small nontrivial real
two-coordinate rotation mixing $`i,j`$ preserves every diagonal entry
at zero: $`h_{ii}=h_{jj}=h_{ij}=0`$. It preserves connectivity within
the two old components (their existing incident edges are merely
scaled by a nonzero cosine), and creates an edge joining them through
a neighbor of $`i`$. Iterating over components gives a connected
zero-diagonal matrix arbitrarily close to the original $`H_0`$,
still on exactly the same unitary orbit. This also covers isolated
zero rows. The case $`x=0`$ is trivial.

The functional in (1) is continuous, so connected matrices
approximate its maximum. Applying (11) to these matrices proves
the matching liminf bound. Combined with the previous limsup
bound, this proves (2).

## Cancellation of the fourth-order cycle terms

The constrained maximum in (1) has a sharper form. Let
$`E=\{\{i,j\}:1\le i\lt j\le n\}`$ and put
$`w_{ij}=|h_{ij}|^2`$, $`S=\sum_{i\lt j}w_{ij}=s_2/2`$.
Write $`A`$ for the sum of $`w_e w_f`$ over pairs of distinct
edges sharing one vertex, $`D`$ for the same sum over disjoint
edges, and $`C`$ for the sum of the real parts of edge-products
around all unoriented simple four-cycles. These sums are zero
if the requisite edges do not exist. Enumerating the closed
four-step walks and the derangements of a four-element set gives


```math
\begin{aligned}
s_4&=2\sum_{e\in E}w_e^2+4A+8C,
\\ q_4(H)&=D+2C,
\\ S^2&=\sum_{e\in E}w_e^2+2A+2D,
\\ \sum_i r_i(H)^2&=2\sum_{e\in E}w_e^2+2A.
\end{aligned}
\tag{14}
```


The last equality counts each squared edge twice and each
pair of incident edges twice. The first distinguishes closed
walks on two, three, and four distinct vertices. Eliminating
$`A,D,C`$, and using $`\sum_i r_i=s_2`$, yields the exact
cancellation


```math
q_4(H)+\sum_i\left(r_i(H)-\frac{s_2}{n}\right)^2
=\frac{s_4}{4}
+\left(\frac18-\frac1n\right)s_2^2
+\sum_{i\lt j}|h_{ij}|^4.
\tag{15}
```


Consequently the coefficient in (2) admits the simpler form


```math
\boxed{\quad
\Gamma_n(x)=\frac{s_4}{4}
+\left(\frac18-\frac1n\right)s_2^2
+\max_{\substack{H=U\mathop{\mathrm{diag}}(x)U^*
                 \\ \mathop{\mathrm{diag}}H=0}}
\ \sum_{i\lt j}|h_{ij}|^4.
\quad}
\tag{16}
```


This is an exact reduction to the entrywise fourth-power
concentration of a zero-diagonal Hermitian matrix with prescribed
spectrum. It eliminates all four-cycle phase terms from the
fourth-order variational objective, but does not evaluate
the remaining maximum. The diagonal-drift term in (1) is
essential for the cancellation. In the order-three verifier example,
$`q_4=0`$, while the specified path has quartic coefficient $`98/3`$.
This is a path coefficient, not $`\Gamma_3(x)`$ for that spectrum.
The [asymptotic review](unitary_orbit_quartic_asymptotic_review.md) gives
another zero-diagonal Hermitian matrix with the same spectrum and a path
coefficient $`128/3`$, so the optimized coefficient is strictly larger
than $`98/3`$.

## A sharp fourth-order envelope and its equality cases

There is also an exact nonnegative deficit identity. For
zero-diagonal $`H`$, with $`w_{ij}=|h_{ij}|^2`$, put


```math
\begin{aligned}
\mathcal D(H)={}&
\sum_i\sum_{\substack{j\lt k\\j,k\ne i}}w_{ij}w_{ik}
+\frac12\sum_{i\ne j}|(H^2)_{ij}|^2.
\end{aligned}
\tag{17}
```


Because $`(H^2)_{ii}=r_i`$, the two elementary identities


```math
\mathop{\mathrm{tr}}H^4
=\sum_i r_i^2+\sum_{i\ne j}|(H^2)_{ij}|^2,
\qquad
\sum_i r_i^2=2\sum_{i\lt j}w_{ij}^2+
2\sum_i\sum_{\substack{j\lt k\\j,k\ne i}}w_{ij}w_{ik}
```


give, without any inequality,


```math
\frac{s_4}{2}-\sum_{i\lt j}|h_{ij}|^4
=\mathcal D(H)\ge0.
\tag{18}
```


Combining (16) and (18),


```math
\boxed{\quad
\Gamma_n(x)=
\frac{3s_4}{4}+
\left(\frac18-\frac1n\right)s_2^2
-\min_{H\in\mathcal Z_x}\mathcal D(H).
\quad}
\tag{19}
```


In particular, the expression without the minimum is a sharp
spectral upper bound for the fourth-order coefficient. **Equality
holds if and only if the multiset of eigenvalues $`x`$ is symmetric
under sign**, with arbitrary multiplicity at zero. For the forward
direction, equality in (18) forces the first nonnegative sum in (17)
to vanish. Thus at most one off-diagonal entry per row is nonzero,
and $`H`$ is permutation-similar to a direct sum of blocks


```math
\begin{pmatrix}0&z\\\overline z&0\end{pmatrix}
```


and isolated zeros. The eigenvalues of such a matrix occur in
opposite pairs. Conversely, every sign-symmetric spectrum has
exactly such a zero-diagonal block realization, making
$`\mathcal D=0`$.

If $`s_2>0`$, Cauchy--Schwarz applied to
$`s_3=\mathop{\mathrm{tr}}(H^3)
=\sum_{i\ne j}h_{ij}(H^2)_{ji}`$ gives


```math
s_3^2\le s_2\sum_{i\ne j}|(H^2)_{ij}|^2,
\qquad
\mathcal D(H)\ge\frac{s_3^2}{2s_2}.
```


Hence the explicit strict improvement


```math
\Gamma_n(x)\le
\frac{3s_4}{4}
+\left(\frac18-\frac1n\right)s_2^2
-\frac{s_3^2}{2s_2}.
\tag{20}
```


When $`s_3=0`$ but the spectrum is not sign-symmetric, the
inequality in (19) is still strict by compactness and the equality
classification, though (20) need not detect this.

For example, every spectrum
$`(a_1,-a_1,\ldots,a_k,-a_k,0,\ldots,0)`$
has the explicit complete fourth-order coefficient


```math
\Gamma_n(x)=
\frac{3s_4}{4}+
\left(\frac18-\frac1n\right)s_2^2.
```


This is a result about the **local expansion** for an all-order
spectral family, not the full unitary-orbit maximum at arbitrary
spectra. For $`n=4`$, $`x=(2,-2,1,-1)`$ yields
$`s_2=10,s_4=34,\Gamma_4=13`$. The fixed two-block
zero-diagonal matrix has $`q_4=4`$; its other nine units of
fourth-order gain arise from allowing a spectral-orbit drift of
the diagonal. The connected-support approximation in the proof
of (2) is needed at such disconnected limiting matrices.

At a constrained critical point $`H\in\mathcal Z_x`$ with connected
off-diagonal support, the map (10) has full trace-zero rank. Thus
the Lagrange multiplier condition for the remaining maximum in
(16) is


```math
[H,\,2(H\circ|H|^2)+\mathop{\mathrm{diag}}(\eta)]=0
\quad\text{for some real vector }\eta.
\tag{21}
```


Here $`\circ`$ means entrywise multiplication and
$`|H|^2`$ is entrywise absolute-square. This follows because
the gradient of $`\sum_{i\lt j}|h_{ij}|^4`$ on the Hermitian space
is $`2(H\circ|H|^2)`$. The commutator equation is necessary,
not sufficient, and the disconnected matching extremizers
require separate treatment. Solving (21) with the prescribed
spectrum is an explicit remaining implication.

## A separate spectral monotonicity

There is an independent all-order consequence of the nonnegative
coefficient representation already in the prior source audit.
For a unitary $`U`$, the polynomial


```math
\mathop{\mathrm{per}}(U\mathop{\mathrm{diag}}(\lambda)U^*)
=\sum_{|\alpha|=n}w_\alpha(U)\lambda^\alpha,
\qquad w_\alpha(U)\ge0,
\tag{12}
```


comes from the Fischer norm of the product of the row linear forms.
For strictly positive $`\lambda=e^y`$, the logarithm of (12) is a
log-sum-exp of affine forms in $`y`$, hence convex.
Taking its supremum over $`U`$ shows that


```math
y\longmapsto\log M_n(e^{y_1},\ldots,e^{y_n})
\tag{13}
```


is convex. It is permutation-invariant, hence Schur-convex.
Consequently, if $`\log\lambda`$ majorizes $`\log\mu`$ for two
positive spectra, then $`M_n(\lambda)\ge M_n(\mu)`$.
No additive-majorization claim or strict equality classification
is made. This is a structural comparison, not the missing numerical
formula for general spectra.

## Exact reproducible checks

The companion standard-library script
[verify_unitary_orbit_quartic.py](verify_unitary_orbit_quartic.py)
checks (5)--(6) for 24 traceless rational symmetric matrices
of orders three through five. Independently it constructs the
truncated adjoint action $`e^{\varepsilon K}He^{-\varepsilon K}`$
and expands the permanent through degree four for two rational,
connected zero-diagonal cores. The coefficients along these two specified paths are

- Order three: $`1,0,14,12,98/3`$, with $`q_4=0`$ and drift gain $`98/3`$.
- Order four: $`1,0,20,34,131`$, with $`q_4=49`$ and drift gain $`82`$.

An additional 40 exact rational zero-diagonal matrices of orders three through six verify the cancellation (15), the nonnegative deficit identity (18), and the cubic spectral bound (20). A matching-supported rational block verifies equality in (18). These are checks of the exact coefficient algebra and the stated path
expansions. They do not optimize $`\Gamma_n(x)`$, and they are not
order-specific resolutions of Problem 1.

## Internal reviews

The [asymptotic review](unitary_orbit_quartic_asymptotic_review.md) checks
uniformity over the orbit, convergence of maximizing diagonals, connected
zero-diagonal approximation and the order of limits in the lower bound.
It also records the corrected distinction between a path coefficient and
the coefficient of the optimized maximum. The [quartic algebra review](unitary_orbit_quartic_review.md)
checks the complex Hermitian identities, nonnegative deficit, all-order
equality classification and commutator normalization. Neither review
converts this local expansion into a full solution of Problem 1.

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

The [targeted quartic priority audit](unitary_orbit_quartic_priority_addendum.md)
credits the principal-subpermanent expansion to earlier work, including
Merris–Rebman–Watkins and Grover's derivative formula. It also records the
classical cycle expansion and the elementary Gram-norm origin of the
deficit identity. No separate novelty is claimed for those ingredients.
The potentially distinct statement is the optimized fourth-order
asymptotic with attainable diagonal drift. The audit found no earlier
full counterpart, but several original extremal papers remain
inaccessible in full; historical priority remains provisional.

The missing implication is an explicit evaluation of the nonnegative deficit minimum in (19), equivalently the entrywise fourth-power maximum in (16), for
general spectra, followed by control away from the scalar
regime. The quartic functional still requires optimization over
an entire zero-diagonal unitary orbit. Replacing that optimization
with generic elimination or the previously solved exceptional
spectrum case would not resolve the open structural task.
