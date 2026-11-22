module

public import Conjectures.AgnosticVC.Kernel
public import Conjectures.AgnosticVC.KLRates

/-! Measurability of the well-order-tied ERM of Steinke and Zakynthinou,
Lemma 4.15, implies measurability of canonical representatives. -/

@[expose] public section

namespace AgnosticVC

open MeasureTheory

variable {H X : Type*}

/-- Number of misclassified observations, including multiplicities. -/
def ermMistakes (predict : H → X → Bool) {n : ℕ} (z : Fin n → X × Bool) (h : H) : ℕ :=
  (Finset.univ.filter (fun i => predict h (z i).1 ≠ (z i).2)).card

/-- The deterministic, globally tie-broken ERM used in the source proof, with a
measurable hypothesis-valued output at every sample size. -/
structure MeasurableOrderedERM [MeasurableSpace X] [MeasurableSpace H] [TraceOrder H]
    (predict : H → X → Bool) where
  learn : (n : ℕ) → (Fin n → X × Bool) → H
  measurable_learn : ∀ n, Measurable (learn n)
  minimizes : ∀ n z h, ermMistakes predict z (learn n z) ≤ ermMistakes predict z h
  breaks_ties : ∀ n z h, TraceOrder.rel h (learn n z) →
    ermMistakes predict z (learn n z) < ermMistakes predict z h

/-- At a fixed labeling, an exact fit on any finite index type is equivalent
to zero mistakes on the corresponding ordered sample. -/
private theorem ermMistakes_eq_zero_iff {I : Type} [Fintype I] [DecidableEq I]
    (e : Fin (Fintype.card I) ≃ I) (predict : H → X → Bool)
    (x : I → X) (v : Finset I) (h : H) :
    ermMistakes predict (fun i => (x (e i), decide (e i ∈ v))) h = 0 ↔
      sampleTrace predict x h = v := by
  classical
  have hz : ermMistakes predict (fun i => (x (e i), decide (e i ∈ v))) h = 0 ↔
      ∀ j : I, predict h (x j) = decide (j ∈ v) := by
    simp only [ermMistakes, Finset.card_eq_zero, Finset.filter_eq_empty_iff,
      Finset.mem_univ, true_implies, not_not]
    constructor
    · intro hall j
      obtain ⟨i, rfl⟩ := e.surjective j
      exact @hall i
    · exact fun hall i => hall (e i)
  rw [hz]
  constructor
  · intro hfit
    ext j
    simp [hfit j]
  · intro hfit j
    have hj : predict h (x j) = true ↔ j ∈ v := by rw [← mem_sampleTrace, hfit]
    cases hp : predict h (x j) <;> simpa [hp] using hj

/-- A measurable ERM that chooses the first minimizer in the same global
well-order at every size supplies all three selection events. Jointly measurable
evaluation is used to test the output's predictions on other observations. -/
theorem hasMeasurableCanonicalRepresentatives_of_orderedERM
    [MeasurableSpace X] [MeasurableSpace H] [TraceOrder H] (predict : H → X → Bool)
    (heval : Measurable (fun p : H × X => predict p.1 p.2))
    (erm : MeasurableOrderedERM predict) :
    HasMeasurableCanonicalRepresentatives predict := by
  classical
  let readout (I : Type) [Fintype I] (v : Finset I) (x : I → X) :=
    erm.learn (Fintype.card I) (fun i => (x ((Fintype.equivFin I).symm i),
      decide ((Fintype.equivFin I).symm i ∈ v)))
  have mread (I : Type) [Fintype I] (v : Finset I) : Measurable (readout I v) :=
    (erm.measurable_learn _).comp (Measurable.of_eval fun _ => (measurable_pi_apply _).prodMk measurable_const)
  have first (I : Type) [Fintype I] (v : Finset I) (x : I → X) (hv : v ∈ sampleFamily predict x) :
      canonicalRep predict x ⟨v,hv⟩ = readout I v x := by
    let e := (Fintype.equivFin I).symm
    let z := fun i => (x (e i), decide (e i ∈ v))
    obtain ⟨h, hh⟩ := mem_sampleFamily.mp hv
    have hz : ermMistakes predict z (erm.learn _ z) = 0 :=
      Nat.eq_zero_of_le_zero ((erm.minimizes _ z h).trans_eq ((ermMistakes_eq_zero_iff e predict x v h).mpr hh))
    apply (canonicalRep_eq_iff predict x ⟨v,hv⟩ _).mpr
    refine ⟨(ermMistakes_eq_zero_iff e predict x v _).mp hz, ?_⟩
    intro g hlt hg
    have hpos := erm.breaks_ties _ z g hlt
    rw [hz, (ermMistakes_eq_zero_iff e predict x v g).mpr hg] at hpos
    exact (lt_irrefl _ hpos)
  have trace_event {I : Type} [Fintype I] (h : (I → X) → H) (mh : Measurable h) (v : Finset I) :
      MeasurableSet {w | sampleTrace predict w (h w) = v} := by
    have he {w : I → X} : sampleTrace predict w (h w) = v ↔
        ∀ i, (predict (h w) (w i) = true ↔ i ∈ v) := by
      simp only [Finset.ext_iff, mem_sampleTrace]
    simp_rw [he]
    rw [show {w : I → X | ∀ i, (predict (h w) (w i) = true ↔ i ∈ v)} =
        ⋂ i, {w | predict (h w) (w i) = true ↔ i ∈ v} by ext; simp]
    apply MeasurableSet.iInter
    intro i
    have m : MeasurableSet {w : I → X | predict (h w) (w i) = true} :=
      (heval.comp (mh.prodMk (measurable_pi_apply i))) (measurableSet_singleton true)
    by_cases hi : i ∈ v
    · simpa only [hi, iff_true] using m
    · simp only [hi, iff_false]
      exact m.compl
  have realises (I : Type) [Fintype I] (v : Finset I) :
      MeasurableSet {x : I → X | v ∈ sampleFamily predict x} := by
    convert trace_event (readout I v) (mread I v) v using 1
    ext x
    constructor
    · intro hv
      change sampleTrace predict x (readout I v x) = v
      rw [← first I v x hv]
      exact canonicalRep_trace predict x ⟨v,hv⟩
    · exact fun hx => mem_sampleFamily.mpr ⟨_, hx⟩
  refine ⟨⟨realises, ?_⟩, ?_⟩
  · intro I K _ _ e v t
    let sub := fun x : I → X => x ∘ e
    have ms : Measurable sub := Measurable.of_eval fun i => measurable_pi_apply (e i)
    convert (ms (realises K v)).inter
      (trace_event (fun x => readout K v (sub x)) ((mread K v).comp ms) t) using 1
    ext x
    constructor
    · rintro ⟨hv,he⟩
      refine ⟨hv, ?_⟩
      change sampleTrace predict x (readout K v (sub x)) = t
      rw [← first K v (sub x) hv]
      exact he
    · rintro ⟨hv,he⟩
      refine ⟨hv, ?_⟩
      change sampleTrace predict x (canonicalRep predict (sub x) ⟨v,hv⟩) = t
      rw [first K v (sub x) hv]
      exact he
  · intro I _ v B hB
    convert (realises I v).inter (mread I v hB) using 1
    ext x
    constructor
    · rintro ⟨hv,hmem⟩
      refine ⟨hv, ?_⟩
      change readout I v x ∈ B
      rwa [← first I v x hv]
    · rintro ⟨hv,hmem⟩
      exact ⟨hv, by rwa [first I v x hv]⟩

/-- With measurable joint evaluation and the measurable ordered ERM, the new
randomized proper learner satisfies both rates for every data distribution. -/
theorem steinkeZakynthinou_of_measurable_orderedERM
    [MeasurableSpace X] [MeasurableSpace H] [MeasurableSingletonClass H] [Nonempty H] [TraceOrder H]
    {n d : ℕ} (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool)
    (hvc : HasVCDimensionAtMost predict d)
    (heval : Measurable (fun p : H × X => predict p.1 p.2))
    (erm : MeasurableOrderedERM predict) :
    let A := properLearner hd hn predict
    Measurable (fun z => (A z).toMeasure) ∧
    (∀ z, (∑' h : H, (A z h).toReal * empiricalError predict z h) ≤
      (⨅ h : H, empiricalError predict z h) + 583 * Real.sqrt ((d : ℝ) / n)) ∧
    ∀ (D : Measure (X × Bool)) [IsProbabilityMeasure D],
      (∫⁻ z, originalPoolKL A z ∂Measure.pi fun _ : Fin n × Bool => D) ≤
        ENNReal.ofReal (19712 * d) := by
  intro A
  have hsel := hasMeasurableCanonicalRepresentatives_of_orderedERM predict heval erm
  obtain ⟨hacc, _, hinfo⟩ := steinkeZakynthinou_kl_rates hd hn predict hvc hsel.toHasMeasurableTraceSelection
  exact ⟨measurable_properLearner_toMeasure hd hn predict hsel, hacc, fun D _ => (hinfo D).2.2⟩

end AgnosticVC
