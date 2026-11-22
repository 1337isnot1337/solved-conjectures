module

public import Conjectures.AgnosticVC.KLRates
public import Mathlib.InformationTheory.KullbackLeibler.DataProcessing

/-! The complete-name information bounds KL on every prescribed measurable output space. -/

@[expose] public section

namespace AgnosticVC

open MeasureTheory SteinkeZakynthinou
open scoped ENNReal

private theorem pmf_toMeasure_trim {B : Type*} {m M : MeasurableSpace B}
    (p : PMF B) (h : m ≤ M) :
    (@PMF.toMeasure B M p).trim h = @PMF.toMeasure B m p := by
  refine @Measure.ext B m _ _ fun s hs => ?_
  calc
    _ = @PMF.toMeasure B M p s := trim_measurableSet_eq h hs
    _ = p.toOuterMeasure s := @PMF.toMeasure_apply_eq_toOuterMeasure_apply B M p s (h s hs)
    _ = _ := (@PMF.toMeasure_apply_eq_toOuterMeasure_apply B m p s hs).symm

/-- Forgetting measurable output events can only decrease the fixed-pool KL divergence.
In the discrete output space, the finite-support formula computes its exact value. -/
theorem originalPoolKL_le_information_of_finite_support {H X : Type*} [mH : MeasurableSpace H]
    {n : ℕ} (A : (Fin n → X × Bool) → PMF H) (z : Pool n X)
    (hf : (originalPoolJoint A z).support.Finite) :
    originalPoolKL A z ≤ ENNReal.ofReal (originalPoolInformation A z) := by
  let J := originalPoolJoint A z
  let Q := originalPoolMarginalProduct A z
  let m : MeasurableSpace (Selector n × H) := inferInstance
  let M : MeasurableSpace (Selector n × H) := (inferInstance : MeasurableSpace (Selector n)).prod ⊤
  have hm : m ≤ M := by
    change MeasurableSpace.prod _ mH ≤ MeasurableSpace.prod _ ⊤
    unfold MeasurableSpace.prod
    exact sup_le_sup le_rfl (MeasurableSpace.comap_mono le_top)
  have hKL : InformationTheory.klDiv (@PMF.toMeasure _ M J) (@PMF.toMeasure _ M Q) ≠ ⊤ ∧
      (InformationTheory.klDiv (@PMF.toMeasure _ M J) (@PMF.toMeasure _ M Q)).toReal =
        originalPoolInformation A z := by
    have hTop : @MeasurableSingletonClass H ⊤ :=
      @MeasurableSingletonClass.mk H ⊤ (fun _ => MeasurableSpace.measurableSet_top)
    exact @originalPoolInformation_eq_klDiv_of_finite_support H X ⊤ hTop n A z hf
  have h := InformationTheory.klDiv_trim_le (@PMF.toMeasure _ M J) (@PMF.toMeasure _ M Q) hm
  rw [pmf_toMeasure_trim J hm, pmf_toMeasure_trim Q hm] at h
  change originalPoolKL A z ≤ _ at h
  exact h.trans_eq ((ENNReal.ofReal_toReal hKL.1).symm.trans (congrArg ENNReal.ofReal hKL.2))

/-- On every pool, the KL divergence of the actual algorithm's output is bounded by
its information in the full hypothesis name. -/
theorem properLearner_coarseKL_le {H X : Type*} [MeasurableSpace H] [Nonempty H] [TraceOrder H]
    {n d : ℕ} (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool) (z : Pool n X) :
    originalPoolKL (properLearner hd hn predict) z ≤ ENNReal.ofReal (poolInformation hd hn predict z) := by
  rw [← originalPoolInformation_eq_poolInformation hd hn predict z]
  apply originalPoolKL_le_information_of_finite_support
  let V := TraceSpace predict (fun i => (z i).1)
  let em : Selector n × V → Selector n × H := fun x => (x.1, canonicalRep predict (fun i => (z i).1) x.2)
  refine (Set.finite_range em).subset fun sh hsh => ?_
  obtain ⟨v, hv⟩ := originalPoolJoint_supported hd hn predict z hsh
  exact ⟨(sh.1,v), Prod.ext rfl hv⟩

/-- The iid KL bound for arbitrary prescribed output measurable structures, by domination
by the measurable complete-name information statistic. -/
theorem properLearner_coarseKL_lintegral_le {H X : Type*} [MeasurableSpace H] [MeasurableSpace X]
    [Nonempty H] [TraceOrder H] {n d : ℕ} (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool)
    (hvc : HasVCDimensionAtMost predict d) (hsel : HasMeasurableTraceSelection predict)
    (D : Measure (X × Bool)) [IsProbabilityMeasure D] :
    (∫⁻ z, originalPoolKL (properLearner hd hn predict) z
      ∂Measure.pi (fun _ : Fin n × Bool => D)) ≤ ENNReal.ofReal (19712 * d) := by
  let μ := Measure.pi (fun _ : Fin n × Bool => D)
  let f := poolInformation hd hn predict
  have hI : Integrable f μ := integrable_poolInformation hd hn predict hsel μ
  have hf : 0 ≤ᵐ[μ] f := Filter.Eventually.of_forall fun z =>
    channelInfo_nonneg (outputChannel hd hn predict z) (fun s a => (outputChannel_isLaw hd hn predict z s).1 a)
  calc
    _ ≤ ∫⁻ z, ENNReal.ofReal (f z) ∂μ := lintegral_mono (properLearner_coarseKL_le hd hn predict)
    _ = ENNReal.ofReal (∫ z, f z ∂μ) := (ofReal_integral_eq_lintegral_ofReal hI hf).symm
    _ ≤ _ := ENNReal.ofReal_le_ofReal (properLearner_cmi_le hd hn predict hvc hsel D)

end AgnosticVC
