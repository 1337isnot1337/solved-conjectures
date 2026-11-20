# Granville–Soundararajan's conjecture

## Status

The target here is the full smooth approximation conjecture for character sums. It is distinct from [Soundararajan's conjecture on smooth numbers in arithmetic progressions](soundararajan.md).

**No complete proof or disproof is obtained.** Accepting Dirichlet GRH supplies the fixed power range proved by Dong–Zhao–Zhou in November 2026. The available short character sum estimates do not extend that result to the full original statement. This note identifies an exact missing bilinear prime sum, proves why direct use of the usual GRH estimate does not control it, and records the older sharp least nonresidue consequence. None of these observations is counted as another solved conjecture.

Research and source check: 20 November 2026. Coordination: [issue 80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

## 1. Exact target and quantifiers

Put
\[
S(x,\chi)=\sum_{n\le x}\chi(n),\qquad
\Psi(x,y;f)=\sum_{\substack{n\le x\\P^+(n)\le y}}f(n),
\]
where \(P^+(1)=1\), and let \(\chi_0\) be the principal character modulo the same modulus \(q\).

Granville–Soundararajan's original Conjecture 1 asserts that there is **one absolute constant** \(A>0\) for which
\[
 S(x,\chi)=\Psi(x,Y_A(x,q);\chi)
       +o\!\left(\Psi(x,Y_A(x,q);\chi_0)\right),
 \tag{1}
\]
uniformly over every nonprincipal character modulo \(q\), and every \(1\le x\le q\), as \(q\to\infty\), where
\[
 Y_A(x,q)=\bigl(\log q+(\log x)^2\bigr)(\log_2q)^A.
 \tag{2}
\]
The original statement does not impose primitivity. See [GS, Conjecture 1, preprint p. 2](https://arxiv.org/pdf/math/9903196).

The normalizing count imposes both smoothness and coprimality. Replacing it by \(x\), or by the count of all smooth numbers for a general composite modulus, changes the problem.

For \(x\le Y_A(x,q)\), (1) is an exact identity with zero error. The difficult short lengths lie above this automatic range.

## 2. What the new primary paper proves

Dong–Zhao–Zhou prove the following under RH for the individual nonprincipal \(L(s,\chi)\). Fix
\[
 0<a\le1,\qquad C>6,\qquad
 0<\gamma<(C-6)/4.
\]
Uniformly for \(q^a\le x\le q\), with \(y=Y_C(x,q)\),
\[
 |S(x,\chi)|+|\Psi(x,y;\chi)|
 \ll_{a,C,\gamma}
 \Psi(x,y;\chi_0)
 \exp\!\left(
 -\gamma\frac{(\log x)\log_3q}{\log_2q}
 \right).
 \tag{3}
\]
This proves (1) in that range by the triangle inequality.

Their Theorem 1.2 also proves that a full, uniform upper bound
\[
 |S(x,\chi)|\le K\Psi(x,Y_A(x,q);\chi_0)
\]
for fixed \(A,K\), all nonprincipal characters, and all \(x\le q\), implies Dirichlet GRH. Their proof uses imprimitive characters induced to moduli divisible by all small primes. The forward implication and the restricted converse are not a full equivalence.

Source: [DZZ, Theorems 1.2 and 1.4, Corollary 1.3](https://arxiv.org/html/2611.11389v1), submitted 8 November 2026.

The constant in (3) depends on the fixed lower exponent \(a\). Substituting \(a=\log x/\log q\) when that quantity tends to zero is not justified.

## 3. Exact reduction in the short range

Fix \(A>0\) and \(1<B<2\). Write
\[
 Q=\log q,\qquad \ell=\log Q,\qquad x=Q^B,\qquad y=Y_A(x,q).
\]
Then
\[
 y=(Q+B^2\ell^2)\ell^A
   =Q\ell^A(1+o(1)),
 \qquad y<x<y^2
 \tag{4}
\]
for sufficiently large \(q\).

Define
\[
 \Pi_\chi(z)=\sum_{p\le z}\chi(p).
\]
Every integer \(n\le x\) omitted from the smooth sum has exactly one prime factor \(p>y\), counted with multiplicity. Indeed, two such factors would have product exceeding \(y^2>x\). Writing \(n=mp\), we have \(m\le x/y<y\). Consequently there is the exact identity
\[
\begin{aligned}
 D(x,y;\chi)
 &:=S(x,\chi)-\Psi(x,y;\chi)\\
 &=\sum_{m\le x/y}\chi(m)
       \sum_{y<p\le x/m}\chi(p)\\
 &=\sum_{m\le x/y}\chi(m)
       \left(\Pi_\chi(x/m)-\Pi_\chi(y)\right).
\end{aligned}
\tag{5}
\]
There is no approximation, lost multiplicity, or additional smoothness restriction in (5). If an endpoint gives an empty prime interval, its contribution is zero.

Take \(q\) prime. Since \(x<q\), every positive integer up to \(x\) is coprime to \(q\). Thus
\[
 \Psi(x,y;\chi_0)=\Psi(x,y).
\]
The same factorization without character weights gives
\[
 x-\Psi(x,y)
 =\sum_{y<p\le x}\left\lfloor\frac{x}{p}\right\rfloor+O(1)
 =x\sum_{y<p\le x}\frac1p+O(\pi(x))+O(1).
\]
Mertens' prime reciprocal estimate and \(\pi(x)=O(x/\log x)\) imply
\[
 \frac{x-\Psi(x,y)}x
 =\log\frac{\log x}{\log y}+o(1)
 =\log B+o(1).
\]
Therefore
\[
 \Psi(x,y)=(1-\log B+o(1))x.
 \tag{6}
\]
This is also the elementary \(1<B<2\) part of the Dickman asymptotic, since \(\rho(B)=1-\log B\).

Because \(1-\log B>0\), (1) at these lengths is equivalent to the genuinely uniform estimate
\[
 \boxed{
 \sup_{\substack{\chi\bmod q\\ \chi\ne\chi_0}}
 \frac1{(\log q)^B}
 \left|
 \sum_{m\le x/y}\chi(m)
 \bigl(\Pi_\chi(x/m)-\Pi_\chi(y)\bigr)
 \right|
 \longrightarrow0
 \quad(q\to\infty,\ q\ {\rm prime})
 }
 \tag{7}
\]
as the prime modulus tends to infinity, with \(x=(\log q)^B\) and \(y=Y_A(x,q)\). The supremum is over characters for each prime modulus.

Equation (7) is a necessary subproblem of the full conjecture, not a replacement target or a claimed solution.

## 4. Direct GRH estimates fail to give the required saving

Under Dirichlet GRH, the standard estimate is
\[
 \Pi_\chi(z)\ll \sqrt z\,\log(qz)
 \qquad(z\ge2,\ \chi\ne\chi_0).
 \tag{8}
\]
A primary research source states precisely this estimate as [Granville–Soundararajan, equation (5.1)](https://arxiv.org/pdf/math/0503113). It also appears as Theorem 13.7 in Montgomery–Vaughan.

In the range above, \(z\le x<q\), so \(\log(qz)\ll Q\). Applying (8) to (5) and using \(|\chi(m)|\le1\), with \(M=\lfloor x/y\rfloor\), gives
\[
\begin{aligned}
 |D(x,y;\chi)|
 &\ll Q\left(
 \sqrt x\sum_{m\le M}m^{-1/2}+M\sqrt y
 \right)\\
 &\ll Q\left(\sqrt{xM}+M\sqrt y\right)\\
 &\ll \frac{xQ}{\sqrt y}
 \asymp x\,\frac{\sqrt Q}{\ell^{A/2}}.
\end{aligned}
\tag{9}
\]
For every fixed \(A\),
\[
 \frac{\sqrt Q}{\ell^{A/2}}\longrightarrow\infty.
\]
Thus this GRH argument does not even produce a saving over the trivial bound \(O(x)\), whereas (7) requires \(o(x)\).

This is a failure of the specified estimate and triangle inequality. It is **not** a proof that Dirichlet GRH cannot imply the conjecture.

To repair (9), one needs information that controls the weighted prime sum in (5) before all cancellation is discarded, or stronger pointwise prime character estimates at these lengths. The accepted zero location statement by itself has not supplied that additional estimate in this investigation.

## 5. The sharp least nonresidue consequence is already visible here

Suppose (1) holds with an absolute \(A\). For an odd prime \(q\), let \(\chi\) be the quadratic character modulo \(q\), and let \(n(q)\) be its least quadratic nonresidue.

If along an infinite sequence of such primes
\[
 n(q)>x=(\log q)^B,\qquad 1<B<2,
\]
then every integer \(n\le x\) has \(\chi(n)=1\). Hence
\[
 S(x,\chi)=\lfloor x\rfloor,\qquad
 \Psi(x,y;\chi)=\Psi(x,y;\chi_0)=\Psi(x,y).
\]
By (6),
\[
 \frac{|S(x,\chi)-\Psi(x,y;\chi)|}
      {\Psi(x,y;\chi_0)}
 \longrightarrow
 \frac{\log B}{1-\log B}>0,
\]
contradicting the uniform little-\(o\) statement.

Thus the full conjecture would imply, for every \(\varepsilon>0\),
\[
 n(q)\le(\log q)^{1+\varepsilon}
 \quad\text{for every sufficiently large prime }q.
 \tag{10}
\]
This argument does not assert that the hypothesized sequence with \(n(q)>x\) exists. It establishes a necessary consequence.

Granville–Soundararajan already state the improvement from the GRH exponent \(2+o(1)\) to \(1+o(1)\) immediately after their original conjecture. The reduction is recorded here to expose the size of the unresolved short range; it is not claimed as new. It is also stronger than the traditional subpower Vinogradov conjecture discussed in [vinogradov.md](vinogradov.md).

A separate established consequence illustrates the same gap: Yang records that the full smooth approximation conjecture gives
\[
 |L(1,\chi)|\le(e^\gamma+o(1))\log_2q,
\]
whereas the classical GRH upper bound has leading constant \(2e^\gamma\). See [Yang, printed pp. 6–7](https://arxiv.org/pdf/2204.13826). This comparison is evidence that a new argument is needed, not a theorem of logical independence.

## 6. Why the other available character sum theorems do not fill the gap

The original GRH approximation theorem uses the larger cutoff
\[
 y_{\rm old}\ge
 (\log q)^2(\log x)^2(\log_2q)^{12}
\]
and an error normalized by all smooth integers. Its separate cancellation conclusion is \(S(x,\chi)=o(x)\) when
\[
 \frac{\log x}{\log_2q}\longrightarrow\infty.
\]
These are [GS, Theorem 2](https://arxiv.org/pdf/math/9903196).

At \(x=Q^B\), \(1<B<2\),
\[
 y_{\rm old}\ge B^2Q^2\ell^{14}>x.
\]
Its smooth approximation is therefore the identity \(S=\Psi\) at this larger cutoff. It says nothing about removing primes between the conjectured cutoff \(Q\ell^A\) and \(x\). The ratio
\[
 \frac{y_{\rm old}}{Y_A(x,q)}
 \asymp B^2Q\ell^{14-A}\longrightarrow\infty
\]
for every fixed \(A\), so increasing \(A\) by a fixed amount cannot absorb the discrepancy.

Also,
\[
 \frac{\log x}{\log_2q}=B
\]
is fixed here. The short cancellation conclusion does not apply. Even when that ratio tends to infinity, an \(o(x)\) error does not automatically become \(o(\Psi(x,Y_A;\chi_0))\), because the latter count may be much smaller than \(x\).

The Burgess bound, with its usual parameter \(r\), has the shape
\[
 |S(x,\chi)|\ll_r
 x^{1-1/r}q^{(r+1)/(4r^2)}
\]
in the appropriate prime modulus setting. Its power factor relative to \(x\) has logarithm
\[
 -\frac{B\ell}{r}+\frac{(r+1)Q}{4r^2}>0
\]
for sufficiently large \(q\). It yields no saving at these lengths. Pólya–Vinogradov and its GRH improvement are much larger still. Results for almost all characters leave exceptional characters, whereas (1) quantifies over every nonprincipal character.

There is also a visible quantitative obstruction in the DZZ contour argument. With
\[
 X=\log x,\quad
 \sigma_b=\frac12+b\frac{\log\ell}{\ell},
\]
its logarithmic error scale is \(Q\ell^{2-2b}\), while the separation between the upper estimate and the smooth count is measured on the scale \(X\log\ell/\ell\). Their ratio is
\[
 \frac{Q}{X}\frac{\ell^{3-2b}}{\log\ell}.
 \tag{11}
\]
For \(X\ge aQ\) and fixed \(b>3/2\), this tends to zero. For \(X=B\ell\), it diverges for every fixed \(b\). In addition, the paper's estimate for the finite Euler product assumes \(y\) is comparable to \(Q^2\ell^C\), which fails at (4). Formula (11) is an audit of why that proof does not extend by substituting a variable \(a\); we are not applying its theorem outside its hypotheses.

## 7. Prior-art check and disposition

The following primary sources were read directly:

1. A. Granville and K. Soundararajan, *Large character sums*, JAMS 14 (2001), 365–397. [Clean preprint](https://arxiv.org/pdf/math/9903196), [DOI](https://doi.org/10.1090/S0894-0347-00-00357-X). Exact Conjecture 1; Theorem 2; the sharp least nonresidue consequence; Section 8's logarithmic approximation.
2. A. Granville and K. Soundararajan, *Large character sums: Pretentious characters and the Pólya–Vinogradov theorem*. [Preprint](https://arxiv.org/pdf/math/0503113). Equation (5.1), and the prime factor decomposition in Lemma 5.2.
3. D. Yang, *Extreme values of derivatives of zeta and L-functions*, BLMS 56 (2024), 79–95; online 2023. [Preprint v4](https://arxiv.org/pdf/2204.13826), [DOI](https://doi.org/10.1112/blms.12915). Treats the full smooth approximation as a separate conjectural input and records sharp \(L(1,\chi)\) consequences.
4. Z. Dong, S. Zhao, and G.-L. Zhou, *Smooth approximations to character sums and zeta sums*, 8 November 2026. [HTML v1](https://arxiv.org/html/2611.11389v1), [arXiv entry](https://arxiv.org/abs/2611.11389). Full conjecture remains stated; converse from GRH is restricted to fixed powers.
5. A. Granville and K. Soundararajan, *Large character sums: Burgess's theorem and zeros of L-functions*, JEMS 20 (2018), 1–14. [Publisher abstract](https://ems.press/journals/jems/articles/15182). Its cancellation question is \(o(x)\) for \(x\ge q^\varepsilon\), not the normalized smooth approximation.
6. The original September/October 2026 QRH manuscripts and the [164-page October consequences survey](https://hexagonmath.org/pdf/2610.00178v1), already screened in this research lane. The survey's Granville–Soundararajan cancellation section does not assert the full smooth approximation.

Fresh searches used both search engines, the exact conjecture name, the phrase “smooth approximation,” proof/disproof terms, and recent-date filters. They located the November 8 paper and no later full solution through November 20. Search silence does not certify priority. No priority claim is made.

**Disposition:** retain as an unresolved full named target. Equations (5)–(10) give a concrete missing estimate and a known necessary consequence. Do not label the fixed power theorem, a variable cutoff approximation, an almost-all-characters statement, or a numerical experiment as a solution of (1).
