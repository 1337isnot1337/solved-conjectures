import Conjectures.RectangleEuler
import Mathlib.NumberTheory.ZetaValues

namespace RectangleEuler

/-- Identification of the convergent analytic constant with its exact value. -/
theorem basel_eq_pi_sq_div_six : basel = Real.pi ^ 2 / 6 := by
  have hs : HasSum (fun n : ℕ => (1 : ℝ) / ((n : ℝ) + 1) ^ 2) (Real.pi ^ 2 / 6) := by
    have h := (hasSum_nat_add_iff 1 (f := fun n : ℕ => (1 : ℝ) / (n : ℝ) ^ 2)
      (g := Real.pi ^ 2 / 6)).2
    simpa only [Nat.cast_add, Nat.cast_one] using h (by simpa using hasSum_zeta_two)
  exact hs.tsum_eq

end RectangleEuler
