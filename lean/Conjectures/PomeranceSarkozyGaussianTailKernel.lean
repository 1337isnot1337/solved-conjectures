module
public import Conjectures.PomeranceSarkozyContinuousTailCross
public import Conjectures.PomeranceSarkozyWeakPositivePart
public import Conjectures.PomeranceSarkozyGaussianAbsolute
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory ProbabilityTheory Set
open scoped NNReal ENNReal ProbabilityTheory

theorem gaussianUnitDifference_law :
    ((gaussianReal 0 1).prod (gaussianReal 0 1)).map (fun z : ℝ×ℝ=>z.1-z.2)=
      gaussianReal 0 2 := by
  let μ := gaussianReal 0 1
  let ρ := μ.prod μ
  let X := (Prod.fst : ℝ×ℝ→ℝ)
  let Y (z : ℝ×ℝ) := -z.2
  have hX : HasLaw X μ ρ := measurePreserving_fst.hasLaw
  have hY : HasLaw Y μ ρ := by
    have hS : HasLaw (Prod.snd : ℝ×ℝ→ℝ) μ ρ := measurePreserving_snd.hasLaw
    have hN : HasLaw (fun x : ℝ=> -x) μ μ := by
      refine ⟨(by fun_prop),?_⟩
      unfold μ
      rw [gaussianReal_map_neg,neg_zero]
    exact hN.comp hS
  have hI : IndepFun X Y ρ := indepFun_prod (X:=id) (Y:=fun x : ℝ=> -x) measurable_id (by fun_prop)
  have h := gaussianReal_add_gaussianReal_of_indepFun hI hX hY
  change ρ.map (X+Y)=_
  rw [h]
  norm_num

/-- The Gaussian covariance kernel has both source descriptions:
an integral of Gaussian tails and a shifted positive difference. -/
theorem gaussian_shifted_tail_kernel (a : ℝ) :
    (∫⁻ s : ℝ,(gaussianReal 0 1) (Set.Ioi (s+a))*(gaussianReal 0 1) (Set.Iic s)).toReal =
      ∫ x : ℝ,shiftedPositivePart a x ∂gaussianReal 0 2 := by
  rw [continuous_shifted_tail_cross]
  have hF : Measurable (fun x : ℝ=>ENNReal.ofReal (shiftedPositivePart a x)) := by
    unfold shiftedPositivePart
    fun_prop
  have hP : ∀ᵐ x : ℝ ∂(gaussianReal 0 2),0≤ shiftedPositivePart a x :=
    Filter.Eventually.of_forall (shiftedPositivePart_nonneg a)
  rw [integral_eq_lintegral_of_nonneg_ae hP (by unfold shiftedPositivePart; fun_prop),
    ← gaussianUnitDifference_law,lintegral_map hF (by fun_prop)]
  congr 1
  apply lintegral_congr
  intro z
  unfold shiftedPositivePart
  by_cases h : 0≤z.1-z.2-a
  · rw [max_eq_left h]
  · rw [max_eq_right (le_of_not_ge h),ENNReal.ofReal_zero]
    exact ENNReal.ofReal_eq_zero.mpr (le_of_not_ge h)

end PomeranceSarkozy
