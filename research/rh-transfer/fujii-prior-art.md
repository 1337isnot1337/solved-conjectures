# Fujii's conjecture

Prior-art audit, 20 November 2026. Coordination: [issue #87](https://github.com/1337isnot1337/solved-conjectures/issues/87). Mathematical arguments: [main note](fujii.md), [boundary and direct-value proof](fujii-boundary.md), [normalization](fujii-review.md), and [Landau complement](fujii-landau.md).

## Finding

The boundary-value, smoothing, and almost-periodic recurrence mechanism is established prior art. Kaczorowski's papers from the early 1990s and Kaczorowski–Ramaré (2003) supply the relevant general framework. The beta-GRH part of the present large-exponent result follows by a short specialization of that framework to the explicit kernel below.

No retrieved primary paper explicitly states the resulting all-sufficiently-large-exponent oscillation theorem for Fujii's weights, or the specified-phase asymptotic with coefficient 1/2−1/e. This is a search result. It does not establish priority. The possible contribution is at most identifying and proving this smoothing corollary and its application to the reported conjecture. No new general oscillation principle is claimed.

The original 1988 article remains unread. Later scholarly descriptions agree on the all-positive-exponent formulation, including Suzuki's updated 2025 article. This audit does not remove that provenance limitation.

## Exact statements being compared

Write chi for the nonprincipal real character modulo four and beta(s)=L(s,chi). The prime sum is

~~~math
S_\alpha(x)=\sum_{p>2}\chi(p)e^{-(p/x)^\alpha}.
~~~

The result under investigation is that there exists A such that, for every fixed real alpha>A,

~~~math
S_\alpha(x)=\Omega_\pm\!\left(\frac{\sqrt{x}}{\log x}\right)
\qquad(x\longrightarrow\infty).
~~~

The argument assuming beta GRH uses the continuous almost-periodic function

~~~math
F_\alpha(t)=
-\Gamma\!\left(1+\frac1{2\alpha}\right)
-\sum_{\rho=1/2+i\gamma}
 \frac{\Gamma(\rho/\alpha)}{\alpha}e^{i\gamma t},
~~~

and the stronger specified-phase calculation is

~~~math
F_\alpha(0)=
\left(\frac12-\frac1e\right)\log\alpha+O(1).
~~~

Zeros are counted with multiplicity. No linear independence or simplicity hypothesis is imposed. The separate Landau argument treats failure of beta GRH. Its combination with the GRH branch makes the large-exponent oscillation theorem unconditional; the logical distinction between that theorem and the conjectured family of biconditionals remains as explained in fujii-landau.md.

## Primary-source comparison

| Source inspected | Relevant result | Relation to this audit |
|---|---|---|
| [Kaczorowski–Ramaré, *Almost periodicity of some error terms in prime number theory*, Acta Arith. 106 (2003), 277–297](https://ramare-olivier.github.io/Maths/kaczo.pdf), Theorem 1(d),(e), printed pp. 281–282 | Explicit boundary formulas on both real half-lines; under GRH, the normalized boundary function is Stepanov L² almost periodic. | Supplies the general framework. Theorems 2–4 concern densities of threshold sets, rather than Fujii's prime-sum weights. |
| [Kaczorowski, *The boundary values of generalized Dirichlet series and a problem of Chebyshev*, Astérisque 209 (1992), 227–235](https://www.numdam.org/article/AST_1992__209__227_0.pdf), Theorem 2 and its proof | Uses compact smoothing, Bohr recurrence, and local L² control to obtain recurring boundary inequalities. | Smoothing followed by recurrence is already explicit. Corollary 2 concerns unsmoothed prime races; no Fujii exponent family is stated. |
| [Kaczorowski, *A contribution to the Shanks–Rényi race problem*, Q. J. Math. 44 (1993), 451–458](https://personal.math.ubc.ca/~gerg/teaching/592-Fall2018/papers/1993.Kaczorowski.pdf), Lemmas 2–3 | A logarithmic expansion near the origin, followed by recurrence of a boundary vector value on sets of positive measure. | The local-value-to-later-oscillation strategy is prior art. Its stated application is the race involving residue class 1. |
| [Ford–Konyagin, *Chebyshev's conjecture and the prime number race* (2002)](https://ford126.web.illinois.edu/wwwpapers/racefk.pdf), §§2 and 4 | Explains Landau's positivity principle and Kaczorowski's near-origin boundary/recurrence method. | Explicitly discusses the old mechanism. Its main results concern ordinary prime-counting races; it does not state an all-large-alpha Fujii result. |
| [Ford–Konyagin, *The prime number race and zeros of L-functions off the critical line*, Duke Math. J. 113 (2002), 313–330](https://personal.math.ubc.ca/~gerg/teaching/592-Fall2018/papers/2002.Ford_1.pdf), Theorem 1.1 and Lemma 1.2 | Off-critical-line zero configurations can obstruct orderings in races with three residue classes. | This is a different statement from the two-class exponentially weighted oscillation examined here. |
| [Platt–Trudgian, *Fujii's development on Chebyshev's conjecture*, Int. J. Number Theory 15 (2019), 639–644](https://arxiv.org/pdf/1802.00089), Theorem 1 and end of §3 | Proves the equivalence for 0<alpha<20.40442; its absolute-value method fails at 20.40443. | Failure of that estimate is not a disproof. The paper does not give the all-large-exponent conclusion. |
| [Suzuki, *On variants of Chebyshev's conjecture*, Ramanujan J. 68, 95 (2025)](https://link.springer.com/article/10.1007/s11139-025-01238-9), §1.2 after (16)–(17) | Attributes the all-positive-exponent conjecture to Fujii and cites the bounded-exponent improvement. | This explicit description remains in the updated article. |
| [Suzuki, correction, published 19 December 2025](https://link.springer.com/article/10.1007/s11139-025-01289-y) | Corrects production errors in a weighted function, equations (29), (30), (63), and wording around Theorem 8. | The correction does not alter the Fujii conjecture paragraph. |

The unweighted prime-sum normalization is proved in fujii-review.md. This audit does not adopt the missing-logarithm normalization printed in §2 of the Platt–Trudgian preprint.

## The short specialization that matters for priority

Under beta GRH let

~~~math
R(t)=-1-\sum_\rho\frac{e^{i\gamma t}}{\rho}.
~~~

Kaczorowski–Ramaré's normalized boundary function for beta is -1−R. For the gamma factor Gamma((s+1)/2), their trivial-zero kernel is

~~~math
k(t,\gamma_\beta)=\frac{e^{-t}}{1-e^{-2t}}.
~~~

Their two boundary formulas therefore give, as t decreases to zero through positive values,

~~~math
R(t)=-\frac12\log(1/t)+O(1),
\qquad
R(-t)=\frac12\log(1/t)+O(1).
~~~

The function R is Stepanov L² almost periodic. These facts are available from their published theorem; they are not new assertions of this campaign.

The remaining kernel calculation is as follows. Put

~~~math
k_\alpha(v)=\alpha
 \exp\!\left((\alpha+\tfrac12)v-e^{\alpha v}\right).
~~~

Changing variables u=exp(alpha*v) gives

~~~math
\int_{\mathbb R} k_\alpha(v)e^{i\gamma v}\,dv
=\Gamma\!\left(1+\frac{1/2+i\gamma}{\alpha}\right),
\qquad
\int_{\mathbb R}k_\alpha(v)\,dv
=\Gamma\!\left(1+\frac1{2\alpha}\right).
~~~

Consequently the convolution, with the stated orientation, is

~~~math
F_\alpha(t)=\int_{\mathbb R}R(t+v)k_\alpha(v)\,dv.
~~~

This identity holds in distributions and as an ordinary convolution of the boundary representative. The kernel decays at both ends and is an approximate identity as alpha tends to infinity.

For completeness, the relevant continuity estimate is

~~~math
\|f*k\|_\infty\le
\|f\|_{S^2}
\sum_{j\in\mathbb Z}\|k\|_{L^2([j,j+1])}.
~~~

It follows by Cauchy–Schwarz on unit intervals. Approximating an S²-almost-periodic function by trigonometric polynomials shows that convolution with this kernel is Bohr almost periodic. It also controls the remote tails in the approximate-identity argument.

Choose one negative continuity point t0 sufficiently close to zero so that R(t0)>0. The convolution tends to R(t0), so F_alpha(t0)>0 for every sufficiently large alpha. Fix any such alpha. Bohr recurrence gives positive values arbitrarily far to the right; its negative mean gives recurring negative values. The normalization

~~~math
\frac{\log x}{\sqrt{x}}S_\alpha(x)
=F_\alpha(\log x)+o_\alpha(1)
~~~

then gives both oscillations.

This explicitly shows how a published general theorem already supplies almost all of the GRH-branch argument. The exponent limit is used at one fixed continuity point before alpha is fixed; the later limit in x uses recurrence. There is no unsupported exchange of the two limits.

The stronger calculation at t=0 uses the asymmetry of the same kernel. After w=alpha*v its limiting density is exp(w−exp(w)), with masses 1−1/e on the negative half-line and 1/e on the positive half-line. Combining those masses with the opposite logarithmic singularities gives the coefficient 1/2−1/e. The complete remainder and distributional checks are in fujii-boundary.md. No earlier explicit statement of this coefficient was found.

## Search scope and limits

This pass followed the citations from Ford–Konyagin to Kaczorowski's boundary papers and to Kaczorowski–Ramaré, and compared their theorem statements and proofs with the precise fixed-alpha conclusion. Searches used both indexes with combinations of Fujii, Chebyshev, smoothed prime race, exponential weights, large alpha, sign changes, almost periodicity, boundary values, counterexample, 20.40442, log alpha, and 1/e.

The following distinctions were retained.

- A theorem about weighted densities of sign sets is not automatically a theorem about weighted prime sums.
- A smoothing width chosen as a function of x does not establish oscillation for one fixed alpha.
- Recurrence arguments requiring independent zero ordinates cannot silently be used under GRH alone.
- A failed sufficient estimate does not prove that the original assertion fails.
- The existence of old general machinery does not by itself prove that the particular corollary has previously been stated. It does prevent claiming that machinery as a new method.

Kaczorowski's 1991 *k-functions IV* PDF was located, but its text was not readable through the available retrieval. The 1995 *On the distribution of primes (mod 4)* publisher page exposed metadata, not the full text. No claim is made to have checked those complete papers. The 1992 and 1993 papers were readable and directly establish the older smoothing and recurrence mechanism. The original Fujii 1988 retrieval failures are recorded in fujii-review-distribution.md and were not repeated here.

**Priority status: unclaimed.** The record supports an explicit mathematical deduction and a narrower application claim. It does not support certifying that the deduction has never appeared, or that the full named conjecture was previously untouched.
