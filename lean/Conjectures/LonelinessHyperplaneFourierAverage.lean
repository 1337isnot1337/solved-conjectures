import Conjectures.LonelinessHyperplaneFourierDensity
import Conjectures.LonelinessHyperplaneFourierKernel
import Mathlib.MeasureTheory.Function.LocallyIntegrable

/-! A finite list of integer frequencies controls every translate of a
continuous function averaged along a velocity circle. The list is
independent of the translation. -/

namespace Loneliness.Hyperplane

open MeasureTheory
open scoped BigOperators

noncomputable section

variable {ι : Type*} [Fintype ι]

def finiteCharacterPolynomial (S : Finset (ι → ℤ)) (a : (ι → ℤ) → ℂ) :
    C(UnitAddTorus ι, ℂ) := ∑ n ∈ S, a n • UnitAddTorus.mFourier n

theorem finiteCharacterPolynomial_apply
    (S : Finset (ι → ℤ)) (a : (ι → ℤ) → ℂ) (x : UnitAddTorus ι) :
    finiteCharacterPolynomial S a x = ∑ n ∈ S, a n * UnitAddTorus.mFourier n x := by
  simp [finiteCharacterPolynomial, smul_eq_mul]

def integerVelocityInRelation (m v : ι → ℤ) (hv : integerPairing m v = 0) :
    C(UnitAddCircle, torusRelationGroup m) where
  toFun t := ⟨fun i => v i • t, by
    rw [mem_torusRelationGroup, normalHom_velocity, hv, zero_smul]⟩
  continuous_toFun := by
    apply Continuous.subtype_mk
    exact continuous_pi (fun i => continuous_zsmul (v i))

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

theorem integral_finiteCharacterPolynomial_velocity_eq_relation
    (m : ι → ℤ) (hm : PrimitiveNormal m) (v : ι → ℤ)
    (hv : integerPairing m v = 0)
    (S : Finset (ι → ℤ)) (a : (ι → ℤ) → ℂ)
    (hS : ∀ n ∈ S, (¬ ∃ c : ℤ, n = c • m) → integerPairing n v ≠ 0)
    (s : UnitAddTorus ι) :
    (∫ t : UnitAddCircle,
      finiteCharacterPolynomial S a (s + fun i => v i • t)) =
      ∫ x : torusRelationGroup m,
        finiteCharacterPolynomial S a (s + (x : UnitAddTorus ι)) ∂relationHaar m := by
  letI : IsProbabilityMeasure (volume : Measure UnitAddCircle) :=
    ⟨UnitAddCircle.measure_univ⟩
  have hV : ∀ n ∈ S, Integrable (fun t : UnitAddCircle =>
      a n * UnitAddTorus.mFourier n (s + fun i => v i • t)) volume := by
    intro n _
    apply compact_continuous_integrable
    exact continuous_const.mul ((UnitAddTorus.mFourier n).continuous.comp
      (continuous_const.add (continuous_pi (fun i => continuous_zsmul (v i)))))
  have hH : ∀ n ∈ S, Integrable (fun x : torusRelationGroup m =>
      a n * UnitAddTorus.mFourier n (s + (x : UnitAddTorus ι))) (relationHaar m) := by
    intro n _
    apply compact_continuous_integrable
    exact continuous_const.mul ((UnitAddTorus.mFourier n).continuous.comp
      (continuous_const.add continuous_subtype_val))
  simp only [finiteCharacterPolynomial_apply]
  rw [integral_finsetSum S hV, integral_finsetSum S hH]
  apply Finset.sum_congr rfl
  intro n hn
  simp_rw [mFourier_apply_add, integral_const_mul]
  rw [integral_mFourier_velocity_eq_relation m hm v hv n (hS n hn)]

/-- One finite set of proper frequency relations controls all translates
of a continuous function. The estimate compares actual circle averages
with normalized Haar probability on the actual torus kernel. -/
theorem exists_finite_frequency_average_control
    (m : ι → ℤ) (hm : PrimitiveNormal m)
    (f : C(torusRelationGroup m, ℂ)) (ε : ℝ) (hε : 0 < ε) :
    ∃ B : Finset (ι → ℤ),
      (∀ n ∈ B, ¬ ∃ c : ℤ, n = c • m) ∧
      ∀ (v : ι → ℤ) (hv : integerPairing m v = 0),
        (∀ n ∈ B, integerPairing n v ≠ 0) →
        ∀ s : torusRelationGroup m,
          ‖(∫ t : UnitAddCircle, f (s + integerVelocityInRelation m v hv t)) -
            ∫ x : torusRelationGroup m, f x ∂relationHaar m‖ < ε := by
  classical
  letI : IsProbabilityMeasure (volume : Measure UnitAddCircle) :=
    ⟨UnitAddCircle.measure_univ⟩
  obtain ⟨S, a, happ⟩ := exists_finite_character_approx_on
    (torusRelationGroup m : Set (UnitAddTorus ι))
    (torusRelationGroup_isClosed m).isCompact f (ε / 3) (by linarith)
  refine ⟨S.filter (fun n => ¬ ∃ c : ℤ, n = c • m), ?_, ?_⟩
  · intro n hn
    exact (Finset.mem_filter.mp hn).2
  · intro v hv havoid s
    let V := integerVelocityInRelation m v hv
    let P := finiteCharacterPolynomial S a
    have hS : ∀ n ∈ S, (¬ ∃ c : ℤ, n = c • m) → integerPairing n v ≠ 0 := by
      intro n hn hnm
      exact havoid n (Finset.mem_filter.mpr ⟨hn, hnm⟩)
    have heq :
        (∫ t : UnitAddCircle, P ((s + V t : torusRelationGroup m) : UnitAddTorus ι)) =
          ∫ x : torusRelationGroup m,
            P ((s + x : torusRelationGroup m) : UnitAddTorus ι) ∂relationHaar m :=
      integral_finiteCharacterPolynomial_velocity_eq_relation m hm v hv S a hS
        (s : UnitAddTorus ι)
    have hfV : Integrable (fun t : UnitAddCircle => f (s + V t)) volume :=
      compact_continuous_integrable volume
        (f.continuous.comp (continuous_const.add V.continuous))
    have hPV : Integrable (fun t : UnitAddCircle =>
        P ((s + V t : torusRelationGroup m) : UnitAddTorus ι)) volume :=
      compact_continuous_integrable volume (P.continuous.comp
        (continuous_subtype_val.comp (continuous_const.add V.continuous)))
    have hfH : Integrable (fun x : torusRelationGroup m => f (s + x)) (relationHaar m) :=
      compact_continuous_integrable (relationHaar m)
        (f.continuous.comp (continuous_const.add continuous_id))
    have hPH : Integrable (fun x : torusRelationGroup m =>
        P ((s + x : torusRelationGroup m) : UnitAddTorus ι)) (relationHaar m) :=
      compact_continuous_integrable (relationHaar m) (P.continuous.comp
        (continuous_subtype_val.comp (continuous_const.add continuous_id)))
    have hleft :
        ‖(∫ t : UnitAddCircle, f (s + V t)) -
          ∫ t : UnitAddCircle, P ((s + V t : torusRelationGroup m) : UnitAddTorus ι)‖ ≤
            ε / 3 := by
      apply norm_integral_sub_le volume hfV hPV
      intro t
      rw [norm_sub_rev]
      simpa only [P, finiteCharacterPolynomial_apply] using (happ (s + V t)).le
    have hright :
        ‖(∫ x : torusRelationGroup m,
            P ((s + x : torusRelationGroup m) : UnitAddTorus ι) ∂relationHaar m) -
          ∫ x : torusRelationGroup m, f (s + x) ∂relationHaar m‖ ≤ ε / 3 := by
      apply norm_integral_sub_le (relationHaar m) hPH hfH
      intro x
      simpa only [P, finiteCharacterPolynomial_apply] using (happ (s + x)).le
    have htranslate : (∫ x : torusRelationGroup m, f (s + x) ∂relationHaar m) =
        ∫ x : torusRelationGroup m, f x ∂relationHaar m :=
      integral_add_left_eq_self f s
    calc
      _ = ‖((∫ t : UnitAddCircle, f (s + V t)) -
          ∫ t : UnitAddCircle, P ((s + V t : torusRelationGroup m) : UnitAddTorus ι)) +
          ((∫ x : torusRelationGroup m,
              P ((s + x : torusRelationGroup m) : UnitAddTorus ι) ∂relationHaar m) -
            ∫ x : torusRelationGroup m, f (s + x) ∂relationHaar m)‖ := by
        rw [heq, htranslate]
        congr 1
        ring
      _ ≤ _ := norm_add_le _ _
      _ ≤ ε / 3 + ε / 3 := add_le_add hleft hright
      _ < ε := by linarith

end

end Loneliness.Hyperplane
