module

public import Conjectures.AgnosticVC.IidOrderedERM
public import Conjectures.AgnosticVC.OrderedERM
public import Conjectures.AgnosticVC.MeasurableInformation

/-! The same learner under iid-completed measurability of the ordered empirical minimizer. -/

@[expose] public section

open MeasureTheory
open scoped ENNReal

namespace AgnosticVC

variable {X H : Type*} [MeasurableSpace X] [MeasurableSpace H] [TraceOrder H]

/-- One fixed ordered empirical minimizer, tested for measurability under fair independent
labels and iid features with the specified marginal. -/
structure IidMeasurableOrderedERM (predict : H → X → Bool) (μ : Measure X) where
  learn (m : ℕ) : (Fin m → X × Bool) → H
  measurable_learn : ∀ m, Measurable (fun z : NullMeasurableSpace (Fin m → X × Bool)
    (Measure.pi fun _ : Fin m => iidFairLabelLaw μ) => learn m z)
  minimizes : ∀ m z h, ermMistakes predict z (learn m z) ≤ ermMistakes predict z h
  breaks_ties : ∀ m z h, TraceOrder.rel h (learn m z) →
    ermMistakes predict z (learn m z) < ermMistakes predict z h

private abbrev CompletedRows (I : Type) [Fintype I] (D : Measure (X × Bool)) :=
  NullMeasurableSpace (I → X × Bool) (Measure.pi fun _ : I => D)

private def rows {I : Type} [Fintype I] {D : Measure (X × Bool)}
    (w : CompletedRows I D) : I → X × Bool := w

private theorem measurable_rows {I : Type} [Fintype I] (D : Measure (X × Bool)) :
    Measurable (rows (I := I) (D := D)) := fun _ ht => ht.nullMeasurableSet

/-- Each finite trace query can be answered by a measurable hypothesis-valued map on the
completed ambient experiment. Its off-event values are immaterial. -/
private theorem iid_trace_readout {I J : Type} [Fintype I] [Fintype J] [DecidableEq J]
    (D : Measure (X × Bool)) [IsProbabilityMeasure D] (predict : H → X → Bool)
    (erm : IidMeasurableOrderedERM predict (D.map Prod.fst)) (e : J ↪ I) (v : Finset J) :
    ∃ r : CompletedRows I D → H, Measurable r ∧
      ∀ w (hv : v ∈ sampleFamily predict (fun j => (rows w (e j)).1)),
        canonicalRep predict (fun j => (rows w (e j)).1) ⟨v,hv⟩ = r w := by
  let b := (Fintype.equivFin J).symm
  let lab (i : Fin (Fintype.card J)) := decide (b i ∈ v)
  let r (w : CompletedRows I D) := erm.learn _ (fun i => ((rows w (e (b i))).1, lab i))
  refine ⟨r, iid_fixedLabel_readout_measurable D (fun i => e (b i))
    (e.injective.comp b.injective) lab (erm.learn _) (erm.measurable_learn _), ?_⟩
  intro w hv
  exact canonicalRep_eq_orderedERM_of_fit b predict _ v hv (r w)
    (erm.minimizes _ _) (erm.breaks_ties _ _)

omit [TraceOrder H] in
private theorem measurable_readout_trace {Ω : Type*} [MeasurableSpace Ω] {I : Type}
    [Fintype I] (predict : H → X → Bool)
    (hm : Measurable (fun p : H × X => predict p.1 p.2)) (x : Ω → I → X)
    (mx : Measurable x) (r : Ω → H) (mr : Measurable r) (v : Finset I) :
    MeasurableSet {w | sampleTrace predict (x w) (r w) = v} := by
  classical
  rw [show {w | sampleTrace predict (x w) (r w) = v} =
    ⋂ i : I, {w | predict (r w) (x w i) = decide (i ∈ v)} by
      ext w
      simp only [Set.mem_ofPred_eq, Set.mem_iInter, Finset.ext_iff, mem_sampleTrace]
      exact forall_congr' fun i => by cases hp : predict (r w) (x w i) <;> simp]
  exact MeasurableSet.iInter fun i =>
    (hm.comp (mr.prodMk ((measurable_pi_apply i).comp mx))) (measurableSet_singleton _)

private theorem iid_trace_events {I J : Type} [Fintype I] [Fintype J] [DecidableEq J]
    (D : Measure (X × Bool)) [IsProbabilityMeasure D] (predict : H → X → Bool)
    (hm : Measurable (fun p : H × X => predict p.1 p.2))
    (erm : IidMeasurableOrderedERM predict (D.map Prod.fst)) (e : J ↪ I) (v : Finset J) :
    let x := fun (w : CompletedRows I D) j => (rows w j).1
    MeasurableSet {w | v ∈ sampleFamily predict (x w ∘ e)} ∧
    (∀ B : Set H, MeasurableSet B → MeasurableSet {w |
      ∃ hv : v ∈ sampleFamily predict (x w ∘ e), canonicalRep predict (x w ∘ e) ⟨v,hv⟩ ∈ B}) ∧
    ∀ t : Finset I, MeasurableSet {w | ∃ hv : v ∈ sampleFamily predict (x w ∘ e),
      (extendTrace predict (x w) e ⟨v,hv⟩).val = t} := by
  classical
  intro x
  obtain ⟨r,mr,hfirst⟩ := iid_trace_readout D predict erm e v
  have mx : Measurable x := Measurable.of_eval fun i =>
    measurable_fst.comp ((measurable_pi_apply i).comp (measurable_rows D))
  have msub : Measurable (fun w => x w ∘ e) := Measurable.of_eval fun i =>
    (measurable_pi_apply (e i)).comp mx
  have realises : MeasurableSet {w | v ∈ sampleFamily predict (x w ∘ e)} := by
    convert measurable_readout_trace predict hm _ msub r mr v using 1
    ext w
    constructor
    · intro hv
      change sampleTrace predict (x w ∘ e) (r w) = v
      rw [← hfirst w hv]
      exact canonicalRep_trace predict _ ⟨v,hv⟩
    · exact fun ht => mem_sampleFamily.mpr ⟨_,ht⟩
  have event (P : CompletedRows I D → H → Prop) (hp : MeasurableSet {w | P w (r w)}) :
      MeasurableSet {w | ∃ hv : v ∈ sampleFamily predict (x w ∘ e),
        P w (canonicalRep predict (x w ∘ e) ⟨v,hv⟩)} := by
    convert realises.inter hp using 1
    ext w
    constructor
    · rintro ⟨hv,he⟩
      refine ⟨hv, ?_⟩
      change P w (r w)
      exact (congrArg (P w) (hfirst w hv)).mp he
    · rintro ⟨hv,he⟩
      refine ⟨hv, ?_⟩
      exact (congrArg (P w) (hfirst w hv)).mpr he
  exact ⟨realises, fun B hB => event (fun _ h => h ∈ B) (mr hB),
    fun t => event (fun w h => sampleTrace predict (x w) h = t)
      (measurable_readout_trace predict hm _ mx r mr t)⟩

/-- For a fixed iid law, the ordered ERM need only be measurable after completion for
the feature marginal with independent fair labels. The randomized learner is the same
algorithm for every law and the empirical inequality holds on every sample. -/
theorem steinkeZakynthinou_of_iid_orderedERM [Nonempty H] [MeasurableSingletonClass H]
    {n d : ℕ} (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool)
    (hvc : HasVCDimensionAtMost predict d) (hm : Measurable (fun p : H × X => predict p.1 p.2))
    (D : Measure (X × Bool)) [IsProbabilityMeasure D]
    (erm : IidMeasurableOrderedERM predict (D.map Prod.fst)) :
    let A := properLearner hd hn predict
    Measurable (fun z : NullMeasurableSpace (Fin n → X × Bool)
      (Measure.pi fun _ : Fin n => D) => (A z).toMeasure) ∧
    (∀ z, (∑' h : H, (A z h).toReal * empiricalError predict z h) ≤
      (⨅ h : H, empiricalError predict z h) + 583 * Real.sqrt ((d : ℝ) / n)) ∧
    (∫⁻ z, originalPoolKL A z ∂Measure.pi fun _ : Fin n × Bool => D) ≤
      ENNReal.ofReal (19712 * d) := by
  classical
  intro A
  have train := iid_trace_events (I := Fin n) D predict hm erm (Function.Embedding.refl _)
  refine ⟨measurable_properLearner_toMeasure_on hd hn predict rows (measurable_rows D)
    (fun v => (train v).1) (fun v => (train v).2.1), properLearner_empirical_le_iInf hd hn predict hvc, ?_⟩
  let pick (s : Fin n → Bool) : Fin n ↪ Fin n × Bool :=
    ⟨fun i => (i,s i), fun _ _ h => congrArg Prod.fst h⟩
  have pool := iid_trace_events (I := Fin n × Bool) D predict hm erm (Function.Embedding.refl _)
  have part (s : Fin n → Bool) := iid_trace_events D predict hm erm (pick s)
  have m := measurable_poolInformation_on hd hn predict rows (measurable_rows D)
    (fun v => (pool v).1) (fun s v => (part s v).1) (fun s v => (part s v).2.2)
  let μ := Measure.pi (fun _ : Fin n × Bool => D)
  have hnul : NullMeasurable (poolInformation hd hn predict) μ := fun _ h => m h
  have hi : AEMeasurable (originalPoolInformation A) μ := by
    have he : originalPoolInformation A = poolInformation hd hn predict :=
      funext (originalPoolInformation_eq_poolInformation hd hn predict)
    rw [he]
    exact hnul.aemeasurable
  have eq (z : Pool n X) : (originalPoolKL A z).toReal = originalPoolInformation A z :=
    (poolInformation_eq_klDiv hd hn predict z).2.trans (originalPoolInformation_eq_poolInformation hd hn predict z).symm
  have int := integrable_originalPoolInformation_of_aemeasurable hd hn predict μ hi
  calc
    _ = ∫⁻ z, ENNReal.ofReal (originalPoolInformation A z) ∂μ := by
      apply lintegral_congr
      intro z
      rw [← eq z]
      exact (ENNReal.ofReal_toReal (poolInformation_eq_klDiv hd hn predict z).1).symm
    _ = ENNReal.ofReal (∫ z, originalPoolInformation A z ∂μ) :=
      (ofReal_integral_eq_lintegral_ofReal int (Filter.Eventually.of_forall
        fun z => (eq z) ▸ ENNReal.toReal_nonneg)).symm
    _ ≤ _ := ENNReal.ofReal_le_ofReal (properLearner_original_cmi_le_of_aemeasurable
      hd hn predict hvc D hi)

end AgnosticVC
