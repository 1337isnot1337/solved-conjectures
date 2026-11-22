module

public import Conjectures.AgnosticVC.Output

/-! The actual joint PMF and the product of its marginals at a fixed pool. -/

@[expose] public section

open scoped BigOperators ENNReal

namespace AgnosticVC

open SteinkeZakynthinou
open SteinkeZakynthinou.Learner (selectorMean)

variable {H X : Type*} {n d : ℕ}

/-- Uniform on all selector vectors, equivalently the law of independent fair bits. -/
noncomputable def fairSelectorLaw (n : ℕ) : PMF (Selector n) :=
  PMF.ofFintype (fun _ => (Fintype.card (Selector n) : ℝ≥0∞)⁻¹) (by
    simp only [Finset.sum_const, Finset.card_univ, nsmul_eq_mul]
    apply ENNReal.mul_inv_cancel <;> simp)

@[simp] theorem fairSelectorLaw_apply (s : Selector n) :
    fairSelectorLaw n s = (Fintype.card (Selector n) : ℝ≥0∞)⁻¹ := rfl

/-- Every selector vector has the same probability `2⁻ⁿ`. -/
theorem fairSelectorLaw_apply_pow (s : Selector n) : fairSelectorLaw n s = ((2 : ℝ≥0∞)^n)⁻¹ := by
  rw [fairSelectorLaw_apply]
  simp [Selector]

/-- Draw the fair selector and the actual output hypothesis of the specified learner. -/
noncomputable def originalPoolJoint (A : (Fin n → X × Bool) → PMF H) (z : Pool n X) : PMF (Selector n × H) :=
  (fairSelectorLaw n).bind fun s =>
    (A (fun i => z (i, s i))).map (Prod.mk s)

@[simp] theorem originalPoolJoint_apply (A : (Fin n → X × Bool) → PMF H) (z : Pool n X) (s : Selector n) (h : H) :
    originalPoolJoint A z (s, h) =
      fairSelectorLaw n s * A (fun i => z (i, s i)) h := by
  classical
  rw [originalPoolJoint, PMF.bind_apply, tsum_eq_single s]
  · simp
  · intro t ht
    simp [Ne.symm ht]

/-- The first marginal of the actual joint law is the prescribed fair selector. -/
theorem originalPoolJoint_map_fst (A : (Fin n → X × Bool) → PMF H) (z : Pool n X) :
    (originalPoolJoint A z).map Prod.fst = fairSelectorLaw n := by
  simp only [originalPoolJoint, PMF.map_bind, PMF.map_comp]
  have he (s : Selector n) : (Prod.fst ∘ Prod.mk s : H → Selector n) = Function.const H s := rfl
  simp only [he, PMF.map_const, PMF.bind_pure]

/-- The actual marginal law of the returned hypothesis, averaging over all selectors. -/
noncomputable def originalPoolOutput (A : (Fin n → X × Bool) → PMF H) (z : Pool n X) : PMF H :=
  (originalPoolJoint A z).map Prod.snd

theorem originalPoolOutput_eq_bind (A : (Fin n → X × Bool) → PMF H) (z : Pool n X) :
    originalPoolOutput A z = (fairSelectorLaw n).bind fun s => A (fun i => z (i, s i)) := by
  simp only [originalPoolOutput, originalPoolJoint, PMF.map_bind, PMF.map_comp]
  have he (s : Selector n) : (Prod.snd ∘ Prod.mk s : H → H) = id := rfl
  simp only [he, PMF.map_id]

theorem originalPoolOutput_apply_real (A : (Fin n → X × Bool) → PMF H) (z : Pool n X) (h : H) :
    (originalPoolOutput A z h).toReal =
      selectorMean (fun s => (A (fun i => z (i, s i)) h).toReal) := by
  rw [originalPoolOutput_eq_bind, PMF.bind_apply, tsum_fintype, ENNReal.toReal_sum]
  · simp only [ENNReal.toReal_mul, fairSelectorLaw_apply, ENNReal.toReal_inv, ENNReal.toReal_natCast,
      ← Finset.mul_sum, selectorMean, div_eq_inv_mul]
  · intro s _
    exact ENNReal.mul_ne_top (PMF.apply_ne_top _ _) (PMF.apply_ne_top _ _)

/-- Independent sampling from the two true marginals of the original joint law. -/
noncomputable def originalPoolMarginalProduct (A : (Fin n → X × Bool) → PMF H) (z : Pool n X) : PMF (Selector n × H) :=
  ((originalPoolJoint A z).map Prod.fst).bind fun s => (originalPoolOutput A z).map (Prod.mk s)

@[simp] theorem originalPoolMarginalProduct_apply (A : (Fin n → X × Bool) → PMF H) (z : Pool n X) (s : Selector n) (h : H) :
    originalPoolMarginalProduct A z (s,h) =
      fairSelectorLaw n s * originalPoolOutput A z h := by
  classical
  rw [originalPoolMarginalProduct, originalPoolJoint_map_fst, PMF.bind_apply, tsum_eq_single s]
  · simp
  · intro t ht
    simp [Ne.symm ht]

/-- Every positive joint mass has positive mass under the product of its actual marginals. -/
theorem originalPoolJoint_support_subset (A : (Fin n → X × Bool) → PMF H) (z : Pool n X) :
    (originalPoolJoint A z).support ⊆ (originalPoolMarginalProduct A z).support := by
  rintro ⟨s,h⟩ hs
  rw [PMF.mem_support_iff, originalPoolJoint_apply, mul_ne_zero_iff] at hs
  rw [PMF.mem_support_iff, originalPoolMarginalProduct_apply, mul_ne_zero_iff]
  refine ⟨hs.1, ?_⟩
  have hm := (PMF.mem_support_map_iff Prod.snd (originalPoolJoint A z) h).2
    ⟨(s,h), by rwa [PMF.mem_support_iff, originalPoolJoint_apply, mul_ne_zero_iff], rfl⟩
  exact (PMF.mem_support_iff _ _).mp hm

/-- Every atom of the actual joint PMF uses the name of a full-pool representative. -/
theorem originalPoolJoint_supported [Nonempty H] [TraceOrder H] (hd : 0 < d) (hn : d ≤ n)
    (predict : H → X → Bool) (z : Pool n X) {sh : Selector n × H}
    (hs : sh ∈ (originalPoolJoint (properLearner hd hn predict) z).support) :
    ∃ v : TraceSpace predict (fun i => (z i).1), canonicalRep predict (fun i => (z i).1) v = sh.2 := by
  rw [PMF.mem_support_iff] at hs
  rcases sh with ⟨s,h⟩
  rw [originalPoolJoint_apply, mul_ne_zero_iff] at hs
  exact properLearner_supported hd hn predict (fun i => (z i).1) (fun i => (i,s i))
    (fun i => (z (i,s i)).2) ((PMF.mem_support_iff _ _).mpr hs.2)

/-- Mutual information as the exact discrete KL mass formula for the actual joint PMF and its
marginal product. The support inclusion above makes every nonzero summand finite. -/
noncomputable def originalPoolInformation (A : (Fin n → X × Bool) → PMF H) (z : Pool n X) : ℝ :=
  ∑' sh : Selector n × H, (originalPoolJoint A z sh).toReal *
    Real.log ((originalPoolJoint A z sh).toReal / (originalPoolMarginalProduct A z sh).toReal)

private theorem channelInfo_eq_log_ratio {A : Type*} [Fintype A] (p : Selector n → A → ℝ)
    (hp : ∀ s a, 0 ≤ p s a) :
    channelInfo p = selectorMean (fun s => ∑ a, p s a * Real.log (p s a / selectorMean (fun t => p t a))) := by
  unfold channelInfo
  rw [selectorMean_sum]
  refine Finset.sum_congr rfl fun a _ => ?_
  let q := selectorMean (fun s => p s a)
  have he (s : Selector n) : p s a * Real.log (p s a / q) = p s a * Real.log (p s a) - p s a * Real.log q := by
    by_cases h : p s a = 0
    · simp [h]
    have hq : q ≠ 0 := fun hq => h (eq_zero_of_selectorMean_eq_zero (fun t => hp t a) hq s)
    rw [Real.log_div h hq, mul_sub]
  change entropyGap (fun s => p s a) = selectorMean (fun s => p s a * Real.log (p s a / q))
  simp only [he, selectorMean_sub, selectorMean_mul_const, entropyGap, entropyTerm, q]

/-- The finite channel calculation is the discrete KL divergence of the actual hypothesis
and fair selector from the product of their actual marginal laws. -/
theorem originalPoolInformation_eq_poolInformation [Nonempty H] [TraceOrder H] (hd : 0 < d) (hn : d ≤ n)
    (predict : H → X → Bool) (z : Pool n X) :
    originalPoolInformation (properLearner hd hn predict) z = poolInformation hd hn predict z := by
  symm
  classical
  let V := TraceSpace predict (fun i => (z i).1)
  let rep : V → H := canonicalRep predict (fun i => (z i).1)
  let em : Selector n × V → Selector n × H := fun x => (x.1, rep x.2)
  let J := originalPoolJoint (properLearner hd hn predict) z
  let Q := originalPoolMarginalProduct (properLearner hd hn predict) z
  let p := outputChannel hd hn predict z
  let f := fun sh : Selector n × H => (J sh).toReal * Real.log ((J sh).toReal / (Q sh).toReal)
  have he : Function.Injective em := by
    intro v w h
    have h₁ := congrArg (fun a : Selector n × H => a.1) h
    have h₂ := congrArg (fun a : Selector n × H => a.2) h
    exact Prod.ext h₁ (canonicalRep_injective _ _ h₂)
  have hf (sh : Selector n × H) (h : sh ∉ Finset.univ.image em) : f sh = 0 := by
    have hzero : J sh = 0 := by
      by_contra hnz
      obtain ⟨v, hv⟩ := originalPoolJoint_supported hd hn predict z ((PMF.mem_support_iff _ _).mpr hnz)
      exact h (Finset.mem_image.mpr ⟨(sh.1,v), Finset.mem_univ _, Prod.ext rfl hv⟩)
    simp [f, hzero]
  have hmass (s : Selector n) (v : V) :
      (properLearner hd hn predict (fun i => z (i,s i)) (rep v)).toReal = p s v :=
    properLearner_mass hd hn predict (fun i => (z i).1) (fun i => (i,s i)) (fun i => (z (i,s i)).2) v
  let w : ℝ := (Fintype.card (Selector n) : ℝ)⁻¹
  have hw : w ≠ 0 := by unfold w; positivity
  have hR (s : Selector n) (v : V) : (J (em (s,v))).toReal = w * p s v := by
    change (originalPoolJoint (properLearner hd hn predict) z (s,rep v)).toReal = _
    rw [originalPoolJoint_apply, ENNReal.toReal_mul, fairSelectorLaw_apply, ENNReal.toReal_inv,
      ENNReal.toReal_natCast, hmass]
  have hQ (s : Selector n) (v : V) : (Q (em (s,v))).toReal = w * selectorMean (fun t => p t v) := by
    change (originalPoolMarginalProduct (properLearner hd hn predict) z (s,rep v)).toReal = _
    simp only [originalPoolMarginalProduct_apply, ENNReal.toReal_mul, fairSelectorLaw_apply, ENNReal.toReal_inv,
      ENNReal.toReal_natCast, originalPoolOutput_apply_real, hmass, w]
  have hlog (s : Selector n) (v : V) : f (em (s,v)) = w * (p s v * Real.log (p s v / selectorMean fun t => p t v)) := by
    unfold f
    rw [hR, hQ, mul_div_mul_left _ _ hw, mul_assoc]
  change channelInfo p = ∑' sh, f sh
  rw [tsum_eq_sum (s := Finset.univ.image em) hf, Finset.sum_image (fun _ _ _ _ h => he h),
    Fintype.sum_prod_type, channelInfo_eq_log_ratio p (fun s v => (outputChannel_isLaw hd hn predict z s).1 v)]
  simp only [hlog, ← Finset.mul_sum, selectorMean, div_eq_inv_mul, w]
  rfl

end AgnosticVC
