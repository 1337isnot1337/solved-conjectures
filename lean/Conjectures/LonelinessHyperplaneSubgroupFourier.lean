import Conjectures.LonelinessHyperplaneFiniteExceptions

/-! Finite-frequency control on an arbitrary compact torus subgroup.
The subgroup carries its actual normalized Haar measure. The only
exceptional frequencies are the characters nontrivial on that subgroup. -/

namespace Loneliness.Hyperplane.CompactSubgroup

open MeasureTheory
open scoped BigOperators

noncomputable section

variable {ι : Type*} [Fintype ι]
variable (H : AddSubgroup (UnitAddTorus ι)) [CompactSpace H]

private def compactUniverse : TopologicalSpace.PositiveCompacts H :=
  ⟨⟨Set.univ, isCompact_univ⟩, by simp⟩

def haar : Measure H := Measure.addHaarMeasure (compactUniverse H)

instance haar_isAddHaarMeasure : Measure.IsAddHaarMeasure (haar H) :=
  inferInstanceAs (Measure.IsAddHaarMeasure (Measure.addHaarMeasure (compactUniverse H)))

instance haar_isProbabilityMeasure : IsProbabilityMeasure (haar H) :=
  ⟨Measure.addHaarMeasure_self⟩

def TrivialFrequency (n : ι → ℤ) : Prop :=
  ∀ x : H, UnitAddTorus.mFourier n (x : UnitAddTorus ι) = 1

def velocity (v : ι → ℤ) (hv : ∀ t : UnitAddCircle, (fun i => v i • t) ∈ H) :
    C(UnitAddCircle, H) where
  toFun t := ⟨fun i => v i • t, hv t⟩
  continuous_toFun := by
    apply Continuous.subtype_mk
    exact continuous_pi (fun i => continuous_zsmul (v i))

theorem integral_character_velocity_eq
    (v : ι → ℤ) (hv : ∀ t : UnitAddCircle, (fun i => v i • t) ∈ H)
    (n : ι → ℤ) (hn : ¬ TrivialFrequency H n → integerPairing n v ≠ 0) :
    (∫ t : UnitAddCircle, UnitAddTorus.mFourier n (fun i => v i • t)) =
      ∫ x : H, UnitAddTorus.mFourier n (x : UnitAddTorus ι) ∂haar H := by
  classical
  let : IsProbabilityMeasure (volume : Measure UnitAddCircle) :=
    ⟨UnitAddCircle.measure_univ⟩
  by_cases htrivial : TrivialFrequency H n
  · rw [integral_subgroup_mFourier_eq_one H (haar H) n htrivial]
    have hpoint : ∀ t : UnitAddCircle,
        UnitAddTorus.mFourier n (fun i => v i • t) = 1 :=
      fun t => htrivial ⟨fun i => v i • t, hv t⟩
    simp [hpoint]
  · rw [integral_mFourier_velocity]
    change (if integerPairing n v = 0 then (1 : ℂ) else 0) = _
    rw [ite_eq_right (hn htrivial), integral_subgroup_mFourier_eq_zero H (haar H) n
      (not_forall.mp htrivial)]

private theorem compact_continuous_integrable
    {X : Type*} [TopologicalSpace X] [CompactSpace X] [T2Space X]
    [MeasurableSpace X] [BorelSpace X] (μ : Measure X) [IsFiniteMeasure μ]
    {f : X → ℂ} (hf : Continuous f) : Integrable f μ := by
  simpa only [IntegrableOn, Measure.restrict_univ] using
    (ContinuousOn.integrableOn_compact (μ := μ) isCompact_univ hf.continuousOn)

private theorem norm_integral_sub_le
    {X : Type*} [MeasurableSpace X] (μ : Measure X) [IsProbabilityMeasure μ]
    {f g : X → ℂ} (hf : Integrable f μ) (hg : Integrable g μ)
    (δ : ℝ) (h : ∀ x, ‖f x - g x‖ ≤ δ) :
    ‖(∫ x, f x ∂μ) - ∫ x, g x ∂μ‖ ≤ δ := by
  rw [← integral_sub hf hg]
  simpa using norm_integral_le_of_norm_le_const (μ := μ)
    (f := fun x => f x - g x) (C := δ) (Filter.Eventually.of_forall h)

theorem integral_polynomial_velocity_eq
    (v : ι → ℤ) (hv : ∀ t : UnitAddCircle, (fun i => v i • t) ∈ H)
    (S : Finset (ι → ℤ)) (a : (ι → ℤ) → ℂ)
    (hS : ∀ n ∈ S, ¬ TrivialFrequency H n → integerPairing n v ≠ 0)
    (s : UnitAddTorus ι) :
    (∫ t : UnitAddCircle,
      finiteCharacterPolynomial S a (s + fun i => v i • t)) =
      ∫ x : H, finiteCharacterPolynomial S a (s + (x : UnitAddTorus ι)) ∂haar H := by
  let : IsProbabilityMeasure (volume : Measure UnitAddCircle) :=
    ⟨UnitAddCircle.measure_univ⟩
  have hV : ∀ n ∈ S, Integrable (fun t : UnitAddCircle =>
      a n * UnitAddTorus.mFourier n (s + fun i => v i • t)) volume := by
    intro n _
    apply compact_continuous_integrable
    exact continuous_const.mul ((UnitAddTorus.mFourier n).continuous.comp
      (continuous_const.add (continuous_pi (fun i => continuous_zsmul (v i)))))
  have hH : ∀ n ∈ S, Integrable (fun x : H =>
      a n * UnitAddTorus.mFourier n (s + (x : UnitAddTorus ι))) (haar H) := by
    intro n _
    apply compact_continuous_integrable
    exact continuous_const.mul ((UnitAddTorus.mFourier n).continuous.comp
      (continuous_const.add continuous_subtype_val))
  simp only [finiteCharacterPolynomial_apply]
  rw [integral_finsetSum S hV, integral_finsetSum S hH]
  apply Finset.sum_congr rfl
  intro n hn
  simp_rw [mFourier_apply_add, integral_const_mul]
  rw [integral_character_velocity_eq H v hv n (hS n hn)]

theorem exists_finite_frequency_average_control
    (f : C(H, ℂ)) (ε : ℝ) (hε : 0 < ε) :
    ∃ B : Finset (ι → ℤ),
      (∀ n ∈ B, ¬ TrivialFrequency H n) ∧
      ∀ (v : ι → ℤ) (hv : ∀ t : UnitAddCircle, (fun i => v i • t) ∈ H),
        (∀ n ∈ B, integerPairing n v ≠ 0) → ∀ s : H,
          ‖(∫ t : UnitAddCircle, f (s + velocity H v hv t)) -
            ∫ x : H, f x ∂haar H‖ < ε := by
  classical
  let : IsProbabilityMeasure (volume : Measure UnitAddCircle) :=
    ⟨UnitAddCircle.measure_univ⟩
  obtain ⟨S, a, happ⟩ := exists_finite_character_approx_on
    (H : Set (UnitAddTorus ι)) (isCompact_iff_compactSpace.mpr inferInstance)
    f (ε / 3) (by linarith)
  refine ⟨S.filter (fun n => ¬ TrivialFrequency H n), ?_, ?_⟩
  · intro n hn
    exact (Finset.mem_filter.mp hn).2
  · intro v hv havoid s
    let V := velocity H v hv
    let P := finiteCharacterPolynomial S a
    have hS : ∀ n ∈ S, ¬ TrivialFrequency H n → integerPairing n v ≠ 0 := by
      intro n hn hnontrivial
      exact havoid n (Finset.mem_filter.mpr ⟨hn, hnontrivial⟩)
    have heq :
        (∫ t : UnitAddCircle, P ((s + V t : H) : UnitAddTorus ι)) =
          ∫ x : H, P ((s + x : H) : UnitAddTorus ι) ∂haar H :=
      integral_polynomial_velocity_eq H v hv S a hS (s : UnitAddTorus ι)
    have hfV : Integrable (fun t : UnitAddCircle => f (s + V t)) volume :=
      compact_continuous_integrable volume
        (f.continuous.comp (continuous_const.add V.continuous))
    have hPV : Integrable (fun t : UnitAddCircle => P ((s + V t : H) : UnitAddTorus ι)) volume :=
      compact_continuous_integrable volume (P.continuous.comp
        (continuous_subtype_val.comp (continuous_const.add V.continuous)))
    have hfH : Integrable (fun x : H => f (s + x)) (haar H) :=
      compact_continuous_integrable (haar H)
        (f.continuous.comp (continuous_const.add continuous_id))
    have hPH : Integrable (fun x : H => P ((s + x : H) : UnitAddTorus ι)) (haar H) :=
      compact_continuous_integrable (haar H) (P.continuous.comp
        (continuous_subtype_val.comp (continuous_const.add continuous_id)))
    have hleft :
        ‖(∫ t : UnitAddCircle, f (s + V t)) -
          ∫ t : UnitAddCircle, P ((s + V t : H) : UnitAddTorus ι)‖ ≤ ε / 3 := by
      apply norm_integral_sub_le volume hfV hPV
      intro t
      rw [norm_sub_rev]
      simpa only [P, finiteCharacterPolynomial_apply] using (happ (s + V t)).le
    have hright :
        ‖(∫ x : H, P ((s + x : H) : UnitAddTorus ι) ∂haar H) -
          ∫ x : H, f (s + x) ∂haar H‖ ≤ ε / 3 := by
      apply norm_integral_sub_le (haar H) hPH hfH
      intro x
      simpa only [P, finiteCharacterPolynomial_apply] using (happ (s + x)).le
    have htranslate : (∫ x : H, f (s + x) ∂haar H) = ∫ x : H, f x ∂haar H :=
      integral_add_left_eq_self f s
    calc
      _ = ‖((∫ t : UnitAddCircle, f (s + V t)) -
          ∫ t : UnitAddCircle, P ((s + V t : H) : UnitAddTorus ι)) +
          ((∫ x : H, P ((s + x : H) : UnitAddTorus ι) ∂haar H) -
            ∫ x : H, f (s + x) ∂haar H)‖ := by
        rw [heq, htranslate]
        congr 1
        ring
      _ ≤ _ := norm_add_le _ _
      _ ≤ ε / 3 + ε / 3 := add_le_add hleft hright
      _ < ε := by linarith

theorem exists_finite_frequency_dense_velocity (ε : ℝ) (hε : 0 < ε) :
    ∃ B : Finset (ι → ℤ),
      (∀ n ∈ B, ¬ TrivialFrequency H n) ∧
      ∀ (v : ι → ℤ) (hv : ∀ t : UnitAddCircle, (fun i => v i • t) ∈ H),
        (∀ n ∈ B, integerPairing n v ≠ 0) → ∀ x : H,
          ∃ t : UnitAddCircle, dist (velocity H v hv t) x < ε := by
  classical
  let g : H → ℝ := fun x => max 0 (ε - ‖x‖)
  have hgcont : Continuous g :=
    continuous_const.max (continuous_const.sub continuous_norm)
  have hgint : Integrable g (haar H) := by
    simpa only [IntegrableOn, Measure.restrict_univ] using
      (ContinuousOn.integrableOn_compact (μ := haar H) isCompact_univ hgcont.continuousOn)
  have hgnonneg : 0 ≤ g := fun x => le_max_left _ _
  have hgzero : g 0 ≠ 0 := by
    simp only [g, norm_zero, sub_zero, max_eq_right hε.le]
    exact hε.ne'
  let a : ℝ := ∫ x : H, g x ∂haar H
  have ha : 0 < a :=
    integral_pos_of_integrable_nonneg_nonzero hgcont hgint hgnonneg hgzero
  let f : C(H, ℂ) := ⟨fun x => (g x : ℂ), Complex.continuous_ofReal.comp hgcont⟩
  have hfint : (∫ x : H, f x ∂haar H) = (a : ℂ) := integral_ofReal
  obtain ⟨B, hB, havg⟩ := exists_finite_frequency_average_control H f (a / 2) (by linarith)
  refine ⟨B, hB, ?_⟩
  intro v hv havoid x
  by_contra h
  have hdist : ∀ t : UnitAddCircle, ε ≤ dist (velocity H v hv t) x := by
    intro t
    exact le_of_not_gt (fun ht => h ⟨t, ht⟩)
  have hzero : ∀ t : UnitAddCircle, f (-x + velocity H v hv t) = 0 := by
    intro t
    have hnorm : ε ≤ ‖-x + velocity H v hv t‖ := by
      simpa only [dist_eq_norm, sub_eq_add_neg, add_comm] using hdist t
    change ((max 0 (ε - ‖-x + velocity H v hv t‖) : ℝ) : ℂ) = 0
    rw [max_eq_left (by linarith), Complex.ofReal_zero]
  have hmean := havg v hv havoid (-x)
  have hvint : (∫ t : UnitAddCircle, f (-x + velocity H v hv t)) = 0 := by
    simp only [hzero, integral_zero]
  rw [hvint, hfint] at hmean
  have hnorm : ‖(0 : ℂ) - (a : ℂ)‖ = a := by
    simp only [zero_sub, norm_neg, Complex.norm_real, Real.norm_eq_abs, abs_of_pos ha]
  rw [hnorm] at hmean
  linarith

end

end Loneliness.Hyperplane.CompactSubgroup
