# Bellemare–Langlois–Ransford's conjecture

Status: open in this research lane. This note is not a completed-conjecture claim.

Date: 20 November 2026. Owner: analytic_targets. Coordination: issue #80; target: issue #125.

The accepted input for this campaign is the RH/Dirichlet-GRH result at
\`1337isnot1337/riemann-hypothesis-solved@9d5316ec73f5df89c4d95703ed106837b8a4060e\`.
None of the reductions below requires RH. No implication from RH to the required
determinant signs has been established here.

## 1. Full target and source

Bellemare, Langlois and Ransford define

\[
f_k(x)=\frac1k\left\lfloor\frac1x\right\rfloor-
             \left\lfloor\frac1{kx}\right\rfloor,\qquad k\ge2.
\]

Write \(P_{ab}=\langle f_a,f_b\rangle_{L^2(0,1)}\). Their Conjecture 2 requires

\[
D_{j,k}:=\det P[\{2,\ldots,j\},\{2,\ldots,j-1,k\}]>0
\quad(2\le j\le k).
\]

Equivalently, all entries on and below the diagonal of the Cholesky factor of
\(P\), ordered \(2,3,\ldots\), are positive. This is their Conjecture 9.
Principal-minor positivity settles only \(j=k\).

Primary source: H. Bellemare, Y. Langlois and T. Ransford,
*A positivity conjecture related to the Riemann zeta function*,
American Mathematical Monthly 126 (2019), 891–904,
[DOI 10.1080/00029890.2019.1651165](https://doi.org/10.1080/00029890.2019.1651165),
[author manuscript](https://arxiv.org/pdf/2011.02847).

## 2. Exact weighted-sequence formulation

On \(x\in(1/(n+1),1/n]\),

\[
f_k(x)=\{n/k\},\qquad
w_n=\frac1{n(n+1)}.
\]

Consequently

\[
P_{ab}=\sum_{n\ge1}w_n\{n/a\}\{n/b\}.
\tag{1}
\]

The sums converge absolutely. Define the integer residue sequences
\(h_k(n)=k\{n/k\}=n\bmod k\). Multiplying a row or a column by a positive
integer does not change the sign of the target determinant. Thus the same
problem concerns the Gram matrix of \(h_2,h_3,\ldots\) in
\(\ell^2(\mathbb N,w)\).

If \(r_j\) is the residual after projecting \(h_j\) onto
\(\operatorname{span}(h_2,\ldots,h_{j-1})\), the exact missing inequality is

\[
\sum_{n\ge1}w_n r_j(n)h_k(n)>0\qquad(k\ge j).
\tag{2}
\]

The residual is nonzero, but its inner product with a later, different
sequence need not have the sign of its squared norm.

## 3. A negative Cauchy–Binet summand

Put \(A_{nk}=\{n/k\}\). Applying finite Cauchy–Binet to (1) truncated at \(n=N\)
and then letting \(N\) increase gives

\[
D_{j,k}=
\sum_{\substack{S\subset\mathbb N\\ |S|=j-1}}
\det A[S,2,\ldots,j]\,
\det A[S,2,\ldots,j-1,k]\,
\prod_{n\in S}w_n.
\tag{3}
\]

This passage is justified directly: each matrix entry is bounded by one,
the two determinants have a bound depending only on \(j\), and
\(\sum_{|S|=j-1}\prod_{n\in S}w_n\le(\sum_nw_n)^{j-1}/(j-1)!\).

The summands in (3) do not all have the same sign. For \(j=3,k=4\) and
\(S=\{1,3\}\),

\[
\det\begin{pmatrix}1/2&1/3\\1/2&0\end{pmatrix}=-\frac16,\qquad
\det\begin{pmatrix}1/2&1/4\\1/2&3/4\end{pmatrix}=\frac14.
\]

Their product is \(-1/24\). This is an exact obstruction to proving (3) by
termwise positivity. It is not a counterexample to the conjecture: other row
sets contribute, and the full weighted sum is the quantity in question.

## 4. Decreasing weights alone do not suffice

One possible extension would replace \(w_n\) in (1) by an arbitrary
nonnegative decreasing sequence. That extension is false.

Take \(w_1=\cdots=w_7=1/7\) and \(w_n=0\) for \(n\ge8\).
For rows \(2,3,4\) and columns \(2,3,6\), direct rational summation gives

\[
\begin{pmatrix}
1/7&2/21&5/42\\
2/21&11/63&10/63\\
1/7&5/42&11/84
\end{pmatrix},
\qquad
\det=-\frac1{12348}<0.
\tag{4}
\]

This is the natural-order target \(j=4,k=6\) for the altered weights.
Every entry and the determinant in (4) were independently evaluated with
exact rational arithmetic.

The required weights have the stronger representation

\[
w_n=\int_0^1 x^{n-1}(1-x)\,dx.
\tag{5}
\]

Thus they form a completely monotone sequence. Formula (4) does not
disprove an extension restricted to such weights. Conversely, no proof of
that stronger extension is supplied here. Positivity of a Cholesky factor
is nonlinear in the matrix entries, so proving it separately for geometric
weights would not by itself justify passing to the mixture (5).

## 5. Divisor basis and Ramanujan sums

Set \(h_1=0\), and for \(j\ge2\) define

\[
g_j(n)=\sum_{d\mid j}\mu(j/d)h_d(n).
\tag{6}
\]

Möbius inversion gives

\[
h_k(n)=\sum_{\substack{d\mid k\\d\ge2}}g_d(n).
\tag{7}
\]

The change of basis is lower triangular in the natural order, with diagonal
one. In particular, the spans through any given index agree. The residual
of \(h_j\) modulo the preceding span is the residual of \(g_j\).

Since

\[
h_d(n)-h_d(n-1)=1-d\,\mathbf1_{d\mid n},
\]

and \(\sum_{d\mid j}\mu(j/d)=0\) for \(j>1\), equation (6) yields

\[
g_j(n)-g_j(n-1)
=-\sum_{d\mid(j,n)}d\mu(j/d)
=-c_j(n),
\tag{8}
\]

where \(c_j\) is the Ramanujan sum.

This basis separates the nonconstant Fourier frequencies by their exact
orders. Indeed, for a nontrivial frequency \(\theta=2\pi a/j\), the Fourier
coefficient of \(h_d\), viewed as a \(j\)-periodic sequence, vanishes unless
the order \(q=j/\gcd(a,j)\) divides \(d\). When \(q\mid d\), that coefficient is
\(-1/(1-e^{-i\theta})\). Therefore the corresponding coefficient of \(g_j\)
is

\[
-\frac{1}{1-e^{-i\theta}}
\sum_{\substack{d\mid j\\q\mid d}}\mu(j/d),
\]

which vanishes unless \(q=j\). The mean of \(g_j\) over a full period is

\[
m_j=\sum_{d\mid j}\mu(j/d)\frac{d-1}{2}=\frac{\varphi(j)}2>0.
\tag{9}
\]

Neither \(g_j\ge0\) nor positive cross-inner-products follows for the
original weighted space. For example,

\[
g_6(1)=h_6(1)-h_3(1)-h_2(1)=-1.
\]

Equation (8) is a structural reduction, not a positivity proof.

## 6. A complete averaging analogue

For periodic sequences define the Cesàro inner product

\[
\langle a,b\rangle_{\rm av}
=\lim_{N\to\infty}\frac1N\sum_{n=1}^Na(n)b(n).
\]

For any fixed finite collection of the sequences above, this is just the
average over a common period. In this different inner product, the full
natural-order Cholesky positivity statement can be proved.

### Lemma

Every entry on and below the diagonal of the Cholesky factor of
\((\langle h_j,h_k\rangle_{\rm av})_{j,k\ge2}\), interpreted through its
finite leading blocks, is positive.

### Proof

The centered periodic sequences \(g_j-m_j\) and \(g_k-m_k\) are orthogonal
when \(j\ne k\): their nonzero Fourier frequencies have different exact
orders. Set

\[
v_j=\langle g_j-m_j,g_j-m_j\rangle_{\rm av}>0.
\]

The strict inequality holds because \(g_j\) has a nonzero primitive
\(j\)-th Fourier coefficient. Thus the Gram matrix in the \(g\)-basis is

\[
B=\operatorname{diag}(v_j)+mm^{\mathsf T}.
\]

For \(j\ge2\), put

\[
S_1=1,\qquad S_j=1+\sum_{r=2}^j\frac{m_r^2}{v_r}.
\]

Its Cholesky factor \(C\) has entries

\[
C_{jj}=\sqrt{\frac{v_jS_j}{S_{j-1}}},\qquad
C_{ij}=\frac{m_im_j}{\sqrt{v_jS_{j-1}S_j}}\quad(i>j).
\tag{10}
\]

These formulas follow by a one-step Schur complement of a positive
diagonal matrix plus a rank-one matrix, or by direct multiplication.
Every displayed entry is positive.

Let \(E_{kd}=\mathbf1_{d\mid k}\), with indices starting at two.
Equation (7) gives the Gram matrix in the \(h\)-basis as \(EBE^{\mathsf T}\).
Since \(E\) is lower triangular with diagonal one, its Cholesky factor is
\(EC\). For \(k\ge j\), the entry \((EC)_{kj}\) contains the strictly positive
term \(C_{kj}\), corresponding to the divisor \(d=k\), and its other terms
are nonnegative. This proves the lemma. \(\square\)

A separate elementary calculation gives the averaged Gram entries:

\[
\langle h_j,h_k\rangle_{\rm av}
=\frac{(j-1)(k-1)}4+\frac{\gcd(j,k)^2-1}{12}.
\tag{11}
\]

To see this, write \(d=\gcd(j,k)\) and choose \(n\) uniformly modulo
\(\operatorname{lcm}(j,k)\). Conditional on \(R=n\bmod d\), the residues
of \((n-R)/d\) modulo \(j/d\) and \(k/d\) are independent and uniform by
the Chinese remainder theorem. The covariance of \(h_j,h_k\) is therefore
\(\operatorname{Var}(R)=(d^2-1)/12\), and their means are
\((j-1)/2,(k-1)/2\).

This averaging lemma is recorded to identify precisely what the divisor
basis accomplishes. It is not a solution, a named-conjecture count, or a
novelty claim. The original inner product gives substantial mass to the
first few integers and does not preserve the Fourier orthogonality used
above.

## 7. RH and the remaining gap

The source's Nyman–Báez-Duarte criterion states that RH is equivalent to
the distance of \(1\) from \(\operatorname{span}(f_2,\ldots,f_n)\) tending
to zero. The paper's conclusion explicitly leaves its relationship to
the positivity conjecture unanswered.

Under the accepted RH input, that approximation statement is available.
It does not supply the signs of the finite residual inner products (2).
A proof still needs a sign-preserving argument for the exact harmonic
weights, or a new implication from RH with every additional hypothesis
stated and proved. No such implication is being inferred from density,
positive definiteness, or the averaging lemma.

## 8. Status search and checkpoint

Searches on 20 November 2026 checked the exact author names, the title,
arXiv identifier, Cholesky formulation, and combinations with proof,
resolution, and recent years. The publisher record, author manuscript,
author's talk slides and recent bibliographic listings returned the
original formulation; no full resolution was located. This is a bounded
negative search, not proof that no later work exists.

Relevant direct records:

- [Original publisher record](https://www.tandfonline.com/doi/abs/10.1080/00029890.2019.1651165).
- [2020 author slides](https://www.math.ttu.edu/~lhoang/PureMath/2020-Fall/Slides-2020-10-26-Ransford.pdf).
- [Author's 2019 Seattle slides](https://www.math.ksu.edu/~pietro/Seattle19-Slides/Tom-Ransford.pdf).

The next mathematical question is whether the exact weights (5), together
with the residue/divisibility structure, imply a useful inequality for
the residuals in (2). The present checkpoint settles two tempting stronger
arguments negatively and proves a different averaging analogue, while
leaving the full named conjecture open.
