# Riemann hypothesis applications

Research checkpoint: 20 November 2026. Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80). Fujii discussion: [issue #87](https://github.com/1337isnot1337/solved-conjectures/issues/87). Soundararajan discussion: [issue #99](https://github.com/1337isnot1337/solved-conjectures/issues/99).

## Accepted input and objective

At the owner's request, this campaign accepts the RH and Dirichlet-GRH result in Levent Alpöge's archive as correct. The source is pinned to [9d5316ec73f5df89c4d95703ed106837b8a4060e](https://github.com/1337isnot1337/riemann-hypothesis-solved/tree/9d5316ec73f5df89c4d95703ed106837b8a4060e). Work consists of mathematical extraction and proof research. No Lean verification is performed.

The objective is to settle full named open conjectures or prove missing steps connecting them to the archive. Numerical cases, incremental parameter ranges, and renamed known theorems do not constitute additional conjecture solutions.

The accepted top-level result covers the Riemann zeta function and Dirichlet L-functions. It does not automatically supply GRH for arbitrary Hecke or Artin L-functions, independence or simplicity of zeros, central nonvanishing, or pair correlation. Internal arithmetic theorems retain their stated hypotheses.

## Main analytic result

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

The research objective remains active. Recurring continuation must read this index, the latest owned-path notes, and issue #80 before selecting a target; preserve the explicit exclusions instead of repeatedly reopening them.
