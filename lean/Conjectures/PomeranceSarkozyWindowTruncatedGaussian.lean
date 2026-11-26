module
public import Conjectures.PomeranceSarkozyGrowingEvent
public import Conjectures.PomeranceSarkozyGrowingModelGaussian
public import Conjectures.PomeranceSarkozyThresholdCountEncoding
public import Conjectures.PomeranceSarkozyWindowStrictCutoff
public import Conjectures.PomeranceSarkozyWindowVectorSample
public import Conjectures.PomeranceSarkozyWindowWeakTransfer

@[expose] public section
namespace PomeranceSarkozy

open Filter MeasureTheory ProbabilityTheory
open scoped Topology

/-- The truncated statistic on the actual integer window has the limiting
Gaussian law, with the extra unit accounting for offset zero. -/
theorem window_truncated_quarter_gaussian :
    Tendsto (fun X => (sourceWindowSample X).map (fun n =>
      (1 + ((truncatedOffsets (psPrimes X) n (psH X)).card : ℝ) - psL X) /
        psL X ^ (1/4 : ℝ))) atTop
      (𝓝 (⟨gaussianReal 0 (Real.toNNReal (1 / Real.sqrt Real.pi)), inferInstance⟩ :
        ProbabilityMeasure ℝ)) := by
  classical
  apply weak_limit_of_event_error growing_model_threshold_gaussian
  intro A hA
  let F (X : ℕ) (x : ↥(psOffsets X) → ℕ) :=
    (thresholdVectorCount (psOffsets X) x - (psL X - 1)) / psL X ^ (1/4 : ℝ)
  let B (X : ℕ) := F X ⁻¹' A
  apply (growing_arithmetic_poisson_event B).congr'
  filter_upwards [psH_lt_psStart] with X hH
  change _ = ((sourceWindowSample X : Measure ℕ).map _).real A -
    ((Measure.pi (fun _ : ↥(psOffsets X) => poissonMeasure (psRate X))).map (F X)).real A
  rw [map_measureReal_apply Measurable.of_discrete hA, map_measureReal_apply
    (((measurable_thresholdVectorCount _).sub_const _).div_const _) hA]
  rw [← window_vector_event_eq X (B X)]
  congr 1
  rw [sourceWindowSample_real, sourceWindowSample_real]
  congr 3
  apply Finset.filter_congr
  intro n hn
  have hn' : psStart X ≤ n := (Finset.mem_Icc.mp hn).1
  have hP : ∀ p ∈ psPrimes X, p.Prime := fun p hp => (Finset.mem_filter.mp hp).2
  have he := thresholdVectorCount_literalOffsetCount (psPrimes X) n 1 (psH X) 0 hP
    (hH.trans_le hn')
  change thresholdVectorCount (psOffsets X) (windowOffsetCount X n) =
    ((truncatedOffsets (psPrimes X) n (psH X)).card : ℝ) at he
  change (thresholdVectorCount (psOffsets X) (windowOffsetCount X n) - (psL X - 1)) / _ ∈ A ↔
    (1 + _ - psL X) / _ ∈ A
  rw [he, sub_sub_eq_add_sub]
  ring_nf

end PomeranceSarkozy
