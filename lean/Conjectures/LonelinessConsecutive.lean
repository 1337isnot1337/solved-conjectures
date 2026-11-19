import Conjectures.Loneliness
import Mathlib.NumberTheory.DiophantineApproximation.Basic

/-! The exact real-time loneliness of every initial interval of positive
integer speeds. Dirichlet's approximation theorem supplies the global upper
bound, and time `1/(n+1)` attains it. -/

namespace Loneliness

theorem mem_consecutive {n d : ℕ} :
    d ∈ List.range' 1 n ↔ 1 ≤ d ∧ d ≤ n := by
  simp only [List.mem_range', Nat.one_mul]
  constructor
  · rintro ⟨i, hi, rfl⟩
    omega
  · rintro ⟨hd, hdn⟩
    exact ⟨d-1, by omega, by omega⟩

theorem consecutive_upper (n : ℕ) (hn : 0 < n) (t : ℝ) :
    clearance (List.range' 1 n) t ≤ 1 / ((n : ℝ)+1) := by
  obtain ⟨d, hd, hdn, hdist⟩ := Real.exists_nat_abs_mul_sub_round_le t hn
  exact (clearance_le_of_mem (mem_consecutive.mpr ⟨by omega, hdn⟩) t).trans hdist

theorem consecutive_lower (n : ℕ) (hn : 0 < n) :
    1 / ((n : ℝ)+1) ≤ clearance (List.range' 1 n) (1 / ((n : ℝ)+1)) := by
  have hnR : (1 : ℝ) ≤ n := by exact_mod_cast hn
  have hden : (0 : ℝ) < n+1 := by positivity
  apply le_clearance
  · apply (div_le_div_iff₀ hden (by norm_num : (0 : ℝ) < 2)).mpr
    linarith
  · intro d hd
    obtain ⟨hd, hdn⟩ := mem_consecutive.mp hd
    have hdR : (1 : ℝ) ≤ d := by exact_mod_cast hd
    have hdnR : (d : ℝ) ≤ n := by exact_mod_cast hdn
    apply distance_lower_of_cell (k := 0)
    · simp only [Int.cast_zero, sub_zero, mul_one_div]
      exact (div_le_div_iff_of_pos_right hden).mpr hdR
    · simp only [Int.cast_zero, sub_zero, mul_one_div]
      apply (le_sub_iff_add_le).mpr
      rw [← add_div]
      apply (div_le_iff₀ hden).mpr
      linarith

theorem consecutive_maximum (n : ℕ) (hn : 0 < n) :
    clearance (List.range' 1 n) (1 / ((n : ℝ)+1)) = 1 / ((n : ℝ)+1) ∧
      ∀ t : ℝ, clearance (List.range' 1 n) t ≤ 1 / ((n : ℝ)+1) :=
  ⟨le_antisymm (consecutive_upper n hn _) (consecutive_lower n hn),
    consecutive_upper n hn⟩

theorem consecutive_value (n : ℕ) (hn : 0 < n) :
    value (List.range' 1 n) = 1 / ((n : ℝ)+1) := by
  apply le_antisymm
  · exact value_le (fun t _ => consecutive_upper n hn t)
  · apply (consecutive_lower n hn).trans
    apply le_value
    constructor
    · positivity
    · have hden : (0 : ℝ) < n+1 := by positivity
      apply (div_le_iff₀ hden).mpr
      have hnR : (0 : ℝ) ≤ n := Nat.cast_nonneg n
      linarith

end Loneliness
