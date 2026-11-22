module

public import Conjectures.AgnosticVC.Learner

/-! Every realized trace has strictly positive probability in the actual learner, and
its representative is the only supported output with that trace. -/

@[expose] public section

open MeasureTheory

namespace AgnosticVC

variable {X H : Type*}

/-- The singleton trace contains its sole position exactly when the prediction is positive. -/
theorem oneRowTrace_eq_univ_iff (predict : H → X → Bool) (x : X) (h : H) :
    sampleTrace predict (fun _ : Fin 1 => x) h = Finset.univ ↔ predict h x = true := by
  constructor
  · intro htrace
    apply (mem_sampleTrace predict (fun _ : Fin 1 => x) h 0).mp
    rw [htrace]
    exact Finset.mem_univ _
  · intro hfit
    ext i
    simp only [mem_sampleTrace, Finset.mem_univ, iff_true]
    exact hfit

/-- The all-positive trace of a single feature if it is realized. -/
noncomputable def positiveTraceIndex (predict : H → X → Bool) (x : X)
    (hp : ∃ h, predict h x = true) : TraceSpace predict (fun _ : Fin 1 => x) := by
  refine ⟨Finset.univ, mem_sampleFamily.mpr ?_⟩
  obtain ⟨h, hh⟩ := hp
  exact ⟨h, (oneRowTrace_eq_univ_iff predict x h).mpr hh⟩

private theorem learnedTraceMass_pos {I : Type*} [Fintype I] [DecidableEq I] [Nonempty H]
    (σ : Schedule) (hτ : 0 < σ.temperature) (hc : ∀ j, 0 ≤ σ.coeff j)
    (predict : H → X → Bool) (x : I → X) (y : I → Bool) (v : TraceSpace predict x) :
    0 < learnedTraceMass σ predict x y v := by
  let f (u : I → unitInterval) := traceLaw σ predict x y (weightDraw u) v
  have hf (u : I → unitInterval) : 0 < f u := by
    unfold f traceLaw
    exact optimizer_pos _ (restrictTrace predict x σ) hτ
      (fun k => div_nonneg (hc k.1) (Nat.cast_nonneg _)) v
  change 0 < ∫ u, f u ∂weightMeasure I
  rw [integral_pos_iff_support_of_nonneg (fun u => (hf u).le)
    (integrable_traceLaw hτ hc predict x y v)]
  have hsupport : Function.support f = Set.univ := Set.eq_univ_of_forall fun u => (hf u).ne'
  rw [hsupport, measure_univ]
  exact zero_lt_one

variable [TraceOrder H]

/-- The first hypothesis in the trace order that predicts positive on the observation. -/
noncomputable def positiveTraceRep (predict : H → X → Bool) (x : X)
    (hp : ∃ h, predict h x = true) : H :=
  canonicalRep predict (fun _ : Fin 1 => x) (positiveTraceIndex predict x hp)

theorem positiveTraceRep_predict (predict : H → X → Bool) (x : X)
    (hp : ∃ h, predict h x = true) : predict (positiveTraceRep predict x hp) x = true :=
  (oneRowTrace_eq_univ_iff predict x _).mp (canonicalRep_trace predict _ _)

theorem positiveTraceRep_minimal (predict : H → X → Bool) (x : X)
    (hp : ∃ h, predict h x = true) {a : H} (ha : predict a x = true) :
    ¬ TraceOrder.rel a (positiveTraceRep predict x hp) := by
  unfold positiveTraceRep canonicalRep
  apply (TraceOrder.isWellOrder (H := H)).wf.not_lt_min
  exact (oneRowTrace_eq_univ_iff predict x a).mpr ha

variable [Nonempty H]

/-- Strict interior optimizer weights remain positive after averaging and returning
the named representative. -/
theorem properLearner_realizedTrace_pos {n d : ℕ} (hd : 0 < d) (hn : d ≤ n)
    (predict : H → X → Bool) (z : Fin n → X × Bool)
    (v : TraceSpace predict (fun i => (z i).1)) :
    0 < properLearner hd hn predict z (canonicalRep predict _ v) := by
  classical
  have hv := learnedTraceMass_pos (schedule n d) (schedule_temperature_pos hd (hd.trans_le hn))
    (schedule_coeff_nonneg n d) predict (fun i => (z i).1) (fun i => (z i).2) v
  rw [PMF.apply_pos_iff]
  unfold properLearner traceReadoutLearner
  apply (PMF.mem_support_map_iff _ _ _).mpr
  refine ⟨v, ?_, rfl⟩
  change ENNReal.ofReal (learnedTraceMass (schedule n d) predict _ _ v) ≠ 0
  exact (ENNReal.ofReal_pos.mpr hv).ne'

/-- The representative is the only supported hypothesis realizing its trace. -/
theorem properLearner_realizedTrace_unique {n d : ℕ} (hd : 0 < d) (hn : d ≤ n)
    (predict : H → X → Bool) (z : Fin n → X × Bool)
    (v : TraceSpace predict (fun i => (z i).1)) {h : H}
    (hs : h ∈ (properLearner hd hn predict z).support)
    (ht : sampleTrace predict (fun i => (z i).1) h = v.val) :
    h = canonicalRep predict _ v := by
  classical
  unfold properLearner traceReadoutLearner at hs
  obtain ⟨w, _, hw⟩ := (PMF.mem_support_map_iff _ _ _).mp hs
  have hwv : w = v := Subtype.ext ((canonicalRep_trace predict _ w).symm.trans (hw ▸ ht))
  simpa only [hwv] using hw.symm

/-- A measurable test inside a trace cell has positive mass precisely when it
contains that trace's canonical hypothesis. -/
theorem properLearner_traceEvent_pos_iff [MeasurableSpace H] {n d : ℕ} (hd : 0 < d) (hn : d ≤ n)
    (predict : H → X → Bool) (z : Fin n → X × Bool)
    (v : TraceSpace predict (fun i => (z i).1)) (B : Set H)
    (hB : MeasurableSet {h | sampleTrace predict (fun i => (z i).1) h = v.val ∧ h ∈ B}) :
    0 < (properLearner hd hn predict z).toMeasure
      {h | sampleTrace predict (fun i => (z i).1) h = v.val ∧ h ∈ B} ↔
      canonicalRep predict _ v ∈ B := by
  rw [pos_iff_ne_zero]
  refine (not_congr (PMF.toMeasure_apply_eq_zero_iff _ hB)).trans ?_
  constructor
  · intro hpos
    by_contra hnot
    apply hpos
    apply Set.disjoint_left.mpr
    intro h hs ⟨ht, hb⟩
    exact hnot ((properLearner_realizedTrace_unique hd hn predict z v hs ht) ▸ hb)
  · intro hb hdisj
    have hs : canonicalRep predict _ v ∈ (properLearner hd hn predict z).support :=
      (properLearner_realizedTrace_pos hd hn predict z v).ne'
    exact Set.disjoint_left.mp hdisj hs ⟨canonicalRep_trace predict _ v, hb⟩

/-- The actual proper learner, with sample size and dimension both set to one. -/
noncomputable abbrev onePositiveRowLearner (predict : H → X → Bool) (x : X) : PMF H :=
  properLearner (n := 1) (d := 1) Nat.zero_lt_one le_rfl predict (fun _ => (x, true))

theorem properLearner_positiveTrace_pos (predict : H → X → Bool) (x : X)
    (hp : ∃ h, predict h x = true) :
    0 < onePositiveRowLearner predict x (positiveTraceRep predict x hp) :=
  properLearner_realizedTrace_pos Nat.zero_lt_one le_rfl predict (fun _ => (x, true))
    (positiveTraceIndex predict x hp)

theorem properLearner_positiveTrace_unique (predict : H → X → Bool) (x : X)
    (hp : ∃ h, predict h x = true) {h : H}
    (hs : h ∈ (onePositiveRowLearner predict x).support) (ht : predict h x = true) :
    h = positiveTraceRep predict x hp :=
  properLearner_realizedTrace_unique Nat.zero_lt_one le_rfl predict (fun _ => (x, true))
    (positiveTraceIndex predict x hp) hs ((oneRowTrace_eq_univ_iff predict x h).mpr ht)

theorem properLearner_positiveEvent_pos_iff [MeasurableSpace H] (predict : H → X → Bool)
    (x : X) (hp : ∃ h, predict h x = true) (B : Set H)
    (hB : MeasurableSet {h | predict h x = true ∧ h ∈ B}) :
    0 < (onePositiveRowLearner predict x).toMeasure {h | predict h x = true ∧ h ∈ B} ↔
      positiveTraceRep predict x hp ∈ B := by
  have htraceB : MeasurableSet {h | sampleTrace predict (fun _ : Fin 1 => x) h = Finset.univ ∧ h ∈ B} := by
    simpa only [oneRowTrace_eq_univ_iff] using hB
  have hpos := properLearner_traceEvent_pos_iff Nat.zero_lt_one le_rfl predict (fun _ => (x, true))
    (positiveTraceIndex predict x hp) B htraceB
  change 0 < (onePositiveRowLearner predict x).toMeasure
    {h | sampleTrace predict (fun _ : Fin 1 => x) h = Finset.univ ∧ h ∈ B} ↔
      positiveTraceRep predict x hp ∈ B at hpos
  simpa only [oneRowTrace_eq_univ_iff] using hpos

end AgnosticVC
