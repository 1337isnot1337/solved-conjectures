# Csordas–Vishnyakova conjecture

Research date: 20 November 2026. [Issue #132](https://github.com/1337isnot1337/solved-conjectures/issues/132). Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

## Exact statement and result

The target is **Conjecture 3.6**, printed page 1649, of G. Csordas and A. Vishnyakova, [*The generalized Laguerre inequalities and functions in the Laguerre–Pólya class*](https://www.degruyterbrill.com/document/doi/10.2478/s11533-013-0269-x/pdf), *Central European Journal of Mathematics* **11**(9) (2013), 1643–1650, DOI 10.2478/s11533-013-0269-x.

Its setup fixes an even polynomial
\[
p(z)=\sum_{k=0}^{m}c_kz^k
     =\prod_{j=1}^{m}(z+\alpha_j),\qquad c_k\ge0, \tag{1}
\]
having a nonreal zero. For a nonzero real entire function \(\varphi\), define
\[
\Phi(z,t)=\prod_{j=1}^{m}\varphi(z+\alpha_jt)
         =\sum_{k=0}^{\infty}A_k(z)t^k. \tag{2}
\]
The conjecture says that
\[
A_k(x)\ge0\quad(x\in\mathbb R,\ k\ge0) \tag{3}
\]
implies \(\varphi\in\mathcal{LP}\), the Laguerre–Pólya class. There is no order or genus assumption in this conjecture.

**Theorem.** The conjecture is false. An exact counterexample is
\[
\boxed{\quad p(z)=z^4+z^2+1,\qquad
             \varphi(z)=\exp(-z^4).\quad} \tag{4}
\]

This refutes the whole universal implication, with every coefficient and every real argument treated analytically. The proof is unconditional.

## 1. Every hypothesis is satisfied

The polynomial \(p\) in (4) is monic and even. Its coefficients are nonnegative, and all three even coefficients are strictly positive. For every real \(u\),
\[
p(u)=u^4+u^2+1>0. \tag{5}
\]
Thus all four roots are nonreal, so in particular it has the required nonreal root.

The function \(\varphi(z)=e^{-z^4}\) is entire, never zero, and real-valued for real \(z\). It is therefore a nonzero real entire function.

The \(\alpha_j\) in (1) are the negatives of the roots of \(p\). Since \(p\) is even, their multiset is also the multiset of the roots of \(p\). The sign convention in (1) consequently makes no change to the power sums used below.

## 2. The complete coefficient calculation

Let
\[
s_r=\sum_{j=1}^{4}\alpha_j^r.
\]
Evenness gives \(s_1=s_3=0\). Newton's identities for \(z^4+z^2+1\) give
\[
s_2+2=0,\qquad
s_4+s_2+4=0.
\]
Hence
\[
s_0=4,\quad s_1=s_3=0,\quad s_2=s_4=-2. \tag{6}
\]

Expanding the fourth powers and using (6), for all complex \(z,t\),
\[
\begin{aligned}
\sum_{j=1}^{4}(z+\alpha_jt)^4
&=4z^4+4z^3t\,s_1+6z^2t^2\,s_2
   +4zt^3\,s_3+t^4s_4\\
&=4z^4-12z^2t^2-2t^4.
\end{aligned} \tag{7}
\]
Thus the entire generating function (2) has the exact form
\[
\boxed{\quad
\Phi(z,t)=e^{-4z^4}\,e^{12z^2t^2}\,e^{2t^4}.
\quad} \tag{8}
\]

For real \(x\), the two \(t\)-dependent exponential series in (8) both have nonnegative coefficients. More explicitly, every odd coefficient vanishes, and for every integer \(\ell\ge0\),
\[
A_{2\ell}(x)
=e^{-4x^4}
 \sum_{b=0}^{\lfloor\ell/2\rfloor}
 \frac{(12x^2)^{\ell-2b}\,2^b}
      {(\ell-2b)!\,b!}
\ge0. \tag{9}
\]
The usual convention \(a^0=1\), including \(a=0\), is used in this power-series formula.

Equation (9) establishes (3) for every coefficient and every real \(x\). It is an identity of convergent entire power series, with no truncation or numerical approximation.

## 3. The function is not in the Laguerre–Pólya class

Here is a direct proof using the defining polynomial-limit property of \(\mathcal{LP}\).

Suppose that real polynomials \(P_n\), all of whose roots are real, converge to \(\varphi\) uniformly on compact subsets of \(\mathbb C\). For any such nonzero polynomial
\[
P(z)=a\prod_{j=1}^{d}(z-r_j),\qquad a,r_j\in\mathbb R,
\]
we have
\[
P(it)P(-it)=a^2\prod_{j=1}^{d}(r_j^2+t^2). \tag{10}
\]
Every coefficient in (10) is nonnegative. This also holds for constant or identically zero polynomials.

Compact convergence of \(P_n\) implies compact convergence of
\(P_n(it)P_n(-it)\) as entire functions of \(t\). Cauchy's coefficient formula then implies convergence of every Taylor coefficient. Therefore, if \(\varphi\in\mathcal{LP}\), every coefficient of
\(\varphi(it)\varphi(-it)\) must be nonnegative.

But our function gives
\[
\varphi(it)\varphi(-it)
=e^{-2t^4}
=1-2t^4+O(t^8). \tag{11}
\]
The coefficient of \(t^4\) is \(-2\), a contradiction.

In the ordinary generalized Laguerre notation this is exactly
\[
L_2(0,\varphi)=-2<0. \tag{12}
\]
For an independent check, the zero-free case of the classical LP canonical product is \(C e^{-a z^2+bz}\), with \(a\ge0\) and \(b\in\mathbb R\). Its logarithmic derivative is affine, whereas
\(\varphi'(z)/\varphi(z)=-4z^3\). Thus the canonical-product characterization gives the same exclusion.

Equations (9) and (12) prove the theorem.

## 4. Scope and the role of the growth assumption

The quantifier in the original statement is over an arbitrary fixed admissible polynomial \(p\). It does not require the same \(\varphi\) to satisfy (3) simultaneously for every admissible \(p\). Such a different condition would include \(p(z)=1+z^2\), and would exclude (4) by (11).

[D. A. Cardon's original theorem](https://mathdept.byu.edu/cardon/papers/criterion_for_reality_arXiv.pdf), Theorem 2.1 of *Extended Laguerre inequalities and a criterion for real zeros*, arXiv:0911.1122 (2009), published in *Progress in Analysis and its Applications* (2010), 143–149, assumes
\[
\varphi(z)=e^{-a z^2}\varphi_1(z),\qquad
a\ge0,\quad \operatorname{genus}(\varphi_1)\le1. \tag{13}
\]
The function \(e^{-z^4}\) does not satisfy (13). Indeed any such zero-free \(\varphi_1\) has an exponential polynomial of degree at most one, which cannot supply the quartic term. Cardon's theorem is therefore unaffected.

The mechanism is visible in (7): a quartic exponential can grow in the particular complex directions selected by \(p\), making every tested coefficient nonnegative, while it decays on the imaginary axis. The selected product does not force the quadratic growth structure required by \(\mathcal{LP}\).

This problem was reached through the Laguerre–Pólya and generalized Laguerre criteria used for the Riemann \(\Xi\)-function. That connection is standard; for example [Dimitrov and Xu](https://arxiv.org/pdf/1606.05011), Introduction and Section 3, explain RH in terms of LP membership and discuss the Csordas–Vishnyakova criteria. No RH assumption is needed for this counterexample. The final result concerns the proposed general extension of the criterion, rather than a new assertion about zeros of \(\zeta\).

## 5. Statement and prior-art audit

The primary conjecture and its surrounding definitions were checked directly in the publisher PDF. The theorem immediately preceding it retains the genus hypothesis; the conjecture does not. This distinction is essential to the counterexample.

The following sources and followups were checked:

| Source | Relevant scope |
|---|---|
| [Cardon, arXiv:0911.1122](https://mathdept.byu.edu/cardon/papers/criterion_for_reality_arXiv.pdf), Theorem 2.1 | Establishes the criterion with the explicit genus hypothesis (13). |
| [Csordas–Vishnyakova (2013)](https://www.degruyterbrill.com/document/doi/10.2478/s11533-013-0269-x/pdf), equations (13)–(14), Conjecture 3.6 | Original target. Its classical generalized Laguerre theorem is a different, already proved statement. |
| [Dimitrov–Xu, arXiv:1606.05011](https://arxiv.org/pdf/1606.05011), Section 3 | Cites the proved complex Laguerre criterion. The retrieved discussion does not resolve the fixed-\(p\) extension. |
| [Wang–Yang (2024)](https://cfc.nankai.edu.cn/_upload/article/files/81/18/f83d37e449ebaf1b2f4141fa59be/9323c2fc-4d6a-4610-a747-1bd985a7be41.pdf), Introduction | Cites the classical generalized Laguerre characterization and develops coefficient inequalities for \(\Xi\) and partitions. It does not assert the unrestricted fixed-\(p\) implication. |
| [Tyaglov–Atia, arXiv:1912.04951](https://arxiv.org/pdf/1912.04951), later published in 2021 | The advertised counterexample concerns a conjecture of Boris Shapiro about differential polynomials; it is not a counterexample to the present conjecture. |
| [Katkova–Tyaglov–Vishnyakova, arXiv:2406.00686](https://arxiv.org/pdf/2406.00686), published under a revised title in 2025 | The advertised counterexamples again concern Shapiro's conjectures and polynomial zero counts. |
| [*Generalized Laguerre positivity at growing orders*](https://rstation.ai/problems/riemann_hypothesis/papers/41/v3), 23 October 2026 | A current public preprint using Cardon's criterion for \(\Xi\); its stated results concern ranges of Laguerre orders, not the unrestricted entire-function conjecture. |

Searches on 20 November 2026 used both search engines. Queries combined the two authors' names, the exact title, DOI, “Conjecture 3.6,” and “Cardon–Laguerre” with “counterexample,” “disproved,” “correction,” and “erratum.” Additional searches tested the explicit exponential/quartic form and recent indexed literature. No earlier refutation of the exact statement was retrieved.

This is a bounded prior-art audit. An unsuccessful search does not establish exclusive priority. Citation-following and independent review are continuing.

## Review status

Root and an independent analytic worker checked the published hypotheses and the complete algebraic counterexample. Public receipts will be linked after review of this written note.

Internal review is not external peer review or Lean verification.
