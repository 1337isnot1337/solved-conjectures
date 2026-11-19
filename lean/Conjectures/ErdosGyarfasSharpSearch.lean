import Mathlib.Combinatorics.SimpleGraph.Paths
import Lean.Elab.Tactic.Omega

/-!
# Soundness of a finite search for forbidden cycle lengths

The search records visited vertices and explores every neighbor not yet visited.
It rejects a state when the current vertex can close the search path to its root
at a forbidden length. The proofs relate this computation to actual paths and
cycles in `SimpleGraph`. Only completeness of the supplied neighbor lists is
required.
-/

namespace ErdosGyarfasSharp

variable {V : Type*}

/-- Check that no extension of the current visited path closes at a forbidden
length within the remaining number of edges. Visited vertices are prepended. -/
def dfsSafe [DecidableEq V] (N : V → List V) (targets : List ℕ)
    (root current : V) (seen : List V) : ℕ → Bool
  | 0 =>
      if seen.length ∈ targets ∧ root ∈ N current then false else true
  | fuel + 1 =>
      if seen.length ∈ targets ∧ root ∈ N current then false
      else (N current).all fun next =>
        if next ∈ seen then true
        else dfsSafe N targets root next (next :: seen) fuel

private theorem dfsSafe_no_close [DecidableEq V] {N : V → List V}
    {targets : List ℕ} {root current : V} {seen : List V} {fuel : ℕ}
    (hsafe : dfsSafe N targets root current seen fuel = true) :
    ¬ (seen.length ∈ targets ∧ root ∈ N current) := by
  intro hclose
  cases fuel <;> simp [dfsSafe, hclose] at hsafe

private theorem dfsSafe_next [DecidableEq V] {N : V → List V}
    {targets : List ℕ} {root current next : V} {seen : List V} {fuel : ℕ}
    (hsafe : dfsSafe N targets root current seen (fuel + 1) = true)
    (hnext : next ∈ N current) (hfresh : next ∉ seen) :
    dfsSafe N targets root next (next :: seen) fuel = true := by
  have hclose := dfsSafe_no_close hsafe
  have hall : (N current).all (fun next =>
      if next ∈ seen then true
      else dfsSafe N targets root next (next :: seen) fuel) = true := by
    simpa only [dfsSafe, ite_eq_right hclose] using hsafe
  have hnextSafe := List.all_eq_true.mp hall next hnext
  simpa only [ite_eq_right hfresh] using hnextSafe

private theorem path_start_not_mem_tail {G : SimpleGraph V} {u v : V}
    (p : G.Walk u v) (hp : p.IsPath) : u ∉ p.support.tail := by
  have hnodup := hp.support_nodup
  rw [← p.cons_tail_support, List.nodup_cons] at hnodup
  exact hnodup.1

/-- A successful search excludes every simple continuation which avoids the
visited vertices and closes to the root at a forbidden total length. -/
theorem dfsSafe_excludes_path [DecidableEq V] (N : V → List V)
    (targets : List ℕ) (G : SimpleGraph V)
    (hN : ∀ ⦃v w : V⦄, G.Adj v w → w ∈ N v)
    {fuel : ℕ} {root current last : V} {seen : List V}
    (hsafe : dfsSafe N targets root current seen fuel = true)
    (p : G.Walk current last) (hp : p.IsPath)
    (hfresh : p.support.tail.Disjoint seen) (hbound : p.length ≤ fuel)
    (hclose : G.Adj last root) (htarget : seen.length + p.length ∈ targets) : False := by
  induction fuel generalizing root current last seen with
  | zero =>
      cases p with
      | nil =>
          apply dfsSafe_no_close hsafe
          exact ⟨by simpa only [SimpleGraph.Walk.length_nil, Nat.add_zero] using htarget,
            hN hclose⟩
      | cons hadj p =>
          simp only [SimpleGraph.Walk.length_cons] at hbound
          omega
  | succ fuel ih =>
      cases p with
      | nil =>
          apply dfsSafe_no_close hsafe
          exact ⟨by simpa only [SimpleGraph.Walk.length_nil, Nat.add_zero] using htarget,
            hN hclose⟩
      | @cons current next last hadj p =>
          have hp' : p.IsPath := hp.of_cons
          have hdisjoint : p.support.Disjoint seen := by
            simpa only [SimpleGraph.Walk.support_cons, List.tail_cons] using hfresh
          have hnext : next ∉ seen := hdisjoint p.start_mem_support
          have hsafe' := dfsSafe_next hsafe (hN hadj) hnext
          have hfresh' : p.support.tail.Disjoint (next :: seen) := by
            rw [List.disjoint_cons_right]
            refine ⟨path_start_not_mem_tail p hp', ?_⟩
            intro x hx hseen
            exact hdisjoint (List.mem_of_mem_tail hx) hseen
          have hbound' : p.length ≤ fuel := by
            simpa only [SimpleGraph.Walk.length_cons, Nat.add_le_add_iff_right] using hbound
          have htarget' : (next :: seen).length + p.length ∈ targets := by
            simpa only [List.length_cons, SimpleGraph.Walk.length_cons,
              Nat.add_assoc, Nat.add_comm 1] using htarget
          exact ih hsafe' p hp' hfresh' hbound' hclose htarget'

/-- A successful search from a singleton root excludes actual cycles at every
forbidden length covered by its fuel. One search can cover several lengths. -/
theorem dfsSafe_excludes_cycle [DecidableEq V] (N : V → List V)
    (targets : List ℕ) (G : SimpleGraph V)
    (hN : ∀ ⦃v w : V⦄, G.Adj v w → w ∈ N v)
    {root : V} {fuel : ℕ}
    (hsafe : dfsSafe N targets root root [root] fuel = true)
    (p : G.Walk root root) (hp : p.IsCycle)
    (hbound : p.length - 1 ≤ fuel) (htarget : p.length ∈ targets) : False := by
  apply dfsSafe_excludes_path N targets G hN hsafe p.dropLast hp.isPath_dropLast
  · exact List.disjoint_singleton.mpr
      (path_start_not_mem_tail p.dropLast hp.isPath_dropLast)
  · simpa only [SimpleGraph.Walk.length_dropLast] using hbound
  · exact p.adj_penultimate hp.not_nil
  · change 1 + p.dropLast.length ∈ targets
    rw [Nat.add_comm, SimpleGraph.Walk.length_dropLast_add_one hp.not_nil]
    exact htarget

/-- A version of cycle exclusion with an explicit cycle length. -/
theorem dfsSafe_excludes_cycle_of_length [DecidableEq V] (N : V → List V)
    (targets : List ℕ) (G : SimpleGraph V)
    (hN : ∀ ⦃v w : V⦄, G.Adj v w → w ∈ N v)
    {root : V} {fuel n : ℕ}
    (hsafe : dfsSafe N targets root root [root] fuel = true)
    (p : G.Walk root root) (hp : p.IsCycle) (hlen : p.length = n)
    (hbound : n - 1 ≤ fuel) (htarget : n ∈ targets) : False := by
  apply dfsSafe_excludes_cycle N targets G hN hsafe p hp
  · simpa only [hlen] using hbound
  · simpa only [hlen] using htarget

end ErdosGyarfasSharp
