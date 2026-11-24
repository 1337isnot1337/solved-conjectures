# P_C versus NP_C over the complex numbers

Status: open research. No proof that HN_C is outside P_C is claimed.

Tracking: [issue #248](https://github.com/1337isnot1337/solved-conjectures/issues/248).

## Exact objective

Prove that one deterministic uniform Blum–Shub–Smale machine over the complex numbers cannot decide feasibility of arbitrary finite polynomial systems in time polynomial in the encoded input length. The model permits an arbitrary finite list of complex machine constants, arithmetic, division where defined, and equality branches. This is the standard separation P_C != NP_C, rather than a constant-free or restricted-input variant.

The [model and encoding](MODEL.md) fix the quantifiers and explain the equivalent quadratic-system encoding.

## Established implication and missing bridge

The [graph-hardness audit](GRAPH_HARDNESS.md) checks the [canonical proof](../bss-permanent-graph/PROOF.md), which reconstructs a consequence of Bürgisser's 2004 paper, in its corrected 2018 version, and the imported Anthropic border lower bound pinned below. It includes division handling, arbitrary complex constants, and compatibility of the two approximation conventions:

```math
\text{polynomial-time membership in }G_m
\ \Longrightarrow\
\underline L(\mathop{\mathrm{per}}_m)=m^{O(1)},
\qquad
G_m=\{(X,y):y=\mathop{\mathrm{per}}_m(X)\}.
```

Thus the imported border lower bound excludes polynomial-time graph membership, even for nonuniform algebraic computation trees. This implication is an existing-theorem consequence, not an original solution of the BSS problem.

The missing bridge remains a definition of the permanent graph in a fixed level of the complex polynomial hierarchy, a sufficiently efficient construction with slowly growing alternation, or a complexity-preserving recovery of a permanent polynomial from every nonzero multiple of the relevant high-degree resultant. Choosing a matching verifies one term, not their sum. A hard coefficient of a resultant is not automatically a boundary component.

## Existential graph and boundary obstructions

The following written implications have passed independent internal mathematical reviews. They use arbitrary complex constants, so their circuit conclusions are nonuniform. No novelty or formal-verification claim is made.

- [SINGULAR_WITNESS.md](SINGULAR_WITNESS.md) proves that a polynomial-degree graph obtained as the image closure of a component of a small existential incidence has polynomial border complexity. Singular equations and positive-dimensional witness fibers are allowed. Fixed-order jets of algebraic local branches have the same bound, independently of elimination degree and multiplicity.
- [DENSE_BOUNDARY_BARRIER.md](DENSE_BOUNDARY_BARRIER.md) proves the corresponding bound when a dense existential image generically omits the graph. Its compactification is used only for existence; the circuit uses the original small affine equations. It also treats omitted algebraic branches and their graph-factor limits.
- [HYPERSURFACE_DEGENERATION.md](HYPERSURFACE_DEGENERATION.md) proves that a low-degree polynomial graph factor in a limit of polynomial-size existential hypersurfaces already has a polynomial border circuit. This excludes the proposed positive resultant initial-factor route under the imported permanent lower bound.
- [INFINITY_BOUNDARY.md](INFINITY_BOUNDARY.md) gives explicit quadratic systems showing why naive homogenization and a polynomial bound on dense jet length are invalid. It explains how the dense-boundary proof avoids those failures.

Consequently the imported lower bound and these reviewed implications put the permanent graph outside both nonuniform NP_C and nonuniform coNP_C. This does not separate P_C from NP_C: it gives no language in NP_C outside P_C. The fixed-level hierarchy route must use a higher level, and the high-degree resultant route needs a different extraction from arbitrary multiples. The six-resultant existential incidence and the stated initial-factor degeneration are now excluded hypotheses, rather than constructions awaiting witness equations.

## Boolean-sum certificate obstruction

[BOOLEAN_POTENTIALS.md](BOOLEAN_POTENTIALS.md) gives a sound and unrestrictedly complete divergence certificate on the Boolean cube. It would yield a uniform second-level hierarchy formula if every true numerical permanent instance had polynomial-size potential circuits. [CRITICAL_INCIDENCE_BARRIER.md](CRITICAL_INCIDENCE_BARRIER.md) now excludes that size hypothesis under the imported border lower bound, even with arbitrary instance-dependent complex constants and unrestricted nonlinear circuit parameters.

The proof uses the identity that the sum of the verification residuals is per(X)-y. A polynomial number of their gradients span the normalized output covector. Selected residual and derivative equations define a small critical incidence; on every component its projected differential rank is at most the input dimension. One component projects densely to the permanent graph, so the singular-witness theorem applies. The worst-case potential-circuit size is at least exp(Omega((log m)^(4/3))). For every smaller asymptotic budget allowed by the proof, a nonempty Zariski-open set of matrices requires larger certificates. The [independent internal reviews](CRITICAL_REVIEW.md) check this component argument and the distinction between ideal membership and radical membership.

This is a lower bound for the specified certificate scheme, not HN_C hardness. An arbitrary higher-level formula need not have the conservation identity used in this proof. No replacement fixed-level formula or all-multiple resultant extraction has been established.

Restricted constructions and failed attacks are retained with their exact scope:

- [BOOLEAN_POTENTIAL_RESULTS.md](BOOLEAN_POTENTIAL_RESULTS.md) constructs small certificates for fixed-rank matrices, proves the one-variable Boolean quotient recurrence, and gives actual false residuals missed by every fixed proper subset of cube tests.
- [GRADIENT_FLOW_ATTEMPT.md](GRADIENT_FLOW_ATTEMPT.md) gives an explicit invertible seven-by-seven counterexample to the complete first-derivative/adjugate ansatz, certified by a nonzero modular augmented minor.
- [CANONICAL_POTENTIAL_OBSTRUCTIONS.md](CANONICAL_POTENTIAL_OBSTRUCTIONS.md), [POTENTIAL_CONSTRUCTOR_BARRIER.md](POTENTIAL_CONSTRUCTOR_BARRIER.md), [LINEAR_POTENTIAL_TEMPLATE_BARRIER.md](LINEAR_POTENTIAL_TEMPLATE_BARRIER.md), and [BOUNDED_PARAMETER_TEMPLATE_BARRIER.md](BOUNDED_PARAMETER_TEMPLATE_BARRIER.md) preserve the earlier narrower reductions. They are not needed for the full critical-incidence obstruction.
- [IDENTITY_CERTIFICATE_BARRIER.md](IDENTITY_CERTIFICATE_BARRIER.md), [NONLINEAR_BOOLEAN_COMPONENT.md](NONLINEAR_BOOLEAN_COMPONENT.md), and [TRACE_REPRESENTATION_BARRIERS.md](TRACE_REPRESENTATION_BARRIERS.md) separate full complex identities, Boolean testing, equation-subset compression, and matrix-algebra encodings.

## Exclusion-complexity reduction and zero-testing

The [resultant exclusion-complexity note](RESULTANT_EXCLUSION.md) gives a sufficient all-multiple lower-bound target for the nonuniform complex BSS separation, explains the exponential-degree obstacle in the known factor theorem, and proves an elementary irreducibility lemma leading to a conditional superpolynomial bound for deciding whether the permanent equals zero. These deductions are *not* a proof of the BSS separation.

The [symmetry-orbit jet barrier](SYMMETRY_JET_BARRIER.md) proves that a low-dimensional family of resultant-zero inputs cannot become Zariski dense merely by applying changes of projective coordinates and invertible mixing of equations. Any bounded-order jet method confined to that orbit can be masked by a nonzero cofactor. This is a structural obstruction, not a complexity lower bound.

The [grid Newton-polytope barrier](GRID_NEWTON_BARRIER.md) shows that, after at most one extra padding coordinate, no pure diagonal monomial weighting can isolate the BCJS hard interior coefficient as the full initial coefficient. It uses BCJS's grid congruence and resultant padding identities and includes [finite checks](verify_grid_newton.py). This is not a circuit lower bound.

## Finite Boolean verification and restricted resultant multiples

[REAL_KKT_RADICAL_EXTENSION.md](REAL_KKT_RADICAL_EXTENSION.md) proves a stronger obstruction for real-coefficient target polynomials. A finite family of individually small polynomial equations, with polynomially many existential parameters and an actual component projecting to a low-degree graph, gives polynomial border complexity. The number of equations is not charged to this bound. The proof uses real compact optimization only to select a small complex critical incidence; it does not add real comparisons to a BSS verifier.

Consequently the permanent graph has no polynomial-size presentation consisting of complex existential witnesses, a finite Boolean universal block, and a deterministic polynomial-time complex BSS predicate, even with branching and defined division. The proof includes radical-only equations and inequations on accepting paths. The [block critical-point extension](BLOCK_KKT_FINITE_EXISTENTIAL_EXTENSION.md) also excludes a local complex existential block after each Boolean challenge. Separate compact balls and selection of whole multiplier blocks keep the final witness dimension polynomial. Arbitrary complex universal blocks remain outside both proofs. [Detailed internal review](REAL_KKT_REVIEW.md) · [Second independent review](REAL_KKT_INDEPENDENT_REVIEW.md) · [Block review](BLOCK_KKT_REVIEW.md). The [cutoff counterexample](CONTINUOUS_QUANTIFIER_CUTOFF_FAILURE.md) records an exact failure of a proposed continuous-quantifier shortcut.

[COMPOSITION_MULTIPLES.md](COMPOSITION_MULTIPLES.md) proves that every nonconstant univariate composition of the quadratic resultant, including all its nonzero powers and all multiples R q(R), has the imported superpolynomial circuit lower bound. Neither the degree nor the circuit complexity of q is bounded. Nearby regular-center inverse Taylor series recover bounded jets of R from a small circuit for the composition.

[FEW_PARAMETER_COFACTORS.md](FEW_PARAMETER_COFACTORS.md) extends this to nonzero multiples R q(R,h_1,...,h_k), where k is fixed and the h_i have small shared circuits. The explicit bound also rules out polynomial total circuit size when k=o((log N)^(1/3)). Jets are extracted in the full coefficient space before the BCJS specialization: specializing a nonzero multiple first could make it zero. The required representation of a general branch cofactor by few easy polynomial parameters remains unproved. [Review and repaired specialization](RESTRICTED_COFACTOR_REVIEW.md).

[TAGGED_TRACE_OBSTRUCTION.md](TAGGED_TRACE_OBSTRUCTION.md) identifies the remaining conjugate-sum operation in a direct incidence-tagged extraction. It gives a small irreducible annihilator and small observable whose trace specializes to the permanent. This rules out a generic degree-independent trace bound under the imported lower bound, while leaving a resultant-specific reciprocal-trace argument unresolved. [Independent review](TAGGED_TRACE_REVIEW.md).

## Research notes

- [PROTOCOL.md](PROTOCOL.md) gives a sound uniform sum-check formula on all complex matrices, with `2m` alternating blocks, and exact counterexamples to moving all messages or all challenges together. It also proves an obstruction to generic small arithmetic-circuit commitments for adaptive messages and a sound batching lemma with its actual coefficient-volume cost.
- [BOUNDARY_AND_COLLAPSE.md](BOUNDARY_AND_COLLAPSE.md) proves a generic boundary extraction lemma and the sufficient `o(log log m)` alternation criterion. Neither construction needed to apply them has been obtained.
- [INCIDENCE.md](INCIDENCE.md) supplies the quadratic-resultant witness equations, proves a degeneration criterion that survives arbitrary multipliers, and records the jet-masking, matching-norm, and Newton-face obstructions.
- [FILTER_ROUTE.md](FILTER_ROUTE.md) proves that separate resultant root blocks encode products or intersections. It records a six-resultant additive-incidence criterion; the later singular-witness theorem excludes its existential hypothesis under the imported lower bound.
- [REGULAR_WITNESS_BARRIER.md](REGULAR_WITNESS_BARRIER.md) proves that a regular implicit witness system for a low-degree polynomial already gives a small arithmetic circuit. Its singular border-complexity extension is now proved in SINGULAR_WITNESS.md.
- [REVIEW.md](REVIEW.md) separates written proofs, independent internal reviews, exact symbolic checks, and unresolved implications.

The [smooth-certificate barrier](SMOOTH_CERTIFICATE_BARRIER.md) proves that a polynomial graph with a regular, locally determined polynomial-size existential algebraic witness has a polynomial-size arithmetic circuit, by truncated Newton--Hensel lifting. Under the imported permanent hardness, no such certificate can represent the permanent graph. The separately reviewed singular-witness extension above now covers singular presentations for the border-complexity conclusion. [Finite check](verify_smooth_implicit.py).

The [three-evaluation resultant Fourier filter](FOURIER_RESULTANT_FILTER.md) extracts the VNP-hard BCJS grid polynomial as an initial coefficient, establishing quantitative border hardness of the generic quadratic resultant from the imported Anthropic theorem. A linear cofactor with constant term 1 breaks the extraction, so this does not prove exclusion-complexity hardness or the BSS separation. [Finite check](verify_fourier_filter.py).

## Source and verification scope

The [source audit](SOURCE_AUDIT.md) records theorem numbers, version changes, the uniform/nonuniform distinction, and the direction of Bürgisser's Theorem 1.1 versus Conjecture 1.1. The [source manifest](SOURCES.json) records the inspected PDF hashes.

The imported border result is Anthropic / Claude, *VP ≠ VNP over every field*, commit `11b6c7e3c927df2658f513b6b68ea7f8929c62c5`, written Theorem N.5 and Lean `Statement.MainTheoremApprox`. This project has inspected the statement and its proof linkage. It has not rebuilt or independently replayed the upstream Lean development.

No target separation has been formalized in Lean. The exact checks in [verify_obstructions.py](verify_obstructions.py), [verify_boolean_potentials.py](verify_boolean_potentials.py), [verify_canonical_potentials.py](verify_canonical_potentials.py), and [verify_gradient_flow.py](verify_gradient_flow.py) verify only the identities and counterexamples listed in [REVIEW.md](REVIEW.md). They do not verify the target separation.

## Coordination

The campaign uses root and three concurrent workers. Assignments rotate among model and source audit, graph hardness, weighted protocols, incidence geometry, cofactor extraction, and adversarial review. Reusable statements and failed implications are recorded in the issue and committed at mathematical milestones. Review branches are temporary and target `main`, following the owner's explicit instruction for this task. Durable research stays on `main`; the solved-results table is unchanged.
