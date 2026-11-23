module

public import Conjectures.AgnosticVC.IidRectangleDensity
public import Conjectures.AgnosticVC.NoisySupportIid
public import Mathlib.Algebra.Order.Floor.Semiring

/-! Bounded overlap under the sharp outer uniform-convergence premise. -/

@[expose] public section

namespace AgnosticVC

open MeasureTheory Set Finset
open scoped ENNReal

private theorem signedScore_le_hit_card {H X : Type*} {n : ℕ}
    (predict : H → X → Bool) (z : Fin n → X × Bool) (h : H) :
    sampleSupportScore predict z h ≤ (Nat.card {i : Fin n // predict h (z i).1 = true} : ℤ) := by
  classical
  unfold sampleSupportScore
  calc
    _ ≤ ∑ i, if predict h (z i).1 = true then (1 : ℤ) else 0 := sum_le_sum fun i _ => by
      by_cases hi : predict h (z i).1 = true <;> by_cases hy : (z i).2 = true <;>
        norm_num [supportScore,hi,hy]
    _ = _ := by
      rw [Nat.card_eq_fintype_card,Fintype.card_subtype,← sum_filter,sum_const,nsmul_eq_mul,mul_one]

/-- One proper learner satisfies both agnostic rates for bounded pointwise
overlap when the null-support envelope is small at a fixed size. Supports
may be infinite. The learner uses the same offset and noise for all iid laws. -/
theorem noisySupport_iid_rates_of_nullHitEnvelope {H X : Type*} [LinearOrder H]
    [MeasurableSpace X] [MeasurableSpace.CountablyGenerated X]
    [MeasurableSpace (Option H)] [MeasurableEq (Option H)]
    {m n s : ℕ} (hn : 0 < n) (predict : H → X → Bool) (hpred : ∀ h, Measurable (predict h))
    (hfin : ∀ x, {h | predict h x = true}.Finite) (hinc : ∀ x, (hfin x).toFinset.card ≤ s)
    (henv : NullHitEnvelopeAt (fun h => {x | predict h x = true}) (m + 1)) :
    ∃ A : (Fin n → X × Bool) → PMF (Option H),
      (∀ D : Measure (X × Bool), [IsProbabilityMeasure D] →
        let μ := Measure.pi fun _ : Fin n × Bool => D
        let info p := (InformationTheory.klDiv (originalPoolJoint A p).toMeasure
          (originalPoolMarginalProduct A p).toMeasure).toReal
        Integrable info μ ∧ (∫ p, info p ∂μ) ≤ 20 * (s : ℝ)) ∧
      ∀ z, let err := empiricalError (supportPredict predict) z
        (∑' h, (A z h).toReal * err h) ≤ (⨅ h, err h) + ((m : ℝ) / n + 8 / Real.sqrt n) := by
  let k := n.sqrt + 1
  have hk : 0 < k := Nat.succ_pos _
  have hnk : n ≤ k^2 := (Nat.lt_succ_sqrt' n).le
  refine ⟨noisySupportLearner hk (m : ℤ) predict hfin,?_,noisySupportLearner_empirical_le_natSqrt hn m predict hfin⟩
  intro D _
  let M := D.map Prod.fst
  have hM : IsProbabilityMeasure M :=
    (Measure.isProbabilityMeasure_map_iff measurable_fst.aemeasurable).mpr inferInstance
  let S (h : H) : Set X := {x | predict h x = true}
  let C := {h : H | 0 < M (S h)}
  have hC : C.Countable := countable_positive_supports_of_overlap predict hfin hinc hpred M
  have hp : MeasurePreserving (fun z : Fin n → X × Bool => Prod.fst ∘ z)
      (Measure.pi fun _ : Fin n => D) (Measure.pi fun _ : Fin n => M) :=
    measurePreserving_pi _ _ (fun _ => ⟨measurable_fst,rfl⟩)
  have hnull := hp.quasiMeasurePreserving.ae (iid_nullSupport_hits_lt_of_envelope S (Nat.succ_pos m) henv M (n := n))
  have heligible : ∀ᵐ z ∂(Measure.pi fun _ : Fin n => D),
      ∀ h, (m : ℤ) < sampleSupportScore predict z h → h ∈ C := by
    filter_upwards [hnull] with z hz
    intro h hh
    by_contra hnC
    have hzero : M (S h) = 0 := le_antisymm (le_of_not_gt hnC) bot_le
    have hcard : Nat.card {i : Fin n // predict h (z i).1 = true} ≤ m := Nat.lt_succ_iff.mp (hz h hzero)
    exact (not_lt_of_ge ((signedScore_le_hit_card predict z h).trans (by exact_mod_cast hcard))) hh
  exact noisySupportLearner_iid_information_le hk hnk (Int.natCast_nonneg m) predict hfin hinc D hC
    (fun h _ => hpred h) heligible

/-- Sharp one-sided outer uniform convergence for the positive supports
gives both rates for bounded overlap. When the overlap is `O(d)`, this
has the required `O(d)` information and `O(sqrt(d/n))` empirical excess. -/
theorem noisySupport_iid_rates_of_sharpDeviation {H X : Type*} [LinearOrder H]
    [MeasurableSpace X] [MeasurableSpace.CountablyGenerated X]
    [MeasurableSpace (Option H)] [MeasurableEq (Option H)]
    {d n s : ℕ} (hd : 0 < d) (hn : d ≤ n) (B : ℝ)
    (predict : H → X → Bool) (hpred : ∀ h, Measurable (predict h))
    (hfin : ∀ x, {h | predict h x = true}.Finite) (hinc : ∀ x, (hfin x).toFinset.card ≤ s)
    (hu : ∀ (M : Measure X) [IsProbabilityMeasure M] (k : ℕ), 0 < k →
      ∃ E : (Fin k → X) → ℝ≥0∞, Measurable E ∧
        (∫⁻ z, E z ∂Measure.pi (fun _ : Fin k => M)) ≤ ENNReal.ofReal (B * Real.sqrt ((d : ℝ) / k)) ∧
        ∀ z h, (Nat.card {i : Fin k // predict h (z i) = true} : ℝ≥0∞) / k ≤
          M {x | predict h x = true} + E z) :
    ∃ A : (Fin n → X × Bool) → PMF (Option H),
      (∀ D : Measure (X × Bool), [IsProbabilityMeasure D] →
        let μ := Measure.pi fun _ : Fin n × Bool => D
        let info p := (InformationTheory.klDiv (originalPoolJoint A p).toMeasure
          (originalPoolMarginalProduct A p).toMeasure).toReal
        Integrable info μ ∧ (∫ p, info p ∂μ) ≤ 20 * (s : ℝ)) ∧
      ∀ z, let err := empiricalError (supportPredict predict) z
        (∑' h, (A z h).toReal * err h) ≤ (⨅ h, err h) + (16*B^2+9) * Real.sqrt ((d : ℝ)/n) := by
  let m := ⌈16 * B^2 * (d : ℝ)⌉₊
  let k := m+1
  have hk : 0 < k := Nat.succ_pos _
  have hkR : 0 < (k : ℝ) := Nat.cast_pos.mpr hk
  have hm : 16 * B^2 * (d : ℝ) ≤ (m : ℝ) := Nat.le_ceil _
  have hklarge : 16 * B^2 * (d : ℝ) < (k : ℝ) := by
    change _ < ((m+1 : ℕ) : ℝ)
    push_cast
    linarith only [hm]
  have hsmall : B * Real.sqrt ((d : ℝ) / k) < 1/4 := by
    by_contra! hh
    have hsq := pow_le_pow_left₀ (by norm_num : (0 : ℝ) ≤ 1/4) hh 2
    rw [mul_pow, Real.sq_sqrt (by positivity)] at hsq
    have hh' : B^2 * ((d : ℝ)/k) < (1/4)^2 := by
      rw [← mul_div_assoc, div_lt_iff₀ hkR]
      linarith only [hklarge]
    exact (not_lt_of_ge hsq) hh'
  have henv : NullHitEnvelopeAt (fun h => {x | predict h x = true}) (m+1) := by
    intro M _
    obtain ⟨E,hE,hmean,hdom⟩ := hu M k hk
    refine ⟨E,hE,?_,?_⟩
    · have hh := (ENNReal.ofReal_lt_ofReal_iff (by norm_num : (0 : ℝ) < 1/4)).mpr hsmall
      rw [ENNReal.ofReal_div_of_pos (by norm_num : (0 : ℝ) < 4), ENNReal.ofReal_one,
        show ENNReal.ofReal 4 = 4 by norm_num] at hh
      exact hmean.trans_lt hh
    · intro z h hzero
      change (Nat.card {i : Fin k // predict h (z i) = true} : ℝ≥0∞) / k ≤ E z
      have hbound := hdom z h
      rw [hzero,zero_add] at hbound
      exact hbound
  obtain ⟨A,hinfo,hacc⟩ := noisySupport_iid_rates_of_nullHitEnvelope (hd.trans_le hn) predict hpred hfin hinc henv
  refine ⟨A,hinfo,?_⟩
  intro z
  refine (hacc z).trans (add_le_add le_rfl ?_)
  have hnR : (0 : ℝ) < n := Nat.cast_pos.mpr (hd.trans_le hn)
  have hdR : (1 : ℝ) ≤ d := by exact_mod_cast hd
  have hx : (d : ℝ) / n ≤ 1 := (div_le_one hnR).mpr (by exact_mod_cast hn)
  have hy : 0 ≤ (d : ℝ)/n := by positivity
  have hroot : (d : ℝ)/n ≤ Real.sqrt ((d : ℝ)/n) := by
    apply Real.le_sqrt_of_sq_le
    nlinarith only [mul_nonneg hy (sub_nonneg.mpr hx)]
  have hm' : (m : ℝ) ≤ (16*B^2+1) * d := by
    have hm' := (Nat.ceil_lt_add_one (show 0 ≤ 16*B^2*(d : ℝ) by positivity)).le
    exact hm'.trans (by linarith only [hdR])
  have hfloor : (m : ℝ)/n ≤ (16*B^2+1) * Real.sqrt ((d : ℝ)/n) := by
    calc
      _ ≤ ((16*B^2+1) * d) / n := div_le_div_of_nonneg_right hm' hnR.le
      _ = (16*B^2+1) * ((d : ℝ)/n) := mul_div_assoc _ _ _
      _ ≤ _ := mul_le_mul_of_nonneg_left hroot (by positivity)
  have hnoise : 8 / Real.sqrt n ≤ 8 * Real.sqrt ((d : ℝ)/n) := by
    rw [Real.sqrt_div (by positivity),← mul_div_assoc]
    apply div_le_div_of_nonneg_right _ (Real.sqrt_nonneg _)
    have hs : 1 ≤ Real.sqrt (d : ℝ) := by simpa only [Real.sqrt_one] using Real.sqrt_le_sqrt hdR
    linarith only [hs]
  linarith only [hfloor,hnoise]

end AgnosticVC
