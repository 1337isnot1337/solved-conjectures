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

## Exclusion-complexity reduction and zero-testing

The [resultant exclusion-complexity note](RESULTANT_EXCLUSION.md) gives a sufficient all-multiple lower-bound target for the nonuniform complex BSS separation, explains the exponential-degree obstacle in the known factor theorem, and proves an elementary irreducibility lemma leading to a conditional superpolynomial bound for deciding whether the permanent equals zero. These deductions are *not* a proof of the BSS separation.

The [symmetry-orbit jet barrier](SYMMETRY_JET_BARRIER.md) proves that a low-dimensional family of resultant-zero inputs cannot become Zariski dense merely by applying changes of projective coordinates and invertible mixing of equations. Any bounded-order jet method confined to that orbit can be masked by a nonzero cofactor. This is a structural obstruction, not a complexity lower bound.

The [grid Newton-polytope barrier](GRID_NEWTON_BARRIER.md) shows that, after at most one extra padding coordinate, no pure diagonal monomial weighting can isolate the BCJS hard interior coefficient as the full initial coefficient. It uses BCJS's grid congruence and resultant padding identities and includes [finite checks](verify_grid_newton.py). This is not a circuit lower bound.

## Research notes

- [PROTOCOL.md](PROTOCOL.md) gives a sound uniform sum-check formula on all complex matrices, with `2m` alternating blocks, and exact counterexamples to moving all messages or all challenges together. It also proves an obstruction to generic small arithmetic-circuit commitments for adaptive messages.
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

No target separation has been formalized in Lean. The exact symbolic checks in [verify_obstructions.py](verify_obstructions.py) verify only the identities and counterexamples listed in [REVIEW.md](REVIEW.md). They do not verify the target separation.

## Coordination

The current research uses four workers: root for model/source audit and integration, a graph-hardness/review worker, a weighted-protocol worker, and an incidence/resultant worker. Reusable statements and failed implications are recorded in the issue and committed at mathematical milestones. Review branches are temporary and target `main`, following the owner's explicit instruction for this task. Durable research stays on `main`; the solved-results table is unchanged.
