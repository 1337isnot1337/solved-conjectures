# Review and validation record

Date: 23 November 2026. Tracking [issue #247](https://github.com/1337isnot1337/solved-conjectures/issues/247); review [PR #249](https://github.com/1337isnot1337/solved-conjectures/pull/249). First written-proof milestone: [48dba40656bcd9a59efbcb3f512ab8516900bded](https://github.com/1337isnot1337/solved-conjectures/commit/48dba40656bcd9a59efbcb3f512ab8516900bded).

## Reviewed versions

Three separate AI subagents independently audited the draft and then checked the model clarifications. The root worker independently checked the argument and integrated the documents. These are internal reviews, not outside human review or Lean verification.

| Material | SHA-256 |
| --- | --- |
| Initial proof reviewed by all three workers | `70cc3187e3a33dfdd4ae3ecf3df2abefadea25d30f2276f69e6a0afa0813fefe` |
| Final [PROOF.md](PROOF.md), rechecked by all three | `21ee3144e36d6fc1a6e3f6a0e7ac122b3d010ca9230dd126419dcb66362d3da4` |
| [SOURCES.md](SOURCES.md), checked after integration | `ba7e3203d7854965df4484c2b8fbcc9842f06fd93523dea845c5f4addb82ed1d` |

## Review assignments and outcomes

| Reviewer | Main checks | Outcome after corrections |
| --- | --- | --- |
| `permanent_bound_audit` | Pinned paper and formal statement; all-sufficiently-large quantifiers; arbitrary Laurent constants; subtraction and leaf-gate conversion; source CI and verification claims | No remaining gap or factual overstatement found within the reviewed scope |
| `border_factor_audit` | Corrected factor theorem; target degree versus source degree; multiplicity; regular rational epsilon output; both polynomial losses; asymptotic exponent; free-affine normalization | No remaining mathematical gap found within the reviewed scope |
| `graph_reduction_review` | Graph irreducibility; graph-generic path; defined division and zero tests; extraction cost; BSS unrolling; nonscalar model | No remaining mathematical or model objection within the reviewed scope |

All three checked the final proof hash above. The first two source theorems remain imported results: review of the deduction does not independently reprove Bürgisser's factor theorem or the entire pinned permanent lower bound.

## Corrections made during review

### Ambient scalar semantics

The first draft said that the optional nonscalar model charges multiplication or division involving nonconstant register functions. All three reviewers requested a precise interpretation of “constant.” The final Section 9 specifies constancy as an ambient rational function in $`\mathbb C(X,y)`$, before imposing branch equations.

The distinction matters. On a branch where $`z=0`$, the register $`z`$ is constant on the branch locus, so a branch-restricted convention might call $`zw`$ a free multiplication. But its ambient expression is the nonlinear polynomial $`zw`$; it cannot be included for free in the ambient affine span of $`1,z,w`$. The proof's affine normalization uses ambient rational identities. The clarified model is the one actually proved.

### BSS addressing

The final Section 8 states that finite control governs shifts and copy-address states and that there is no primitive converting an arbitrary complex register value directly into a discrete address. This makes explicit the standard BSS convention used by the unrolling proof. Fixed rational-map instructions are expanded at a machine-dependent constant cost.

### Finiteness

Section 1 explicitly specifies a finite rooted computation tree. The family is nonuniform and its total size may be exponential. The proof bounds path cost and extracts only one path numerator.

## Quantitative steps checked

The reviewers independently confirmed the following bounds in the conventions defined in the proof:

```math
\mathop{\mathrm{EC}}(g_m)\le4T+3,
\qquad
\overline S(h)\le6\underline L(h)+1,
```

```math
\overline S(f_m)\le K m^2\log_2(m+1)(T+1),
\qquad
\overline S(f_m)\le K' m^{10}(T+1).
```

The first polynomial loss uses the graph-specific result; the second uses only the general factor theorem with schoolbook multiplication. Both preserve the exponent $`4/3`$. If the imported exponent constant is $`a`$, $`b=a/3`$ works eventually for the total-operation theorem. The optional free-affine model has a squared cost factor and admits $`b'=a/6`$ eventually.

The product of path restrictions appears only in an existence argument. It is not computed by the extracted circuit, and neither the entire tree nor the coefficients of its large-degree numerator are expanded. The source multiple's degree and multiplicity never enter the factor-to-border cost.

## Local validation and imported CI

Local checks for this documentation change:

- The exact root README passes `python3 scripts/check_readme_verification.py`: 68 result rows satisfy the repository's verification-marker rule. No new solved-results-table row is added for this corollary.
- The new Markdown files have balanced fenced blocks and no trailing whitespace; relative file links within this note resolve.
- The recorded final proof and source SHA-256 hashes match the files.
- The PDF byte count and SHA-256 in the source audit match the inspected pinned PDF.

The separate [source CI job](https://github.com/anthropics/formal-math/actions/runs/45266217321/job/138013752301) reports successful build and Comparator steps for a commit whose `vp-vnp` subtree matches the pinned import. Those remote statuses were inspected. No local `lake build`, Comparator run, nanoda replay, or Lean formalization of this BSS consequence was performed.

## Publication scope

The completed result is the deterministic permanent-graph decision lower bound, with the stated computation-tree and BSS-machine conventions. It is published under `research/` as a consequence of imported theorems and linked to the separate [P_C versus NP_C campaign](https://github.com/1337isnot1337/solved-conjectures/issues/248). The new note supplies that campaign's graph-hardness ingredient and makes no claim that the graph is in $`\mathsf{NP}_{\mathbb C}`$ or that the BSS separation has been proved.
