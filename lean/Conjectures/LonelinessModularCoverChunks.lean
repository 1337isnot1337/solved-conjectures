import Conjectures.LonelinessModularCoverSearch

/-! Composing independently checked support searches. A reference is valid
only when its complete selected/available/uncovered/slot state agrees with
the referenced state. The family of checked subproblems is an explicit
input; no assertion about the producer's search coverage is trusted. -/

namespace Loneliness.Modular.SupportSearch.Chunks

def StateSound (cover : ℕ → Finset ℕ) (compatible : ℕ → ℕ → Bool)
    (conclusion : Finset ℕ → Prop) (state : State) : Prop :=
  ∀ remaining, remaining⊆state.available → remaining.card≤state.slots →
    state.uncovered⊆remaining.biUnion cover →
    Compatible compatible (state.selected ∪ remaining) →
    conclusion (state.selected ∪ remaining)

/-- A full state splits exhaustively according to whether the remaining
support contains the chosen candidate. -/
theorem state_split_sound (cover : ℕ → Finset ℕ) (compatible : ℕ → ℕ → Bool)
    (conclusion : Finset ℕ → Prop) (state : State) (a : ℕ)
    (hwithout : StateSound cover compatible conclusion (absentState state a))
    (hwith : StateSound cover compatible conclusion
      (presentState cover compatible state a)) :
    StateSound cover compatible conclusion state := by
  intro remaining hsub hcard hcover hcompatible
  by_cases ha : a∈remaining
  · have htarget : insert a state.selected ∪ remaining.erase a = state.selected ∪ remaining := by
      ext b
      by_cases hb : b=a
      · subst b
        simp [ha]
      · simp [Finset.mem_union,Finset.mem_insert,Finset.mem_erase,hb]
    have hsub' : remaining.erase a ⊆ afterChoice compatible state.available a := by
      intro b hb
      obtain ⟨hba,hbr⟩ := Finset.mem_erase.mp hb
      apply Finset.mem_filter.mpr
      refine ⟨Finset.mem_erase.mpr ⟨hba,hsub hbr⟩,?_⟩
      exact hcompatible a (Finset.mem_union_right state.selected ha)
        b (Finset.mem_union_right state.selected hbr) (Ne.symm hba)
    have hcard' : (remaining.erase a).card≤state.slots-1 := by
      rw [Finset.card_erase_of_mem ha]
      omega
    have hcover' : state.uncovered \ cover a ⊆ (remaining.erase a).biUnion cover := by
      intro t ht
      obtain ⟨htu,hta⟩ := Finset.mem_sdiff.mp ht
      obtain ⟨b,hb,htb⟩ := Finset.mem_biUnion.mp (hcover htu)
      have hba : b≠a := by
        intro h
        subst b
        exact hta htb
      exact Finset.mem_biUnion.mpr ⟨b,Finset.mem_erase.mpr ⟨hba,hb⟩,htb⟩
    have hc' : Compatible compatible (insert a state.selected ∪ remaining.erase a) := by
      simpa only [htarget] using hcompatible
    have hout := hwith (remaining.erase a) hsub' hcard' hcover' hc'
    simpa only [presentState,htarget] using hout
  · have hsub' : remaining⊆state.available.erase a := by
      intro b hb
      apply Finset.mem_erase.mpr
      refine ⟨?_,hsub hb⟩
      intro h
      subst b
      exact ha hb
    exact hwithout remaining hsub' hcard hcover hcompatible

inductive Tree where
  | leaf (certificate : SupportSearch.Tree)
  | reference (index : ℕ)
  | split (candidate : ℕ) (without withCandidate : Tree)

def check {N : ℕ} (cover : ℕ → Finset ℕ) (compatible : ℕ → ℕ → Bool)
    (terminal : Finset ℕ → ℕ → Bool) (states : Fin N → State) : Tree → State → Bool
  | .leaf certificate, state => SupportSearch.check cover compatible terminal certificate
      state.selected state.available state.uncovered state.slots
  | .reference index, state =>
      if h : index<N then decide (state=states ⟨index,h⟩) else false
  | .split a without withCandidate, state =>
      decide (a∈state.available ∧ 0<state.slots) &&
        (check cover compatible terminal states without (absentState state a) &&
          check cover compatible terminal states withCandidate
            (presentState cover compatible state a))

theorem check_sound {N : ℕ} (cover : ℕ → Finset ℕ)
    (compatible : ℕ → ℕ → Bool) (terminal : Finset ℕ → ℕ → Bool)
    (conclusion : Finset ℕ → Prop)
    (hterminal : ∀ s index, terminal s index=true → conclusion s)
    (states : Fin N → State)
    (hstates : ∀ i, StateSound cover compatible conclusion (states i)) (tree : Tree) :
    ∀ state, check cover compatible terminal states tree state=true →
      StateSound cover compatible conclusion state := by
  induction tree with
  | leaf certificate =>
    intro state hcheck
    exact SupportSearch.check_sound cover compatible terminal conclusion hterminal certificate
      state.selected state.available state.uncovered state.slots hcheck
  | reference index =>
    intro state hcheck
    by_cases hi : index<N
    · rw [check,dite_eq_left hi] at hcheck
      have heq : state=states ⟨index,hi⟩ := of_decide_eq_true hcheck
      rw [heq]
      exact hstates ⟨index,hi⟩
    · rw [check,dite_eq_right hi] at hcheck
      cases hcheck
  | split a without withCandidate ihwithout ihwith =>
    intro state hcheck
    have hh := Bool.and_eq_true_iff.mp hcheck
    have hchildren := Bool.and_eq_true_iff.mp hh.2
    exact state_split_sound cover compatible conclusion state a
      (ihwithout _ hchildren.1) (ihwith _ hchildren.2)

/-- A numerical check of a bounded subproblem supplies the semantic fact
used by references. Failure to finish within the fuel rejects the check. -/
theorem bounded_state_sound (cover : ℕ → Finset ℕ) (compatible : ℕ → ℕ → Bool)
    (terminal : Finset ℕ → ℕ → Bool) (conclusion : Finset ℕ → Prop)
    (hterminal : ∀ s index, terminal s index=true → conclusion s)
    (strategy : State → Instruction) (fuel : ℕ) (state : State)
    (hcheck : boundedCheck cover compatible terminal strategy fuel state=true) :
    StateSound cover compatible conclusion state := by
  intro remaining hsub hcard hcover hcompatible
  exact boundedCheck_sound cover compatible terminal conclusion hterminal strategy fuel state
    hcheck remaining hsub hcard hcover hcompatible

def exampleStates : Fin 1 → State := ![⟨{1},{2},{1},1⟩]

def examplePrefix : Tree :=
  .split 1 (.leaf (.witness 0)) (.reference 0)

theorem example_prefix_checked :
    check exampleCover (fun _ _ => true) exampleTerminal exampleStates examplePrefix
      ⟨∅,{1,2},{0,1},2⟩=true := by
  decide +kernel

theorem example_subproblem_checked :
    boundedCheck exampleCover (fun _ _ => true) exampleTerminal exampleStrategy 2
      (exampleStates 0)=true := by
  decide +kernel

/-- The parent check uses the separately checked subproblem, while still
covering every support in the initial state. -/
theorem example_complete (s : Finset ℕ) (hsub : s⊆{1,2}) (hcard : s.card≤2)
    (hcover : ({0,1}:Finset ℕ)⊆s.biUnion exampleCover) : s={1,2} := by
  have ht : ∀ s index, exampleTerminal s index=true → s={1,2} := by
    intro s index h
    exact (of_decide_eq_true h).2
  have hs : ∀ i, StateSound exampleCover (fun _ _ => true)
      (fun s => s={1,2}) (exampleStates i) := by
    intro i
    have hi : i=0 := Subsingleton.elim i 0
    subst i
    exact bounded_state_sound exampleCover (fun _ _ => true) exampleTerminal
      (fun s => s={1,2}) ht exampleStrategy 2 (exampleStates 0) example_subproblem_checked
  have hh := check_sound exampleCover (fun _ _ => true) exampleTerminal (fun s => s={1,2})
    ht exampleStates hs examplePrefix ⟨∅,{1,2},{0,1},2⟩ example_prefix_checked
    s hsub hcard hcover (by intro a _ b _ _; rfl)
  simpa only [Finset.empty_union] using hh

end Loneliness.Modular.SupportSearch.Chunks
