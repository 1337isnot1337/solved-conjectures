import Conjectures.ErdosGyarfasSharpSearch

/-!
# Exact decomposition of the finite cycle search

The frontier lists every state reached after a fixed number of extensions by
unvisited neighbors. A successful prefix search and successful searches from
every frontier state imply success of the original search at the combined
depth. This lets independent kernel certificates cover smaller subtrees while
preserving the original `dfsSafe` statements and their proved graph semantics.
-/

namespace ErdosGyarfasSharp

variable {V : Type*}

/-- Every search state at the specified depth, with the same neighbor and
visited-list conventions as `dfsSafe`. -/
def dfsFrontier [DecidableEq V] (N : V → List V)
    (current : V) (seen : List V) : ℕ → List (V × List V)
  | 0 => [(current, seen)]
  | depth + 1 =>
      (N current).flatMap fun next =>
        if next ∈ seen then []
        else dfsFrontier N next (next :: seen) depth

/-- Successful prefix and frontier checks reconstruct success of the entire
search. The prefix check includes all early closures, even when the cut depth
passes a forbidden cycle length. -/
theorem dfsSafe_of_frontier [DecidableEq V] (N : V → List V)
    (targets : List ℕ) {root current : V} {seen : List V} {depth fuel : ℕ}
    (hprefix : dfsSafe N targets root current seen depth = true)
    (hfrontier : ∀ state ∈ dfsFrontier N current seen depth,
      dfsSafe N targets root state.1 state.2 fuel = true) :
    dfsSafe N targets root current seen (depth + fuel) = true := by
  induction depth generalizing current seen with
  | zero =>
      simpa only [Nat.zero_add] using
        hfrontier (current, seen) (by simp only [dfsFrontier, List.mem_singleton])
  | succ depth ih =>
      have hclose : ¬ (seen.length ∈ targets ∧ root ∈ N current) := by
        intro h
        simp only [dfsSafe, ite_eq_left h, Bool.false_eq_true] at hprefix
      have hprefAll : ∀ next ∈ N current,
          (if next ∈ seen then true
           else dfsSafe N targets root next (next :: seen) depth) = true := by
        simpa only [dfsSafe, ite_eq_right hclose, List.all_eq_true] using hprefix
      simp only [Nat.succ_add, dfsSafe, ite_eq_right hclose, List.all_eq_true]
      intro next hnext
      by_cases hseen : next ∈ seen
      · simp only [ite_eq_left hseen]
      · simp only [ite_eq_right hseen]
        apply ih
        · simpa only [ite_eq_right hseen] using hprefAll next hnext
        · intro state hstate
          apply hfrontier state
          simp only [dfsFrontier, List.mem_flatMap]
          exact ⟨next, hnext, by simpa only [ite_eq_right hseen] using hstate⟩

/-- Boolean-list interface for assembling concrete subtree certificates.
After exposing the finite frontier list, rewrite each subtree with its proved
certificate instead of recomputing all subtrees in one kernel reduction. -/
theorem dfsSafe_of_frontier_all [DecidableEq V] (N : V → List V)
    (targets : List ℕ) {root current : V} {seen : List V} {depth fuel : ℕ}
    (hprefix : dfsSafe N targets root current seen depth = true)
    (hfrontier : (dfsFrontier N current seen depth).all
      (fun state => dfsSafe N targets root state.1 state.2 fuel) = true) :
    dfsSafe N targets root current seen (depth + fuel) = true :=
  dfsSafe_of_frontier N targets hprefix (List.all_eq_true.mp hfrontier)

end ErdosGyarfasSharp
