import Conjectures.LonelinessModularCoverChunks

/-! A bounded support certificate stored as an instruction table. The
checker follows supplied child indices with decreasing fuel. Thus a bad
index, cyclic table, or incomplete producer cannot manufacture a proof:
the corresponding finite numerical check must still return true. Tables
may use balanced lookup without changing the logical interface. -/

namespace Loneliness.Modular.SupportSearch.Tape

inductive Node where
  | leaf (certificate : SupportSearch.Tree)
  | split (candidate without withCandidate : ℕ)

def toTree (lookup : ℕ → Node) : ℕ → ℕ → SupportSearch.Tree
  | 0, _ => .reject
  | fuel+1, index =>
      match lookup index with
      | .leaf certificate => certificate
      | .split a without withCandidate =>
          .split a (toTree lookup fuel without) (toTree lookup fuel withCandidate)

def check (cover : ℕ → Finset ℕ) (compatible : ℕ → ℕ → Bool)
    (terminal : Finset ℕ → ℕ → Bool) (lookup : ℕ → Node) :
    ℕ → ℕ → State → Bool
  | 0, _, _ => false
  | fuel+1, index, state =>
      match lookup index with
      | .leaf certificate => SupportSearch.check cover compatible terminal certificate
          state.selected state.available state.uncovered state.slots
      | .split a without withCandidate =>
          decide (a∈state.available ∧ 0<state.slots) &&
            (check cover compatible terminal lookup fuel without (absentState state a) &&
              check cover compatible terminal lookup fuel withCandidate
                (presentState cover compatible state a))

theorem check_eq (cover : ℕ → Finset ℕ) (compatible : ℕ → ℕ → Bool)
    (terminal : Finset ℕ → ℕ → Bool) (lookup : ℕ → Node)
    (fuel index : ℕ) (state : State) :
    check cover compatible terminal lookup fuel index state =
      SupportSearch.check cover compatible terminal (toTree lookup fuel index)
        state.selected state.available state.uncovered state.slots := by
  induction fuel generalizing index state with
  | zero => rfl
  | succ fuel ih =>
    cases hn : lookup index <;>
      simp only [check,toTree,hn,SupportSearch.check,ih,absentState,presentState]

theorem checked_state (cover : ℕ → Finset ℕ) (compatible : ℕ → ℕ → Bool)
    (terminal : Finset ℕ → ℕ → Bool) (conclusion : Finset ℕ → Prop)
    (hterminal : ∀ s index, terminal s index=true → conclusion s)
    (lookup : ℕ → Node) (fuel index : ℕ) (state : State)
    (hcheck : check cover compatible terminal lookup fuel index state=true) :
    Chunks.StateSound cover compatible conclusion state := by
  rw [check_eq] at hcheck
  exact SupportSearch.check_sound cover compatible terminal conclusion hterminal
    (toTree lookup fuel index) state.selected state.available state.uncovered state.slots hcheck

def exampleLookup : ℕ → Node
  | 0 => .split 1 1 2
  | 1 => .leaf (.witness 0)
  | 2 => .split 2 3 4
  | 3 => .leaf (.witness 1)
  | 4 => .leaf (.retained 0)
  | _ => .leaf .reject

theorem example_checked :
    check exampleCover (fun _ _ => true) exampleTerminal exampleLookup 3 0
      ⟨∅,{1,2},{0,1},2⟩=true := by
  decide +kernel

theorem example_complete (s : Finset ℕ) (hsub : s⊆{1,2}) (hcard : s.card≤2)
    (hcover : ({0,1}:Finset ℕ)⊆s.biUnion exampleCover) : s={1,2} := by
  have ht : ∀ s index, exampleTerminal s index=true → s={1,2} := by
    intro s index h
    exact (of_decide_eq_true h).2
  have hh := checked_state exampleCover (fun _ _ => true) exampleTerminal
    (fun s => s={1,2}) ht exampleLookup 3 0 ⟨∅,{1,2},{0,1},2⟩ example_checked
    s hsub hcard hcover (by intro a _ b _ _; rfl)
  simpa only [Finset.empty_union] using hh

end Loneliness.Modular.SupportSearch.Tape
