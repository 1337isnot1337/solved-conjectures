module

public import Conjectures.ChenKhareSahiOrthogonalityOrbits
public import Mathlib.Tactic.NormNum

/-! The literal values of the eleven monomial symmetric polynomials at
eleven six-variable partition inputs. The rational matrix inverse is checked
separately; these identities connect that matrix to the actual orbit sums. -/

@[expose] public section

namespace ChenKhareSahi.Orthogonality

set_option maxRecDepth 32768
set_option maxHeartbeats 12000000
set_option linter.unusedSimpArgs false

/-- Eleven concrete six-variable inputs, one for each partition of six. -/
noncomputable def evaluationPoint (i : Index) : Fin 6 → ℝ :=
  fun k => ((parts i)[k.val]! : ℝ)

set_option maxHeartbeats 20000000 in
theorem evaluation_matrix_exact (i j : Index) :
    (evaluationMatrix i j : ℝ) = monomialSix j (evaluationPoint i) := by
  fin_cases i <;> fin_cases j <;>
    norm_num [evaluationMatrix, monomialSix_eq_list, orbitListCertificate,
      evaluationPoint, parts, termSix]

/- Materialize the defining equations in their owning module.
Sibling modules must import these checked equations, rather than create them independently. -/
open Lean Elab Command in
run_cmd do
  liftTermElabM do
    for name in #[
      ``ChenKhareSahi.Orthogonality.evaluationPoint] do
      discard <| Lean.Meta.getEqnsFor? name

end ChenKhareSahi.Orthogonality
