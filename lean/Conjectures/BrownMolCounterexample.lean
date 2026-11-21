import Conjectures.BrownMolFiniteRoot
import Conjectures.BrownMolTree

/-!
A literal 1001-vertex tree refutes the translated inner-disk assertion.
Its subtree polynomial is defined as the sum over actual nonempty connected
induced vertex sets; `BrownTree.connected_iff_induced_connected` supplies
the direct Mathlib graph connection. The all-large-parameter family is not
proved in this module.
-/
open Polynomial
noncomputable section
namespace BrownMol

def subtreePolynomial (r : ℕ) : ℂ[X] :=
  ∑ s : {s : Finset (BrownTree.Vertex r) // BrownTree.connected s}, X ^ s.val.card

theorem subtreePolynomial_eval (r : ℕ) (z : ℂ) :
    (subtreePolynomial r).eval z = z*((1+z*(1+z)^4)^r + (r : ℂ)*((1+z)^4+4)) := by
  simp only [subtreePolynomial, eval_finsetSum, eval_pow, eval_X]
  exact BrownTree.subtree_sum r z

theorem concrete_tree_counterexample :
    (BrownTree.graph 200).IsTree ∧ Fintype.card (BrownTree.Vertex 200) = 1001 ∧
    ∃ z : ℂ, (subtreePolynomial 200).IsRoot z ∧ z ≠ 0 ∧ ‖z+(1/2 : ℂ)‖ < 1/2 := by
  refine ⟨BrownTree.graph_isTree 200, ?_, ?_⟩
  · norm_num [BrownTree.card_vertices]
  · obtain ⟨z,hz,hne,hdisk⟩ := finite_root
    refine ⟨z,?_,hne,hdisk⟩
    rw [Polynomial.IsRoot, subtreePolynomial_eval]
    have hp : (1+z*(1+z)^4)^200 + (200 : ℂ)*((1+z)^4+4) = 0 := by
      simpa [Polynomial.IsRoot,P_eval] using hz
    norm_num only [Nat.cast_ofNat]
    rw [hp, mul_zero]

end BrownMol
end
