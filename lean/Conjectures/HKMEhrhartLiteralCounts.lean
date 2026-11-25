module
public import Conjectures.HKMEhrhartCountCertificate
public import Conjectures.HKMEhrhartCountBridge

public section
namespace HKMEhrhart
open Polynomial

theorem cocktail_six_literal_lattice_counts (m : Fin 12) :
    Fintype.card (CocktailLattice 6 m.val) = evaluationCounts m := by
  rw [← computedDiagonalLatticeCount_eq_literal 6 m.val (by decide)]
  exact cocktail_six_values_computed m

theorem off_line_of_literal_lattice_counts (E : ℂ[X]) (hd : E.natDegree ≤ 11)
    (hE : ∀ m : ℕ, E.eval (m:ℂ) = (Fintype.card (CocktailLattice 6 m):ℂ)) :
    ∃ z : ℂ, E.IsRoot z ∧ z.re ≠ -(1/2:ℝ) := by
  apply off_line_of_counts E hd
  intro m
  rw [hE, cocktail_six_literal_lattice_counts]

end HKMEhrhart
