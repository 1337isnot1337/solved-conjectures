import Conjectures.FeldheimWeightedTailBasic
import Mathlib.Probability.CDF
import Mathlib.Analysis.SpecialFunctions.Log.Basic

/-!
# Feldheim–Feldheim’s weighted tail conjecture

Actual probability-law tails, their right-continuous monotone logarithms,
and the rectangle inequality forced by an eventually bounded weighted-tail
ratio. The laws are arbitrary probability measures, including measures with
atoms and singular continuous measures.
-/

open Set MeasureTheory ProbabilityTheory Filter
open scoped Topology

namespace Conjectures.FeldheimWeightedTail

noncomputable section

def survival (μ : Measure ℝ) (x : ℝ) : ℝ := μ.real (Ioi x)

/-- Every finite upper threshold has positive probability. -/
def UnboundedLaw (μ : Measure ℝ) : Prop := ∀ x : ℝ, 0 < survival μ x

def logTail (μ : Measure ℝ) (x : ℝ) : ℝ := -Real.log (survival μ x)

def weightedTail (μ ν : Measure ℝ) (t m : ℝ) : ℝ :=
  (μ.prod ν).real {p : ℝ × ℝ | m < t*p.1+(1-t)*p.2}

def tailRatio (μ ν : Measure ℝ) (t m : ℝ) : ℝ :=
  weightedTail μ ν t m/(survival μ m*survival ν m)

theorem survival_nonneg (μ : Measure ℝ) (x : ℝ) : 0 ≤ survival μ x := measureReal_nonneg

theorem survival_le_one (μ : Measure ℝ) [IsProbabilityMeasure μ] (x : ℝ) :
    survival μ x ≤ 1 := measureReal_le_one

theorem survival_antitone (μ : Measure ℝ) [IsProbabilityMeasure μ] :
    Antitone (survival μ) := by
  intro x y hxy
  exact measureReal_mono (Ioi_subset_Ioi hxy)

theorem survival_eq_one_sub_cdf (μ : Measure ℝ) [IsProbabilityMeasure μ] (x : ℝ) :
    survival μ x = 1-cdf μ x := by
  rw [cdf_eq_real]
  simpa only [survival, compl_Iic] using
    (probReal_compl_eq_one_sub (μ := μ) (s := Iic x) measurableSet_Iic)

theorem survival_right_continuous (μ : Measure ℝ) [IsProbabilityMeasure μ] (x : ℝ) :
    ContinuousWithinAt (survival μ) (Ici x) x := by
  have he : survival μ = fun y => 1-cdf μ y := funext (survival_eq_one_sub_cdf μ)
  rw [he]
  exact continuousWithinAt_const.sub ((cdf μ).right_continuous x)

theorem survival_tendsto_zero (μ : Measure ℝ) [IsProbabilityMeasure μ] :
    Tendsto (survival μ) atTop (𝓝 0) := by
  have he : survival μ = fun y => 1-cdf μ y := funext (survival_eq_one_sub_cdf μ)
  rw [he]
  simpa only [sub_self] using
    (tendsto_const_nhds : Tendsto (fun _ : ℝ => (1 : ℝ)) atTop (𝓝 1)).sub
      (tendsto_cdf_atTop μ)

theorem logTail_nonneg (μ : Measure ℝ) [IsProbabilityMeasure μ] (x : ℝ) :
    0 ≤ logTail μ x := by
  exact neg_nonneg.mpr (Real.log_nonpos (survival_nonneg μ x) (survival_le_one μ x))

theorem logTail_monotone (μ : Measure ℝ) [IsProbabilityMeasure μ] (hμ : UnboundedLaw μ) :
    Monotone (logTail μ) := by
  intro x y hxy
  exact neg_le_neg (Real.log_le_log (hμ y) (survival_antitone μ hxy))

theorem logTail_right_continuous (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (hμ : UnboundedLaw μ) (x : ℝ) :
    ContinuousWithinAt (logTail μ) (Ici x) x := by
  exact ((survival_right_continuous μ x).log (hμ x).ne').neg

theorem logTail_tendsto_atTop (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (hμ : UnboundedLaw μ) : Tendsto (logTail μ) atTop atTop := by
  have hs : Tendsto (survival μ) atTop (𝓝[>] (0 : ℝ)) :=
    tendsto_nhdsWithin_iff.mpr ⟨survival_tendsto_zero μ, Filter.Eventually.of_forall hμ⟩
  exact tendsto_neg_atBot_atTop.comp (Real.tendsto_log_nhdsGT_zero.comp hs)

theorem logTail_measurable (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (hμ : UnboundedLaw μ) : Measurable (logTail μ) := (logTail_monotone μ hμ).measurable

theorem exp_neg_logTail (μ : Measure ℝ) (hμ : UnboundedLaw μ) (x : ℝ) :
    Real.exp (-logTail μ x) = survival μ x := by
  simp only [logTail, neg_neg, Real.exp_log (hμ x)]

theorem exp_logTail (μ : Measure ℝ) (hμ : UnboundedLaw μ) (x : ℝ) :
    Real.exp (logTail μ x) = (survival μ x)⁻¹ := by
  rw [logTail, Real.exp_neg, Real.exp_log (hμ x)]

/-- Independence is literal product measure in the law formulation. -/
theorem rectangle_probability_le (μ ν : Measure ℝ)
    [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    {t : ℝ} (ht : 0 < t) (ht1 : t < 1) (x y : ℝ) :
    survival μ x*survival ν y ≤ weightedTail μ ν t (t*x+(1-t)*y) := by
  rw [survival, survival, ← measureReal_prod_prod]
  refine measureReal_mono ?_ (by finiteness)
  intro p hp
  change t*x+(1-t)*y < t*p.1+(1-t)*p.2
  have h₁ := mul_lt_mul_of_pos_left hp.1 ht
  have h₂ := mul_lt_mul_of_pos_left hp.2 (by linarith : 0 < 1-t)
  linarith

/-- An actual eventual probability comparison gives the exact log-tail rectangle inequality. -/
theorem rectangleBound_of_probability_bound (μ ν : Measure ℝ)
    [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (hμ : UnboundedLaw μ) (hν : UnboundedLaw ν)
    {t T C : ℝ} (ht : 0 < t) (ht1 : t < 1) (hC : 0 < C)
    (hbound : ∀ m, T ≤ m → weightedTail μ ν t m ≤ C*survival μ m*survival ν m) :
    RectangleBoundOn (logTail μ) (logTail ν) (Ici T) t (Real.log C) := by
  intro x hx y hy
  let m := t*x+(1-t)*y
  have hm : T ≤ m := by
    have h₁ := mul_le_mul_of_nonneg_left hx ht.le
    have h₂ := mul_le_mul_of_nonneg_left hy (by linarith : 0 ≤ 1-t)
    dsimp only [m]
    nlinarith
  have hp := (rectangle_probability_le μ ν ht ht1 x y).trans (hbound m hm)
  have hl := Real.log_le_log (mul_pos (hμ x) (hν y)) hp
  rw [Real.log_mul (hμ x).ne' (hν y).ne',
    Real.log_mul (mul_ne_zero hC.ne' (hμ m).ne') (hν m).ne',
    Real.log_mul hC.ne' (hμ m).ne'] at hl
  dsimp only [logTail]
  dsimp only [m] at hl
  linarith

end

end Conjectures.FeldheimWeightedTail
