module

public import Conjectures.AgnosticVC.DeletionChannel

@[expose] public section

namespace AgnosticVC

open Finset MeasureTheory
open scoped BigOperators

variable {H X : Type*} [MeasurableSpace X]

/-- The events that determine the finite coding of a learner whose representatives come
from a global well-order. The second field measures the predictions of the chosen
representative on the whole tuple, conditional on its realizing the indicated subtuple trace. -/
structure HasMeasurableTraceSelection (predict : H → X → Bool) : Prop where
  realizes : ∀ (I : Type) [Fintype I] (v : Finset I),
    MeasurableSet {x : I → X | v ∈ sampleFamily predict x}
  extension : ∀ (I K : Type) [Fintype I] [Fintype K] (e : K → I) (v : Finset K) (t : Finset I),
    MeasurableSet {x : I → X | ∃ hv : v ∈ sampleFamily predict (x ∘ e),
      (extendTrace predict x e ⟨v, hv⟩).val = t}

lemma measurableSet_sampleTrace_eq {I : Type} [Fintype I] (predict : H → X → Bool)
    (h : H) (hm : Measurable (predict h)) (v : Finset I) :
    MeasurableSet {x : I → X | sampleTrace predict x h = v} := by
  classical
  have he : {x : I → X | sampleTrace predict x h = v} =
      ⋂ i : I, {x : I → X | predict h (x i) = decide (i ∈ v)} := by
    ext x
    simp only [Set.mem_ofPred_eq, Set.mem_iInter]
    constructor
    · intro hv i
      have hi : predict h (x i) = true ↔ i ∈ v := by rw [← mem_sampleTrace, hv]
      by_cases hn : i ∈ v
      · simp [hn, hi.mpr hn]
      · cases hp : predict h (x i) with
        | false => simp [hn]
        | true => exact (hn (hi.mp hp)).elim
    · intro heq
      ext i
      simp [heq i]
  rw [he]
  exact MeasurableSet.iInter fun i => (hm.comp (measurable_pi_apply i)) (measurableSet_singleton _)

omit [MeasurableSpace X] in
lemma canonicalRep_eq_iff {I : Type} [Fintype I] (predict : H → X → Bool) (x : I → X)
    (v : TraceSpace predict x) (g : H) :
    canonicalRep predict x v = g ↔ sampleTrace predict x g = v.val ∧
      ∀ h, WellOrderingRel h g → sampleTrace predict x h ≠ v.val := by
  constructor
  · rintro rfl
    refine ⟨canonicalRep_trace predict x v, fun h hlt htrace => ?_⟩
    exact (WellOrderingRel.isWellOrder (α := H)).wf.not_lt_min
      {t | sampleTrace predict x t = v.val} htrace hlt
  · rintro ⟨htrace, hmin⟩
    exact (WellOrderingRel.isWellOrder (α := H)).wf.min_eq_of_forall_not_lt
      (s := {t | sampleTrace predict x t = v.val}) htrace (fun t ht hlt => hmin t hlt ht)

/-- For a countable class, the fixed well-order gives measurable finite trace coding as
soon as every prediction function is measurable. -/
theorem hasMeasurableTraceSelection_of_countable [Countable H] (predict : H → X → Bool)
    (hmeas : ∀ h, Measurable (predict h)) : HasMeasurableTraceSelection predict := by
  classical
  constructor
  · intro I _ v
    rw [show {x : I → X | v ∈ sampleFamily predict x} =
      ⋃ h : H, {x : I → X | sampleTrace predict x h = v} by
        ext x; simp [mem_sampleFamily]]
    exact MeasurableSet.iUnion fun h => measurableSet_sampleTrace_eq predict h (hmeas h) v
  · intro I K _ _ e v t
    have hsmall (h : H) : MeasurableSet {x : I → X | sampleTrace predict (x ∘ e) h = v} := by
      have hm : Measurable (fun x : I → X => x ∘ e) :=
        Measurable.of_eval fun i => measurable_pi_apply (e i)
      exact hm (measurableSet_sampleTrace_eq predict h (hmeas h) v)
    have he : {x : I → X | ∃ hv : v ∈ sampleFamily predict (x ∘ e),
        (extendTrace predict x e ⟨v, hv⟩).val = t} =
      ⋃ h : H, ({x : I → X | sampleTrace predict (x ∘ e) h = v} ∩
        (⋂ g : H, {x : I → X | WellOrderingRel g h → sampleTrace predict (x ∘ e) g ≠ v}) ∩
        {x : I → X | sampleTrace predict x h = t}) := by
      ext x
      simp only [Set.mem_ofPred_eq, Set.mem_iUnion, Set.mem_iInter, Set.mem_inter_iff]
      constructor
      · intro ⟨hv, ht⟩
        let h := canonicalRep predict (x ∘ e) ⟨v,hv⟩
        have hm := (canonicalRep_eq_iff predict (x ∘ e) ⟨v,hv⟩ h).mp rfl
        exact ⟨h, ⟨hm.1, hm.2⟩, ht⟩
      · rintro ⟨h, ⟨hv, hmin⟩, ht⟩
        let hm : v ∈ sampleFamily predict (x ∘ e) := mem_sampleFamily.mpr ⟨h, hv⟩
        refine ⟨hm, ?_⟩
        change sampleTrace predict x (canonicalRep predict (x ∘ e) ⟨v, hm⟩) = t
        rw [(canonicalRep_eq_iff predict (x ∘ e) ⟨v,hm⟩ h).mpr ⟨hv,hmin⟩]
        exact ht
    rw [he]
    apply MeasurableSet.iUnion
    intro h
    apply MeasurableSet.inter _ (measurableSet_sampleTrace_eq predict h (hmeas h) t)
    apply MeasurableSet.inter (hsmall h)
    apply MeasurableSet.iInter
    intro g
    by_cases hgt : WellOrderingRel g h
    · rw [show {x : I → X | WellOrderingRel g h → sampleTrace predict (x ∘ e) g ≠ v} =
        ({x : I → X | sampleTrace predict (x ∘ e) g = v})ᶜ by ext x; simp [hgt]]
      exact (hsmall g).compl
    · simp [hgt]

lemma measurableSet_sampleFamily_eq {I : Type} [Fintype I]
    {predict : H → X → Bool} (hsel : HasMeasurableTraceSelection predict) (F : Finset (Finset I)) :
    MeasurableSet {x : I → X | sampleFamily predict x = F} := by
  classical
  rw [show {x : I → X | sampleFamily predict x = F} =
    ⋂ v : Finset I, {x : I → X | v ∈ sampleFamily predict x ↔ v ∈ F} by
      ext x; simp only [Set.mem_ofPred_eq, Set.mem_iInter, Finset.ext_iff]]
  apply MeasurableSet.iInter
  intro v
  by_cases hv : v ∈ F
  · simpa only [hv, iff_true] using hsel.realizes I v
  · rw [show {x : I → X | v ∈ sampleFamily predict x ↔ v ∈ F} =
      ({x : I → X | v ∈ sampleFamily predict x})ᶜ by ext x; simp [hv]]
    exact (hsel.realizes I v).compl

lemma measurable_of_finite_code {Ω C : Type*} [MeasurableSpace Ω] [Finite C]
    (c : Ω → C) (hm : ∀ a : C, MeasurableSet {x : Ω | c x = a})
    (f : Ω → ℝ) (hf : ∀ {x y}, c x = c y → f x = f y) : Measurable f := by
  classical
  let g (a : C) := if h : ∃ x, c x = a then f h.choose else 0
  have hg (x : Ω) : g (c x) = f x := by
    have h : ∃ y : Ω, c y = c x := ⟨x, rfl⟩
    simp only [g, dite_eq_left h]
    exact hf h.choose_spec
  intro s hs
  rw [show f ⁻¹' s = ⋃ a : C, {x : Ω | c x = a ∧ g a ∈ s} by
    ext x
    simp only [Set.mem_preimage, Set.mem_iUnion, Set.mem_ofPred_eq]
    constructor
    · intro hx; exact ⟨c x, rfl, (hg x).symm ▸ hx⟩
    · rintro ⟨a, rfl, ha⟩; simpa only [hg] using ha]
  refine MeasurableSet.iUnion fun a => ?_
  by_cases h : g a ∈ s
  · simpa only [h, and_true] using hm a
  · simp [h]

private lemma integrable_of_finite_code {Ω C : Type*} [MeasurableSpace Ω] [Fintype C]
    (μ : Measure Ω) [IsFiniteMeasure μ] (c : Ω → C)
    (hm : ∀ a : C, MeasurableSet {x : Ω | c x = a}) (f : Ω → ℝ)
    (hf : ∀ {x y}, c x = c y → f x = f y) : Integrable f μ := by
  classical
  let g (a : C) := if h : ∃ x, c x = a then f h.choose else 0
  have hg (x : Ω) : g (c x) = f x := by
    have h : ∃ y : Ω, c y = c x := ⟨x, rfl⟩
    simp only [g, dite_eq_left h]
    exact hf h.choose_spec
  apply Integrable.of_bound (measurable_of_finite_code c hm f hf).aestronglyMeasurable
    (∑ a : C, |g a|)
  filter_upwards with x
  rw [Real.norm_eq_abs, ← hg]
  exact Finset.single_le_sum (fun a _ => abs_nonneg (g a)) (Finset.mem_univ (c x))

lemma measurableSet_fiber_prod {Ω A B : Type*} [MeasurableSpace Ω]
    {f : Ω → A} {g : Ω → B} {a : A} {b : B}
    (hf : MeasurableSet {x | f x = a}) (hg : MeasurableSet {x | g x = b}) :
    MeasurableSet {x | (f x, g x) = (a, b)} := by
  convert hf.inter hg using 1
  ext x
  simp

private lemma measurableSet_fiber_pi {Ω A J : Type*} [MeasurableSpace Ω] [Countable J]
    {f : Ω → J → A} {a : J → A} (h : ∀ j, MeasurableSet {x | f x j = a j}) :
    MeasurableSet {x | f x = a} := by
  convert MeasurableSet.iInter h using 1
  ext x
  simp only [Set.mem_ofPred_eq, Set.mem_iInter, funext_iff]

private abbrev SubsampleCode (I K : Type) :=
  Finset (Finset I) × Finset (Finset K) × (Finset K → Finset I → Bool) × (I → Bool)

private noncomputable def subsampleCode {I K : Type} [Fintype I] [Fintype K]
    (predict : H → X → Bool) (e : K → I) (z : I → X × Bool) : SubsampleCode I K := by
  classical
  let x := fun j => (z j).1
  exact (sampleFamily predict x, sampleFamily predict (x ∘ e),
    fun v t => decide (∃ hv : v ∈ sampleFamily predict (x ∘ e),
      (extendTrace predict x e ⟨v, hv⟩).val = t), fun j => (z j).2)

private lemma measurableSet_subsampleCode {I K : Type} [Fintype I] [Fintype K]
    {predict : H → X → Bool} (hsel : HasMeasurableTraceSelection predict) (e : K → I)
    (c : SubsampleCode I K) : MeasurableSet {z : I → X × Bool | subsampleCode predict e z = c} := by
  classical
  rcases c with ⟨F, G, R, y⟩
  have hx : Measurable (fun z : I → X × Bool => fun j => (z j).1) :=
    Measurable.of_eval fun i => measurable_fst.comp (measurable_pi_apply i)
  have hxe : Measurable (fun z : I → X × Bool => (fun j => (z j).1) ∘ e) :=
    Measurable.of_eval fun j => measurable_fst.comp (measurable_pi_apply (e j))
  have hF := hx (measurableSet_sampleFamily_eq hsel F)
  have hG := hxe (measurableSet_sampleFamily_eq hsel G)
  have hR (v : Finset K) (t : Finset I) :
      MeasurableSet {z : I → X × Bool | (subsampleCode predict e z).2.2.1 v t = R v t} := by
    let P (z : I → X × Bool) := ∃ hv : v ∈ sampleFamily predict ((fun j => (z j).1) ∘ e),
      (extendTrace predict (fun j => (z j).1) e ⟨v, hv⟩).val = t
    have h : MeasurableSet {z | P z} := hx (hsel.extension I K e v t)
    change MeasurableSet {z | decide (P z) = R v t}
    cases hr : R v t with
    | false =>
      rw [show {z | decide (P z) = false} = ({z | P z})ᶜ by ext z; simp]
      exact h.compl
    | true =>
      simpa using h
  have hy (i : I) : MeasurableSet {z : I → X × Bool | (z i).2 = y i} :=
    (measurable_snd.comp (measurable_pi_apply i)) (measurableSet_singleton _)
  exact measurableSet_fiber_prod hF (measurableSet_fiber_prod hG
    (measurableSet_fiber_prod (measurableSet_fiber_pi fun v => measurableSet_fiber_pi (hR v))
      (measurableSet_fiber_pi hy)))

noncomputable def familyMass {I : Type} [Fintype I] [DecidableEq I]
    (σ : Schedule) (F : Finset (Finset I)) (y : I → Bool) (v : Finset I) : ℝ :=
  if hv : v ∈ F then
    letI : Nonempty ↥F := ⟨⟨v, hv⟩⟩
    ∫ u, optimizer (fun t : ↥F => mistakeCount y (weightDraw u) t.val) σ.temperature
      (restrictionCoeff σ) (fun k t =>
        (⟨k.2.val ∩ t.val, Finset.mem_image_of_mem _ t.property⟩ :
          ↥(traceRestriction F k.2.val))) ⟨v, hv⟩ ∂weightMeasure I
  else 0

omit [MeasurableSpace X] in
lemma familyMass_eq {I : Type} [Fintype I] [DecidableEq I] [Nonempty H]
    (σ : Schedule) (predict : H → X → Bool) (x : I → X) (y : I → Bool) (v : TraceSpace predict x) :
    familyMass σ (sampleFamily predict x) y v.val = learnedTraceMass σ predict x y v := by
  rw [familyMass, dite_eq_left v.property]
  rfl

private noncomputable def marginalFromCode {I K : Type} [Fintype K] [DecidableEq K]
    (σ : Schedule) (e : K → I) (c : SubsampleCode I K) (t : Finset I) : ℝ :=
  ∑ v : Finset K, if c.2.2.1 v t then familyMass σ c.2.1 (c.2.2.2 ∘ e) v else 0

omit [MeasurableSpace X] in
private lemma marginalFromCode_eq {I K : Type} [Fintype I] [Fintype K] [DecidableEq K] [Nonempty H]
    (σ : Schedule) (predict : H → X → Bool) (z : I → X × Bool) (e : K → I)
    (t : TraceSpace predict (fun j => (z j).1)) :
    marginalFromCode σ e (subsampleCode predict e z) t.val =
      marginal (extendTrace predict (fun j => (z j).1) e)
        (learnedTraceMass σ predict ((fun j => (z j).1) ∘ e) ((fun j => (z j).2) ∘ e)) t := by
  classical
  let x := fun j => (z j).1
  let y := fun j => (z j).2
  let F := sampleFamily predict (x ∘ e)
  let f := fun v : Finset K => if ∃ hv : v ∈ F, (extendTrace predict x e ⟨v, hv⟩).val = t.val
    then familyMass σ F (y ∘ e) v else 0
  have hm (v : ↥F) : f v.val = if extendTrace predict x e v = t
      then learnedTraceMass σ predict (x ∘ e) (y ∘ e) v else 0 := by
    have he : (∃ hv : v.val ∈ F, (extendTrace predict x e ⟨v.val, hv⟩).val = t.val) ↔
        extendTrace predict x e v = t := by
      constructor
      · rintro ⟨hv, heq⟩
        exact Subtype.ext heq
      · intro heq
        exact ⟨v.property, congrArg Subtype.val heq⟩
    have hmass : familyMass σ F (y ∘ e) v.val = learnedTraceMass σ predict (x ∘ e) (y ∘ e) v :=
      familyMass_eq σ predict (x ∘ e) (y ∘ e) v
    simp only [f, he, hmass]
  unfold marginalFromCode subsampleCode
  simp only [decide_eq_true_eq]
  change (∑ v : Finset K, f v) = _
  calc
    _ = ∑ v ∈ F, f v := by
      symm
      apply Finset.sum_subset (Finset.subset_univ F)
      intro v _ hv
      simp [f, hv]
    _ = ∑ v : ↥F, f v.val := (Finset.sum_coe_sort F f).symm
    _ = _ := by
      unfold marginal
      rw [Finset.sum_filter]
      apply Finset.sum_congr rfl
      intro v hv
      by_cases h : extendTrace predict x e v = t <;> simpa [h, x, y] using hm v

private noncomputable def informationFromCode {n : ℕ} (σ : Schedule)
    (c : (Fin n → Bool) → SubsampleCode (Fin n × Bool) (Fin n)) : ℝ :=
  SteinkeZakynthinou.channelInfo (fun s (v : ↥(c (fun _ => false)).1) =>
    marginalFromCode σ (fun i => (i, s i)) (c s) v.val)

omit [MeasurableSpace X] in
private lemma informationFromCode_eq [Nonempty H] {n d : ℕ} (hd : 0 < d) (hn : d ≤ n)
    (predict : H → X → Bool) (z : Pool n X) :
    informationFromCode (schedule n d) (fun s => subsampleCode predict (fun i => (i, s i)) z) =
      poolInformation hd hn predict z := by
  unfold informationFromCode poolInformation
  congr 1
  funext s v
  exact marginalFromCode_eq _ predict z _ v

omit [MeasurableSpace X] in
/-- For fixed sample size and learner parameters, the pool information takes finitely many
values, even for an arbitrary hypothesis class. -/
theorem poolInformation_finite_range [Nonempty H] {n d : ℕ} (hd : 0 < d) (hn : d ≤ n)
    (predict : H → X → Bool) : (Set.range (poolInformation hd hn predict)).Finite := by
  classical
  refine (Set.finite_range (informationFromCode (n := n) (schedule n d))).subset ?_
  rintro a ⟨z, rfl⟩
  exact ⟨fun s => subsampleCode predict (fun i => (i, s i)) z,
    informationFromCode_eq hd hn predict z⟩

/-- The finite conditional mutual information is measurable under the trace selection convention. -/
theorem measurable_poolInformation [Nonempty H] {n d : ℕ} (hd : 0 < d) (hn : d ≤ n)
    (predict : H → X → Bool) (hsel : HasMeasurableTraceSelection predict) :
    Measurable (poolInformation hd hn predict) := by
  classical
  let c (z : Pool n X) (s : Fin n → Bool) := subsampleCode predict (fun i => (i, s i)) z
  refine measurable_of_finite_code c (fun a => measurableSet_fiber_pi fun s =>
    measurableSet_subsampleCode hsel (fun i => (i, s i)) (a s)) _ ?_
  intro z z' h
  rw [← informationFromCode_eq hd hn predict z, ← informationFromCode_eq hd hn predict z']
  exact congrArg (informationFromCode (schedule n d)) h

/-- The pool statistic is integrable for any finite measure on the supersamples. -/
theorem integrable_poolInformation [Nonempty H] {n d : ℕ} (hd : 0 < d) (hn : d ≤ n)
    (predict : H → X → Bool) (hsel : HasMeasurableTraceSelection predict)
    (μ : Measure (Pool n X)) [IsFiniteMeasure μ] : Integrable (poolInformation hd hn predict) μ := by
  classical
  let c (z : Pool n X) (s : Fin n → Bool) := subsampleCode predict (fun i => (i, s i)) z
  refine integrable_of_finite_code μ c (fun a => measurableSet_fiber_pi fun s =>
    measurableSet_subsampleCode hsel (fun i => (i, s i)) (a s)) _ ?_
  intro z z' h
  rw [← informationFromCode_eq hd hn predict z, ← informationFromCode_eq hd hn predict z']
  exact congrArg (informationFromCode (schedule n d)) h

private noncomputable def deletionChargeFromCode {n : ℕ} (σ : Schedule)
    (i : Fin (n + 1)) (c : SubsampleCode (Fin (n + 1)) (Fin n)) : ℝ :=
  hellingerSq (fun v : ↥c.1 => marginalFromCode σ i.succAbove c v.val)
    (fun v : ↥c.1 => familyMass σ c.1 c.2.2.2 v.val)

omit [MeasurableSpace X] in
private lemma deletionChargeFromCode_eq [Nonempty H] {n : ℕ} (σ : Schedule) (predict : H → X → Bool)
    (T : Fin (n + 1) → X × Bool) (i : Fin (n + 1)) :
    deletionChargeFromCode σ i (subsampleCode predict i.succAbove T) = blockDeletionCharge σ predict T i := by
  unfold deletionChargeFromCode blockDeletionCharge
  congr 1
  · funext v
    exact marginalFromCode_eq σ predict T i.succAbove v
  · funext v
    exact familyMass_eq σ predict (fun j => (T j).1) (fun j => (T j).2) v

/-- A single-coordinate deletion charge is measurable as a statistic of the full labeled block. -/
theorem measurable_blockDeletionCharge [Nonempty H] {n : ℕ} (σ : Schedule) (predict : H → X → Bool)
    (hsel : HasMeasurableTraceSelection predict) (i : Fin (n + 1)) :
    Measurable (fun T : Fin (n + 1) → X × Bool => blockDeletionCharge σ predict T i) := by
  classical
  refine measurable_of_finite_code (subsampleCode predict i.succAbove)
    (measurableSet_subsampleCode hsel i.succAbove) _ ?_
  intro T T' h
  rw [← deletionChargeFromCode_eq σ predict T i, ← deletionChargeFromCode_eq σ predict T' i]
  exact congrArg (deletionChargeFromCode σ i) h

/-- A single-coordinate deletion charge is integrable for any finite measure on its input block. -/
theorem integrable_blockDeletionCharge [Nonempty H] {n : ℕ} (σ : Schedule) (predict : H → X → Bool)
    (hsel : HasMeasurableTraceSelection predict) (i : Fin (n + 1))
    (μ : Measure (Fin (n + 1) → X × Bool)) [IsFiniteMeasure μ] :
    Integrable (fun T => blockDeletionCharge σ predict T i) μ := by
  classical
  refine integrable_of_finite_code μ (subsampleCode predict i.succAbove)
    (measurableSet_subsampleCode hsel i.succAbove) _ ?_
  intro T T' h
  rw [← deletionChargeFromCode_eq σ predict T i, ← deletionChargeFromCode_eq σ predict T' i]
  exact congrArg (deletionChargeFromCode σ i) h

end AgnosticVC
