# Formalization campaign

- Work on `main`. The owner explicitly requested that all work be on `main` and other branches be removed. Preserve unique work before deleting any branch; do not create persistent side branches.
- The active objective is to formalize every result in the repository, including the separate corrected solitaire theorem. Keep working beyond intermediate checkpoints.
- Preserve the mathematical statements and their quantifiers. Finite screens, conditional theorems, and executable models are useful components, but do not count them as complete formalizations of stronger claims.
- No `sorry`, custom axioms, or native-computation axioms in accepted proofs. The only allowed transitive axioms are `propext`, `Classical.choice`, and `Quot.sound`.
- Unformalized published mathematical results remain explicit hypotheses of intermediate lemmas. A complete result must discharge those hypotheses.
- Shared Lean package: `l-solitaire-limit-shapes/lean`; pinned toolchain and Mathlib manifest are authoritative. Run `scripts/verify_lean.sh` to rebuild, audit project axioms, and replay the kernel. Add new proof modules to the root import, audit requirements, and kernel-recheck script.
- Update `LEAN_VERIFICATION.md` and `FORMALIZATION_CAMPAIGN.md` at meaningful checked milestones. Push coherent verified checkpoints to `main`; report local and hosted validation separately.
