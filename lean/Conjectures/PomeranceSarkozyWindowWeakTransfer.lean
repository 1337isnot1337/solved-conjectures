module
public import Mathlib.MeasureTheory.Measure.Portmanteau
public import Mathlib.Probability.Distributions.Uniform
import Mathlib.Topology.Instances.ENNReal.Lemmas

@[expose] public section
namespace PomeranceSarkozy

open Filter MeasureTheory
open scoped Topology ENNReal

/-- An event comparison transports a weak limit even when the two row
statistics live on different sample spaces. -/
theorem weak_limit_of_event_error {U V : ℕ → ProbabilityMeasure ℝ}
    {Z : ProbabilityMeasure ℝ} (hV : Tendsto V atTop (𝓝 Z))
    (herr : ∀ A : Set ℝ, MeasurableSet A →
      Tendsto (fun X ↦ (U X : Measure ℝ).real A - (V X : Measure ℝ).real A)
        atTop (𝓝 0)) :
    Tendsto U atTop (𝓝 Z) := by
  apply tendsto_of_forall_isClosed_limsup_le'
  apply limsup_measure_closed_le_of_forall_tendsto_measure
  intro A hA hbd
  have h := ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto' hV hbd
  have hv := (ENNReal.tendsto_toReal (measure_ne_top _ _)).comp h
  have hu : Tendsto (fun X ↦ (U X : Measure ℝ).real A) atTop (𝓝 ((Z : Measure ℝ).real A)) := by
    simpa only [Function.comp_def, ← measureReal_def, sub_add_cancel, zero_add] using
      (herr A hA).add hv
  have he (p : ProbabilityMeasure ℝ) : ENNReal.ofReal ((p : Measure ℝ).real A) =
      (p : Measure ℝ) A := ofReal_measureReal (measure_ne_top _ _)
  simpa only [he] using ENNReal.tendsto_ofReal hu

/-- Perturbation in probability transports a weak limit for rows with
varying sample spaces and measures. -/
theorem weak_limit_of_row_perturbation {Ω : ℕ → Type*} [∀ X, MeasurableSpace (Ω X)]
    (P : (X : ℕ) → ProbabilityMeasure (Ω X)) (f g : (X : ℕ) → Ω X → ℝ)
    (hf : ∀ X, Measurable (f X)) (hg : ∀ X, Measurable (g X))
    {Z : ProbabilityMeasure ℝ}
    (hfZ : Tendsto (fun X ↦ (P X).map (f X)) atTop (𝓝 Z))
    (herr : ∀ δ : ℝ, 0 < δ → Tendsto
      (fun X ↦ (P X : Measure (Ω X)) {w | δ < dist (f X w) (g X w)}) atTop (𝓝 0)) :
    Tendsto (fun X ↦ (P X).map (g X)) atTop (𝓝 Z) := by
  apply tendsto_of_forall_isClosed_limsup_le'
  intro F hF
  have hthick := tendsto_measure_cthickening_of_isClosed (μ := (Z : Measure ℝ))
    ⟨1, zero_lt_one, measure_ne_top _ _⟩ hF
  apply ge_of_tendsto (hthick.mono_left nhdsWithin_le_nhds : Tendsto _ (𝓝[>] (0 : ℝ)) _)
  filter_upwards [self_mem_nhdsWithin] with δ hδ
  let Fδ := Metric.cthickening δ F
  let err (X : ℕ) := (P X : Measure (Ω X)) {w | δ < dist (f X w) (g X w)}
  let good (X : ℕ) := ((P X).map (f X) : Measure ℝ) Fδ
  have hle (X : ℕ) : ((P X).map (g X) : Measure ℝ) F ≤ (good + err) X := by
    change ((P X : Measure (Ω X)).map (g X)) F ≤
      ((P X : Measure (Ω X)).map (f X)) Fδ + err X
    rw [Measure.map_apply (hg X) hF.measurableSet,
      Measure.map_apply (hf X) Metric.isClosed_cthickening.measurableSet]
    refine (measure_mono ?_).trans (measure_union_le (f X ⁻¹' Fδ) _)
    intro w hw
    by_cases he : δ < dist (f X w) (g X w)
    · exact Or.inr he
    · exact Or.inl (Metric.mem_cthickening_of_dist_le _ _ _ _ hw (le_of_not_gt he))
  refine (limsup_le_limsup (.of_forall hle)).trans ?_
  rw [ENNReal.limsup_add_of_right_tendsto_zero (herr δ hδ)]
  exact ProbabilityMeasure.limsup_measure_closed_le_of_tendsto hfZ Metric.isClosed_cthickening

end PomeranceSarkozy
