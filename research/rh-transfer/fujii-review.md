# Fujii's conjecture

Independent mathematical review, 20 November 2026. Main proof candidate: [fujii.md](fujii.md). Discussion: [issue #87](https://github.com/1337isnot1337/solved-conjectures/issues/87). Campaign: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

## Review conclusion

The distributional-limit and almost-periodic-recurrence argument survives this independent audit. The passage to the original sum over primes also has a complete proof, given below. This proof uses GRH only for the Dirichlet beta function; the ordinary prime number theorem suffices for the prime-square contribution. RH for the Riemann zeta function is unnecessary for the qualitative conclusion.

The resulting conditional theorem is:

> Assume GRH for the nonprincipal character modulo four. There is a real number A such that, for every fixed alpha>A, the sum S_alpha(x) below has limsup +infinity and liminf -infinity as x tends to infinity.

The negative-subsequence assertion holds for every positive alpha. Neither a numerical value for A nor any linear independence of zeros is used.

This is a review of a proposed argument, not an assertion of publication priority. The original Fujii paper remains inaccessible in the retrieval performed for this review. Three later scholarly sources independently record its all-positive-alpha conjecture. No earlier disproof was located in the searches recorded below, which does not establish novelty.

## 1. Definitions and exact normalization

Let chi be the real primitive character modulo four, and write beta(s)=L(s,chi). Define

~~~math
S_\alpha(x)=\sum_{p>2}\chi(p)e^{-(p/x)^\alpha},
\qquad
\theta_\chi(u)=\sum_{p\le u}\chi(p)\log p,
\qquad
\psi_\chi(u)=\sum_{n\le u}\chi(n)\Lambda(n).
~~~

Zeros rho of beta are counted with multiplicity. Under GRH write rho=1/2+i gamma. For fixed alpha>0 put

~~~math
F_\alpha(t)=
-\frac{\Gamma(1/(2\alpha))}{2\alpha}
-\sum_\rho\frac{\Gamma(\rho/\alpha)}{\alpha}e^{i\gamma t}.
\tag{1}
~~~

The normalization to prove is

~~~math
\frac{\log x}{\sqrt x}\,S_\alpha(x)
=F_\alpha(\log x)+o_\alpha(1).
\tag{2}
~~~

A statement about the logarithmically weighted sum alone does not prove (2). In particular, dividing a pointwise bound for a weighted sum by log x without controlling partial summation is insufficient. Sections 2–5 supply that control directly.

The stronger error O_alpha(1/log x) in the main candidate follows from its quantitative prime-square argument. Only the weaker error in (2) is needed for the sign conclusions.

## 2. The sharp-cutoff distribution and the prime-square term

Define the tempered distribution

~~~math
R(t)=-1-\sum_\rho\frac{e^{i\gamma t}}{\rho}.
\tag{3}
~~~

For every Schwartz test function h the corresponding series of pairings converges absolutely. Indeed, the standard zero count N_beta(T)=O(T log(T+2)) and rapid decay of the Fourier transform imply

~~~math
\sum_\rho \frac{|\widehat h(-\gamma)|}{|\rho|}<\infty.
~~~

The Fourier-transform convention in this note is
hat h(xi)=integral h(v) exp(-i xi v) dv.

For t>0 the odd-character explicit formula gives, as distributions and away from prime-power jumps as ordinary functions,

~~~math
R(t)=-1+e^{-t/2}
\left[
\psi_\chi(e^t)+\frac{\beta'}{\beta}(0)
-\frac12\log\frac{e^t+1}{e^t-1}
\right].
\tag{4}
~~~

The sign of the last term can be checked independently. The trivial zeros of beta occur at -1,-3,-5,..., so their contribution to psi is

~~~math
\sum_{j\ge0}\frac{x^{-2j-1}}{2j+1}
=\frac12\log\frac{x+1}{x-1}.
~~~

The residue at zero is -beta'(0)/beta(0). Rearranging the resulting explicit formula gives (4).

Put

~~~math
H(t)=e^{-t/2}\theta_\chi(e^t),
~~~

with H(t)=0 for t<log 2. GRH gives H(t)=O((1+t)^2) for t>=0. This follows from the usual bound psi_chi(u)=O(sqrt u log^2(u+2)) and the elementary prime-power decomposition.

Since chi(p^2)=1 for every odd prime,

~~~math
\theta_\chi(u)
=\psi_\chi(u)-\theta(\sqrt u)+O(u^{1/3}\log^2(u+2)),
\tag{5}
~~~

where omitting the prime 2 from theta(sqrt u) changes the expression by a bounded term. To bound powers with exponent at least three, sum log p over p<=u^(1/k), then sum over 3<=k<=log_2 u; even the elementary estimate gives the stated error.

The ordinary prime number theorem says theta(sqrt u)/sqrt u tends to one. Therefore (4) and (5) imply

~~~math
H(t)=R(t)+r(t),\qquad r(t)\longrightarrow0
\quad (t\longrightarrow+\infty).
\tag{6}
~~~

This equality is an equality of distributions on t>0, represented there by locally integrable functions. The behavior near t=0 is irrelevant: after multiplying r by a fixed smooth cutoff that is zero near t<=0 and one for t>=2, the remainder in (6) is a tempered distribution supported in a fixed left half-line.

That last observation makes the convolution argument below rigorous without assigning a pointwise value to the undamped zero series.

## 3. A convolution lemma

For a smooth kernel h and t real set

~~~math
B_h(t)=\int_{\mathbb R}H(t+v)h(v)\,dv.
~~~

Suppose h is Schwartz and every derivative of h decreases exponentially as v tends to minus infinity. For the kernels used below it decreases faster than exponentially at plus infinity as well.

Then, as t tends to plus infinity,

~~~math
B_h(t)=
-\int_{\mathbb R}h(v)\,dv
-\sum_\rho\frac{\widehat h(-\gamma)}{\rho}e^{i\gamma t}
+o(1).
\tag{7}
~~~

In particular B_h is bounded for large t.

Proof: pair the distribution R with h(. - t). Formula (3) gives the series in (7), absolutely and uniformly in t, by the zero count and rapid Fourier decay.

For the error in (6), use a fixed smooth cutoff eta that is zero for t<=1 and one for t>=2. The function eta r is bounded and tends to zero at plus infinity. Thus

~~~math
\int (\eta r)(t+v)h(v)\,dv\longrightarrow0
~~~

by dominated convergence.

The remaining distribution T=H-R-eta r is supported in (-infinity,2]. Choose a fixed smooth cutoff equal to one on that half-line and zero on [3,infinity). The action of T on h(. - t) equals its action on this localized test function. All Schwartz seminorms of that test function are bounded by a polynomial in t times exp(-c t), for some c>0, because its support lies to the left of 3 and h and its derivatives decrease exponentially at minus infinity. Continuity of a tempered distribution on Schwartz space now shows that its pairing tends to zero. This proves (7).

The same proof applies to v^m h(v) for every fixed nonnegative integer m. This boundedness of convolved moments is the cancellation needed in partial summation.

## 4. The two kernels

Fix alpha>0 and set

~~~math
g(u)=e^{-u^\alpha},\qquad
k_\alpha(v)=-g'(e^v)e^{3v/2}
=\alpha e^{(\alpha+1/2)v-e^{\alpha v}},
\qquad
j_\alpha(v)=e^{v/2-e^{\alpha v}}.
\tag{8}
~~~

These kernels and all their polynomial multiples satisfy the convolution lemma. Their left tails decrease at the positive rates alpha+1/2 and 1/2, respectively.

A direct substitution u=e^(alpha v) gives

~~~math
\int_{\mathbb R}k_\alpha(v)e^{i\gamma v}\,dv
=\Gamma(1+\rho/\alpha),
\qquad
\int_{\mathbb R}k_\alpha(v)\,dv
=\Gamma(1+1/(2\alpha)).
\tag{9}
~~~

Inserting (9) into (7), and using Gamma(1+z)=z Gamma(z), proves

~~~math
B_{k_\alpha}(t)=F_\alpha(t)+o(1).
\tag{10}
~~~

Also, for every fixed m>=0,

~~~math
B_{v^m k_\alpha}(t)=O_{\alpha,m}(1),
\qquad
B_{v^m j_\alpha}(t)=O_{\alpha,m}(1).
\tag{11}
~~~

No bound on a numerically truncated zero sum is being used. Schwartz decay justifies the full zero sums.

## 5. Exact partial summation and its remainder

Write x=e^t. Stieltjes integration by parts gives

~~~math
S_\alpha(e^t)
=\int_{2^-}^{\infty}\frac{g(u/e^t)}{\log u}\,d\theta_\chi(u).
~~~

The lower boundary term is zero because theta_chi(2^-)=0. The upper boundary term vanishes by the decay of g. Differentiate the weight, then substitute u=e^(t+v). The exact identity is

~~~math
t e^{-t/2}S_\alpha(e^t)
=
\int_{\log2-t}^{\infty}
 H(t+v)k_\alpha(v)\frac{t}{t+v}\,dv
+
\int_{\log2-t}^{\infty}
 H(t+v)j_\alpha(v)\frac{t}{(t+v)^2}\,dv.
\tag{12}
~~~

Both signs in (12) are positive: the derivative of g is negative, and differentiating 1/log u gives the second positive term after integration by parts.

On |v|<=t/2,

~~~math
\frac{t}{t+v}
=1-\frac vt+\frac{v^2}{t^2}
+O\!\left(\frac{|v|^3}{t^3}\right),
\tag{13}
~~~

and

~~~math
\frac{t}{(t+v)^2}
=\frac1t-\frac{2v}{t^2}
+O\!\left(\frac{v^2}{t^3}\right).
\tag{14}
~~~

Here H(t+v)=O(t^2). Since the kernels have finite absolute moments of every order, the integrated remainder in each display is O_alpha(1/t).

The negative tails v<-t/2 in (12) are exponentially small times a polynomial in t: on the actual integration domain t+v>=log2, so the rational factors in (12) are at most O(t), while H(t+v)=O(t^2). The positive tails v>t/2 are smaller still by the superexponential decay in (8). The same estimates allow every central moment integral in (13)–(14) to be extended to the full real line.

Using (11) in the integrated expansions therefore gives

~~~math
t e^{-t/2}S_\alpha(e^t)
=B_{k_\alpha}(t)+O_\alpha(1/t).
\tag{15}
~~~

Combining (15) with (10) proves (2). The bounds on B_{v k} and B_{v^2 k} are essential here: using only the crude estimate H=O(t^2) in the first-order term would not give a vanishing error.

All limits in this section keep alpha fixed.

## 6. Distributional convergence in alpha

For each fixed alpha, Stirling's estimate makes the zero series in (1) absolutely and uniformly convergent. Thus F_alpha is real, continuous, and Bohr almost periodic.

For alpha>=1,

~~~math
\left|\frac{\Gamma(\rho/\alpha)}{\alpha}\right|
=\frac{|\Gamma(1+\rho/\alpha)|}{|\rho|}
\le\frac{\Gamma(1+1/(2\alpha))}{|\rho|}
\le\frac C{|\rho|}.
\tag{16}
~~~

The first inequality follows directly from the Euler integral for Gamma. The bound is independent of alpha and gamma. Each coefficient tends to 1/rho as alpha tends to infinity; the constant in (1) tends to -1. For every compactly supported smooth test function phi, Fourier decay and the zero count give a summable majorant using (16). Hence

~~~math
F_\alpha\longrightarrow R
\quad\hbox{in }\mathcal D'(\mathbb R).
\tag{17}
~~~

No uniform convergence in t is asserted as alpha tends to infinity. No interchange of the alpha limit with x tending to infinity occurs.

## 7. A positive interval and recurrence

The classical Hardy–Littlewood result gives

~~~math
\psi_\chi(x)=
\Omega_+\!\left(\sqrt x\log\log\log x\right).
\tag{18}
~~~

The corresponding negative result is also known, but is not needed for the positive step. Formula (4) and (18) imply that R has a positive value at some sufficiently large t. It has a positive value on an open interval avoiding prime-power jumps, since the step part is constant between jumps and all other factors are continuous. If an oscillation point lies at a jump, one may use a sufficiently close point on a side with the same positive sign.

Choose a nonnegative, nonzero smooth compactly supported phi in that interval. Then

~~~math
\langle R,\phi\rangle>0.
~~~

By (17), there is A such that, for every alpha>A,

~~~math
\int F_\alpha(t)\phi(t)\,dt>0.
~~~

Therefore F_alpha has a positive value for every such fixed alpha.

A continuous Bohr almost-periodic function with a positive value repeats a positive value, bounded away from zero, at arbitrarily large positive translates. This follows from the relative density of its sufficiently small uniform almost periods. Applying (2) along those translates gives a sequence x_n tending to infinity and a constant c_alpha>0 such that

~~~math
S_\alpha(x_n)\ge c_\alpha\frac{\sqrt{x_n}}{\log x_n}
\longrightarrow+\infty.
~~~

For the negative subsequence, beta(1/2)>0: its paired alternating series has strictly positive terms. Thus there is no zero with gamma=0. Uniform convergence in (1) gives the Bohr mean

~~~math
\mathcal M(F_\alpha)=
-\frac{\Gamma(1/(2\alpha))}{2\alpha}<0.
~~~

Consequently F_alpha has a negative value, which almost periodicity repeats at arbitrarily large translates. Formula (2) then gives liminf S_alpha=-infinity. This part holds for every alpha>0.

This proves the conditional theorem in the review conclusion.

## 8. Scope and logical audit

The target recorded by the later sources is an equivalence for each positive alpha between the negative-limit statement and GRH for beta. Under the accepted beta GRH input, the theorem above contradicts that equivalence for every sufficiently large fixed alpha.

The following distinctions matter.

- A finite sign change in S_alpha would not refute a limit at infinity. Recurrence supplies an infinite sequence tending to infinity.
- Allowing alpha to vary with x would not refute a conjecture for each fixed alpha. The test pairing first selects every alpha beyond a fixed threshold; recurrence then keeps that alpha fixed.
- A positive point of the unsmoothed prime race alone would not guarantee a positive normalized limiting zero sum. Equation (4) and the unbounded normalized oscillation (18) supply exactly that positivity.
- Arbitrary phase alignment is unnecessary. The proof repeats a phase configuration already attained by the actual zero series.
- A failure of an absolute-value bound for the zero sum would not disprove the conjecture. The argument produces an actual positive value through a nonnegative test pairing.
- This is a disproof under beta GRH, which is an accepted input of the campaign. Without that accepted input, it is a conditional theorem. The argument by itself does not prove beta GRH.
- The simultaneous assertion that all the negative-limit statements hold is logically stronger in a different way: its alpha=1 instance implies beta GRH by the classical equivalence, after which the present theorem gives a contradiction. One may therefore refute that simultaneous assertion by cases. This observation must not be substituted silently for the original all-alpha family of equivalences.

The original Chebyshev assertion has alpha=1 and is unaffected.

## 9. Primary-source checks and prior-art log

The following scholarly sources were opened and read for this review.

1. **Masatoshi Suzuki, 2011/2012.** [On monotonicity of certain weighted summatory functions associated with L-functions](https://arxiv.org/pdf/1204.1823), introduction, printed page 2. It explicitly states that Fujii conjectured the equivalence for all positive alpha. The new theorems in that paper concern other weighted arithmetic functions, so they do not resolve the exponential-power family considered here.
2. **Dave Platt and Tim Trudgian, 2018/2019.** [Fujii's development on Chebyshev's conjecture](https://arxiv.org/pdf/1802.00089), Theorem 1 and end of Section 3; published DOI [10.1142/S1793042119500337](https://doi.org/10.1142/S1793042119500337). This proves the equivalence for 0<alpha<20.40442. The next quoted numerical threshold only marks failure of their absolute-value argument. It is not a known counterexample.
3. **Masatoshi Suzuki, 2025.** [On variants of Chebyshev's conjecture](https://link.springer.com/article/10.1007/s11139-025-01238-9), Section 1.2 after equations (16)–(17). It explicitly attributes the all-positive-alpha conjecture to Fujii. The [published correction](https://doi.org/10.1007/s11139-025-01289-y) concerns other displayed weights and does not withdraw this attribution.
4. **Greg Martin et al., 2025.** [An annotated bibliography for comparative prime number theory](https://arxiv.org/pdf/2309.08729v3), entry 192. This separately records the all-alpha assertion and another conjecture involving Gamma-power Mellin weights. This review concerns the former only. The bibliography also records the Hardy–Littlewood oscillation result.
5. **Hardy and Littlewood.** [Contributions to the theory of the Riemann zeta-function and the theory of the distribution of primes](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/5282-11511_2006_Article_BF02422942.pdf), Section 5, printed page 127. Root independently retrieved the original scan and checked that its psi_1 is exactly the character-weighted von Mangoldt sum used in (18); this review's web fetch rejected the server's application/octet-stream content type. The direct scan check and the bibliography corroboration are distinguished here.

The original source is **Akio Fujii**, *Some generalizations of Chebyshev's conjecture*, Proceedings of the Japan Academy, Series A **64** (1988), 260–263, MR974088, [publisher identifier](https://projecteuclid.org/euclid.pja/1195513180). The publisher's legacy and modern full/PDF endpoints returned an anti-bot page or retrieval failure. The all-alpha wording is consequently corroborated by later scholarly accounts, not yet directly checked against the original four-page paper.

Searches on 20 November 2026 covered the exact title, named conjecture, all-alpha and large-alpha variants, disproof and counterexample terms, almost-periodic smoothing, the citing Suzuki papers, the Platt–Trudgian paper, and the comparative-prime-number bibliography. No prior full disproof was found. Unrelated results involving Fujii–Kasami–Ninomiya or the Fujii–Wilson constant were excluded.

The main candidate's Section 6 provides a separate smooth-cutoff Mellin proof of the normalization. The convolution proof here is independent of that estimate, and weakens its hypotheses from beta GRH plus zeta RH to beta GRH alone.


## 10. Broader recurrence literature and additional novelty screen

The recurrence mechanism used above is classical. The following additional checks distinguish that background from the proposed application.

- **Ford and Konyagin, 2002:** [Chebyshev's conjecture and the prime number race](https://ford126.web.illinois.edu/wwwpapers/racefk.pdf), Sections 3–4, especially printed pages 12–13, describes Bohr almost periodicity of damped zero sums, Stepanov almost periodicity of their boundary values, and recurrence of an ordering that occurs at a finite argument. It credits Kaczorowski's work. Its exposition contains no exponential-power family or Fujii all-alpha conclusion.
- **Kaczorowski and Ramaré, 2003:** [Almost periodicity of some error terms in prime number theory](https://www.impan.pl/shop/publication/transaction/download/product/82202), Acta Arithmetica 106, 277–297, DOI [10.4064/aa106-3-6](https://doi.org/10.4064/aa106-3-6). Theorem 1 and its proof show that the relevant damped zero sums approach prime-error boundary functions in Stepanov L2. Theorems 2–4 concern recurrence and weighted densities. The full paper does not mention Fujii or state the large-alpha exponential-power conclusion. This is relevant antecedent machinery, not evidence that the particular target has already been settled.
- **Granville and Martin, 2004/2006:** [Prime number races](https://arxiv.org/pdf/math/0408319) discusses prime-race distributions and sign changes. No Fujii reference was found in its searchable text.
- **Hamieh, Kadiri, Martin, and Ng, 2024:** [Comparative prime number theory problem list](https://arxiv.org/pdf/2407.03530) was checked as a recent specialist problem list. It does not supply a resolution of this smoothing conjecture.
- **A public 2026 computational draft:** [weighted-prime-races/paper/analytic-prime-sum.tex](https://github.com/raghavs1729/weighted-prime-races/blob/main/paper/analytic-prime-sum.tex) surfaced in broad searches for smoothed prime races. The read text concerns Gaussian cutoffs and finite computations of weighted prime sums. It explicitly labels its numerical error bounds heuristic. It contains no Fujii assertion or large-alpha sign theorem and is not used as a mathematical input.

Additional exact and broad searches included “Fujii Chebyshev almost periodic”, “Fujii Chebyshev disproved”, “Fujii Chebyshev large alpha conjecture”, “prime number race approximate identity”, “prime number races smooth sign changes”, and recent-year searches for “Fujii's conjecture” with prime and counterexample terms. The search results mainly returned the bounded-alpha Platt–Trudgian theorem, Suzuki's two accounts, and the specialist bibliography. No earlier full disproof was located.

The bibliography contains typographical defects in some unrelated displayed summaries, including the displayed variables in its entry for Platt–Trudgian. Its description of the target is therefore not the sole basis for attribution: Suzuki's independent 2011 and corrected 2025 descriptions were read and agree on the weight exp(-(p/x)^alpha), the unweighted prime sum, and the proposed extension to every positive alpha. None of these checks substitutes for directly reading Fujii's original paper.

The mathematically new claim being reviewed is the application of this established explicit-formula and recurrence machinery to refute the all-alpha family under beta GRH. Originality of almost-periodic recurrence itself is not claimed.


## 11. Independent audit of the zero-count proof

The separate note [fujii-zero-count.md](fujii-zero-count.md), initially committed as 3538288b789cf667a470f1e77444ce7108d3e655, gives a shorter positive-phase proof and an explicit constant:

~~~math
F_\alpha(0)=
\left(\frac12-\frac1{\mathrm e}\right)\log\alpha+C_\beta
+O\!\left(\frac{\log(\alpha+2)}{\alpha}\right).
\tag{19}
~~~

This section independently checks its new steps. It is an audit of that proof, not a new named result.

### Pairing and the pole term

Put ε=1/(2α) and g(z)=Γ(z)−1/z. For each positive ordinate γ, counted with multiplicity,

~~~math
\frac{\Gamma((1/2+i\gamma)/\alpha)}{\alpha}
+\frac{\Gamma((1/2-i\gamma)/\alpha)}{\alpha}
=
\frac1{1/4+\gamma^2}
+\frac2\alpha\operatorname{Re}g(\varepsilon+i\gamma/\alpha).
\tag{20}
~~~

The coefficient of the rational term is exactly one. Indeed,
1/(1/2+iγ)+1/(1/2−iγ)=1/(1/4+γ²).
There is no central zero to add because β(1/2)>0. No absolutely convergent unpaired sum of 1/ρ is assumed.

### Uniform estimates

The function g is holomorphic at zero. It and its first derivatives are bounded on 0≤Re z≤1/2, 0≤Im z≤1.

For u≥1, fixed-strip Stirling estimates and

~~~math
\operatorname{Re}\frac1{\varepsilon+iu}
=\frac{\varepsilon}{\varepsilon^2+u^2}
~~~

give, uniformly for 0≤ε≤1/2,

~~~math
\begin{aligned}
|\operatorname{Re}g(\varepsilon+iu)|
&\ll u^{-2}+e^{-cu},\\
|\partial_\varepsilon\operatorname{Re}g(\varepsilon+iu)|
&\ll u^{-2}+e^{-cu},\\
|\partial_u\operatorname{Re}g(\varepsilon+iu)|
&\ll u^{-3}+e^{-cu}.
\end{aligned}
\tag{21}
~~~

The last estimate uses the real part: the u derivative of the rational real part is −2εu/(ε²+u²)². A bound on the full complex derivative would lose this additional power, although it would still suffice after suitable integration. Near zero, cancellation is performed inside g before differentiating. This avoids a false nonuniform estimate for the pole and gamma terms separately.

These estimates make the u integrals with weights 1+|log u| and log(u+2) uniformly finite, as needed in the proof.

### Counting convention and Stieltjes remainder

Bennett, Martin, O'Bryant and Rechnitzer, [Counting zeros of Dirichlet L-functions](https://personal.math.ubc.ca/~bennett/BeMaObRe-MathComp-2021.pdf), Math. Comp. 90 (2021), 1455–1482, explicitly count both positive and negative ordinates, with multiplicity. For the real primitive character of conductor four, dividing their leading term by two gives

~~~math
N_+(T)=\frac{T}{2\pi}\log\frac{2T}{\pi\mathrm e}
+O(\log(T+2)).
\tag{22}
~~~

This source and its convention were independently opened and checked. Their fixed parity constant can be included in the remainder.

Write N_+=M+E, with M(0)=E(0)=0, and put
fα(T)=(2/α)Re g(ε+iT/α).
At zero, E(T) tends to zero: there is a zero-free neighborhood of the nonzero value β(1/2), and M(T) tends to zero. At infinity, E(T)fα(T) tends to zero by the T^−2 bound. Integration by parts therefore gives no boundary contribution.

With T=αu, the error is bounded by

~~~math
\begin{aligned}
\left|\int_0^\infty E(T)f_\alpha'(T)\,dT\right|
&\ll\frac1\alpha
  \int_0^\infty\log(\alpha u+2)
  \left|\partial_u\operatorname{Re}g(\varepsilon+iu)\right|du\\
&\ll\frac{\log(\alpha+2)}{\alpha}.
\end{aligned}
\tag{23}
~~~

The main integral has factor 1/π, since the pair factor 2 in fα cancels the 2π in M′. This checks the possible factor-of-two ambiguity independently.

### Fourier sign and the constant

For ε>0, gamma is the Fourier transform, with positive exponential convention, of the integrable function exp(εv−exp v). Fourier inversion at v=0 gives

~~~math
\int_0^\infty\operatorname{Re}\Gamma(\varepsilon+iu)\,du
=\frac{\pi}{\mathrm e}.
~~~

Subtracting the pole integral π/2 yields the exact identity

~~~math
\int_0^\infty\operatorname{Re}g(\varepsilon+iu)\,du
=\pi\left(\frac1{\mathrm e}-\frac12\right).
\tag{24}
~~~

This is negative. The zero sum occurs with a minus sign in Fα, so the coefficient of log α in (19) is positive.

The ε derivative bound in (21), including its integrable logarithmic weight, justifies replacing Re g(ε+iu) by Re Γ(iu) in the remaining logarithmic moment at cost O(ε). Finally, Γ(1/(2α))/(2α)=1+O(1/α). The resulting constant is exactly

~~~math
C_\beta=
-1-\sum_{\gamma>0}\frac1{1/4+\gamma^2}
-\frac1\pi\int_0^\infty
  \operatorname{Re}\Gamma(iu)\log\frac{2u}{\pi}\,du.
\tag{25}
~~~

All terms converge absolutely. Near u=0, Re Γ(iu) tends to minus Euler's constant; at infinity it decreases exponentially.

Audit conclusion: no correction was found in the new zero-count argument. It independently proves positivity of Fα(0) for all sufficiently large fixed α, with the stated error. The beta-GRH prime normalization in Sections 2–5 and the recurrence step remain necessary to obtain conclusions about Sα(x) as x tends to infinity. The separate [Landau argument](fujii-landau.md) handles failure of beta GRH and must not be conflated with the GRH-only density corollary in [fujii-boundary.md](fujii-boundary.md).
