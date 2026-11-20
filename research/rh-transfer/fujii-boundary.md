# Fujii's conjecture

Independent replacement lemma, 20 November 2026. Main argument: [fujii.md](fujii.md). Unweighted-prime normalization: [fujii-review.md](fujii-review.md). Complementary non-GRH case: [fujii-landau.md](fujii-landau.md). Discussion: [issue #87](https://github.com/1337isnot1337/solved-conjectures/issues/87).

## 1. Purpose

The positive test pairing needed in the beta-GRH branch can be obtained from the local boundary behavior of the explicit formula. This removes the need to invoke Hardy–Littlewood's deep oscillation theorem for the character-weighted von Mangoldt sum.

The previous proof using that oscillation theorem remains a valid independent route. This note gives a shorter route using only the explicit formula, zero conjugation, and absolute convergence of a second-order zero sum.

The use of local boundary behavior followed by almost-periodic recurrence is classical. Kaczorowski's boundary-value method is described in [Ford–Konyagin, Section 4.1, printed pages 12–13](https://ford126.web.illinois.edu/wwwpapers/racefk.pdf). The claim here is the specific application to the exponential-power family; no originality is claimed for the general recurrence principle.

## 2. The reflection identity

Assume GRH for beta(s)=L(s,chi_4). Write its nontrivial zeros as rho=1/2+i gamma, with their multiplicities, and define the tempered distribution

~~~math
R(t)=-1-\sum_\rho\frac{e^{i\gamma t}}{\rho}.
\tag{1}
~~~

The definition is rigorous because, for every Schwartz test function phi, the Fourier transform decays rapidly and

~~~math
\sum_\rho\frac{|\widehat\phi(-\gamma)|}{|\rho|}<\infty.
~~~

The standard bound N_beta(T)=O(T log(T+2)) suffices.

Complex conjugation permutes the zeros and preserves every multiplicity, since beta has real Dirichlet coefficients. Reflection of a distribution is defined by pairing it with phi(-t). Reindexing the reflected zero sum by rho maps to its conjugate therefore gives

~~~math
\begin{aligned}
R(t)+R(-t)
&=-2-\sum_\rho e^{i\gamma t}
 \left(\frac1\rho+\frac1{\overline\rho}\right)\\
&=-2-\sum_\rho\frac{e^{i\gamma t}}{|\rho|^2}.
\end{aligned}
\tag{2}
~~~

The second equality uses rho+conjugate(rho)=1, which is where beta GRH enters this identity.

Every step in (2) is valid in the space of tempered distributions: the series of test pairings converges absolutely, so reindexing is allowed. Multiplicities are neither discarded nor divided by two.

Set

~~~math
A(t)=\sum_\rho\frac{e^{i\gamma t}}{|\rho|^2},
\qquad
B=\sum_\rho\frac1{|\rho|^2}.
\tag{3}
~~~

The zero count implies B<infinity. For example, dyadic intervals give a convergent majorant of size sum_j (j+1)2^(-j). The finitely many zeros in a bounded region cause no problem, since rho is never zero.

Thus A is an ordinary continuous real even function, its series converges absolutely and uniformly, and |A(t)|<=B for all real t. Equation (2) becomes

~~~math
R(-t)=-2-A(t)-R(t).
\tag{4}
~~~

No convergence claim is made for the original undamped zero sum pointwise at t=0.

## 3. The two one-sided singularities

Put c_0=beta'(0)/beta(0). The odd-character explicit formula is

~~~math
\psi_\chi(x)
=-\sum_\rho\frac{x^\rho}{\rho}
-c_0+\frac12\log\frac{x+1}{x-1},
\qquad x>1,
\tag{5}
~~~

with the usual distributional interpretation at prime-power jumps. Here

~~~math
\psi_\chi(x)=\sum_{n\le x}\chi_4(n)\Lambda(n).
~~~

The trivial zeros at -1,-3,-5,... give the positive logarithmic term in (5), since their contribution is

~~~math
\sum_{j\ge0}\frac{x^{-2j-1}}{2j+1}
=\frac12\log\frac{x+1}{x-1}.
~~~

For 0<t<log 3, the character-weighted prime-power sum is zero. Hence (5) gives an ordinary smooth representative of R on that interval:

~~~math
R(t)=-1+e^{-t/2}
 \left[c_0-\frac12\log\frac{e^t+1}{e^t-1}\right].
\tag{6}
~~~

As t decreases to zero,

~~~math
\log\frac{e^t+1}{e^t-1}
=\log\frac2t+O(t^2).
~~~

Since t log(1/t) tends to zero, (6) yields

~~~math
R(t)
=-\frac12\log\frac1t
+c_0-1-\frac12\log2+o(1)
\longrightarrow-\infty.
\tag{7}
~~~

Now apply (4). Because A(t) tends to B, it gives

~~~math
R(-t)
=\frac12\log\frac1t
-1-B-c_0+\frac12\log2+o(1)
\longrightarrow+\infty
\qquad(t\downarrow0).
\tag{8}
~~~

This also proves that R has a locally integrable representative on the negative punctured interval (-log 3,0): equation (4) represents it there by a continuous bounded function plus the reflected function in (6). In fact the representative is continuous away from zero. The logarithmic singularity is locally integrable, although no assertion about a distribution supported exactly at zero is needed for this proof.

The signs are explicit: R tends to minus infinity from the positive side, and to plus infinity from the negative side.

## 4. The positive test pairing

By (8), there is delta>0 such that R is strictly positive throughout the interval (-delta,-delta/2). Choose a nonnegative, nonzero smooth test function phi compactly supported inside that interval. Then

~~~math
\langle R,\phi\rangle>0.
\tag{9}
~~~

For alpha>0 let

~~~math
F_\alpha(t)
=-\frac{\Gamma(1/(2\alpha))}{2\alpha}
-\sum_\rho\frac{\Gamma(\rho/\alpha)}{\alpha}e^{i\gamma t}.
\tag{10}
~~~

For fixed alpha this is a continuous real Bohr almost-periodic function, by the exponential decay of Gamma in the zero height. The companion review proves

~~~math
F_\alpha\longrightarrow R
\quad\hbox{in }\mathcal D'(\mathbb R)
\qquad(\alpha\to\infty).
\tag{11}
~~~

The convergence is on the whole real line. For completeness, the uniform coefficient bound for alpha>=1 is

~~~math
\left|\frac{\Gamma(\rho/\alpha)}{\alpha}\right|
=\frac{|\Gamma(1+\rho/\alpha)|}{|\rho|}
\le\frac{\Gamma(1+1/(2\alpha))}{|\rho|}
\le\frac C{|\rho|}.
~~~

Together with the Fourier decay of a compactly supported smooth test function, this justifies dominated convergence in the zero sum.

Equations (9)–(11) show that for every sufficiently large alpha,

~~~math
\int_{\mathbb R}F_\alpha(t)\phi(t)\,dt>0.
~~~

Each such fixed F_alpha therefore has a positive value at a point in the negative interval supporting phi.

This is a statement about the zero-series function F_alpha. It is not an application of the large-x prime-sum asymptotic at a negative logarithmic argument.

## 5. Moving the positive phase to large positive arguments

Fix one of the alpha values selected in Section 4. Suppose F_alpha(t_0)>2epsilon for some epsilon>0. Uniform almost periodicity provides arbitrarily large positive shifts tau such that

~~~math
\sup_t|F_\alpha(t+\tau)-F_\alpha(t)|<\epsilon.
~~~

Therefore F_alpha(t_0+tau)>epsilon at arbitrarily large positive arguments.

Only at those large positive arguments do we apply the independently proved normalization

~~~math
\frac{\log x}{\sqrt x}S_\alpha(x)
=F_\alpha(\log x)+o_\alpha(1).
\tag{12}
~~~

It follows that S_alpha(x) is at least a fixed positive multiple of sqrt(x)/log x along a sequence tending to infinity. This refutes its proposed negative limit for every sufficiently large fixed alpha under beta GRH.

The negative subsequence follows from the negative mean of F_alpha, as in the main argument. Alternatively, (7) supplies a negative compact test pairing and (11) gives a negative value for every sufficiently large alpha; recurrence then gives both signs without calculating the mean. The negative-mean argument additionally handles every positive alpha.

No linear independence of zero ordinates is used. No simultaneous limiting process in alpha and x is used.

## 6. Attribution and prior-art check

The local-boundary strategy is related directly to Kaczorowski's classical method, rather than being a newly invented principle. The following sources were checked:

- [Ford and Konyagin's survey](https://ford126.web.illinois.edu/wwwpapers/racefk.pdf), Section 4.1, explains recurrence of finite-argument orderings from Bohr and Stepanov almost periodicity and explicitly describes locating those orderings near zero.
- [Kaczorowski and Ramaré, Almost periodicity of some error terms in prime number theory](https://www.impan.pl/shop/publication/transaction/download/product/82202), Acta Arithmetica 106 (2003), 277–297, develops the corresponding boundary functions and their distribution. No Fujii or exponential-power all-alpha conclusion was found in the full paper.
- Suzuki's [2011/2012 introduction](https://arxiv.org/pdf/1204.1823) and [corrected 2025 Section 1.2](https://link.springer.com/article/10.1007/s11139-025-01238-9) independently record Fujii's proposed all-alpha extension, without giving this disproof.

Directed searches for Fujii with Chebyshev, boundary, singularity, reflection, and Kaczorowski did not locate an earlier statement applying the boundary obstruction to Fujii's exponential-power family. The source and novelty limitations in the main files remain: the original 1988 paper has not been read directly, and absence from these searches does not establish priority.

The reflection identity, both signs in (7)–(8), the local representative on the negative interval, and the use of a negative-support test function were independently checked by a second research agent before this checkpoint.

This is a replacement lemma within the same named-conjecture argument, not an additional solved-target count.

## 7. A positive value at a specified phase

The same boundary calculation gives a more precise result:

~~~math
F_\alpha(0)
=\left(\frac12-\frac1e\right)\log\alpha+O(1)
\qquad(\alpha\to\infty).
\tag{13}
~~~

In particular, the positive phase in Section 4 can be chosen to be exactly zero for every sufficiently large alpha. This statement concerns the almost-periodic zero series; recurrence is still applied before passing to large prime-sum arguments.

### 7.1. Excluding a term supported at zero

The punctured formulas (6) and (4) alone do not rule out a distribution supported exactly at zero. That issue must be settled before convolving R against a kernel concentrated at zero.

For real sigma>0,

~~~math
\beta(\sigma)
=\sum_{n\ge0}
 \big((4n+1)^{-\sigma}-(4n+3)^{-\sigma}\big)>0.
~~~

The paired series converges absolutely, so beta(1/2)>0. Consequently no nontrivial zero has gamma=0. Define

~~~math
Q(t)=-t-\sum_\rho\frac{e^{i\gamma t}}{i\gamma\rho}.
\tag{14}
~~~

The oscillatory series converges absolutely and uniformly: there are finitely many bounded-height zeros, none has gamma=0, and the remaining coefficients have a convergent majorant of order 1/gamma squared. Thus Q is continuous and Q'=R in distributions.

Let R_0 denote the ordinary representative supplied by the explicit formula for t>0 and by (4) for t<0. Assign any value at zero. The logarithmic behavior (7)–(8) makes R_0 locally integrable. Define its continuous, locally absolutely continuous primitive

~~~math
P(t)=\int_0^t R_0(u)\,du.
~~~

On each open half-line, (Q-P)'=0 in distributions. Hence Q-P is constant on each half-line. Both Q and P are continuous at zero, so the constants agree. Therefore Q-P is constant on the whole line and

~~~math
R=R_0
\quad\hbox{as distributions on }\mathbb R.
\tag{15}
~~~

This excludes every additional term supported at zero without assuming pointwise convergence of the original undamped zero sum.

Under beta GRH, the usual explicit-formula estimate gives
psi_chi(e^t)=O(e^(t/2)(1+t)^2) for t bounded away from zero. Formula (5), followed by reflection for negative t, yields

~~~math
R_0(t)=O_\delta(1+t^2)\qquad(|t|\ge\delta)
\tag{16}
~~~

for every fixed delta>0, with the ordinary one-sided values at jumps. No zeta RH input is required.

### 7.2. The exact convolution

Set

~~~math
k_\alpha(v)=\alpha
 \exp\big((\alpha+\tfrac12)v-e^{\alpha v}\big).
\tag{17}
~~~

For each fixed alpha>0 this is a Schwartz function. Its Fourier moments, by u=e^(alpha v), are

~~~math
\int_{\mathbb R}k_\alpha(v)\,dv
=\Gamma(1+\tfrac1{2\alpha}),
\qquad
\int_{\mathbb R}k_\alpha(v)e^{i\gamma v}\,dv
=\Gamma(1+\tfrac{\rho}{\alpha}).
~~~

Pairing (1) with k_alpha and using the Gamma functional equation gives

~~~math
\begin{aligned}
\langle R,k_\alpha\rangle
&=-\Gamma(1+\tfrac1{2\alpha})
 -\sum_\rho
    \frac{\Gamma(1+\rho/\alpha)}{\rho}\\
&=-\frac{\Gamma(1/(2\alpha))}{2\alpha}
 -\sum_\rho\frac{\Gamma(\rho/\alpha)}{\alpha}\\
&=F_\alpha(0).
\end{aligned}
\tag{18}
~~~

The test-function pairing is justified by absolute convergence in the zero sum. Equation (15) converts (18) to the ordinary integral of R_0(v)k_alpha(v).

Choose 0<delta<log 3 fixed. By (16), the integral over |v|>=delta is O(exp(-c alpha)) for some c>0 as alpha tends to infinity. For the negative tail this follows directly from k_alpha(v)<=alpha exp((alpha+1/2)v). For the positive tail, substitute w=alpha v and use the superexponential decay of exp(w-e^w). Polynomial factors from (16) do not change these conclusions.

### 7.3. Rescaling the local singularity

Combining (7)–(8),

~~~math
R_0(v)
=-\frac12\operatorname{sgn}(v)
       \log\frac1{|v|}+O(1)
\qquad(0<|v|<\delta),
\tag{19}
~~~

where the O(1) is uniform on both sides. Put

~~~math
q(w)=\exp(w-e^w),\qquad w=\alpha v.
~~~

Then k_alpha(v)dv=q(w)exp(w/(2alpha))dw. The bounded remainder in (19) integrates to O(1), since the total mass is Gamma(1+1/(2alpha)), uniformly bounded for alpha>=1. The tails are negligible, so (18)–(19) give

~~~math
F_\alpha(0)
=-\frac12\log\alpha\, J_\alpha
+\frac12 L_\alpha+O(1),
\tag{20}
~~~

where

~~~math
J_\alpha=\int_{\mathbb R}
 \operatorname{sgn}(w)q(w)e^{w/(2\alpha)}\,dw,
\qquad
L_\alpha=\int_{\mathbb R}
 \operatorname{sgn}(w)\log|w|\,
 q(w)e^{w/(2\alpha)}\,dw.
~~~

Extending the local integrals to the whole line changes (20) by O(1), using exponential decay as w tends to minus infinity, superexponential decay as w tends to plus infinity, and local integrability of log|w|.

The elementary bound

~~~math
|e^{w/(2\alpha)}-1|
\le\frac{|w|}{2\alpha}e^{\max(w,0)/2}
\qquad(\alpha\ge1)
~~~

and integrability of the corresponding q-weighted moment show

~~~math
J_\alpha
=\int_{\mathbb R}\operatorname{sgn}(w)q(w)\,dw
 +O(\alpha^{-1}).
\tag{21}
~~~

Also L_alpha=O(1) uniformly for alpha>=1: near zero the only singularity is log|w|, and the two tails have the decay just stated.

Finally, u=e^w gives

~~~math
\int_{-\infty}^0 q(w)\,dw
=\int_0^1 e^{-u}\,du=1-e^{-1},
\qquad
\int_0^\infty q(w)\,dw
=\int_1^\infty e^{-u}\,du=e^{-1}.
~~~

Thus J_alpha=2/e-1+O(1/alpha). Substitution into (20) proves (13).

The coefficient 1/2-1/e is positive. This supplies a direct positive value, rather than only a positive test pairing, for every sufficiently large alpha. It also identifies why a sharp exponential-power cutoff changes the sign: its logarithmic convolution kernel assigns more mass to the positive singularity on the negative side.

The convolution orientation, coefficient, point-supported ambiguity, and tail estimates were independently checked by two agents. Directed searches for Fujii with large alpha, log alpha, 1/e, and counterexample returned the previously cited literature but no earlier statement of (13) or of the full large-alpha oscillation conclusion. This is a bounded priority check, not a proof that the deduction is unpublished. The target count remains one.

## 8. Positive lower density of both sign sets

Assume beta GRH. For every sufficiently large fixed alpha, there exist constants c_+, c_-, kappa_+, kappa_->0 such that

~~~math
\begin{aligned}
\liminf_{X\to\infty}\frac1X
 \operatorname{meas}\left\{2\le x\le X:
 S_\alpha(x)>c_+\frac{\sqrt x}{\log x}\right\}
 &\ge \kappa_+,\\
\liminf_{X\to\infty}\frac1X
 \operatorname{meas}\left\{2\le x\le X:
 S_\alpha(x)<-c_-\frac{\sqrt x}{\log x}\right\}
 &\ge \kappa_-.
\end{aligned}
\tag{22}
~~~

Here meas is Lebesgue measure. Both assertions also hold when the sets are restricted to integers and measure is replaced by cardinality. In particular, both sign sets have positive lower natural density and positive lower logarithmic density.

This conclusion is conditional on beta GRH. The complementary Landau argument proves oscillation when beta GRH fails, but the argument in that branch does not establish these density assertions.

### 8.1. A general recurrence lemma

Let F be a continuous real Bohr almost-periodic function and suppose F(t_0)>0. Choose c>0 and delta>0 such that

~~~math
F(t)>3c\qquad(|t-t_0|\le\delta).
\tag{23}
~~~

The c-almost-periods are relatively dense: there is L>0 such that every interval of length L contains a tau with

~~~math
\sup_{t\in\mathbb R}|F(t+\tau)-F(t)|<c.
\tag{24}
~~~

For the functions here, this property follows from uniform convergence of the trigonometric series. Finite trigonometric sums have relatively dense almost-periods by compactness of their orbit closure on a finite-dimensional torus, and a uniformly small tail preserves (24).

Let Y be large. Apply (24) to the interval

~~~math
[Y-t_0-L-\delta,\;Y-t_0-\delta].
~~~

Choose an almost-period tau in that interval and put b=t_0+tau. Then

~~~math
Y-L-\delta\le b\le Y-\delta,
\qquad
F(t)>2c\quad(b-\delta\le t\le b+\delta).
\tag{25}
~~~

Thus every sufficiently long logarithmic window has a positive interval of the same fixed width 2delta.

### 8.2. Passing to prime sums and real natural density

Apply the lemma with F=F_alpha. Section 7 provides its positive value for every sufficiently large alpha. The already proved asymptotic (12) says that for all sufficiently large t,

~~~math
\left|t e^{-t/2}S_\alpha(e^t)-F_\alpha(t)\right|<c.
\tag{26}
~~~

The bound holds throughout the interval in (25) once Y-L-2delta is sufficiently large. Hence

~~~math
S_\alpha(x)>c\frac{\sqrt x}{\log x}
\qquad
(e^{b-\delta}\le x\le e^{b+\delta}).
\tag{27}
~~~

Set X=e^Y. This interval lies in [2,X], and its length is at least

~~~math
\begin{aligned}
e^{b+\delta}-e^{b-\delta}
&=e^{b-\delta}(e^{2\delta}-1)\\
&\ge X e^{-L-2\delta}(e^{2\delta}-1)\\
&=X e^{-L}(1-e^{-2\delta}).
\end{aligned}
\tag{28}
~~~

Therefore the first lower bound in (22) holds with

~~~math
c_+=c,\qquad \kappa_+=e^{-L}(1-e^{-2\delta})>0.
\tag{29}
~~~

For the other sign, the Bohr mean of F_alpha is

~~~math
-\frac{\Gamma(1/(2\alpha))}{2\alpha}<0.
~~~

There is no zero-frequency contribution from a nontrivial zero, because beta(1/2)>0. A function with negative mean must take a negative value. Apply the same argument to -F_alpha and -S_alpha. This supplies c_- and kappa_- and proves the second assertion in (22).

The constants may depend on alpha and on the selected phase. No uniform assertion as alpha tends to infinity is needed or claimed.

### 8.3. Integer density and logarithmic density

Every closed real interval [a,b] contains at least b-a-1 integers. The interval in (27) therefore contributes at least kappa_+ X-1 positive integers below X, for all sufficiently large X. Dividing by floor(X) and taking a lower limit proves the integer assertion. Applying the same argument to the negative interval proves its counterpart.

For completeness, positive lower natural density implies positive lower logarithmic density in both settings. If A(X) denotes the measure or counting function of one of the sets, then for every fixed 0<kappa'<kappa, one has A(X)>=kappa' X for all sufficiently large X. Integration by parts gives, respectively,

~~~math
\int_{\substack{2\le x\le X\\x\in E}}\frac{dx}{x}
 =\frac{A(X)}X+\int_2^X\frac{A(u)}{u^2}\,du,
\qquad
\sum_{\substack{2\le n\le X\\n\in E}}\frac1n
 =\frac{A(X)}X+\int_2^X\frac{A(u)}{u^2}\,du,
\tag{30}
~~~

up to a fixed lower-endpoint constant if a different convention for A is used. The right-hand side is at least kappa' log X-O(1). Letting kappa' increase to kappa proves the stated logarithmic-density conclusion.

This is a corollary within the same Fujii argument. It adds no named-conjecture count.
