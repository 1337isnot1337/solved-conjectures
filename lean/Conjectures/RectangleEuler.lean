import Mathlib.Analysis.SpecialFunctions.Log.Deriv
import Mathlib.Analysis.PSeries
import Mathlib.Algebra.BigOperators.Field
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity

/-! Finite Euler-product estimates for cumulative integer partitions.
The Basel constant is kept as its convergent series so this analytic module
can be checked independently of the trigonometric evaluation of that series. -/
namespace RectangleEuler

open Finset

noncomputable def basel : ℝ := ∑' n : ℕ, 1 / ((n : ℝ) + 1) ^ 2

lemma basel_summable : Summable (fun n : ℕ => (1 : ℝ) / ((n : ℝ) + 1) ^ 2) := by
  simpa only [Nat.cast_add, Nat.cast_one] using
    (summable_nat_add_iff 1).2
      (Real.summable_one_div_nat_pow.mpr (by decide : 1 < (2 : ℕ)))

noncomputable def logEuler (B : ℕ) (t : ℝ) : ℝ :=
  ∑ a ∈ range B, -Real.log (1 - Real.exp (-((a : ℝ) + 1) * t))

lemma exp_sub_one_pos {u : ℝ} (hu : 0 < u) : 0 < Real.exp u - 1 := by
  simpa using (Real.exp_lt_exp.mpr hu)

lemma exp_sum (B : ℕ) {u : ℝ} (hu : 0 < u) :
    (∑ a ∈ range B, Real.exp (-((a : ℝ) + 1) * u)) =
      (1 - Real.exp (-(B : ℝ) * u)) / (Real.exp u - 1) := by
  have he : Real.exp u ≠ 0 := ne_of_gt (Real.exp_pos u)
  have hd : Real.exp u - 1 ≠ 0 := ne_of_gt (exp_sub_one_pos hu)
  induction B with
  | zero => simp
  | succ B ih =>
    rw [sum_range_succ, ih]
    have hx : -((B : ℝ) + 1) * u = -(B : ℝ) * u - u := by ring
    simp only [Nat.cast_add, Nat.cast_one]
    rw [hx, Real.exp_sub]
    field_simp
    ring

lemma exp_sum_le (B : ℕ) {u : ℝ} (hu : 0 < u) :
    (∑ a ∈ range B, Real.exp (-((a : ℝ) + 1) * u)) ≤ 1 / u := by
  rw [exp_sum B hu]
  calc
    (1 - Real.exp (-(B : ℝ) * u)) / (Real.exp u - 1)
        ≤ 1 / (Real.exp u - 1) := by
      exact div_le_div_of_nonneg_right (by linarith [Real.exp_pos (-(B : ℝ) * u)])
        (le_of_lt (exp_sub_one_pos hu))
    _ ≤ 1 / u := one_div_le_one_div_of_le hu (by linarith [Real.add_one_le_exp u])

lemma inv_exp_sub_one_lower {u : ℝ} (hu : 0 < u) :
    1 / u - 1 ≤ 1 / (Real.exp u - 1) := by
  have he : 0 < Real.exp u := Real.exp_pos u
  have hd : 0 < Real.exp u - 1 := exp_sub_one_pos hu
  have hx := Real.add_one_le_exp (-u)
  rw [Real.exp_neg] at hx
  have hmul : (1 - u) * Real.exp u ≤ 1 := by
    apply (le_div_iff₀ he).1
    rw [one_div]
    linarith
  apply (le_div_iff₀ hd).2
  have heq : (1 / u - 1) * (Real.exp u - 1) =
      ((1 - u) * Real.exp u + u - 1) / u := by field_simp; ring
  rw [heq]
  apply (div_le_iff₀ hu).2
  linarith

lemma exp_sum_lower (B : ℕ) {u : ℝ} (hu : 0 < u) :
    1 / u - 1 - Real.exp (-(B : ℝ) * u) / u ≤
      ∑ a ∈ range B, Real.exp (-((a : ℝ) + 1) * u) := by
  rw [exp_sum B hu]
  have hlo := inv_exp_sub_one_lower hu
  have hhi : 1 / (Real.exp u - 1) ≤ 1 / u :=
    one_div_le_one_div_of_le hu (by linarith [Real.add_one_le_exp u])
  have hm := mul_le_mul_of_nonneg_left hhi (le_of_lt (Real.exp_pos (-(B : ℝ) * u)))
  simp only [mul_one_div] at hm
  rw [sub_div, one_div] at *
  linarith

lemma logEuler_hasSum (B : ℕ) {t : ℝ} (ht : 0 < t) :
    HasSum (fun m : ℕ => ∑ a ∈ range B,
      Real.exp (-((a : ℝ) + 1) * t) ^ (m + 1) / ((m : ℝ) + 1)) (logEuler B t) := by
  apply hasSum_sum
  intro a ha
  apply Real.hasSum_pow_div_log_of_abs_lt_one
  rw [abs_of_pos (Real.exp_pos _)]
  apply Real.exp_lt_one_iff.mpr
  nlinarith [show (0 : ℝ) ≤ a by positivity]

lemma logEuler_summand_eq (B m : ℕ) (t : ℝ) :
    (∑ a ∈ range B, Real.exp (-((a : ℝ) + 1) * t) ^ (m + 1) / ((m : ℝ) + 1)) =
      (∑ a ∈ range B, Real.exp (-((a : ℝ) + 1) * (t * ((m : ℝ) + 1)))) /
        ((m : ℝ) + 1) := by
  rw [sum_div]
  apply sum_congr rfl
  intro a ha
  congr 1
  rw [← Real.exp_nat_mul]
  congr 1
  push_cast
  ring

lemma logEuler_summand_le (B m : ℕ) {t : ℝ} (ht : 0 < t) :
    (∑ a ∈ range B, Real.exp (-((a : ℝ) + 1) * t) ^ (m + 1) / ((m : ℝ) + 1)) ≤
      (1 / t) * (1 / ((m : ℝ) + 1) ^ 2) := by
  rw [logEuler_summand_eq]
  have hm : 0 < (m : ℝ) + 1 := by positivity
  calc
    _ ≤ (1 / (t * ((m : ℝ) + 1))) / ((m : ℝ) + 1) :=
      div_le_div_of_nonneg_right (exp_sum_le B (mul_pos ht hm)) hm.le
    _ = _ := by field_simp

/-- The finite Euler product has the sharp leading upper estimate. -/
theorem logEuler_le (B : ℕ) {t : ℝ} (ht : 0 < t) : logEuler B t ≤ basel / t := by
  have hsum := basel_summable.hasSum.mul_left (1 / t)
  have h := hasSum_le (logEuler_summand_le B · ht) (logEuler_hasSum B ht) hsum
  simpa only [basel, one_div, mul_comm, div_eq_mul_inv, one_mul, mul_one] using h

end RectangleEuler
