import Conjectures.BraunBrueggeMinimumCompact
import Mathlib.Combinatorics.SimpleGraph.Acyclic
import Mathlib.Combinatorics.SimpleGraph.CycleGraph

/-! A cycle's tight-edge graph is connected precisely when at most one
cyclic step is slack. The graph here is Mathlib's cycle on `Fin (n+3)`. -/

open Set
open scoped Sym2

namespace BraunBruegge

variable {n : ℕ}

theorem cycle_adj_step {u v : Fin (n + 3)} :
    (SimpleGraph.cycleGraph (n + 3)).Adj u v ↔ v = u + 1 ∨ u = v + 1 := by
  change (u - v = 1 ∨ v - u = 1) ↔ _
  rw [sub_eq_iff_eq_add, sub_eq_iff_eq_add, or_comm]
  simp only [add_comm (1 : Fin (n + 3))]

theorem cycle_next_adj (i : Fin (n + 3)) : (SimpleGraph.cycleGraph (n + 3)).Adj i (i + 1) :=
  cycle_adj_step.mpr (Or.inl rfl)

private theorem cycle_step_edge_injective :
    Function.Injective (fun i : Fin (n + 3) => s(i, i + 1)) := by
  intro i j he
  rcases Sym2.eq_iff.mp he with ⟨h, _⟩ | ⟨h₁, h₂⟩
  · exact h
  · have he' : i + (1 + 1) = i + 0 := by
      simpa only [← add_assoc, h₂, add_zero] using h₁.symm
    have hzero : (1 : Fin (n + 3)) + 1 = 0 := add_left_cancel he'
    have hz := congrArg Fin.val hzero
    rw [Fin.val_add_one_of_lt' (by simp), Fin.val_zero] at hz
    simp at hz

noncomputable def cycleStepsEquivEdges (G : SimpleGraph (Fin (n + 3)))
    (hG : G ≤ SimpleGraph.cycleGraph (n + 3)) : {i // G.Adj i (i + 1)} ≃ G.edgeSet := by
  let f (i : {i // G.Adj i (i + 1)}) : G.edgeSet := ⟨s(i.val, i.val + 1), i.property⟩
  apply Equiv.ofBijective f
  refine ⟨?_, ?_⟩
  · intro i j h
    exact Subtype.ext (cycle_step_edge_injective (congrArg Subtype.val h))
  · rintro ⟨e, he⟩
    induction e using Sym2.inductionOn with
    | hf u v =>
      have he' : G.Adj u v := he
      rcases cycle_adj_step.mp (hG he') with h | h
      · subst v
        exact ⟨⟨u, he'⟩, rfl⟩
      · subst u
        exact ⟨⟨v, he'.symm⟩, Subtype.ext (Sym2.eq_swap)⟩

theorem cycle_edge_card (n : ℕ) : Nat.card (SimpleGraph.cycleGraph (n + 3)).edgeSet = n + 3 := by
  let e : {i // (SimpleGraph.cycleGraph (n + 3)).Adj i (i + 1)} ≃ Fin (n + 3) :=
    ⟨Subtype.val, fun i => ⟨i, cycle_next_adj i⟩, fun _ => rfl, fun _ => rfl⟩
  rw [← Nat.card_congr (cycleStepsEquivEdges _ le_rfl), Nat.card_congr e, Nat.card_fin]

private theorem rotate_away_from_missing_step (T : SimpleGraph (Fin (n + 3))) (s : Fin (n + 3))
    (ht : ∀ i, i ≠ s → T.Adj i (i + 1)) : T.Connected := by
  let e : Fin (n + 3) ≃ Fin (n + 3) :=
    ⟨fun i => i + (s + 1), fun i => i - (s + 1), by intro i; simp, by intro i; simp⟩
  have hstep (i j : Fin (n + 3)) (h : i.val + 1 = j.val) : T.Adj (e i) (e j) := by
    have hi : i.val + 1 < n + 3 := h ▸ j.isLt
    have hj : j = i + 1 := Fin.ext (h.symm.trans (Fin.val_add_one_of_lt' hi).symm)
    have hne : e i ≠ s := by
      intro he
      change i + (s + 1) = s at he
      have h₀ : (i + 1) + s = 0 + s := by
        simpa only [add_assoc, add_comm (1 : Fin (n + 3)) s, zero_add] using he
      have hz := congrArg Fin.val (add_right_cancel h₀)
      rw [Fin.val_add_one_of_lt' hi, Fin.val_zero] at hz
      omega
    have heq : e j = e i + 1 := by rw [hj]; change (i + 1) + (s + 1) = (i + (s + 1)) + 1; ac_rfl
    exact heq.symm ▸ ht (e i) hne
  let f : SimpleGraph.pathGraph (n + 3) →g T := {
    toFun := e
    map_rel' := by
      intro u v he
      rcases SimpleGraph.pathGraph_adj.mp he with h | h
      · exact hstep u v h
      · exact (hstep v u h).symm }
  exact (SimpleGraph.connected_pathGraph_add_one (n + 2)).map f e.surjective

theorem tight_cycle_connected_iff (f : Fin (n + 3) → ℝ) :
    (tightGraph (SimpleGraph.cycleGraph (n + 3)) f).Connected ↔
      ∀ i j : Fin (n + 3), |f (i + 1) - f i| ≠ 1 → |f (j + 1) - f j| ≠ 1 → i = j := by
  classical
  let T := tightGraph (SimpleGraph.cycleGraph (n + 3)) f
  let P (i : Fin (n + 3)) := T.Adj i (i + 1)
  have hp (i : Fin (n + 3)) : P i ↔ |f (i + 1) - f i| = 1 := by
    change ((SimpleGraph.cycleGraph (n + 3)).Adj i (i + 1) ∧ |f i - f (i + 1)| = 1) ↔ _
    rw [abs_sub_comm]
    exact and_iff_right (cycle_next_adj i)
  have hnP (i : Fin (n + 3)) : (|f (i + 1) - f i| ≠ 1) ↔ ¬P i := not_congr (hp i).symm
  simp_rw [hnP]
  constructor
  · intro h
    have hle : T ≤ SimpleGraph.cycleGraph (n + 3) := fun _ _ e => e.1
    have hcard : Nat.card {i // P i} = Nat.card T.edgeSet :=
      Nat.card_congr (cycleStepsEquivEdges T hle)
    have hsum := Nat.card_congr (Equiv.sumCompl P)
    have he := h.card_vert_le_card_edgeSet_add_one
    rw [Nat.card_sum, Nat.card_fin] at hsum
    rw [Nat.card_fin, ← hcard] at he
    change n + 3 ≤ Nat.card {i // P i} + 1 at he
    have hcomp : Nat.card {i // ¬P i} ≤ 1 := by omega
    let : Fintype {i // ¬P i} := Fintype.ofFinite _
    rw [Nat.card_eq_fintype_card, Fintype.card_le_one_iff] at hcomp
    intro i j hi hj
    exact congrArg Subtype.val (hcomp ⟨i, hi⟩ ⟨j, hj⟩)
  · intro h
    by_cases hex : ∃ s, ¬P s
    · obtain ⟨s, hs⟩ := hex
      exact rotate_away_from_missing_step T s (fun i hne => by
        by_contra hi
        exact hne (h i s hi hs))
    · push Not at hex
      exact rotate_away_from_missing_step T 0 (fun i _ => hex i)

end BraunBruegge
