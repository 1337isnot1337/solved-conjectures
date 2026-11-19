module

public import Conjectures.FranklCyclicRank

/-! Streaming rank checks over an edge list. Vertices and retained-edge
predicates may use encoded words and indexed lookup tables. -/
@[expose] public section

namespace FranklCyclic

variable {V : Type*}

def rankListCheck (edges : List (V × V)) (keep : V × V → Bool) (rank : V → ℕ) : Bool :=
  edges.all (fun e => decide (rank e.2 ≤ rank e.1) &&
    (decide (rank e.2 ≠ rank e.1) || keep e))

theorem rankListCheck_sound {edges : List (V × V)} {keep : V × V → Bool}
    {rank : V → ℕ} (hc : rankListCheck edges keep rank=true) :
    ∀ e ∈ edges, rank e.2 ≤ rank e.1 ∧ (rank e.2=rank e.1 → keep e=true) := by
  intro e he
  have hrow := List.all_eq_true.mp hc e he
  obtain ⟨hweak,hrest⟩ := Bool.and_eq_true_iff.mp hrow
  refine ⟨of_decide_eq_true hweak,?_⟩
  intro heq
  rcases Bool.or_eq_true_iff.mp hrest with hstrict | hkeep
  · exact False.elim ((of_decide_eq_true hstrict) heq)
  · exact hkeep

theorem checked_list_closed_walk_edges {edges : List (V × V)} {keep : V × V → Bool}
    {rank : V → ℕ} (hc : rankListCheck edges keep rank=true)
    (v : ℕ → V) (n : ℕ) (hclose : v n=v 0)
    (hwalk : ∀ i < n, (v i,v (i+1)) ∈ edges) :
    ∀ i < n, keep (v i,v (i+1))=true := by
  have hcert := rankListCheck_sound hc
  have hconstant := nonincreasing_closed_constant (fun i => rank (v i)) n
    (fun i hi => (hcert _ (hwalk i hi)).1) (congrArg rank hclose)
  intro i hi
  exact (hcert _ (hwalk i hi)).2
    ((hconstant (i+1) (by omega)).trans (hconstant i (by omega)).symm)

theorem checked_list_closed_walk_zero [DecidableEq V]
    {edges : List (V × V)} {rank : V → ℕ}
    (z : V) (hc : rankListCheck edges (fun e => decide (e=(z,z))) rank=true)
    (v : ℕ → V) (n : ℕ) (hclose : v n=v 0)
    (hwalk : ∀ i < n, (v i,v (i+1)) ∈ edges) :
    ∀ i < n, v i=z ∧ v (i+1)=z := by
  intro i hi
  have h : (v i,v (i+1))=(z,z) :=
    of_decide_eq_true (checked_list_closed_walk_edges hc v n hclose hwalk i hi)
  exact Prod.mk.inj h

end FranklCyclic
