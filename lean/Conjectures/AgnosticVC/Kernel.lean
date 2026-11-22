module

public import Conjectures.AgnosticVC.VCMeasurability
public import Mathlib.Probability.Kernel.Basic

@[expose] public section

namespace AgnosticVC

open MeasureTheory ProbabilityTheory
open scoped BigOperators

variable {H X : Type*} [MeasurableSpace H] [MeasurableSpace X] [TraceOrder H]

/-- Measurability of the coherent trace coding and of the chosen actual hypothesis in
every measurable output event on each realized trace. -/
structure HasMeasurableCanonicalRepresentatives (predict : H → X → Bool) : Prop
    extends HasMeasurableTraceSelection predict where
  representative_event : ∀ (I : Type) [Fintype I] (v : Finset I) (B : Set H),
    MeasurableSet B → MeasurableSet {x : I → X | ∃ hv : v ∈ sampleFamily predict x,
      canonicalRep predict x ⟨v, hv⟩ ∈ B}

omit [MeasurableSpace H] in
private theorem measurableSet_canonicalRep_event_of_trace_core {Ω : Type*} [MeasurableSpace Ω]
    {I : Type} [Fintype I] (predict : H → X → Bool) (C : Set H) (hC : C.Countable)
    (hinit : ∀ ⦃a b : H⦄, a ∈ C → TraceOrder.rel b a → b ∈ C)
    (hmeas : ∀ h ∈ C, Measurable (predict h))
    (hrep : ∀ (x : I → X) (v : TraceSpace predict x), canonicalRep predict x v ∈ C)
    (x : Ω → I → X) (hx : Measurable x) (v : Finset I) (E : Ω → H → Prop)
    (hE : ∀ h ∈ C, MeasurableSet {w | E w h}) :
    MeasurableSet {w : Ω | ∃ hv : v ∈ sampleFamily predict (x w),
      E w (canonicalRep predict (x w) ⟨v, hv⟩)} := by
  classical
  have := hC.to_subtype
  have htrace (h : C) : MeasurableSet {w | sampleTrace predict (x w) h.val = v} :=
    hx (measurableSet_sampleTrace_eq predict h.val (hmeas h.val h.property) v)
  have he : {w : Ω | ∃ hv : v ∈ sampleFamily predict (x w),
      E w (canonicalRep predict (x w) ⟨v, hv⟩)} =
      ⋃ h : C, ({w | sampleTrace predict (x w) h.val = v} ∩
        (⋂ g : C, {w | TraceOrder.rel g.val h.val → sampleTrace predict (x w) g.val ≠ v}) ∩
        {w | E w h.val}) := by
    ext w
    simp only [Set.mem_ofPred_eq, Set.mem_iUnion, Set.mem_iInter, Set.mem_inter_iff]
    constructor
    · intro ⟨hv, hEw⟩
      let h : C := ⟨canonicalRep predict (x w) ⟨v, hv⟩, hrep (x w) ⟨v, hv⟩⟩
      obtain ⟨hr, hm⟩ := (canonicalRep_eq_iff predict (x w) ⟨v, hv⟩ h.val).mp rfl
      exact ⟨h, ⟨hr, fun g => hm g.val⟩, hEw⟩
    · rintro ⟨h, ⟨hr, hm⟩, hEw⟩
      have hv : v ∈ sampleFamily predict (x w) := mem_sampleFamily.mpr ⟨h.val, hr⟩
      have hmin (g : H) (hg : TraceOrder.rel g h.val) : sampleTrace predict (x w) g ≠ v :=
        hm ⟨g, hinit h.property hg⟩ hg
      refine ⟨hv, ?_⟩
      rw [(canonicalRep_eq_iff predict (x w) ⟨v, hv⟩ h.val).mpr ⟨hr, hmin⟩]
      exact hEw
  rw [he]
  apply MeasurableSet.iUnion
  intro h
  apply MeasurableSet.inter _ (hE h.val h.property)
  apply MeasurableSet.inter (htrace h)
  apply MeasurableSet.iInter
  intro g
  by_cases hgt : TraceOrder.rel g.val h.val
  · rw [show {w | TraceOrder.rel g.val h.val → sampleTrace predict (x w) g.val ≠ v} =
      ({w | sampleTrace predict (x w) g.val = v})ᶜ by ext w; simp [hgt]]
    exact (htrace g).compl
  · simp [hgt]

/-- A countable initial segment of the chosen well-order is sufficient for measurable trace
selection if its predictors are measurable and it realizes every finite trace of the class. -/
theorem hasMeasurableCanonicalRepresentatives_of_countable_trace_core
    (predict : H → X → Bool) (C : Set H) (hC : C.Countable)
    (hinit : ∀ ⦃a b : H⦄, a ∈ C → TraceOrder.rel b a → b ∈ C)
    (hmeas : ∀ h ∈ C, Measurable (predict h))
    (hcore : ∀ (I : Type) [Fintype I] (x : I → X) (h : H),
      ∃ g ∈ C, sampleTrace predict x g = sampleTrace predict x h) :
    HasMeasurableCanonicalRepresentatives predict := by
  classical
  have := hC.to_subtype
  have hrep (I : Type) [Fintype I] (x : I → X) (v : TraceSpace predict x) :
      canonicalRep predict x v ∈ C := by
    let h := canonicalRep predict x v
    obtain ⟨g, hg, he⟩ := hcore I x h
    have htrace : sampleTrace predict x g = v.val := he.trans (canonicalRep_trace predict x v)
    have hnot : ¬TraceOrder.rel g h := fun hlt =>
      (canonicalRep_eq_iff predict x v h).mp rfl |>.2 g hlt htrace
    by_cases hlt : TraceOrder.rel h g
    · exact hinit hg hlt
    · have heq : h = g := Std.Trichotomous.trichotomous (r := TraceOrder.rel (H := H)) h g hlt hnot
      change h ∈ C
      rw [heq]
      exact hg
  refine ⟨⟨?_, ?_⟩, ?_⟩
  · intro I _ v
    rw [show {x : I → X | v ∈ sampleFamily predict x} =
        ⋃ h : C, {x | sampleTrace predict x h.val = v} by
      ext x
      simp only [Set.mem_ofPred_eq, Set.mem_iUnion]
      constructor
      · intro hv
        exact ⟨⟨canonicalRep predict x ⟨v, hv⟩, hrep I x ⟨v, hv⟩⟩,
          canonicalRep_trace predict x ⟨v, hv⟩⟩
      · rintro ⟨h, hh⟩
        exact mem_sampleFamily.mpr ⟨h.val, hh⟩]
    exact MeasurableSet.iUnion fun h : C => measurableSet_sampleTrace_eq predict h.val (hmeas _ h.property) v
  · intro I K _ _ e v t
    have hx : Measurable (fun x : I → X => x ∘ e) :=
      Measurable.of_eval fun i => measurable_pi_apply (e i)
    exact measurableSet_canonicalRep_event_of_trace_core predict C hC hinit hmeas (hrep K)
      (fun x : I → X => x ∘ e) hx v (fun x h => sampleTrace predict x h = t)
      (fun h hh => measurableSet_sampleTrace_eq predict h (hmeas h hh) t)
  · intro I _ v B hB
    exact measurableSet_canonicalRep_event_of_trace_core predict C hC hinit hmeas (hrep I)
      id measurable_id v (fun _ h => h ∈ B) (fun h hh => by by_cases hn : h ∈ B <;> simp [hn])

/-- Countable classes with measurable predictors satisfy the selection convention for
every prescribed measurable structure on the output class. -/
theorem hasMeasurableCanonicalRepresentatives_of_countable [Countable H]
    (predict : H → X → Bool) (hmeas : ∀ h, Measurable (predict h)) :
    HasMeasurableCanonicalRepresentatives predict :=
  hasMeasurableCanonicalRepresentatives_of_countable_trace_core predict Set.univ Set.countable_univ
    (by intros; exact Set.mem_univ _) (fun h _ => hmeas h) (fun _ _ _ h => ⟨h, Set.mem_univ h, rfl⟩)

/-- On a countable instance domain with measurable singletons, the space of feature tuples
of each finite length is countable and has measurable singletons. Thus any chosen trace order
supplies measurable canonical representatives for any hypothesis class. -/
theorem hasMeasurableCanonicalRepresentatives_of_countable_domain
    [Countable X] [MeasurableSingletonClass X] (predict : H → X → Bool) :
    HasMeasurableCanonicalRepresentatives predict := by
  refine ⟨⟨?_, ?_⟩, ?_⟩
  · intro I _ v
    exact (Set.to_countable _).measurableSet
  · intro I K _ _ e v t
    exact (Set.to_countable _).measurableSet
  · intro I _ v B hB
    exact (Set.to_countable _).measurableSet

private noncomputable def traceEventMass {n d : ℕ} (predict : H → X → Bool)
    (B : Set H) (v : Finset (Fin n)) (z : Fin n → X × Bool) : ENNReal := by
  classical
  let x := fun i => (z i).1
  let y := fun i => (z i).2
  exact if ∃ hv : v ∈ sampleFamily predict x, canonicalRep predict x ⟨v, hv⟩ ∈ B
    then ENNReal.ofReal (familyMass (schedule n d) (sampleFamily predict x) y v) else 0

private lemma measurable_traceEventMass {n d : ℕ} (predict : H → X → Bool)
    (hsel : HasMeasurableCanonicalRepresentatives predict) (B : Set H) (hB : MeasurableSet B)
    (v : Finset (Fin n)) : Measurable (traceEventMass (d := d) predict B v) := by
  classical
  let x (z : Fin n → X × Bool) := fun i => (z i).1
  let y (z : Fin n → X × Bool) := fun i => (z i).2
  let c (z : Fin n → X × Bool) := (sampleFamily predict (x z), y z)
  have mx : Measurable x := Measurable.of_eval fun i => measurable_fst.comp (measurable_pi_apply i)
  have my : Measurable y := Measurable.of_eval fun i => measurable_snd.comp (measurable_pi_apply i)
  have hcode (a : Finset (Finset (Fin n)) × (Fin n → Bool)) :
      MeasurableSet {z : Fin n → X × Bool | c z = a} := by
    rcases a with ⟨F,l⟩
    exact measurableSet_fiber_prod
      (mx (measurableSet_sampleFamily_eq hsel.toHasMeasurableTraceSelection F))
      (my (measurableSet_singleton l))
  have hmass : Measurable (fun z : Fin n → X × Bool => familyMass (schedule n d) (c z).1 (c z).2 v) :=
    measurable_of_finite_code c hcode _ (fun h =>
      congrArg (fun a => familyMass (schedule n d) a.1 a.2 v) h)
  have hre := mx (hsel.representative_event (Fin n) v B hB)
  unfold traceEventMass
  exact Measurable.ite hre (ENNReal.measurable_ofReal.comp hmass) measurable_const

omit [MeasurableSpace X] in
private lemma properLearner_toMeasure_eq_traceEventMass [Nonempty H] {n d : ℕ}
    (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool) (B : Set H) (hB : MeasurableSet B)
    (z : Fin n → X × Bool) :
    (properLearner hd hn predict z).toMeasure B = ∑ v, traceEventMass (d := d) predict B v z := by
  classical
  let x := fun i => (z i).1
  let y := fun i => (z i).2
  let F := sampleFamily predict x
  let f := fun v : Finset (Fin n) => traceEventMass (d := d) predict B v z
  have hZ (v : Finset (Fin n)) (hv : v ∉ F) : f v = 0 := by
    change v ∉ sampleFamily predict x at hv
    simp [f, traceEventMass, x, hv]
  have hm (u : ↥F) : f u.val = if canonicalRep predict x u ∈ B then
      ENNReal.ofReal (learnedTraceMass (schedule n d) predict x y u) else 0 := by
    change (if ∃ hv : u.val ∈ sampleFamily predict x, canonicalRep predict x ⟨u.val, hv⟩ ∈ B
      then ENNReal.ofReal (familyMass (schedule n d) (sampleFamily predict x) y u.val) else 0) = _
    have hmass := familyMass_eq (schedule n d) predict x y (show TraceSpace predict x from u)
    simp [hmass]
  unfold properLearner
  rw [PMF.toMeasure_apply_eq_toOuterMeasure_apply _ hB, PMF.toOuterMeasure_map_apply,
    PMF.toOuterMeasure_apply, tsum_fintype]
  simp only [Set.indicator_apply, Set.mem_preimage, PMF.ofFintype_apply]
  change (∑ u : ↥F, if canonicalRep predict x u ∈ B then
      ENNReal.ofReal (learnedTraceMass (schedule n d) predict x y u) else 0) = ∑ v, f v
  calc
    _ = ∑ u : ↥F, f u.val := Finset.sum_congr rfl fun u _ => (hm u).symm
    _ = ∑ v ∈ F, f v := Finset.sum_coe_sort F f
    _ = _ := Finset.sum_subset (Finset.subset_univ F) fun v _ hv => hZ v hv

/-- The probability law on actual returned hypotheses is a measurable measure-valued map. -/
theorem measurable_properLearner_toMeasure [Nonempty H] {n d : ℕ} (hd : 0 < d) (hn : d ≤ n)
    (predict : H → X → Bool) (hsel : HasMeasurableCanonicalRepresentatives predict) :
    Measurable (fun z : Fin n → X × Bool => (properLearner hd hn predict z).toMeasure) := by
  classical
  apply Measure.measurable_of_measurable_coe
  intro B hB
  simp_rw [properLearner_toMeasure_eq_traceEventMass hd hn predict B hB]
  exact Finset.measurable_sum _ fun v _ => measurable_traceEventMass predict hsel B hB v

/-- The learner viewed as a Markov kernel with actual hypotheses as its output space. -/
noncomputable def properLearnerKernel [Nonempty H] {n d : ℕ} (hd : 0 < d) (hn : d ≤ n)
    (predict : H → X → Bool) (hsel : HasMeasurableCanonicalRepresentatives predict) :
    Kernel (Fin n → X × Bool) H where
  toFun z := (properLearner hd hn predict z).toMeasure
  measurable' := measurable_properLearner_toMeasure hd hn predict hsel

instance [Nonempty H] {n d : ℕ} (hd : 0 < d) (hn : d ≤ n)
    (predict : H → X → Bool) (hsel : HasMeasurableCanonicalRepresentatives predict) :
    IsMarkovKernel (properLearnerKernel hd hn predict hsel) where
  isProbabilityMeasure z := inferInstanceAs (IsProbabilityMeasure (properLearner hd hn predict z).toMeasure)

end AgnosticVC
