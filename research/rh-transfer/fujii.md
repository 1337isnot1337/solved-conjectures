# Fujii's conjecture

Research checkpoint: 20 November 2026. Target discussion: [issue #87](https://github.com/1337isnot1337/solved-conjectures/issues/87). Campaign coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

## Status

The complete written proof has received independent internal reviews covering the Mellin normalization, a separate convolution proof, the distributional limit and recurrence, and the direct zero-count proof of the positive phase. It is not yet entered in the solved-results catalogue. Publication priority is not established. The original 1988 paper has not been directly retrieved; three later scholarly sources explicitly record its all-parameter conjecture.

The candidate theorem is qualitative: all sufficiently large fixed smoothing exponents give oscillation. No numerical threshold, finite zero computation, or extension of an admissible numerical range is claimed.

The combined oscillation theorem below is unconditional: Sections 3–7 prove it when beta GRH holds, and Section 7.1 handles the complementary case by Landau's theorem. Refuting Fujii's original family of equivalences, rather than the simultaneous negative-limit assertion, uses the campaign's accepted beta GRH input. No linear independence, zero simplicity, or nonabelian GRH is assumed.

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
5. G. H. Hardy and J. E. Littlewood, *Contributions to the theory of the Riemann zeta-function and the theory of the distribution of primes*, Acta Mathematica **41**, 119–196. [Original scan](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/5282-11511_2006_Article_BF02422942.pdf), printed page 127 and section 5. The scan was retrieved and its psi_1 definition checked: it is exactly the character-weighted von Mangoldt sum used here. The result is psi(x,chi)=Omega_+(sqrt(x) log log log x), with its negative counterpart. Subsequent fetches of the same server sometimes reject its content type; the original check and those later failures are separate events.
6. M. Suzuki, *On monotonicity of certain weighted summatory functions associated with L-functions*, [arXiv:1204.1823](https://arxiv.org/pdf/1204.1823), introduction, printed page 2. This third source explicitly states Fujii's conjecture for every positive alpha.
7. K. Ford and S. Konyagin, *Chebyshev's conjecture and the prime number race*, and J. Kaczorowski and O. Ramare, *Almost periodicity of some error terms in prime number theory*, Acta Arithmetica **106** (2003), 277–297, [DOI](https://doi.org/10.4064/aa106-3-6). These describe classical recurrence machinery in this setting. The recurrence mechanism is not claimed as new. The proposed application to all sufficiently large exponential-power smoothing parameters is the item under prior-art review.

The full statement quantified over alpha is the target. The theorem below contradicts the simultaneous negative-limit assertion without any RH assumption. Under the accepted beta GRH input it also refutes the reported family of equivalences. Section 8 distinguishes these two logical statements.

## 2. Theorem

There is a real A>0 such that, for every fixed alpha>A,

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

For Sections 3–7 assume beta GRH. Section 7.1 treats its negation and completes the unconditional theorem.

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
F_\alpha\ \longrightarrow
\ R:=-1-\sum_\rho\frac{e^{i\gamma y}}{\rho}
\quad\hbox{in }\mathcal D'(\mathbb R)
\quad(\alpha\to\infty).
\tag{4}
~~~

The constant converges to -1 because Gamma(z) is asymptotic to 1/z at zero. The distribution on the right is defined by the absolutely convergent pairing just displayed. No pointwise or uniform convergence of the undamped zero series is claimed.

## 5. The limiting distribution has a positive test pairing

Put

~~~math
\psi_\chi(x)=\sum_{n\le x}\Lambda(n)\chi(n),
\qquad c_0=\frac{\beta'}{\beta}(0).
~~~

At x>1 away from prime powers, the standard odd-character explicit formula is

~~~math
\psi_\chi(x)=
-\sum_\rho\frac{x^\rho}{\rho}
-c_0+\frac12\log\frac{x+1}{x-1}.
\tag{5}
~~~

The trivial zeros at -1,-3,-5,... give the positive logarithmic term. The symmetric zero sum in (5), interpreted distributionally, agrees with (4). Thus on y>0,

~~~math
R(y)=
-1+e^{-y/2}\left(
 \psi_\chi(e^y)+c_0
 -\frac12\log\frac{e^y+1}{e^y-1}
\right).
\tag{6}
~~~

This is a locally integrable function, smooth between logarithms of prime powers.

### 5.1 A local reflection argument

Conjugation permutes the beta zeros and preserves their multiplicities. Reindexing the reflected distribution, and using rho+conjugate(rho)=1, gives

~~~math
R(y)+R(-y)=-2-A(y),\qquad
A(y)=\sum_\rho\frac{e^{i\gamma y}}{|\rho|^2}.
~~~

The series defining A converges absolutely and uniformly by zero counting. In particular A is continuous and bounded. Every reindexing is valid because the distributional test pairings converge absolutely.

For 0<y<log 3, psi_chi(e^y)=0. Equation (6) and log((e^y+1)/(e^y-1))=log(2/y)+O(y^2) therefore give

~~~math
R(y)=-\frac12\log\frac1y+O(1)
\quad\text{and}\quad
R(-y)=\frac12\log\frac1y+O(1)
\qquad(y\downarrow0).
~~~

The second identity also supplies an ordinary continuous representative of R on the negative punctured interval. It follows that R is positive on an interval (-delta,-delta/2) for some delta>0. Choose a nonnegative, nonzero smooth test function phi compactly supported there. Then

~~~math
\langle R,\phi\rangle>0.
\tag{7}
~~~

Global distributional convergence (4) now gives A_0 such that

~~~math
\int F_\alpha(y)\phi(y)\,dy>0
\qquad\text{for every }\alpha>A_0.
~~~

Thus each such F_alpha has a positive value. The negative location of the test support causes no problem: this statement concerns the zero-series profile on the full real line. Section 7 uses recurrence to move that value to arbitrarily large positive arguments before applying the prime-sum asymptotic.

This argument needs neither Littlewood's oscillation theorem nor a pointwise interpretation of the undamped zero sum at zero. A complete independent derivation is in [the boundary review](fujii-boundary.md), Sections 2–5.

### 5.2 A stronger direct value and an independent older route

The same boundary analysis also proves

~~~math
F_\alpha(0)=
\left(\frac12-\frac1{\mathrm e}\right)\log\alpha+O(1)
\qquad(\alpha\to\infty).
~~~

The coefficient is positive. Thus the positive phase can in fact be fixed at zero for every sufficiently large alpha.

Here is the mechanism; the full convergence proof is in [the boundary review, Section 7](fujii-boundary.md). The exact identity is

~~~math
F_\alpha(0)=\langle R,k_\alpha\rangle,\qquad
k_\alpha(v)=\alpha
 e^{(\alpha+1/2)v-e^{\alpha v}}.
~~~

To replace the pairing by an integral across zero, first exclude a point-supported term. The series

~~~math
Q(y)=-y-\sum_\rho\frac{e^{i\gamma y}}{i\gamma\rho}
~~~

converges uniformly and absolutely after the linear term, so Q is continuous and Q'=R in distributions. The locally integrable representative supplied by (6) and reflection has a continuous primitive. These two primitives differ by a constant on each half-line; continuity at zero makes the constants equal. Therefore there is no additional distribution supported at zero.

Away from zero, beta GRH gives R(v)=O_delta(1+v^2). The tails |v|>=delta are consequently exponentially small in alpha when paired with k_alpha. On the remaining interval,

~~~math
R(v)=-\frac12\mathop{\mathrm{sgn}}(v)
             \log\frac1{|v|}+O(1).
~~~

After w=alpha v, the kernel measure becomes
q(w) exp(w/(2alpha)) dw, where q(w)=exp(w-exp(w)).
The masses of q on the negative and positive half-lines are 1-1/e and 1/e, respectively. Its absolute log|w| moment is finite. Moreover, replacing exp(w/(2alpha)) by one changes the signed mass by O(1/alpha). Substitution gives the displayed direct-value asymptotic with O(1) remainder.

The earlier proof of (7) remains an independent alternative: Hardy–Littlewood's positive oscillation for psi_chi(x)/sqrt(x), substituted in (6), supplies a positive interval on the positive real axis. That deeper theorem is no longer required by the main argument.

### 5.3 A shorter zero-count proof with a convergent constant

An independent proof in [fujii-zero-count.md](fujii-zero-count.md) strengthens the asymptotic to

~~~math
F_\alpha(0)=
\left(\frac12-\frac1{\mathrm e}\right)\log\alpha
+C_\beta+
O\!\left(\frac{\log(\alpha+2)}{\alpha}\right).
~~~

The constant is

~~~math
C_\beta=-1-\sum_{\gamma>0}\frac1{1/4+\gamma^2}
-\frac1\pi\int_0^\infty
 \mathop{\mathrm{Re}}\Gamma(iu)\log\frac{2u}{\pi}\,du,
~~~

with absolutely convergent sum and integral.

The proof subtracts the pole of gamma before applying the classical zero-counting formula. With epsilon=1/(2alpha), Fourier inversion gives the exact identity

~~~math
\int_0^\infty
\mathop{\mathrm{Re}}\left(
 \Gamma(\varepsilon+iu)-\frac1{\varepsilon+iu}
\right)\,du
=\frac{\pi}{\mathrm e}-\frac{\pi}{2}.
~~~

Stieltjes summation against
N_+(T)=(T/(2pi))log(2T/(pi e))+O(log(T+2))
then produces the displayed coefficient. After removing the pole, the real-part derivative is uniformly integrable, so the zero-counting error contributes only O(log(alpha+2)/alpha). This proof avoids the boundary-distribution step altogether. The prime-sum normalization and recurrence are still needed.

The existing general boundary and almost-periodicity framework is classical. [The dedicated prior-art audit](fujii-prior-art.md) shows precisely how Kaczorowski's earlier papers and Kaczorowski–Ramaré (2003) already supply that mechanism. The possible contribution here is the explicit Fujii-weight corollary and its application; priority remains unclaimed.

## 6. Passage from zero series to the actual prime sum

This section supplies the normalization needed to ensure that the theorem concerns the original unweighted-prime sum.

Under beta GRH and zeta RH, for each fixed alpha>0, we claim

~~~math
\frac{\log x}{\sqrt{x}}S_\alpha(x)
=F_\alpha(\log x)+O_\alpha(1/\log x)
\qquad (x\to\infty).
\tag{8}
~~~

A proof using a smooth cutoff and the explicit formula follows. Section 6.4 proves the weaker error o_alpha(1), sufficient for the theorem, under beta GRH alone.

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

To justify (11) first multiply f_x by a smooth upper cutoff h(log t-R), where h is one on (-infinity,0] and zero on [1,infinity). The resulting test is compactly supported. For fixed x, the function g_x(u)=e^(u/2)f_x(e^u) is Schwartz, and g_x(u)h(u-R) tends to g_x in every Schwartz seminorm as R tends to infinity. The differentiated zero series paired with these tests converges absolutely by N_beta(T)=O(T log(T+2)); the Fourier transforms decrease faster than any power uniformly along the cutoff limit. The arithmetic integral and the E term converge by domination. Thus (11) follows from the compact-test explicit formula without assuming an unsupported extension to noncompact tests.

In the last integral, differentiating the cutoff gives O(x^(1/12) log x), differentiating 1/log t gives O_alpha(x^(1/3)), and differentiating the exponential weight gives O_alpha(x^(1/3) log x). Their sum is o(sqrt(x)/log^2 x). All integrals have support bounded away from t=1, and the weight decreases faster than any power at infinity. See the independent [Mellin review](fujii-mellin-review.md) for the separate integral estimates.

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

### 6.4 Remove zeta RH

Here is a separate proof that beta GRH alone gives

~~~math
\frac{\log x}{\sqrt{x}}S_\alpha(x)
=F_\alpha(\log x)+o_\alpha(1).
\tag{14}
~~~

All limits in this subsection keep alpha fixed. Full details are also recorded in the independent [convolution review](fujii-review.md).

Put H(t)=e^(-t/2)theta_chi(e^t), extended by zero for t<log 2. Beta GRH gives H(t)=O((1+t)^2) for t>=0. The ordinary prime number theorem, the prime-power decomposition, and (6) give

~~~math
H(t)=R(t)+r(t),\qquad r(t)\longrightarrow0
\quad(t\longrightarrow+\infty).
\tag{15}
~~~

This identity holds as distributions on t>0. The zero-counting bound makes R a tempered distribution on the full real line. Multiplying r by a fixed smooth cutoff which is one for t>=2 leaves H-R-r_cut supported in (-infinity,2].

For any Schwartz kernel h whose derivatives decrease exponentially at minus infinity and faster than exponentially at plus infinity, define

~~~math
B_h(t)=\int_{\mathbb R} H(t+v)h(v)\,dv.
~~~

Then

~~~math
B_h(t)=
-\int_{\mathbb R}h(v)\,dv
-\sum_\rho\frac{e^{i\gamma t}}{\rho}
       \int_{\mathbb R}h(v)e^{i\gamma v}\,dv+o(1).
\tag{16}
~~~

The zero series is absolutely and uniformly convergent by Fourier decay and zero counting. The bounded function r_cut tends to zero, so its convolution is o(1) by dominated convergence. For the remaining distribution supported to the left of 2, localize h(. - t) to that half-line. Every Schwartz seminorm of the localized test tends to zero at an exponential rate times a polynomial in t; continuity of a tempered distribution makes that contribution o(1). Formula (16) applies to each fixed polynomial multiple v^m h as well. In particular these convolutions are bounded.

Set

~~~math
k_\alpha(v)=\alpha e^{(\alpha+1/2)v-e^{\alpha v}},
\qquad
j_\alpha(v)=e^{v/2-e^{\alpha v}}.
~~~

Both satisfy the kernel conditions. Direct integration gives

~~~math
\int k_\alpha(v)e^{i\gamma v}\,dv
=\Gamma(1+\rho/\alpha),
\qquad
\int k_\alpha(v)\,dv=\Gamma(1+1/(2\alpha)).
~~~

Thus (16) and Gamma(1+z)=z Gamma(z) give
B_k_alpha(t)=F_alpha(t)+o(1).
All the moment convolutions B_(v^m k_alpha) and B_(v^m j_alpha) are bounded.

Stieltjes integration by parts, followed by u=e^(t+v), gives the exact identity

~~~math
t e^{-t/2}S_\alpha(e^t)
=
\int_{\log2-t}^\infty
 H(t+v)k_\alpha(v)\frac{t}{t+v}\,dv
+
\int_{\log2-t}^\infty
 H(t+v)j_\alpha(v)\frac{t}{(t+v)^2}\,dv.
\tag{17}
~~~

On |v|<=t/2 expand the two rational factors as

~~~math
\frac{t}{t+v}
=1-\frac vt+\frac{v^2}{t^2}
 +O(|v|^3/t^3),\qquad
\frac{t}{(t+v)^2}
=\frac1t-\frac{2v}{t^2}+O(v^2/t^3).
~~~

Since H(t+v)=O(t^2) there, the integrated remainders are O_alpha(1/t). The polynomial moment convolutions just proved bounded control the nonconstant displayed terms by O_alpha(1/t). For v<-t/2 the actual integration range has t+v>=log 2, so denominators are harmless and the kernel tails give exponentially small errors times a polynomial in t. For v>t/2 the errors decrease still faster. These same tail bounds permit extending the central moment integrals to the full line. Consequently (17) is B_k_alpha(t)+O_alpha(1/t), which proves (14).

No zeta RH is used in (15)–(17). In particular, replacing the quantitative error in (8) by the vanishing error in (14) retains every sign conclusion below.

## 7. Almost periodicity forces both signs arbitrarily far out

Fix alpha>A. By section 5 there are y0 and delta>0 with F_alpha(y0)>2delta.

For a Bohr almost-periodic function, the set of delta-almost-periods is relatively dense. In particular there is a sequence tau_n tending to positive infinity with

~~~math
\sup_y|F_\alpha(y+\tau_n)-F_\alpha(y)|<\delta.
~~~

Hence F_alpha(y0+tau_n)>delta. Apply (14) with x_n=exp(y0+tau_n). For all sufficiently large n,

~~~math
S_\alpha(x_n)>
\frac{\delta}{2}\frac{\sqrt{x_n}}{\log x_n}\longrightarrow+\infty.
~~~

By (2), F_alpha also has a negative value. Repeating the same argument gives a sequence along which S_alpha tends to minus infinity. That argument works for every positive alpha, since the mean is always negative.

There is also a density consequence under beta GRH. For each sufficiently large fixed alpha, each sign occurs with a fixed positive normalized margin on an interval of fixed logarithmic width in every sufficiently long logarithmic window. Almost-periodicity and continuity supply these intervals. Exponentiating them proves positive lower natural density, for both real x and integer x, and positive lower logarithmic density for each sign set. The full interval-to-density calculation is in [fujii-boundary.md, Section 8](fujii-boundary.md). This corollary uses beta GRH; no unconditional positive-density assertion is inferred from the complementary Landau branch.

This completes the beta-GRH branch. The following complementary branch removes that hypothesis from the oscillation theorem.

### 7.1 The complementary case and the unconditional conclusion

A full proof, including a proof of the positivity theorem used here, is recorded in [the Landau note](fujii-landau.md). The required application is as follows.

Suppose beta GRH fails. The functional equation supplies a nontrivial zero b+i gamma_0 with b>1/2. Fix alpha>0 and 0<=theta<b. We prove that S_alpha(x)/x^theta is eventually bounded neither above nor below.

On Re s>1 put

~~~math
P_\chi(s)=\sum_{p>2}\chi(p)p^{-s},
\qquad
G_\alpha(s)=\frac{\Gamma(s/\alpha)}{\alpha}.
~~~

Absolute convergence and a change of variables give

~~~math
\int_0^\infty S_\alpha(x)x^{-s-1}\,dx
=G_\alpha(s)P_\chi(s).
~~~

For each fixed Y>0, the small-x integral
I_Y(s)=integral_0^Y S_alpha(x)x^(-s-1) dx is entire:
the prime sum decreases like exp(-c_alpha x^(-alpha)) as x tends to zero. Also S_alpha(x)=O_alpha(x) for large x, by comparison with the corresponding sum over positive integers.

The prime-power remainder

~~~math
E_\chi(s)=\sum_{p>2}\sum_{m\ge2}
 \frac{\chi(p)^m}{m p^{ms}}
~~~

is holomorphic on Re s>1/2 by absolute local uniform convergence. In Re s>1, P_chi+E_chi=log beta, with the Euler-product branch. Since beta(sigma)>0 for every positive real sigma, this branch continues along the positive real axis without obstruction.

If either one-sided bound held, then for some C>=0, Y>=1 and epsilon in {1,-1},

~~~math
f(x)=C x^\theta+\epsilon S_\alpha(x)\ge0
\qquad(x\ge Y).
~~~

Its Mellin transform F has abscissa of convergence sigma_c<=1, possibly minus infinity, and in Re s>1 satisfies

~~~math
F(s)=\frac{C Y^{\theta-s}}{s-\theta}
+\epsilon G_\alpha(s)P_\chi(s)-\epsilon I_Y(s).
~~~

Let h=max(1/2,theta), so h<b.

If sigma_c<=h, the integral F is holomorphic on Re s>h. The other displayed terms, including 1/G_alpha, are holomorphic there. Solving for P_chi gives a single-valued holomorphic extension P_tilde to that half-plane. By the identity theorem,

~~~math
\beta(s)=\exp(P_{\rm tilde}(s)+E_\chi(s))
\qquad(\mathop{\mathrm{Re}}s>h).
~~~

This contradicts the zero with real part b>h.

If sigma_c>h, it is finite. Use the local branch of log beta along the positive real axis in the displayed formula for F. It analytically continues F through the real point sigma_c; the possible offset pole at theta lies to the left. This contradicts Landau's theorem that a finite convergence abscissa of the Mellin transform of a nonnegative function is a real singularity.

Both cases are impossible. Therefore, for every alpha>0 and every 0<=theta<b,

~~~math
\limsup_{x\to\infty}\frac{S_\alpha(x)}{x^\theta}=+\infty,
\qquad
\liminf_{x\to\infty}\frac{S_\alpha(x)}{x^\theta}=-\infty.
~~~

Choose theta strictly between 1/2 and b. This gives both signs at a scale larger than sqrt(x)/log x for every positive alpha. Combined with the beta-GRH branch, it proves Section 2 without an RH hypothesis.

The machinery in this subsection is classical: see Suzuki 2025, Proposition 1, and Ford–Konyagin, Lemma 2.1 and its following off-line-zero argument. The adaptation to the prime Dirichlet series is made single-valued by exponentiation; no global logarithm across a beta zero is assumed.

## 8. What is and is not being claimed

- The threshold A is existential. The proof is not a numerical counterexample and does not assert that 20.40443 itself is inadmissible.
- No independence hypothesis on beta zeros is used. Almost periodic recurrence repeats an already attained phase configuration; it does not prescribe independent phases.
- The limit alpha to infinity is taken in distributions to select fixed alpha values. It is not interchanged with the x to infinity asymptotic. Once alpha is selected, (14) and recurrence apply at that fixed alpha.
- This does not contradict the original Chebyshev conjecture, which has alpha=1 and follows from the accepted Dirichlet GRH.
- Zeta RH is needed only for the stronger quantitative error in (8). Section 6.4 removes it from the theorem itself.
- The simultaneous assertion that all S_alpha tend to minus infinity is unconditionally false. The family of equivalences E = [for every alpha, S_alpha tends to minus infinity if and only if beta GRH holds] is a different logical statement. The two proof branches show E if and only if beta GRH is false. Thus E is false under this campaign's accepted beta GRH input. The case split does not itself decide beta GRH.
- No original-priority claim is justified until the original Fujii formulation and the relevant later literature have been checked.

## 9. Prior-art and review log

Searches on 20 November 2026 covered the exact name and title, all-alpha and large-alpha variants, counterexamples and disproofs, almost-periodic smoothing and approximate identities, the cited Suzuki papers, Platt–Trudgian, the comparative-prime-number bibliography, and the older recurrence literature. No prior full disproof was found. This records search coverage, not proof of novelty.

Completed checks:

1. Suzuki 2012 and corrected Suzuki 2025 explicitly state the all-positive-alpha equivalence for the original unweighted prime sum. The bibliography independently agrees.
2. Hardy–Littlewood's original scan was retrieved, and the definition and positive oscillation theorem on printed page 127 were checked against psi_chi in (5).
3. The [Mellin review](fujii-mellin-review.md) checks the cutoff extension, estimate (12), all error integrals, the square contribution, and the normalization.
4. The [convolution review](fujii-review.md) supplies an independent normalization proof under beta GRH alone, checks the logical scope, and records the extended prior-art search.
5. The [distribution and recurrence review](fujii-review-distribution.md) checks the uniform gamma domination, distributional limit, positivity transfer, and recurrence without independence or simplicity of zeros.
6. The [boundary review](fujii-boundary.md) replaces the deep oscillation input with the reflected logarithmic singularity, and proves the stronger direct value F_alpha(0)=(1/2-1/e)log alpha+O(1). Two agents checked the signs, convolution orientation, point-supported ambiguity, and remainder estimates independently.
7. The [Landau note](fujii-landau.md), independently reviewed, completes the non-GRH branch, makes the combined oscillation theorem unconditional, and checks the exact logic of the proposed equivalences.
8. The [Gamma-power note](fujii-gamma-power.md) gives a separate complete equivalence for the second recorded Fujii clause by positive Mellin convolution and Landau's theorem. It is not counted as another named target.
9. The [zero-count proof](fujii-zero-count.md), independently checked in fujii-review.md, Section 11, proves the sharper specified-phase asymptotic with an explicit constant and vanishing remainder.
10. The [prior-art audit](fujii-prior-art.md) traces the general boundary, smoothing, and recurrence mechanism directly to its published predecessors. Suzuki's December 2025 correction was checked and does not alter the conjecture paragraph.

Remaining provenance limit: direct access to Fujii's four-page 1988 text is blocked in the available retrieval paths. The exact all-alpha formulation is therefore supported here by the three later scholarly descriptions. No claim is made that the original text was read.

The result remains documented in the research lane pending a decision on catalogue status. Issue #87 contains the review checkpoints and commits.
