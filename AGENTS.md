# Formalization campaign

- Work on `main`. The owner explicitly requested that all work be on `main` and other branches be removed. Preserve unique work before deleting any branch; do not create persistent side branches.
- The active objective is to formalize every result in the repository, including the separate corrected solitaire theorem. Keep working beyond intermediate checkpoints.
- Preserve the mathematical statements and their quantifiers. Finite screens, conditional theorems, and executable models are useful components, but do not count them as complete formalizations of stronger claims.
- No `sorry`, custom axioms, or native-computation axioms in accepted proofs. The only allowed transitive axioms are `propext`, `Classical.choice`, and `Quot.sound`.
- Unformalized published mathematical results remain explicit hypotheses of intermediate lemmas. A complete result must discharge those hypotheses.
- Shared Lean package: `lean`; pinned toolchain and Mathlib manifest are authoritative. Run `scripts/verify_lean.sh` to rebuild, audit project axioms, and replay the kernel. Add new proof modules to the root import, audit requirements, and kernel-recheck script.
- Update `docs/lean-status.md` and `docs/formalization.md` at meaningful checked milestones. Push coherent verified checkpoints to `main`; report local and hosted validation separately.

## Collection layout

- Put each result in `results/<stable-slug>/` with a `README.md` landing page, proof, and reproducible checks. Keep shared formalizations in `lean/`.
- When adding or revising a result, update the compact index in `README.md`, its full entry in `CONTENTS.md`, its landing page, and the verification workflow and guide where relevant. Preserve precise scope and distinguish partial formalization from a complete result.
- Keep the README results table to a problem link to its directory and one Lean status emoji (`✅`, `🟡`, or `⬜`).
- Use fenced `math` blocks for display equations. Use GitHub's dollar-backtick syntax for inline formulas containing Markdown punctuation. Write named operators as `\mathop{\mathrm{...}}` and use `\lt` when a less-than sign immediately precedes a letter.
- Keep repository descriptions and citation metadata count-free. Record collection-level changes in `HISTORY.md`; use `docs/lean-status.md` for checked formalization status.
