# Fujii's conjecture

Research checkpoint: 20 November 2026. This note supplies the complementary case in which GRH for the Dirichlet beta function is false. It completes the case split for the oscillation theorem in [fujii.md](fujii.md) and [fujii-review.md](fujii-review.md). Discussion: [issue #87](https://github.com/1337isnot1337/solved-conjectures/issues/87).

## 1. Results and attribution

Let chi be the real nonprincipal character modulo four, beta(s)=L(s,chi), and

~~~math
S_\alpha(x)=\sum_{p>2}\chi(p)e^{-(p/x)^\alpha},
\qquad \alpha>0.
\tag{1}
~~~

The exponent alpha is fixed when x tends to infinity.

**Complementary theorem.** Suppose beta has a nontrivial zero rho_0=b+i gamma_0 with b>1/2. Then, for every alpha>0 and every real theta satisfying 0<=theta<b,

~~~math
\limsup_{x\to\infty}\frac{S_\alpha(x)}{x^\theta}=+\infty,
\qquad
\liminf_{x\to\infty}\frac{S_\alpha(x)}{x^\theta}=-\infty.
\tag{2}
~~~

In particular, if beta GRH is false, every fixed positive alpha gives unbounded values of both signs. The functional equation supplies a zero with b>1/2 whenever there is a nontrivial zero off the critical line.

The proof is an application of the classical Landau method. The Mellin-transform positivity theorem appears as [Suzuki (2025), Proposition 1, Section 2.4](https://link.springer.com/article/10.1007/s11139-025-01238-9). The use of offsets of the form C x^theta to obtain both signs appears explicitly in [Ford–Konyagin, Lemma 2.1 and the following discussion](https://ford126.web.illinois.edu/wwwpapers/racefk.pdf), printed pages 5–6. Here the relevant prime Dirichlet series has a logarithmic continuation rather than a meromorphic one; Sections 4–6 handle this by exponentiation, without assuming a global logarithm across zeros.

The same specialized converse is proved for Gamma-power smoothing in [fujii-gamma-power.md](fujii-gamma-power.md), Sections 4–5. These are applications of the same method, not separate new conjectures.

Combining (2) with the beta-GRH case proved in the companion notes yields the following result without any RH hypothesis.

**Unconditional combined theorem.** There is a real A>=0 such that, for every fixed alpha>A,

~~~math
S_\alpha(x)=\Omega_+\!\left(\frac{\sqrt x}{\log x}\right)
\quad\hbox{and}\quad
S_\alpha(x)=\Omega_-\!\left(\frac{\sqrt x}{\log x}\right).
\tag{3}
~~~

Consequently its limsup is +infinity and its liminf is -infinity. Section 7 gives the case split. The original proposed family of equivalences has a different logical status, made explicit in Section 8.

## 2. Convergence and the small-x Mellin integral

For each fixed alpha, the prime sum in (1) converges absolutely and locally uniformly for x>0, hence is a real continuous function.

Since u maps to exp(-u^alpha) is decreasing and positive,

~~~math
|S_\alpha(x)|
\le\sum_{n\ge1}e^{-(n/x)^\alpha}
\le\int_0^\infty e^{-(u/x)^\alpha}\,du
=x\,\Gamma(1+1/\alpha).
\tag{4}
~~~

For 0<x<=1 and n>=2,

~~~math
(n/x)^\alpha
\ge \frac{n^\alpha}{2}
+\frac{2^{\alpha-1}}{x^\alpha}.
~~~

Therefore

~~~math
|S_\alpha(x)|
\le C_\alpha\exp(-2^{\alpha-1}x^{-\alpha}),
\qquad 0<x\le1,
\tag{5}
~~~

where C_alpha is the convergent sum of exp(-n^alpha/2) over n>=2.

For every fixed Y>0 the function

~~~math
I_{\alpha,Y}(s)
=\int_0^Y S_\alpha(x)x^{-s-1}\,dx
\tag{6}
~~~

is entire. On each compact set of s, (5) dominates arbitrary powers of x^(-1) and arbitrary powers of |log x| near zero. This justifies local uniform convergence and differentiation under the integral. The remaining compact interval away from zero causes no problem.

This entire function is the exact correction needed when applying Landau's theorem to an eventual sign assertion, which only controls x>=Y.

## 3. The initial Mellin transform

Put

~~~math
G_\alpha(s)=\frac{\Gamma(s/\alpha)}{\alpha},
\qquad
P_\chi(s)=\sum_{p>2}\chi(p)p^{-s}
\quad(\operatorname{Re}s>1).
\tag{7}
~~~

For Re s>0, the substitution u=(p/x)^alpha gives

~~~math
\int_0^\infty e^{-(p/x)^\alpha}x^{-s-1}\,dx
=p^{-s}G_\alpha(s).
\tag{8}
~~~

For real sigma>1,

~~~math
\sum_{p>2}\int_0^\infty
 e^{-(p/x)^\alpha}x^{-\sigma-1}\,dx
=G_\alpha(\sigma)\sum_{p>2}p^{-\sigma}<\infty.
~~~

Thus Fubini is justified in the complex half-plane Re s>1, and

~~~math
\int_0^\infty S_\alpha(x)x^{-s-1}\,dx
=G_\alpha(s)P_\chi(s).
\tag{9}
~~~

The Gamma function is holomorphic and nonvanishing for Re s>0. In particular, G_alpha has neither a pole nor a zero in any half-plane used below. The Gamma properties and Euler integral can be found in [DLMF Section 5.2](https://dlmf.nist.gov/5.2).

## 4. The prime-power remainder and the real axis

Define

~~~math
E_\chi(s)=
\sum_{p>2}\sum_{m\ge2}
 \frac{\chi(p)^m}{m p^{ms}}.
\tag{10}
~~~

This is a single-valued holomorphic function on Re s>1/2. To see this, take sigma_0>1/2 and use

~~~math
\sum_{m\ge2}\frac{p^{-m\sigma_0}}m
\le\frac{p^{-2\sigma_0}}{1-p^{-\sigma_0}}.
~~~

The sum of the right side over primes converges. This proves absolute, locally uniform convergence of (10) throughout that half-plane.

The Euler product gives

~~~math
P_\chi(s)+E_\chi(s)=\log\beta(s)
\qquad(\operatorname{Re}s>1),
\tag{11}
~~~

where the logarithm is the branch defined by the absolutely convergent Euler product.

For every positive real sigma,

~~~math
\beta(\sigma)
=\sum_{n\ge0}
 \left((4n+1)^{-\sigma}-(4n+3)^{-\sigma}\right)>0.
\tag{12}
~~~

Each term is positive; the paired series is absolutely convergent, with its n-th term O_sigma((n+1)^(-sigma-1)), and agrees with the alternating beta series. Thus beta has no real zero on the positive real axis.

Equation (12) permits the Euler-product branch of log beta to continue along every real segment contained in (1/2,infinity), and holomorphically to a neighborhood of each point of that segment. For a compact segment this can also be seen by taking a sufficiently thin zero-free neighborhood of the segment and choosing the logarithm there, anchored by its real value.

No claim that log beta exists on the whole half-plane Re s>1/2 is made. If GRH is false, it does not exist there. That distinction is the reason for the exponentiation argument below.

Standard analytic continuation and the functional equation for Dirichlet L-functions are recorded in [DLMF Section 25.15](https://dlmf.nist.gov/25.15).

## 5. The positivity lemma, including the finite-abscissa issue

We use the following form of Landau's theorem.

Let Y>=1 and let f be locally integrable and nonnegative on [Y,infinity). Suppose

~~~math
F(s)=\int_Y^\infty f(x)x^{-s-1}\,dx
~~~

converges for some real s. Its abscissa of convergence sigma_c is allowed to be minus infinity. If sigma_c is finite, F cannot extend holomorphically to a neighborhood of the real point sigma_c.

Here is a proof of the finite-abscissa assertion. Set u=log x and a=log Y>=0. Then

~~~math
F(s)=\int_a^\infty f(e^u)e^{-su}\,du.
~~~

Suppose F is holomorphic near sigma_c. Choose a sufficiently small epsilon>0 so that the Taylor series about s_0=sigma_c+epsilon has radius larger than epsilon. This is possible because F is holomorphic on the right half-plane and in a disk about sigma_c; take s_0 inside that disk.

For every n>=0, differentiation in the original half-plane gives

~~~math
(-1)^nF^{(n)}(s_0)
=\int_a^\infty f(e^u)u^n e^{-s_0u}\,du\ge0.
~~~

All derivative integrals converge, since the original integral converges a little to the left of s_0 and polynomial factors are absorbed by that exponential margin.

Choose h larger than epsilon but smaller than the Taylor radius. Positivity and Tonelli give

~~~math
\begin{aligned}
F(s_0-h)
&=\sum_{n\ge0}\frac{h^n}{n!}
 \int_a^\infty f(e^u)u^n e^{-s_0u}\,du\\
&=\int_a^\infty f(e^u)e^{-(s_0-h)u}\,du<\infty.
\end{aligned}
~~~

But s_0-h<sigma_c, contradicting the definition of the abscissa. This proves the lemma.

For a nonnegative f, the integral defines a holomorphic function on Re s>sigma_c: absolute convergence follows from convergence at the corresponding real part, and local uniform convergence follows by taking a slightly smaller real part. If sigma_c=-infinity, it is holomorphic everywhere. This case needs no appeal to the finite-abscissa assertion.

## 6. Proof of the complementary theorem

Fix an off-line zero rho_0=b+i gamma_0 with b>1/2, a positive alpha, and 0<=theta<b. Put

~~~math
h=\max(1/2,\theta)<b.
~~~

Assume, for contradiction, that one side of S_alpha(x)/x^theta is eventually bounded. Then for some C>=0, Y>=1, and epsilon in {1,-1},

~~~math
f(x)=C x^\theta+\epsilon S_\alpha(x)\ge0
\qquad(x\ge Y).
\tag{13}
~~~

The sign epsilon=-1 handles an upper bound for S_alpha; epsilon=1 handles a lower bound. Since theta<b<1, equation (4) gives f(x)=O(x). Therefore its Mellin transform F has an abscissa sigma_c<=1.

On Re s>1, equations (6) and (9) give

~~~math
F(s)
=\frac{C Y^{\theta-s}}{s-\theta}
+\epsilon G_\alpha(s)P_\chi(s)
-\epsilon I_{\alpha,Y}(s).
\tag{14}
~~~

There are two exhaustive cases.

### Case 1: sigma_c<=h, including sigma_c=-infinity

The integral defining F is holomorphic on Re s>h. The first term on the right side of (14) is holomorphic there because its possible pole is at theta<=h. The small-x term I is entire, and G_alpha is holomorphic and nonvanishing there.

Solving (14) for P_chi therefore constructs a single-valued holomorphic function P_tilde on Re s>h that agrees with P_chi on Re s>1.

Now both beta(s) and

~~~math
\exp\!\left(P_{\rm tilde}(s)+E_\chi(s)\right)
~~~

are holomorphic on the connected half-plane Re s>h. They agree on Re s>1 by (11), so the identity theorem makes them equal throughout Re s>h. The exponential never vanishes. This contradicts beta(rho_0)=0, because b>h.

This argument also handles the possibility that the positivity transform is entire.

### Case 2: sigma_c>h

The abscissa is finite, since sigma_c<=1. By (11)–(12), the expression

~~~math
\frac{C Y^{\theta-s}}{s-\theta}
+\epsilon G_\alpha(s)\bigl(\log\beta(s)-E_\chi(s)\bigr)
-\epsilon I_{\alpha,Y}(s)
\tag{15}
~~~

can be continued from Re s>1 along the real interval (h,infinity), and is holomorphic in a neighborhood of the real point sigma_c. The possible offset pole at theta lies strictly to its left. Beta has no real zero there, and Gamma has no zero or pole there.

The continuation in (15) agrees with the integral F on the right of sigma_c by uniqueness of analytic continuation. It thus extends F through sigma_c. This contradicts the positivity lemma of Section 5.

Both cases contradict (13). Consequently S_alpha(x)/x^theta is bounded neither above nor below on any sufficiently large tail. This proves (2).

If beta GRH is false, reflection of an off-line nontrivial zero through the functional equation supplies b>1/2. Its imaginary part is nonzero by (12). Taking theta=0 proves unbounded positive and negative values for every alpha>0. Taking any theta with 1/2<theta<b gives the stronger scale needed for (3).

## 7. The unconditional case split

There are two possible cases.

- If beta GRH holds, [fujii-review.md](fujii-review.md), Sections 2–7, proves that some A has the property that every fixed alpha>A gives positive and negative subsequences of size sqrt(x)/log x.
- If beta GRH fails, Section 6 proves (2) for every alpha>0. Choose an off-line zero with real part b>1/2 and any theta strictly between 1/2 and b. The ratio x^theta/(sqrt(x)/log x) tends to infinity, so both conclusions in (3) hold for every alpha>0. In this case A=0 suffices.

Thus (3) is unconditional. No claim that the case split decides beta GRH is involved.

The constants and the threshold are existential. The proof does not calculate A, and no varying-alpha limit is substituted for the statement at a fixed alpha.

## 8. The exact logic of the proposed equivalences

Write G for beta GRH and C_alpha for the assertion

~~~math
S_\alpha(x)\longrightarrow-\infty.
~~~

The complementary theorem proves

~~~math
\neg G\ \Longrightarrow\ \forall\alpha>0,\ \neg C_\alpha.
\tag{16}
~~~

Equivalently, for each fixed positive alpha, C_alpha implies G. In fact, the proof shows that any eventual one-sided boundedness of S_alpha already implies G.

The GRH-case theorem proves

~~~math
G\ \Longrightarrow\
\exists A\ \forall\alpha>A,\ \neg C_\alpha.
\tag{17}
~~~

Let E denote the proposed all-alpha family of equivalences:

~~~math
E:\quad \forall\alpha>0,\ (C_\alpha\Longleftrightarrow G).
~~~

Then (16)–(17) imply the precise logical relation

~~~math
E\Longleftrightarrow\neg G.
\tag{18}
~~~

Indeed, if G is false, every C_alpha is false by (16), and every biconditional in E is true. If G is true, (17) provides a positive alpha for which C_alpha is false, so E is false.

Therefore:

- The simultaneous assertion that C_alpha holds for every positive alpha is unconditionally false by (3).
- The family E of equivalences is false under the accepted beta GRH input of this campaign.
- This note does not claim an unconditional disproof of E, which would require deciding G in the true direction. Instead, (18) states exactly what the two branches establish.

The classical Chebyshev assertion C_1 remains equivalent to G and is not contradicted.

## 9. Relation to prior work and review status

The new step in this note is not a new positivity theorem. Landau's method, its Mellin formulation, and offsets C x^theta are established tools. The purpose here is to verify every hypothesis for the original unweighted exponential-power prime sum and to close the non-GRH branch of the proof candidate.

The prime-power remainder in (10) is holomorphic on the entire required half-plane, the small-x contribution is entire, the Gamma multiplier has no zeros, and beta has no positive real zeros. Exponentiation removes any reliance on a globally chosen logarithmic branch in a region containing zeros.

The primary modern sources checked are Suzuki's Proposition 1 and Ford–Konyagin's Lemma 2.1 with its off-line-zero application. Searches combining Fujii, Chebyshev, Mellin, Landau, smoothing, and oscillation found these classical antecedents and the known bounded-alpha results, but no earlier statement of the unconditional all-sufficiently-large-alpha conclusion. The broader source and novelty audit is recorded in [fujii-review.md](fujii-review.md), Section 10.

The original Fujii formulation remains subject to the source limitation recorded in the companion files: it is corroborated by later scholarly descriptions, but the 1988 original has not yet been directly inspected. This note adds no separate named-conjecture count.
