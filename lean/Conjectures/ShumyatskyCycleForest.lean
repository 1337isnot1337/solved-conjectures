module

public import Conjectures.ShumyatskyCyclicTransport
public import Mathlib.Combinatorics.SimpleGraph.Acyclic
public import Mathlib.Data.Set.Finite.Lemmas

/-! Cut the return edge in each cycle, yielding paths, and extend
these paths to a spanning tree when the two permutations act transitively.
This graph records undirected adjacencies. Directed edge representatives
and the choice of the reserved edges of the other cycles are separate. -/

@[expose] public section

namespace Shumyatsky

variable {ι C : Type*}

/-- The underlying simple graph of the two labelled moves. -/
def moveGraph (σ τ : Equiv.Perm ι) : SimpleGraph ι :=
  SimpleGraph.fromRel (fun i j => σ i = j ∨ τ i = j)

theorem moveGraph_connected [Nonempty ι] (σ τ : Equiv.Perm ι)
    (hTransitive : ∀ i j, ∃ p ∈ Subgroup.closure ({σ, τ} : Set (Equiv.Perm ι)), p i = j) :
    (moveGraph σ τ).Connected := by
  let G := moveGraph σ τ
  let K : Subgroup (Equiv.Perm ι) :=
    { carrier := {p | ∀ i, G.Reachable i (p i)}
      one_mem' := fun _ => SimpleGraph.Reachable.rfl
      mul_mem' := fun {_ q} hp hq i => (hq i).trans (hp (q i))
      inv_mem' := fun {p} hp i => by simpa using (hp (p.symm i)).symm }
  have hMove (i j : ι) (h : σ i = j ∨ τ i = j) : G.Reachable i j := by
    by_cases hEq : i = j
    · subst j
      exact SimpleGraph.Reachable.rfl
    · exact ((SimpleGraph.fromRel_adj _ _ _).2 ⟨hEq, Or.inl h⟩ :
        G.Adj i j).reachable
  have hStep (p : Equiv.Perm ι) (hp : p = σ ∨ p = τ) : p ∈ K := by
    rcases hp with rfl | rfl
    · intro i
      exact hMove i _ (Or.inl rfl)
    · intro i
      exact hMove i _ (Or.inr rfl)
  have hLe : Subgroup.closure ({σ, τ} : Set (Equiv.Perm ι)) ≤ K := by
    apply (Subgroup.closure_le K).2
    intro p hp
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hp
    exact hStep p hp
  refine ⟨fun i j => ?_⟩
  obtain ⟨p, hp, rfl⟩ := hTransitive i j
  exact hLe hp i

/-- The paths remaining after cutting each cycle at its return edge. -/
def cutCycleForest {size : C → ℕ} (index : ι ≃ Σ c, Fin (size c)) : SimpleGraph ι :=
  SimpleGraph.fromRel fun u v =>
    (index u).1 = (index v).1 ∧ (index u).2.val + 1 = (index v).2.val

theorem cutCycleForest_acyclic [Finite C] {size : C → ℕ}
    (index : ι ≃ Σ c, Fin (size c)) : (cutCycleForest index).IsAcyclic := by
  classical
  let _ := Fintype.ofFinite C
  let code := Fintype.equivFin C
  obtain ⟨m, hm⟩ := (Set.finite_range size).bddAbove
  let stride := m + 1
  have hBound (v : Σ c, Fin (size c)) : v.2.val < stride :=
    v.2.isLt.trans (Nat.lt_succ_of_le (hm ⟨v.1, rfl⟩))
  let enc (v : Σ c, Fin (size c)) := stride * (code v.1).val + v.2.val
  have hDiv (v : Σ c, Fin (size c)) : enc v / stride = (code v.1).val := by
    change (stride * (code v.1).val + v.2.val) / stride = _
    rw [Nat.mul_add_div (Nat.succ_pos _), Nat.div_eq_of_lt (hBound v), add_zero]
  have hInj : Function.Injective enc := by
    intro u v h
    have hCode : (code u.1).val = (code v.1).val := by
      rw [← hDiv u, ← hDiv v, h]
    have hClass : u.1 = v.1 := code.injective (Fin.ext hCode)
    rcases u with ⟨c, u⟩
    rcases v with ⟨d, v⟩
    dsimp only at hClass
    subst d
    have hVal : u.val = v.val := Nat.add_left_cancel h
    cases Fin.ext hVal
    rfl
  let hom : cutCycleForest index →g SimpleGraph.hasse ℕ :=
    ⟨enc ∘ index, fun {u v} h => by
      rw [SimpleGraph.hasse_adj, Nat.covBy_iff_add_one_eq, Nat.covBy_iff_add_one_eq]
      have h' := ((SimpleGraph.fromRel_adj _ _ _).1 h).2
      have hForward (u v : ι) (hc : (index u).1 = (index v).1)
          (hs : (index u).2.val + 1 = (index v).2.val) :
          enc (index u) + 1 = enc (index v) := by
        simp only [enc, add_assoc, hc, hs]
      exact h'.imp (fun h => hForward u v h.1 h.2) (fun h => hForward v u h.1 h.2)⟩
  exact (SimpleGraph.isAcyclic_hasse_of_linearOrder ℕ).comap hom (hInj.comp index.injective)

theorem cutCycleForest_le_moveGraph (σ τ : Equiv.Perm ι) {size : C → ℕ}
    (index : ι ≃ Σ c, Fin (size c))
    (hCycle : ∀ i, index (σ i) = ⟨(index i).1, cycleNext (index i).2⟩) :
    cutCycleForest index ≤ moveGraph σ τ := by
  have hNext (a b : Σ c, Fin (size c)) (hc : a.1 = b.1) (hs : a.2.val + 1 = b.2.val) :
      (⟨a.1, cycleNext a.2⟩ : Σ c, Fin (size c)) = b := by
    rcases a with ⟨c, a⟩
    rcases b with ⟨d, b⟩
    dsimp only at hc hs
    subst d
    have hb : a.val + 1 < size c := hs ▸ b.isLt
    have hFin : cycleNext a = b := Fin.ext (by simp [cycleNext, hs])
    rw [hFin]
  have hForward (u v : ι) (hc : (index u).1 = (index v).1)
      (hs : (index u).2.val + 1 = (index v).2.val) : σ u = v := by
    apply index.injective
    rw [hCycle]
    exact hNext _ _ hc hs
  intro u v h
  obtain ⟨hne, h⟩ := (SimpleGraph.fromRel_adj _ _ _).1 h
  exact (SimpleGraph.fromRel_adj _ _ _).2 ⟨hne,
    h.imp (fun h => Or.inl (hForward u v h.1 h.2)) (fun h => Or.inl (hForward v u h.1 h.2))⟩

/-- Extend the cut cycles to a spanning tree without removing any
    of the surviving edges. -/
theorem exists_tree_containing_cut_cycles [Nonempty ι] [Finite C]
    (σ τ : Equiv.Perm ι) {size : C → ℕ} (index : ι ≃ Σ c, Fin (size c))
    (hCycle : ∀ i, index (σ i) = ⟨(index i).1, cycleNext (index i).2⟩)
    (hTransitive : ∀ i j, ∃ p ∈ Subgroup.closure ({σ, τ} : Set (Equiv.Perm ι)), p i = j) :
    ∃ T : SimpleGraph ι, cutCycleForest index ≤ T ∧ T ≤ moveGraph σ τ ∧ T.IsTree :=
  (moveGraph_connected σ τ hTransitive).exists_isTree_le_of_le_of_isAcyclic
    (cutCycleForest_le_moveGraph σ τ index hCycle) (cutCycleForest_acyclic index)


/-- Reachability along a cut cycle, with either orientation. -/
theorem cutCycleForest_reachable_of_same {size : C → ℕ}
    (index : ι ≃ Σ c, Fin (size c)) {u v : ι} (hc : (index u).1 = (index v).1) :
    (cutCycleForest index).Reachable u v := by
  let hom (c : C) : SimpleGraph.pathGraph (size c) →g cutCycleForest index :=
    ⟨fun j => index.symm ⟨c, j⟩, fun {a b} h => by
      have h' := SimpleGraph.pathGraph_adj.mp h
      have hne : index.symm ⟨c, a⟩ ≠ index.symm ⟨c, b⟩ := by
        intro he
        have he' := congrArg (fun (z : Σ c, Fin (size c)) => z.2.val) (index.symm.injective he)
        simp only at he'
        rcases h' with h' | h' <;> omega
      apply (SimpleGraph.fromRel_adj _ _ _).2
      refine ⟨hne, ?_⟩
      rw [index.apply_symm_apply, index.apply_symm_apply]
      simpa using h'⟩
  generalize hu : index u = x at hc
  generalize hv : index v = y at hc
  rcases x with ⟨c, a⟩
  rcases y with ⟨d, b⟩
  dsimp only at hc
  subst d
  have h := ((SimpleGraph.preconnected_pathGraph (size c)) a b).map (hom c)
  change (cutCycleForest index).Reachable (index.symm ⟨c, a⟩) (index.symm ⟨c, b⟩) at h
  rw [← hu, ← hv, index.symm_apply_apply, index.symm_apply_apply] at h
  exact h

/-- Inside a cut cycle, an acyclic supergraph has no adjacency beyond
    the surviving path edges. -/
theorem cutCycleForest_adj_of_acyclic_supergraph {size : C → ℕ}
    (index : ι ≃ Σ c, Fin (size c)) (T : SimpleGraph ι)
    (hTree : T.IsAcyclic) (hLe : cutCycleForest index ≤ T)
    {u v : ι} (hc : (index u).1 = (index v).1) (hAdj : T.Adj u v) :
    (cutCycleForest index).Adj u v := by
  have hBridge := (SimpleGraph.isAcyclic_iff_forall_adj_isBridge.mp hTree) hAdj
  exact (hBridge.anti hLe).reachable_iff_adj.mp (cutCycleForest_reachable_of_same index hc)

end Shumyatsky
