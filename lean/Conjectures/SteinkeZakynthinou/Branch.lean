module

public import Mathlib.Analysis.SpecialFunctions.Log.Basic
public import Mathlib.Tactic.FieldSimp
public import Mathlib.Tactic.Linarith
public import Mathlib.Tactic.Positivity
public import Mathlib.Tactic.Ring

/-!
The rational child-selection rule of the threshold learner. The signed
gap is the chosen child's cost minus its sibling's cost, divided by
the positive noise scale.
-/

@[expose] public section

namespace SteinkeZakynthinou

noncomputable def choice (d : ℝ) : ℝ :=
  if 0 ≤ d then 1 / (2 * (1 + d)) else 1 - 1 / (2 * (1 - d))

theorem choice_pos (d : ℝ) : 0 < choice d := by
  unfold choice
  split
  · positivity
  · rename_i h
    rw [sub_pos, div_lt_one (by linarith)]
    linarith

theorem choice_add_neg (d : ℝ) : choice d + choice (-d) = 1 := by
  rcases lt_trichotomy d 0 with h | h | h
  · simp [choice, not_le.mpr h, neg_nonneg.mpr h.le, sub_eq_add_neg]
  · norm_num [h, choice]
  · simp [choice, le_of_lt h, not_le.mpr (neg_neg_of_pos h)]

theorem choice_le_one (d : ℝ) : choice d ≤ 1 := by
  linarith [choice_pos (-d), choice_add_neg d]

theorem choice_mul_excess_le {s x y : ℝ} (hs : 0 < s) :
    choice ((x - y) / s) * (x - min x y) +
      choice ((y - x) / s) * (y - min x y) ≤ s / 2 := by
  wlog h : x ≤ y generalizing x y
  · rw [min_comm, add_comm]
    exact this (le_of_not_ge h)
  have hg : 0 ≤ (y - x) / s := div_nonneg (sub_nonneg.mpr h) hs.le
  have hd : 0 < 2 * (1 + (y - x) / s) := by positivity
  rw [min_eq_left h, sub_self, mul_zero, zero_add, choice, ite_eq_left hg, one_div, ← div_eq_inv_mul,
    div_le_iff₀ hd]
  field_simp
  nlinarith

private theorem log_choice_pos {x y : ℝ} (hx : 0 ≤ x) (hxy : x ≤ y) :
    0 ≤ Real.log (choice x) - Real.log (choice y) ∧
      Real.log (choice x) - Real.log (choice y) ≤ y - x := by
  have hy : 0 ≤ y := hx.trans hxy
  have h1x : 0 < 1 + x := by positivity
  have h1y : 0 < 1 + y := by positivity
  have heq : choice x / choice y = (1 + y) / (1 + x) := by
    rw [choice, choice, ite_eq_left hx, ite_eq_left hy]
    field_simp
  rw [← Real.log_div (choice_pos x).ne' (choice_pos y).ne', heq]
  constructor
  · exact Real.log_nonneg ((le_div_iff₀ h1x).mpr (by linarith))
  · apply (Real.log_le_sub_one_of_pos (by positivity)).trans
    rw [div_sub_one h1x.ne', div_le_iff₀ h1x]
    nlinarith

private theorem log_choice_neg {x y : ℝ} (hxy : x ≤ y) (hy : y ≤ 0) :
    0 ≤ Real.log (choice x) - Real.log (choice y) ∧
      Real.log (choice x) - Real.log (choice y) ≤ y - x := by
  have form (u : ℝ) (hu : u ≤ 0) : choice u = (1 - 2 * u) / (2 * (1 - u)) := by
    rcases eq_or_lt_of_le hu with rfl | h
    · norm_num [choice]
    · rw [choice, ite_eq_right (not_le.mpr h)]
      have hn : (1 - u) ≠ 0 := by linarith
      field_simp [hn]
      ring
  have hx : x ≤ 0 := hxy.trans hy
  have ha : 0 < 1 - x := by linarith
  have hb : 0 < 1 - 2 * y := by linarith
  have heq : choice x / choice y - 1 = (y - x) / ((1 - x) * (1 - 2 * y)) := by
    rw [form x hx, form y hy]
    have : 0 < 1 - y := by linarith
    field_simp
    ring
  have hn : 0 ≤ (y - x) / ((1 - x) * (1 - 2 * y)) := by positivity
  rw [← Real.log_div (choice_pos x).ne' (choice_pos y).ne']
  constructor
  · exact Real.log_nonneg (by linarith [heq])
  · refine (Real.log_le_sub_one_of_pos (div_pos (choice_pos x) (choice_pos y))).trans ?_
    rw [heq, div_le_iff₀ (mul_pos ha hb)]
    have hs : 1 ≤ (1 - x) * (1 - 2 * y) := by nlinarith [mul_nonneg (neg_nonneg.mpr hx) (neg_nonneg.mpr hy)]
    simpa using mul_le_mul_of_nonneg_left hs (sub_nonneg.mpr hxy)

theorem abs_log_choice_sub_le (x y : ℝ) :
    |Real.log (choice x) - Real.log (choice y)| ≤ |x - y| := by
  wlog hxy : x ≤ y generalizing x y
  · simpa only [abs_sub_comm] using this y x (le_of_not_ge hxy)
  have hpair : 0 ≤ Real.log (choice x) - Real.log (choice y) ∧
      Real.log (choice x) - Real.log (choice y) ≤ y - x := by
    by_cases hx : 0 ≤ x
    · exact log_choice_pos hx hxy
    by_cases hy : y ≤ 0
    · exact log_choice_neg hxy hy
    have h₁ := log_choice_neg (le_of_not_ge hx) (le_refl 0)
    have h₂ := log_choice_pos (le_refl 0) (le_of_not_ge hy)
    constructor <;> linarith
  rw [abs_of_nonneg hpair.1, abs_of_nonpos (sub_nonpos.mpr hxy), neg_sub]
  exact hpair.2

end SteinkeZakynthinou
