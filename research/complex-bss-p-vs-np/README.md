# P_C versus NP_C over the complex numbers

Status: open research. No proof that HN_C is outside P_C is claimed.

Tracking: [issue #248](https://github.com/1337isnot1337/solved-conjectures/issues/248).

## Exact objective

Prove that one deterministic uniform Blum–Shub–Smale machine over the complex numbers cannot decide feasibility of arbitrary finite polynomial systems in time polynomial in the encoded input length. The model permits an arbitrary finite list of complex machine constants, arithmetic, division where defined, and equality branches. This is the standard separation P_C != NP_C, rather than a constant-free or restricted-input variant.

The [model and encoding](MODEL.md) fix the quantifiers and explain the equivalent quadratic-system encoding.

## Established implication and missing bridge

The [graph-hardness proof](GRAPH_HARDNESS.md) reconstructs a consequence of Bürgisser's 2004 paper, in its corrected 2018 version, and the imported Anthropic border lower bound pinned below. It includes division handling, arbitrary complex constants, and compatibility of the two approximation conventions:

```math
\text{polynomial-time membership in }G_m
\ \Longrightarrow\
\underline L(\mathop{\mathrm{per}}_m)=m^{O(1)},
\qquad
G_m=\{(X,y):y=\mathop{\mathrm{per}}_m(X)\}.
```

Thus the imported border lower bound excludes polynomial-time graph membership, even for nonuniform algebraic computation trees. This implication is an existing-theorem consequence, not an original solution of the BSS problem.

What remains to be proved is at least one of the following, with polynomial size and uniformity bounds:

1. A definition of the permanent graph in a fixed level of the complex polynomial hierarchy, or a sufficiently efficient construction with slowly growing alternation.
2. An NP_C incidence problem with a boundary whose branch polynomials yield a low-degree permanent graph factor under a justified projection or degeneration.
3. A complexity-preserving recovery of a hard permanent polynomial from every nonzero multiple of the relevant resultant.

Choosing a matching verifies one term of a permanent. It does not verify their sum. A coefficient of a resultant is not automatically a boundary component. A projection of an algebraic set does not come with a small circuit for its elimination polynomial.

## Source and verification scope

The [source audit](SOURCE_AUDIT.md) records theorem numbers, version changes, the uniform/nonuniform distinction, and the direction of Bürgisser's Theorem 1.1 versus Conjecture 1.1. The [source manifest](SOURCES.json) records the inspected PDF hashes.

The imported border result is Anthropic / Claude, *VP ≠ VNP over every field*, commit `11b6c7e3c927df2658f513b6b68ea7f8929c62c5`, written Theorem N.5 and Lean `Statement.MainTheoremApprox`. This project has inspected the statement and its proof linkage. It has not rebuilt or independently replayed the upstream Lean development.

No target separation has been formalized in Lean. Exact symbolic checks of failed protocols, when added, will verify only their stated identities and counterexamples. They will not be evidence that the target problem is solved.

## Coordination

The current research uses four workers: root for model/source audit and integration, a graph-hardness/review worker, a weighted-protocol worker, and an incidence/resultant worker. Reusable statements and failed implications are recorded in the issue and committed at mathematical milestones. Review branches are temporary and target `main`, following the owner's explicit instruction for this task. Durable research stays on `main`; the solved-results table is unchanged.
