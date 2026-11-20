# Fujii's conjecture

Research checkpoint: 20 November 2026. Target discussion: [issue #87](https://github.com/1337isnot1337/solved-conjectures/issues/87). Campaign coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

## Status

This is a complete proof candidate undergoing independent mathematical and prior-art review. It is not yet entered in the solved-results catalogue. In particular, the original 1988 paper has not yet been directly retrieved; two later sources independently record its all-parameter conjecture.

The candidate theorem is qualitative: all sufficiently large fixed smoothing exponents give oscillation. No numerical threshold, finite zero computation, or extension of an admissible numerical range is claimed.

The hypothesis used is RH for zeta and GRH for the nonprincipal character modulo four. Both are supplied by the accepted input of this campaign. No linear independence, zero simplicity, or nonabelian GRH is assumed.

## 1. Target and sources

Let chi be the real primitive character modulo four and put

~~~math
S_\alpha(x)=\sum_{p>2}\chi(p)\exp(-(p/x)^\alpha),\qquad \alpha>0.
~~~

The all-alpha extension attributed to Fujii says that, for each positive alpha, the assertion

~~~math
\lim_{x\to\infty}S_\alpha(x)=-\infty
~~~

is equivalent to GRH for the Dirichlet beta function beta(s)=L(s,chi).

Sources checked:

1. A. Fujii, *Some generalizations of Chebyshev's conjecture*, Proceedings of the Japan Academy, Series A **64** (1988), 260–263. [Original publisher identifier](https://projecteuclid.org/euclid.pja/1195513180). Direct text retrieval remains outstanding.
2. M. Suzuki, *On variants of Chebyshev's conjecture*, Ramanujan Journal **68**, 95 (2025), [section 1.2, paragraph following (16)–(17)](https://link.springer.com/article/10.1007/s11139-025-01238-9). This explicitly attributes the all-positive-alpha extension to Fujii.
3. G. Martin et al., *An annotated bibliography for comparative prime number theory*, [arXiv:2309.08729v3](https://arxiv.org/pdf/2309.08729), entry 192, printed page 55. This independently records the same all-alpha conjecture. Entry 17 records the Hardy–Littlewood oscillation theorem used below.
4. D. Platt and T. Trudgian, *Fujii's development on Chebyshev's conjecture*, [arXiv:1802.00089](https://arxiv.org/pdf/1802.00089), International Journal of Number Theory **15** (2019), 639–644. Its result covers 0<alpha<20.40442. Its obstruction at 20.40443 is an obstruction to the absolute-value estimate used there, not a disproof of the conjecture.
5. G. H. Hardy and J. E. Littlewood, *Contributions to the theory of the Riemann zeta-function and the theory of the distribution of primes*, Acta Mathematica **41**, 119–196, section 5. The input needed is the classical result
   psi(x,chi)=Omega_+(sqrt(x) log log log x), and its negative counterpart.

The full statement quantified over alpha is the target. The theorem below would refute it under the accepted GRH input.

## 2. Proposed theorem

Assume RH for zeta and GRH for beta. Then there is a real A>0 such that, for every fixed alpha>A,

~~~math
\limsup_{x\to\infty} S_\alpha(x)=+\infty,
\qquad
\liminf_{x\to\infty} S_\alpha(x)=-\infty.
~~~

More precisely, for each such alpha there are positive constants c_alpha and d_alpha and sequences tending to infinity along which

~~~math
S_\alpha(x)\ge c_\alpha\frac{\sqrt{x}}{\log x},
\qquad
S_\alpha(x)\le-d_\alpha\frac{\sqrt{x}}{\log x},
~~~

respectively. In fact the negative-subsequence conclusion holds for every fixed positive alpha.

The proof does not require an explicit value of A.

## 3. A family of almost-periodic functions

Write each nontrivial beta zero as rho=1/2+i gamma, counted with multiplicity. There is no gamma=0: for every real s>0 the convergent paired series

~~~math
\beta(s)=\sum_{n=0}^{\infty}
  \big((4n+1)^{-s}-(4n+3)^{-s}\big)
~~~

is strictly positive.

For fixed alpha>0 define

~~~math
F_\alpha(y)=
-\frac{\Gamma(1/(2\alpha))}{2\alpha}
-\sum_\rho\frac{\Gamma(\rho/\alpha)}{\alpha}e^{i\gamma y}.
\tag{1}
~~~

Stirling's estimate gives exponential decay in |gamma| for each fixed alpha. Together with the standard bound N_beta(T)=O(T log(T+2)), this implies absolute and uniform convergence of (1) on the real y-axis.

Consequently F_alpha is a continuous real-valued Bohr almost-periodic function. Reality follows by pairing conjugate zeros. Uniform almost periodicity follows directly by approximating the uniformly convergent series by finite trigonometric polynomials.

Because every frequency gamma is nonzero, its Bohr mean is

~~~math
\mathcal M(F_\alpha)
=-\frac{\Gamma(1/(2\alpha))}{2\alpha}<0.
\tag{2}
~~~

The mean can be interchanged with the zero sum by uniform convergence.

## 4. Distributional limit as alpha increases

For alpha>=1,

~~~math
\frac{\Gamma(\rho/\alpha)}{\alpha}
=\frac{\Gamma(1+\rho/\alpha)}{\rho}.
~~~

The Euler integral for gamma gives

~~~math
|\Gamma(1+\rho/\alpha)|
\le \Gamma(1+1/(2\alpha))\le C,
\tag{3}
~~~

where C is absolute. Hence the coefficients are bounded uniformly in alpha>=1 by C/|rho| and converge, at each fixed zero, to 1/rho.

For any smooth compactly supported real test function phi, its Fourier transform decreases faster than every fixed power. The zero-counting estimate therefore gives

~~~math
\sum_\rho\frac{1}{|\rho|}
 \left|\int_{\mathbb R}\phi(y)e^{i\gamma y}\,dy\right|<\infty.
~~~

Dominated convergence, using (3), proves

~~~math
F_\alpha\ \longrightarrow\
R:=-1-\sum_\rho\frac{e^{i\gamma y}}{\rho}
\quad\hbox{in }\mathcal D'(\mathbb R)
\quad(\alpha\to\infty).
\tag{4}
~~~

The constant converges to -1 because Gamma(z) is asymptotic to 1/z at zero. The distribution on the right is defined by the absolutely convergent pairing just displayed. No pointwise or uniform convergence of the undamped zero series is claimed.

## 5. The limiting distribution has a positive test pairing

Put

~~~math
\psi_\chi(x)=\sum_{n\le x}\Lambda(n)\chi(n).
~~~

At x>1 away from prime powers, the standard explicit formula for the odd primitive character modulo four is

~~~math
\psi_\chi(x)=
-\sum_\rho\frac{x^\rho}{\rho}
-\frac{\beta'}{\beta}(0)
+\frac12\log\frac{x+1}{x-1}.
\tag{5}
~~~

The symmetric zero sum in (5), interpreted distributionally, agrees with (4). Thus on y>0,

~~~math
R(y)=
-1+e^{-y/2}\left(
 \psi_\chi(e^y)+\frac{\beta'}{\beta}(0)
 -\frac12\log\frac{e^y+1}{e^y-1}
\right).
\tag{6}
~~~

This is a locally integrable function, smooth between logarithms of prime powers.

Littlewood's oscillation theorem gives arbitrarily large x for which psi_chi(x)/sqrt(x) is arbitrarily large and positive. The other terms in (6) tend to zero after multiplication by x^(-1/2). It follows that R is positive at some point away from prime powers, and hence positive on an open interval.

There is therefore a nonzero smooth compactly supported function phi>=0 with support in y>0 such that

~~~math
\langle R,\phi\rangle>0.
\tag{7}
~~~

If an oscillation point is a prime power, move it slightly to the right. The step value persists and the continuous normalizing factors change continuously; the strict inequality remains. No lower bound on the interval's length is needed.

From (4) and (7), there is A such that for every alpha>A,

~~~math
\int F_\alpha(y)\phi(y)\,dy>0.
~~~

Since phi is nonnegative, each such F_alpha has a positive value.

This is the main qualitative step. It yields all sufficiently large fixed alpha, without estimating a single beta zero.

## 6. Passage from zero series to the actual prime sum

This section supplies the normalization needed to ensure that the theorem concerns the original unweighted-prime sum.

For each fixed alpha>0, we claim

~~~math
\frac{\log x}{\sqrt{x}}S_\alpha(x)
=F_\alpha(\log x)+O_\alpha(1/\log x)
\qquad (x\to\infty).
\tag{8}
~~~

A proof using a smooth cutoff and the explicit formula follows.

### 6.1 Remove small primes smoothly

Choose a fixed smooth function eta on the real line with eta(u)=0 for u<=0 and eta(u)=1 for u>=1. Write y=log x and set

~~~math
f_x(t)=
\eta(\log t-y/4)\,
\frac{\exp(-(t/x)^\alpha)}{\log t}.
~~~

It vanishes for t<=x^(1/4). The transition finishes at e x^(1/4). Consequently

~~~math
S_\alpha(x)
=\int f_x(t)\,d\theta_\chi(t)+O(x^{1/4}),
\qquad
\theta_\chi(t)=\sum_{p\le t}\chi(p)\log p.
\tag{9}
~~~

The error bound uses only that the removed summands have absolute value at most one and that there are O(x^(1/4)) relevant integers.

### 6.2 Prime squares give the constant term

The prime-power decomposition and RH for zeta give, in the sense of distributions for t>=2,

~~~math
\theta_\chi(t)=
-\sqrt{t}-\sum_\rho\frac{t^\rho}{\rho}+E(t),
\qquad
E(t)=O(t^{1/3}(\log(t+2))^2).
\tag{10}
~~~

Indeed, the square contribution is theta(sqrt(t)), with the prime 2 omitted. Under RH this equals sqrt(t)+O(t^(1/4) log^2(t+2)); contributions of powers k>=3 are O(t^(1/3) log^2(t+2)). The constant and trivial-zero terms in (5) are bounded for t>=2. They are absorbed in E.

The distributional derivative of the first two terms in (10), paired with f_x, yields

~~~math
\int f_x(t)\,d\theta_\chi(t)
=
-\frac12\int_0^\infty f_x(t)t^{-1/2}\,dt
-\sum_\rho\int_0^\infty f_x(t)t^{\rho-1}\,dt
-\int_0^\infty E(t)f_x'(t)\,dt .
\tag{11}
~~~

The last integral is O_alpha(x^(1/3) log(x+2)+x^(1/12) log(x+2)), by splitting the cutoff transition from the remaining terms in f_x'. This is o(sqrt(x)/log^2 x). All integrals have support bounded away from t=1, and the weight decreases faster than any power at infinity.

### 6.3 A uniform Mellin-transform estimate

For real gamma, put rho=1/2+i gamma and define

~~~math
b_y(v)=
e^{v/2}\exp(-e^{\alpha v})\,
\frac{\eta(v+3y/4)}{y+v}.
~~~

In the expression above the quotient is understood to be zero wherever eta vanishes; its support has y+v>=y/4. Changing variables t=x e^v gives

~~~math
\int_0^\infty f_x(t)t^{\rho-1}\,dt
=x^\rho\int_{\mathbb R}b_y(v)e^{i\gamma v}\,dv.
~~~

Let a(v)=e^(v/2) exp(-e^(alpha v)). For each fixed integer N>=0,

~~~math
\|b_y-a/y\|_{W^{N,1}(\mathbb R)}
\ll_{\alpha,N} y^{-2}\qquad(y\to\infty).
\tag{12}
~~~

To see this, where the cutoff equals one use

~~~math
\frac1{y+v}-\frac1y=-\frac{v}{y(y+v)}
~~~

and y+v>=y/4. Derivatives of the denominator have the corresponding bounds. Every polynomially weighted derivative of a is integrable: it decreases exponentially as v tends to minus infinity and faster than exponentially as v tends to plus infinity. On the cutoff transition and to its left, a and all its derivatives have integrals bounded by a polynomial in y times exp(-3y/8), which is smaller than y^(-2).

Applying Fourier integration by parts to (12), for any N,

~~~math
\int f_x(t)t^{\rho-1}\,dt
=
\frac{x^\rho}{y}\frac{\Gamma(\rho/\alpha)}{\alpha}
+O_{\alpha,N}\left(
 \frac{\sqrt{x}}{y^2}(1+|\gamma|)^{-N}
\right).
\tag{13}
~~~

The gamma integral here is the substitution u=e^(alpha v):

~~~math
\int_{\mathbb R}e^{v/2-e^{\alpha v}}e^{i\gamma v}\,dv
=\frac1\alpha\Gamma(\rho/\alpha).
~~~

The error in (13) is summable over all beta zeros, including multiplicities, when N is chosen larger than two. This proves that (11) permits termwise evaluation and the zero sum has total error O_alpha(sqrt(x)/y^2).

The same estimate at gamma=0 handles the main term in (11), giving the constant -Gamma(1/(2alpha))/(2alpha). Substituting into (9)–(11) proves (8).

The argument uses distributional explicit formulas only against smooth, rapidly decreasing functions, and its Fourier bounds make all passages to infinite zero sums explicit.

## 7. Almost periodicity forces both signs arbitrarily far out

Fix alpha>A. By section 5 there are y0 and delta>0 with F_alpha(y0)>2delta.

For a Bohr almost-periodic function, the set of delta-almost-periods is relatively dense. In particular there is a sequence tau_n tending to positive infinity with

~~~math
\sup_y|F_\alpha(y+\tau_n)-F_\alpha(y)|<\delta.
~~~

Hence F_alpha(y0+tau_n)>delta. Apply (8) with x_n=exp(y0+tau_n). For all sufficiently large n,

~~~math
S_\alpha(x_n)>
\frac{\delta}{2}\frac{\sqrt{x_n}}{\log x_n}\longrightarrow+\infty.
~~~

By (2), F_alpha also has a negative value. Repeating the same argument gives a sequence along which S_alpha tends to minus infinity. That argument works for every positive alpha, since the mean is always negative.

This proves the proposed theorem, subject to the stated independent review.

## 8. What is and is not being claimed

- The threshold A is existential. The proof is not a numerical counterexample and does not assert that 20.40443 itself is inadmissible.
- No independence hypothesis on beta zeros is used. Almost periodic recurrence repeats an already attained phase configuration; it does not prescribe independent phases.
- The limit alpha to infinity is taken in distributions to select fixed alpha values. It is not interchanged with the x to infinity asymptotic. Once alpha is selected, (8) and recurrence apply at that fixed alpha.
- This does not contradict the original Chebyshev conjecture, which has alpha=1 and follows from the accepted Dirichlet GRH.
- The dependence on RH for zeta occurs only in the quantitative prime-square error in (10). The campaign accepts that hypothesis as well as beta GRH.
- The all-alpha equivalence, considered as a formal logical statement without the accepted GRH input, must be distinguished from the simultaneous negative-limit assertion. This note claims its failure under the accepted GRH input; it does not silently infer the truth of GRH from the conditional oscillation argument.
- No original-priority claim is justified until the original Fujii formulation and the relevant later literature have been checked.

## 9. Prior-art and review log

As of this checkpoint, exact-name, exact-title, all-alpha, large-alpha, counterexample, disproof, and almost-periodic searches found the 1988 source, the 2019 bounded-alpha result, the 2025 bibliography, and the corrected Suzuki article, but no established disproof of the all-alpha extension. Absence of a search result is not a proof of novelty.

Outstanding review work:

1. Retrieve Fujii's original text and Hardy–Littlewood's exact oscillation statement.
2. Independently check the explicit-formula signs, the prime-square normalization, estimate (12), and the two limiting operations.
3. Check whether the approximate-identity obstruction has already been published under different terminology.
4. Only after these checks decide whether any solved-conjecture entry is warranted.

Independent review is coordinated in issue #87. This file records the full argument so that the review can identify a specific failing step if there is one.
