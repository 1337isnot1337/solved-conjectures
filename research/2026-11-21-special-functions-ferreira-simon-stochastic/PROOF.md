# Ferreira–Simon's stochastic-order conjecture

Status: complete proof submitted for independent mathematical and prior-work audit on 2026-11-21. This draft does not claim exclusive priority. The prior-work audit is separate.

## Statement and source

Rui A. C. Ferreira and Thomas Simon, *Mittag-Leffler functions and convex ordering*, arXiv:2512.04940v1 (4 December 2025), Remark 7(b), printed page 18, conjecture that

\[
\alpha\longmapsto \frac{M_\alpha}{\Gamma(1-\alpha)}
\]

is non-increasing in the usual stochastic order on \((0,1)\). Here \(Z_\alpha\) is the standard positive stable random variable with Laplace transform \(\mathbb E e^{-tZ_\alpha}=e^{-t^\alpha}\), and \(M_\alpha=Z_\alpha^{-\alpha}\) has moment-generating function \(E_\alpha\), the classical Mittag–Leffler function. Primary source: https://arxiv.org/pdf/2512.04940 .

The usual stochastic order is \(X\leq_{\mathrm{st}}Y\) if \(\mathbb P(X>u)\leq\mathbb P(Y>u)\) for every real \(u\). We prove the conjecture by a simultaneous almost surely strictly decreasing coupling.

## Theorem

There is a family \((X_\alpha)_{0<\alpha<1}\) on one probability space such that

\[
X_\alpha\stackrel d=\frac{M_\alpha}{\Gamma(1-\alpha)}
\]

for every \(\alpha\), and, on one probability-one event,

\[
X_\alpha>X_\beta\qquad(0<\alpha<\beta<1).
\]

Moreover, on that event, \(X_\alpha\to T_1\) as \(\alpha\downarrow0\), where \(T_1\) has the unit exponential distribution, and \(X_\alpha\to0\) as \(\alpha\uparrow1\).

## Proof

Let \(T_n=\xi_1+\cdots+\xi_n\), where the \(\xi_j\) are independent unit exponential random variables. Thus \(0<T_1<T_2<\cdots\) are the arrival times of a Poisson process of rate one. By the strong law, \(T_n/n\to1\) almost surely. Work on this probability-one event. For every \(0<\alpha<1\), the series

\[
W_\alpha=\sum_{n=1}^{\infty}T_n^{-1/\alpha}
\]

converges: eventually \(T_n\geq n/2\), and \(1/\alpha>1\). The same event works for all parameters. Define

\[
X_\alpha=W_\alpha^{-\alpha}.
\]

First identify the marginal law. The Laplace functional of a rate-one Poisson process gives, for \(t\geq0\),

\[
\mathbb E e^{-tW_\alpha}
=\exp\left[-\int_0^\infty(1-e^{-t s^{-1/\alpha}})\,ds\right].
\]

For completeness, this functional follows first for nonnegative step functions with bounded support from independence of Poisson counts: \(\mathbb E e^{-cN(A)}=\exp(|A|(e^{-c}-1))\). Approximation by simple functions, followed by monotone convergence, gives the displayed expression. The integral is finite because its integrand is bounded by one near zero and by \(t s^{-1/\alpha}\) near infinity.

For \(t>0\), substitute \(u=t s^{-1/\alpha}\) and integrate by parts:

\[
\begin{aligned}
\int_0^\infty(1-e^{-t s^{-1/\alpha}})\,ds
&=\alpha t^\alpha\int_0^\infty(1-e^{-u})u^{-\alpha-1}\,du\\
&=t^\alpha\int_0^\infty e^{-u}u^{-\alpha}\,du\\
&=\Gamma(1-\alpha)t^\alpha.
\end{aligned}
\]

Both boundary terms vanish since \(0<\alpha<1\). Uniqueness of Laplace transforms now gives

\[
W_\alpha\stackrel d=\Gamma(1-\alpha)^{1/\alpha}Z_\alpha,
\qquad
X_\alpha\stackrel d=\frac{Z_\alpha^{-\alpha}}{\Gamma(1-\alpha)}.
\]

It remains to compare the coupled variables. Set \(a_n=T_n^{-1}>0\). Then

\[
X_\alpha=\frac{1}{\|a\|_{1/\alpha}},
\qquad
\|a\|_p=\left(\sum_{n=1}^\infty a_n^p\right)^{1/p}.
\]

For \(1<p<q\), put \(A=\|a\|_p\). Every \(a_n/A\) lies strictly between zero and one because infinitely many terms are positive. Hence

\[
\sum_n(a_n/A)^q<\sum_n(a_n/A)^p=1,
\]

and therefore \(\|a\|_q<\|a\|_p\). If \(\alpha<\beta\), then \(1/\beta<1/\alpha\), so \(X_\alpha>X_\beta\). This proves the conjecture for all parameter pairs, with no parameter discretization.

For the first endpoint, write \(a_1=\max_n a_n\). Fix \(p_0>1\). For \(p\geq p_0\),

\[
a_1\leq\|a\|_p
\leq a_1\left(\sum_n(a_n/a_1)^{p_0}\right)^{1/p}.
\]

Thus \(\|a\|_p\to a_1\) as \(p\to\infty\), giving \(X_\alpha\to T_1\) as \(\alpha\downarrow0\).

For the second endpoint, \(T_n/n\to1\) implies \(\sum_n a_n=\infty\). For each integer \(N\),

\[
\liminf_{p\downarrow1}\|a\|_p\geq\lim_{p\downarrow1}\left(\sum_{n=1}^N a_n^p\right)^{1/p}=\sum_{n=1}^N a_n.
\]

Letting \(N\to\infty\) proves \(\|a\|_p\to\infty\), hence \(X_\alpha\to0\) as \(\alpha\uparrow1\). This completes the proof.

## Mittag–Leffler consequence

The Laplace transform of \(M_\alpha\) is \(E_\alpha(-x)\). For \(x>0\), the coupled inequalities and the strict decrease of \(u\mapsto e^{-xu}\) give

\[
\frac{1}{1+x}
<E_\alpha\left(-\frac{x}{\Gamma(1-\alpha)}\right)
<E_\beta\left(-\frac{x}{\Gamma(1-\beta)}\right)
<1
\qquad(0<\alpha<\beta<1).
\]

The first inequality follows also directly from \(X_\alpha<T_1\), since \(\|a\|_{1/\alpha}>a_1\). At \(x=0\), all four terms equal one. These are exactly the inequalities proposed as a consequence in Remark 7(b), with strict inequalities for positive \(x\).

## Scope and attribution

The Poisson series representation of positive stable variables is classical. No novelty is claimed for that representation, the Poisson Laplace functional, or monotonicity of sequence norms. The proposed contribution is their application to the full stochastic-order assertion explicitly left open by Ferreira and Simon in December 2025. Whether this application already appears elsewhere is the subject of the separate priority audit.

This proof is analytic and probabilistic. It does not depend on numerical tests, computer algebra, or Lean verification.
