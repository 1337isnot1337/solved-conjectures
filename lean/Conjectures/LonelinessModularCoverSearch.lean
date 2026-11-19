import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Data.Finset.Card
import Mathlib.Tactic

/-! Finite support-cover certificates. The numerical checker is independent
of modular arithmetic. It proves that every compatible subset with a given
cardinality budget and full time coverage reaches an explicitly checked
retained leaf. No termination assertion about a producer is a premise. -/

namespace Loneliness.Modular.SupportSearch

open scoped BigOperators

def Compatible (compatible : ℕ → ℕ → Bool) (s : Finset ℕ) : Prop :=
  ∀ a∈s, ∀ b∈s, a≠b → compatible a b=true

def gain (cover : ℕ → Finset ℕ) (uncovered : Finset ℕ) (a : ℕ) : ℕ :=
  (uncovered ∩ cover a).card

def capacity (cover : ℕ → Finset ℕ) (available uncovered : Finset ℕ)
    (slots threshold : ℕ) : ℕ :=
  slots*threshold + ∑ a∈available, (gain cover uncovered a-threshold)

/-- A sorting-free upper bound for the union of at most `slots` available
sets. Choosing the threshold to be the slots-th largest gain gives the usual
top-gain bound, but that choice is not an assumption of the theorem. -/
theorem coverage_card_le_capacity (cover : ℕ → Finset ℕ)
    (available uncovered remaining : Finset ℕ) (slots threshold : ℕ)
    (hsub : remaining⊆available) (hcard : remaining.card≤slots)
    (hcover : uncovered⊆remaining.biUnion cover) :
    uncovered.card≤capacity cover available uncovered slots threshold := by
  have hsub' : uncovered⊆remaining.biUnion (fun a => uncovered ∩ cover a) := by
    intro t ht
    obtain ⟨a,ha,hat⟩ := Finset.mem_biUnion.mp (hcover ht)
    exact Finset.mem_biUnion.mpr ⟨a,ha,Finset.mem_inter.mpr ⟨ht,hat⟩⟩
  have hsum : uncovered.card≤∑ a∈remaining, gain cover uncovered a :=
    (Finset.card_le_card hsub').trans Finset.card_biUnion_le
  calc
    uncovered.card ≤ ∑ a∈remaining, gain cover uncovered a := hsum
    _ ≤ ∑ a∈remaining, (threshold+(gain cover uncovered a-threshold)) := by
      apply Finset.sum_le_sum
      intro a _ha
      omega
    _ = remaining.card*threshold + ∑ a∈remaining, (gain cover uncovered a-threshold) := by
      simp [Finset.sum_add_distrib]
    _ ≤ slots*threshold + ∑ a∈available, (gain cover uncovered a-threshold) := by
      apply Nat.add_le_add
      · exact Nat.mul_le_mul_right threshold hcard
      · exact Finset.sum_le_sum_of_subset_of_nonneg hsub (by intro a _ _; exact Nat.zero_le _)
    _ = capacity cover available uncovered slots threshold := rfl

def afterChoice (compatible : ℕ → ℕ → Bool) (available : Finset ℕ) (a : ℕ) :
    Finset ℕ :=
  (available.erase a).filter (fun b => compatible a b=true)

private theorem target_after_choice (selected remaining : Finset ℕ) {a : ℕ}
    (ha : a∈remaining) : insert a selected ∪ remaining.erase a = selected ∪ remaining := by
  ext b
  by_cases hb : b=a
  · subst b
    simp [ha]
  · simp [Finset.mem_union,Finset.mem_insert,Finset.mem_erase,hb]

private theorem covered_after_choice (cover : ℕ → Finset ℕ)
    {uncovered remaining : Finset ℕ} (a : ℕ)
    (hcover : uncovered⊆remaining.biUnion cover) :
    uncovered \ cover a ⊆ (remaining.erase a).biUnion cover := by
  intro t ht
  obtain ⟨htu,hta⟩ := Finset.mem_sdiff.mp ht
  obtain ⟨b,hb,htb⟩ := Finset.mem_biUnion.mp (hcover htu)
  have hba : b≠a := by
    intro h
    subst b
    exact hta htb
  exact Finset.mem_biUnion.mpr ⟨b,Finset.mem_erase.mpr ⟨hba,hb⟩,htb⟩

inductive Tree where
  | reject
  | retained (index : ℕ)
  | witness (time : ℕ)
  | capacity (threshold : ℕ)
  | incompatible (first second : ℕ)
  | split (candidate : ℕ) (without withCandidate : Tree)

def check (cover : ℕ → Finset ℕ) (compatible : ℕ → ℕ → Bool)
    (terminal : Finset ℕ → ℕ → Bool) :
    Tree → Finset ℕ → Finset ℕ → Finset ℕ → ℕ → Bool
  | .reject, _, _, _, _ => false
  | .retained index, selected, available, _, slots =>
      decide (slots=0 ∨ available=∅) && terminal selected index
  | .witness t, _, available, uncovered, _ =>
      decide (t∈uncovered ∧ ∀ a∈available, t∉cover a)
  | .capacity threshold, _, available, uncovered, slots =>
      decide (capacity cover available uncovered slots threshold < uncovered.card)
  | .incompatible a b, selected, _, _, _ =>
      decide (a∈selected ∧ b∈selected ∧ a≠b ∧ compatible a b=false)
  | .split a without withCandidate, selected, available, uncovered, slots =>
      decide (a∈available ∧ 0<slots) &&
        (check cover compatible terminal without selected (available.erase a) uncovered slots &&
          check cover compatible terminal withCandidate (insert a selected)
            (afterChoice compatible available a) (uncovered \ cover a) (slots-1))

/-- Every compatible completion of a checked finite state is classified by
its retained-leaf predicate. Branching is exhaustive by membership of the
chosen candidate; the producer's uncovered-time heuristic is not trusted. -/
theorem check_sound (cover : ℕ → Finset ℕ) (compatible : ℕ → ℕ → Bool)
    (terminal : Finset ℕ → ℕ → Bool) (conclusion : Finset ℕ → Prop)
    (hterminal : ∀ s index, terminal s index=true → conclusion s) (tree : Tree) :
    ∀ selected available uncovered slots,
      check cover compatible terminal tree selected available uncovered slots=true →
      ∀ remaining, remaining⊆available → remaining.card≤slots →
        uncovered⊆remaining.biUnion cover → Compatible compatible (selected ∪ remaining) →
        conclusion (selected ∪ remaining) := by
  induction tree with
  | reject =>
    intro selected available uncovered slots hcheck remaining hsub hcard hcover hcompatible
    cases hcheck
  | retained index =>
    intro selected available uncovered slots hcheck remaining hsub hcard _hcover _hcompatible
    have hh := Bool.and_eq_true_iff.mp hcheck
    have hf : slots=0 ∨ available=∅ := of_decide_eq_true hh.1
    have hr : remaining=∅ := by
      rcases hf with hf | hf
      · apply Finset.card_eq_zero.mp
        omega
      · apply Finset.eq_empty_iff_forall_not_mem.mpr
        intro a ha
        have hh := hsub ha
        simpa only [hf,Finset.not_mem_empty] using hh
    simpa only [hr,Finset.union_empty] using hterminal selected index hh.2
  | witness t =>
    intro selected available uncovered slots hcheck remaining hsub _hcard hcover _hcompatible
    have hh : t∈uncovered ∧ ∀ a∈available, t∉cover a := of_decide_eq_true hcheck
    obtain ⟨a,ha,hat⟩ := Finset.mem_biUnion.mp (hcover hh.1)
    exact False.elim (hh.2 a (hsub ha) hat)
  | capacity threshold =>
    intro selected available uncovered slots hcheck remaining hsub hcard hcover _hcompatible
    have hh : capacity cover available uncovered slots threshold < uncovered.card :=
      of_decide_eq_true hcheck
    exact False.elim ((not_lt_of_ge
      (coverage_card_le_capacity cover available uncovered remaining slots threshold hsub hcard hcover)) hh)
  | incompatible a b =>
    intro selected available uncovered slots hcheck remaining _hsub _hcard _hcover hcompatible
    have hh : a∈selected ∧ b∈selected ∧ a≠b ∧ compatible a b=false :=
      of_decide_eq_true hcheck
    have ht := hcompatible a (Finset.mem_union_left remaining hh.1)
      b (Finset.mem_union_left remaining hh.2.1) hh.2.2.1
    simp only [hh.2.2.2,Bool.false_eq_true] at ht
  | split a without withCandidate ihwithout ihwith =>
    intro selected available uncovered slots hcheck remaining hsub hcard hcover hcompatible
    have hh := Bool.and_eq_true_iff.mp hcheck
    have hchildren := Bool.and_eq_true_iff.mp hh.2
    by_cases ha : a∈remaining
    · have htarget := target_after_choice selected remaining ha
      have hsub' : remaining.erase a ⊆ afterChoice compatible available a := by
        intro b hb
        obtain ⟨hba,hbr⟩ := Finset.mem_erase.mp hb
        apply Finset.mem_filter.mpr
        refine ⟨Finset.mem_erase.mpr ⟨hba,hsub hbr⟩,?_⟩
        exact hcompatible a (Finset.mem_union_right selected ha)
          b (Finset.mem_union_right selected hbr) (Ne.symm hba)
      have hcard' : (remaining.erase a).card≤slots-1 := by
        rw [Finset.card_erase_of_mem ha]
        omega
      have hc' : Compatible compatible (insert a selected ∪ remaining.erase a) := by
        simpa only [htarget] using hcompatible
      have hout := ihwith (insert a selected) (afterChoice compatible available a)
        (uncovered \ cover a) (slots-1) hchildren.2 (remaining.erase a)
        hsub' hcard' (covered_after_choice cover a hcover) hc'
      simpa only [htarget] using hout
    · have hsub' : remaining⊆available.erase a := by
        intro b hb
        apply Finset.mem_erase.mpr
        refine ⟨?_,hsub hb⟩
        intro h
        subst b
        exact ha hb
      exact ihwithout selected (available.erase a) uncovered slots hchildren.1
        remaining hsub' hcard hcover hcompatible

/-- A checked search at selected prefix `selected` covers any full target
whose remaining support fits the supplied state. -/
theorem checked_target (cover : ℕ → Finset ℕ) (compatible : ℕ → ℕ → Bool)
    (terminal : Finset ℕ → ℕ → Bool) (conclusion : Finset ℕ → Prop)
    (hterminal : ∀ s index, terminal s index=true → conclusion s)
    (tree : Tree) (selected available uncovered target : Finset ℕ) (slots : ℕ)
    (hcheck : check cover compatible terminal tree selected available uncovered slots=true)
    (hselected : selected⊆target) (hsub : target \ selected ⊆ available)
    (hcard : (target \ selected).card≤slots)
    (hcover : uncovered⊆(target \ selected).biUnion cover)
    (hcompatible : Compatible compatible target) : conclusion target := by
  have heq : selected ∪ target \ selected = target := by
    rw [Finset.union_sdiff_self_eq_union,Finset.union_eq_right.mpr hselected]
  have hh := check_sound cover compatible terminal conclusion hterminal tree selected available
    uncovered slots hcheck (target \ selected) hsub hcard hcover
    (by simpa only [heq] using hcompatible)
  simpa only [heq] using hh

/-- A bounded producer can be checked directly without storing a separate
constant for every expanded tree node. Exhausting its fuel rejects the
certificate, so its termination or completeness is never an assumption. -/
structure State where
  selected : Finset ℕ
  available : Finset ℕ
  uncovered : Finset ℕ
  slots : ℕ
  deriving DecidableEq

inductive Instruction where
  | reject
  | retained (index : ℕ)
  | witness (time : ℕ)
  | capacity (threshold : ℕ)
  | incompatible (first second : ℕ)
  | split (candidate : ℕ)

def absentState (state : State) (a : ℕ) : State :=
  {state with available := state.available.erase a}

def presentState (cover : ℕ → Finset ℕ) (compatible : ℕ → ℕ → Bool)
    (state : State) (a : ℕ) : State :=
  {selected := insert a state.selected,
   available := afterChoice compatible state.available a,
   uncovered := state.uncovered \ cover a,
   slots := state.slots-1}

def generate (cover : ℕ → Finset ℕ) (compatible : ℕ → ℕ → Bool)
    (strategy : State → Instruction) : ℕ → State → Tree
  | 0, _ => .reject
  | fuel+1, state =>
      match strategy state with
      | .reject => .reject
      | .retained index => .retained index
      | .witness t => .witness t
      | .capacity threshold => .capacity threshold
      | .incompatible a b => .incompatible a b
      | .split a => .split a
          (generate cover compatible strategy fuel (absentState state a))
          (generate cover compatible strategy fuel (presentState cover compatible state a))

def boundedCheck (cover : ℕ → Finset ℕ) (compatible : ℕ → ℕ → Bool)
    (terminal : Finset ℕ → ℕ → Bool) (strategy : State → Instruction) :
    ℕ → State → Bool
  | 0, _ => false
  | fuel+1, state =>
      match strategy state with
      | .reject => false
      | .retained index => check cover compatible terminal (.retained index)
          state.selected state.available state.uncovered state.slots
      | .witness t => check cover compatible terminal (.witness t)
          state.selected state.available state.uncovered state.slots
      | .capacity threshold => check cover compatible terminal (.capacity threshold)
          state.selected state.available state.uncovered state.slots
      | .incompatible a b => check cover compatible terminal (.incompatible a b)
          state.selected state.available state.uncovered state.slots
      | .split a => decide (a∈state.available ∧ 0<state.slots) &&
          (boundedCheck cover compatible terminal strategy fuel (absentState state a) &&
            boundedCheck cover compatible terminal strategy fuel (presentState cover compatible state a))

theorem boundedCheck_eq (cover : ℕ → Finset ℕ) (compatible : ℕ → ℕ → Bool)
    (terminal : Finset ℕ → ℕ → Bool) (strategy : State → Instruction) (fuel : ℕ)
    (state : State) :
    boundedCheck cover compatible terminal strategy fuel state =
      check cover compatible terminal (generate cover compatible strategy fuel state)
        state.selected state.available state.uncovered state.slots := by
  induction fuel generalizing state with
  | zero => rfl
  | succ fuel ih =>
    cases hs : strategy state <;>
      simp only [boundedCheck,generate,hs,check,ih,absentState,presentState]

theorem boundedCheck_sound (cover : ℕ → Finset ℕ) (compatible : ℕ → ℕ → Bool)
    (terminal : Finset ℕ → ℕ → Bool) (conclusion : Finset ℕ → Prop)
    (hterminal : ∀ s index, terminal s index=true → conclusion s)
    (strategy : State → Instruction) (fuel : ℕ) (state : State)
    (hcheck : boundedCheck cover compatible terminal strategy fuel state=true)
    (remaining : Finset ℕ) (hsub : remaining⊆state.available)
    (hcard : remaining.card≤state.slots)
    (hcover : state.uncovered⊆remaining.biUnion cover)
    (hcompatible : Compatible compatible (state.selected ∪ remaining)) :
    conclusion (state.selected ∪ remaining) := by
  rw [boundedCheck_eq] at hcheck
  exact check_sound cover compatible terminal conclusion hterminal
    (generate cover compatible strategy fuel state) state.selected state.available
    state.uncovered state.slots hcheck remaining hsub hcard hcover hcompatible

def exampleCover (a : ℕ) : Finset ℕ :=
  if a=1 then {0} else if a=2 then {1} else ∅

def exampleTerminal (s : Finset ℕ) (index : ℕ) : Bool :=
  decide (index=0 ∧ s={1,2})

def exampleTree : Tree :=
  .split 1 (.witness 0) (.split 2 (.witness 1) (.retained 0))

theorem example_checked :
    check exampleCover (fun _ _ => true) exampleTerminal exampleTree ∅ {1,2} {0,1} 2=true := by
  decide +kernel

/-- This small certificate covers every subset, not only a displayed list
of possible covers. -/
theorem example_complete (s : Finset ℕ) (hsub : s⊆{1,2}) (hcard : s.card≤2)
    (hcover : ({0,1}:Finset ℕ)⊆s.biUnion exampleCover) : s={1,2} := by
  have ht : ∀ s index, exampleTerminal s index=true → s={1,2} := by
    intro s index h
    exact (of_decide_eq_true h).2
  have hh := check_sound exampleCover (fun _ _ => true) exampleTerminal
    (fun s => s={1,2}) ht exampleTree ∅ {1,2} {0,1} 2 example_checked
    s hsub hcard hcover (by intro a _ b _ _; rfl)
  simpa only [Finset.empty_union] using hh

def capacityExampleCover (a : ℕ) : Finset ℕ :=
  if a=1 then {0,1} else if a=2 then {1,2} else ∅

theorem capacity_example_checked :
    check capacityExampleCover (fun _ _ => true) (fun _ _ => false)
      (.capacity 2) ∅ {1,2} {0,1,2} 1=true := by
  decide +kernel

def exampleStrategy (state : State) : Instruction :=
  if 0∈state.uncovered then
    if 1∈state.available then .split 1 else .witness 0
  else if 1∈state.uncovered then
    if 2∈state.available then .split 2 else .witness 1
  else .retained 0

theorem bounded_example_checked :
    boundedCheck exampleCover (fun _ _ => true) exampleTerminal exampleStrategy 3
      ⟨∅,{1,2},{0,1},2⟩=true := by
  decide +kernel

end Loneliness.Modular.SupportSearch
