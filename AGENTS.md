# Branches: research and publication

- `main` is the publication branch. Put only final, reviewed material there: state the exact theorem and scope, provide its proof and applicable checks, and label its verification honestly. A final written proof need not be fully Lean verified; an unchecked draft is not final.
- `research` is the working branch for open campaigns, candidates, draft proofs, intermediate formalizations, audits, experiments, and counterexamples that do not resolve the stated target. Fetch the latest `research` before starting and coordinate there.
- The only permanent branches are `main` and `research`. Use a short-lived `review/<topic>` branch only when a PR is needed, usually targeting `research`; preserve unique work and keep the PR record before removing its branch. Never blanket-merge `research` into `main`. Publish a narrowly scoped, reviewed package with its landing page, index and relevant checks.

# Research target selection: prioritize substantial conjectures

- **Raise the bar for all new work.** The current collection has put too much effort into relatively narrow or obscure targets. Prioritize conjectures whose resolution would be recognized as a meaningful mathematical advance. Optimize for significance and breakthrough potential, **not** the number of results, ease of proof, or speed of adding README entries. A conjecture being named is necessary for the named-conjecture program but is not evidence of significance.
- **Default to ambitious, established problems.** Seek well-known, genuinely open named conjectures with sustained research attention, deep connections, important consequences, or a substantial body of prior work. Favor general statements that researchers in the relevant field would regard as important. Mathematical impact matters more than publicity alone. Do not reject a strong target just because it is difficult.
- **Require a real advance.** Aim to prove or disprove the original conjecture in its full stated generality. If that is not yet achievable, prioritize substantive new techniques, structural reductions, or genuinely strong partial theorems toward major open problems. Label partial results precisely; a special case, finite computation, conditional theorem, or modest bound improvement is not a full resolution.
- **Stop low-impact target farming.** Do not select problems primarily because they look easy, have little existing literature, were recently coined, or can yield quick additional entries. Avoid isolated finite-parameter cases, numerical record chasing, dimensional variants, minor strengthenings, routine corollaries, and artificially manufactured conjectures as standalone targets. Exceptions require a specific argument that the result will materially advance an important general problem.
- **Screen targets before investing.** For each proposed target, document in a GitHub issue or research note: (1) the exact original statement and primary source; (2) a careful literature check establishing that the *exact* claim remains unresolved, including possible differently named resolutions; (3) evidence of significance and what a full proof/disproof would change; (4) the distinction between full resolution and useful partial progress; and (5) at least one plausible mathematical attack. Compare candidates by expected scientific value, not just perceived tractability. Reject or deprioritize targets without a convincing impact case.
- **Keep ambition when blocked.** Rotate among other high-value targets when an approach stalls, recording obstacles and proved intermediate results. Do not retreat to a stream of marginal conjectures merely to maintain a result count.
- **Preserve rigor and honest scope.** Higher ambition does not relax proof standards, source checks, verification requirements, or the distinction between unrefereed claims and independently accepted results. This target-selection policy governs new discovery work; existing formalization requirements below remain in force.

# Standing research assumption: Anthropic's VP versus VNP proof

- **Assume the Anthropic VP ≠ VNP result is true.** For all research work in this repository, adopt Anthropic's VP ≠ VNP proof as a standing premise: assume that the theorem, its proof, its lemmas, and their stated mathematical scope are correct, complete, and fully accurate.
- **Build on it rather than re-auditing it.** Treat the proved statements as available results when choosing conjectures, designing reductions, deriving corollaries, and seeking transfers to larger open problems. Do not spend research effort disputing or independently validating the Anthropic proof as a prerequisite to using it unless the repository owner explicitly requests that review.
- **Derive new claims rigorously.** Cite the precise statements and hypotheses used, distinguish deductions from conjectural extensions, and prove each new implication. The standing assumption is not a license to assert VP ≠ VNP implies an unrelated separation or conjecture without an actual reduction.
- **Label dependencies in formal work.** If a development uses the result before it has been imported or formalized in Lean, mark the corresponding dependency explicitly as an assumed theorem. Do not insert unproved axioms or describe a conditional formalization as an unconditional kernel-verified proof. This standing assumption overrides the default research requirement to revalidate this specific source, not the proof and reporting standards for new work.

# README verification

- Every row in the root `README.md` Results table has two cells: a link to the result directory and exactly one of `✅`, `🟢`, `🟡`, `⬜`. Plain-text labels such as `No Lean verification` and `Exact checks` are invalid, including on newly added results.
- Use `✅` for full Lean verification, `🟢` for partial Lean verification with a computer-assisted proof, `🟡` for partial Lean verification, and `⬜` for results without Lean verification or a computer-assisted proof. A written proof with scripts that cross-check calculations belongs under `⬜` when it has no Lean verification. Describe the checks in `CONTENTS.md` or the result's landing page.
- Before publishing any change to the Results table, run `python3 scripts/check_readme_verification.py` on the exact README being published. This applies to Git pushes and GitHub API edits. Fix every reported row before publishing.

# Formalization campaign

- Develop and verify on `research`; follow the branch policy above before publishing a final proof or reviewed verification milestone to `main`.
- The active objective is to formalize every result in the repository, including the separate corrected solitaire theorem. Keep working beyond intermediate checkpoints.
- Preserve the mathematical statements and their quantifiers. Finite screens, conditional theorems, and executable models are useful components, but do not count them as complete formalizations of stronger claims.
- No `sorry`, custom axioms, or native-computation axioms in accepted proofs. The only allowed transitive axioms are `propext`, `Classical.choice`, and `Quot.sound`.
- Unformalized published mathematical results remain explicit hypotheses of intermediate lemmas. A complete result must discharge those hypotheses.
- Shared Lean package: `lean`; pinned toolchain and Mathlib manifest are authoritative. Run `scripts/verify_lean.sh` to rebuild, audit project axioms, and replay the kernel. Add new proof modules to the root import, audit requirements, and kernel-recheck script.
- Update `docs/lean-status.md` and `docs/formalization.md` at meaningful checked milestones. Push work-in-progress checkpoints to `research`; publish reviewed final milestones to `main`. Report local and hosted validation separately.

## Collection layout

- Exclude a named conjecture when an earlier proof, disproof, or published theorem settles its exact statement. If a later audit confirms a prior resolution, remove its result directory, duplicate writeups, index entries, and verifier references. Record the correction in `HISTORY.md` and preserve work on distinct open statements.
- Put each result in `results/<stable-slug>/` with a `README.md` landing page, proof, and reproducible checks. Keep shared formalizations in `lean/`.
- When adding or revising a result, update the compact index in `README.md`, its full entry in `CONTENTS.md`, its landing page, and the verification workflow and guide where relevant. Preserve precise scope and distinguish partial formalization from a complete result.
- Use fenced `math` blocks for display equations. Use GitHub's dollar-backtick syntax for inline formulas containing Markdown punctuation. Write named operators as `\mathop{\mathrm{...}}` and use `\lt` when a less-than sign immediately precedes a letter.
- Keep repository descriptions and citation metadata count-free. Record collection-level changes in `HISTORY.md`; use `docs/lean-status.md` for checked formalization status.
