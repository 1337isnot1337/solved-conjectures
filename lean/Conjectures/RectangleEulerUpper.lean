import Conjectures.RectangleEulerLimit
import Mathlib.NumberTheory.Harmonic.Bounds

/-! Uniform upper bounds for ordered and unordered rectangle Euler products. -/
namespace RectangleEuler

open Finset

noncomputable def logFactor (u : ℝ) : ℝ := -Real.log (1 - Real.exp (-u))

lemma logFactor_nonneg {u : ℝ} (hu : 0 < u) : 0 ≤ logFactor u := by
  have hq : Real.exp (-u) < 1 := Real.exp_lt_one_iff.mpr (by linarith)
  have h := Real.log_nonpos (by linarith : 0 ≤ 1 - Real.exp (-u))
    (by linarith [Real.exp_pos (-u)] : 1 - Real.exp (-u) ≤ 1)
  exact neg_nonneg.mpr h

lemma logFactor_le_geom {u : ℝ} (hu : 0 < u) :
    logFactor u ≤ Real.exp (-u) / (1 - Real.exp (-u)) := by
  have hq : 0 < 1 - Real.exp (-u) :=
    sub_pos.mpr (Real.exp_lt_one_iff.mpr (by linarith))
  have h := Real.log_le_sub_one_of_pos (inv_pos.mpr hq)
  rw [Real.log_inv] at h
  calc
    logFactor u ≤ (1 - Real.exp (-u))⁻¹ - 1 := h
    _ = _ := by field_simp; ring

lemma logFactor_le_inv {u : ℝ} (hu : 0 < u) : logFactor u ≤ 1 / u := by
  calc
    logFactor u ≤ Real.exp (-u) / (1 - Real.exp (-u)) := logFactor_le_geom hu
    _ = 1 / (Real.exp u - 1) := by
      rw [Real.exp_neg]
      have he : Real.exp u ≠ 0 := ne_of_gt (Real.exp_pos u)
      have hd : Real.exp u - 1 ≠ 0 := ne_of_gt (exp_sub_one_pos hu)
      field_simp
    _ ≤ 1 / u := one_div_le_one_div_of_le hu (by linarith [Real.add_one_le_exp u])

lemma exp_neg_le_half {u : ℝ} (hu : 1 ≤ u) : Real.exp (-u) ≤ 1 / 2 := by
  have he : 2 ≤ Real.exp u := by
    have h := Real.add_one_le_exp (1 : ℝ)
    exact (by linarith : 2 ≤ Real.exp 1).trans (Real.exp_le_exp.mpr hu)
  rw [Real.exp_neg, ← one_div]
  apply (div_le_iff₀ (Real.exp_pos u)).2
  linarith

lemma logFactor_le_exp {u : ℝ} (hu : 1 ≤ u) : logFactor u ≤ 2 * Real.exp (-u) := by
  have hu0 : 0 < u := by linarith
  have hq := exp_neg_le_half hu
  have hp : 0 < 1 - Real.exp (-u) := by linarith
  apply (logFactor_le_geom hu0).trans
  apply (div_le_iff₀ hp).2
  nlinarith [Real.exp_pos (-u)]

lemma logEuler_eq_sum_factor (B : ℕ) (t : ℝ) :
    logEuler B t = ∑ a ∈ range B, logFactor (((a : ℝ) + 1) * t) := by
  simp only [logEuler, logFactor, neg_mul]

lemma logEuler_nonneg (B : ℕ) {t : ℝ} (ht : 0 < t) : 0 ≤ logEuler B t := by
  rw [logEuler_eq_sum_factor]
  exact sum_nonneg (fun a ha => logFactor_nonneg (by positivity))

lemma logEuler_decay (B : ℕ) {u : ℝ} (hu : 1 ≤ u) :
    logEuler B u ≤ 4 * Real.exp (-u) := by
  have hu0 : 0 < u := by linarith
  have hq := exp_neg_le_half hu
  have hd : 0 < Real.exp u - 1 := exp_sub_one_pos hu0
  have he : Real.exp u ≠ 0 := ne_of_gt (Real.exp_pos u)
  calc
    logEuler B u ≤ ∑ a ∈ range B, 2 * Real.exp (-((a : ℝ) + 1) * u) := by
      rw [logEuler_eq_sum_factor]
      apply sum_le_sum
      intro a ha
      simpa only [neg_mul] using logFactor_le_exp
        (show 1 ≤ ((a : ℝ) + 1) * u by nlinarith [show (0 : ℝ) ≤ a by positivity])
    _ = 2 * ((1 - Real.exp (-(B : ℝ) * u)) / (Real.exp u - 1)) := by
      rw [← mul_sum, exp_sum B hu0]
    _ ≤ 2 * (1 / (Real.exp u - 1)) := by
      apply mul_le_mul_of_nonneg_left _ (by norm_num)
      apply div_le_div_of_nonneg_right _ hd.le
      linarith [Real.exp_pos (-(B : ℝ) * u)]
    _ = 2 * (Real.exp (-u) / (1 - Real.exp (-u))) := by
      rw [Real.exp_neg]
      field_simp
    _ ≤ 4 * Real.exp (-u) := by
      have hp : 0 < 1 - Real.exp (-u) := by linarith
      have hm : Real.exp (-u) / (1 - Real.exp (-u)) ≤ 2 * Real.exp (-u) := by
        apply (div_le_iff₀ hp).2
        nlinarith [Real.exp_pos (-u)]
      linarith

lemma harmonicSum_eq (K : ℕ) : harmonicSum K = (harmonic K : ℝ) := by
  simp [harmonicSum, harmonic, one_div]

lemma harmonicSum_le (K : ℕ) : harmonicSum K ≤ 1 + Real.log K := by
  rw [harmonicSum_eq]
  exact harmonic_le_one_add_log K

lemma partialBasel_le (K : ℕ) : partialBasel K ≤ basel := by
  exact basel_summable.sum_le_tsum (range K) (fun n hn => by positivity)

lemma sum_logFactor_sq_le (B : ℕ) {t : ℝ} (ht : 0 < t) :
    (∑ a ∈ range B, logFactor (((a : ℝ) + 1) ^ 2 * t)) ≤ basel / t := by
  calc
    _ ≤ ∑ a ∈ range B, 1 / (((a : ℝ) + 1) ^ 2 * t) := by
      exact sum_le_sum (fun a ha => logFactor_le_inv (by positivity))
    _ = partialBasel B / t := by
      simp only [partialBasel, sum_div, div_mul_eq_div_div]
    _ ≤ basel / t := div_le_div_of_nonneg_right (partialBasel_le B) ht.le

lemma sum_logEuler_le_harmonic (h B : ℕ) {t : ℝ} (ht : 0 < t) :
    (∑ a ∈ range h, logEuler B (((a : ℝ) + 1) * t)) ≤ basel * harmonicSum h / t := by
  calc
    _ ≤ ∑ a ∈ range h, basel / (((a : ℝ) + 1) * t) :=
      sum_le_sum (fun a ha => logEuler_le B (by positivity))
    _ = _ := by
      simp only [harmonicSum, mul_sum, sum_div, mul_one_div, div_mul_eq_div_div]

lemma harmonicSum_floor_inv {t : ℝ} (ht : 0 < t) (ht1 : t ≤ 1) :
    harmonicSum (⌊1 / t⌋₊ + 1) ≤ Real.log (1 / t) + 2 := by
  have hf := Nat.floor_le (by positivity : (0 : ℝ) ≤ 1 / t)
  have htinv : (1 : ℝ) ≤ 1 / t := (le_div_iff₀ ht).2 (by simpa using ht1)
  have hn : ((⌊1 / t⌋₊ + 1 : ℕ) : ℝ) ≤ 2 / t := by
    push_cast
    rw [show (2 : ℝ) / t = 1 / t + 1 / t by ring]
    linarith
  have hp : (0 : ℝ) < (⌊1 / t⌋₊ + 1 : ℕ) := by positivity
  have hlog := Real.log_le_log hp hn
  have hlog2 : Real.log (2 : ℝ) ≤ 1 := by
    have hh := Real.log_le_sub_one_of_pos (by norm_num : (0 : ℝ) < 2)
    linarith
  have heq : Real.log (2 / t) = Real.log 2 + Real.log (1 / t) := by
    rw [show (2 : ℝ) / t = 2 * (1 / t) by ring, Real.log_mul (by norm_num) (by positivity)]
  have hh := harmonicSum_le (⌊1 / t⌋₊ + 1)
  rw [heq] at hlog
  linarith

/-- Uniform ordered-rectangle product bound; its logarithmic coefficient is sharp. -/
theorem sum_logEuler_le (h B : ℕ) {t : ℝ} (ht : 0 < t) (ht1 : t ≤ 1) :
    (∑ a ∈ range h, logEuler B (((a : ℝ) + 1) * t)) ≤
      (basel * (Real.log (1 / t) + 2) + 4) / t := by
  let K : ℕ := ⌊1 / t⌋₊ + 1
  have hK : 1 / t < (K : ℝ) := by
    simpa only [K, Nat.cast_add, Nat.cast_one] using Nat.lt_floor_add_one (1 / t)
  have hterm (a : ℕ) : logEuler B (((a : ℝ) + 1) * t) ≤
      (if a < K then basel / (((a : ℝ) + 1) * t) else 0) +
        4 * Real.exp (-((a : ℝ) + 1) * t) := by
    by_cases ha : a < K
    · rw [ite_eq_left ha]
      exact (logEuler_le B (by positivity)).trans (le_add_of_nonneg_right (by positivity))
    · rw [ite_eq_right ha, zero_add]
      have hKa : (K : ℝ) ≤ a := by exact_mod_cast (Nat.le_of_not_gt ha)
      have hua : 1 ≤ ((a : ℝ) + 1) * t := by
        have hKt := (div_lt_iff₀ ht).1 hK
        nlinarith
      simpa only [neg_mul] using logEuler_decay B hua
  have hfirst : (∑ a ∈ range h,
      if a < K then basel / (((a : ℝ) + 1) * t) else 0) ≤
      ∑ a ∈ range K, basel / (((a : ℝ) + 1) * t) := by
    rw [← sum_filter]
    apply sum_le_sum_of_subset_of_nonneg
    · intro a ha
      exact mem_range.mpr (mem_filter.mp ha).2
    · intro a ha hnot
      exact div_nonneg basel_pos.le (by positivity)
  have hsum := sum_le_sum (fun a (_ : a ∈ range h) => hterm a)
  rw [sum_add_distrib, ← mul_sum] at hsum
  have hexp := mul_le_mul_of_nonneg_left (exp_sum_le h ht) (by norm_num : (0 : ℝ) ≤ 4)
  have heq : (∑ a ∈ range K, basel / (((a : ℝ) + 1) * t)) =
      basel * harmonicSum K / t := by
    simp only [harmonicSum, mul_sum, sum_div, mul_one_div, div_mul_eq_div_div]
  rw [heq] at hfirst
  have hh := div_le_div_of_nonneg_right
    (mul_le_mul_of_nonneg_left (harmonicSum_floor_inv ht ht1) basel_pos.le) ht.le
  dsimp only [K] at hfirst
  calc
    _ ≤ basel * harmonicSum (⌊1 / t⌋₊ + 1) / t + 4 * (1 / t) := by linarith
    _ ≤ basel * (Real.log (1 / t) + 2) / t + 4 * (1 / t) := by linarith
    _ = _ := by ring

end RectangleEuler
