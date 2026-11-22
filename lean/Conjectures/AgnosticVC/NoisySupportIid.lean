module

public import Conjectures.AgnosticVC.NoisySupportLearner
public import Conjectures.AgnosticVC.RepeatedFeatureReadout
public import Conjectures.AgnosticVC.ReadoutIid
public import Mathlib.Data.Nat.Sqrt

/-! A countable signature of eligible scores makes the original noisy learner
measurable on the completion of the experiment. -/

@[expose] public section

namespace AgnosticVC

open MeasureTheory Set Finset
open scoped ENNReal

variable {H X : Type*} {n k : ℕ}

theorem measurable_sampleSupportScore [MeasurableSpace X] {predict : H → X → Bool} {h : H}
    (hh : Measurable (predict h)) : Measurable (fun z : Fin n → X × Bool => sampleSupportScore predict z h) := by
  unfold sampleSupportScore
  refine Finset.measurable_sum _ fun i _ => ?_
  unfold supportScore
  have h₁ : Measurable (fun z : Fin n → X × Bool => predict h (z i).1) :=
    hh.comp (measurable_fst.comp (measurable_pi_apply i))
  have h₂ : Measurable (fun z : Fin n → X × Bool => (z i).2) := measurable_snd.comp (measurable_pi_apply i)
  exact Measurable.ite (h₁ (measurableSet_singleton true))
    (Measurable.ite (h₂ (measurableSet_singleton true)) measurable_const measurable_const) measurable_const

variable [LinearOrder H]

/-- The learner is fixed for all samples. A countable set containing the
eligible names almost surely suffices to make its law measurable on the
completion of the given experiment. -/
theorem aemeasurable_noisySupportLearner_of_eligible [MeasurableSpace X] [MeasurableSpace (Option H)]
    (hk : 0 < k) {offset : ℤ} (hoff : 0 ≤ offset)
    (predict : H → X → Bool) (hfin : ∀ x, {h | predict h x = true}.Finite)
    (μ : Measure (Fin n → X × Bool)) {C : Set H} (hC : C.Countable)
    (hpred : ∀ h ∈ C, Measurable (predict h))
    (heligible : ∀ᵐ z ∂μ, ∀ h, offset < sampleSupportScore predict z h → h ∈ C) :
    AEMeasurable (fun z => (noisySupportLearner hk offset predict hfin z).toMeasure) μ := by
  classical
  let Z := Fin n → X × Bool
  let : Countable C := hC.to_subtype
  let W (z : Z) : Set (C × ℤ) := {p | offset < p.2 ∧ sampleSupportScore predict z p.1.val = p.2}
  have hW (z : Z) : (W z).Finite := by
    let K := hitCandidates predict hfin (Prod.fst ∘ z)
    have hK : (Subtype.val ⁻¹' (K : Set H) : Set C).Finite :=
      K.finite_toSet.preimage Subtype.val_injective.injOn
    apply (hK.image (fun i => (i,sampleSupportScore predict z i.val))).subset
    rintro ⟨j,u⟩ ⟨hu,he⟩
    refine ⟨j,?_,Prod.ext rfl he⟩
    change j.val ∈ K
    by_contra hj
    have hnot (i : Fin n) : predict j.val (z i).1 = false := by
      apply Bool.eq_false_of_not_eq_true
      intro hi
      exact hj ((mem_hitCandidates predict hfin (Prod.fst ∘ z) j.val).mpr ⟨i,hi⟩)
    have hz : sampleSupportScore predict z j.val = 0 := by simp [sampleSupportScore, supportScore, hnot]
    change sampleSupportScore predict z j.val = u at he
    rw [hz] at he
    change offset < u at hu
    rw [← he] at hu
    exact (not_lt_of_ge hoff) hu
  let T := Finset (C × ℤ)
  let : MeasurableSpace T := ⊤
  let : MeasurableSingletonClass T := ⟨fun _ => trivial⟩
  let code (z : Z) : T := (hW z).toFinset
  have hm (z : Z) (p : C × ℤ) : p ∈ code z ↔ offset < p.2 ∧ sampleSupportScore predict z p.1.val = p.2 := by
    change p ∈ (hW z).toFinset ↔ _
    rw [Set.Finite.mem_toFinset]
    rfl
  have hcode : Measurable code := by
    apply measurable_to_countable'
    intro v
    rw [show code ⁻¹' {v} = ⋂ p : C × ℤ, {z | p ∈ code z ↔ p ∈ v} by
      ext z
      simp only [Set.mem_preimage, Set.mem_singleton_iff, mem_iInter, mem_ofPred_eq]
      exact Finset.ext_iff]
    refine MeasurableSet.iInter fun p => ?_
    have hp : MeasurableSet {z : Z | p ∈ code z} := by
      simp_rw [hm]
      exact (MeasurableSet.const _).inter
        (measurable_sampleSupportScore (hpred p.1.val p.1.property) (measurableSet_singleton p.2))
    by_cases hv : p ∈ v
    · simpa only [hv, iff_true] using hp
    · simpa only [hv, iff_false, Set.compl_ofPred] using hp.compl
  let good (z : Z) := ∀ h, offset < sampleSupportScore predict z h → h ∈ C
  let A := noisySupportLearner (n := n) hk offset predict hfin
  have hsame (z w : Z) (hz : good z) (hw : good w) (he : code z = code w) : A z = A w := by
    let F := (code z).image (fun p => p.1.val)
    have hF (u : Z) (hu : good u) (hcodeEq : code u = code z) (h : H)
        (hp : offset < sampleSupportScore predict u h) : h ∈ F := by
      have hmem : (⟨h,hu h hp⟩,sampleSupportScore predict u h) ∈ code u :=
        (hm u _).mpr ⟨hp,rfl⟩
      exact Finset.mem_image.mpr ⟨_,hcodeEq ▸ hmem,rfl⟩
    have hscore : (fun h : F => sampleSupportScore predict z h.val) =
        (fun h : F => sampleSupportScore predict w h.val) := by
      funext h
      obtain ⟨p,hp,heq⟩ := Finset.mem_image.mp h.property
      have hpm : p ∈ code w := he ▸ hp
      rw [← heq, (hm z p).mp hp |>.2, (hm w p).mp hpm |>.2]
    rw [show A z = _ from noisySupportLearner_eq_on_eligible hk hoff predict hfin z F (hF z hz rfl),
      show A w = _ from noisySupportLearner_eq_on_eligible hk hoff predict hfin w F (hF w hw he.symm)]
    congr 2
  let readout (v : T) : Measure (Option H) :=
    if hv : ∃ z, good z ∧ code z = v then (A hv.choose).toMeasure else 0
  have hr : Measurable readout := measurable_of_countable _
  apply (hr.comp hcode).aemeasurable.congr
  filter_upwards [heligible] with z hz
  have hv : ∃ w, good w ∧ code w = code z := ⟨z,hz,rfl⟩
  unfold Function.comp readout
  rw [dite_eq_left hv, hsame hv.choose z hv.choose_spec.1 hz hv.choose_spec.2]

/-- Ordinary iid CMI for the same named-output learner under a countable
almost-sure envelope for eligible scores. -/
theorem noisySupportLearner_iid_information_le [MeasurableSpace X] [MeasurableSpace (Option H)]
    [MeasurableEq (Option H)] (hk : 0 < k) (hnk : n ≤ k^2) {offset : ℤ} (hoff : 0 ≤ offset)
    {s : ℕ} (predict : H → X → Bool) (hfin : ∀ x, {h | predict h x = true}.Finite)
    (hinc : ∀ x, (hfin x).toFinset.card ≤ s) (D : Measure (X × Bool)) [IsProbabilityMeasure D]
    {C : Set H} (hC : C.Countable) (hpred : ∀ h ∈ C, Measurable (predict h))
    (heligible : ∀ᵐ z ∂(Measure.pi fun _ : Fin n => D),
      ∀ h, offset < sampleSupportScore predict z h → h ∈ C) :
    let μ := Measure.pi fun _ : Fin n × Bool => D
    let A := noisySupportLearner hk offset predict hfin (n := n)
    let info p := (InformationTheory.klDiv (originalPoolJoint A p).toMeasure
      (originalPoolMarginalProduct A p).toMeasure).toReal
    Integrable info μ ∧ (∫ p, info p ∂μ) ≤ 20 * (s : ℝ) := by
  intro μ A info
  have hr := aemeasurable_noisySupportLearner_of_eligible hk hoff predict hfin _ hC hpred heligible
  exact finiteSupport_iid_information_le D A (noisySupportLearner_support_finite hk offset predict hfin)
    (fun _ ht => hr.nullMeasurable ht) _ (noisySupportLearner_fixedPairing hk hnk hoff predict hfin hinc)

omit [LinearOrder H] in
/-- A bounded-overlap family of measurable supports has countably many
positive-mass supports under any one feature law. -/
theorem countable_positive_supports_of_overlap [MeasurableSpace X] {s : ℕ}
    (predict : H → X → Bool) (hfin : ∀ x, {h | predict h x = true}.Finite)
    (hinc : ∀ x, (hfin x).toFinset.card ≤ s) (hpred : ∀ h, Measurable (predict h))
    (M : Measure X) [IsProbabilityMeasure M] :
    {h : H | 0 < M {x | predict h x = true}}.Countable := by
  classical
  let S (h : H) : Set X := {x | predict h x = true}
  let w (h : H) := M (S h)
  let f (h : H) (x : X) := (S h).indicator (fun _ => (1 : ℝ≥0∞)) x
  have hS (h : H) : MeasurableSet (S h) := hpred h (measurableSet_singleton true)
  have hf (h : H) : Measurable (f h) := measurable_const.indicator (hS h)
  have hw (h : H) : (∫⁻ x, f h x ∂M) = w h := by
    unfold f w
    rw [lintegral_indicator_const (hS h), one_mul]
  have hz (F : Finset H) (x : X) : ∑ h ∈ F, f h x ≤ (s : ℝ≥0∞) := by
    have hsub : F.filter (fun h => predict h x = true) ⊆ (hfin x).toFinset := by
      intro h hh
      rw [Set.Finite.mem_toFinset]
      exact (mem_filter.mp hh).2
    simp only [f, Set.indicator_apply, S, mem_ofPred_eq]
    rw [← sum_filter, sum_const, nsmul_eq_mul, mul_one]
    exact_mod_cast (Finset.card_le_card hsub).trans (hinc x)
  have hfinSum (F : Finset H) : ∑ h ∈ F, w h ≤ (s : ℝ≥0∞) := by
    simp_rw [← hw]
    rw [← lintegral_finsetSum F (fun h _ => hf h)]
    exact (lintegral_mono (hz F)).trans_eq (by rw [lintegral_const, measure_univ, mul_one])
  have hsum : ∑' h, w h ≤ (s : ℝ≥0∞) := ENNReal.summable.tsum_le_of_sum_le hfinSum
  have hc := Summable.countable_support_ennreal (ne_top_of_le_ne_top (ENNReal.natCast_ne_top s) hsum)
  simpa only [Function.support, w, S, pos_iff_ne_zero] using hc

omit [LinearOrder H] in
private theorem sampleSupportScore_le_hits [DecidableEq X] (S : H → Finset X) (z : Fin n → X × Bool)
    (h : H) : sampleSupportScore (fun j x => decide (x ∈ S j)) z h ≤
      ((univ.filter (fun i : Fin n => (z i).1 ∈ S h)).card : ℤ) := by
  unfold sampleSupportScore
  calc
    _ ≤ ∑ i, if (z i).1 ∈ S h then (1 : ℤ) else 0 := sum_le_sum fun i _ => by
      by_cases hi : (z i).1 ∈ S h <;> by_cases hy : (z i).2 = true <;>
        norm_num [supportScore, hi, hy]
    _ = _ := by rw [← sum_filter, sum_const, nsmul_eq_mul, mul_one]

/-- The finite-support learner achieves an actual iid CMI bound under every
iid law, using the same offset determined by the support size. -/
theorem noisyFiniteSupport_iid_information_le [MeasurableSpace X] [MeasurableEq X] [DecidableEq X]
    [MeasurableSpace (Option H)] [MeasurableEq (Option H)]
    {m s : ℕ} (S : H → Finset X) (hsize : ∀ h, (S h).card ≤ m) (hk : 0 < k) (hnk : n ≤ k^2)
    (hfin : ∀ x, {h | decide (x ∈ S h) = true}.Finite)
    (hinc : ∀ x, (hfin x).toFinset.card ≤ s) (D : Measure (X × Bool)) [IsProbabilityMeasure D] :
    let μ := Measure.pi fun _ : Fin n × Bool => D
    let A := noisySupportLearner hk (m : ℤ) (fun h x => decide (x ∈ S h)) hfin (n := n)
    let info p := (InformationTheory.klDiv (originalPoolJoint A p).toMeasure
      (originalPoolMarginalProduct A p).toMeasure).toReal
    Integrable info μ ∧ (∫ p, info p ∂μ) ≤ 20 * (s : ℝ) := by
  intro μ A info
  let M := D.map Prod.fst
  have hM : IsProbabilityMeasure M :=
    (Measure.isProbabilityMeasure_map_iff measurable_fst.aemeasurable).mpr inferInstance
  let predict (h : H) (x : X) : Bool := decide (x ∈ S h)
  have hp (h : H) : Measurable (predict h) := by
    have hite : Measurable (fun x : X => if x ∈ (S h : Set X) then true else false) :=
      Measurable.ite (S h).finite_toSet.measurableSet measurable_const measurable_const
    convert hite using 1
    funext x
    by_cases hx : x ∈ S h <;> simp [predict,hx]
  let C := {h : H | 0 < M {x | predict h x = true}}
  have hC : C.Countable := countable_positive_supports_of_overlap predict hfin hinc hp M
  have hcount : ∀ᵐ z ∂(Measure.pi fun _ : Fin n => D),
      ∀ h, (m : ℤ) < sampleSupportScore predict z h → h ∈ C := by
    filter_upwards [iid_null_finiteSupport_hits_le (n := n) S D] with z hz
    intro h hh
    by_contra hn
    have hnull : M (S h : Set X) = 0 := by
      have he : {x | predict h x = true} = (S h : Set X) := by ext x; simp [predict]
      exact le_antisymm (le_of_not_gt (fun hv => hn (by change 0 < M _; rwa [he]))) bot_le
    have hm := (hz h hnull).trans (hsize h)
    exact (not_lt_of_ge ((sampleSupportScore_le_hits S z h).trans (by exact_mod_cast hm))) hh
  exact noisySupportLearner_iid_information_le hk hnk (Int.natCast_nonneg m) predict hfin hinc D hC
    (fun h _ => hp h) hcount

/-- One proper learner has both bounds for a bounded-overlap family of finite
supports. Its reference is the zero predictor. Its randomness and offset do
not depend on the iid law. -/
theorem finiteSupport_noisy_iid_rates [MeasurableSpace X] [MeasurableEq X] [DecidableEq X]
    [MeasurableSpace (Option H)] [MeasurableEq (Option H)]
    {m s : ℕ} (S : H → Finset X) (hsize : ∀ h, (S h).card ≤ m) (hn : 0 < n)
    (hfin : ∀ x, {h | decide (x ∈ S h) = true}.Finite)
    (hinc : ∀ x, (hfin x).toFinset.card ≤ s) :
    ∃ A : (Fin n → X × Bool) → PMF (Option H),
      (∀ D : Measure (X × Bool), [IsProbabilityMeasure D] →
        let μ := Measure.pi fun _ : Fin n × Bool => D
        let info p := (InformationTheory.klDiv (originalPoolJoint A p).toMeasure
          (originalPoolMarginalProduct A p).toMeasure).toReal
        Integrable info μ ∧ (∫ p, info p ∂μ) ≤ 20 * (s : ℝ)) ∧
      ∀ z, let err := empiricalError (supportPredict (fun h x => decide (x ∈ S h))) z
        (∑' h, (A z h).toReal * err h) ≤ (⨅ h, err h) + ((m : ℝ) / n + 8 / Real.sqrt n) := by
  let k := n.sqrt + 1
  have hk : 0 < k := Nat.succ_pos _
  have hnk : n ≤ k^2 := (Nat.lt_succ_sqrt' n).le
  let predict (h : H) (x : X) : Bool := decide (x ∈ S h)
  refine ⟨noisySupportLearner hk (m : ℤ) predict hfin, ?_, ?_⟩
  · intro D _
    exact noisyFiniteSupport_iid_information_le S hsize hk hnk hfin hinc D
  · intro z
    have hnR : 0 < (n : ℝ) := Nat.cast_pos.mpr hn
    have hroot : 1 ≤ Real.sqrt (n : ℝ) := by
      simpa only [Real.sqrt_one] using (Real.sqrt_le_sqrt (by exact_mod_cast hn : (1 : ℝ) ≤ n))
    have hs : (n.sqrt : ℝ) ≤ Real.sqrt (n : ℝ) := by
      apply Real.le_sqrt_of_sq_le
      exact_mod_cast Nat.sqrt_le' n
    have hk' : (k : ℝ) ≤ 2 * Real.sqrt (n : ℝ) := by
      change ((n.sqrt + 1 : ℕ) : ℝ) ≤ _
      push_cast
      linarith only [hs,hroot]
    have hsq := Real.sq_sqrt hnR.le
    have hnoise : 4*(k : ℝ) / n ≤ 8 / Real.sqrt n := by
      calc
        _ = (4*(k : ℝ) / Real.sqrt n) / Real.sqrt n := by
          rw [← div_mul_eq_div_div, ← sq, hsq]
        _ ≤ _ := by
          apply (div_le_div_iff_of_pos_right (Real.sqrt_pos.mpr hnR)).mpr
          apply (div_le_iff₀ (Real.sqrt_pos.mpr hnR)).mpr
          linarith only [hk']
    have hrate : ((m : ℝ) + 4*(k : ℝ)) / n ≤ (m : ℝ) / n + 8 / Real.sqrt n := by
      rw [add_div]
      exact add_le_add le_rfl hnoise
    have hbound := noisySupportLearner_empirical_le hn hk (Int.natCast_nonneg m) predict hfin z
    push_cast at hbound
    exact hbound.trans (add_le_add le_rfl hrate)

end AgnosticVC
