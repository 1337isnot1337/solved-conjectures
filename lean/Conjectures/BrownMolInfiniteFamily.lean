import Conjectures.BrownMolCounterexample
import Conjectures.BrownMolBasePoint
import Conjectures.BrownMolFamily
import Conjectures.BrownMolDiameter

open Polynomial Filter
open scoped Topology
noncomputable section
namespace BrownMol

theorem A_matches (z : ℂ) : A.eval z = BrownBase.a z := by simp [A_eval, BrownBase.a]
theorem B_matches (z : ℂ) : B.eval z = BrownBase.b z := by simp [B_eval, BrownBase.b]
theorem A_deriv_matches (z : ℂ) : A.derivative.eval z = BrownBase.aprime z := by
  simp [A_deriv_eval, BrownBase.aprime]

theorem family_roots_in_disk :
    ∀ᶠ n in atTop, ∃ z : ℂ, (family A B n).IsRoot z ∧ z ≠ 0 ∧ ‖z+(1/2 : ℂ)‖ < 1/2 := by
  obtain ⟨z0,ha,ha',hb,hdisk⟩ := BrownBase.exists_base
  have ha0 : ‖A.eval z0‖ = 1 := by simpa [A_matches] using ha
  have ha0' : A.derivative.eval z0 ≠ 0 := by simpa [A_deriv_matches] using ha'
  have hb0 : B.eval z0 ≠ 0 := by simpa [B_matches] using hb
  let ε : ℝ := (1/2-‖z0+(1/2 : ℂ)‖)/2
  have hε : 0 < ε := by dsimp [ε]; linarith
  have hroots := polynomial_family_roots_converge A B z0 ha0 ha0' hb0 ε hε
  filter_upwards [hroots] with n hn
  obtain ⟨z,hz,hclose⟩ := hn
  have htri := norm_add_le (z-z0) (z0+(1/2 : ℂ))
  have he : z-z0+(z0+(1/2 : ℂ)) = z+(1/2 : ℂ) := by ring
  rw [he] at htri
  have hinside : ‖z+(1/2 : ℂ)‖ < 1/2 := by dsimp [ε] at hclose; linarith
  have hne : z ≠ 0 := by
    intro h
    subst z
    norm_num at hinside
  exact ⟨z,hz,hne,hinside⟩

theorem infinite_tree_counterfamily :
    ∀ᶠ n in atTop, (BrownTree.graph n).IsTree ∧ (BrownTree.graph n).diam = 4 ∧
      Fintype.card (BrownTree.Vertex n) = 5*n+1 ∧
      ∃ z : ℂ, (subtreePolynomial n).IsRoot z ∧ z ≠ 0 ∧ ‖z+(1/2 : ℂ)‖ < 1/2 := by
  filter_upwards [family_roots_in_disk, Filter.eventually_ge_atTop 2] with n hn hn2
  obtain ⟨z,hz,hne,hdisk⟩ := hn
  refine ⟨BrownTree.graph_isTree n, BrownTree.graph_diameter_four n hn2, BrownTree.card_vertices n, z, ?_, hne, hdisk⟩
  rw [Polynomial.IsRoot, subtreePolynomial_eval]
  have hp : (1+z*(1+z)^4)^n + (n : ℂ)*((1+z)^4+4) = 0 := by
    simpa [Polynomial.IsRoot, family_eval, A_eval, B_eval] using hz
  rw [hp, mul_zero]

end BrownMol
end
