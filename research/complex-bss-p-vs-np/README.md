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

## Continued extraction and quantifier work

[DIRECTIONAL_COFACTOR_LOG_JETS.md](DIRECTIONAL_COFACTOR_LOG_JETS.md) recovers bounded jets of a target logarithmic derivative from a small multiple when the extraneous cofactor has few distinct roots in one scaling parameter. Individual cofactor-root branches are handled by the singular-witness jet lemma, with no total-degree or multiplicity bound. Scaling the coefficients of one BCJS grid triangle preserves a hard degree-m-squared character component of the resultant's logarithm. Consequently a polynomial-size resultant multiple would need superpolynomially many distinct cofactor roots along every such tagged scaling. Cofactors homogeneous in a tagged set are excluded, even with arbitrary dependence on all other coefficients. A short cofactor with exponentially many directional roots records why this does not control arbitrary multiples. [Independent review](DIRECTIONAL_COFACTOR_REVIEW.md).

[RADICAL_COFACTOR_JETS.md](RADICAL_COFACTOR_JETS.md) gives a different bound controlled by the total degree of the squarefree extraneous cofactor. Approximate extraction of those factors and finite logarithms remove arbitrary multiplicities. The degree of the resultant itself does not enter this extraction. [Review](RADICAL_COFACTOR_REVIEW.md).

[UNIVERSAL_CERTIFICATES.md](UNIVERSAL_CERTIFICATES.md) proves polynomial equivalence between resultant exclusion complexity and charged rational Nullstellensatz certificates for a universal affine chart. Shared divided differences give a certificate from every nonzero multiple without inspecting its cofactor; clearing parameter-only denominators gives the converse using density of the projective chart. A permanent coefficient inserted into a short syzygy of the fixed linear system z,1-z shows that coordinatewise finite-part extraction is not a free certificate-normalization operation. Specialization is only used when its parameter denominators remain defined. The Boolean inverse work in campaign #260 is credited. [Review](UNIVERSAL_CERTIFICATES_REVIEW.md).

[TREE_KKT_FINITE_PREFIX_EXTENSION.md](TREE_KKT_FINITE_PREFIX_EXTENSION.md) extends whole-block multiplier compression to a finite witness tree. The border bound grows as a fixed polynomial resource bound raised to O(k), where k is the number of finite-universal stages. Under the imported permanent bound, this excludes polynomial-resource presentations with k=o((log m)^(1/3)). [CONTINUOUS_NONDENSE_FIBER_SAMPLING.md](CONTINUOUS_NONDENSE_FIBER_SAMPLING.md) supplies polynomially many fixed generic tests for a continuous universal block when every nonfull fiber is nondense; closed projective witness images satisfy that condition. An exact moving-hole graph and its failed projective compactification show why arbitrary affine witnesses are outside this conversion. [Both reviews](RECURSIVE_AND_SAMPLING_REVIEW.md).

These are continued restrictions on the missing bridge. A general HN branch still gives no bound on the cofactor parameters above, and a general complex universal block can have dense proper fibers. No target separation follows from these notes.

## Continuous finite fibers and pole extraction

[SKEW_PRODUCT_MOVING_FIBER_ATTEMPT.md](SKEW_PRODUCT_MOVING_FIBER_ATTEMPT.md) gives an explicit uniform three-block verifier for a cyclic finite-fiber certificate. A short Ryser observable defines the map `(t,g) -> (zeta*t,g+H_X(t)-y/2^m)`. A nonempty finite root fiber transported around the full orbit forces `y=per_m(X)`. Interpolation proves completeness with an exponential-size certificate. The polynomial certificate-size assertion needed for a fixed-level hierarchy upper bound remains unproved. The [independent review](SKEW_PRODUCT_REVIEW.md) checks soundness on arbitrary complex matrices and the uniform use of a quantified primitive root.

The candidate has strict restrictions. Polynomial fiber degree, squarefree fibers, and proportional transported multiplicities reduce to finite Boolean challenges and are excluded by the earlier critical-point theorem. The [distinct-root support argument](SKEW_POLYNOMIAL_SUPPORT_EXCLUSION.md) also excludes polynomially many distinct roots with arbitrary multiplicities. It gives the local root and binary-multiplicity witnesses, a fixed generic identity-testing tuple, and explicit gate counts. A successful family within this schema must therefore use superpolynomial root support with nonproportional multiplicity changes; no such polynomial-size complete family has been constructed.

[MOVING_ALGEBRAIC_CHALLENGES.md](MOVING_ALGEBRAIC_CHALLENGES.md) converts a finite algebraic challenge family into the reviewed block incidence when a finite etale open meets a dense set of correct certificates. Collision and escape examples show why this admissibility condition is necessary for that conversion. An additional moving-square-root example defeats every finite list of rationally computed challenges on a generic branch. [Independent review](MOVING_CHALLENGES_REVIEW.md). The [geometric stress tests](GEOMETRIC_STRESS_TESTS.md) separately recheck the earlier component and fixed-neighborhood hypotheses.

Two exact counterexamples constrain the cofactor route. [RELATIVE_INVARIANT_CANCELLATION.md](RELATIVE_INVARIANT_CANCELLATION.md) gives a relative-invariant multiple of the three-quadric resultant whose first balanced logarithmic coefficient vanishes, and extends the cancellation to any prescribed finite jet. It does not supply an easy multiple of a growing resultant. [RECIPROCAL_POLE_CLUSTER_OBSTRUCTION.md](RECIPROCAL_POLE_CLUSTER_OBSTRUCTION.md) gives a short irreducible denominator with numerator one for which the first reciprocal trace of the finite pole cluster has a permanent coefficient, while the reciprocal trace over all roots is zero. The escaping cluster carries the opposite first-order term. Its [review](RECIPROCAL_POLE_CLUSTER_REVIEW.md) preserves the distinction between selecting an analytic cluster and extracting the entire reduced denominator.

The full HN separation, polynomial-size completeness of the continuous certificate, and unrestricted resultant extraction remain research questions in this campaign.

## Full branch saturation and algebraic-fiber continuation

[SATURATED_PATH_RADICAL_JETS.md](SATURATED_PATH_RADICAL_JETS.md) uses every equality and nonzero condition on a generic accepting branch. If its zero-test numerators are `F_i` and its nonzero conditions have product `G`, then the radical of the saturated ideal is exactly the irreducible resultant ideal. Two independent generic linear combinations `U,V` give the exact identity

```math
\frac{\mathop{\mathrm{rad}}(GU)\mathop{\mathrm{rad}}(GV)}
{\mathop{\mathrm{rad}}(GUV)\mathop{\mathrm{rad}}(G)}=cR.
```

Polynomial border bounds for normalized low-order jets of these radicals would finish the separation. That degree-independent radical-jet bound is unproved. The note distinguishes it from the proved factor theorem and Dutta--Saxena--Sinhababu's Radical Conjecture. It also gives exact failures of recovering radical jets from bounded input jets and of assuming polynomially many multiplicity classes. [Branch review](SATURATED_PATH_AND_MULTIPLICITY_REVIEW.md) and [stress-test review](RADICAL_JET_TESTS_REVIEW.md). The separate [signed-multiplicity map](SIGNED_MULTIPLICITY_RATIONAL_MAP.md) uses only two derivatives, but its cleared graph has an exponentially thick spurious vertical component; no short regular-value certificate is supplied.

[ORBIT_PRODUCT_COMPRESSION_ATTEMPT.md](ORBIT_PRODUCT_COMPRESSION_ATTEMPT.md) constructs finite fibers with exponential generic support and changing multiplicities, then proves that their rational invariance identity rules out polynomial-size completeness. The obstruction also covers any complete short nonconstant rational-invariant family. It preserves the actual cost of substituted circuit copies and the failure of separately quantified local orbit values. [Review](ORBIT_PRODUCT_REVIEW.md).

[AUXILIARY_FINITE_FIBER_ATTEMPT.md](AUXILIARY_FINITE_FIBER_ATTEMPT.md) supplies an alternative three-block verifier using monic triangular incidence systems. Their fibers remain finite and nonempty at every parameter, including collisions. Bounded-depth, bounded-degree systems and bounded-depth Kummer towers reduce to the excluded finite-choice prefixes; the root lists precede their universal labels, and all coordinates and operations are counted. Polynomial-size completeness for deeper or coupled finite systems remains unproved. [Review](AUXILIARY_FINITE_FIBER_REVIEW.md).

## Marked multiplicities, regular values, and the socle

[MULTIPLICITY_MARKER.md](MULTIPLICITY_MARKER.md) packs every equality and exclusion multiplicity of a saturated accepting path into one polynomial. Base expansion makes the resultant its unique irreducible factor of a specified multiplicity. The polynomial has a charged polynomial-size circuit, and the marker has polynomial binary length. This is a factor-selection reduction; no circuit for the selected factor is supplied. [Review](MULTIPLICITY_MARKER_REVIEW.md).

[RESIDUE_RESOLVENT_FRONTIER.md](RESIDUE_RESOLVENT_FRONTIER.md) gives two exact aggregate formulas for that marked factor. A deformed resultant ratio has a trailing coefficient equal to a scalar times its marked power. A short differential rational expression has a Hermite proper rational part equal to a positive integer times its logarithmic derivative. Either a suitable polynomial circuit bound would recover the required bounded resultant jets. The conventional determinant ranks and Hermite coefficient arrays still depend on exponential degrees. Testing resultant vanishing with HN does not evaluate either aggregate, so the needed bounds remain unproved.

For a nonlinear marked factor, a generic direction makes that integer exactly one; the proof uses the nonzero second fundamental form of a nonlinear irreducible hypersurface. [First review](RESIDUE_RESOLVENT_REVIEW.md) · [Second review, including this refinement](RESIDUE_RESOLVENT_SECOND_REVIEW.md). An unrestricted Hermite bound is now excluded: [HERMITE_PART_OBSTRUCTION.md](HERMITE_PART_OBSTRUCTION.md) gives a short proper rational input with only simple and double poles whose Hermite rational part specializes to the permanent. Its varying double-pole coefficients distinguish it from the marked-factor family, whose coefficients are constant. [Review](HERMITE_PART_REVIEW.md).

[REGULARITY_CERTIFICATE_ATTEMPTS.md](REGULARITY_CERTIFICATE_ATTEMPTS.md) preserves exact failures of pointwise quotient witnesses, bounded derivative jets, and gatewise initial-form certificates. It gives a sound two-variable, three-polynomial approximate-image formulation for a univariate regular value, and proves why symbolic transfer of an HN machine to an algebraically closed series field supplies no valuation-ring predicate. [Review](REGULARITY_ATTEMPTS_REVIEW.md). The [direct regular-value obstruction](REGULAR_VALUE_GRAPH_OBSTRUCTION.md) proves that polynomial-resource arithmetic decision trees augmented with regular-value tests still cannot accept a dense sound subset of the permanent graph under the imported lower bound. A generic truth change exposes a border-small initial coefficient, not an arbitrary interior coefficient. Independently quantified query parameters are outside this statement. [Review](REGULAR_VALUE_GRAPH_REVIEW.md).

The separate [existential regularity extension](EXISTENTIAL_REGULARITY_SAMPLING_EXTENSION.md) includes those independently quantified parameters for real-coefficient targets such as permanent. Polynomially many fixed samples control the coefficient norm on the projective closure of a rescaled circuit family, independently of its degree. Scaled inequalities then enforce exact orders in bounded moving-witness limits. A local guard-preserving ball and explicit normalized critical equations give the polynomial border bound. The theorem excludes this larger certificate class; it does not place regularity in the complex polynomial hierarchy or provide an HN algorithm for it. [Full independent review](EXISTENTIAL_REGULARITY_EXTENSION_REVIEW.md).

[SQUARE_ZERO_SOCLE_AND_DEFORMATION.md](SQUARE_ZERO_SOCLE_AND_DEFORMATION.md) represents the permanent as a socle coefficient in the algebra with relations `z_i^2=0`. Every faithful socle-detecting module has dimension at least `2^m`, and every map to a one-variable truncated jet algebra kills the socle for `m>=2`. A coupled reduced quadratic deformation gives an explicit sound second-level predicate. Its all-input completeness fails on a displayed example, and the moving-finite-challenge theorem excludes generic completeness for all sufficiently large dimensions. The degree-two generic example is retained to delimit that asymptotic claim. [Review](SQUARE_ZERO_DEFORMATION_REVIEW.md).

[SOFT_TRANSITION_ORDER_JUMPS.md](SOFT_TRANSITION_ORDER_JUMPS.md) checks a complete constant-size BSS program, including all rejecting paths. Direct rational smoothing introduces false pole components and different deformation orders on false inputs; fixed hierarchical scales do not repair that normalization. This counterexample does not exclude other uses of the full machine. [Review](SOFT_TRANSITION_REVIEW.md).

The remaining target is unchanged: no polynomial-resource hierarchy formula or unrestricted resultant-multiple extraction has been proved, and no separation is claimed.

## Earlier research notes

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

## Generic challenges and rational exactness

[GENERIC_QUANTIFIER_SUMCHECK_AUDIT.md](GENERIC_QUANTIFIER_SUMCHECK_AUDIT.md) converts each generic complex challenge block into one finite challenge block, using one common sample list for every original prefix. The compiled verifier has polynomial resources along each path and retains the original adaptive depth. The reviewed tree bound then excludes polynomial-resource permanent verifiers with h=o((log m)^(1/3)) generic rounds. A separate uniform construction under an HN hypothesis has cost N^{O(h+1)} for h rounds. Neither conversion shortens the m-round Ryser protocol. The note keeps the cutting theorem's weighted outer sum, input-size conditions and contracting-field hypothesis, and gives exact cancellation and reordered-message counterexamples. [Independent review](GENERIC_QUANTIFIER_REVIEW.md).

[RATIONAL_EXACTNESS_BARRIER.md](RATIONAL_EXACTNESS_BARRIER.md) gives a uniform O(m^2)-size Laurent polynomial whose rational primitive exists exactly when y equals the permanent of X. The only obstruction is its residue at zero. A parameter-uniform finite identity test turns a bounded primitive-circuit certificate into a small actual existential graph incidence, with every original division guarded. The reviewed graph theorem therefore gives a superpolynomial primitive-circuit lower bound on a nonempty Zariski-open set of true numerical instances, even allowing arbitrary complex constants. This rules out general short-primitive completeness; it does not rule out a special algorithm for the marked constant-residue Hermite family. The auxiliary exactness problem is outside nonuniform NP_C under the standing lower bound, but is not shown to lie in any fixed uniform complex hierarchy. [Independent review](RATIONAL_EXACTNESS_REVIEW.md).

## Complete partitions, stable rewrites, and implicit linear algebra

[FULL_PARTITION_CERTIFICATE_ATTEMPT.md](FULL_PARTITION_CERTIFICATE_ATTEMPT.md) proves that two supplied Hilbert certificates on the zero and nonzero sides of a branch can be glued with degree-independent polynomial circuit overhead. Correctness of a decider has not supplied those certificates or controlled a full tree's composition. An explicit globally correct uniform machine has exponentially many central re-entry paths from one generic perturbed path. [Review](FULL_PARTITION_REVIEW.md).

[TRANSCRIPT_ESCAPE_EXAMPLE.md](TRANSCRIPT_ESCAPE_EXAMPLE.md) gives an exact small total tableau with one transcript per input and actual projective infinity points over false inputs. A proper closed tableau with a uniquely determined Boolean output on every fiber of an irreducible base must have constant output. Thus totality alone cannot supply the compactness needed for a normalization. [Review](TRANSCRIPT_ESCAPE_REVIEW.md).

[STABLE_REWRITE_FRONTIER.md](STABLE_REWRITE_FRONTIER.md) gives an exact solution-preserving padding family, a globally correct wrapper retaining the old branch cofactor, and a polynomial-size involutive row normalization from a supplied unit-ideal certificate. Its parameter denominator vanishes on the target resultant; it does not extend the normalization to the accepting hypersurface. The generic rewrite lemma includes an explicit small guard meeting that hypersurface. [Review](STABLE_REWRITE_REVIEW.md).

[IMPLICIT_SYLVESTER_FRONTIER.md](IMPLICIT_SYLVESTER_FRONTIER.md) supplies a short common-root nullvector, but distinguishes it from the primitive kernel generator and whole-factor reciprocal trace. The constant-double-pole Hermite part is an exact quotient of two polynomial gcds, including unreduced input fractions. A general compressed matrix can have the fixed kernel Ce_0 exactly on the permanent graph. More specifically, the canonical modular inverse of a short polynomial modulo t^{2^m}-z has a low-order Taylor jet containing permanent. These exclude uncharged general implicit-action and inverse operations; they do not prove a lower bound for the required marked gcd jets. [Review](IMPLICIT_SYLVESTER_REVIEW.md).

## Partial compiler for weighted cuts

[CUTTING_COMPILER_ATTEMPT.md](CUTTING_COMPILER_ATTEMPT.md) constructs a charged weighted program for a multilinear word extension, a parsimonious terminal sumcheck kernel with constant individual degree under a fixed finite transition-weight alphabet, and sparse postponement indexed by the names used in one run. Each identity holds for arbitrary complex scalar values. It does not turn a weighted value into an existential support test.

The [independent review](CUTTING_COMPILER_REVIEW.md) found an omitted finite-slot cost and checked the repaired conditional recurrence. With that cost included, the proposed recurrence would admit O((log tau)^(5/4)) scalar stages. The actual recursive compiler is unproved: opaque piece values do not meet the plain-program interface, inherited sparse inputs can violate the next cut's input bound, and protecting a tensor does not remove its local sum. The contracting-field hypothesis remains explicit. Finite expansion with only existential leaves would already give forbidden small graph certificates without assuming P_C=NP_C; a conditional separation must use that hypothesis in a substantive additional step.

The [finite exact checker](verify_branch_and_operator_identities.py) checks the stated branch-gluing, stable-matrix, escaping-tableau, small digit, double-pole gcd, compressed-operator, inverse-jet and local cutting identities. It does not verify the general lower bounds or supply the missing compiler.

## Supplied exclusions and counting oracles

[SUPPLIED_EXCLUSION_SIMPLE_POLES.md](SUPPLIED_EXCLUSION_SIMPLE_POLES.md) uses the actual exclusion polynomial G in a one-equality saturated path: G times the logarithmic derivative of P removes every extraneous pole. The remaining term is a polynomial remainder whose values at squarefree exclusion roots are integer multiplicities times G prime. A supplied small complete factor list of G gives a full normalized-jet extraction, with cost polynomial in its charged size and the requested jet order; irreducible G is a complete special case. The general factor list and special integer-valued remainder remain unproved operations. [Independent review](SUPPLIED_EXCLUSION_REVIEW.md).

[COUNTING_ORACLES_AND_CYCLIC_TRACE.md](COUNTING_ORACLES_AND_CYCLIC_TRACE.md) proves that a T-step complex BSS machine with arbitrary countable-range oracles, outputting a degree-d polynomial on an open set, gives an ordinary nonuniform arithmetic circuit of size O((T+n+1)(d+1)^2). A uniform cyclic fiber with a short observable has weighted trace z times the permanent, although its unweighted count and topological invariants are independent of the matrix. Even free integer-valued counting oracles therefore do not supply that weighted value. This is a value-output statement, not a graph-decision lower bound for oracle machines. The source audit keeps the dimension, counting and compact Toda implications in their proved directions. [Independent review](COUNTING_ORACLES_REVIEW.md).

## Coordination

The campaign uses root and three concurrent workers. Assignments rotate among model and source audit, graph hardness, weighted protocols, incidence geometry, cofactor extraction, and adversarial review. Reusable statements and failed implications are recorded in the issue and committed at mathematical milestones. Review branches are temporary and target `main`, following the owner's explicit instruction for this task. Durable research stays on `main`; the solved-results table is unchanged.
