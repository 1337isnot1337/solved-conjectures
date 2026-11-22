module

public import Conjectures.AgnosticVC.OriginalInformation
public import Mathlib.InformationTheory.KullbackLeibler.Basic
public import Mathlib.Probability.ProbabilityMassFunction.Integrals

/-! The measure-theoretic KL interpretation of the original fixed-pool information. -/

@[expose] public section

open scoped ENNReal

namespace AgnosticVC

open MeasureTheory
private theorem pmf_klDiv_of_finite_support {A : Type*} [MeasurableSpace A] [MeasurableSingletonClass A]
    (p q : PMF A) (hf : p.support.Finite)
    (hsub : p.support ⊆ q.support) :
    InformationTheory.klDiv p.toMeasure q.toMeasure ≠ ⊤ ∧
    (InformationTheory.klDiv p.toMeasure q.toMeasure).toReal =
      ∑' a, (p a).toReal * Real.log ((p a).toReal / (q a).toReal) := by
  have h_ac : p.toMeasure ≪ q.toMeasure := by
    apply Measure.AbsolutelyContinuous.mk
    intro s hs hq
    exact (p.toMeasure_apply_eq_zero_iff hs).mpr
      (((q.toMeasure_apply_eq_zero_iff hs).mp hq).mono_left hsub)
  have hi : Integrable (llr p.toMeasure q.toMeasure) p.toMeasure := by
    have h := IntegrableOn.of_finite (μ := p.toMeasure) (f := llr p.toMeasure q.toMeasure) hf
    simpa only [IntegrableOn, PMF.restrict_toMeasure_support] using h
  refine ⟨InformationTheory.klDiv_ne_top h_ac hi, ?_⟩
  rw [InformationTheory.toReal_klDiv_of_measure_eq h_ac (by simp), PMF.integral_eq_tsum _ _ hi]
  apply tsum_congr
  intro a
  by_cases hp : p a = 0
  · simp [hp]
  have hq := (q.mem_support_iff a).mp (hsub ((p.mem_support_iff a).mpr hp))
  have hs := congrArg (fun m : Measure A => m {a}) (Measure.withDensity_rnDeriv_eq _ _ h_ac)
  change (q.toMeasure.withDensity (p.toMeasure.rnDeriv q.toMeasure)) {a} = p.toMeasure {a} at hs
  rw [withDensity_apply _ (measurableSet_singleton a), lintegral_singleton,
    p.toMeasure_apply_singleton a (measurableSet_singleton a),
    q.toMeasure_apply_singleton a (measurableSet_singleton a)] at hs
  have ht := congrArg ENNReal.toReal hs
  rw [ENNReal.toReal_mul] at ht
  have he : (p.toMeasure.rnDeriv q.toMeasure a).toReal = (p a).toReal / (q a).toReal :=
    (eq_div_iff (ENNReal.toReal_pos hq (q.apply_ne_top a)).ne').mpr ht
  rw [smul_eq_mul, llr, he]

open SteinkeZakynthinou

variable {H X : Type*} [MeasurableSpace H] [MeasurableSingletonClass H] {n d : ℕ}

/-- For a finite-support joint law the discrete information formula agrees with Mathlib KL. -/
theorem originalPoolInformation_eq_klDiv_of_finite_support
    (A : (Fin n → X × Bool) → PMF H) (z : Pool n X)
    (hf : (originalPoolJoint A z).support.Finite) :
    let J := originalPoolJoint A z
    let Q := originalPoolMarginalProduct A z
    InformationTheory.klDiv J.toMeasure Q.toMeasure ≠ ⊤ ∧
      (InformationTheory.klDiv J.toMeasure Q.toMeasure).toReal = originalPoolInformation A z :=
  pmf_klDiv_of_finite_support _ _ hf (originalPoolJoint_support_subset A z)

/-- At a fixed pool the actual joint law has finite Mathlib KL divergence from the genuine
marginal product, and its real value is the finite channel information. -/
theorem poolInformation_eq_klDiv [Nonempty H] (hd : 0 < d) (hn : d ≤ n)
    (predict : H → X → Bool) (z : Pool n X) :
    let J := originalPoolJoint (properLearner hd hn predict) z
    let Q := originalPoolMarginalProduct (properLearner hd hn predict) z
    InformationTheory.klDiv J.toMeasure Q.toMeasure ≠ ⊤ ∧
      (InformationTheory.klDiv J.toMeasure Q.toMeasure).toReal = poolInformation hd hn predict z := by
  intro J Q
  let V := TraceSpace predict (fun i => (z i).1)
  let emb : Selector n × V → Selector n × H := fun x => (x.1, canonicalRep predict (fun i => (z i).1) x.2)
  have hf : J.support.Finite := (Set.finite_range emb).subset (by
    intro sh hsh
    obtain ⟨v, hv⟩ := originalPoolJoint_supported hd hn predict z hsh
    exact ⟨(sh.1,v), Prod.ext rfl hv⟩)
  have h := originalPoolInformation_eq_klDiv_of_finite_support (properLearner hd hn predict) z hf
  refine ⟨h.1, h.2.trans ?_⟩
  exact originalPoolInformation_eq_poolInformation hd hn predict z

end AgnosticVC
