# Zero-diagonal doubly stochastic minimum

Research checkpoint: 21 November 2026. No solution to Conjecture 44 is claimed.
The exact examples below refute auxiliary approaches, not the conjecture.

## Statement and prior work

For every doubly stochastic nonnegative matrix A of order n with zero diagonal,
the conjecture asks whether

```math
\mathop{\mathrm{per}} A\geq \frac{D_n}{(n-1)^n},
```
with equality only at U_n=(J-I)/(n-1). Here D_n counts derangements.

The [current Minc-list entry](https://yair-lavi.com/mincs-list/conjecture-44/index.html)
still labels this open. It reports London–Minc's proof for n≤4 and Burghduff's
strict local minimality theorem in every order. Its new bounds constrain any
counterexample to a Frobenius neighborhood of U_n of squared radius
sqrt(2/n)+O(1/n). The page also excludes disconnected supports and some simplex
faces. Its order-five checks and local shell bounds do not resolve the problem.

Primary publication records checked:

- D. London and H. Minc, *On the permanent of doubly stochastic matrices with
  zero diagonal*, Linear and Multilinear Algebra 24 (1989), 289–300,
  [DOI](https://doi.org/10.1080/03081088908817922). The abstract states n≤4.
- J. B. Burghduff, *Minimum permanents of doubly stochastic matrices with zero
  main diagonal*, Linear and Multilinear Algebra 40 (1995), 125–140,
  [DOI](https://doi.org/10.1080/03081089508818428). The abstract states strict local
  minimality. Full text was not obtained in this audit.
- L. Gurvits and J. Leake, *Unique Minimizers for Permanents, Mixed Discriminants,
  and Log-concave Polynomials*, [arXiv:2609.21083v2](https://arxiv.org/html/2609.21083v2),
  15 October 2026. The main results concern rank-one minima for perturbed
  marginals and coefficient minima for strongly log-concave polynomials.
  Section 1.4 explicitly reports that their attempts on Birkhoff faces did not
  immediately give new results. No zero-diagonal theorem is asserted there.
- S. Sra, *A new proof of van der Waerden's inequality, and beyond*,
  [full preprint](https://hexagonmath.org/pdf/2611.00118v1), first public release
  31 October 2026. Sections 2.1–2.2 prove monotonicity of a minimum-total-correlation
  functional under separate row or column averaging. Such an averaging does
  not preserve the zero-diagonal face. The following exact example rules out
  an unrestricted replacement by simultaneous row-and-column relabeling.

## Transpose averaging is not a descent for the permanent

Set

```math
A=\frac12\begin{pmatrix}
0&1&1&0\\1&0&0&1\\0&1&0&1\\1&0&1&0
\end{pmatrix}.
```
Both A and (A+A^T)/2 are zero-diagonal doubly stochastic. Direct expansion gives

```math
\mathop{\mathrm{per}}A=\frac18,
\qquad
\mathop{\mathrm{per}}\frac{A+A^T}{2}=\frac9{64}>\frac18.
```
This says nothing against Conjecture 44: both values exceed per U_4=1/9.
It excludes unconditional transpose symmetrization as a proof step.

## Principal-cofactor inequality fails

The combinatorial agent proposed and then disproved the potential bound
sum_i per A(i|i)≤n per A. Its obstruction can be checked exactly as follows.
Let

```math
A_t=(1-t)(U_3\oplus U_3)+t\begin{pmatrix}0&J_3/3\\J_3/3&0\end{pmatrix}.
```
For 0<t<1 every off-diagonal entry is positive. Put a=(1-t)/2 and b=t/3.
Then

```math
P=4a^6+81a^4b^2+144a^2b^4+36b^6,
\qquad q=2a^5+18a^3b^2+24ab^4
```
are its permanent and each principal cofactor. At t=1/10,

```math
P=\frac{4787641}{129600000},\quad
q=\frac{185959}{4800000},\quad
q-P=\frac{58313}{32400000}>0.
```
Thus the proposed bound fails even on the relative interior of the face.

## Conjugation averaging can decrease the entropy functional

For a doubly stochastic marginal matrix P, let H_perm(P) be the largest Shannon
entropy of a law on permutations with marginals P. Write

```math
I(P)=-\sum_{ij}p_{ij}\log p_{ij}-H_{\rm perm}(P).
```
All permutations in this section are derangements, since the diagonal marginals
are zero. If B has zero diagonal and positive off-diagonal entries, its Gibbs
law assigns probability prod_i b_{i,σ(i)}/Z to each derangement, where
Z=per B. Its marginal matrix is p_ij=b_ij c_ij/Z, with
c_ij=per B(i|j). The Gibbs law is the unique entropy maximizer at those
marginals by the relative-entropy variational principle.

On the relative interior of the zero-diagonal face, ordinary finite-dimensional
exponential-family duality gives

```math
dI(P)[D]=\sum_{i\ne j}D_{ij}\log\frac{b_{ij}}{p_{ij}}
       =-\sum_{i\ne j}D_{ij}\log c_{ij},
```
for any tangent D. The term log Z cancels because sum D_ij=0. Smoothness follows
by restricting the parameter space to the orthogonal complement of the affine
relations among the derangement incidence vectors: the covariance is positive
definite there.

Take the integer weight matrix

```math
B=\begin{pmatrix}
0&1&2&2\\2&0&1&2\\2&2&0&1\\1&4&1&0
\end{pmatrix},\qquad Z=91.
```
Its Gibbs marginal matrix is

```math
P=\frac1{91}\begin{pmatrix}
0&7&56&28\\26&0&21&44\\52&20&0&19\\13&64&14&0
\end{pmatrix}.
```
The off-diagonal cofactors of B are

```math
C_{\rm off}=\begin{pmatrix}
*&7&28&14\\13&*&21&22\\26&10&*&19\\13&16&14&*
\end{pmatrix}.
```
Let T interchange indices 1 and 3, and let P(t)=(1-t)P+tTPT^T. This stays
inside the zero-diagonal doubly stochastic face. The integer numerator of
P'(0) is

```math
91P'(0)=\begin{pmatrix}
0&13&-4&-9\\-5&0&5&0\\4&-13&0&9\\1&0&-1&0
\end{pmatrix}.
```
Substitution in the differential yields

```math
\left.\frac{d}{dt}I(P(t))\right|_{t=0}
=-\frac1{91}\log\frac{3^5 7^4 19^9}{2^{27}5^{13}}
=-\frac1{91}\log\frac{188269878455273097}{163840000000000000}<0.
```
The sign follows from an integer comparison, with no floating-point premise.
Consequently I is not always nondecreasing under conjugation averaging.
This does not exclude a special theorem restricted to permanent minimizers.

## A minimizer-specific Alexandrov–Fenchel constraint

Suppose A is a stationary point in the relative interior of the zero-diagonal
face. Its off-diagonal cofactors are all P=per A. One way to verify this standard
condition is to write the Lagrange multipliers as c_ij=λ_i+μ_j on the support.
Expanding along rows and columns gives λ=P1−Aμ and μ=P1−A^Tλ. Hence
λ=AA^Tλ; irreducibility of AA^T forces constant λ, and then constant μ.

Set δ_i=c_ii/P−1. Fix rows i,j and regard the permanent as the symmetric
bilinear form F(u,v) in those two rows, keeping the other rows fixed. For the
actual rows u=A_i and v=A_j,

```math
F(u,v)=P,\qquad
F(u,u)=P(1+a_{ij}\delta_j),\qquad
F(v,v)=P(1+a_{ji}\delta_i).
```
The quadratic Alexandrov–Fenchel inequality therefore implies

```math
(1+a_{ij}\delta_j)(1+a_{ji}\delta_i)\leq1.
```
This is necessary but no rigidity argument was obtained from it. In particular,
the diagonal cofactors at U_n are smaller than P, so the inequality is consistent
with the expected minimum and does not by itself force δ_i=0.

At boundary points the allowed-zero cofactor inequalities must also be retained;
it would be invalid to apply the displayed interior equalities indiscriminately.

## Verification and remaining gap

Run `python research/minc/sign-matrices/c44_obstructions.py` for exact rational checks of all three
auxiliary obstructions. The code enumerates only the small witnesses needed to
validate the identities. It does not perform or claim a finite-order extension
of Conjecture 44.

The open step is a global argument forcing U_n among minimizers, or an exact
counterexample to the conjectured permanent bound. Ordinary averaging,
principal-cofactor summation, and unrestricted entropy conjugation averaging do
not provide that step.
