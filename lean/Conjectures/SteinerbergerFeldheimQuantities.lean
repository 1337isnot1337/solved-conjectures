import Conjectures.SteinerbergerFeldheimBounds
import Mathlib.MeasureTheory.Integral.Layercake
import Mathlib.Analysis.SpecialFunctions.ImproperIntegrals

/-!
# Steinerberger's quantitative Feldheim-tail conjecture

The actual expectation and median of the constructed law.  The expectation
is identified with its survival integral by the layer-cake theorem; the
median is a root of `m + m^2/200 = log 2` and has probability one half on
each side.  These are the quantities occurring in the original questions.
-/

open MeasureTheory Set Filter
open scoped ENNReal Topology

namespace SteinerbergerFeldheim
noncomputable section

theorem integrableOn_survival : IntegrableOn survival (Ioi 0) := by
  apply (integrableOn_exp_neg_Ioi 0).mono' continuous_survival.aestronglyMeasurable
  exact ae_of_all _ (fun x => by
    rw [Real.norm_eq_abs, abs_of_pos (survival_pos x)]
    exact survival_le_exp_neg x)

theorem integrable_identity : Integrable (fun x : ℝ => x) law := by
  constructor
  · exact measurable_id.aestronglyMeasurable
  · rw [hasFiniteIntegral_iff_ofReal law_nonnegative_ae,
      lintegral_eq_lintegral_meas_lt law law_nonnegative_ae measurable_id.aemeasurable]
    calc
      _ = ∫⁻ t in Ioi (0 : ℝ), ENNReal.ofReal (survival t) := by
        apply setLIntegral_congr_fun measurableSet_Ioi
        intro t ht
        exact law_Ioi ht.le
      _ < ∞ := integrableOn_survival.lintegral_lt_top

/-- The expectation in Steinerberger's second question. -/
def mean : ℝ := ∫ x, x ∂law

theorem mean_eq_survival_integral : mean = ∫ x in Ioi (0 : ℝ), survival x := by
  unfold mean
  rw [integrable_identity.integral_eq_integral_meas_lt law_nonnegative_ae]
  exact setIntegral_congr_fun measurableSet_Ioi (fun x hx => law_real_Ioi hx.le)

theorem mean_pos : 0 < mean := by
  rw [mean_eq_survival_integral]
  apply (integral_pos_iff_support_of_nonneg (fun x => (survival_pos x).le)
    integrableOn_survival).mpr
  have hs : Function.support survival = univ := by
    ext x
    simp only [Function.mem_support, ne_eq, (survival_pos x).ne', not_false_eq_true, mem_univ]
  simp [hs]

theorem integrableOn_power_exp (n : ℕ) :
    IntegrableOn (fun x : ℝ => x ^ n * Real.exp (-x)) (Ioi 0) := by
  have hn : -1 < (n : ℝ) := by have := Nat.cast_nonneg (α := ℝ) n; linarith
  simpa only [Real.rpow_natCast, Real.rpow_one, neg_one_mul] using
    (integrableOn_rpow_mul_exp_neg_mul_rpow (s := (n : ℝ)) (p := 1) (b := 1)
      hn (by norm_num) (by norm_num))

theorem integral_power_exp (n : ℕ) :
    (∫ x in Ioi (0 : ℝ), x ^ n * Real.exp (-x)) = n.factorial := by
  have hn : 0 < (n : ℝ) + 1 := by positivity
  simpa [Real.rpow_natCast, Real.Gamma_nat_eq_factorial] using
    (Real.integral_rpow_mul_exp_neg_mul_Ioi (a := (n : ℝ) + 1) (r := 1) hn (by norm_num))

theorem survival_upper_polynomial (x : ℝ) :
    survival x ≤ Real.exp (-x) - (x ^ 2 * Real.exp (-x)) / 200 +
      (x ^ 4 * Real.exp (-x)) / 80000 := by
  calc
    survival x = Real.exp (-x) * Real.exp (-(x ^ 2 / 200)) := by
      rw [← Real.exp_add]
      rfl
    _ ≤ Real.exp (-x) * (1 - x ^ 2 / 200 + (x ^ 2 / 200) ^ 2 / 2) :=
      mul_le_mul_of_nonneg_left (exp_neg_le_quadratic (by positivity)) (Real.exp_pos _).le
    _ = _ := by ring

/-- The fourth-order exponential bound gives `E[X] ≤ 0.9903`. -/
theorem mean_upper : mean ≤ 9903 / 10000 := by
  let G : ℝ → ℝ := fun x => Real.exp (-x) - (x ^ 2 * Real.exp (-x)) / 200 +
    (x ^ 4 * Real.exp (-x)) / 80000
  have h0 := integrableOn_exp_neg_Ioi 0
  have h2 := (integrableOn_power_exp 2).div_const 200
  have h4 := (integrableOn_power_exp 4).div_const 80000
  have h02 : IntegrableOn (fun x : ℝ => Real.exp (-x) -
      (x ^ 2 * Real.exp (-x)) / 200) (Ioi 0) := h0.sub h2
  have hG : IntegrableOn G (Ioi 0) := h02.add h4
  have h := integral_mono integrableOn_survival hG survival_upper_polynomial
  rw [← mean_eq_survival_integral] at h
  have he : (∫ x in Ioi (0 : ℝ), G x) = 9903 / 10000 := by
    dsimp [G]
    rw [integral_add h02 h4, integral_sub h0 h2,
      integral_div, integral_div, integral_exp_neg_Ioi_zero,
      integral_power_exp 2, integral_power_exp 4]
    norm_num
  exact he ▸ h

theorem mean_coefficient_gap : 401 / 400 < 1 / mean := by
  apply (lt_div_iff₀ mean_pos).mpr
  nlinarith [mean_upper]

theorem exists_median_parameter :
    ∃ m : ℝ, 1 / 2 < m ∧ m ≤ 1 ∧ m + m ^ 2 / 200 = Real.log 2 := by
  let H : ℝ → ℝ := fun x => x + x ^ 2 / 200
  have hlo : H (1 / 2) < Real.log 2 := by
    have h := Real.le_log_one_add_of_nonneg (show (0 : ℝ) ≤ 1 by norm_num)
    norm_num [H] at h ⊢
    linarith
  have hhi : Real.log 2 < H 1 := by
    have h := Real.log_lt_sub_one_of_pos (show (0 : ℝ) < 2 by norm_num)
      (show (2 : ℝ) ≠ 1 by norm_num)
    norm_num [H] at h ⊢
    linarith
  obtain ⟨m, hm, he⟩ := intermediate_value_Icc (a := (1 / 2 : ℝ)) (b := 1)
    (by norm_num) (by fun_prop : ContinuousOn H (Icc (1 / 2) 1)) ⟨hlo.le, hhi.le⟩
  refine ⟨m, ?_, hm.2, he⟩
  by_contra! h
  have heq : m = 1 / 2 := le_antisymm h hm.1
  subst m
  linarith

/-- A median of the continuous counterexample law. -/
def median : ℝ := Classical.choose exists_median_parameter

theorem median_gt_half : 1 / 2 < median :=
  (Classical.choose_spec exists_median_parameter).1

theorem median_pos : 0 < median := lt_trans (by norm_num) median_gt_half

theorem median_equation : median + median ^ 2 / 200 = Real.log 2 :=
  (Classical.choose_spec exists_median_parameter).2.2

theorem survival_median : survival median = 1 / 2 := by
  unfold survival
  rw [show -median - median ^ 2 / 200 = -Real.log 2 by linarith [median_equation],
    Real.exp_neg, Real.exp_log (by norm_num)]
  norm_num

theorem median_upper_probability : law (Ici median) = 1 / 2 := by
  rw [law_Ici median_pos.le, survival_median, ENNReal.ofReal_div_of_pos (by norm_num)]
  norm_num

theorem median_lower_probability : law (Iic median) = 1 / 2 := by
  rw [← compl_Ioi, prob_compl_eq_one_sub measurableSet_Ioi,
    law_Ioi median_pos.le, survival_median, ENNReal.ofReal_div_of_pos (by norm_num)]
  norm_num [ENNReal.one_sub_inv_two]

/-- The half-probability median is unique; the normalization has no choice ambiguity. -/
theorem median_unique {m : ℝ} (hlo : law (Iic m) = 1 / 2)
    (hhi : law (Ici m) = 1 / 2) : m = median := by
  have hm : 0 < m := by
    by_contra! hm
    rw [law_Iic_of_nonpos hm] at hlo
    have hreal := congrArg ENNReal.toReal hlo
    norm_num at hreal
  have he := hhi.trans median_upper_probability.symm
  rw [law_Ici hm.le, law_Ici median_pos.le] at he
  have hs : survival m = survival median := by
    have h := congrArg ENNReal.toReal he
    simpa only [ENNReal.toReal_ofReal (survival_pos m).le,
      ENNReal.toReal_ofReal (survival_pos median).le] using h
  exact survival_strictAntiOn.injOn hm.le median_pos.le hs

theorem median_coefficient_gap : 401 / 400 < Real.log 2 / median := by
  apply (lt_div_iff₀ median_pos).mpr
  have h := median_gt_half
  rw [← median_equation]
  nlinarith [mul_pos median_pos (sub_pos.mpr h)]

end
end SteinerbergerFeldheim
