# Riemann hypothesis applications

Research checkpoint: 20 November 2026. Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80). Fujii discussion: [issue #87](https://github.com/1337isnot1337/solved-conjectures/issues/87).

## Accepted input and objective

At the owner's request, this campaign accepts the RH and Dirichlet-GRH result in Levent Alpöge's archive as correct. The source is pinned to [9d5316ec73f5df89c4d95703ed106837b8a4060e](https://github.com/1337isnot1337/riemann-hypothesis-solved/tree/9d5316ec73f5df89c4d95703ed106837b8a4060e). Work consists of mathematical extraction and proof research. No Lean verification is performed.

The objective is to settle full named open conjectures or prove missing steps connecting them to the archive. Numerical cases, incremental parameter ranges, and renamed known theorems do not constitute additional conjecture solutions.

The accepted top-level result covers the Riemann zeta function and Dirichlet L-functions. It does not automatically supply GRH for arbitrary Hecke or Artin L-functions, independence or simplicity of zeros, central nonvanishing, or pair correlation. Internal arithmetic theorems retain their stated hypotheses.

## Main analytic result

The complete written argument in [Fujii's conjecture](fujii.md), checked in three independent reviews, proves under beta GRH that there is A>0 such that, for every fixed alpha>A,

~~~math
S_\alpha(x)=\sum_{p>2}\chi_4(p)e^{-(p/x)^\alpha}
\quad\text{satisfies}\quad
\limsup_{x\to\infty}S_\alpha(x)=+\infty,\qquad
\liminf_{x\to\infty}S_\alpha(x)=-\infty.
~~~

This contradicts the all-positive-alpha extension under the accepted beta GRH input. It is a statement about every sufficiently large fixed exponent, not a numerical extension of the previously admissible range. No linear independence or simple-zero assumption is used.

The proof combines an absolutely convergent almost-periodic zero series, a distributional limit to the sharp prime-race expression, Hardy–Littlewood oscillation, and recurrence. A separate convolution proof removes an initially unnecessary zeta-RH assumption. Direct retrieval of Fujii's 1988 text remains blocked; Suzuki 2012, corrected Suzuki 2025, and the comparative-prime-number bibliography independently record the exact all-alpha conjecture. Searches found no prior full disproof, but priority is unclaimed. The result remains in the research lane while its status is assessed.

The [Gamma-power clause](fujii-gamma-power.md) has a separate complete proof: for every integer k>=1, the unweighted prime sum with Mellin weight Gamma(s)^k tends to minus infinity if and only if beta GRH holds. The proof uses the classical k=1 Chebyshev theorem, positive Mellin convolution, and Landau's theorem. It is not counted as another named conjecture.

## Notes and exact status

| Named target or source application | Recorded outcome | Note |
|---|---|---|
| Fujii's conjecture | Complete reviewed proof of large-alpha oscillation under beta GRH; original-paper retrieval and priority remain provenance limits | [Main proof](fujii.md) |
| Fujii's conjecture, Gamma-power clause | Complete equivalence for the entire integer-k family by classical positive convolution and Landau; no priority claim | [Gamma-power proof](fujii-gamma-power.md) |
| Lindelöf hypothesis | Full standard implication from the accepted RH/Dirichlet GRH; classical attribution retained | [Dirichlet applications](dirichlet-applications.md) |
| Simm–Wei conjecture | Accepted RH gives Lindelöf, which supplies the hypothesis of the cited 2026 conditional moment theorem; normalized complex limit and coefficient zeros are handled explicitly | [Simm–Wei](simm-wei.md) |
| Chebyshev's conjecture | Original Abel-weighted assertion follows by the classical equivalence with beta GRH | [Chebyshev](chebyshev.md) |
| Chowla's conjecture | Unresolved. A complete Montgomery-error-to-least-prime implication is written; the necessary cross-character cancellation is not supplied by GRH alone | [Chowla](chowla.md) |
| Vandiver's conjecture | Unresolved. Archive bounds give a global polynomial bound for log torsion in K_m(Z), plus a first-order twisted-Selmer bridge; neither forces vanishing | [Vandiver and arithmetic extraction](vandiver.md) |
| Greenberg's conjecture | Unresolved. An explicit Iwasawa-module model proves that polynomial specialization bounds alone do not force lambda=0 | [Arithmetic extraction](vandiver.md) |
| Artin's primitive-root density conjecture | Unresolved. CM auxiliary extension and corrected trace-counting lemmas are proved; Hecke/Kummer analytic transfer remains missing | [Artin and nonabelian transfer](artin-density.md) |
| Other named candidates | Prior resolutions and missing hypotheses are recorded before further work; includes the correction of an earlier RecAt source-reading error | [Screening and source audit](analytic-applications.md) |

### Independent Fujii reviews

- [Convolution and logical review](fujii-review.md): a second proof of the prime-sum normalization under beta GRH alone, quantifier checks, and primary-source/prior-art coverage.
- [Mellin review](fujii-mellin-review.md): the compact-to-Schwartz cutoff limit, uniform Fourier error, square term, and sum over all zeros.
- [Distribution and recurrence review](fujii-review-distribution.md): domination uniform in alpha, positive-test transfer, finite-torus recurrence, and stronger profile extrema.

## Arithmetic results extracted so far

The accepted weighted cohomology bound gives constants C,B independent of m with

~~~math
\log |K_m(\mathbb Z)_{\mathrm{tors}}|\le C(m+1)^B
\qquad(m\ge1).
~~~

The new use of the source is the difficult K_(4n) contribution; other residue classes use previously known torsion formulas. This is not a proof of Vandiver's conjecture or of the full number-field form of Soulé's conjecture.

For imaginary-quadratic class-character twists, the correct polarized diagonal is

~~~math
\operatorname{diag}(\epsilon^e\psi,\,1,\,\epsilon^{-e}\psi).
~~~

Its negative-simple-root adjoint plane is an induced representation, so Shapiro gives a first-order Selmer-to-deformation map with the required local conditions. The corrected trace family also admits an integral nonzero norm bound using purity. These are actual proved intermediate statements. A finite torsion tangent space does not by itself produce a characteristic-zero automorphic point; that remaining step is being investigated directly.

## Work allocation

| Worker | Current responsibility | Owned paths |
|---|---|---|
| Root | Fujii synthesis, full named analytic targets, independent review and campaign index | this file, fujii.md, analytic-applications.md |
| dirichlet_applications | Fujii complementary Landau case, conditional analytic consequences, exact prior art | dirichlet-applications.md, simm-wei.md, chebyshev.md, chowla.md, fujii-review.md |
| arithmetic_extraction | Arithmetic specialization and Selmer-to-characteristic-zero transfer | vandiver.md, fujii-mellin-review.md, fujii-gamma-power.md |
| nonabelian_transfer | Corrected polarized trace families, deep class-character rigidity, Hecke transfer | artin-density.md, fujii-review-distribution.md |

Workers commit substantive proofs, source traces, or obstructions to main on disjoint paths and coordinate through issues. Other active research campaigns are independent of this lane.

## Claim discipline and continuation

A known implication from an accepted theorem is available for use, but its original authors retain credit. A proposed new application is distinguished from a previously published theorem and from an unresolved bridge. Failure to find a prior paper is not proof of priority.

The completed written mathematics and the historical status of a named conjecture are tracked separately. No unqualified new-solution tally is being inferred from the number of notes, parameter values, or agent reviews. The research objective remains active.
