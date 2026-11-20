# Lindelöf hypothesis and Dirichlet-GRH applications

Research checkpoint: 20 November 2026. Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

## Status and attribution

**The Lindelöf hypothesis follows completely from the RH input accepted for this campaign. The implication is classical. This note does not claim an original solution, a new implication, or an independent proof of RH.**

The input is precisely the right-half-plane nonvanishing assertion for every Dirichlet character in [Statements.lean at the inspected commit](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Statements.lean). Reading that statement is source-scope analysis; no Lean verification is performed here.

For this note, write **DGRH** for that accepted input together with the usual analytic theory of Dirichlet L-functions. It says that a nonprincipal Dirichlet L-function has no zero with real part greater than one-half. For the principal character, the pole at one is excluded. It includes classical RH through the character of conductor one.

The classical implication predates this campaign by a century. [Florea's survey, §1](https://arxiv.org/abs/2509.20335), published in the 2026 JLMS centenary issue, records RH implying Lindelöf and Littlewood's stronger subpower bound. [Chandee, Corollary 1.1 and §2](https://arxiv.org/abs/0906.4177) gives explicit GRH bounds for L-functions and their analytic conductor. Our purpose is to state the exact consequence, supply a derivation with all conductor and character cases accounted for, and separate it from conjectures requiring additional inputs.

## Exact consequence

For every positive real epsilon, there is a constant depending only on epsilon such that, for every modulus q at least one, every Dirichlet character chi modulo q, and every real t,

~~~math
|L(1/2+it,\chi)|\ll_\varepsilon
       \bigl(q(2+|t|)\bigr)^\varepsilon.
~~~

For q equal to one this is the full classical **Lindelöf hypothesis**:

~~~math
|\zeta(1/2+it)|\ll_\varepsilon (2+|t|)^\varepsilon.
~~~

The first assertion is the conductor-and-height uniform Dirichlet version. It does not assert generalized Lindelöf for arbitrary automorphic L-functions or arbitrary number fields.

## Complete derivation

We use three standard results of complex analysis: Borel–Carathéodory, Hadamard's three-circles theorem, and the strip-convexity form of Phragmén–Lindelöf. We also use the classical Dirichlet functional equation and Stirling's formula. These are proved theorems, not additional number-theoretic conjectures. The classical route through these complex-analysis tools is also identified explicitly in [Ono–Soundararajan, introductory discussion on printed p.419](https://uva.theopenscholar.com/files/ken-ono/files/025.pdf).

### 1. A uniform polynomial bound

Suppose first that chi is primitive and nonprincipal. Put

~~~math
S_\chi(x)=\sum_{n\le x}\chi(n).
~~~

Periodicity and the vanishing of a complete nonprincipal character sum give

~~~math
|S_\chi(x)|\le q.
~~~

Partial summation continues the Dirichlet series to the half-plane of positive real part and gives, for s with real part sigma positive,

~~~math
L(s,\chi)=s\int_1^\infty S_\chi(x)x^{-s-1}\,dx,
\qquad
|L(s,\chi)|\le \frac{q|s|}{\sigma}.
~~~

In particular, on each fixed-width strip bounded away from real part zero, L has polynomial growth uniformly in the character and conductor.

Fix a real number delta between zero and one-quarter, let c equal 2+it, and put Q equal to q(2+|t|). Throughout a disc centered at c of radius less than three-halves, this polynomial bound gives

~~~math
\log |L(s,\chi)|\le C_\delta+\log Q.
~~~

### 2. A logarithm with a sublinear power of log Q

DGRH makes L nonvanishing on the simply connected half-plane with real part greater than one-half. Consequently it has a holomorphic logarithm g there, uniquely normalized to agree with its Euler-product logarithm in the half-plane of absolute convergence.

For real part at least three-halves, the Euler product gives the absolute, conductor-independent bound

~~~math
|g(s)|\le
\sum_p\sum_{m\ge1}\frac{1}{m p^{3m/2}}
=\log\zeta(3/2).
~~~

Define four radii

~~~math
r_0=\frac12,\qquad
\rho=\frac32-\delta,\qquad
r=\frac32-\frac{\delta}{2},\qquad
R=\frac32-\frac{\delta}{4}.
~~~

They satisfy r_0 less than rho less than r less than R. The closed R-disc lies in the zero-free half-plane. Borel–Carathéodory applied to g, using the polynomial bound for its real part and the bounded value at c, gives

~~~math
\max_{|s-c|\le r}|g(s)|\ll_\delta \log Q.
~~~

The r_0-disc lies in the absolute-convergence half-plane, so its maximum is bounded by an absolute constant. Apply Hadamard's three-circles theorem **to g**, with these two circles and the intermediate rho-circle. We obtain

~~~math
\max_{|s-c|\le\rho}|g(s)|
 \ll_\delta (\log Q)^{\theta_\delta},
\qquad
\theta_\delta=
\frac{\log(\rho/r_0)}{\log(r/r_0)}
\in(0,1).
~~~

The point one-half plus delta plus it lies on that intermediate circle. Therefore

~~~math
\log |L(1/2+\delta+it,\chi)|
\ll_\delta (\log Q)^{\theta_\delta}.
~~~

For every positive eta, a power of log Q with exponent strictly below one is at most eta times log Q, apart from a bounded initial range. Exponentiating yields

~~~math
|L(1/2+\delta+it,\chi)|
\ll_{\delta,\eta} Q^\eta.
~~~

This step is where zero-free continuation is used. A polynomial bound for L alone would not yield a subpower bound.

### 3. Move to the critical line

Write a equal to zero or one according to the parity of chi. Its completed L-function is

~~~math
\Lambda(s,\chi)=
(q/\pi)^{(s+a)/2}\Gamma((s+a)/2)L(s,\chi),
\qquad
\Lambda(s,\chi)=\epsilon_\chi
               \Lambda(1-s,\overline\chi),
\quad |\epsilon_\chi|=1.
~~~

The preceding estimate also holds for the conjugate character. Stirling's formula, with the bounded-height range supplied by continuity of the gamma ratio, gives

~~~math
|L(1/2-\delta+it,\chi)|
\ll_\delta
\bigl(q(2+|t|)\bigr)^\delta
|L(1/2+\delta-it,\overline\chi)|.
~~~

Both gamma arguments have positive real part, so no gamma pole occurs in this comparison. Thus the left boundary of the strip has exponent delta plus eta and its right boundary has exponent eta:

~~~math
|L(1/2-\delta+it,\chi)|\ll_{\delta,\eta}Q^{\delta+\eta},
\qquad
|L(1/2+\delta+it,\chi)|\ll_{\delta,\eta}Q^\eta.
~~~

Phragmén–Lindelöf in this strip, in its standard polynomial-weight convexity form, interpolates these exponents. The polynomial growth established in Step 1 supplies its growth hypothesis. At the midpoint,

~~~math
|L(1/2+it,\chi)|\ll_{\delta,\eta}
Q^{\delta/2+\eta}.
~~~

The constants are uniform in q and chi: the boundary constants above were uniform, the strip width depends only on delta, and q is a fixed positive parameter when applying the strip theorem. Given epsilon, choose delta positive and smaller than both one-quarter and epsilon, then choose eta smaller than epsilon minus delta/2. This proves the asserted primitive nonprincipal bound.

### 4. The principal primitive character

The only primitive principal character has conductor one and L-function zeta. Its pole at one prevents using a logarithm on the entire right half-plane.

For absolute t at least four, the same discs as in Step 2 avoid the pole. Under RH they also avoid zeros. A local logarithm normalized at 2+it therefore exists and agrees with the Euler logarithm on the inner disc.

The elementary continuation formula

~~~math
\zeta(s)=\frac{s}{s-1}
        -s\int_1^\infty \{x\}x^{-s-1}\,dx
~~~

provides the required polynomial bound on these discs. Repeat Steps 2 and 3, using zeta's functional equation. The strip about one-half has no pole. Values with bounded t are covered by compactness and analyticity on that line. This proves the full zeta assertion.

### 5. Imprimitive and principal characters modulo arbitrary q

Let chi modulo q be induced by a primitive character chi-star of conductor r dividing q. The exact factorization is

~~~math
L(s,\chi)=L(s,\chi^\ast)
\prod_{\substack{p\mid q\\p\nmid r}}
(1-\chi^\ast(p)p^{-s}).
~~~

On the critical line, the product of the absolute values is at most

~~~math
\prod_{p\mid q}(1+p^{-1/2}).
~~~

For any positive eta, choose a threshold P_eta so that, for p at least P_eta,

~~~math
1+p^{-1/2}\le p^\eta.
~~~

The product over the finitely many smaller primes is a constant depending only on eta. The product over the larger primes dividing q is at most q to the power eta. Hence

~~~math
\prod_{p\mid q}(1+p^{-1/2})\ll_\eta q^\eta.
~~~

Apply the primitive bound with exponent epsilon/2 and this product bound with exponent epsilon/2. Since r divides q, their product is bounded by a constant times (q(2+|t|)) to the power epsilon. This also handles all principal characters, by Step 4. The proof is complete.

## More quantitative inherited consequences

The elementary proof above is deliberately weaker than known conditional estimates. For example, Chandee's [Corollary 1.2](https://arxiv.org/pdf/0906.4177) states an explicit critical-line estimate for primitive even Dirichlet characters, in terms of an analytic conductor comparable with q(1+|t|). Its exponent is bounded by a constant times log Q divided by log log Q. The general theorem handles other archimedean parameters. No new constant is claimed here.

The distinction matters for applications: DGRH supplies conductor-uniform control, not merely one constant separately chosen for each character.

## Named-target screen

| Target | What the accepted input supplies | Research disposition |
|---|---|---|
| Lindelöf hypothesis | Complete classical implication, proved above | Record as an inherited consequence; no new discovery credit |
| Vinogradov's least quadratic nonresidue conjecture | Ankeny's old DGRH bound is logarithmic squared, hence smaller than every positive power of p | Old implication; earlier 2026 quasi-RH announcements already discuss this consequence |
| Vinogradov's least primitive root conjecture | Shoup's old DGRH/ERH bound is at most a fixed power of log p | Old implication; earlier quasi-RH-based applications must be included in prior art |
| Elliott–Halberstam conjecture | DGRH supplies individual progression estimates but does not discharge the extra pair-correlation input in the 2026 route below | Unresolved in this campaign |
| Montgomery's conjecture on the progression error term | Same extra pair-correlation input remains | Unresolved in this campaign; distinct from the character-sum conjecture studied in another lane |
| Chowla's central nonvanishing conjecture | DGRH permits zeros at one-half | No full implication obtained |
| Binary Goldbach conjecture | The new Li–Liu conditional approach requires additional spectral hypotheses besides DGRH | No full implication obtained |
| Ramanujan's ternary quadratic form conjecture | The known feasible full-exception-list proof assumes RH for elliptic-curve twist L-functions in addition to real Dirichlet L-functions | Accepted input supplies only one of the two families |

None of these table rows is counted as a new solution in the repository.

For the Vinogradov implications, see [Tao, Conjecture 1.1 and introductory discussion](https://msp.org/ant/2015/9-4/ant-v9-n4-p09-p.pdf) and [Shoup, Theorem 3](https://www.shoup.net/papers/primroots.pdf). The [October 2026 quasi-RH manuscript](https://github.com/openai/math/blob/main/preprints/The-Quasi-Riemann-Hypothesis-October-5-2026/build/paper2.tex) already advertises a least-nonresidue implication. Its existence is a prior-claim finding, not independent verification of that manuscript.

[Kandhil–Languasco–Moree, 2026](https://doi.org/10.1007/s00208-026-03383-y) assumes both DGRH and a pair-correlation conjecture to reach its progression and central-vanishing conclusions. Accepting DGRH removes only the first condition.

[Li–Liu's 13 November 2026 announcement](https://mrc.sdu.edu.cn/english/info/1018/1514.htm) likewise states two extra alternative spectral hypotheses. This note has not validated that new manuscript and does not infer Goldbach from its title.

[Ono–Soundararajan, Theorem 3](https://uva.theopenscholar.com/files/ken-ono/files/025.pdf) explicitly requires RH for quadratic twists of the elliptic curve with equation y squared equals x cubed plus x squared plus 4x plus 4. Their introductory discussion explains that Dirichlet RH with older effective bounds gives a very large finite reduction. Such a reduction is not a proof of the exact exception list.

## Prior-art and status audit

The bounded literature search covered exact conjecture names, original conditional implications, recent specialist surveys, fresh proof claims, and the stronger-family assumptions in several commonly advertised applications.

- Florea's paper was submitted in September 2025 and published in 2026. Its first section calls Lindelöf open and describes the longstanding RH implication.
- Chandee's 2009 paper proves a stronger quantitative implication. Our analytic proof cannot receive novelty credit.
- Matiyasevich's [2026 approach](https://arxiv.org/abs/2602.05731) explicitly says its initial formula manipulation is not a genuine proof: convergence and changes in summation order are not established.
- Unterberger's [arXiv:2208.12937](https://arxiv.org/abs/2208.12937) must not be described simply as withdrawn. Version 48 was withdrawn in August 2026, but the inspected latest version is v53, dated 15 November 2026, titled *The Riemann hypothesis*, and again claims a proof. We did not independently establish acceptance or validity of that latest claim.
- The October 2026 OpenAI quasi-RH papers are relevant prior claims for the Vinogradov targets. They are not used as assumptions in this proof.
- No separate, accepted full proof of Lindelöf independent of the accepted campaign input was established in this search. That is a search finding, not a guarantee of exhaustive priority clearance.

A complete attribution-safe statement is: **accepting the specified RH theorem settles the Lindelöf hypothesis through a classical implication. The contribution of this note is explicit scope and a uniform derivation; the underlying implication is prior art.**

## Next mathematical obstacle

To obtain a new transfer beyond these classical consequences, one must prove an additional estimate not already furnished by zero location. For the progression targets, the concrete missing quantity is a correlation of zero ordinates or of character-weighted prime errors. For central nonvanishing, one must exclude zeros exactly on the critical line. For the ternary-form application, one must control a different L-function family.

The RH proof's theta-lift multiplicity mechanism could conceivably supply such extra information, but no such implication has been proved here. A bound in the right half-plane alone does not identify a valid theorem replacing those missing hypotheses.
