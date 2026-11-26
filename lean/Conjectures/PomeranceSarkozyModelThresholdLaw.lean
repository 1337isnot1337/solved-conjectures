module
public import Conjectures.PomeranceSarkozyIndependentArrayLaw
public import Conjectures.PomeranceSarkozyPoissonVariance
import Mathlib.Tactic.Linarith

@[expose] public section
namespace PomeranceSarkozy

open Filter MeasureTheory ProbabilityTheory
open scoped Topology ENNReal NNReal BigOperators

private noncomputable def thresholdIndicator (h : ℕ) : ℕ → ℝ :=
  (Set.Ioi h).indicator (fun _ ↦ 1)

/-- Number of coordinates whose counts exceed their corresponding offsets. -/
noncomputable def thresholdVectorCount (I : Finset ℕ) (x : ↥I → ℕ) : ℝ :=
  ∑ h : ↥I, if (h : ℕ) < x h then 1 else 0

noncomputable def poissonThresholdMean (I : Finset ℕ) (b : ℝ≥0) : ℝ :=
  ∑ h ∈ I, (poissonSurvival b h).toReal

noncomputable def poissonThresholdVariance (I : Finset ℕ) (b : ℝ≥0) : ℝ :=
  ∑ h ∈ I, (poissonSurvival b h).toReal * (1 - (poissonSurvival b h).toReal)

theorem poissonMeasure_Ioi_eq_survival (b : ℝ≥0) (h : ℕ) :
    poissonMeasure b (Set.Ioi h) = poissonSurvival b h := by
  rw [← Measure.tsum_indicator_apply_singleton (poissonMeasure b) (Set.Ioi h) .of_discrete]
  congr 1
  funext k
  simp only [Set.indicator_apply, Set.mem_Ioi, poissonNatMass,
    measureReal_def, ENNReal.ofReal_toReal (measure_ne_top _ _)]

private theorem integral_thresholdIndicator (b : ℝ≥0) (h : ℕ) :
    (∫ k, thresholdIndicator h k ∂poissonMeasure b) = (poissonSurvival b h).toReal := by
  rw [thresholdIndicator, integral_indicator_const 1 .of_discrete, smul_eq_mul, mul_one,
    measureReal_def, poissonMeasure_Ioi_eq_survival]

private theorem integrable_thresholdIndicator (b : ℝ≥0) (h : ℕ) :
    Integrable (thresholdIndicator h) (poissonMeasure b) := by
  unfold thresholdIndicator
  exact (integrable_const _).indicator .of_discrete

private theorem integral_centered_thresholdIndicator (b : ℝ≥0) (h : ℕ) :
    (∫ k, thresholdIndicator h k - (poissonSurvival b h).toReal ∂poissonMeasure b) = 0 := by
  rw [integral_sub (integrable_thresholdIndicator b h) (integrable_const _),
    integral_thresholdIndicator, integral_const, probReal_univ, one_smul, sub_self]

private theorem integral_sq_centered_thresholdIndicator (b : ℝ≥0) (h : ℕ) :
    (∫ k, (thresholdIndicator h k - (poissonSurvival b h).toReal)^2 ∂poissonMeasure b) =
      (poissonSurvival b h).toReal * (1 - (poissonSurvival b h).toReal) := by
  let p := (poissonSurvival b h).toReal
  have e (k : ℕ) : (thresholdIndicator h k - p)^2 =
      (1 - 2*p)*thresholdIndicator h k + p^2 := by
    simp only [thresholdIndicator, Set.indicator_apply, Set.mem_Ioi]
    split <;> ring
  change (∫ k, (thresholdIndicator h k - p)^2 ∂poissonMeasure b) = p*(1-p)
  simp_rw [e]
  rw [integral_add ((integrable_thresholdIndicator b h).const_mul _) (integrable_const _),
    integral_const_mul, integral_thresholdIndicator, integral_const, probReal_univ, one_smul]
  change (1 - 2*p)*p + p^2 = p*(1-p)
  ring

private theorem abs_centered_thresholdIndicator_le_one (b : ℝ≥0) (h k : ℕ) :
    |thresholdIndicator h k - (poissonSurvival b h).toReal| ≤ 1 := by
  have hl : 0 ≤ (poissonSurvival b h).toReal := ENNReal.toReal_nonneg
  have hu : (poissonSurvival b h).toReal ≤ 1 := by
    rw [← poissonMeasure_Ioi_eq_survival]
    exact measureReal_le_one
  apply abs_le.mpr
  simp only [thresholdIndicator, Set.indicator_apply, Set.mem_Ioi]
  split <;> constructor <;> linarith

theorem measurable_thresholdVectorCount (I : Finset ℕ) :
    Measurable (thresholdVectorCount I) := .of_discrete

/-- Law of the centered and scaled threshold count under the actual
product of Poisson measures on the finite window. -/
noncomputable def poissonThresholdScaledLaw (I : Finset ℕ) (b : ℝ≥0) (c a : ℝ) :
    ProbabilityMeasure ℝ :=
  ⟨(Measure.pi (fun _ : ↥I ↦ poissonMeasure b)).map
    (fun x ↦ (thresholdVectorCount I x - c) / a),
    (Measure.isProbabilityMeasure_map_iff
      (((measurable_thresholdVectorCount I).sub_const c).div_const a).aemeasurable).2
      inferInstance⟩

private theorem sum_threshold_centered (I : Finset ℕ) (b : ℝ≥0) (x : ↥I → ℕ) :
    (∑ h : ↥I, (thresholdIndicator h (x h) - (poissonSurvival b h).toReal)) =
      thresholdVectorCount I x - poissonThresholdMean I b := by
  rw [Finset.sum_sub_distrib]
  simp only [thresholdVectorCount, thresholdIndicator, Set.indicator_apply, Set.mem_Ioi,
    poissonThresholdMean]
  rw [Finset.sum_coe_sort I (fun h ↦ (poissonSurvival b h).toReal)]

private theorem poisson_threshold_mean_centered_law_tendsto (I : ℕ → Finset ℕ)
    (b : ℕ → ℝ≥0) (a : ℕ → ℝ) (ha : Tendsto a atTop atTop) (v : ℝ≥0)
    (hv : Tendsto (fun n ↦ poissonThresholdVariance (I n) (b n) / (a n)^2)
      atTop (𝓝 (v : ℝ))) :
    Tendsto (fun n ↦ poissonThresholdScaledLaw (I n) (b n)
      (poissonThresholdMean (I n) (b n)) (a n)) atTop
      (𝓝 (⟨gaussianReal 0 v, inferInstance⟩ : ProbabilityMeasure ℝ)) := by
  let P (n : ℕ) := Measure.pi (fun _ : ↥(I n) ↦ poissonMeasure (b n))
  let f (n : ℕ) (h : ↥(I n)) (k : ℕ) :=
    thresholdIndicator h k - (poissonSurvival (b n) h).toReal
  let X (n : ℕ) (h : ↥(I n)) (x : ↥(I n) → ℕ) := f n h (x h)
  let hX : ∀ n h, Measurable (X n h) := fun _ _ ↦ .of_discrete
  have hInd (n : ℕ) : iIndepFun (X n) (P n) :=
    iIndepFun_pi (X := f n) (fun _ ↦ Measurable.of_discrete.aemeasurable)
  have hBound (n : ℕ) (h : ↥(I n)) : ∀ᵐ x ∂P n, |X n h x| ≤ 1 :=
    Eventually.of_forall (fun x ↦ abs_centered_thresholdIndicator_le_one (b n) h (x h))
  have hEval (n : ℕ) (h : ↥(I n)) (g : ℕ → ℝ) :
      (∫ x, g (x h) ∂P n) = ∫ k, g k ∂poissonMeasure (b n) := by
    rw [← (measurePreserving_eval (fun _ : ↥(I n) ↦ poissonMeasure (b n)) h).map_eq,
      integral_map (measurable_pi_apply h).aemeasurable Measurable.of_discrete.aestronglyMeasurable]
  have hMean (n : ℕ) (h : ↥(I n)) : (∫ x, X n h x ∂P n) = 0 := by
    change (∫ x, f n h (x h) ∂P n) = 0
    rw [hEval, integral_centered_thresholdIndicator]
  have hVar (n : ℕ) :
      (∑ h : ↥(I n), ∫ x, X n h x ^ 2 ∂P n) = poissonThresholdVariance (I n) (b n) := by
    unfold poissonThresholdVariance
    rw [← Finset.sum_coe_sort (I n)
      (fun h ↦ (poissonSurvival (b n) h).toReal * (1 - (poissonSurvival (b n) h).toReal))]
    refine Finset.sum_congr rfl (fun h _ ↦ ?_)
    exact (hEval n h (fun k ↦ f n h k ^ 2)).trans
      (integral_sq_centered_thresholdIndicator (b n) h)
  have h := independent_bounded_array_law_tendsto (fun n ↦ Finset.univ : (n : ℕ) → Finset ↥(I n))
    P X hX hInd 1 zero_le_one (fun n h _ ↦ hBound n h) (fun n h _ ↦ hMean n h) a ha v (by
      simpa only [hVar] using hv)
  refine h.congr (fun n ↦ ?_)
  apply Subtype.ext
  change (P n).map (fun x ↦ (a n)⁻¹ * (∑ h : ↥(I n), X n h x)) =
    (P n).map (fun x ↦ (thresholdVectorCount (I n) x - poissonThresholdMean (I n) (b n)) / a n)
  congr 1
  funext x
  change (a n)⁻¹ * (∑ h : ↥(I n), (thresholdIndicator h (x h) -
    (poissonSurvival (b n) h).toReal)) = _
  rw [sum_threshold_centered, div_eq_mul_inv, mul_comm]

/-- Gaussian weak limit for the finite Poisson threshold count. The
deterministic center can differ from the exact mean by a lower-order term. -/
theorem poisson_threshold_scaledLaw_tendsto (I : ℕ → Finset ℕ)
    (b : ℕ → ℝ≥0) (c a : ℕ → ℝ) (ha : Tendsto a atTop atTop) (v : ℝ≥0)
    (hc : Tendsto (fun n ↦ (poissonThresholdMean (I n) (b n) - c n) / a n) atTop (𝓝 0))
    (hv : Tendsto (fun n ↦ poissonThresholdVariance (I n) (b n) / (a n)^2)
      atTop (𝓝 (v : ℝ))) :
    Tendsto (fun n ↦ poissonThresholdScaledLaw (I n) (b n) (c n) (a n)) atTop
      (𝓝 (⟨gaussianReal 0 v, inferInstance⟩ : ProbabilityMeasure ℝ)) := by
  let d (n : ℕ) := (poissonThresholdMean (I n) (b n) - c n) / a n
  let M (n : ℕ) := poissonThresholdScaledLaw (I n) (b n) (poissonThresholdMean (I n) (b n)) (a n)
  have hM := poisson_threshold_mean_centered_law_tendsto I b a ha v hv
  apply ProbabilityMeasure.tendsto_iff_tendsto_charFun.mpr
  intro t
  have h := ProbabilityMeasure.tendsto_iff_tendsto_charFun.mp hM t
  have he : Tendsto (fun r : ℝ ↦ Complex.exp ((↑(r * t) : ℂ) * Complex.I)) (𝓝 0)
      (𝓝 1) := by
    have hcont : Continuous (fun r : ℝ ↦ Complex.exp ((↑(r * t) : ℂ) * Complex.I)) := by
      fun_prop
    have hzero : Complex.exp ((↑((0 : ℝ) * t) : ℂ) * Complex.I) = 1 := by simp
    rw [← hzero]
    exact hcont.continuousAt
  refine (show Tendsto (fun n ↦ charFun (M n : Measure ℝ) t *
    Complex.exp ((↑(d n * t) : ℂ) * Complex.I)) atTop
    (𝓝 (charFun (gaussianReal 0 v) t)) from by
      simpa only [M, d, Function.comp_def, ProbabilityMeasure.coe_mk, mul_one] using h.mul (he.comp hc)).congr
      (fun n ↦ ?_)
  have hMap : (poissonThresholdScaledLaw (I n) (b n) (c n) (a n) : Measure ℝ) =
      (M n : Measure ℝ).map (· + d n) := by
    let g (x : ↥(I n) → ℕ) :=
      (thresholdVectorCount (I n) x - poissonThresholdMean (I n) (b n)) / a n
    change (Measure.pi (fun _ : ↥(I n) ↦ poissonMeasure (b n))).map
        (fun x ↦ (thresholdVectorCount (I n) x - c n) / a n) =
      ((Measure.pi (fun _ : ↥(I n) ↦ poissonMeasure (b n))).map g).map (· + d n)
    rw [Measure.map_map (by fun_prop) Measurable.of_discrete]
    congr 1
    funext x
    dsimp [g, d]
    rw [← add_div]
    ring
  rw [hMap, charFun_map_add_const]
  simp [mul_comm]

end PomeranceSarkozy
