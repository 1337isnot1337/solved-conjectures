import Mathlib.Analysis.Convex.SpecificFunctions.Basic
import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic
import Mathlib.MeasureTheory.Integral.Gamma
import Mathlib.Analysis.Real.Pi.Bounds
import Mathlib.Tactic

/-!
# Steinerberger's quantitative Feldheim-tail conjecture

Analytic estimates for the quadratic-hazard counterexample in the existing
`results/steinerberger-feldheim-tail/PROOF.md`. The conjectures are Stefan
Steinerberger's two questions in *A Sharp Estimate for Probability Distributions*,
arXiv:1801.00663v3, §1.3, p. 3. The repository records the disproof argument;
the repository's priority qualification is preserved in the result documentation.

This module proves the uniform integral estimate used by that argument.
It is only an analytic component; the probability law and the original joint
event probabilities are linked in the companion formalization.
-/

open Set MeasureTheory Real
open scoped Interval

namespace Conjectures.SteinerbergerFeldheim

noncomputable def survival (x : ℝ) : ℝ := exp (-x - x ^ 2 / 200)

noncomputable def density (x : ℝ) : ℝ := (1 + x / 100) * survival x

noncomputable def tailIntegral (z : ℝ) : ℝ :=
  ∫ t in (0 : ℝ)..1, (1 + z / 100 * (1 - t)) * exp (-(z ^ 2 / 100) * t ^ 2)

lemma exp_neg_le_quadratic {u : ℝ} (hu : 0 ≤ u) :
    exp (-u) ≤ 1 - u + u ^ 2 / 2 := by
  have hd (x : ℝ) : HasDerivAt (fun y : ℝ => 1 - y + y ^ 2 / 2 - exp (-y))
      (-1 + x + exp (-x)) x := by
    convert (((hasDerivAt_const x (1 : ℝ)).sub (hasDerivAt_id x)).add
      (((hasDerivAt_id x).pow 2).div_const 2)).sub
      ((hasDerivAt_id x).neg.exp) using 1 <;> first | rfl | (dsimp; ring)
  have hm : MonotoneOn (fun y : ℝ => 1 - y + y ^ 2 / 2 - exp (-y)) (Ici 0) := by
    apply monotoneOn_of_hasDerivWithinAt_nonneg (convex_Ici (0 : ℝ))
    · fun_prop
    · intro x hx
      exact (hd x).hasDerivWithinAt
    · intro x hx
      have h := Real.add_one_le_exp (-x)
      linarith
  have h := hm (by simp : (0 : ℝ) ∈ Ici 0) hu hu
  simpa using h

lemma exp_secant {a u : ℝ} (hu0 : 0 ≤ u) (hu1 : u ≤ 1) :
    exp (-a * u) ≤ 1 - (1 - exp (-a)) * u := by
  have h := convexOn_exp.2 (show (0 : ℝ) ∈ univ from mem_univ _)
    (show -a ∈ univ from mem_univ _) (sub_nonneg.mpr hu1) hu0
    (show 1 - u + u = 1 by ring)
  calc
    _ = exp (u * -a) := congrArg exp (by ring)
    _ ≤ (1 - u) + u * exp (-a) := by simpa using h
    _ = _ := by ring

lemma one_sub_exp_lower {a : ℝ} (ha0 : 0 ≤ a) (ha1 : a ≤ 1 / 2) :
    3 * a / 4 ≤ 1 - exp (-a) := by
  have h := exp_neg_le_quadratic ha0
  nlinarith

lemma half_exp_lower : 3 / 8 ≤ 1 - exp (-(1 / 2 : ℝ)) := by
  have h := Real.quadratic_le_exp_of_nonneg (show 0 ≤ (1 / 2 : ℝ) by norm_num)
  have hp := exp_pos (1 / 2 : ℝ)
  rw [exp_neg]
  have he : (8 / 5 : ℝ) ≤ exp (1 / 2) := by linarith
  have hi : (exp (1 / 2 : ℝ))⁻¹ ≤ (5 / 8 : ℝ) := by
    rw [inv_le_comm₀ hp (by norm_num)]
    norm_num
    exact he
  linarith

lemma integral_secant_polynomial (c k : ℝ) :
    (∫ t in (0 : ℝ)..1, (1 + c * (1 - t)) * (1 - k * t ^ 2)) =
      1 + c / 2 - k * (1 / 3 + c / 12) := by
  let F : ℝ → ℝ := fun t => (1 + c) * t - c * t ^ 2 / 2 -
    k * (1 + c) * t ^ 3 / 3 + k * c * t ^ 4 / 4
  have hd (t : ℝ) : HasDerivAt F ((1 + c * (1 - t)) * (1 - k * t ^ 2)) t := by
    dsimp [F]
    convert ((((hasDerivAt_id t).const_mul (1 + c)).sub
      ((((hasDerivAt_id t).pow 2).const_mul c).div_const 2)).sub
      ((((hasDerivAt_id t).pow 3).const_mul (k * (1 + c))).div_const 3)).add
      ((((hasDerivAt_id t).pow 4).const_mul (k * c)).div_const 4) using 1 <;> first | rfl | (dsimp; ring)
  have h := intervalIntegral.integral_eq_sub_of_hasDerivAt (fun t _ => hd t)
    (show IntervalIntegrable (fun t => (1 + c * (1 - t)) * (1 - k * t ^ 2)) volume 0 1
      from (by fun_prop : Continuous _).intervalIntegrable _ _)
  calc
    _ = F 1 - F 0 := h
    _ = _ := by dsimp [F]; ring

lemma tailIntegral_secant {z : ℝ} (hz : 0 ≤ z) :
    tailIntegral z ≤ 1 + z / 200 -
      (1 - exp (-(z ^ 2 / 100))) * (1 / 3 + z / 1200) := by
  unfold tailIntegral
  calc
    _ ≤ ∫ t in (0 : ℝ)..1, (1 + z / 100 * (1 - t)) *
        (1 - (1 - exp (-(z ^ 2 / 100))) * t ^ 2) := by
      apply intervalIntegral.integral_mono_on (by norm_num)
        ((by fun_prop : Continuous _).intervalIntegrable _ _)
        ((by fun_prop : Continuous _).intervalIntegrable _ _)
      intro t ht
      apply mul_le_mul_of_nonneg_left
      · exact exp_secant (sq_nonneg t) (by nlinarith [ht.1, ht.2])
      · have ht1 : 0 ≤ 1 - t := sub_nonneg.mpr ht.2
        positivity
    _ = _ := by rw [integral_secant_polynomial]; ring

lemma tailIntegral_small {z : ℝ} (hz : 0 ≤ z) (ha : z ^ 2 / 100 ≤ 1 / 2) :
    tailIntegral z ≤ 401 / 400 := by
  have h := tailIntegral_secant hz
  have he := one_sub_exp_lower (show 0 ≤ z ^ 2 / 100 by positivity) ha
  have hk : 0 ≤ 1 / 3 + z / 1200 := by positivity
  have hm := mul_le_mul_of_nonneg_right he hk
  have hs := sq_nonneg (z - 1)
  have hz3 : 0 ≤ z ^ 3 := by positivity
  nlinarith

lemma integral_gaussian_unit_le {a : ℝ} (ha : 0 < a) :
    (∫ t in (0 : ℝ)..1, exp (-a * t ^ 2)) ≤ sqrt (π / a) / 2 := by
  rw [intervalIntegral.integral_of_le (by norm_num)]
  have hi := (integrable_exp_neg_mul_sq ha).integrableOn (s := Ioi (0 : ℝ))
  calc
    _ ≤ ∫ t in Ioi (0 : ℝ), exp (-a * t ^ 2) := by
      apply setIntegral_mono_set hi (ae_of_all _ (fun t => exp_nonneg _))
      exact Filter.Eventually.of_forall (fun t ht => ht.1)
    _ = _ := integral_gaussian_Ioi a

lemma integral_gaussian_large {a : ℝ} (ha : 1 / 2 ≤ a) :
    (∫ t in (0 : ℝ)..1, exp (-a * t ^ 2)) ≤ 7 / 8 := by
  calc
    _ ≤ ∫ t in (0 : ℝ)..1, 1 - (3 / 8 : ℝ) * t ^ 2 := by
      apply intervalIntegral.integral_mono_on (by norm_num)
        ((by fun_prop : Continuous _).intervalIntegrable _ _)
        ((by fun_prop : Continuous _).intervalIntegrable _ _)
      intro t ht
      calc
        _ ≤ exp (-(1 / 2 : ℝ) * t ^ 2) := by
          apply exp_le_exp.mpr
          nlinarith [sq_nonneg t]
        _ ≤ 1 - (1 - exp (-(1 / 2 : ℝ))) * t ^ 2 :=
          exp_secant (sq_nonneg t) (by nlinarith [ht.1, ht.2])
        _ ≤ _ := by nlinarith [half_exp_lower, sq_nonneg t]
    _ = _ := by
      have h := integral_secant_polynomial 0 (3 / 8)
      norm_num at h ⊢

lemma weighted_gaussian_unit_le {a : ℝ} (ha : 0 < a) :
    (∫ t in (0 : ℝ)..1, (1 - t) * exp (-a * t ^ 2)) ≤ sqrt (π / a) / 2 := by
  calc
    _ ≤ ∫ t in (0 : ℝ)..1, exp (-a * t ^ 2) := by
      apply intervalIntegral.integral_mono_on (by norm_num)
        ((by fun_prop : Continuous _).intervalIntegrable _ _)
        ((by fun_prop : Continuous _).intervalIntegrable _ _)
      intro t ht
      have h := exp_nonneg (-a * t ^ 2)
      nlinarith [ht.1]
    _ ≤ _ := integral_gaussian_unit_le ha

lemma scaled_gaussian_lt {z : ℝ} (hz : 0 < z) :
    z / 100 * (sqrt (π / (z ^ 2 / 100)) / 2) < 1 / 8 := by
  have ha : 0 < z ^ 2 / 100 := by positivity
  have hs := sq_sqrt (div_nonneg pi_pos.le ha.le)
  have hid : (z ^ 2 / 100) * (sqrt (π / (z ^ 2 / 100))) ^ 2 = π := by
    rw [hs, mul_div_cancel₀ _ (ne_of_gt ha)]
  have hp := Real.pi_lt_four
  have hnonneg : 0 ≤ z / 100 * (sqrt (π / (z ^ 2 / 100)) / 2) := by positivity
  nlinarith [sq_nonneg (z / 100 * (sqrt (π / (z ^ 2 / 100)) / 2) + 1 / 8)]

lemma tailIntegral_large {z : ℝ} (hz : 0 < z) (ha : 1 / 2 ≤ z ^ 2 / 100) :
    tailIntegral z < 1 := by
  have heq : tailIntegral z =
      (∫ t in (0 : ℝ)..1, exp (-(z ^ 2 / 100) * t ^ 2)) + z / 100 *
      (∫ t in (0 : ℝ)..1, (1 - t) * exp (-(z ^ 2 / 100) * t ^ 2)) := by
    unfold tailIntegral
    rw [← intervalIntegral.integral_const_mul, ← intervalIntegral.integral_add]
    · apply intervalIntegral.integral_congr
      intro t ht
      ring
    all_goals exact (by fun_prop : Continuous _).intervalIntegrable _ _
  rw [heq]
  have hg := weighted_gaussian_unit_le (show 0 < z ^ 2 / 100 by positivity)
  have hs := scaled_gaussian_lt hz
  have hm := mul_le_mul_of_nonneg_left hg (show 0 ≤ z / 100 by positivity)
  have hf := integral_gaussian_large ha
  linarith

/-- The uniform bound in equations (3)–(4) of the repository's proof. -/
theorem tailIntegral_le {z : ℝ} (hz : 0 < z) : tailIntegral z ≤ 401 / 400 := by
  by_cases ha : z ^ 2 / 100 ≤ 1 / 2
  · exact tailIntegral_small hz.le ha
  · have h := tailIntegral_large hz (le_of_lt (lt_of_not_ge ha))
    linarith

lemma exp_moment_integrable (n : ℕ) :
    IntegrableOn (fun x : ℝ => x ^ n * exp (-x)) (Ioi 0) := by
  have h := Real.GammaIntegral_convergent (show 0 < (n : ℝ) + 1 by positivity)
  simpa [Real.rpow_natCast, mul_comm] using h

lemma exp_moment_integral (n : ℕ) :
    (∫ x in Ioi (0 : ℝ), x ^ n * exp (-x)) = (n.factorial : ℝ) := by
  rw [← Real.Gamma_nat_eq_factorial, Real.Gamma_eq_integral (by positivity)]
  congr 1
  funext x
  simp [Real.rpow_natCast, mul_comm]

lemma survival_integrable : IntegrableOn survival (Ioi 0) := by
  have hi : IntegrableOn (fun x : ℝ => exp (-x)) (Ioi 0) := by
    simpa using exp_moment_integrable 0
  apply hi.mono' (by unfold survival; fun_prop)
  apply Filter.Eventually.of_forall
  intro x
  unfold survival
  rw [Real.norm_eq_abs, abs_of_pos (exp_pos _)]
  apply exp_le_exp.mpr
  nlinarith [sq_nonneg x]

noncomputable def meanValue : ℝ := ∫ x in Ioi (0 : ℝ), survival x

lemma meanValue_le : meanValue ≤ 9903 / 10000 := by
  have hi0 : IntegrableOn (fun x : ℝ => exp (-x)) (Ioi 0) := by
    simpa using exp_moment_integrable 0
  have hi2 := (exp_moment_integrable 2).div_const 200
  have hi4 := (exp_moment_integrable 4).div_const 80000
  have hi02 : Integrable (fun x : ℝ => exp (-x) - x ^ 2 * exp (-x) / 200)
      (volume.restrict (Ioi 0)) := by
    simpa only [IntegrableOn, Pi.sub_def] using (hi0.sub hi2)
  have hcomp (x : ℝ) : survival x ≤
      exp (-x) - x ^ 2 * exp (-x) / 200 + x ^ 4 * exp (-x) / 80000 := by
    have h := mul_le_mul_of_nonneg_left
      (exp_neg_le_quadratic (show 0 ≤ x ^ 2 / 200 by positivity)) (exp_nonneg (-x))
    unfold survival
    rw [sub_eq_add_neg, exp_add]
    convert h using 1
    ring
  unfold meanValue
  calc
    _ ≤ ∫ x in Ioi (0 : ℝ), exp (-x) - x ^ 2 * exp (-x) / 200 +
        x ^ 4 * exp (-x) / 80000 := integral_mono survival_integrable (Integrable.add hi02 hi4) hcomp
    _ = _ := by
      rw [integral_add hi02 hi4, integral_sub hi0 hi2,
        integral_div, integral_div]
      have h0 : (∫ x in Ioi (0 : ℝ), exp (-x)) = 1 := by
        simpa only [pow_zero, one_mul, Nat.factorial_zero, Nat.cast_one] using exp_moment_integral 0
      have h2 := exp_moment_integral 2
      have h4 := exp_moment_integral 4
      norm_num at h2 h4
      rw [h0, h2, h4]
      norm_num

lemma meanValue_pos : 0 < meanValue := by
  unfold meanValue
  apply (setIntegral_pos_iff_support_of_nonneg_ae _ survival_integrable).mpr
  · have hs : Function.support survival = univ := by
      ext x
      simp [Function.mem_support, survival, exp_ne_zero]
    rw [hs, univ_inter, volume_Ioi]
    exact ENNReal.zero_lt_top
  · exact Filter.Eventually.of_forall (fun x => (exp_pos _).le)

lemma reciprocal_mean_gt : 401 / 400 < 1 / meanValue := by
  rw [lt_div_iff₀ meanValue_pos]
  have h := meanValue_le
  nlinarith

noncomputable def medianValue : ℝ := sqrt (10000 + 200 * log 2) - 100

lemma log_two_gt_two_thirds : 2 / 3 < log (2 : ℝ) := by
  have h := Real.lt_log_one_add_of_pos (show 0 < (1 : ℝ) by norm_num)
  norm_num at h ⊢
  exact h

lemma medianValue_pos : 0 < medianValue := by
  have hl : 0 < log (2 : ℝ) := Real.log_pos (by norm_num)
  have hs : 100 < sqrt (10000 + 200 * log (2 : ℝ)) := by
    apply (lt_sqrt (by norm_num)).mpr
    nlinarith
  unfold medianValue
  linarith

lemma medianValue_equation : medianValue + medianValue ^ 2 / 200 = log 2 := by
  have hl : 0 < log (2 : ℝ) := Real.log_pos (by norm_num)
  have hs := sq_sqrt (show 0 ≤ 10000 + 200 * log (2 : ℝ) by positivity)
  unfold medianValue
  nlinarith

lemma medianValue_gt_half : 1 / 2 < medianValue := by
  have hp := medianValue_pos
  have he := medianValue_equation
  have hl := log_two_gt_two_thirds
  by_contra h
  have hm : medianValue ≤ 1 / 2 := le_of_not_gt h
  nlinarith

lemma normalized_median_gt : 401 / 400 < log 2 / medianValue := by
  rw [lt_div_iff₀ medianValue_pos]
  have he := medianValue_equation
  have hm := medianValue_gt_half
  nlinarith

end Conjectures.SteinerbergerFeldheim
