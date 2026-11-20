# Riemann hypothesis applications

Research checkpoint: 20 November 2026. Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80). Fujii discussion: [issue #87](https://github.com/1337isnot1337/solved-conjectures/issues/87). Soundararajan discussion: [issue #99](https://github.com/1337isnot1337/solved-conjectures/issues/99).

## Accepted input and objective

At the owner's request, this campaign accepts the RH and Dirichlet-GRH result in Levent Alpöge's archive as correct. The source is pinned to [9d5316ec73f5df89c4d95703ed106837b8a4060e](https://github.com/1337isnot1337/riemann-hypothesis-solved/tree/9d5316ec73f5df89c4d95703ed106837b8a4060e). Work consists of mathematical extraction and proof research. No Lean verification is performed.

The objective is to settle full named open conjectures or prove missing steps connecting them to the archive. Numerical cases, incremental parameter ranges, and renamed known theorems do not constitute additional conjecture solutions.

The accepted top-level result covers the Riemann zeta function and Dirichlet L-functions. It does not automatically supply GRH for arbitrary Hecke or Artin L-functions, independence or simplicity of zeros, central nonvanishing, or pair correlation. Internal arithmetic theorems retain their stated hypotheses.

## Reviewed full named outcomes

The following inventory contains twenty full historically stated conjectures with complete written deductions in this lane. Eight entries contain proof arguments or deductions developed in this campaign; twelve use established conditional implications with the accepted RH/Dirichlet-GRH input. This is not a claim of twenty independent new breakthroughs. Coffey and Keiper concern closely related coefficients; Coffey–Smith and Merlini–Sala–Sala use related boundary analysis. Pomerance's entry identifies the exact 1974 nonexistence conjecture, not the different ordered prime-product assertion.

Current prior-art searches have not located an earlier full resolution of the exact targets apart from the accepted input and the established conditional implications. The searches and retrieval limits are recorded individually. Mathematical completeness, historical priority, and external acceptance are different questions.

| Named conjecture | Full outcome | Nature of the argument |
|---|---|---|
| Nuttall's conjecture | Proved: every fixed order admits a tail cumulant whose kernel has all the required determinant signs for every ordered node set | Complete internally reviewed unconditional proof; [note](nuttall.md), [issue #121](https://github.com/1337isnot1337/solved-conjectures/issues/121) |
| Coffey–Smith conjecture | Disproved: under RH the union of its two proposed positive-fraction sets has density zero; without RH its upper bound fails | Complete internally reviewed unconditional refutation; [note](coffey-smith.md), [issue #122](https://github.com/1337isnot1337/solved-conjectures/issues/122) |
| Merlini–Sala–Sala conjecture | Disproved: the tiny Li remainder divided by n^(1/4) has infinite absolute limsup, so its proposed subpower and logarithmic bounds fail | Complete internally reviewed unconditional refutation; [note](merlini-sala-sala.md), [issue #128](https://github.com/1337isnot1337/solved-conjectures/issues/128) |
| Chaudhary–Khmiri–Mazhouda conjecture | Disproved: an admissible unitary Dirichlet twist has Re(lambda(2)−lambda(1))<−3/2 | Complete internally reviewed unconditional counterexample with exact rational certificate; [note](chaudhary-khmiri-mazhouda.md), [issue #124](https://github.com/1337isnot1337/solved-conjectures/issues/124) |
| Csordas–Vishnyakova conjecture | Disproved: exp(−z^4) with p(z)=z^4+z^2+1 satisfies every stated coefficient inequality but is not in the Laguerre–Pólya class | Complete internally reviewed unconditional exact counterexample; [note](csordas-vishnyakova.md), [issue #132](https://github.com/1337isnot1337/solved-conjectures/issues/132) |
| Pomerance's conjecture | Proved in its original 1974 nonexistence form: no integer satisfies his sufficient criterion for a unique totient preimage | Complete internally reviewed deduction from the Ford–Luca prime-tree theorem and accepted Dirichlet GRH; [note](pomerance.md), [issue #129](https://github.com/1337isnot1337/solved-conjectures/issues/129) |
| Jutila's conjecture | The complete character-sum moment bound holds for every positive integer moment, every length, and every nonprincipal real character of modulus at most X | Full internally reviewed deduction under accepted Dirichlet GRH using established moment methods, including exact unsmoothing and all induced characters; [note](jutila.md), [issue #135](https://github.com/1337isnot1337/solved-conjectures/issues/135) |
| Fujii's conjecture | The reported all-positive-alpha equivalence family is false under the accepted beta GRH; the large-alpha oscillation theorem is unconditional | Complete internally reviewed argument, with direct original-source retrieval still limited; [note](fujii.md) |
| Banks–Friedlander–Luca–Pappalardi–Shparlinski conjecture | Every value of Carmichael's lambda function has at least two preimages | Published Ford–Luca theorem under exactly Dirichlet ERH, plus checked arithmetic deduction; [note](banks-friedlander-luca-pappalardi-shparlinski.md), [issue #120](https://github.com/1337isnot1337/solved-conjectures/issues/120) |
| Riffaut's conjecture | No singular modulus of degree at least three is a zero of a rational trinomial of the stated form | Published Bilu–Luca–Pizarro-Madariaga Dirichlet-GRH theorem; [note](riffaut.md), [issue #119](https://github.com/1337isnot1337/solved-conjectures/issues/119) |
| Coffey's conjecture | The full coefficient upper bound holds, with the stronger bound log(n+2)/sqrt(n) | Published Lagarias RH estimate with exact coefficient normalization; [note](coffey.md), [issue #118](https://github.com/1337isnot1337/solved-conjectures/issues/118) |
| Keiper's conjecture | The normalized coefficients have the full asymptotic, including the constant term, with a square-summable remainder | Published Arias de Reyna RH theorem; [note](keiper.md), [issue #123](https://github.com/1337isnot1337/solved-conjectures/issues/123) |
| Csordas–Dimitrov Laguerre conjecture | Every derivative Laguerre inequality holds at every real argument for the original theta-moment entire function | Classical RH-to-Laguerre–Pólya implication applied to the complete original Problem 3.5; [note](csordas-dimitrov.md), [issue #133](https://github.com/1337isnot1337/solved-conjectures/issues/133) |
| Brent's conjecture | The original discrete logarithmic mean tends to one; Robin's separately stated modulus-four logarithmic mean also holds | Classical RH/Dirichlet-GRH consequences, with full signed-weight and sum–integral deductions; [note](brent.md), [issue #127](https://github.com/1337isnot1337/solved-conjectures/issues/127) |
| Nicolas's conjecture | The strict Euler-totient inequality holds at every primorial, including the first | Published Nicolas RH theorem with exact endpoint and quantitative cross-check; [note](nicolas.md), [issue #131](https://github.com/1337isnot1337/solved-conjectures/issues/131) |
| Soundararajan's conjecture | The original smooth-number equidistribution statement holds for every fixed A in its full asymptotic range | Published Banks–Shparlinski criterion under Dirichlet GRH; [note](soundararajan.md) |
| Grosswald's conjecture | The full least-primitive-root inequality holds for every prime p>409 | Published McGown–Treviño–Trudgian Dirichlet-GRH theorem, with its finite dependencies imported; [note](grosswald.md) |
| Knapowski–Turán conjecture | The original modulus-four natural-density assertion is false | Published Kaczorowski Dirichlet-GRH theorem; [note](knapowski-turan.md) |
| Chebyshev's conjecture | The original Abel-weighted prime difference tends to minus infinity | Classical equivalence with beta GRH; [note](chebyshev.md) |
| Lindelöf hypothesis | The full subpower bound holds | Classical RH implication, with conductor-uniform Dirichlet version documented; [note](dirichlet-applications.md) |

Already published QRH applications such as Vinogradov and the idoneal-number classification remain excluded. The qualified Simm–Wei formulation and Chandee's matching-order result do not enter this full-statement inventory. Neither do the unresolved Hecke, Artin, Selmer, or correlation reductions below. This inventory does not alter unrelated campaigns' result counts.

### Jutila's conjecture

The [full proof](jutila.md) establishes, for each positive integer \(m\), constants depending only on \(m\) such that
~~~math
\sum_{\substack{\chi\ {\rm real,\ nonprincipal}\\
                 {\rm modulus}(\chi)\le X}}
\left|\sum_{n\le Y}\chi(n)\right|^{2m}
\ll_m XY^m(\log X)^{C_m}
\qquad(X\ge3,\ Y\ge1).
~~~
Characters are counted with their moduli, including imprimitive characters. The original nonsquare-discriminant family injects into this family; its exact definition was checked on the actual 1973 scan.

The accepted rational Dirichlet GRH supplies a published logarithm bound for every primitive character. Elementary quadratic orthogonality and a large-deviation argument give the needed moments uniformly in height. A half-integer Perron cutoff recovers the unsmoothed sums. Möbius inversion and a convergent Euler product control every induced character, with only one further logarithm. All moments and all lengths belong to this one historical target.

The logarithmic exponent is deliberately nonsharp. The complete derivation uses established conditional methods, which retain their original credit. The note includes independent source/input and full-argument reviews.

### Csordas–Dimitrov Laguerre conjecture

For the exact entire function \(F\) in their 2000 Problem 3.5, the [note](csordas-dimitrov.md) proves
~~~math
(F^{(q)}(x))^2-F^{(q-1)}(x)F^{(q+1)}(x)\ge0
\qquad(q\ge1,\ x\in\mathbb R).
~~~
Under accepted RH, \(F\) has only negative real zeros and order \(1/2\). Its genus-zero product is a compact limit of real-rooted polynomials. Rolle's theorem and convergence of derivatives prove every requested inequality. This is the classical implication already indicated by the original authors. The previously established nonnegative-real-argument case is not counted separately.

### Csordas–Vishnyakova conjecture

The original 2013 Conjecture 3.6 removes the growth restriction from a preceding Laguerre–Pólya criterion. Its fixed admissible polynomial may be
~~~math
p(z)=z^4+z^2+1.
~~~
For the real entire function \(\varphi(z)=e^{-z^4}\), the relevant product is exactly
~~~math
\prod_{j=1}^{4}\varphi(x+\alpha_jt)
=e^{-4x^4}\,e^{12x^2t^2}\,e^{2t^4},
\qquad p(z)=\prod_{j=1}^{4}(z+\alpha_j).
~~~
Every coefficient is nonnegative for every real \(x\). Yet \(\varphi(it)\varphi(-it)=e^{-2t^4}\) has a negative coefficient. Such a coefficient is impossible for a compact limit of real-rooted polynomials. The [full proof](csordas-vishnyakova.md) refutes the published implication unconditionally and includes three internal review receipts. Cardon's original genus-restricted theorem is unaffected.

### Nicolas's conjecture

For \(N_k=\prod_{j\le k}p_j\), the [note](nicolas.md) applies Nicolas's established theorem to obtain
~~~math
\frac{N_k}{\varphi(N_k)}>e^\gamma\log\log N_k
\qquad(k\ge1).
~~~
The accepted input here is zeta RH alone. Nicolas's original conditional implication retains full credit. His later quantitative theorem provides a separate source check for every index. The current-status audit also records concrete flaws in several apparent prior-proof claims, with exact versions and access limits.

### Nuttall's conjecture

For the Riemann theta kernel Phi and its repeated tails
~~~math
\Psi_m(u)=\frac1{(m-1)!}\int_0^\infty v^{m-1}\Phi(u+v)\,dv,
~~~
the [proof](nuttall.md) establishes, for every fixed r and every sufficiently large m,
~~~math
(-1)^{s(s-1)/2}\det[\Psi_m(x_i+y_j)]_{i,j=1}^s>0
\qquad(1\le s\le r)
~~~
for every pair of strictly increasing nonnegative node lists. The original conjecture asks for the corresponding sign regularity. Its existing propagation theorem already makes the eventual-m and existence formulations equivalent.

The argument first proves eventual Wronskian signs for the theta kernel. An exact determinant integral transfers them to the tail cumulants. Uniformly on the remaining compact interval, one separated positive box dominates the entire possibly negative region. Extended-Chebyshev criteria then give every ordered-node determinant. The proof assumes no RH and uses no numerical cutoff. It leaves the separate low-index Toeplitz determinants in Nuttall's proposed RH program untouched.

### Coffey–Smith conjecture

For
~~~math
\log\!\left(\frac z{1-z}\zeta\!\left(\frac1{1-z}\right)\right)
=\sum_{n\ge1}c_nz^n,
~~~
the [proof](coffey-smith.md) establishes under RH
~~~math
\sum_{N\le n\le2N}|c_n|^2\ll N^{-1/2}\log^3(N+2).
~~~
Consequently, for each fixed 0<epsilon<1/4,
~~~math
\#\{n\le X:|c_n|>n^{-1/2-\epsilon}\}
\ll_\epsilon X^{1/2+2\epsilon}\log^3(X+2)=o(X).
~~~
This contradicts the original positive-fraction clauses for both signs. The proof combines the established Hardy-space identification with an explicit translation-modulus estimate for the boundary argument of zeta. It needs no simplicity or spacing assumption on zeros. If RH fails, even polynomial coefficient growth fails, so the original upper clause also fails. The refutation of the full conjunction is therefore unconditional.

The separate upper-bound statement named Coffey's conjecture remains valid under accepted RH. The density refutation does not contradict it.

### Merlini–Sala–Sala conjecture

For the same coefficients \(c_n\), the authors' tiny remainder is \(\lambda_{\rm tiny}(n)=n c_n\). The [proof](merlini-sala-sala.md) gives
~~~math
\limsup_{n\to\infty}\frac{|\lambda_{\rm tiny}(n)|}{n^{1/4}}=\infty.
~~~
It refutes their full logarithmic/subpower conjecture. Assuming the contrary bound first supplies an analytic logarithm and an \(H^2\) boundary function. On zero-free arcs corresponding to \(T\le t\le2T\), its argument has angular derivative of order \(T^2\log T\). The zero count leaves enough whole short arcs to force a squared translation modulus at least \(c/T\); the assumed coefficient bound gives \(O(1/(T\sqrt{\log T}))\). The contradiction is unconditional and requires no zero-spacing assumption.

### Chaudhary–Khmiri–Mazhouda conjecture

The [counterexample](chaudhary-khmiri-mazhouda.md) uses the unitary GL1 twist
~~~math
L(s,\pi_8)=L(s+8i,\chi_{-3}).
~~~
It belongs to the exact class in the 2026 original paper. A Hadamard-product calculation reduces the first coefficient decrease to two logarithmic derivatives at \(1+8i\). Explicit Euler–Maclaurin and gamma-series remainders, enclosed by [integer interval arithmetic](certificates/chaudhary-khmiri-mazhouda.py), prove
~~~math
\operatorname{Re}\lambda_{\pi_8}(2)
-\operatorname{Re}\lambda_{\pi_8}(1)
\in[-1.660157075630,-1.655616272869].
~~~
This is a full counterexample to universal monotonicity. Its proof does not assume RH; it remains a counterexample under accepted Dirichlet GRH.

### Pomerance's conjecture

The original 1974 abstract conjectures that no positive integer \(n\) satisfies
~~~math
r-1\mid\varphi(n)\quad\Longrightarrow\quad r^2\mid n
\qquad\text{for every prime }r.
~~~
The [proof](pomerance.md) selects the smallest prime power missing from \(\varphi(n)\), propagates the assumed condition down Pratt trees, and uses Ford–Luca's Dirichlet-GRH theorem to force one extra valuation. It settles that complete original nonexistence statement. The stronger ordered prime-product conjecture and Carmichael's full totient conjecture remain open here.

### Brent's conjecture

The [note](brent.md) proves Brent's literal discrete mean, equation (1.22) in the original:
~~~math
\sum_{n=2}^N
\frac{(\langle\operatorname{li}(n)\rangle-\pi(n))\log n}{n^{3/2}}
=\log N+2\log\log N+O(1),
~~~
where angle brackets mean nearest integer. The prime-square term supplies the mean after the integrated explicit formula. A summable cell error connects the integral proof to the exact discrete statement. Robin's modulus-four version is credited to his existing GRH theorem and also receives a complete signed-weight deduction. The downloaded original scans and an independent review establish the precise historical formulas.

## Fujii's conjecture

The complete written argument in [Fujii's conjecture](fujii.md) proves, without any RH assumption, that there is A>0 such that for every fixed alpha>A,
~~~math
S_\alpha(x)=\sum_{p>2}\chi_4(p)e^{-(p/x)^\alpha}
=\Omega_\pm\!\left(\frac{\sqrt{x}}{\log x}\right).
~~~
In particular its limsup is +infinity and its liminf is -infinity.

This contradicts the reported all-positive-alpha equivalence family under the accepted beta GRH input. It concerns every sufficiently large fixed exponent. It does not extend a numerical admissible range and uses no linear independence or simple-zero assumption.

The beta-GRH branch has two complete positive-phase proofs. The boundary proof uses a reflected local logarithmic singularity. The shorter [zero-count proof](fujii-zero-count.md) gives
~~~math
F_\alpha(0)=
\left(\frac12-\frac1{\mathrm e}\right)\log\alpha
+C_\beta+O\!\left(\frac{\log(\alpha+2)}{\alpha}\right),
~~~
with an explicitly convergent constant. A separate convolution proof supplies the prime-sum normalization, and almost-periodic recurrence moves the positive phase to arbitrarily large x. Under beta GRH, each sign set also has positive lower natural and logarithmic density. In the complementary case, Landau's theorem forces both signs for every positive alpha, completing the unconditional oscillation theorem.

The [prior-art audit](fujii-prior-art.md) establishes that the general boundary, smoothing, and recurrence mechanism is classical, notably in Kaczorowski's early papers and Kaczorowski–Ramaré (2003). The possible contribution here is the explicit Fujii-weight corollary and its application, not a new oscillation principle. No retrieved primary paper explicitly stated that corollary or the displayed coefficient, but priority remains unclaimed. Direct retrieval of Fujii's 1988 text remains blocked; Suzuki 2012, corrected Suzuki 2025, and the comparative-prime-number bibliography independently record the exact all-alpha conjecture.

The [Gamma-power clause](fujii-gamma-power.md) has a separate complete proof: for every integer k>=1, the unweighted prime sum with Mellin weight Gamma(s)^k tends to minus infinity if and only if beta GRH holds. The proof uses the classical k=1 Chebyshev theorem, positive Mellin convolution, and Landau's theorem. This is not counted as another named conjecture.

## Notes and exact status

| Named target or source application | Recorded outcome | Note |
|---|---|---|
| Merlini–Sala–Sala conjecture | Complete unconditional refutation of full logarithmic/subpower remainder growth; separate linear stability bound remains unresolved | [Merlini–Sala–Sala](merlini-sala-sala.md) |
| Chaudhary–Khmiri–Mazhouda conjecture | Complete unconditional counterexample to full automorphic Li monotonicity, with exact interval certificate | [Chaudhary–Khmiri–Mazhouda](chaudhary-khmiri-mazhouda.md) |
| Pomerance's conjecture | Complete accepted-Dirichlet-GRH proof of the original no-criterion assertion; ordered prime-product statement remains open | [Pomerance](pomerance.md) |
| Brent's conjecture | Full original discrete logarithmic mean and Robin's separately credited modulus-four statement follow from accepted RH/Dirichlet GRH | [Brent](brent.md) |
| Carmichael's conjecture | Unresolved. Exact Carmichael–Klee closure and the multiplicative replacement obstruction are documented; no inference from lambda-function noninjectivity | [Carmichael](carmichael.md) |
| Bellemare–Langlois–Ransford conjecture | Unresolved for its original harmonic weights. A broader decreasing-weight assertion is disproved; the complete Cesàro analogue is proved but not counted | [Bellemare–Langlois–Ransford](bellemare-langlois-ransford.md) |
| Fujii's conjecture | Complete internally reviewed unconditional large-alpha oscillation theorem; refutation of the reported equivalence family uses accepted beta GRH. Exact-application priority remains unclaimed | [Main proof](fujii.md), [prior art](fujii-prior-art.md) |
| Fujii's conjecture, Gamma-power clause | Complete equivalence for the entire integer-k family by classical positive convolution and Landau; no separate target count | [Gamma-power proof](fujii-gamma-power.md) |
| Lindelöf hypothesis | Full standard implication from accepted RH/Dirichlet GRH; classical attribution retained | [Dirichlet applications](dirichlet-applications.md) |
| Simm–Wei conjecture | Accepted RH gives Lindelöf and supplies the hypothesis of the cited 2026 moment theorem. The normalized complex limit is proved; coefficient zeros prevent an unqualified all-complex ratio claim | [Simm–Wei](simm-wei.md) |
| Soundararajan's conjecture | Full smooth-number equidistribution follows for every fixed A and all sufficiently large q from Banks–Shparlinski's published criterion and accepted Dirichlet GRH. The published GRH implication is credited to its authors; application priority remains unclaimed | [Soundararajan](soundararajan.md), [issue #99](https://github.com/1337isnot1337/solved-conjectures/issues/99) |
| Chandee's conjecture | Complete inherited matching-order theorem and endpoint reduction. Original asymptotic notation/leading-constant scope remains distinct; no full original-conjecture resolution or new count | [Chandee](chandee.md) |
| Chebyshev's conjecture | Original Abel-weighted assertion follows by the classical equivalence with beta GRH | [Chebyshev](chebyshev.md) |
| Grosswald's conjecture | Full conclusion for every prime p>409 follows from McGown–Treviño–Trudgian's published 2016 theorem and accepted Dirichlet GRH. The separate 2015 zero-counting defect is not a dependency | [Grosswald](grosswald.md), [dependency review](grosswald-dependency-review.md), [issue #91](https://github.com/1337isnot1337/solved-conjectures/issues/91) |
| Knapowski–Turán conjecture | Full inherited refutation of the original natural-density conjecture by Kaczorowski's 1992 theorem; both strict race orderings have positive lower natural density | [Knapowski–Turán](knapowski-turan.md) |
| Vinogradov's conjecture | Full classical consequence, but the QRH-to-subpower application was already publicly recorded in October 2026. Excluded from new-application or new-target counts | [Vinogradov](vinogradov.md) |
| Euler's idoneal-number conjecture | The original October QRH source already explicitly claimed completeness of the 65-number list. Excluded as a new application; original-source inventory and exact character-family hypothesis recorded | [QRH prior art](qrh-prior-art.md) |
| Granville–Soundararajan's conjecture | Unresolved. The November theorem covers fixed powers of q; an exact short-range bilinear prime sum remains uncontrolled. The sharp least-nonresidue consequence is already in the original paper | [Granville–Soundararajan](granville-soundararajan.md) |
| Erdős–Odlyzko–Sárközy conjecture | Unresolved. Almost all residue classes or a three-prime representation do not settle the original two-prime assertion for every class; the exact cross-character error is recorded | [Erdős–Odlyzko–Sárközy](erdos-odlyzko-sarkozy.md) |
| Chowla's conjecture | Unresolved. The Montgomery-error-to-least-prime implication is proved; the cross-character cancellation needed for its hypothesis is not supplied | [Chowla](chowla.md) |
| Martin's conjecture | Unresolved. The inherited density-one prime-factor bias does not prove eventual pointwise sign | [Martin](martin.md) |
| Resnikoff–Saldaña conjecture | Unresolved. The available theorem selects one coefficient per genus and has a weaker exponent; the stronger theorem also needs modular-twist Lindelöf | [Resnikoff–Saldaña](resnikoff-saldana.md) |
| Vandiver's conjecture | Unresolved. The archive yields a polynomial bound for logarithmic torsion in every K-degree over Z, but a size bound does not force vanishing | [Vandiver and K-theory](vandiver.md) |
| Greenberg's conjecture | Unresolved. An explicit Iwasawa-module model shows that polynomial specialization bounds do not force lambda=0 | [Arithmetic extraction](vandiver.md) |
| Schneider's, Jannsen's, and Soulé's conjectures | Unresolved in their full forms. Exact twist signs, known Artin–Tate content, an interpolation countermodel, and missing field-uniform estimates are recorded | [Arithmetic vanishing](arithmetic-vanishing.md) |
| Artin's primitive-root density conjecture | Unresolved. Exact algebraic transfer lemmas, an irreducible-adjoint obstruction, and a complete small/middle/large index-divisor reduction are proved. The uniform splitting route additionally assumes a separate Hecke strip H(delta), whose full proof has not been audited here | [Artin and nonabelian transfer](artin-density.md), [character lifting](character-lifting.md), [adjoint obstruction](adjoint-transfer.md), [CM descent](cm-character-descent.md), [uniform splitting](artin-uniform-splitting.md), [average reduction](artin-average.md) |
| Generalized Riemann hypothesis for Hecke L-functions | Unresolved. The archive's final window criterion is extended to finite positive families over arbitrary fields, including principal characters. Near-square-root windows and their moving-field arithmetic/host inputs remain unproved | [Hecke transfer](hecke-bootstrap.md) |
| Selberg's, Ramanujan's, Artin's, and Fontaine–Mazur's conjectures | No full transfer identified. The traced automorphic package retains regularity, CM, polarization, and existing-attachment hypotheses | [Automorphic scope](automorphic-scope.md) |
| Other named candidates | Prior resolutions and missing hypotheses are recorded before further work; includes withdrawal of an earlier RecAt source-reading inference | [Screening and source audit](analytic-applications.md) |

### Fujii proof and review map

- [Main proof](fujii.md): the complete theorem, beta-GRH and complementary cases, exact logical scope.
- [Zero-count proof](fujii-zero-count.md): the shorter positive-phase calculation, convergent constant, and O(log(alpha)/alpha) remainder.
- [Convolution and logical review](fujii-review.md): independent normalization under beta GRH alone, quantifier checks, and the independent zero-count review.
- [Mellin review](fujii-mellin-review.md): compact-to-Schwartz cutoff, uniform Fourier errors, square term, and summation over all zeros.
- [Distribution and recurrence review](fujii-review-distribution.md): uniform gamma domination, positive-test transfer, and recurrence without independence.
- [Boundary review](fujii-boundary.md): reflection, absence of a point-supported term, specified-phase asymptotic, and the positive-density corollary.
- [Landau complement](fujii-landau.md): the non-GRH case, a proof of the positivity principle, and the distinction between negative limits and equivalences.
- [Prior-art audit](fujii-prior-art.md): direct comparison with the older boundary and smoothing theorems and the remaining retrieval limits.

## Arithmetic results extracted so far

The accepted weighted cohomology bound gives constants C,B independent of m with
~~~math
\log |K_m(\mathbb Z)_{\mathrm{tors}}|\le C(m+1)^B
\qquad(m\ge1).
~~~
The difficult K_(4n) contribution uses the source bound; other residue classes use previously known torsion formulas. This is not a proof of Vandiver or of the full field-uniform Soulé conjecture. Priority for the quantitative extraction is unclaimed.

For imaginary-quadratic class-character twists, the correct polarized diagonal is
~~~math
\operatorname{diag}(\epsilon^e\psi,\,1,\,\epsilon^{-e}\psi).
~~~
Its negative-simple-root adjoint plane is an induced representation. Shapiro therefore gives a first-order Selmer-to-deformation map with the required local conditions. The corrected trace family also has an integral nonzero norm bound.

A further proved lemma in [character-lifting.md](character-lifting.md) shows that every normalized triangular characteristic-zero point is diagonal without the old coefficient-prime/class-number coprimality assumption. The argument uses opposite local flags, strict negative-Tate Selmer vanishing, polarization, and the literal source normalization. This supplies the specified M3 condition while allowing additional diagonal class characters.

The other reducible-point case remains a different problem. Its rank-two corner descends, but its off-block extension module becomes
~~~math
U=V\otimes\operatorname{Ind}_{G_K}^{G_{\mathbb Q}}\nu.
~~~
Both two-dimensional determinants are eta_K. The resulting rank-four tensor never has the one-dimensional fixed quotient required by the checked Rankin Euler-system theorem. At the relevant specialization its reciprocity multiplier also vanishes. These are exact failures of the cited theorem's hypotheses, not disproofs of the desired Selmer vanishing.

The integral obstruction is also explicit:
~~~math
R_n=\mathcal O[z]/(z^2,\pi^n z)
~~~
has a single rigid generic point but cotangent length n. Generic-point rigidity cannot replace the source's detailed integral presentation conditions. No characteristic-zero automorphic point is inferred from a torsion tangent alone.

The separate [arithmetic-vanishing audit](arithmetic-vanishing.md) proves the finite-image, arbitrary-rank Artin–Tate extension of the source vanishing theorem and identifies it as known. Its interpolation countermodel explains why the available positive-weight size bounds do not establish the missing Schneider/Jannsen range.

## Hecke and Artin transfer checkpoint

The [adjoint-transfer theorem](adjoint-transfer.md) rules out a proposed bypass of the rank-four problem. When the connected monodromy of V is SL2, the module U cannot embed in End(r) tensor a character for any absolutely irreducible finite-dimensional characteristic-zero r. The central element of the relevant SL2 factor acts as minus one on U but trivially on End(r). This persists after finite base change. The natural reducible rank-three adjoint instead contains U itself, so extending an adjoint theorem to that representation would restate the missing Selmer problem.

The [CM field lemma](cm-character-descent.md) proves that every odd-order anticyclotomic character of an imaginary quadratic field retains its full order after every CM extension. The even-order loss is at most a factor of two. The norm map on class groups is consequently surjective on odd-primary parts. These field-theory statements are complete; no novelty claim is made.

A separate October manuscript claims a common zero-free width delta for finite-order Hecke characters on cyclotomic fields. That assertion is denoted H(delta), with its provenance and unaudited preceding argument recorded. It is not silently imported into the accepted RH archive. Conditional on H(delta), the [uniform splitting note](artin-uniform-splitting.md) proves
~~~math
N_a(x,q)\ll_a
\frac{x}{q(q-1)\log x}
+\frac{x^{1-\delta}\log(2q)}{\log x}
~~~
for polynomially growing prime q. It closes the small prime-index tail for every fixed eta<delta; an elementary product argument closes the large tail. The exact unresolved middle-family average is stated, together with the order of limits that would give the full classical Artin constant. Previously announced infinitude and positive-lower-density results are excluded as new solutions.

The [Hecke window transfer](hecke-bootstrap.md) removes the final analytic layer as an obstacle. For each finite Hecke character, a one-sided corrected prime-ideal bound of size x^(1/2+epsilon) throughout arbitrarily large intervals [Y,Y^lambda], for every epsilon>0 and one fixed lambda>1, implies its GRH. Positive finite families also work because their zero residues cannot cancel. Principal poles, conjugate characters, and the functional equation are handled explicitly.

Producing those windows remains open. The accepted archive obtains them for rational Dirichlet characters using a moving-field weighted Selmer estimate, analytic host selection, and comparison constructions. The bound concerns all weights below floor(x^401), with budget exp(x^epsilon/2). A fixed zero-free strip alone does not provide either that integral arithmetic bound or the near-square-root auxiliary-character estimates.

### Exact average and integral bounds still needed

The [Artin average note](artin-average.md) shortens the missing interval to
~~~math
x^\eta<q\le\frac{\sqrt{x}}{(\log x)^B}
~~~
for any fixed B>0. For the unique nonlinear character of the Kummer Galois group, the exact normalization is q N_a=A_q+T_q. Negligibility of the middle tail is equivalent to the weighted first moment
~~~math
\sum_q\frac{|T_q(x)|}{q}=o(x/\log x).
~~~
The sufficient second moment has a negligible diagonal. The inspected sieve estimate yields only a big-O bound at the desired scale; a vanishing factor remains unproved. A separate complete deduction shows that the stated weighted zero-density bound would imply the full Artin asymptotic under H(delta) and Dirichlet GRH. That density bound is an additional hypothesis, not a theorem extracted from the archive.

The [moving Selmer note](moving-selmer-windows.md) proves a quantitative restriction lemma without omitting coefficient primes dividing the character order. For an integer t>=1 and a cyclic degree-d extension L/E killing the coefficient character,
~~~math
W_{S,\eta}(E,t)\le W_S(L,t)+(t-1)\log d.
~~~
The normalization is length over the coefficient ring divided by its ramification index. The restriction kernel is cyclic and killed by d; scalar extension and the error both scale by that ramification index. Local unramified and strict conditions are preserved even at ramified places. This argument has two independent internal reviews.

That note also proves a conditional sparse-window theorem, tracking degree, discriminant, and uniformity before the auxiliary primes are chosen. One common set of at most R exceptional twists must work for every layer in a tower. A controlled mu-primary module contributes at most a times its generator count times the layer degree, so such a term can fit the budget. The uniform finite-rank comparison and the all-prime plus-component estimate remain separate obligations.

A final conditional rank lemma in [moving-selmer-windows.md, section 8](moving-selmer-windows.md) reduces the coefficient-2 tower requirement to one fixed-field hypothesis. Put F_0=F(i), n=[F_0:Q], and let g be the finite generator number of its cyclotomic unramified pro-2 module. Assuming g is finite, equivalently the specified cyclotomic mu_2 is zero, every permitted quadratic host has generator number at most 4(g+3n), independently of q,d. Prime decomposition, tame inertia, a normal-closure argument, and pro-2 Schreier prove the bound. It has independent mathematical and source-scope reviews. The inspected one-prime split towers do not supply this cyclotomic hypothesis; the all-prime estimate remains separate.

The [special-value reduction](hecke-special-values.md) gives a second explicit arithmetic route. The complex functional equation already bounds the logarithm of the leading L-value polynomially in the weight, field degree, and logarithmic conductor. The auxiliary H^0 torsion factor has the same required type of bound. For totally imaginary kernel fields, the all-prime cohomology sum equals log|K_(2j)(O_L)|, including the prime 2.

An integral leading-term formula with controlled defects, together with a uniform polynomial bound on the adverse higher-regulator contribution, would therefore supply the needed moving-field Selmer budget. Both are retained as hypotheses. The literature audit includes current Coates–Sinnott, imaginary-quadratic ETNC, noncritical Katz, and November 2026 geometric torsion bounds. The controlled parity, integral index, omitted primes, or growth in the weight prevents the inspected theorems from closing this step. Soulé already proposed the general regulator route; the present note records its exact quantitative requirements for these moving fields.

The archive's budget is exp(x^epsilon/2). A polynomial bound in x would imply even the smaller exp(x^(epsilon/2)); the two expressions are not interchangeable. No fixed-strip statement or fieldwise finiteness estimate is substituted for these quantitative requirements.

## Work allocation

| Worker | Responsibility | Principal owned paths |
|---|---|---|
| Root | Fujii synthesis and direct zero-count proof, full named analytic targets, independent review, integration | this file, fujii.md, fujii-zero-count.md, grosswald.md, analytic-applications.md |
| dirichlet_applications | Named analytic consequences, exact prior art, normalization and recurrence refinements | dirichlet-applications.md, simm-wei.md, chebyshev.md, chowla.md, knapowski-turan.md, martin.md, resnikoff-saldana.md, vinogradov.md, soundararajan.md, granville-soundararajan.md, erdos-odlyzko-sarkozy.md, chandee.md, artin-average.md, fujii-review.md, fujii-landau.md, fujii-boundary.md |
| arithmetic_extraction | K-theory and Selmer extraction, integral lifting, arithmetic target scope | vandiver.md, character-lifting.md, arithmetic-vanishing.md, artin-uniform-splitting.md, moving-selmer-windows.md, qrh-prior-art.md, grosswald-dependency-review.md, fujii-mellin-review.md, fujii-gamma-power.md |
| nonabelian_transfer | Polarized trace families, class-character transfer, automorphic scope, exact obstruction analysis | artin-density.md, adjoint-transfer.md, cm-character-descent.md, hecke-bootstrap.md, hecke-special-values.md, automorphic-scope.md, fujii-review-distribution.md, fujii-prior-art.md |

Workers commit substantive proofs, source traces, or obstructions to main on disjoint paths and coordinate through issues. Other active research campaigns are independent of this lane. Newly assigned paths are announced in the issue before any overlapping edits.

## Claim discipline and continuation

A known implication from an accepted theorem is available for use, but its original authors retain credit. A proposed new application is distinguished from a previously published theorem, a prior public application, and an unresolved bridge. Failure to find a prior paper is not proof of priority.

The completed written mathematics and the historical status of a named conjecture are tracked separately. Internal agent review is not external review or Lean verification. No unqualified new-solution tally is inferred from the number of notes, parameter values, proof variants, or reviews.

The research objective remains active in the live session. At the user's explicit request on November 20, the scheduled continuation was disabled and verified disabled. Do not create or resume a scheduled task for this campaign. Live workers read this index, the latest owned-path notes, and issue #80 before selecting a target and preserve the explicit exclusions instead of repeatedly reopening them.

The renewed target is at least ten complete, full named conjectures at approximately the scale of the repository's existing results. A target is eligible only if a current primary-source search leaves its original full statement unresolved before this application. Previously published resolutions, previously recorded QRH applications, numerical-case increments, proof variants, conditional reductions with missing inputs, and arbitrary restatements of RH do not supply additional counts. Root owns the index; the three current live workers are analytic_targets, arithmetic_targets, and transfer_targets, with new path ownership announced in issue #80.
