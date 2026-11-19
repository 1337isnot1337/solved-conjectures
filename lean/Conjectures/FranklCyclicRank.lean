module

public import Conjectures.FranklFamily
public meta import Lean.Elab.Tactic.Omega

/-! A finite rank certificate safely removes edges outside recurrent
components. Every edge of every closed walk remains in the retained set. -/
@[expose] public section

namespace FranklCyclic

variable {V : Type*} [DecidableEq V]

def RankCertificate (edges keep : Finset (V × V)) (rank : V → ℕ) : Prop :=
  ∀ e ∈ edges, rank e.2 ≤ rank e.1 ∧ (rank e.2=rank e.1 → e ∈ keep)

def rankCertificateCheck (edges keep : Finset (V × V)) (rank : V → ℕ) : Bool :=
  decide (∀ e ∈ edges, rank e.2 ≤ rank e.1 ∧ (rank e.2=rank e.1 → e ∈ keep))

theorem rankCertificateCheck_sound {edges keep : Finset (V × V)} {rank : V → ℕ}
    (h : rankCertificateCheck edges keep rank=true) : RankCertificate edges keep rank := by
  change ∀ e ∈ edges, rank e.2 ≤ rank e.1 ∧ (rank e.2=rank e.1 → e ∈ keep)
  exact of_decide_eq_true h

theorem nonincreasing_closed_constant (r : ℕ → ℕ) (n : ℕ)
    (hstep : ∀ i < n, r (i+1) ≤ r i) (hclose : r n=r 0) :
    ∀ i ≤ n, r i=r 0 := by
  have hsegment : ∀ k i : ℕ, i+k ≤ n → r (i+k) ≤ r i := by
    intro k
    induction k with
    | zero => intro i _; exact le_rfl
    | succ k ih =>
      intro i hik
      exact (hstep (i+k) (by omega)).trans (ih i (by omega))
  intro i hi
  have hupper : r i ≤ r 0 := by
    simpa only [Nat.zero_add] using hsegment i 0 (by simpa only [Nat.zero_add] using hi)
  have hlower := hsegment (n-i) i (by omega)
  rw [Nat.add_sub_of_le hi,hclose] at hlower
  exact Nat.le_antisymm hupper hlower

omit [DecidableEq V] in
theorem closed_walk_edges_in_keep {edges keep : Finset (V × V)} {rank : V → ℕ}
    (hcert : RankCertificate edges keep rank) (v : ℕ → V) (n : ℕ)
    (hclose : v n=v 0) (hwalk : ∀ i < n, (v i,v (i+1)) ∈ edges) :
    ∀ i < n, (v i,v (i+1)) ∈ keep := by
  have hconstant := nonincreasing_closed_constant (fun i => rank (v i)) n
    (fun i hi => (hcert _ (hwalk i hi)).1) (congrArg rank hclose)
  intro i hi
  exact (hcert _ (hwalk i hi)).2
    ((hconstant (i+1) (by omega)).trans (hconstant i (by omega)).symm)

theorem checked_closed_walk_edges {edges keep : Finset (V × V)} {rank : V → ℕ}
    (hc : rankCertificateCheck edges keep rank=true) (v : ℕ → V) (n : ℕ)
    (hclose : v n=v 0) (hwalk : ∀ i < n, (v i,v (i+1)) ∈ edges) :
    ∀ i < n, (v i,v (i+1)) ∈ keep :=
  closed_walk_edges_in_keep (rankCertificateCheck_sound hc) v n hclose hwalk

/-- If all retained edges form the one distinguished loop, every closed
walk in the original edge set uses that loop at each step. -/
theorem checked_closed_walk_single_loop {edges : Finset (V × V)} {rank : V → ℕ}
    (z : V) (hc : rankCertificateCheck edges {(z,z)} rank=true)
    (v : ℕ → V) (n : ℕ) (hclose : v n=v 0)
    (hwalk : ∀ i < n, (v i,v (i+1)) ∈ edges) :
    ∀ i < n, v i=z ∧ v (i+1)=z := by
  intro i hi
  have h := checked_closed_walk_edges hc v n hclose hwalk i hi
  simpa only [Finset.mem_singleton,Prod.mk.injEq] using h

/-- A nonconstant closed walk cannot avoid every successful edge when the
remaining edge set has a verified rank certificate retaining one loop. -/
theorem checked_closed_walk_has_success
    (edges : Finset (V × V)) (success : V × V → Prop) [DecidablePred success]
    (rank : V → ℕ) (z : V)
    (hc : rankCertificateCheck (edges.filter (fun e => ¬ success e)) {(z,z)} rank=true)
    (v : ℕ → V) (n : ℕ) (hclose : v n=v 0)
    (hwalk : ∀ i < n, (v i,v (i+1)) ∈ edges)
    (hnonzero : ∃ i < n, v i ≠ z) :
    ∃ i < n, success (v i,v (i+1)) := by
  by_contra hnone
  have hbad : ∀ i < n, (v i,v (i+1)) ∈ edges.filter (fun e => ¬ success e) := by
    intro i hi
    exact Finset.mem_filter.mpr ⟨hwalk i hi,fun h => hnone ⟨i,hi,h⟩⟩
  obtain ⟨i,hi,hiz⟩ := hnonzero
  exact hiz (checked_closed_walk_single_loop z hc v n hclose hbad i hi).1

end FranklCyclic
