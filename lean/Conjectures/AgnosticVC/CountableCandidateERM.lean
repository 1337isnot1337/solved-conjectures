module

public import Conjectures.AgnosticVC.OrderedERM

/-! An ordinary measurable ERM from a countable list of sample-dependent
candidates that realizes all training traces. -/

@[expose] public section

open MeasureTheory

namespace AgnosticVC

variable {X H : Type*} [MeasurableSpace X] [MeasurableSpace H] {n : ℕ}

private theorem measurable_ermMistakes_of_candidate (predict : H → X → Bool)
    (heval : Measurable (fun p : H × X => predict p.1 p.2))
    {c : (Fin n → X × Bool) → H} (hc : Measurable c) :
    Measurable (fun z => ermMistakes predict z (c z)) := by
  let labels (z : Fin n → X × Bool) (i : Fin n) := (predict (c z) (z i).1, (z i).2)
  have hlabels : Measurable labels := by
    apply Measurable.of_eval
    intro i
    have hi : Measurable (fun z : Fin n → X × Bool => z i) := measurable_pi_apply i
    exact (heval.comp (hc.prodMk hi.fst)).prodMk hi.snd
  let count (r : Fin n → Bool × Bool) := (Finset.univ.filter fun i => (r i).1 ≠ (r i).2).card
  exact (measurable_of_countable count).comp hlabels

/-- Choose the first candidate minimizing its integer mistake count. Reproducing every
full training trace ensures this rule is an exact ERM over the whole class. -/
theorem exists_measurable_erm_of_countable_candidates (predict : H → X → Bool)
    (heval : Measurable (fun p : H × X => predict p.1 p.2))
    (candidate : ℕ → (Fin n → X × Bool) → H)
    (hcandidate : ∀ j, Measurable (candidate j))
    (hcover : ∀ (z : Fin n → X × Bool) (h : H), ∃ j,
      sampleTrace predict (fun i => (z i).1) (candidate j z) =
        sampleTrace predict (fun i => (z i).1) h) :
    ∃ learn : (Fin n → X × Bool) → H, Measurable learn ∧
      ∀ z h, ermMistakes predict z (learn z) ≤ ermMistakes predict z h := by
  classical
  let loss (j : ℕ) (z : Fin n → X × Bool) := ermMistakes predict z (candidate j z)
  have hloss (j : ℕ) : Measurable (loss j) :=
    measurable_ermMistakes_of_candidate predict heval (hcandidate j)
  let best (k : ℕ) (z : Fin n → X × Bool) := ∀ j, loss k z ≤ loss j z
  have hbest (z : Fin n → X × Bool) : ∃ k, best k z := by
    have hattains : ∃ m : ℕ, ∃ j : ℕ, loss j z = m := ⟨loss 0 z, 0, rfl⟩
    obtain ⟨k, hk⟩ := Nat.find_spec hattains
    refine ⟨k, fun j => ?_⟩
    rw [hk]
    exact Nat.find_min' hattains ⟨j, rfl⟩
  have hmeas (k : ℕ) : MeasurableSet {z | best k z} := by
    change MeasurableSet {z | ∀ j, loss k z ≤ loss j z}
    rw [Set.ofPred_forall]
    exact MeasurableSet.iInter fun j => measurableSet_le (hloss k) (hloss j)
  refine ⟨fun z => candidate (Nat.find (hbest z)) z, Measurable.find hcandidate hmeas hbest, ?_⟩
  intro z h
  obtain ⟨j, hj⟩ := hcover z h
  have hp (i : Fin n) : predict (candidate j z) (z i).1 = predict h (z i).1 := by
    apply Bool.eq_iff_iff.mpr
    rw [← mem_sampleTrace predict (fun i => (z i).1) (candidate j z) i,
      ← mem_sampleTrace predict (fun i => (z i).1) h i, hj]
  have hjloss : loss j z = ermMistakes predict z h := by
    unfold loss ermMistakes
    apply congrArg Finset.card
    ext i
    simp only [Finset.mem_filter, hp]
  exact (Nat.find_spec (hbest z) j).trans_eq hjloss

end AgnosticVC
