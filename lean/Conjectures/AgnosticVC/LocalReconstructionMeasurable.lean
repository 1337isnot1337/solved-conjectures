module

public import Conjectures.AgnosticVC.LocalReconstruction
public import Conjectures.AgnosticVC.ReadoutIid

/-! Measurability of the local-reconstruction learner on the feature
experiments on which the individual reconstructions are measurable. -/

@[expose] public section

namespace AgnosticVC

open MeasureTheory Set

variable {X H Ω : Type*} [MeasurableSpace X] [MeasurableSpace H] [MeasurableSpace Ω]
    {predict : H → X → Bool} {k n : ℕ}

theorem LocalReconstruction.measurable_trace_events (c : LocalReconstruction predict k)
    (hpred : Measurable (fun z : H × X => predict z.1 z.2))
    (x : Ω → Fin n → X) (hx : Measurable x)
    (hgen : ∀ w : LocalWitness n, Measurable (fun z => w.output c.generate (x z)))
    (v : Finset (Fin n)) :
    MeasurableSet {z : Ω | v ∈ sampleFamily predict (x z)} ∧
      ∀ B : Set H, MeasurableSet B → MeasurableSet {z : Ω |
        ∃ hv : v ∈ sampleFamily predict (x z), c.readout.represent (x z) ⟨v,hv⟩ ∈ B} := by
  classical
  let : Countable (LocalWitness n) := inferInstanceAs (Countable (ℕ × Finset (Fin n)))
  let fits (w : LocalWitness n) : Set Ω := {z |
    w.rows.card ≤ k ∧ sampleTrace predict (x z) (w.output c.generate (x z)) = v}
  have hfit (w : LocalWitness n) : MeasurableSet (fits w) := by
    have he : fits w = {z : Ω | w.rows.card ≤ k} ∩
        ⋂ i : Fin n, {z : Ω | predict (w.output c.generate (x z)) (x z i) = decide (i ∈ v)} := by
      ext z
      simp only [fits, mem_inter_iff, mem_ofPred_eq, mem_iInter]
      constructor
      · rintro ⟨hc,ht⟩
        refine ⟨hc, fun i => ?_⟩
        have hp := congrArg (fun s : Finset (Fin n) => decide (i ∈ s)) ht
        cases hh : predict (w.output c.generate (x z)) (x z i) <;> simpa [hh] using hp
      · rintro ⟨hc,ht⟩
        refine ⟨hc,?_⟩
        ext i
        simp [ht i]
    rw [he]
    refine MeasurableSet.inter (MeasurableSet.const _) (MeasurableSet.iInter fun i => ?_)
    exact (hpred.comp ((hgen w).prodMk ((measurable_pi_apply i).comp hx))) (measurableSet_singleton _)
  have hfirst {z : Ω} {hv : v ∈ sampleFamily predict (x z)} {w : LocalWitness n} :
      c.first (x z) ⟨v,hv⟩ = w ↔ z ∈ fits w ∧ ∀ u : LocalWitness n, u < w → z ∉ fits u := by
    have hiff (u : LocalWitness n) : z ∈ fits u ↔
        u ∈ c.eligible (x z) ⟨v,hv⟩ := by
      change (_ ∧ _) ↔ (_ ∧ traceIndex predict (x z) _ = _)
      rw [Subtype.ext_iff]
      rfl
    simp only [hiff]
    constructor
    · rintro rfl
      exact ⟨c.first_eligible _ _, fun u hu hmem => (not_lt_of_ge (c.first_le _ _ hmem)) hu⟩
    · rintro ⟨hw, hmin⟩
      exact le_antisymm (c.first_le _ _ hw)
        (le_of_not_gt (fun h => hmin _ h (c.first_eligible _ _)))
  constructor
  · have he : {z : Ω | v ∈ sampleFamily predict (x z)} = ⋃ w : LocalWitness n, fits w := by
      ext z
      simp only [mem_ofPred_eq, mem_iUnion]
      constructor
      · intro hv
        let w := c.first (x z) ⟨v,hv⟩
        exact ⟨w,(hfirst.mp rfl).1⟩
      · rintro ⟨w, hw⟩
        exact (hw.2 ▸ sampleTrace_mem predict (x z) (w.output c.generate (x z)))
    rw [he]
    exact MeasurableSet.iUnion hfit
  · intro B hB
    have he : {z : Ω | ∃ hv : v ∈ sampleFamily predict (x z),
        c.readout.represent (x z) ⟨v,hv⟩ ∈ B} = ⋃ w : LocalWitness n,
          (fits w ∩ (⋂ u : LocalWitness n, {z : Ω | u < w → z ∉ fits u})) ∩
            {z : Ω | w.output c.generate (x z) ∈ B} := by
      ext z
      simp only [mem_ofPred_eq, mem_iUnion, mem_iInter, mem_inter_iff]
      constructor
      · rintro ⟨hv,hz⟩
        let w := c.first (x z) ⟨v,hv⟩
        exact ⟨w,hfirst.mp rfl,hz⟩
      · rintro ⟨w,⟨hw,hmin⟩,hz⟩
        have hv : v ∈ sampleFamily predict (x z) :=
          hw.2 ▸ sampleTrace_mem predict (x z) (w.output c.generate (x z))
        refine ⟨hv,?_⟩
        change (c.first (x z) ⟨v,hv⟩).output c.generate (x z) ∈ B
        rw [hfirst.mpr ⟨hw,hmin⟩]
        exact hz
    rw [he]
    refine MeasurableSet.iUnion fun w => ((hfit w).inter (MeasurableSet.iInter fun u => ?_)).inter
      (hgen w hB)
    by_cases hu : u < w
    · simp only [hu, true_implies]
      exact (hfit u).compl
    · simp [hu]

/-- The probability law on named outputs is measurable on any training
experiment where every individual reconstruction is measurable. -/
theorem LocalReconstruction.measurable_learn_on [Nonempty H] (c : LocalReconstruction predict k)
    (hpred : Measurable (fun z : H × X => predict z.1 z.2)) {d : ℕ} (hd : 0 < d) (hn : d ≤ n)
    (z : Ω → Fin n → X × Bool) (hz : Measurable z)
    (hgen : ∀ w : LocalWitness n, Measurable (fun u => w.output c.generate (Prod.fst ∘ z u))) :
    Measurable (fun u => (c.readout.learn hd hn (z u)).toMeasure) := by
  let x (u : Ω) := Prod.fst ∘ z u
  have hx : Measurable x := Measurable.of_eval fun i =>
    measurable_fst.comp ((measurable_pi_apply i).comp hz)
  have hm := c.measurable_trace_events hpred x hx hgen
  exact measurable_traceReadoutLearner_toMeasure_on hd hn predict c.readout.represent z hz
    (fun v => (hm v).1) (fun v => (hm v).2)

omit [MeasurableSpace Ω] in
/-- The same learner works under completion of the training law when the
local reconstructions are only almost-everywhere measurable. A family of
universally measurable reconstructions meets this hypothesis for every law. -/
theorem LocalReconstruction.completed_iid_information [Nonempty H] [MeasurableEq H]
    (c : LocalReconstruction predict k) {d m : ℕ} (hd : 0 < d) (hn : d ≤ m + 1)
    (hvc : HasVCDimensionAtMost predict d)
    (hpred : Measurable (fun z : H × X => predict z.1 z.2))
    (D : Measure (X × Bool)) [IsProbabilityMeasure D]
    (hgen : ∀ w : LocalWitness (m+1), AEMeasurable (w.output c.generate)
      ((Measure.pi fun _ : Fin (m+1) => D).map (fun z i => (z i).1))) :
    let ν := Measure.pi fun _ : Fin (m+1) => D
    let μ := Measure.pi fun _ : Fin (m+1) × Bool => D
    let A := c.readout.learn hd hn
    let info z := (InformationTheory.klDiv (originalPoolJoint A z).toMeasure
      (originalPoolMarginalProduct A z).toMeasure).toReal
    Measurable (fun z : NullMeasurableSpace (Fin (m+1) → X × Bool) ν => (A z).toMeasure) ∧
      Integrable info μ ∧ (∫ z, info z ∂μ) ≤ 197120 * (d : ℝ) + 32 * (k : ℝ) := by
  intro ν μ A info
  let Z := NullMeasurableSpace (Fin (m+1) → X × Bool) ν
  let read : Z → Fin (m+1) → X × Bool := fun z => z
  let x (z : Fin (m+1) → X × Bool) := Prod.fst ∘ z
  have hread : Measurable read := fun _ hs => hs.nullMeasurableSet
  have hx : Measurable x := Measurable.of_eval fun i =>
    measurable_fst.comp (measurable_pi_apply i)
  have hr : Measurable (fun z : Z => (A z).toMeasure) :=
    c.measurable_learn_on hpred hd hn read hread (fun w => (hgen w).comp_measurable hx |>.nullMeasurable)
  exact ⟨hr,c.readout.learn_iid_le hd hn hvc D hr⟩

omit [MeasurableSpace Ω] in
/-- Measurable local reconstructions give one Borel learner with both rates
simultaneously for every iid law. The information uses the actual joint law
and its actual product of marginals. -/
theorem LocalReconstruction.iid_rates [Nonempty H] [MeasurableEq H]
    (c : LocalReconstruction predict k) {d m : ℕ} (hd : 0 < d) (hn : d ≤ m + 1)
    (hvc : HasVCDimensionAtMost predict d)
    (hpred : Measurable (fun z : H × X => predict z.1 z.2))
    (hgen : ∀ w : LocalWitness (m+1), Measurable (w.output c.generate)) :
    ∃ A : (Fin (m+1) → X × Bool) → PMF H,
      Measurable (fun z => (A z).toMeasure) ∧
      (∀ (D : Measure (X × Bool)) [IsProbabilityMeasure D],
        let μ := Measure.pi fun _ : Fin (m+1) × Bool => D
        let info z := (InformationTheory.klDiv (originalPoolJoint A z).toMeasure
          (originalPoolMarginalProduct A z).toMeasure).toReal
        Integrable info μ ∧ (∫ z, info z ∂μ) ≤ 197120 * (d : ℝ) + 32 * (k : ℝ)) ∧
      ∀ z, (∑' h : H, (A z h).toReal * empiricalError predict z h) ≤
        (⨅ h : H, empiricalError predict z h) + 583 * Real.sqrt ((d : ℝ) / (m+1)) := by
  have hx : Measurable (fun z : Fin (m+1) → X × Bool => Prod.fst ∘ z) :=
    Measurable.of_eval fun i => measurable_fst.comp (measurable_pi_apply i)
  have hlearner := c.measurable_learn_on hpred hd hn id measurable_id (fun w => (hgen w).comp hx)
  refine ⟨c.readout.learn hd hn, hlearner, ?_, ?_⟩
  · intro D _
    exact c.readout.learn_iid_le hd hn hvc D (fun _ ht => (hlearner ht).nullMeasurableSet)
  · intro z
    simpa only [Nat.cast_add, Nat.cast_one] using c.readout.learn_empirical_le hd hn hvc z

end AgnosticVC
