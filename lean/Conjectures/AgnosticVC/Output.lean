module

public import Conjectures.AgnosticVC.Learner
public import Conjectures.AgnosticVC.Information

/-! Encode complete hypothesis names by a common finite alphabet on each supersample. -/

@[expose] public section

open scoped BigOperators

namespace AgnosticVC

variable {I K H X : Type*} [Fintype I] [Fintype K] [TraceOrder H]

/-- Embed a realized sub-block trace into the full block by the predictions of
its canonical representative on *all* positions. -/
noncomputable def extendTrace (predict : H → X → Bool) (x : I → X) (e : K → I)
    (v : TraceSpace predict (x ∘ e)) : TraceSpace predict x :=
  ⟨sampleTrace predict x (canonicalRep predict (x ∘ e) v), sampleTrace_mem ..⟩

theorem canonicalRep_extendTrace (predict : H → X → Bool) (x : I → X) (e : K → I)
    (v : TraceSpace predict (x ∘ e)) :
    canonicalRep predict x (extendTrace predict x e v) = canonicalRep predict (x ∘ e) v :=
  canonicalRep_refinement predict x e v

theorem extendTrace_injective (predict : H → X → Bool) (x : I → X) (e : K → I) :
    Function.Injective (extendTrace predict x e) := by
  intro v w he
  apply canonicalRep_injective predict (x ∘ e)
  simpa only [canonicalRep_extendTrace] using congrArg (canonicalRep predict x) he

/-- The exact PMF on returned hypothesis names evaluated at a full-block representative. -/
theorem properLearner_mass [Nonempty H] {n d : ℕ} (hd : 0 < d) (hn : d ≤ n)
    (predict : H → X → Bool) (x : I → X) (e : Fin n → I) (y : Fin n → Bool)
    (v : TraceSpace predict x) :
    (properLearner hd hn predict (fun i => (x (e i), y i)) (canonicalRep predict x v)).toReal =
      marginal (extendTrace predict x e) (learnedTraceMass (schedule n d) predict (x ∘ e) y) v := by
  classical
  let p := learnedTraceMass (schedule n d) predict (x ∘ e) y
  have hp : IsLaw p := learnedTraceMass_isLaw
    (schedule_temperature_pos hd (hd.trans_le hn)) (schedule_coeff_nonneg n d) predict _ _
  have he (w : TraceSpace predict (x ∘ e)) :
      canonicalRep predict x v = canonicalRep predict (x ∘ e) w ↔ extendTrace predict x e w = v := by
    rw [← canonicalRep_extendTrace predict x e w, (canonicalRep_injective predict x).eq_iff, eq_comm]
  unfold properLearner traceReadoutLearner
  rw [PMF.map_apply, tsum_fintype]
  change (∑ w, if canonicalRep predict x v = canonicalRep predict (x ∘ e) w
    then ENNReal.ofReal (p w) else 0).toReal = marginal _ p v
  simp_rw [he]
  rw [← Finset.sum_filter, ← ENNReal.ofReal_sum_of_nonneg (fun w _ => hp.1 w),
      ENNReal.toReal_ofReal (Finset.sum_nonneg (fun w _ => hp.1 w))]
  simp only [marginal, Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro a _
  by_cases ha : extendTrace predict x e a = v <;> simp [ha]

/-- The carrier for the fixed-pool information sum contains every possible output name. -/
theorem properLearner_supported [Nonempty H] {n d : ℕ} (hd : 0 < d) (hn : d ≤ n)
    (predict : H → X → Bool) (x : I → X) (e : Fin n → I) (y : Fin n → Bool) {h : H}
    (hh : h ∈ (properLearner hd hn predict (fun i => (x (e i), y i))).support) :
    ∃ v : TraceSpace predict x, canonicalRep predict x v = h := by
  classical
  unfold properLearner traceReadoutLearner at hh
  obtain ⟨v, _, hv⟩ := (PMF.mem_support_map_iff _ _ _).mp hh
  exact ⟨extendTrace predict x e v, (canonicalRep_extendTrace predict x e v).trans hv⟩

abbrev Pool (n : ℕ) (X : Type*) := (Fin n × Bool) → X × Bool

/-- At a fixed pool, every output hypothesis is encoded by its complete prediction
trace there. Global coherence of the representative makes this encoding injective. -/
noncomputable def outputChannel [Nonempty H] {n d : ℕ} (_hd : 0 < d) (_hn : d ≤ n)
    (predict : H → X → Bool) (z : Pool n X) (s : Fin n → Bool) :
    TraceSpace predict (fun i => (z i).1) → ℝ :=
  marginal (extendTrace predict (fun i => (z i).1) (fun i => (i,s i)))
    (learnedTraceMass (schedule n d) predict (fun i => (z (i,s i)).1) (fun i => (z (i,s i)).2))

theorem outputChannel_isLaw [Nonempty H] {n d : ℕ} (hd : 0 < d) (hn : d ≤ n)
    (predict : H → X → Bool) (z : Pool n X) (s : Fin n → Bool) :
    IsLaw (outputChannel hd hn predict z s) := by
  exact (learnedTraceMass_isLaw (schedule_temperature_pos hd (hd.trans_le hn))
    (schedule_coeff_nonneg n d) predict _ _).marginal _

/-- Mutual information of the full returned hypothesis and the fair selector
conditioned on this pool. The carrier consists of distinct actual output names. -/
noncomputable def poolInformation [Nonempty H] {n d : ℕ} (hd : 0 < d) (hn : d ≤ n)
    (predict : H → X → Bool) (z : Pool n X) : ℝ :=
  SteinkeZakynthinou.channelInfo (outputChannel hd hn predict z)

theorem poolInformation_eq_original [Nonempty H] {n d : ℕ} (hd : 0 < d) (hn : d ≤ n)
    (predict : H → X → Bool) (z : Pool n X) :
    poolInformation hd hn predict z =
      SteinkeZakynthinou.Learner.selectorMean fun s =>
        ∑ v : TraceSpace predict (fun i => (z i).1),
          let mass (s' : Fin n → Bool) := (properLearner hd hn predict
            (fun i => z (i,s' i)) (canonicalRep predict (fun i => (z i).1) v)).toReal
          SteinkeZakynthinou.relativeTerm (mass s) (SteinkeZakynthinou.Learner.selectorMean mass) := by
  rw [poolInformation, SteinkeZakynthinou.channelInfo_eq _ (fun s => (outputChannel_isLaw hd hn predict z s).1)]
  have he (s : Fin n → Bool) (v : TraceSpace predict (fun i => (z i).1)) :
      (properLearner hd hn predict (fun i => z (i,s i))
        (canonicalRep predict (fun i => (z i).1) v)).toReal = outputChannel hd hn predict z s v :=
    properLearner_mass hd hn predict (fun i => (z i).1) (fun i => (i,s i)) (fun i => (z (i,s i)).2) v
  simp only [he]

end AgnosticVC
