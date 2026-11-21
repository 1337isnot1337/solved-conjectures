import Conjectures.LopezPousoSeguraBesselEndpoint
open MeasureTheory Filter
open scoped Topology
namespace BesselWeights

theorem kernel_integrable_finite (μ : Measure ℝ) [IsFiniteMeasure μ]
    (hpos : ∀ᵐ q ∂μ, 0 < q) (y : ℝ) (hy : 0 < y) :
    Integrable (fun q => kernel q y) μ := by
  have hm : Measurable (fun q : ℝ => kernel q y) := by
    unfold kernel
    exact measurable_const.div (measurable_const.add measurable_id)
  apply (integrable_const y).mono' hm.aestronglyMeasurable
  filter_upwards [hpos] with q hq
  have hp : 0 < y+q := by positivity
  have hk0 : 0 ≤ kernel q y := by unfold kernel; positivity
  rw [Real.norm_eq_abs, abs_of_nonneg hk0]
  unfold kernel
  apply (div_le_iff₀ hp).2
  nlinarith

theorem finite_mixture_inverse_phase (H lam : ℝ → ℝ) (c : ℝ) (μ : Measure ℝ) [IsFiniteMeasure μ]
    (hc : 0 < c) (hμ : μ ≠ 0) (hpos : ∀ᵐ q ∂μ, 0 < q)
    (hrep : ∀ y > 0, H y^2 = ∫ q, kernel q y ∂μ)
    (hlpos : ∀ t > 0, 0 < lam t) (hHpos : ∀ y > 0, 0 < H y)
    (hH : ∀ y > 0, DifferentiableAt ℝ H y)
    (hlam : ∀ t > 0, HasDerivAt lam (c*H (lam t)) t)
    (hend : ContinuousOn (fun t => c*H (lam t)) (Set.Ici 0)) :
    StrictConvexOn ℝ (Set.Ici 0) (fun t => c*H (lam t)) := by
  apply mixture_inverse_phase H lam c μ hc hμ hpos _ hrep hlpos hHpos hH hlam hend
  intro y hy
  exact kernel_integrable_finite μ hpos y hy

theorem signs_from_finite_mixture (H lam : ℝ → ℝ) (c : ℝ) (μ : Measure ℝ) [IsFiniteMeasure μ]
    (hc : 0 < c) (hμ : μ ≠ 0) (hpos : ∀ᵐ q ∂μ, 0 < q)
    (hrep : ∀ y > 0, H y^2 = ∫ q, kernel q y ∂μ)
    (hlpos : ∀ t > 0, 0 < lam t) (hHpos : ∀ y > 0, 0 < H y)
    (hH : ∀ y > 0, DifferentiableAt ℝ H y)
    (hld : ContinuousOn lam (Set.Ici 0)) (hd : ∀ t > 0, HasDerivAt lam (c*H (lam t)) t)
    (hend : ContinuousOn (fun t => c*H (lam t)) (Set.Ici 0))
    (hg0 : c*H (lam 0)=0) (hl0 : lam 0=0) :
    (∀ n, 0 < C (fun t => c*H (lam t)) lam n) ∧
    StrictMono (C (fun t => c*H (lam t)) lam) ∧
    (∀ n, E (fun t => c*H (lam t)) lam n < 0) ∧
    StrictAnti (E (fun t => c*H (lam t)) lam) ∧
    (∀ n, 0 < sourceK (fun t => c*H (lam t)) lam n) ∧
    StrictMono (sourceK (fun t => c*H (lam t)) lam) := by
  apply signs_from_mixture H lam c μ hc hμ hpos _ hrep hlpos hHpos hH hld hd hend hg0 hl0
  intro y hy
  exact kernel_integrable_finite μ hpos y hy
end BesselWeights
