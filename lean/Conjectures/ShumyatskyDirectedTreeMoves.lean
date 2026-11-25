module

public import Conjectures.ShumyatskyCycleForest
public import Conjectures.ShumyatskyPermutationCycles

/-! Choose directed representatives of the edges of the spanning tree.
Parallel moves retain their separate identities, and no loop is a tree
edge. A return move of the first permutation is never selected. -/

@[expose] public section

namespace Shumyatsky

variable {ι C : Type*}

def moveEndpoints (σ τ : Equiv.Perm ι) : ι ⊕ ι → Sym2 ι
  | .inl i => s(i, σ i)
  | .inr i => s(i, τ i)

/-- Whether the forward step survives cutting the return edge. -/
def retainedMove {size : C → ℕ} (index : ι ≃ Σ c, Fin (size c)) (i : ι) : Prop :=
  (index i).2.val + 1 < size (index i).1

theorem retainedMove_adj {size : C → ℕ} (index : ι ≃ Σ c, Fin (size c))
    (σ : Equiv.Perm ι)
    (hCycle : ∀ i, index (σ i) = ⟨(index i).1, cycleNext (index i).2⟩)
    {i : ι} (h : retainedMove index i) : (cutCycleForest index).Adj i (σ i) := by
  obtain ⟨hc, hi⟩ : (index i).1 = (index (σ i)).1 ∧
      (index i).2.val + 1 = (index (σ i)).2.val := by
    rw [hCycle i]
    simp [cycleNext, show (index i).2.val + 1 < size (index i).1 from h]
  refine (SimpleGraph.fromRel_adj _ _ _).2 ⟨?_, Or.inl ⟨hc, hi⟩⟩
  intro he
  have eindex := congrArg (fun v => (index v).2.val) he
  omega

theorem cutCycleForest_adj_iff_retained {size : C → ℕ}
    (index : ι ≃ Σ c, Fin (size c)) (σ : Equiv.Perm ι)
    (hCycle : ∀ i, index (σ i) = ⟨(index i).1, cycleNext (index i).2⟩)
    {i j : ι} :
    (cutCycleForest index).Adj i j ↔
      (retainedMove index i ∧ σ i = j) ∨ (retainedMove index j ∧ σ j = i) := by
  have hForward (u v : ι) (hc : (index u).1 = (index v).1)
      (hs : (index u).2.val + 1 = (index v).2.val) : retainedMove index u ∧ σ u = v := by
    have hlt : (index u).2.val + 1 < size (index u).1 := by
      rw [hs]
      exact (index v).2.isLt.trans_le (le_of_eq (congrArg size hc.symm))
    refine ⟨hlt, index.injective ?_⟩
    rw [hCycle u]
    generalize hu : index u = a at hc hs hlt ⊢
    generalize hv : index v = b at hc hs hlt ⊢
    rcases a with ⟨c, a⟩
    rcases b with ⟨d, b⟩
    dsimp only at hc hs hlt ⊢
    subst d
    have he : cycleNext a = b := Fin.ext (by simp [cycleNext, hs])
    rw [he]
  constructor
  · intro h
    exact ((SimpleGraph.fromRel_adj _ _ _).1 h).2.imp
      (fun h => hForward i j h.1 h.2) (fun h => hForward j i h.1 h.2)
  · rintro (⟨h, rfl⟩ | ⟨h, rfl⟩)
    · exact retainedMove_adj index σ hCycle h
    · exact (retainedMove_adj index σ hCycle h).symm

theorem retainedMove_endpoints_injective {size : C → ℕ}
    (index : ι ≃ Σ c, Fin (size c)) (σ : Equiv.Perm ι)
    (hCycle : ∀ i, index (σ i) = ⟨(index i).1, cycleNext (index i).2⟩) :
    Set.InjOn (fun i => (s(i, σ i) : Sym2 ι)) {i | retainedMove index i} := by
  intro i hi j hj h
  have hStep (a : ι) (ha : retainedMove index a) :
      (index (σ a)).2.val = (index a).2.val + 1 := by
    rw [hCycle a]
    simp [cycleNext, show (index a).2.val + 1 < size (index a).1 from ha]
  rcases Sym2.eq_iff.mp h with ⟨he, _⟩ | ⟨hij, hji⟩
  · exact he
  · have hi' := hStep i hi
    have hj' := hStep j hj
    rw [← hij] at hj'
    rw [hji] at hi'
    omega

/-- There is one representative per tree edge. Every retained first
    move is used, and the only other representatives are second moves. -/
theorem exists_tree_move_representatives {size : C → ℕ} (index : ι ≃ Σ c, Fin (size c))
    (σ τ : Equiv.Perm ι) (hCycle : ∀ i, index (σ i) = ⟨(index i).1, cycleNext (index i).2⟩)
    (T : SimpleGraph ι) (hTree : T.IsAcyclic) (hCut : cutCycleForest index ≤ T)
    (hMoves : T ≤ moveGraph σ τ) :
    ∃ pick : T.edgeSet → ι ⊕ ι,
      (∀ e, moveEndpoints σ τ (pick e) = e.val) ∧
        (∀ e i, pick e = Sum.inl i → retainedMove index i) ∧
        (∀ i, retainedMove index i → ∃ e, pick e = Sum.inl i) := by
  classical
  have hFind (e : Sym2 ι) : e ∈ T.edgeSet →
      (∃ i, retainedMove index i ∧ s(i, σ i) = e) ∨ (∃ i, s(i, τ i) = e) := by
    refine e.inductionOn fun u v h => ?_
    have hT : T.Adj u v := by simpa using h
    have hFirst (a b : ι) (hT' : T.Adj a b) (hStep : σ a = b) :
        ∃ i, retainedMove index i ∧ s(i, σ i) = s(a, b) := by
      have hc : (index a).1 = (index b).1 := by
        rw [← hStep, hCycle a]
      have hAdj := cutCycleForest_adj_of_acyclic_supergraph index T hTree hCut hc hT'
      rcases (cutCycleForest_adj_iff_retained index σ hCycle).1 hAdj with ⟨ha, he⟩ | ⟨hb, he⟩
      · exact ⟨a, ha, Sym2.eq_iff.mpr (Or.inl ⟨rfl, he⟩)⟩
      · exact ⟨b, hb, Sym2.eq_iff.mpr (Or.inr ⟨rfl, he⟩)⟩
    have hcases := ((SimpleGraph.fromRel_adj _ _ _).1 (hMoves hT)).2
    rcases hcases with (hσ | hτ) | (hσ | hτ)
    · exact Or.inl (hFirst u v hT hσ)
    · exact Or.inr ⟨u, Sym2.eq_iff.mpr (Or.inl ⟨rfl, hτ⟩)⟩
    · obtain ⟨i, hi, he⟩ := hFirst v u hT.symm hσ
      exact Or.inl ⟨i, hi, he.trans (Sym2.eq_iff.mpr (Or.inr ⟨rfl, rfl⟩))⟩
    · exact Or.inr ⟨v, Sym2.eq_iff.mpr (Or.inr ⟨rfl, hτ⟩)⟩
  let pick (e : T.edgeSet) : ι ⊕ ι :=
    if h : ∃ i, retainedMove index i ∧ s(i, σ i) = e.val then Sum.inl h.choose
    else Sum.inr ((hFind e.val e.property).resolve_left h).choose
  have hEndpoints (e : T.edgeSet) : moveEndpoints σ τ (pick e) = e.val := by
    unfold pick
    split
    · exact (Classical.choose_spec ‹∃ i, retainedMove index i ∧ s(i, σ i) = e.val›).2
    · exact Classical.choose_spec ((hFind e.val e.property).resolve_left ‹_›)
  have hRetained (e : T.edgeSet) (i : ι) (h : pick e = Sum.inl i) : retainedMove index i := by
    unfold pick at h
    split at h
    · cases h
      exact (Classical.choose_spec ‹∃ i, retainedMove index i ∧ s(i, σ i) = e.val›).1
    · cases h
  refine ⟨pick, hEndpoints, hRetained, ?_⟩
  intro i hi
  have hEdge : s(i, σ i) ∈ T.edgeSet := by
    simpa using (hCut (retainedMove_adj index σ hCycle hi))
  let e : T.edgeSet := ⟨s(i, σ i), hEdge⟩
  have he : ∃ j, retainedMove index j ∧ s(j, σ j) = e.val := ⟨i, hi, rfl⟩
  refine ⟨e, ?_⟩
  unfold pick
  rw [dite_eq_left he]
  congr 1
  exact retainedMove_endpoints_injective index σ hCycle he.choose_spec.1 hi he.choose_spec.2

/-- Each cycle of the second permutation has an unused directed edge.
    This includes a fixed point and a two-cycle whose two opposite
    moves have the same endpoints. -/
theorem exists_unselected_move_in_second_cycle {size : C → ℕ}
    (index : ι ≃ Σ c, Fin (size c)) (σ τ : Equiv.Perm ι)
    (hCycle : ∀ i, index (τ i) = ⟨(index i).1, cycleNext (index i).2⟩)
    (T : SimpleGraph ι) (hTree : T.IsAcyclic)
    (pick : T.edgeSet → ι ⊕ ι) (hPick : ∀ e, moveEndpoints σ τ (pick e) = e.val)
    (c : C) (hSize : 0 < size c) :
    ∃ j : Fin (size c), ∀ e, pick e ≠ Sum.inr (index.symm ⟨c, j⟩) := by
  classical
  by_contra! hAll
  let embed : Fin (size c) ↪ ι :=
    ⟨fun j => index.symm ⟨c, j⟩, fun a b h => Fin.ext
      (congrArg (fun z : Σ c, Fin (size c) => z.2.val) (index.symm.injective h))⟩
  have hChosen (j : Fin (size c)) : ∃ e, pick e = Sum.inr (embed j) := hAll j
  have hEndpoints (j : Fin (size c)) {e : T.edgeSet} (h : pick e = Sum.inr (embed j)) :
      s(embed j, τ (embed j)) = e.val := by
    have he := hPick e
    rw [h] at he
    exact he
  have hAdj (j : Fin (size c)) : T.Adj (embed j) (τ (embed j)) := by
    obtain ⟨e, he⟩ := hChosen j
    exact (SimpleGraph.mem_edgeSet (G := T)).mp ((hEndpoints j he).symm ▸ e.property)
  have hNext (j : Fin (size c)) : τ (embed j) = embed (cycleNext j) := by
    apply index.injective
    rw [hCycle]
    change (⟨(index (index.symm ⟨c, j⟩)).1, cycleNext (index (index.symm ⟨c, j⟩)).2⟩ :
      Σ c, Fin (size c)) = index (index.symm ⟨c, cycleNext j⟩)
    rw [index.apply_symm_apply, index.apply_symm_apply]
  have hForward (a b : Fin (size c)) (hab : a.val + 1 = b.val) : τ (embed a) = embed b := by
    have hlt : a.val + 1 < size c := hab ▸ b.isLt
    have he : cycleNext a = b := by
      apply Fin.ext
      unfold cycleNext
      rw [dite_eq_left hlt]
      exact hab
    rw [hNext, he]
  let F := (SimpleGraph.pathGraph (size c)).map embed
  have hF : F ≤ T := by
    intro u v h
    obtain ⟨a, b, hab, rfl, rfl⟩ := (SimpleGraph.map_adj embed _ _ _).1 h
    rcases SimpleGraph.pathGraph_adj.mp hab with hab | hba
    · rw [← hForward a b hab]
      exact hAdj a
    · rw [← hForward b a hba]
      exact (hAdj b).symm
  let last : Fin (size c) := ⟨size c - 1, by omega⟩
  let first : Fin (size c) := ⟨0, hSize⟩
  have hLast : last.val + 1 = size c := by
    change size c - 1 + 1 = size c
    omega
  have hReturn : τ (embed last) = embed first := by
    rw [hNext]
    have hlt : ¬last.val + 1 < size c := by rw [hLast]; exact Nat.lt_irrefl _
    have hFirst : cycleNext last = first := Fin.ext (by simp only [cycleNext, dite_eq_right hlt, first])
    rw [hFirst]
  have hReach : F.Reachable (embed last) (embed first) :=
    ((SimpleGraph.preconnected_pathGraph (size c)) last first).map (SimpleGraph.Embedding.map embed _).toHom
  have hEnd : T.Adj (embed last) (embed first) := hReturn ▸ hAdj last
  have hBridge := (SimpleGraph.isAcyclic_iff_forall_adj_isBridge.mp hTree) hEnd
  have hPath : (SimpleGraph.pathGraph (size c)).Adj last first :=
    (SimpleGraph.map_adj_apply (f := embed)).1 ((hBridge.anti hF).reachable_iff_adj.1 hReach)
  rcases SimpleGraph.pathGraph_adj.1 hPath with h | h
  · rw [hLast] at h
    exact (Nat.ne_of_gt hSize) h
  · have hDistinct : first ≠ last := by
      intro he
      have he' := congrArg Fin.val he
      omega
    have hForward' := hForward first last h
    obtain ⟨eLast, heLast⟩ := hChosen last
    obtain ⟨eFirst, heFirst⟩ := hChosen first
    have heq : eFirst = eLast := by
      apply Subtype.ext
      rw [← hEndpoints first heFirst, ← hEndpoints last heLast, hForward', hReturn]
      exact Sym2.eq_iff.mpr (Or.inr ⟨rfl, rfl⟩)
    have hc := heq ▸ heFirst
    rw [heLast] at hc
    exact hDistinct ((embed.injective (Sum.inr.inj hc)).symm)


/-- A directed move is available when neither the tree nor the second
    permutation's reserved closing edges use it. -/
def availableMove {τ : Equiv.Perm ι} {T : SimpleGraph ι}
    (pick : T.edgeSet → ι ⊕ ι) (reserved : PermutationCycle τ → ι) (move : ι ⊕ ι) : Prop :=
  (∀ e, pick e ≠ move) ∧ ∀ c, move ≠ Sum.inr (reserved c)

/-- In the one-cycle case the retained first moves already span, so
    every chosen representative is a first move. -/
theorem tree_uses_first_moves_of_single_cycle [Subsingleton C] {size : C → ℕ}
    (index : ι ≃ Σ c, Fin (size c)) (σ τ : Equiv.Perm ι)
    (hCycle : ∀ i, index (σ i) = ⟨(index i).1, cycleNext (index i).2⟩)
    (T : SimpleGraph ι) (hTree : T.IsAcyclic) (hCut : cutCycleForest index ≤ T)
    (pick : T.edgeSet → ι ⊕ ι)
    (hPick : ∀ e, moveEndpoints σ τ (pick e) = e.val)
    (hRetained : ∀ i, retainedMove index i → ∃ e, pick e = Sum.inl i) :
    ∀ e, ∃ i, pick e = Sum.inl i := by
  have hFirst (e : Sym2 ι) (he : e ∈ T.edgeSet) :
      ∃ i, retainedMove index i ∧ s(i, σ i) = e := by
    refine e.inductionOn (fun u v he => ?_) he
    have hAdj := cutCycleForest_adj_of_acyclic_supergraph index T hTree hCut
      (Subsingleton.elim (index u).1 (index v).1) (by simpa using he)
    rcases (cutCycleForest_adj_iff_retained index σ hCycle).1 hAdj with ⟨hu, huv⟩ | ⟨hv, hvu⟩
    · exact ⟨u, hu, Sym2.eq_iff.mpr (Or.inl ⟨rfl, huv⟩)⟩
    · exact ⟨v, hv, Sym2.eq_iff.mpr (Or.inr ⟨rfl, hvu⟩)⟩
  intro e
  obtain ⟨i, hi, hPair⟩ := hFirst e.val e.property
  obtain ⟨e', he'⟩ := hRetained i hi
  have h := hPick e'
  rw [he'] at h
  have he : e' = e := Subtype.ext (h.symm.trans hPair)
  exact ⟨i, he ▸ he'⟩

private theorem subsingleton_cycles_of_conj {σ τ γ : Equiv.Perm ι}
    (hConj : τ = γ * σ * γ⁻¹) [Subsingleton (PermutationCycle σ)] :
    Subsingleton (PermutationCycle τ) := by
  constructor
  intro a b
  refine Quotient.inductionOn₂ a b fun i j => ?_
  apply Quotient.sound
  change τ.SameCycle i j
  rw [hConj, Equiv.Perm.sameCycle_conj]
  exact Quotient.exact (Subsingleton.elim (cycleOfVertex σ (γ⁻¹ i)) (cycleOfVertex σ (γ⁻¹ j)))

/-- The two distinct free moves used by the written proof: two first
    return moves when there are several cycles, and a first return
    move and a nonreserved second move when there is a single cycle. -/
theorem exists_two_available_moves [Nontrivial ι] (σ τ γ : Equiv.Perm ι)
    (hConj : τ = γ * σ * γ⁻¹) {size : PermutationCycle σ → ℕ}
    (index : ι ≃ Σ c, Fin (size c)) (hSize : ∀ c, 0 < size c)
    (hCycle : ∀ i, index (σ i) = ⟨(index i).1, cycleNext (index i).2⟩)
    (T : SimpleGraph ι) (hTree : T.IsAcyclic) (hCut : cutCycleForest index ≤ T)
    (pick : T.edgeSet → ι ⊕ ι) (hPick : ∀ e, moveEndpoints σ τ (pick e) = e.val)
    (hFirst : ∀ e i, pick e = Sum.inl i → retainedMove index i)
    (hRetained : ∀ i, retainedMove index i → ∃ e, pick e = Sum.inl i)
    (reserved : PermutationCycle τ → ι) :
    ∃ a b : ι ⊕ ι, a ≠ b ∧ availableMove pick reserved a ∧ availableMove pick reserved b := by
  classical
  let ret (c : PermutationCycle σ) : ι :=
    index.symm ⟨c, ⟨size c - 1, by have := hSize c; omega⟩⟩
  have hRet (c : PermutationCycle σ) : ¬retainedMove index (ret c) := by
    unfold retainedMove ret
    rw [index.apply_symm_apply]
    change ¬ (size c - 1 + 1 < size c)
    omega
  have hFree (c : PermutationCycle σ) : availableMove pick reserved (.inl (ret c)) :=
    ⟨fun e he => hRet c (hFirst e _ he), fun _ he => Sum.inl_ne_inr he⟩
  by_cases hMany : Nontrivial (PermutationCycle σ)
  · obtain ⟨c, d, hcd⟩ := exists_pair_ne (PermutationCycle σ)
    refine ⟨.inl (ret c), .inl (ret d), ?_, hFree c, hFree d⟩
    intro he
    apply hcd
    exact congrArg Sigma.fst (index.symm.injective (Sum.inl.inj he))
  · have : Subsingleton (PermutationCycle σ) := not_nontrivial_iff_subsingleton.mp hMany
    have : Subsingleton (PermutationCycle τ) := subsingleton_cycles_of_conj hConj
    let i : ι := Classical.ofNonempty
    let d := cycleOfVertex τ i
    obtain ⟨j, hj⟩ := exists_ne (reserved d)
    refine ⟨.inl (ret (index i).1), .inr j, Sum.inl_ne_inr, hFree _, ?_⟩
    constructor
    · intro e he
      obtain ⟨k, hk⟩ := tree_uses_first_moves_of_single_cycle index σ τ hCycle T hTree hCut
        pick hPick hRetained e
      rw [hk] at he
      exact Sum.inl_ne_inr he
    · intro d' he
      have hd : d' = d := Subsingleton.elim _ _
      rw [hd] at he
      exact hj (Sum.inr.inj he)


/-- Transitive conjugate permutations on at least two vertices have a
    spanning tree with directed representatives, a reserved nontree
    second move on every second cycle, and two other distinct nontree
    moves available for independent label changes. -/
theorem exists_available_move_pair_for_transitive_conjugate_perms [Finite ι] [Nontrivial ι]
    (σ τ γ : Equiv.Perm ι) (hConj : τ = γ * σ * γ⁻¹)
    (hTransitive : ∀ i j, ∃ p ∈ Subgroup.closure ({σ, τ} : Set (Equiv.Perm ι)), p i = j) :
    ∃ (T : SimpleGraph ι) (pick : T.edgeSet → ι ⊕ ι) (reserved : PermutationCycle τ → ι)
      (a b : ι ⊕ ι),
      T.IsTree ∧
        (∀ e, moveEndpoints σ τ (pick e) = e.val) ∧
        (∀ c, cycleOfVertex τ (reserved c) = c) ∧
        (∀ c e, pick e ≠ Sum.inr (reserved c)) ∧
        a ≠ b ∧ availableMove pick reserved a ∧ availableMove pick reserved b := by
  classical
  let start (ρ : Equiv.Perm ι) (c : PermutationCycle ρ) : {i // cycleOfVertex ρ i = c} :=
    ⟨Quotient.out c, Quotient.out_eq c⟩
  have : Finite (PermutationCycle σ) := Finite.of_surjective (cycleOfVertex σ)
    fun c => ⟨(start σ c).val, (start σ c).property⟩
  obtain ⟨sizeσ, idxσ, hSizeσ, _, hCycleσ⟩ := exists_indexed_permutation_cycles σ (start σ)
  obtain ⟨sizeτ, idxτ, hSizeτ, hEvalτ, hCycleτ⟩ := exists_indexed_permutation_cycles τ (start τ)
  obtain ⟨T, hCut, hMoves, hTree⟩ := exists_tree_containing_cut_cycles σ τ idxσ hCycleσ hTransitive
  obtain ⟨pick, hPick, hFirst, hRetained⟩ :=
    exists_tree_move_representatives idxσ σ τ hCycleσ T hTree.isAcyclic hCut hMoves
  have hReserve (c : PermutationCycle τ) :
      ∃ j : Fin (sizeτ c), ∀ e, pick e ≠ Sum.inr (idxτ.symm ⟨c, j⟩) :=
    exists_unselected_move_in_second_cycle idxτ σ τ hCycleτ T hTree.isAcyclic pick hPick c (hSizeτ c)
  choose chosen hChosen using hReserve
  let reserved (c : PermutationCycle τ) : ι := idxτ.symm ⟨c, chosen c⟩
  have hClass (c : PermutationCycle τ) : cycleOfVertex τ (reserved c) = c := by
    unfold reserved
    rw [hEvalτ, cycleOfVertex_pow]
    exact (start τ c).property
  obtain ⟨a, b, hab, ha, hb⟩ := exists_two_available_moves σ τ γ hConj idxσ hSizeσ hCycleσ
    T hTree.isAcyclic hCut pick hPick hFirst hRetained reserved
  exact ⟨T, pick, reserved, a, b, hTree, hPick, hClass, hChosen, hab, ha, hb⟩

end Shumyatsky
