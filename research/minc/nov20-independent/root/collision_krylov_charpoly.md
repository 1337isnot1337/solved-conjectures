# Characteristic polynomial of permanental compounds

Research checkpoint, 20 November 2026 (America/Chicago).

This note gives an exact deterministic algorithm on the full rational
input domain. Its uniform arithmetic bound improves the dense
characteristic-polynomial exponent for every fixed compound degree.
It does not improve that exponent uniformly when the degree grows with
the matrix order. Under the campaign's strict full-resolution rule,
this is algorithmic progress on P17, not a counted resolution.
Historical priority is unverified.

The new step beyond the earlier symmetric-power/Jacobi identity is a
bound on the collision subspace's Krylov length that is independent of
the compound degree. This gives low-degree matrix fractions without
assuming a generic spectrum, cyclicity, or an invertible input matrix.

## 1. Algorithmic bound

Let $`A\in\mathbb Q^{n\times n}`$ and $`2\le k\le n`$. Write

```math
N=\binom nk,\qquad M=\binom{n+k-1}{k},\qquad q=M-N,
\qquad T=n+\binom{n+1}{2}.
```

Let $`\omega>2`$ be any admissible exponent for matrix multiplication
over the coefficient field. In the arithmetic model, there is a
deterministic algorithm for the characteristic polynomial of $`P_k(A)`$
using

```math
\widetilde O\left(
n^{\omega+2}+k^2M+n^2 k2^kq^2+n^2q^\omega
\right)                                                     \tag{1}
```

field operations. Soft notation omits logarithmic factors. This is an
arithmetic bound; it does not assert the same bound in bit operations
for rational inputs of unbounded height. The proof works over any
field of characteristic zero.

For each fixed $`k\ge2`$, one has
$`q=\Theta_k(n^{k-1})`$, so (1) becomes

```math
\widetilde O\left(n^{(k-1)\omega+2}\right).                  \tag{2}
```

The dense $`N\times N`$ benchmark is
$`\widetilde O(n^{k\omega})`$ for fixed $`k`$. Thus (2) saves the
factor $`n^{\omega-2}`$ in that comparison. At $`k=2`$ the exponent is
$`\omega+2`$, matching the existing scale reported on the P17 page.
The theorem treats all multiplicities and all singular inputs. It
does not compute only a generic minimal polynomial.

When $`k`$ is proportional to $`n`$, $`M`$ and $`q`$ can greatly exceed
$`N`$, so (1) need not beat direct construction and dense linear
algebra. One may use the cheaper method for each input size; no
uniform speed improvement in that regime is claimed.

## 2. Symmetric substitution and its collision subspace

Let $`V`$ be the space of linear polynomials in $`x_1,\ldots,x_n`$,
and let $`H_k=\operatorname{Sym}^k V`$ be the degree-$`k`$ homogeneous
polynomial space, in its ordinary monomial basis. Define

```math
S_k(A)f(x)=f(A^{\mathsf T}x).
```

This is a representation:
$`S_k(A)S_k(B)=S_k(AB)`$. Let $`E_k`$ be the span of squarefree
monomials and $`C_k`$ the span of the remaining monomials. Their
dimensions are $`N`$ and $`q`$. The $`E_k\times E_k`$ principal block
of $`S_k(A)`$ is precisely $`P_k(A)`$.

The relevant algebraic fact is

```math
C_k=Q_0\,H_{k-2},\qquad
Q_0=\operatorname{span}\{x_1^2,\ldots,x_n^2\}\subseteq H_2.   \tag{3}
```

A product of two subspaces means the linear span of their products.
Equation (3) follows because a monomial is not squarefree exactly when
some variable has exponent at least two.

Use $`S=S_k(A)`$. Let $`B`$ inject collision coordinates into $`H_k`$
and let $`E`$ extract them, so $`EB=I_q`$. Define the matrix series

```math
F(z)=E(I-zS)^{-1}B=\sum_{t\ge0}F_tz^t,
\qquad F_t=ES^tB.                                         \tag{4}
```

Jacobi's complementary-principal-minor identity gives

```math
\det(I-zP_k(A))=\det(I-zS)\det F(z).                       \tag{5}
```

This is an identity of rational functions, hence of polynomials after
cancellation. It does not require a numerical matrix inverse at a
singular value of $`z`$.

## 3. A degree-independent Krylov length

**Lemma.** For every $`A`$ and every $`k\ge2`$,

```math
S^T C_k\ \subseteq\ C_k+SC_k+\cdots+S^{T-1}C_k,
\qquad T=n+\binom{n+1}{2}.                                \tag{6}
```

**Proof.** Let $`L=S_1(A)`$ on $`V`$, and put $`W=L^nV`$.
The image chain stabilizes by the $`n`$th step, so $`L(W)=W`$
and $`L|_W`$ is invertible. Set $`r=\dim W`$ and
$`d=\dim\operatorname{Sym}^2W=\binom{r+1}{2}`$.

If $`r=0`$, then $`L^n=0`$, hence $`S^n=0`$ for $`k\ge1`$,
and (6) follows. Suppose $`r>0`$. Put
$`Q_n=S_2(A)^nQ_0\subseteq\operatorname{Sym}^2W`$ and let
$`R=S_2(L|_W)`$. Applying (3) and using the invertibility on $`W`$
shows, for every $`t\ge0`$,

```math
S^{n+t}C_k=R^tQ_n\,\operatorname{Sym}^{k-2}W.              \tag{7}
```

Indeed, the image of $`H_{k-2}`$ under substitution by $`L^{n+t}`$
is the whole $`\operatorname{Sym}^{k-2}W`$. Cayley--Hamilton on the
$`d`$-dimensional quadratic space gives

```math
R^dQ_n\subseteq\sum_{t=0}^{d-1}R^tQ_n.
```

Multiplication by $`\operatorname{Sym}^{k-2}W`$ and (7) imply
$`S^{n+d}C_k\subseteq\sum_{t=n}^{n+d-1}S^tC_k`$. This makes the
span through power $`n+d-1`$ invariant under $`S`$. Since
$`d\le\binom{n+1}{2}`$, (6) follows. The argument includes nilpotent
Jordan blocks and repeated nonzero eigenvalues. No diagonalization
has been used. $`\square`$

The dual row-space statement has the same bound. To see this without
confusing coefficient and orthonormal tensor bases, let $`G_k`$ be the
diagonal matrix whose monomial entry at $`x^\alpha`$ is $`\alpha!`$.
The Fischer inner product gives

```math
S_k(A)^{\mathsf T}=G_k S_k(A^{\mathsf T})G_k^{-1}.          \tag{8}
```

Both $`G_k`$ and its inverse preserve $`C_k`$. Apply (6) to
$`A^{\mathsf T}`$ and transpose. Thus there exist constant matrices
$`D_j,L_j\in\mathbb Q^{q\times q}`$ such that

```math
S^T B=\sum_{j=0}^{T-1}S^jBD_j,
\qquad ES^T=\sum_{j=0}^{T-1}L_jES^j.                       \tag{9}
```

Here the superscript $`T`$ in $`S^T`$ is the integer power defined
above; transposes are always written $`\mathsf T`$.

## 4. Exact reconstruction from finitely many collision moments

The two recurrences in (9) imply right and left matrix fractions

```math
F(z)=N_R(z)D_R(z)^{-1}=D_L(z)^{-1}N_L(z),                 \tag{10}
```

where each denominator has degree at most $`T`$, constant term $`I_q`$,
and each numerator has degree less than $`T`$. For example,

```math
D_R(z)=I_q-\sum_{j=0}^{T-1}D_jz^{T-j}
```

makes $`F(z)D_R(z)`$ a polynomial of degree less than $`T`$.

These fractions can be recovered from $`F_0,\ldots,F_{2T}`$ in
$`\widetilde O(q^\omega T)`$ operations by a minimal approximant
basis. The following details specify the extraction and avoid a
genericity hypothesis.

Compute a right approximant basis of the $`q\times2q`$ matrix
$`[F(z)\ -I_q]`$ to order $`2T+1`$, using the truncated series.
Use an unshifted column-reduced basis, equivalently the transpose of
a row-reduced approximant basis. Its predictable-degree property says
that every approximant of degree at most $`T`$ is a polynomial
combination of basis columns of degree at most $`T`$.

The true columns $`(D_R,N_R)^{\mathsf T}`$ from (10) have this degree
bound and top constant block $`I_q`$. Consequently, the top constant
blocks of the basis columns of degree at most $`T`$ span
$`\mathbb Q^q`$. Choose $`q`$ independent such constant columns and
right-multiply the selected columns by the inverse of their top
constant matrix. This produces polynomial matrices $`D,N`$ with

```math
\deg D,\deg N\le T,\qquad D(0)=N(0)=I_q,
\qquad FD-N=O(z^{2T+1}).                                 \tag{11}
```

The finite-order approximation is automatically exact. Use the true
left fraction from (10):

```math
D_L(FD-N)=N_LD-D_LN.
```

The right side is a polynomial of degree at most $`2T`$ and vanishes
to order at least $`2T+1`$. It is zero. Since $`D_L(0)=I_q`$,
this proves $`F=ND^{-1}`$ as a rational matrix. In particular,
the procedure does not lose invariant-factor multiplicities.

Fast minimal approximant bases are a standard external algorithmic
input, credited below. Selecting and inverting the independent constant
block uses $`O(q^\omega)`$ operations. Applying its inverse to all
coefficient matrices uses $`O(Tq^\omega)`$ further operations, already
within the stated cost.
Because $`N(0)=D(0)=I_q`$, both polynomial matrices are nonsingular.
Their determinants can be computed deterministically in
$`\widetilde O(q^\omega T)`$ operations. Equation (5) becomes

```math
\det(I-zP_k(A))=\det(I-zS)\frac{\det N(z)}{\det D(z)}.     \tag{12}
```

Polynomial multiplication and exact division finish the calculation.
The output has degree at most $`N`$, including the correct multiplicity
of zero eigenvalues after reversal to the characteristic polynomial.

## 5. Forming the data without the large symmetric matrix

The representation property gives $`S^t=S_k(A^t)`$. Compute
$`A^t`$ for $`0\le t\le2T`$ by successive exact products. This costs
$`O(n^\omega T)`$ operations.

For monomial exponent vectors $`\alpha,\beta`$ of total degree $`k`$,
the ordinary substitution coefficient is

```math
(S_k(A^t))_{\alpha,\beta}
=\frac{\operatorname{per}(A^t[\alpha\mid\beta])}{\alpha!}.
                                                               \tag{13}
```

The notation repeats row $`i`$ exactly $`\alpha_i`$ times and column
$`j`$ exactly $`\beta_j`$ times. The denominator is the **row**
multiplicity factorial $`\alpha!`$. Formula (13) can also be obtained
by multiplying linear forms directly. Ryser's formula evaluates its
numerator in $`O(k2^k)`$ operations. Only the $`q^2`$ collision entries
are needed for each $`F_t`$, for a total of $`O(Tq^2k2^k)`$ operations.

The factor $`\det(I-zS)`$ also needs no eigenvalue field extension.
Let $`p_r=\operatorname{tr}(A^r)`$. From the characteristic polynomial
of $`A`$, its logarithmic derivative computes all $`p_r`$ through
$`r=kM`$ in $`\widetilde O(kM+n^\omega)`$ operations. In formal-series
notation,

```math
-z\frac{d}{dz}\log\det(I-zA)=\sum_{r\ge1}p_rz^r.          \tag{14}
```

For each $`1\le t\le M`$, compute $`h_0^{(t)},\ldots,h_k^{(t)}`$
from

```math
h_0^{(t)}=1,\qquad
jh_j^{(t)}=\sum_{i=1}^j p_{it}h_{j-i}^{(t)}.              \tag{15}
```

Then $`h_k^{(t)}=\operatorname{tr}(S^t)`$. This follows by triangularizing
over an algebraic closure for the proof: the diagonal entries of the
symmetric power are all eigenvalue monomials of degree $`k`$.
The calculation (14)--(15) itself stays in the original field and
remains valid for every Jordan structure.

Finally,

```math
\det(I-zS)=
\exp\left(-\sum_{t=1}^{M}\frac{h_k^{(t)}}t z^t\right)
\pmod{z^{M+1}}.                                         \tag{16}
```

Equations (15) require $`O(k^2M)`$ scalar operations and the formal
series exponential has softly linear cost in $`M`$. Combining these
costs with Sections 3--4 proves (1). The characteristic polynomial is
$`x^N\det(I-x^{-1}P_k(A))`$.

## 6. Sources, checks, and remaining scope

The representation and Jacobi complementary-minor identity are
classical and already appeared in the repository's earlier P17 work.
The present claim is the uniform quadratic-space Krylov bound and its
use in reconstructing the collision resolvent at low matrix degree.
The generic Krylov/minimal-polynomial shortcut is not used.

External algorithmic inputs inspected for this argument:

- P. Giorgi, C.-P. Jeannerod and G. Villard, *On the Complexity of
  Polynomial Matrix Computations*, ISSAC 2003,
  [author PDF](https://perso.ens-lyon.fr/gilles.villard/BIBLIOGRAPHIE/PDF/issac2003.pdf),
  Section 2 and Definition 2.1: minimal approximant bases, their
  predictable-degree property, and the softly $`q^\omega T`$ cost.
  The generic determinant routine in that older paper is not used.
- G. Labahn, V. Neiger and W. Zhou, *Fast, deterministic computation
  of the Hermite normal form and determinant of a polynomial matrix*,
  Journal of Complexity 42 (2017), 44--71,
  [arXiv:1607.04176v2](https://arxiv.org/pdf/1607.04176), Theorem 1.1:
  the deterministic determinant bound for arbitrary nonsingular
  polynomial matrices. Nonsingularity here follows from constant
  term $`I_q`$.
- [The exact P17 statement](https://yair-lavi.com/mincs-list/problem-17/index.html)
  records earlier results for degree two, bounded rank, and block
  structure. The current argument assumes neither bounded rank nor
  special block structure.

The companion checker validates the identities, the Krylov stabilization,
the left and right degree bounds, finite-moment reconstruction, and the
complete resulting characteristic polynomials using exact arithmetic.
It includes zero and singular matrices, nilpotent blocks, scalar
matrices, and repeated eigenvalues. It uses dense linear algebra for
the small reconstruction checks; the asymptotic complexity in (1)
uses the cited fast approximant and determinant algorithms.

A targeted source search has not yet established priority for this
algorithmic deduction. No claim that the unrestricted P17 problem is
closed is made: the remaining quantitative gap is a uniform speed
improvement when $`k`$ grows with $`n`$.
