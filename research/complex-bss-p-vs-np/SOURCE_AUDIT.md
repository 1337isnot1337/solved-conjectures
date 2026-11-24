# Primary-source and version audit

Audit date: 23 November 2026. Research remains open. This records inspected source statements, not an independent verification of the entire imported developments.

The continuation additionally checked Dutta, Saxena and Sinhababu, *Discovering the roots: Uniform closure results for algebraic classes under factoring*, [author-hosted 2022 manuscript](https://www.cse.iitk.ac.in/users/nitin/papers/factor-closure-jacm.pdf), Theorem 1. Its bound uses the squarefree degree of the remaining factor after an already small supplied factor is removed. Applied directly to a resultant multiple without such a removal, that radical already contains the exponentially high-degree resultant. [RADICAL_COFACTOR_JETS.md](RADICAL_COFACTOR_JETS.md) instead applies the previously cited approximate-factor theorem only to low-degree extraneous factors and recovers bounded target jets by finite logarithms. The new proof does not cite the related theorem as an unrestricted resultant-multiple bound. The inspected source has a 2022 manuscript header and placeholder journal metadata; the note identifies that manuscript rather than inventing a final publication locator.

## Continued primary-source check

The invariant cancellation note uses Domokos, Feher, and Rimanyi, *Equivariant and invariant theory of nets of conics with an application to Thom polynomials*, Journal of Singularities 7 (2013), 1--20, revised 1 January 2013, DOI `10.5427/jsing.2013.7a`. The [published PDF](https://real.mtak.hu/10061/1/domokos-feher-rimanyi.pdf), formula (6), Remark 5.3(i), and Theorem 5.4 supply the degree-six invariant and the invariant-ring generators. The coefficient restriction and arbitrary-jet cancellation in this campaign are calculated in the note; they are finite-dimensional counterexamples to the stated extraction rule, not an asymptotic resultant upper bound.

Grochow and Pitassi, [arXiv:1404.3820v1](https://arxiv.org/pdf/1404.3820v1), Definition C.1, Proposition C.3, and Example C.4 distinguish geometric IPS certificates from arbitrary Nullstellensatz certificates. Their unsatisfiable system `xy-1, x^2*y` has zero in the closure of its image and therefore has no geometric certificate of that form. The paper supplies no conversion from an arbitrary BSS feasibility decider to polynomial-size geometric certificates. That conversion is not assumed here.

Burgisser and Cucker, *Counting Complexity Classes for Numeric Computations II: Algebraic and Semialgebraic Sets*, [STOC 2004 extended abstract](https://www3.math.tu-berlin.de/algebra/work/p04-buergisser.pdf), Lemmas 5.5 and 5.7 and Remark 5.6, use real first-order formulas to reason about complex transversality. Remark 5.6 explicitly leaves short complex first-order formulas unclear. Their subsequent algorithm uses generic partial witness sequences and a counting oracle. These statements therefore supply no short complex certificate for the removable value of a rational function at a canceled zero. The current pole route must prove such a certificate separately if it needs one.

The renewed search also checked the recent discrete upper bounds for approximate polynomial satisfiability: Balaji--Shirmohammadi--Tavenas--Worrell, [arXiv:2610.00644v1](https://arxiv.org/pdf/2610.00644v1), Theorem 1, and Andrews--Garg--Oliveira--Schost, [arXiv:2611.05289v1](https://arxiv.org/html/2611.05289v1), Theorem 5.6. Their counting-hierarchy bounds use encoded rational, number-field, or finite-field data and exponential-size circuit constructions. They do not give a deterministic polynomial-time uniform complex BSS algorithm, a fixed-level permanent-graph verifier, or the desired reverse implication of Burgisser's Conjecture 1.1. No new theorem in this campaign imports these upper bounds as a missing reduction.

## 1. Anthropic border lower bound

Source: Anthropic / Claude, *VP ≠ VNP over every field*, pinned repository commit
`11b6c7e3c927df2658f513b6b68ea7f8929c62c5`.

- [Pinned PDF](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/paper.pdf).
- [Statement.lean](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/Statement.lean).
- [Solution.lean](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/Solution.lean).
- [Pinned README](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/README.md).

The written approximate-computation result is Theorem N.5, extending Theorem M.3. Appendix Q maps it to `Paper.thm_approx`; the exported assertion is `Statement.MainTheoremApprox`, proved by `Solution.mainTheoremApprox`. It covers the permanent in characteristic different from two and the Hamiltonian cycle polynomial in every characteristic.

For the permanent over C the bound has the form

```math
\operatorname{size}(C_m)\gt m^{c(\log_2m)^{1/3}}
```

for some c positive and all sufficiently large m. The approximation definition permits arbitrary Laurent-series constants. Intermediate poles are allowed, but the output has no negative-power coefficients and has the desired constant coefficient. This is sufficient for the graph argument; an exact-circuit lower bound alone would not suffice for that use of approximate factoring.

The pinned PDF was downloaded and hashed. Theorem N.5 was visually inspected to preserve its approximation notation. The public Lean statement and proof link were read. The upstream Lean build and kernel replay were not rerun here. The pinned README explicitly describes the artifact as AI-written and says no human mathematician has checked the proof. We import the stated result with that provenance, without claiming additional external review.

The cutting and postponement lemmas must be read with their hypotheses: Theorem J.4 and Lemma K.4 lie in the contracting route. Definition 2.1 and Theorem 2.2 give the contracting-or-flat alternative; the paper explicitly says it does not determine which hypothesis holds even over R. K.4 postpones constant uses in a weighted program. It is not a quantifier-postponement theorem.

## 2. Bürgisser's approximate-factor theorem

Source: Peter Bürgisser, *The Complexity of Factors of Multivariate Polynomials*, [arXiv:1812.06828v1](https://arxiv.org/abs/1812.06828v1), 17 December 2018. The journal paper is *Foundations of Computational Mathematics* 4(4), 369–396 (2004). The arXiv version corrects the statement and proof of Theorem 5.7.

Relevant statements:

| Statement | Use here |
| --- | --- |
| Lemma 1.1 | A graph/hypersurface decision tree exposes a small nonzero multiple of its defining polynomial. |
| Theorem 1.3 | A factor's approximate complexity is polynomial in its degree and the exclusion complexity, independently of its multiplicity. |
| Remark 1.4(1), Corollary 1.5 | Sharper graph-specific decision-to-approximation bound. |
| Definition 2.1 | Approximation over C(epsilon), with output coefficients regular at epsilon=0. |
| Lemma 2.3(1),(3) | Semicontinuity and transitivity of approximate complexity. |
| Proposition 3.4 and Section 3.3 | Local-branch jets and factor reconstruction, including the approximative-input version used in degeneration arguments. |
| Corollary 4.4 | The pre-existing conditional hardness of graphs of VNP-complete polynomial families under a border separation. |

The [graph proof](GRAPH_HARDNESS.md) supplies an explicit division-safe path argument and the conversion to the pinned circuit convention. It is a consequence of these sources. It is not credited as a new solution of an open conjecture.

## 3. Bürgisser 2026: theorem and conjecture have different directions

Source: Peter Bürgisser, *Intractability of Hilbert's Nullstellensatz implies algebraic hardness of permanent*, [arXiv:2606.25121v1](https://arxiv.org/abs/2606.25121v1), submitted 23 June 2026; [v2](https://arxiv.org/abs/2606.25121v2), submitted 19 October 2026. Both versioned PDFs were downloaded and inspected. Theorem 1.1 and Conjecture 1.1 were checked visually in v2.

Theorem 1.1 proves

```math
P^0_{\mathbb C}(\mathrm{nu})\ne NP^0_{\mathbb C}(\mathrm{nu})
\ \Longrightarrow\ VP^0\ne VNP^0,
```

and

```math
P^0_{\mathbb C}\ne NP^0_{\mathbb C}
\ \Longrightarrow\ VP^0(\mathrm u)\ne VNP^0(\mathrm u).
```

Here 0 indicates the constant-free convention, u uniformity, and nu nonuniformity. The paper also records equivalence of the uniform BSS separation with and without arbitrary complex machine constants, using earlier constant-elimination results.

Conjecture 1.1 is

```math
VNP_{\mathbb C}\not\subseteq\overline{VP}_{\mathbb C}
\ \Longrightarrow\ P_{\mathbb C}(\mathrm{nu})\ne NP_{\mathbb C}(\mathrm{nu}).
```

Theorem 1.1 does not prove this reverse implication. In the uniform setting of the present task, even obtaining a corresponding reverse implication only for uniform HN_C would require a new argument. For these particular classes, the conjectured nonuniform separation would imply the uniform target: Section 2.1 gives nonuniform NP_C-completeness of HN_C, so a uniform polynomial-time HN_C decider could be composed with all the nonuniform polynomial reductions and would collapse those nonuniform classes. This is the completeness step that connects the conjecture to the requested uniform conclusion.

In v2, Section 1.4 adds the recent BCJS26 result: polynomial-size circuits for the quadratic multivariate resultant would imply VP_C=VNP_C. It says that extending this to nonzero multiples of that resultant would imply Conjecture 1.1. This is exactly the extra requirement created by a generic BSS branch.

### A corrected hypothesis in v2

In v1, Proposition 3.1 assumes only that the projective zero set of F_1,...,F_n is finite and writes a Poisson product using H(xi)/xi_0^{d_0}. Its proof says a coordinate transformation fixing x_0 can move all those points off x_0=0. Such a transformation preserves that hyperplane, so that statement is insufficient.

For a minimal example, in P^1 take F_1=x_0. Its projective zero set is the single point [0:1], so it is finite, but the displayed denominator is zero there. No invertible linear transformation fixing x_0 moves this point outside x_0=0.

V2 assumes V(F_1,...,F_n) intersect V(x_0) is empty. It then derives finiteness and applies the Poisson formula. All uses in this research must satisfy this corrected hypothesis; finiteness alone is not substituted for it. This correction is not a claimed disproof of Theorem 1.1.

Remark 5.7 in v2 also warns that a relevant resultant's vanishing order in the deformation variable may be exponential. Ordinary coefficient interpolation with a degree bound is not automatically polynomial time. Border trailing-coefficient extraction is a separate operation and does not compute an arbitrary interior coefficient.

## 4. BCJS26 resultant coefficient route

Source: C. S. Bhargav, Radu Curticapean, Gorav Jindal, and Himanshu Shukla, *Multivariate Resultants: Complexity and Applications to Real Feasibility*. [Author-hosted manuscript](https://bhargavcs.github.io/files/resultants-and-etr.pdf), inspected 23 November 2026. The downloaded PDF hash is in SOURCES.json; the hosted manuscript is not identified by a versioned arXiv link in this audit.

Theorem 1.4 concerns polynomial-size circuits for quadratic resultants. Theorems 1.7 and 3.2 and Lemma 3.7 supply a hard coefficient family

```math
\Phi_{N,s}(A)=[z^s]\mathop{\mathrm{Det}}_N(I+zA),
\qquad N=5m^2,\quad s=m^2,
```

using m=3^r+1 in the grid extraction. The constant coefficient is 1. Thus the permanent is recovered from an interior coefficient, rather than directly from a zero-set component or an initial term. The arithmetic-circuit result does not, without a separate argument, apply to an arbitrary nonzero polynomial multiple exposed by a membership decider.

The exact reduction and constructions are recorded in INCIDENCE.md, FOURIER_RESULTANT_FILTER.md, and the restricted-cofactor notes. The latter also check the input-to-grid dimension relation directly in BCJS Lemma 3.3 and Appendix A.1.

## 5. Openness and repository check

Before claiming this target, current AGENTS.md, recent main commits, open PRs, and targeted issue/PR/commit searches for BSS, Nullstellensatz and VP/VNP were checked. No overlapping target was returned by those initial searches. A later permanent search located the concurrent graph-only campaign #247 and PR #249. We posted cross-coordination and use its canonical graph proof, with our independent derivation retained as an audit rather than another standalone result. The discussions landing page was opened but returned an empty/error loading state, so discussion coverage is incomplete. Issue #248 is the coordination record.

Fresh exact-statement searches found the October 2026 paper still labeling the reverse implication a conjecture; no complete proof of the present separation was located. This is a search result, not a proof of exhaustive absence. Known graph hardness, exact coefficient reductions, conditional lemmas, and finite counterexamples are not counted as resolutions of the target.

## Analytic and geometric sources for the existential barriers

The singular-witness and dense-boundary proofs use Oswald Riemenschneider's online Chapter 6, *Dimension and multiplicity*, Theorem 6.22 (printed pages 155–156), and Corollary 6.29 (printed page 160). The former characterizes finite holomorphic map germs by isolated fiber points; the latter gives the covering away from a discriminant and openness. The chapter includes analytic-set sources, as needed for the possibly singular compactified incidence. The hosted chapter is undated; no publication or revision date is inferred. [Inspected primary file](https://www.math.uni-hamburg.de/home/riemenschneider/bookchap06.pdf), consulted 23 November 2026; its digest is in SOURCES.json.

The Stacks Project supplies the background properness and dimension statements: [tag 01WC](https://stacks.math.columbia.edu/tag/01WC), Lemma 29.44.5; [tag 02RK](https://stacks.math.columbia.edu/tag/02RK), Lemma 42.16.1; and [tag 02NV](https://stacks.math.columbia.edu/tag/02NV), Section 29.52. Generic cuts, affine component preservation, and their circuit costs are proved in the research notes. None of these geometric references states the complexity transfer by itself.

The coefficientwise-limit step uses Bürgisser arXiv:1812.06828v1, Theorem 2.4 over C. The new arguments do not assume that an arbitrary pointwise limit of witness values preserves Taylor coefficients: they construct locally uniform holomorphic limits on a fixed polydisc and then use Cauchy's formula.

## Identity certificates and the direction of proof-complexity implications

Grochow and Pitassi, *Circuit Complexity, Proof Complexity and Polynomial Identity Testing*, arXiv:1404.3820v1, 15 April 2014, Definition 1.1 and Theorem 3.1, provide the IPS definition and the implication from superpolynomial Hilbert-like IPS lower bounds for tautologies to VNP != VP. That theorem is not used in the converse direction. The current potential-certificate obstruction has its own critical-incidence proof and does not identify these arbitrary-complex-coefficient systems with propositional CNF refutations. [Primary version](https://arxiv.org/html/1404.3820v1).

Forbes, Shpilka, Tzameret, and Wigderson, *Proof Complexity Lower Bounds from Algebraic Circuit Complexity*, Theory of Computing 17(10), 2021, Section 4.2, printed pages 29–30, explain the permanent obstruction to efficient general multilinearization. Proposition 4.5 gives an efficient conversion for read-once oblivious algebraic branching programs, not for unrestricted circuits. [Primary PDF](https://theoryofcomputing.org/articles/v017a010/v017a010.pdf), [DOI](https://doi.org/10.4086/toc.2021.v017a010). The source's restricted result is not promoted to a general conversion theorem.

The elementary complex hitting-set lemma is proved in IDENTITY_CERTIFICATE_BARRIER.md. Its historical comparison is Heintz–Schnorr Theorem 4.4 as restated in Chatterjee, Kumar, Ramya, Saptharishi, and Tengse, ECCC Report 2020/063, revision 2, Theorem 3.3. No effective finite-grid bound from that paper is needed for the argument here. The primary source records and the fully supplied dimension proof make that distinction explicit. Theorem 3.3 was also checked in the [author-hosted full manuscript](https://www.niser.ac.in/~anamay/assets/docs/papers/AlgNatProofs_full.pdf), printed page 25; the ECCC revision reference is retained separately.

For the generic-matrix consequence of the critical-incidence argument, Chevalley's constructibility theorem is [Stacks tag 054K](https://stacks.math.columbia.edu/tag/054K), Theorem 29.23.3 as consulted on 23 November 2026. Only constructibility of the image of a finite-type complex algebraic variety is used.


## Later finite-residual and restricted-cofactor deductions

REAL_KKT_RADICAL_EXTENSION.md supplies its own proofs of the needed finite active-set regular-value statement, compactness argument, and actual-component specialization. Its short nested-ball argument proves the particular Baire step used. The remaining analytic inputs are the ordinary local implicit/submersion theorem and the previously cited finite-germ and root-cluster transfer. Its use of real optimization is an existence proof for a small complex incidence, with a real-coefficient target polynomial. It is not a theorem asserting that arbitrary complex quantifiers can be made Boolean.

The two restricted-cofactor notes use local analytic inversion and finitely many Taylor coefficients as permitted nonuniform constants. Their coefficientwise limits use Bürgisser 1812.06828v1, Theorem 2.4. The BCJS dimension relation was checked directly in Lemma 3.3 and Appendix A.1: an allowed grid side m represents a permanent of size m-1 by identity padding. The nonzero coefficient factor kappa can be divided out as a scalar arithmetic operation. BCJS Theorem 3.2 instead absorbs that scalar in one extra diagonal entry for a pure projection. No theorem about arbitrary nonzero resultant multiples is imported from either paper.

TAGGED_TRACE_OBSTRUCTION.md proves its digit-polynomial recurrence and free-algebra trace specialization directly. The resultant degree and individual-root incidence are the previously cited standard resultant facts; no general efficient trace theorem is imported. The note explicitly distinguishes arbitrary observables from the reciprocal powers in the unresolved resultant-specific extraction.
