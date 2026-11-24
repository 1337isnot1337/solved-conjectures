import Conjectures.JohnsonPfaffianCircularAdditive

/-!
# Johnson's conjecture

The arbitrary-order noncrossing matching induction in §4 of the recorded
proof. Every step uses the circular endpoint inequality already proved from
nonnegative additive interval coefficients.
-/

namespace JohnsonPfaffian

open GilmoreCrossingNesting

def Noncrossing (M : List (ℕ × ℕ)) : Prop :=
  ∀ e ∈ M, ∀ f ∈ M, ¬ crosses e.1 e.2 f.1 f.2

theorem noncrossing_rotate (u : ℕ) (M : {M // M ∈ matchingFinset u})
    (hM : Noncrossing M.val) : Noncrossing (rotateMatching u M).val := by
  intro e he f hf hc
  obtain ⟨a, ha, rfl⟩ := List.mem_map.mp ((rotateMatching_spec u M).mem_iff.mp he)
  obtain ⟨b, hb, rfl⟩ := List.mem_map.mp ((rotateMatching_spec u M).mem_iff.mp hf)
  have hva := valid_matching_edges u M.val M.property a ha
  have hvb := valid_matching_edges u M.val M.property b hb
  exact hM a ha b hb ((crossing_rotate (2*u) a.1 a.2 b.1 b.2
    hva.1 hvb.1 hva.2 hvb.2).mpr hc)

theorem noncrossing_outer_inner (u : ℕ) (M : List (ℕ × ℕ))
    (hM : Noncrossing (outerMatching u M)) : Noncrossing M := by
  intro e he f hf
  have h := hM (mapEndpoints Nat.succ e)
    (List.mem_cons_of_mem _ (List.mem_map.mpr ⟨e, he, rfl⟩))
    (mapEndpoints Nat.succ f)
    (List.mem_cons_of_mem _ (List.mem_map.mpr ⟨f, hf, rfl⟩))
  simpa [crosses, mapEndpoints] using h

theorem noncrossing_has_adjacent (u : ℕ) (M : List (ℕ × ℕ))
    (hM : M ∈ matchingFinset (u+1)) (hnc : Noncrossing M) :
    ∃ i, (i, i+1) ∈ M := by
  classical
  obtain ⟨e₀, he₀, _⟩ := matching_edge_at_vertex (u+1) 0 M hM (by omega)
  obtain ⟨e, he, hmin⟩ := Finset.exists_min_image M.toFinset
    (fun e : ℕ × ℕ => e.2-e.1) ⟨e₀, by simpa using he₀⟩
  have heM : e ∈ M := by simpa using he
  have hv := valid_matching_edges (u+1) M hM e heM
  by_cases hadj : e.2 = e.1+1
  · exact ⟨e.1, by simpa [← hadj] using heM⟩
  have hgap : e.1+1 < e.2 := by omega
  obtain ⟨f, hf, hfi⟩ := matching_edge_at_vertex (u+1) (e.1+1) M hM (by omega)
  have hfv := valid_matching_edges (u+1) M hM f hf
  have hef : e ≠ f := by
    intro h
    subst f
    omega
  have hd := matching_edges_disjoint (u+1) M hM e f heM hf hef
  have hd₁ := List.disjoint_left.mp hd (by simp : e.1 ∈ [e.1,e.2])
  have hd₂ := List.disjoint_left.mp hd (by simp : e.2 ∈ [e.1,e.2])
  simp only [List.mem_cons, not_or] at hd₁ hd₂
  have hcross := hnc e heM f hf
  unfold crosses at hcross
  have hm := hmin f (by simpa using hf)
  omega

theorem edgeProduct_outer (u : ℕ) (w : ℕ → ℕ → ℝ) (M : List (ℕ × ℕ)) :
    edgeProduct w (outerMatching u M) =
      w 0 (2*u+1) * edgeProduct (fun a b => w (a+1) (b+1)) M := by
  simp [edgeProduct, outerMatching, List.map_map, Function.comp_def,
    mapEndpoints, Nat.succ_eq_add_one]

theorem CircularData.rotate_comparison (u : ℕ) (D : CircularData)
    (M : {M // M ∈ matchingFinset u}) :
    (edgeProduct (D.pullback (unrotateVertex (2*u))).weight (rotateMatching u M).val ≤
      matchingPfaffian u (D.pullback (unrotateVertex (2*u))).weight) ↔
    edgeProduct D.weight M.val ≤ matchingPfaffian u D.weight := by
  have hw : (D.pullback (unrotateVertex (2*u))).weight = rotateWeight (2*u) D.weight := by
    funext i j
    exact D.rotate_weight (2*u) i j
  rw [hw, rotateMatching_edgeProduct, matchingPfaffian_cyclic_rotation]

theorem CircularData.outer_noncrossing_bound (u : ℕ)
    (ih : ∀ (E : CircularData), E.Valid (2*u) → ∀ N ∈ matchingFinset u,
      Noncrossing N → edgeProduct E.weight N ≤ matchingPfaffian u E.weight)
    (D : CircularData) (hD : D.Valid (2*(u+1))) (M : List (ℕ × ℕ))
    (hM : M ∈ matchingFinset (u+1)) (hnc : Noncrossing M)
    (he : (0, 2*u+1) ∈ M) : edgeProduct D.weight M ≤ matchingPfaffian (u+1) D.weight := by
  obtain ⟨N, hN, rfl⟩ := outerMatching_surjective u M hM he
  have hE : (D.pullback Nat.succ).Valid (2*u) :=
    D.pullback_valid hD Nat.succ (fun _ _ h => Nat.succ_lt_succ h) (by intro i hi; omega)
  have hb := ih (D.pullback Nat.succ) hE N hN (noncrossing_outer_inner u N hnc)
  rw [edgeProduct_outer]
  calc
    _ ≤ D.weight 0 (2*u+1) *
        matchingPfaffian u (fun a b => D.weight (a+1) (b+1)) :=
      mul_le_mul_of_nonneg_left hb (D.weight_positive hD 0 (2*u+1) (by omega) (by omega)).le
    _ ≤ _ := D.endpoint_bound u hD

theorem CircularData.adjacent_noncrossing_bound (u : ℕ)
    (ih : ∀ (E : CircularData), E.Valid (2*u) → ∀ N ∈ matchingFinset u,
      Noncrossing N → edgeProduct E.weight N ≤ matchingPfaffian u E.weight)
    (k : ℕ) : ∀ (i : ℕ) (D : CircularData), k+i+2 = 2*(u+1) →
      D.Valid (2*(u+1)) → ∀ M ∈ matchingFinset (u+1), Noncrossing M →
      (i,i+1) ∈ M → edgeProduct D.weight M ≤ matchingPfaffian (u+1) D.weight := by
  induction k with
  | zero =>
    intro i D hi hD M hM hnc he
    let N := rotateMatching (u+1) ⟨M,hM⟩
    have hrot : rotateEdge (2*(u+1)) (i,i+1) = (0,2*u+1) := by
      have h₁ : i+1 ≠ 2*(u+1) := by omega
      have h₂ : i+1+1 = 2*(u+1) := by omega
      have h₃ : i+1 = 2*u+1 := by omega
      simp only [rotateEdge, rotateVertex, ite_eq_right h₁, ite_eq_left h₂]
      simp [h₃]
    have heN : (0,2*u+1) ∈ N.val := by
      apply (rotateMatching_spec (u+1) ⟨M,hM⟩).mem_iff.mpr
      exact List.mem_map.mpr ⟨(i,i+1), he, hrot⟩
    apply (D.rotate_comparison (u+1) ⟨M,hM⟩).mp
    exact CircularData.outer_noncrossing_bound u ih _ (D.rotate_valid hD) N.val
      N.property (noncrossing_rotate (u+1) ⟨M,hM⟩ hnc) heN
  | succ k hk =>
    intro i D hi hD M hM hnc he
    let N := rotateMatching (u+1) ⟨M,hM⟩
    have hrot : rotateEdge (2*(u+1)) (i,i+1) = (i+1,(i+1)+1) := by
      have h₁ : i+1 ≠ 2*(u+1) := by omega
      have h₂ : i+1+1 ≠ 2*(u+1) := by omega
      simp [rotateEdge, rotateVertex, h₁, h₂]
    have heN : (i+1,(i+1)+1) ∈ N.val := by
      apply (rotateMatching_spec (u+1) ⟨M,hM⟩).mem_iff.mpr
      exact List.mem_map.mpr ⟨(i,i+1), he, hrot⟩
    apply (D.rotate_comparison (u+1) ⟨M,hM⟩).mp
    exact hk (i+1) (D.pullback (unrotateVertex (2*(u+1)))) (by omega)
      (D.rotate_valid hD) N.val N.property (noncrossing_rotate (u+1) ⟨M,hM⟩ hnc) heN

theorem CircularData.noncrossing_bound (u : ℕ) (D : CircularData)
    (hD : D.Valid (2*u)) (M : List (ℕ × ℕ)) (hM : M ∈ matchingFinset u)
    (hnc : Noncrossing M) : edgeProduct D.weight M ≤ matchingPfaffian u D.weight := by
  induction u generalizing D M with
  | zero =>
    have hM0 : M = [] := by simpa [matchingFinset_zero] using hM
    simp [hM0, edgeProduct, matchingPfaffian_zero]
  | succ u ih =>
    obtain ⟨i, hi⟩ := noncrossing_has_adjacent u M hM hnc
    have hv := valid_matching_edges (u+1) M hM (i,i+1) hi
    exact D.adjacent_noncrossing_bound u ih (2*(u+1)-i-2) i (by omega) hD M hM hnc hi

end JohnsonPfaffian
