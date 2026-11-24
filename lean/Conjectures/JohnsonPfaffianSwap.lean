import Conjectures.JohnsonPfaffianRotation
namespace JohnsonPfaffian
open GilmoreCrossingNesting

def swapVertex (i x : ℕ) : ℕ := if x=i then i+1 else if x=i+1 then i else x

theorem swapVertex_involutive (i x : ℕ) : swapVertex i (swapVertex i x) = x := by
  unfold swapVertex
  split_ifs <;> omega

theorem swapVertex_injective (i : ℕ) : Function.Injective (swapVertex i) := by
  intro x y h
  have hh := congrArg (swapVertex i) h
  simpa [swapVertex_involutive] using hh

theorem swap_range_perm (n i : ℕ) (hi : i+1<n) : ((List.range n).map (swapVertex i)).Perm (List.range n) := by
  have hnodup : ((List.range n).map (swapVertex i)).Nodup := (List.nodup_range).map (swapVertex_injective i)
  have hsubset : (List.range n).map (swapVertex i) ⊆ List.range n := by
    intro z hz
    obtain ⟨x,hx,rfl⟩ := List.mem_map.mp hz
    simp only [List.mem_range] at hx ⊢
    unfold swapVertex
    split_ifs <;> omega
  apply (List.subperm_of_subset hnodup hsubset).perm_of_length_le
  simp

def swapEdge (i : ℕ) (e : ℕ × ℕ) : ℕ × ℕ :=
  (min (swapVertex i e.1) (swapVertex i e.2), max (swapVertex i e.1) (swapVertex i e.2))

theorem swapEdge_ordered (i : ℕ) (e : ℕ × ℕ) (he : e.1<e.2) :
    (swapEdge i e).1 < (swapEdge i e).2 := by
  have hne : swapVertex i e.1 ≠ swapVertex i e.2 := by
    intro hh
    have heq := swapVertex_injective i hh
    omega
  unfold swapEdge
  dsimp only
  by_cases h : swapVertex i e.1 ≤ swapVertex i e.2
  · rw [min_eq_left h,max_eq_right h]; omega
  · have hh : swapVertex i e.2 ≤ swapVertex i e.1 := le_of_not_ge h
    rw [min_eq_right hh,max_eq_left hh]; omega

theorem swap_endpoints_perm (i : ℕ) (M : List (ℕ × ℕ)) :
    (arcEndpoints (M.map (swapEdge i))).Perm ((arcEndpoints M).map (swapVertex i)) := by
  induction M with
  | nil => simp [arcEndpoints]
  | cons e es ih =>
    have hpair : ([min (swapVertex i e.1) (swapVertex i e.2), max (swapVertex i e.1) (swapVertex i e.2)] : List ℕ).Perm
        [swapVertex i e.1, swapVertex i e.2] := by
      by_cases h : swapVertex i e.1 ≤ swapVertex i e.2
      · simp [min_eq_left h,max_eq_right h]
      · have hh : swapVertex i e.2 ≤ swapVertex i e.1 := le_of_not_ge h
        simp only [min_eq_right hh,max_eq_left hh]
        exact List.Perm.swap _ _ _
    simpa [arcEndpoints,swapEdge] using hpair.append ih

theorem swapped_matching_exists (u i : ℕ) (hi : i+1<2*u) (M : List (ℕ × ℕ))
    (hM : M ∈ matchingFinset u) : ∃ N ∈ matchingFinset u, N.Perm (M.map (swapEdge i)) := by
  obtain ⟨hpart,hord,hsort⟩ := (mem_matchingFinset (u := u) (arcs := M)).mp hM
  have hpart' : (arcEndpoints (M.map (swapEdge i))).Perm (List.range (2*u)) :=
    (swap_endpoints_perm i M).trans ((hpart.map (swapVertex i)).trans (swap_range_perm (2*u) i hi))
  have hord' : ∀ e ∈ M.map (swapEdge i), e.1<e.2 := by
    intro e he
    obtain ⟨e',he',rfl⟩ := List.mem_map.mp he
    exact swapEdge_ordered i e' (hord e' he')
  obtain ⟨p,hp⟩ := decodeMatching_surjective (M.map (swapEdge i)) hpart' hord'
  refine ⟨decodeMatching p, ?_, hp⟩
  apply (mem_matchingFinset (u := u) (arcs := decodeMatching p)).mpr
  exact ⟨(completePath_matching p.1 p.2).2.1,(completePath_matching p.1 p.2).2.2,closedArcs_sorted p.1 p.2⟩

theorem swapEdge_involutive (i : ℕ) (e : ℕ × ℕ) (he : e.1<e.2) : swapEdge i (swapEdge i e) = e := by
  unfold swapEdge
  dsimp only
  by_cases h : swapVertex i e.1 ≤ swapVertex i e.2
  · rw [min_eq_left h,max_eq_right h,swapVertex_involutive,swapVertex_involutive]
    simp [min_eq_left he.le,max_eq_right he.le]
  · have hh : swapVertex i e.2 ≤ swapVertex i e.1 := le_of_not_ge h
    rw [min_eq_right hh,max_eq_left hh,swapVertex_involutive,swapVertex_involutive]
    simp [min_eq_right he.le,max_eq_left he.le]

noncomputable def swapMatching (u i : ℕ) (hi : i+1<2*u) (M : {M // M ∈ matchingFinset u}) :
    {M // M ∈ matchingFinset u} := by
  classical
  let N := Classical.choose (swapped_matching_exists u i hi M.val M.property)
  exact ⟨N,(Classical.choose_spec (swapped_matching_exists u i hi M.val M.property)).1⟩

theorem swapMatching_spec (u i : ℕ) (hi : i+1<2*u) (M : {M // M ∈ matchingFinset u}) :
    (swapMatching u i hi M).val.Perm (M.val.map (swapEdge i)) := by
  exact (Classical.choose_spec (swapped_matching_exists u i hi M.val M.property)).2

theorem swap_swap_list (u i : ℕ) (M : List (ℕ × ℕ)) (hM : M ∈ matchingFinset u) :
    (M.map (swapEdge i)).map (swapEdge i) = M := by
  rw [List.map_map]
  calc
    _ = M.map id := by
      apply List.map_congr_left
      intro e he
      exact swapEdge_involutive i e (valid_matching_edges u M hM e he).1
    _ = M := List.map_id M

theorem swapMatching_involutive (u i : ℕ) (hi : i+1<2*u) : Function.Involutive (swapMatching u i hi) := by
  intro M
  apply Subtype.ext
  have hfirst := swapMatching_spec u i hi M
  have hsecond := swapMatching_spec u i hi (swapMatching u i hi M)
  have hp := hsecond.trans (hfirst.map (swapEdge i))
  rw [swap_swap_list u i M.val M.property] at hp
  have hsM := ((mem_matchingFinset (u := u) (arcs := M.val)).mp M.property).2.2
  have hsN := ((mem_matchingFinset (u := u) (arcs := (swapMatching u i hi (swapMatching u i hi M)).val)).mp
    (swapMatching u i hi (swapMatching u i hi M)).property).2.2
  apply List.Perm.eq_of_pairwise (le := fun a b : ℕ × ℕ => b.2 < a.2) ?_ hsN hsM hp
  intro a b ha hb hab hba
  omega

theorem matching_edges_disjoint (u : ℕ) (M : List (ℕ × ℕ)) (hM : M ∈ matchingFinset u)
    (e f : ℕ × ℕ) (he : e ∈ M) (hf : f ∈ M) (hne : e ≠ f) :
    ([e.1,e.2] : List ℕ).Disjoint [f.1,f.2] := by
  have hpart := ((mem_matchingFinset (u := u) (arcs := M)).mp hM).1
  have hnodup : (arcEndpoints M).Nodup := hpart.nodup_iff.mpr List.nodup_range
  have hpair := (List.nodup_flatMap.mp hnodup).2
  obtain ⟨i,hi,hei⟩ := List.getElem_of_mem he
  obtain ⟨j,hj,hfj⟩ := List.getElem_of_mem hf
  have hij : i ≠ j := by
    intro hh
    subst j
    apply hne
    exact hei.symm.trans hfj
  by_cases hlt : i<j
  · have hh := List.pairwise_iff_getElem.mp hpair i j hi hj hlt
    simpa [hei,hfj,Function.onFun] using hh
  · have hh := List.pairwise_iff_getElem.mp hpair j i hj hi (by omega)
    have hh' : ([f.1,f.2] : List ℕ).Disjoint [e.1,e.2] := by
      simpa [hei,hfj,Function.onFun] using hh
    exact hh'.symm

theorem matching_edge_at_vertex (u v : ℕ) (M : List (ℕ × ℕ)) (hM : M ∈ matchingFinset u) (hv : v<2*u) :
    ∃ e ∈ M, e.1=v ∨ e.2=v := by
  have hp := ((mem_matchingFinset (u := u) (arcs := M)).mp hM).1
  have hm : v ∈ arcEndpoints M := hp.mem_iff.mpr (List.mem_range.mpr hv)
  unfold arcEndpoints at hm
  obtain ⟨e,he,hm⟩ := List.mem_flatMap.mp hm
  refine ⟨e,he,?_⟩
  simpa [eq_comm] using hm

theorem swapEdge_shared_other (i : ℕ) (e : ℕ × ℕ) (he : e.1<e.2)
    (hi : e.1=i ∨ e.2=i) (hn : e ≠ (i,i+1)) :
    swapEdge i e ≠ e ∧ ∃ v, v ∈ ([e.1,e.2] : List ℕ) ∧ v ∈ [(swapEdge i e).1,(swapEdge i e).2] := by
  rcases e with ⟨a,b⟩
  dsimp only at he hi hn
  rcases hi with h | h
  · subst a
    have hb : i+1<b := by
      have hne : b ≠ i+1 := by intro hh; apply hn; simp [hh]
      omega
    have hswap : swapEdge i (i,b) = (i+1,b) := by
      unfold swapEdge swapVertex
      simp [show b ≠ i by omega, show b ≠ i+1 by omega, min_eq_left (by omega : i+1 ≤ b), max_eq_right (by omega : i+1 ≤ b)]
    rw [hswap]
    constructor
    · intro hh; have := congrArg Prod.fst hh; simp at this
    · exact ⟨b,by simp,by simp⟩
  · subst b
    have ha : a < i := he
    have hswap : swapEdge i (a,i) = (a,i+1) := by
      unfold swapEdge swapVertex
      simp [show a ≠ i by omega, show a ≠ i+1 by omega, min_eq_left (by omega : a ≤ i+1), max_eq_right (by omega : a ≤ i+1)]
    rw [hswap]
    constructor
    · intro hh; have := congrArg Prod.snd hh; simp at this
    · exact ⟨a,by simp,by simp⟩

theorem swapMatching_no_fixed (u i : ℕ) (hi : i+1<2*u) (M : {M // M ∈ matchingFinset u})
    (hpair : (i,i+1) ∉ M.val) : swapMatching u i hi M ≠ M := by
  intro hfixed
  obtain ⟨e,he,hei⟩ := matching_edge_at_vertex u i M.val M.property (by omega)
  have hne : e ≠ (i,i+1) := by
    intro heq
    subst e
    exact hpair he
  have heord := (valid_matching_edges u M.val M.property e he).1
  have hshared := swapEdge_shared_other i e heord hei hne
  have hin : swapEdge i e ∈ (swapMatching u i hi M).val := by
    apply (swapMatching_spec u i hi M).mem_iff.mpr
    exact List.mem_map.mpr ⟨e,he,rfl⟩
  have hinM : swapEdge i e ∈ M.val := by simpa [hfixed] using hin
  have hdis := matching_edges_disjoint u M.val M.property e (swapEdge i e) he hinM hshared.1.symm
  obtain ⟨v,hv1,hv2⟩ := hshared.2
  exact (List.disjoint_left.mp hdis hv1) hv2
end JohnsonPfaffian
