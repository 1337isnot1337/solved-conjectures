module
public import Conjectures.PomeranceSarkozyGrowingModelGaussian
public import Conjectures.PomeranceSarkozyRestoreSample
public import Conjectures.PomeranceSarkozySourceNormalization
public import Conjectures.PomeranceSarkozySourceProbability
public import Conjectures.PomeranceSarkozyThresholdTransfer

@[expose] public section
namespace PomeranceSarkozy

open Filter MeasureTheory ProbabilityTheory
open scoped Topology Classical

/-- On the positive uniform sample, the quarter-root fluctuation of the
literal arithmetic count converges to the centered Gaussian of variance 1/√π. -/
theorem source_arithmetic_quarter_gaussian :
    Tendsto (fun X : ℕ ↦ (sourceFullSample X).map (fun n : ℕ ↦
      ((sourceG n : ℝ) - Real.log (Real.log n)) / (Real.log (Real.log n)) ^ (1 / 4 : ℝ)))
      atTop (𝓝 (⟨gaussianReal 0 (Real.toNNReal (1 / Real.sqrt Real.pi)), inferInstance⟩ :
        ProbabilityMeasure ℝ)) := by
  apply sourceFullSample_weak_limit_of_window
  apply sourceWindow_normalization_weak_limit
  let f (X n : ℕ) := ((sourceG n : ℝ) - psL X) / (psL X) ^ (1 / 4 : ℝ)
  apply weak_limit_of_row_perturbation sourceWindowSample sourceTruncatedScaled f
    (fun _ ↦ .of_discrete) (fun _ ↦ .of_discrete)
    (sourceTruncatedScaled_weak_limit growing_model_threshold_gaussian
      (psWindowStart_gt.mono (fun _ h ↦ h.2)) growing_arithmetic_poisson_event)
  intro δ hδ
  let bad (X : ℕ) := {n | δ < dist (sourceTruncatedScaled X n) (f X n)}
  have hreal : Tendsto (fun X ↦ (sourceWindowSample X : Measure ℕ).real (bad X)) atTop (𝓝 0) := by
    apply squeeze_zero (fun _ ↦ measureReal_nonneg) _ (sourceTruncation_error_tendsto hδ)
    intro X
    refine measureReal_mono ?_ (measure_ne_top _ _)
    intro n hn
    have he : dist (sourceTruncatedScaled X n) (f X n) =
        |sourceTruncationError X n / (psL X)^(1/4 : ℝ)| := by
      rw [dist_comm, Real.dist_eq]
      unfold sourceTruncationError sourceTruncatedScaled f
      congr 1
      ring
    exact (lt_of_lt_of_eq hn he).le
  have hun (X : ℕ) : ENNReal.ofReal ((sourceWindowSample X : Measure ℕ).real (bad X)) =
      (sourceWindowSample X : Measure ℕ) (bad X) := ofReal_measureReal (measure_ne_top _ _)
  simpa only [hun, ENNReal.ofReal_zero] using ENNReal.tendsto_ofReal hreal

/-- At the square-root scale, the empirical probability of each positive
absolute deviation tends to zero. -/
theorem source_sqrt_converges_in_probability (ε : ℝ) (hε : 0 < ε) :
    Tendsto (fun X : ℕ ↦ (((Finset.Icc 1 X).filter fun n ↦
      ε < |((sourceG n : ℝ) - Real.log (Real.log n)) / Real.sqrt (Real.log (Real.log n))|).card : ℝ) /
      X) atTop (𝓝 0) :=
  source_sqrt_converges_in_probability_of_quarter_weak_limit source_arithmetic_quarter_gaussian ε hε

end PomeranceSarkozy
