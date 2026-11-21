# Simon's stable-infimum conjecture

## Status and original statement

This is a complete candidate proof of the convex-order conjecture in Remark 6 of Thomas Simon, *Comparing Fréchet and positive stable laws*, Electronic Journal of Probability 19 (2014), no. 16, DOI [10.1214/EJP.v19-3058](https://doi.org/10.1214/EJP.v19-3058). The remark is on printed pages 13–14 of [arXiv:1310.1888v2](https://arxiv.org/pdf/1310.1888), dated 27 January 2014. Independent proof audit and the prior-resolution search are tracked separately; this manuscript alone does not establish publication priority.

For each \(\alpha\in[1/2,1)\), let \(X^{(\alpha)}\) be the spectrally negative strictly \(1/\alpha\)-stable Lévy process with normalization

\[
\mathbb E e^{\lambda X_t^{(\alpha)}}=e^{t\lambda^{1/\alpha}}
\qquad(t,\lambda\ge0),
\]

and put

\[
I_\alpha=-\inf_{0\le t\le1}X_t^{(\alpha)},
\qquad V_\alpha=\Gamma(1+\alpha)I_\alpha.
\]

The conjecture is

\[
V_\beta\preceq_{\rm cx}V_\alpha
\qquad\left(\frac12\le\beta<\alpha<1\right).
\tag{1}
\]

Here convex order means \(\mathbb E\phi(V_\beta)\le\mathbb E\phi(V_\alpha)\) for every convex function for which the expectations exist. This is the full parameter range of the stated conjecture. The direction is opposite to the corresponding ordering of the suprema. The proof below gives the stronger factorization

\[
V_\alpha\ \stackrel d=\ V_\beta R_{\beta,\alpha},
\qquad R_{\beta,\alpha}>0,\qquad
\mathbb E R_{\beta,\alpha}=1,
\tag{2}
\]

where the factors on the right are independent and \(\log R_{\beta,\alpha}\) is infinitely divisible.

## 1. Mellin transform of the infimum

We use the established factorization recorded in Simon's Remark 6:

\[
I_\alpha\stackrel d=M_\alpha Y_\alpha,
\qquad M_\alpha=Z_\alpha^{-\alpha},\qquad
\mathbb E e^{-\lambda Z_\alpha}=e^{-\lambda^\alpha},
\tag{3}
\]

with independent factors. For \(1/2<\alpha<1\), the density of \(Y_\alpha\) is

\[
f_\alpha(t)=
-\frac{\sin(\pi/\alpha)}\pi
\frac{t^{1/\alpha-2}(1+t)}
{t^{2/\alpha}-2t^{1/\alpha}\cos(\pi/\alpha)+1},
\qquad t>0.
\tag{4}
\]

The factorization (3), including (4), is prior work, not a claim of this manuscript. At \(\alpha=1/2\), the infimum has the same half-Gaussian law as \(M_{1/2}\).

Set \(\theta=2\pi-\pi/\alpha\in(0,\pi)\). The elementary integral

\[
J_\theta(r)=\int_0^\infty
\frac{u^{r-1}}{u^2-2u\cos\theta+1}\,du
=\frac{\pi\sin((1-r)(\pi-\theta))}
{\sin\theta\sin(\pi r)}
\quad(0<r<2)
\tag{5}
\]

is understood by continuity at \(r=1\). For completeness, partial fractions at the roots \(e^{i\theta},e^{-i\theta}\), followed by Euler's integral
\(\int_0^\infty u^{r-1}/(u+z)\,du=\pi z^{r-1}/\sin(\pi r)\), proves it first for \(0<r<1\); the substitution \(u\mapsto1/u\) gives \(1<r<2\). Use principal powers with \(|\arg z|<\pi\).

Substituting \(u=t^{1/\alpha}\) into (4) and applying (5) gives, for
\(1-1/\alpha<s<1/\alpha\),

\[
\begin{aligned}
\mathbb E Y_\alpha^s
&=\frac{\alpha\sin\theta}{\pi}
\big[J_\theta(1-\alpha+\alpha s)
+J_\theta(1+\alpha s)\big]\\
&=\alpha\left[
\frac{\sin(\pi(1-\alpha)(1-s))}{\sin(\pi\alpha(1-s))}
+\frac{\sin(\pi(1-\alpha)s)}{\sin(\pi\alpha s)}
\right]\\
&=\frac{\alpha\sin(\pi\alpha)\sin(\pi s)}
{\sin(\pi\alpha s)\sin(\pi\alpha(1-s))}.
\end{aligned}
\tag{6}
\]

Apparent singularities at \(s=0,1\) are removable. The elementary sine addition identity gives the last equality. Both endpoints of the stated interval are integrability boundaries in (4).

The stable fractional-moment formula is

\[
\mathbb E M_\alpha^s
=\frac{\Gamma(1+s)}{\Gamma(1+\alpha s)}
\qquad(s>-1).
\tag{7}
\]

Multiplying (6) and (7), and applying the reflection and recurrence formulas for the gamma function, yields

\[
\boxed{\displaystyle
\mathbb E I_\alpha^s
=\frac{
\Gamma(1-\alpha s)
\Gamma(1+\alpha-\alpha s)
\Gamma(1-\alpha+\alpha s)}
{\Gamma(1+\alpha)\Gamma(1-\alpha)\Gamma(2-s)}.}
\tag{8}
\]

For \(1/2<\alpha<1\), formula (8) holds throughout the complex strip
\(1-1/\alpha<\Re s<1/\alpha\), by analytic continuation from the real interval. At \(\alpha=1/2\), the duplication formula reduces its right side to
\(\Gamma(1+s)/\Gamma(1+s/2)\), so (8) holds there too, at least in the common strip \(-1<\Re s<2\). In particular,

\[
\mathbb E I_\alpha=\frac1{\Gamma(1+\alpha)},
\qquad \mathbb E V_\alpha=1.
\tag{9}
\]

## 2. The logarithm has increasing Lévy measures

Define the analytic cumulant
\(K_\alpha(s)=\log\mathbb E V_\alpha^s\), choosing the logarithm equal to zero at \(s=0\). Formula (8) gives

\[
\begin{aligned}
K_\alpha(s)={}&s\log\Gamma(1+\alpha)
+\log\Gamma(1-\alpha s)
+\log\Gamma(1+\alpha-\alpha s)\\
&+\log\Gamma(1-\alpha+\alpha s)
-\log\Gamma(1+\alpha)
-\log\Gamma(1-\alpha)
-\log\Gamma(2-s).
\end{aligned}
\tag{10}
\]

We use the gamma integral, valid for \(a>0\) and \(\Re(a+bs)>0\),

\[
\log\Gamma(a+bs)-\log\Gamma(a)-bs\psi(a)
=\int_0^\infty
(e^{-bsu}-1+bsu)\frac{e^{-au}}{u(1-e^{-u})}\,du.
\tag{11}
\]

It also follows directly by differentiating twice in \(s\), using the integral for \(\psi'\), and fixing the value and first derivative at zero. Thus no infinite-divisibility hypothesis is being assumed in (11).

Apply (11) to each term of (10), and change variables \(t=\alpha u\) in the three terms with slopes of magnitude \(\alpha\). This gives

\[
K_\alpha(s)=d_\alpha s
+\int_0^\infty(e^{st}-1-st)\frac{k_\alpha(t)}t\,dt
+\int_0^\infty(e^{-st}-1+st)\frac{h_\alpha(t)}t\,dt,
\tag{12}
\]

where \(d_\alpha=K_\alpha'(0)\) is finite and

\[
\boxed{\displaystyle
k_\alpha(t)=\frac{1+e^{-t}}{e^{t/\alpha}-1}
-\frac{e^{-2t}}{1-e^{-t}},
\qquad
h_\alpha(t)=\frac{e^t}{e^{t/\alpha}-1}.}
\tag{13}
\]

For every fixed \(t>0\), both functions are strictly increasing in \(\alpha\). Moreover,

\[
k_{1/2}(t)=
\frac{1+e^{-t}}{e^{2t}-1}
-\frac{e^{-2t}}{1-e^{-t}}=0,
\tag{14}
\]

and \(h_\alpha(t)>0\). Consequently \(k_\alpha,h_\alpha\ge0\) for every \(\alpha\in[1/2,1)\).

These functions define legitimate Lévy measures. Near zero,

\[
k_\alpha(t)=\frac{2\alpha-1}{t}+O(1),
\qquad h_\alpha(t)=\frac\alpha t+O(1).
\tag{15}
\]

At infinity, \(k_\alpha(t)=O(e^{-t/\alpha})\) and
\(h_\alpha(t)=O(e^{-(1/\alpha-1)t})\). At the endpoint \(\alpha=1/2\), the first function vanishes identically, which is consistent with these estimates. It follows that the measure with density \(k_\alpha(t)/t\) at positive jumps \(t\) and density \(h_\alpha(t)/t\) at negative jumps \(-t\) has finite integral against \(1\wedge t^2\); its large jumps also have finite first absolute moment. The compensation \(\mp st\) over the whole positive half-line in (12) is therefore valid. Since \(1/\alpha>1\), its positive jumps have an exponential moment at parameter one.

For imaginary \(s\), formula (12) is the Lévy–Khintchine representation of \(\log V_\alpha\). The same integrals converge for every real \(s\) in a neighborhood of \([0,1]\).

## 3. Independent mean-one increments and convex order

Fix \(1/2\le\beta<\alpha<1\). Both differences

\[
k_\alpha(t)-k_\beta(t)>0,
\qquad h_\alpha(t)-h_\beta(t)>0
\qquad(t>0)
\tag{16}
\]

are nonnegative Lévy densities after division by \(t\), with the same integrability properties just checked. Thus

\[
K_\alpha(s)-K_\beta(s)
\tag{17}
\]

is the cumulant of an infinitely divisible real random variable \(L_{\beta,\alpha}\). Specifically its drift in the compensation convention (12) is \(d_\alpha-d_\beta\), and its Lévy measure is the difference of the two Lévy measures in (13). The exponential moment at one is finite, and (9) gives

\[
\mathbb E e^{L_{\beta,\alpha}}
=\exp(K_\alpha(1)-K_\beta(1))=1.
\tag{18}
\]

Take \(L_{\beta,\alpha}\) independent of \(V_\beta\) and let
\(R_{\beta,\alpha}=e^{L_{\beta,\alpha}}\). Comparing characteristic functions of logarithms gives (2). The construction is a martingale coupling because

\[
\mathbb E[V_\beta R_{\beta,\alpha}\mid V_\beta]=V_\beta.
\tag{19}
\]

Conditional Jensen's inequality now proves (1). This argument covers every pair \(1/2\le\beta<\alpha<1\) and every convex test function in the definition of convex order, so it is not a moment-only comparison or a restricted-parameter case. For convex functions with a possibly infinite positive expectation, subtract a supporting affine function first; monotone approximation or the extended conditional Jensen inequality then gives the same conclusion.

## Scope and dependence

The only specific stable-process input is the previously established factorization (3)–(4), as recorded in the original source. The remaining steps are an explicit Mellin computation, the gamma integral, Lévy–Khintchine, and conditional Jensen. The proof does not rely on numerical evidence, a finite collection of moments, or Lean verification. The separate literature record determines whether this is eligible to be counted as a new resolution.
