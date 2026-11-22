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

/-- Countable classes with measurable predictors satisfy the selection convention for
every prescribed measurable structure on the output class. -/
theorem hasMeasurableCanonicalRepresentatives_of_countable [Countable H]
    (predict : H → X → Bool) (hmeas : ∀ h, Measurable (predict h)) :
    HasMeasurableCanonicalRepresentatives predict := by
  classical
  refine ⟨hasMeasurableTraceSelection_of_countable predict hmeas, ?_⟩
  intro I _ v B hB
  have he : {x : I → X | ∃ hv : v ∈ sampleFamily predict x, canonicalRep predict x ⟨v, hv⟩ ∈ B} =
      ⋃ h : H, ({x : I → X | sampleTrace predict x h = v} ∩
        (⋂ g : H, {x : I → X | TraceOrder.rel g h → sampleTrace predict x g ≠ v}) ∩
        {_x : I → X | h ∈ B}) := by
    ext x
    simp only [Set.mem_ofPred_eq, Set.mem_iUnion, Set.mem_iInter, Set.mem_inter_iff]
    constructor
    · intro ⟨hv, hrep⟩
      let h := canonicalRep predict x ⟨v,hv⟩
      exact ⟨h, (canonicalRep_eq_iff predict x ⟨v,hv⟩ h).mp rfl, hrep⟩
    · rintro ⟨h, hh, hmem⟩
      have hv : v ∈ sampleFamily predict x := mem_sampleFamily.mpr ⟨h, hh.1⟩
      refine ⟨hv, ?_⟩
      rw [(canonicalRep_eq_iff predict x ⟨v,hv⟩ h).mpr hh]
      exact hmem
  rw [he]
  apply MeasurableSet.iUnion
  intro h
  apply MeasurableSet.inter _ (by by_cases hh : h ∈ B <;> simp [hh])
  apply MeasurableSet.inter (measurableSet_sampleTrace_eq predict h (hmeas h) v)
  apply MeasurableSet.iInter
  intro g
  by_cases hgt : TraceOrder.rel g h
  · rw [show {x : I → X | TraceOrder.rel g h → sampleTrace predict x g ≠ v} =
      ({x : I → X | sampleTrace predict x g = v})ᶜ by ext x; simp [hgt]]
    exact (measurableSet_sampleTrace_eq predict g (hmeas g) v).compl
  · simp [hgt]

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
