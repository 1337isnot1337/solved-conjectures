module

public import Conjectures.AgnosticVC.VCChaining
public import Conjectures.AgnosticVC.Learner
public import Mathlib.MeasureTheory.Function.LocallyIntegrable

@[expose] public section

namespace AgnosticVC

open Finset MeasureTheory
open scoped BigOperators

variable {I : Type*} [Fintype I] [DecidableEq I]

private def reflectCoordinates (σ : I → Bool) : (I → unitInterval) ≃ᵐ (I → unitInterval) :=
  MeasurableEquiv.piCongrRight fun i =>
    if σ i then MeasurableEquiv.refl _ else unitInterval.symmMeasurableEquiv

omit [DecidableEq I] in
private lemma reflectCoordinates_measurePreserving (σ : I → Bool) :
    MeasurePreserving (reflectCoordinates σ) (weightMeasure I) (weightMeasure I) := by
  unfold weightMeasure reflectCoordinates
  apply MeasureTheory.measurePreserving_pi
  intro i
  by_cases h : σ i = true
  · simpa [h] using MeasurePreserving.id (volume : Measure unitInterval)
  · simpa [h] using unitInterval.measurePreserving_symm

private lemma integrable_signAverage_reflect {f : (I → unitInterval) → ℝ}
    (hf : Integrable f (weightMeasure I)) :
    Integrable (fun u => signAverage (fun σ => f (reflectCoordinates σ u))) (weightMeasure I) := by
  unfold signAverage
  apply Integrable.div_const
  exact integrable_finsetSum _ (fun σ _ =>
    (reflectCoordinates_measurePreserving σ).integrable_comp_of_integrable hf)

private lemma integral_signAverage_reflect {f : (I → unitInterval) → ℝ}
    (hf : Integrable f (weightMeasure I)) :
    (∫ u, signAverage (fun σ => f (reflectCoordinates σ u)) ∂weightMeasure I) =
      ∫ u, f u ∂weightMeasure I := by
  unfold signAverage
  have hI (σ : I → Bool) : Integrable (fun u => f (reflectCoordinates σ u)) (weightMeasure I) :=
    (reflectCoordinates_measurePreserving σ).integrable_comp_of_integrable hf
  rw [integral_div, integral_finsetSum Finset.univ (fun σ _ => hI σ)]
  simp_rw [(reflectCoordinates_measurePreserving _).integral_comp' f]
  simp [nsmul_eq_mul]

/-- Maximum absolute change of any mistake count when the weights are perturbed. -/
noncomputable def maxWeightDeviation (F : Finset (Finset I)) (hF : F.Nonempty)
    (y : I → Bool) (u : I → unitInterval) : ℝ :=
  F.sup' hF fun v => |mistakeCount y (weightDraw u) v - mistakeCount y (fun _ => 1) v|

lemma continuous_maxWeightDeviation (F : Finset (Finset I)) (hF : F.Nonempty) (y : I → Bool) :
    Continuous (maxWeightDeviation F hF y) := by
  apply Continuous.finset_sup'_apply hF
  intro v hv
  apply Continuous.abs
  apply Continuous.sub _ continuous_const
  unfold mistakeCount
  apply continuous_finsetSum
  intro i hi
  split
  · exact continuous_const
  · unfold weightDraw
    fun_prop

lemma integrable_maxWeightDeviation (F : Finset (Finset I)) (hF : F.Nonempty) (y : I → Bool) :
    Integrable (maxWeightDeviation F hF y) (weightMeasure I) :=
  (continuous_maxWeightDeviation F hF y).integrable_of_hasCompactSupport
    (HasCompactSupport.of_compactSpace _)

omit [Fintype I] [DecidableEq I] in
private lemma reflect_centered_weight (σ : I → Bool) (u : I → unitInterval) (i : I) :
    weightDraw (reflectCoordinates σ u) i - 1 =
      (if σ i then 1 else -1) * (weightDraw u i - 1) := by
  have heq : reflectCoordinates σ u i = if σ i then u i else unitInterval.symm (u i) := by
    change (if σ i then MeasurableEquiv.refl _ else unitInterval.symmMeasurableEquiv) (u i) = _
    split <;> rfl
  by_cases h : σ i = true
  · simp [weightDraw, heq, h]
  · simp [weightDraw, heq, h, unitInterval.coe_symm_eq]
    ring

private lemma mistakeCount_reflect_sub (σ : I → Bool) (u : I → unitInterval) (y : I → Bool)
    (v : Finset I) :
    mistakeCount y (weightDraw (reflectCoordinates σ u)) v - mistakeCount y (fun _ => 1) v =
      signedSum (fun i => (weightDraw u i - 1) * binaryLoss (Finset.univ.filter (fun j => y j)) v i) σ := by
  unfold mistakeCount signedSum
  rw [← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro i hi
  by_cases hv : i ∈ v <;> cases hy : y i <;>
    simp [binaryLoss, hv, hy, reflect_centered_weight σ u i]

/-- VC empirical-process bound for the continuous product weight distribution used by the learner. -/
theorem integral_maxWeightDeviation_le [Nonempty I] (F : Finset (Finset I)) (hF : F.Nonempty)
    (d : ℕ) (hdpos : 0 < d) (hd : F.vcDim ≤ d) (y : I → Bool) :
    (∫ u, maxWeightDeviation F hF y u ∂weightMeasure I) ≤
      91 * Real.sqrt ((Fintype.card I : ℝ) * d) := by
  have hf := integrable_maxWeightDeviation F hF y
  rw [← integral_signAverage_reflect hf]
  calc
    _ ≤ ∫ _u : I → unitInterval, 91 * Real.sqrt ((Fintype.card I : ℝ) * d) ∂weightMeasure I := by
      apply integral_mono (integrable_signAverage_reflect hf) (integrable_const _)
      intro u
      have hamp : ∀ i, |weightDraw u i - 1| ≤ 1 := by
        intro i
        apply abs_le.mpr
        have hlo : 0 ≤ (u i : ℝ) := (u i).2.1
        have hhi : (u i : ℝ) ≤ 1 := (u i).2.2
        unfold weightDraw
        constructor <;> linarith
      change signAverage (fun σ => F.sup' hF (fun v =>
        |mistakeCount y (weightDraw (reflectCoordinates σ u)) v - mistakeCount y (fun _ => 1) v|)) ≤ _
      simp_rw [mistakeCount_reflect_sub]
      exact signAverage_max_binaryLoss_le F hF d hdpos hd _ (fun i => weightDraw u i - 1) hamp
    _ = _ := by simp

end AgnosticVC
