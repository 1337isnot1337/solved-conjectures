# Fujii's conjecture

Research checkpoint: 20 November 2026. This note concerns the Gamma-power clause. Discussion: [issue #87](https://github.com/1337isnot1337/solved-conjectures/issues/87).

## 1. Statement, status, and dependencies

Let chi be the nonprincipal real primitive character modulo 4, and let beta(s) = L(s, chi). For every integer k at least 1, define xi_k by its Mellin transform

~~~math
\int_0^\infty \xi_k(u)u^{s-1}\,du=\Gamma(s)^k
\qquad (\mathop{\mathrm{Re}}s>0).
\tag{1}
~~~

Set

~~~math
G_k(x)=\sum_{p>2}\chi(p)\xi_k(p/x).
\tag{2}
~~~

Entry 192, printed page 55 of [Martin et al., arXiv:2309.08729v3](https://arxiv.org/pdf/2309.08729), records Fujii's conjecture that, for every integer k at least 1, the assertion G_k(x) tends to minus infinity is equivalent to GRH for beta. This is separate from his exponential-power smoothing clause. The 1988 original has not been independently inspected for this note, so the historical formulation here is explicitly the formulation recorded in that bibliography.

**The Gamma-power equivalence follows from the classical Chebyshev theorem, positive Mellin convolution, and Landau's theorem.** A complete proof is given below. In fact, for each fixed integer k at least 1, the following are equivalent:

1. GRH holds for beta.
2. G_k(x) tends to minus infinity as x tends to infinity.
3. G_k(x) is nonpositive for every sufficiently large x.

The only forward number-theoretic input is the classical theorem of Hardy and Littlewood and Landau that GRH for beta implies

~~~math
G_1(x)=\sum_{p>2}\chi(p)e^{-p/x}\longrightarrow-\infty.
\tag{3}
~~~

The converse is proved directly below. No RH assumption for zeta, zero linear-independence hypothesis, or numerical zero calculation is needed.

The mathematical implication is a classical consequence. This note does not claim priority, and it does not count different values of k, or this second clause, as separate solved named conjectures.

## 2. Positive kernels and convergence

Start with xi_1(u) = exp(-u) and define recursively

~~~math
\xi_{k+1}(u)=\int_0^\infty e^{-v}\xi_k(u/v)\,\frac{dv}{v}.
\tag{4}
~~~

Every xi_k is positive and continuous on the positive real axis.

To verify convergence without relying on an asymptotic expansion of a special function, fix a positive real a. Since exp(-u) is at most (a/e)^a u^(-a), induction in (4) gives

~~~math
0<\xi_k(u)\le C_{a,k}u^{-a}
\quad (u>0),\qquad
C_{a,k}=(a/e)^a\Gamma(a)^{k-1}.
\tag{5}
~~~

Indeed, the induction step multiplies C_(a,k) by the integral of exp(-v) v^(a-1), which is Gamma(a). The same bound gives a locally uniform integrable majorant in (4), proving continuity by induction.

Tonelli's theorem, followed by u = v t, proves for every positive real sigma that

~~~math
\begin{aligned}
\int_0^\infty u^{\sigma-1}\xi_{k+1}(u)\,du
&=\int_0^\infty e^{-v}\frac{dv}{v}
  \int_0^\infty u^{\sigma-1}\xi_k(u/v)\,du
\\ &=\Gamma(\sigma)\Gamma(\sigma)^k.
\end{aligned}
\tag{6}
~~~

The same computation is absolutely convergent for every complex s with positive real part, proving (1). Mellin inversion identifies these kernels with the inverse Mellin transforms in the recorded formulation. More explicitly, after logarithmic change of variables the weighted kernel is integrable by (6), and its Fourier transform is Gamma(s)^k. This Fourier transform is integrable on each vertical line by the exponential vertical decay of Gamma, so inversion applies. The kernels are continuous, so the equality holds pointwise.

For any a greater than 1, (5) gives the global bound

~~~math
\sum_{p>2}\xi_k(p/x)
\le C_{a,k}x^a\sum_{n\ge2}n^{-a}<\infty.
\tag{7}
~~~

Thus (2) converges absolutely and locally uniformly in x, and defines a continuous function. In particular, for every positive A,

~~~math
G_k(x)=O_{A,k}(x^A)\qquad(x\downarrow0).
\tag{8}
~~~

For (8), take a greater than both A and 1 in (7). This small-variable estimate is important: the measure dv/v in (4) has infinite mass near zero.

Tonelli applied to the absolute prime sum in (4) now justifies the convolution identity

~~~math
G_{k+1}(x)=\int_0^\infty e^{-v}G_k(xv)\,\frac{dv}{v}.
\tag{9}
~~~

For clarity, the absolute integral of the prime-by-prime expansion on the right is exactly the positive sum with xi_(k+1), which is finite by (7). Thus the exchange of the prime sum and integral is valid before any cancellation is used.

## 3. Negative limits survive the convolution

We use the following elementary lemma.

Suppose f is a real continuous function on the positive real axis such that:

- f(t) tends to minus infinity as t tends to infinity;
- the integral of its positive part f_+(t)/t over every interval (0,Y) is finite;
- the integral defining T f below converges absolutely for each x.

Define

~~~math
(Tf)(x)=\int_0^\infty e^{-v}f(xv)\,\frac{dv}{v}.
~~~

Then T f(x) tends to minus infinity.

To prove this, choose Y at least 1 such that f(t) is nonpositive for t at least Y. The entire possible positive contribution is bounded, uniformly in x, by

~~~math
\begin{aligned}
\int_0^{Y/x}e^{-v}f_+(xv)\,\frac{dv}{v}
&=\int_0^Y e^{-t/x}f_+(t)\,\frac{dt}{t}
\\ &\le C_Y:=\int_0^Y f_+(t)\,\frac{dt}{t}<\infty.
\end{aligned}
\tag{10}
~~~

Given any M greater than zero, there is a T_M such that f(t) is at most -M for all t at least T_M. If x is at least max(Y,T_M), then the contribution from 1 <= v <= 2 is at most

~~~math
-Mc,\qquad c=\int_1^2 e^{-v}\,\frac{dv}{v}>0.
~~~

All contributions from v at least Y/x outside this interval are nonpositive. Therefore

~~~math
(Tf)(x)\le C_Y-Mc.
\tag{11}
~~~

Since M is arbitrary, the lemma follows. In particular, no dominated-convergence argument is being applied to a measure of infinite mass.

Every G_k satisfies the integrability requirements by (7), (8), and (9). Starting with (3) and using the lemma in (9) proves

~~~math
\text{GRH for beta}\quad\Longrightarrow\quad
G_k(x)\longrightarrow-\infty
\quad\text{for every integer }k\ge1.
\tag{12}
~~~

This proves the forward implication for the entire stated family, not just for a finite collection of indices.

## 4. The Mellin transform of the prime sum

For complex s with real part greater than 1, absolute convergence gives

~~~math
\begin{aligned}
\int_0^\infty G_k(x)x^{-s-1}\,dx
&=\sum_{p>2}\chi(p)\int_0^\infty
 \xi_k(p/x)x^{-s-1}\,dx
\\ &=\Gamma(s)^kP_\chi(s),\qquad
P_\chi(s):=\sum_{p>2}\chi(p)p^{-s}.
\end{aligned}
\tag{13}
~~~

The absolute convergence needed here follows exactly from

~~~math
\sum_{p>2}\int_0^\infty
 \xi_k(p/x)x^{-\sigma-1}\,dx
=\Gamma(\sigma)^k\sum_{p>2}p^{-\sigma}<\infty
\quad(\sigma>1).
\tag{14}
~~~

For each fixed positive X, the function

~~~math
E_{k,X}(s)=\int_0^X G_k(x)x^{-s-1}\,dx
\tag{15}
~~~

is entire. Indeed, (8) permits an arbitrarily large power of x near zero, uniformly sufficient on any compact set of s. Extra logarithmic factors introduced by differentiation in s remain integrable.

## 5. Eventual nonpositivity implies GRH

Suppose G_k(x) is nonpositive for x at least some X greater than or equal to 1. Put

~~~math
F_k(s)=\int_X^\infty[-G_k(x)]x^{-s-1}\,dx.
\tag{16}
~~~

The integrand is nonnegative for real s. Its abscissa of convergence sigma_c is at most 1 by (14); it may be minus infinity. In the initial half-plane,

~~~math
F_k(s)=E_{k,X}(s)-\Gamma(s)^kP_\chi(s)
\qquad(\mathop{\mathrm{Re}}s>1).
\tag{17}
~~~

We first check analytic continuation at every real point sigma greater than 1/2, without assuming GRH. Define the prime-power remainder

~~~math
R_\chi(s)=
\sum_{p>2}\sum_{m\ge2}\frac{\chi(p)^m}{m p^{ms}}.
\tag{18}
~~~

This series converges absolutely and locally uniformly in the half-plane with real part greater than 1/2. Indeed, on a compact subset, all its terms are bounded by a constant multiple of the convergent prime sum of p^(-2 sigma_0), for some fixed sigma_0 greater than 1/2. The Euler product gives

~~~math
P_\chi(s)=\log\beta(s)-R_\chi(s)
\qquad(\mathop{\mathrm{Re}}s>1).
\tag{19}
~~~

For every positive real sigma,

~~~math
\beta(\sigma)=
\sum_{n\ge0}\left((4n+1)^{-\sigma}-(4n+3)^{-\sigma}\right)>0.
\tag{20}
~~~

The paired series converges absolutely, since each pair is O_sigma((n+1)^(-sigma-1)), and equals the usual alternating beta series. Consequently beta has no zero on the positive real axis. The branch of log beta initially fixed by the Euler product continues analytically along that axis, and in a neighborhood of each of its points.

Equations (17) and (19), together with (15), therefore analytically continue F_k through a neighborhood of every real point greater than 1/2. There is no pole or zero of Gamma in this interval.

Landau's Mellin-transform theorem says that a finite abscissa of convergence of the Mellin transform of a nonnegative function is a real singularity. A precise convenient statement is [Suzuki (2025), Proposition 1, section 2.4](https://link.springer.com/article/10.1007/s11139-025-01238-9), which cites Widder's Laplace-transform theorem and Montgomery–Vaughan's corresponding lemma.

If sigma_c were greater than 1/2, the analytic continuation just constructed would contradict this theorem at sigma_c. Hence

~~~math
\sigma_c\le\frac12.
\tag{21}
~~~

It follows that the integral (16) defines a holomorphic function in the entire half-plane with real part greater than 1/2. Define there

~~~math
\widetilde P_\chi(s)=
\frac{E_{k,X}(s)-F_k(s)}{\Gamma(s)^k}.
\tag{22}
~~~

Gamma is holomorphic and nonvanishing in this half-plane, so this is holomorphic and agrees with P_chi for real part greater than 1.

The holomorphic function

~~~math
\exp\!\left(\widetilde P_\chi(s)+R_\chi(s)\right)
\tag{23}
~~~

agrees with beta(s) in the initial half-plane by the Euler product. The identity theorem extends that equality to real part greater than 1/2. The exponential never vanishes, so beta has no zero there.

The functional equation of beta reflects every nontrivial zero across the critical line. Thus there are also no nontrivial zeros with real part less than 1/2, proving GRH for beta.

This argument uses the full prime sum. It avoids informal claims about a logarithmic branch singularity at a zero: the globally defined Mellin transform first constructs a holomorphic continuation of P_chi, and exponentiation then gives the zero-free half-plane.

## 6. Conclusion for the recorded clause

For each integer k at least 1, equations (12) and (21)–(23) prove the equivalences stated in section 1. Under the campaign's assumed Dirichlet GRH, the negative-limit assertion therefore holds for every k in Fujii's recorded Gamma-power family.

The proof is independent of the proposed disproof of the other Fujii clause in [fujii.md](fujii.md). It uses the classical k = 1 theorem and operations on positive kernels. No stronger arithmetic theorem extracted from the RH archive is needed.

## 7. Prior-art screen and attribution boundary

The following sources were inspected for this note:

- **Fujii (1988), through the recorded bibliography statement.** Entry 192 in [Martin et al., arXiv:2309.08729v3, printed page 55](https://arxiv.org/pdf/2309.08729) explicitly records the Gamma(s)^k Mellin transform, the proved log-weighted k = 2 statement, and the conjectured unweighted integer-k extension. This is evidence for the recorded target, not independent inspection of the original final paragraph.

- **Suzuki (2011; arXiv 2012).** [On monotonicity of certain weighted summatory functions associated with L-functions, arXiv:1204.1823](https://arxiv.org/pdf/1204.1823), introduction, discusses Fujii's Gamma(s)^2/Bessel weight and replacing weights more generally. Its main theorems have different coefficients and weights involving gamma-factor ratios. They should not be cited as directly proving the family in this note.

- **Platt–Trudgian (2018 preprint; 2019 publication).** [Fujii's development on Chebyshev's conjecture, arXiv:1802.00089](https://arxiv.org/pdf/1802.00089), introduction, states the classical unweighted k = 1 equivalence and then studies the exponential-power family. It is a primary mathematical source for the baseline statement used here; the result is credited there to Hardy–Littlewood and Landau.

- **Suzuki (2025).** [On variants of Chebyshev's conjecture](https://link.springer.com/article/10.1007/s11139-025-01238-9), section 1.2, records the classical equivalence and Fujii's log-weighted Bessel result. Proposition 1 gives the exact Landau tool used in section 5. Later proofs in that paper use the same general strategy of turning eventual sign constancy into a zero-free half-plane.

Targeted searches on 20 November 2026 used both available search engines, including the phrases "Fujii Chebyshev Gamma k", "Fujii Chebyshev convolution", "Fujii Chebyshev Mellin convolution", "Chebyshev gamma powers", and the title of Fujii's 1988 paper. These searches did not identify an explicit earlier proof of the unweighted all-integer-k clause. This is a bounded search result, not proof of novelty.

Because the proof follows from classical results by a short positive-convolution argument, its logical dependence should remain explicit. The current result is a complete derivation of the recorded clause with priority unclaimed. It does not justify an independent new named-conjecture count.
