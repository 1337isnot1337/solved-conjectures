import Conjectures.FeldheimWeightedTailLaw
import Mathlib.Order.Filter.ENNReal
import Mathlib.Probability.Independence.Basic

/-!
# Feldheim–Feldheim’s weighted tail conjecture

The literal infinite limsup and the passage between independent random
variables and their probability laws. Unboundedness is expressed by positive
upper tails, with its equivalence to absence of an almost-sure upper bound.
-/

open Set MeasureTheory ProbabilityTheory Filter
open scoped Topology

namespace Conjectures.FeldheimWeightedTail

noncomputable section

theorem limsup_ofReal_eq_top_of_unbounded {F : ℝ → ℝ}
    (hF : ∀ C M : ℝ, ∃ m : ℝ, M ≤ m ∧ C < F m) :
    Filter.limsup (fun m => ENNReal.ofReal (F m)) atTop = ⊤ := by
  apply ENNReal.eq_top_of_forall_nnreal_le
  intro r
  refine le_limsup_of_frequently_le ?_ (by isBoundedDefault)
  rw [frequently_atTop]
  intro M
  obtain ⟨m,hm,hr⟩ := hF r M
  refine ⟨m,hm,?_⟩
  have hh := ENNReal.ofReal_le_ofReal hr.le
  simpa only [ENNReal.ofReal_coe_nnreal] using hh

theorem real_tail_positive_iff_not_bounded {Ω : Type*} [MeasurableSpace Ω]
    (P : Measure Ω) [IsProbabilityMeasure P] (X : Ω → ℝ) :
    (∀ m : ℝ, 0 < P.real {ω | m < X ω}) ↔ ¬ ∃ m : ℝ, ∀ᵐ ω ∂P, X ω ≤ m := by
  constructor
  · intro h ⟨m,hm⟩
    have hzero : P {ω | m < X ω} = 0 := by
      simpa only [ae_iff, not_le] using hm
    have hz : P.real {ω | m < X ω} = 0 := (measureReal_eq_zero_iff (by finiteness)).mpr hzero
    linarith [h m]
  · intro h m
    by_contra hnot
    have hz : P.real {ω | m < X ω} = 0 := le_antisymm (le_of_not_gt hnot) measureReal_nonneg
    have hz' := (measureReal_eq_zero_iff (by finiteness)).mp hz
    apply h
    refine ⟨m,?_⟩
    simpa only [ae_iff, not_le] using hz'

/-- For a nonnegative variable, compact support is exactly an almost-sure upper bound. -/
theorem not_compactly_supported_iff_not_bounded {Ω : Type*} [MeasurableSpace Ω]
    (P : Measure Ω) (X : Ω → ℝ) (hX : ∀ᵐ ω ∂P, 0 ≤ X ω) :
    (¬ ∃ K : Set ℝ, IsCompact K ∧ ∀ᵐ ω ∂P, X ω ∈ K) ↔
      ¬ ∃ m : ℝ, ∀ᵐ ω ∂P, X ω ≤ m := by
  constructor
  · intro h ⟨m,hm⟩
    apply h
    refine ⟨Icc 0 m,isCompact_Icc,?_⟩
    filter_upwards [hX,hm] with ω hω hω'
    exact ⟨hω,hω'⟩
  · intro h ⟨K,hK,hXK⟩
    obtain ⟨m,hm⟩ := hK.bddAbove
    apply h
    refine ⟨m,?_⟩
    filter_upwards [hXK] with ω hω
    exact hm hω

theorem survival_map {Ω : Type*} [MeasurableSpace Ω]
    (P : Measure Ω) (X : Ω → ℝ) (hX : Measurable X) (m : ℝ) :
    survival (P.map X) m = P.real {ω | m < X ω} := by
  rw [survival, measureReal_def, Measure.map_apply hX measurableSet_Ioi]
  rfl

theorem weightedTail_map {Ω : Type*} [MeasurableSpace Ω]
    (P : Measure Ω) [IsProbabilityMeasure P] (X Y : Ω → ℝ)
    (hX : Measurable X) (hY : Measurable Y) (hInd : IndepFun X Y P) (t m : ℝ) :
    weightedTail (P.map X) (P.map Y) t m = P.real {ω | m < t*X ω+(1-t)*Y ω} := by
  have he := hInd.map_prod_eq_prod_map_map hX.aemeasurable hY.aemeasurable
  have hE : MeasurableSet {p : ℝ × ℝ | m < t*p.1+(1-t)*p.2} := by
    apply measurableSet_lt measurable_const
    fun_prop
  rw [weightedTail, ← he, measureReal_def, Measure.map_apply (hX.prodMk hY) hE]
  rfl

theorem tailRatio_map {Ω : Type*} [MeasurableSpace Ω]
    (P : Measure Ω) [IsProbabilityMeasure P] (X Y : Ω → ℝ)
    (hX : Measurable X) (hY : Measurable Y) (hInd : IndepFun X Y P) (t m : ℝ) :
    tailRatio (P.map X) (P.map Y) t m =
      P.real {ω | m < t*X ω+(1-t)*Y ω}/
        (P.real {ω | m < X ω}*P.real {ω | m < Y ω}) := by
  rw [tailRatio, weightedTail_map P X Y hX hY hInd,
    survival_map P X hX, survival_map P Y hY]

end

end Conjectures.FeldheimWeightedTail
