import Conjectures.FeldheimWeightedTailStieltjesLimit
import Mathlib.Probability.CDF
import Mathlib.Analysis.SpecialFunctions.Log.Basic

/-!
# Feldheim–Feldheim’s weighted tail conjecture

The log-tail integral comparison for arbitrary probability laws, including
atoms and singular continuous laws. This follows §4, equation (9), of the
recorded proof at `2f800fa5191a1d747f126fa20f7e9c2b3730b085`, using right-endpoint
partition sums and dominated convergence. The underlying comparison is
also credited there to Feldheim–Feldheim, Observation 2.1.
-/

open Set MeasureTheory ProbabilityTheory Filter Finset
open scoped Topology

namespace Conjectures.FeldheimWeightedTail

noncomputable section

theorem stieltjes_tail_right_continuous (μ : Measure ℝ) [IsProbabilityMeasure μ] (x : ℝ) :
    ContinuousWithinAt (fun y => μ.real (Ioi y)) (Ici x) x := by
  have he : (fun y => μ.real (Ioi y)) = fun y => 1-cdf μ y := by
    funext y
    rw [cdf_eq_real]
    simpa only [compl_Iic] using
      (probReal_compl_eq_one_sub (μ := μ) (s := Iic y) measurableSet_Iic)
  rw [he]
  exact continuousWithinAt_const.sub ((cdf μ).right_continuous x)

theorem stieltjes_measureReal_Ioc (μ : Measure ℝ) [IsFiniteMeasure μ]
    {a b : ℝ} (hab : a ≤ b) : μ.real (Ioc a b) = μ.real (Ioi a)-μ.real (Ioi b) := by
  rw [← Ioi_sdiff_Ioi]
  exact measureReal_sdiff (Ioi_subset_Ioi hab) measurableSet_Ioi

theorem stieltjes_log_sub_le {u v : ℝ} (hu : 0 < u) (hv : 0 < v) :
    Real.log u-Real.log v ≤ (u-v)*v⁻¹ := by
  have h := Real.log_le_sub_one_of_pos (div_pos hu hv)
  rw [Real.log_div hu.ne' hv.ne'] at h
  rw [sub_mul, mul_inv_cancel₀ hv.ne', ← div_eq_mul_inv]
  exact h

theorem stieltjes_inverse_tail_bound (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (hμ : ∀ x : ℝ, 0 < μ.real (Ioi x)) {b x : ℝ} (hxb : x ≤ b) :
    ‖(μ.real (Ioi x))⁻¹‖ ≤ (μ.real (Ioi b))⁻¹ := by
  rw [Real.norm_eq_abs, abs_of_pos (inv_pos.mpr (hμ x))]
  exact inv_anti₀ (hμ b) (measureReal_mono (Ioi_subset_Ioi hxb))

theorem stieltjes_inverse_tail_integrableOn (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (hμ : ∀ x : ℝ, 0 < μ.real (Ioi x)) (a b : ℝ) :
    IntegrableOn (fun x => (μ.real (Ioi x))⁻¹) (Ioc a b) μ := by
  have hs : Antitone (fun x : ℝ => μ.real (Ioi x)) :=
    fun _ _ hxy => measureReal_mono (Ioi_subset_Ioi hxy)
  refine (integrable_const ((μ.real (Ioi b))⁻¹)).mono'
    hs.measurable.inv.aestronglyMeasurable ?_
  filter_upwards [ae_restrict_mem measurableSet_Ioc] with x hx
  exact stieltjes_inverse_tail_bound μ hμ hx.2

theorem stieltjes_log_sub_le_step (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (hμ : ∀ x : ℝ, 0 < μ.real (Ioi x)) {a b : ℝ} (hab : a < b)
    {N : ℕ} (hN : 0 < N) :
    Real.log (μ.real (Ioi a))-Real.log (μ.real (Ioi b)) ≤
      ∫ x, stieltjesStep (fun y => (μ.real (Ioi y))⁻¹) a b N x ∂μ := by
  rw [integral_stieltjesStep]
  have htel : (∑ i ∈ range N,
      (Real.log (μ.real (Ioi (stieltjesGrid a b N i))) -
        Real.log (μ.real (Ioi (stieltjesGrid a b N (i+1)))))) =
      Real.log (μ.real (Ioi a))-Real.log (μ.real (Ioi b)) := by
    rw [sum_range_sub']
    simp [stieltjesGrid_last a b hN]
  rw [← htel]
  apply sum_le_sum
  intro i _
  rw [stieltjes_measureReal_Ioc μ ((stieltjesGrid_strictMono hab hN).monotone
    (Nat.le_succ i))]
  exact stieltjes_log_sub_le (hμ _) (hμ _)

/-- Atom-safe log-tail increment bound: all quantities are those of the actual law. -/
theorem log_tail_increment_le_inverse_tail_integral (μ : Measure ℝ)
    [IsProbabilityMeasure μ] (hμ : ∀ x : ℝ, 0 < μ.real (Ioi x))
    {a b : ℝ} (hab : a < b) :
    (-Real.log (μ.real (Ioi b)))-(-Real.log (μ.real (Ioi a))) ≤
      ∫ x in Ioc a b, (μ.real (Ioi x))⁻¹ ∂μ := by
  have hc : ∀ x : ℝ, ContinuousWithinAt (fun y => (μ.real (Ioi y))⁻¹) (Ici x) x :=
    fun x => (stieltjes_tail_right_continuous μ x).inv₀ (hμ x).ne'
  have ht := integral_stieltjesStep_tendsto (f := fun y => (μ.real (Ioi y))⁻¹)
    hab hc (inv_nonneg.mpr (hμ b).le)
    (fun _ hx => stieltjes_inverse_tail_bound μ hμ hx.2) μ
  have hle := ge_of_tendsto' ht (fun n => stieltjes_log_sub_le_step μ hμ hab (Nat.succ_pos n))
  linarith

end

end Conjectures.FeldheimWeightedTail
