# Primary-source and version audit

Audit date: 23 November 2026. Research remains open. This records inspected source statements, not an independent verification of the entire imported developments.

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

The incidence worker is auditing the exact reduction and constructions. Its conclusions will be recorded with explicit equations rather than treating the abstract alone as sufficient.

## 5. Openness and repository check

Before claiming this target, current AGENTS.md, recent main commits, open PRs, and targeted issue/PR/commit searches for BSS, Nullstellensatz and VP/VNP were checked. No overlapping target was returned by those initial searches. A later permanent search located the concurrent graph-only campaign #247 and PR #249. We posted cross-coordination and use its canonical graph proof, with our independent derivation retained as an audit rather than another standalone result. The discussions landing page was opened but returned an empty/error loading state, so discussion coverage is incomplete. Issue #248 is the coordination record.

Fresh exact-statement searches found the October 2026 paper still labeling the reverse implication a conjecture; no complete proof of the present separation was located. This is a search result, not a proof of exhaustive absence. Known graph hardness, exact coefficient reductions, conditional lemmas, and finite counterexamples are not counted as resolutions of the target.
