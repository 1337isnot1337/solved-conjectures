# Sokal's coefficientwise Apéry conjecture: bounded-pencil obstruction and the leading coefficients

[Sokal's Conjecture 2](https://rtca2023.github.io/pages_Paris/DocM6/Sokal.pdf), also [Deb P1.2](https://bishaldeb.com/positivity/themes/SMSCHTP/hankel.html), asks whether every Hankel minor of

$$
A_n(1+y)=\sum_{k=0}^n\binom nk^2\binom{n+k}k^2(1+y)^k
$$

has nonnegative coefficients. The arguments here do **not** settle the conjecture. They prove the two highest coefficients of every minor are nonnegative and rule out a class of potential moment representations, even by noncommuting operators. The result is distinct from the known pointwise Stieltjes property at $y\ge0$.

## A bounded self-adjoint linear pencil does not exist

Write $B_n(s)=s^n A_n(1/s)$ and $m_n=\binom{2n}{n}^2$. Directly,

$$
B_n(0)=m_n,\qquad B_n'(0)=\frac{n^2}{4}m_n,\qquad
[y^{n-1}]A_n(1+y)=n(1+n/4)m_n\quad(n\ge1).
$$

Suppose bounded self-adjoint operators $X,Y$ on a Hilbert space and a unit vector $e$ satisfy

$$
A_n(1+y)=\langle e,(X+yY)^n e\rangle
$$

for every $n\ge0$. The leading coefficient gives $\langle e,Y^n e\rangle=m_n$, so

$$
\|Y^j e\|=\sqrt{m_{2j}}=\binom{4j}{2j}
\le \frac{16^j}{\sqrt{2j+1}}.
$$

The elementary estimates used here and below are
$\frac1{2\sqrt m}\le4^{-m}\binom{2m}m\le 1/\sqrt{m+1}$ for $m\ge1$, with the upper estimate also at $m=0$. Each follows by induction from the successive ratio $(2m+1)/(2m+2)$.

Even without commutativity, expanding words with one $X$ and applying Cauchy–Schwarz gives

$$
\big|[y^{n-1}]\langle e,(X+yY)^n e\rangle\big|
\le \|X\|\sum_{j=0}^{n-1}\|Y^j e\|\|Y^{n-1-j}e\|
\le 4\|X\|16^{n-1}.
$$

For the final inequality use
$\sum_{j=0}^{n-1}((2j+1)(2n-2j-1))^{-1/2}\le4$:
on the first half $2n-2j-1\ge n$, and $\sum_{j=0}^{N-1}(2j+1)^{-1/2}\le2\sqrt N$; reflect for the other half. But the exact coefficient above is at least $n16^n/16$. This is a contradiction as $n\to\infty$.

In particular even a positive joint affine random-variable representation fails. One can see this separately from $\mathbb E[XY^{n-1}]=(1+n/4)m_n$ while $\mathbb E[Y^{n-1}]=m_{n-1}$: even moments bound $|X|$ almost surely, while for odd $n$ the ratio of these expectations tends to infinity.

## Any common-vector self-adjoint path at infinity moves by at least order $\sqrt{s}$

Suppose instead one has an arbitrary, not necessarily linear, family of bounded self-adjoint operators $T(s)$ with a common unit vector $e$ and

$$
\langle e,T(s)^j e\rangle=B_j(s)
$$

for all $j\ge0$ and $s$ in a right neighborhood of $0$. For every $0<s\le1/4$ in that neighborhood,

$$
\|T(s)-T(0)\|\ge\frac{\sqrt{s}}{16e^2},
$$

where the $e$ in the denominator is the base of the natural logarithm. In particular no norm-Lipschitz or norm-differentiable family is possible.

To prove this take $n=\lfloor s^{-1/2}\rfloor\ge2$. Then $1/4\le s n^2\le1$ and, by the known linear term and nonnegative higher coefficients,
$B_n(s)-m_n\ge m_n/16\ge16^n/(64n)$.
For $N\ge0$, the coefficient ratio at $s^k$ satisfies

$$
\frac{[s^k]B_N(s)}{m_N}
=\left(\binom Nk\frac{\binom{2N-k}{N-k}}{\binom{2N}N}\right)^2
\le \frac{N^{2k}}{(k!)^2}.
$$

Consequently $B_{2j}(s)\le e^{4}m_{2j}$ for $0\le j\le n$ by summing the exponential series, and
$\|T(s)^j e\|\le e^{2}\,16^j/\sqrt{2j+1}$. The corresponding estimate for $T(0)$ has no factor $e^2$. The noncommutative difference-of-powers identity then gives

$$
\begin{aligned}
 B_n(s)-m_n
 &\le\|T(s)-T(0)\|
  \sum_{j=0}^{n-1}\|T(s)^j e\|\,\|T(0)^{n-1-j}e\|\\
 &\le 4e^2\,16^{n-1}\|T(s)-T(0)\|.
\end{aligned}
$$

Combine the bounds and use $1/n\ge\sqrt{s}$. The conclusion is a lower bound on the required operator displacement, not an existence claim for a representing path of this order.

## The leading two coefficients of every minor

Let $i_1<\cdots<i_k$ and $j_1<\cdots<j_k$ be arbitrary nonnegative integer index sets, let $d=\sum i_\ell+\sum j_\ell$, and put $H(x)=\det(A_{i_\ell+j_m}(x))_{\ell,m=1}^k$. Then

$$
[x^d]H(x)>0,\qquad [x^{d-1}]H(x)>0\ \text{if }d>0.
$$

This also gives the corresponding two assertions in $y$ for $H(1+y)$.

Let $\mu$ be the law of the product of two independent arcsine variables on $[0,4]$. Each has $n$-th moment $\binom{2n}{n}$ by the beta integral, so $\int t^n\,d\mu(t)=m_n$. Put
$V_I(t)=\det(t_b^{i_a})_{a,b=1}^k$ and define $V_J$ analogously. Factoring powers row-wise and column-wise gives $H(x)=x^d\det(B_{i_\ell+j_m}(1/x))_{\ell,m}$. The top coefficient is therefore the $\mu^{\otimes k}$ integral of $V_I V_J/k!$, by Andréief. It is strictly positive: on strictly ordered positive $t_b$, the two determinants are the ordinary Vandermonde $\Delta(t)=\prod_{a<b}(t_b-t_a)$ times Schur polynomials with nonnegative coefficients; there is positive measure where all variables are positive and distinct.

Let $D_b=t_b\partial_{t_b}$. The next coefficient in $x$ equals

$$
\frac{1}{4k!}\int \sum_{b=1}^kD_b^2(V_I V_J)\,d\mu^{\otimes k}.
$$

Indeed, take the $s$ derivative at $s=0$ of the determinant in $B_n(s)$ and use $B_n'(0)=\tfrac14\int(t\partial_t)^2 t^n\,d\mu(t)$. Equivalently this follows at once by expanding the two determinants and applying the product moment functional to their monomials.

Every monomial of $V_I$ has the same sum of squares of exponents, so $\sum_b D_b^2 V_I=(\sum_a i_a^2)V_I$, and similarly for $V_J$. It remains to show the cross term $\sum_b(D_bV_I)(D_bV_J)\ge0$ on strictly ordered positive $t$, since the eigenvalue terms are already strictly positive there when $d>0$. Write $V_I=\Delta S,V_J=\Delta T$ with $S,T$ Schur polynomials. The two pure terms in the cross term's expansion, $ST\sum_b(D_b\Delta)^2$ and $\Delta^2\sum_b(D_bS)(D_bT)$, are nonnegative. The mixed terms are nonnegative because, for any symmetric polynomial $U$ with nonnegative coefficients,

$$
\frac1\Delta\sum_b(D_b\Delta)(D_b U)
=\sum_{a<b}\frac{t_b D_bU-t_a D_aU}{t_b-t_a}\ge0.
$$

For the last sign, group monomials in pairs under the transposition of $t_a,t_b$. For a paired factor $u^p v^q+u^q v^p$ with $u\ge v\ge0$ and $p\ge q$, its contribution to $(uD_u-vD_v)U$ is

$$
q(u-v)(u^p v^q+u^q v^p)
+(p-q)(u^{p+1}v^q-u^q v^{p+1})\ge0.
$$

An unpaired monomial with equal exponents contributes nonnegatively as well. Thus the integrand is positive away from all diagonals at positive $t$ if $d>0$, proving the result.

## Related primary work

[Joshua W. Davis, *Continued-fraction certificates for Sokal's Conjecture 2: what is excluded and what is open*](https://doi.org/10.5281/zenodo.24431203) excludes polynomial S-, J- and T-fraction certificates and several low-bandwidth production matrices. The self-adjoint-pencil constraint above is a separate restriction and does not exclude the nonsymmetric Laurent constant-term formulas familiar from Apéry theory. The determinant argument proves just the two specified coefficients; it does not decide the sign of intermediate coefficients. No priority assertion is made for general representation obstructions beyond the proofs provided here.
