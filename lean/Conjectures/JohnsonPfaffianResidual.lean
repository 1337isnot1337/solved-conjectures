import Conjectures.JohnsonPfaffianParity
namespace JohnsonPfaffian
open GilmoreCrossingNesting

theorem residual_matching_valid (u i : ℕ) (R : List (ℕ × ℕ))
    (hR : R ∈ residualMatchingFinset u i) :
    (arcEndpoints R).Perm (((List.range (2*u)).erase i).erase (i+1)) ∧
    (∀ e ∈ R, e.1 < e.2) ∧ R.Pairwise (fun e f => f.2 < e.2) := by
  obtain ⟨M,hM,rfl⟩ := Finset.mem_image.mp hR
  obtain ⟨hM,hpair⟩ := Finset.mem_filter.mp hM
  obtain ⟨hpart,hord,hsort⟩ := (mem_matchingFinset (u := u) (arcs := M)).mp hM
  have hp := List.perm_cons_erase hpair
  have hflat : (arcEndpoints ((i,i+1)::M.erase (i,i+1))).Perm (arcEndpoints M) := by
    unfold arcEndpoints
    apply hp.symm.flatMap
    intro a ha
    rfl
  have hperm := (hflat.trans hpart).erase i |>.erase (i+1)
  simp only [arcEndpoints, List.flatMap_cons, List.cons_append, List.nil_append,
    List.erase_cons_head] at hperm
  refine ⟨hperm, ?_, hsort.sublist List.erase_sublist⟩
  intro e he
  exact hord e (List.mem_of_mem_erase he)
theorem residual_matching_complete (u i : ℕ) (hi : i+1<2*u) (R : List (ℕ × ℕ))
    (hpart : (arcEndpoints R).Perm (((List.range (2*u)).erase i).erase (i+1)))
    (hord : ∀ e ∈ R, e.1 < e.2)
    (hsort : R.Pairwise (fun e f => f.2 < e.2)) : R ∈ residualMatchingFinset u i := by
  have hi0 : i ∈ List.range (2*u) := List.mem_range.mpr (by omega)
  have hi1 : i+1 ∈ (List.range (2*u)).erase i := (List.mem_erase_of_ne (by omega)).mpr (List.mem_range.mpr hi)
  have hrange : (i::(i+1)::((List.range (2*u)).erase i).erase (i+1)).Perm (List.range (2*u)) :=
    ((List.perm_cons_erase hi1).cons i).symm.trans (List.perm_cons_erase hi0).symm
  have hpart' : (arcEndpoints ((i,i+1)::R)).Perm (List.range (2*u)) := by
    simpa [arcEndpoints] using ((hpart.cons (i+1)).cons i).trans hrange
  have hord' : ∀ e ∈ ((i,i+1)::R), e.1 < e.2 := by
    intro e he
    simp only [List.mem_cons] at he
    rcases he with rfl | he
    · simp
    · exact hord e he
  obtain ⟨p,hp⟩ := decodeMatching_surjective ((i,i+1)::R) hpart' hord'
  let N := decodeMatching p
  have hN : N ∈ matchingFinset u := by
    apply (mem_matchingFinset (u := u) (arcs := N)).mpr
    exact ⟨(completePath_matching p.1 p.2).2.1,(completePath_matching p.1 p.2).2.2,closedArcs_sorted p.1 p.2⟩
  have hNpair : (i,i+1) ∈ N := hp.mem_iff.mpr (by simp)
  have hp' : (N.erase (i,i+1)).Perm R := by
    have := hp.erase (i,i+1)
    simpa using this
  have hsN := ((mem_matchingFinset (u := u) (arcs := N)).mp hN).2.2
  have heq : N.erase (i,i+1) = R := by
    apply List.Perm.eq_of_pairwise (le := fun a b : ℕ × ℕ => b.2 < a.2) ?_ (hsN.sublist List.erase_sublist) hsort hp'
    intro a b ha hb hab hba
    omega
  apply Finset.mem_image.mpr
  exact ⟨N, Finset.mem_filter.mpr ⟨hN,hNpair⟩, heq⟩
def skipAdjacent (i x : ℕ) : ℕ := if x < i then x else x+2

theorem skipAdjacent_strictMono (i : ℕ) : StrictMono (skipAdjacent i) := by
  intro a b hab
  unfold skipAdjacent
  split_ifs <;> omega

theorem skipAdjacent_range (u i : ℕ) (hi : i+1<2*(u+1)) :
    ((List.range (2*u)).map (skipAdjacent i)).Perm
      (((List.range (2*(u+1))).erase i).erase (i+1)) := by
  apply (List.perm_ext_iff_of_nodup ((List.nodup_range : (List.range (2*u)).Nodup).map (skipAdjacent_strictMono i).injective)
    ((List.nodup_range : (List.range (2*(u+1))).Nodup).erase i |>.erase (i+1))).mpr
  intro x
  simp only [List.mem_map, List.mem_range, List.Nodup.mem_erase_iff, List.nodup_range,
    List.Nodup.erase]
  constructor
  · rintro ⟨a,ha,rfl⟩
    unfold skipAdjacent
    split_ifs <;> omega
  · rintro ⟨hx1,hx0,hx⟩
    by_cases hxi : x < i
    · refine ⟨x,by omega,?_⟩
      simp [skipAdjacent,hxi]
    · refine ⟨x-2,by omega,?_⟩
      have hx2 : i ≤ x-2 := by omega
      simp [skipAdjacent, show ¬ x-2 < i by omega]
      omega
def unskipAdjacent (i x : ℕ) : ℕ := if x < i then x else x-2

theorem unskip_skipAdjacent (i x : ℕ) : unskipAdjacent i (skipAdjacent i x) = x := by
  unfold unskipAdjacent skipAdjacent
  split_ifs <;> omega

theorem skip_unskipAdjacent (i x : ℕ) (h0 : x≠i) (h1 : x≠i+1) :
    skipAdjacent i (unskipAdjacent i x) = x := by
  unfold unskipAdjacent skipAdjacent
  split_ifs <;> omega

theorem unskipAdjacent_lt (i a b : ℕ) (hab : a<b)
    (ha0 : a≠i) (ha1 : a≠i+1) (hb0 : b≠i) (hb1 : b≠i+1) :
    unskipAdjacent i a < unskipAdjacent i b := by
  unfold unskipAdjacent
  split_ifs <;> omega

def mapEndpoints (f : ℕ → ℕ) (e : ℕ × ℕ) : ℕ × ℕ := (f e.1, f e.2)

theorem arcEndpoints_mapEndpoints (f : ℕ → ℕ) (M : List (ℕ × ℕ)) :
    arcEndpoints (M.map (mapEndpoints f)) = (arcEndpoints M).map f := by
  induction M with
  | nil => rfl
  | cons e es ih => simp only [arcEndpoints] at ih ⊢; simp [mapEndpoints,ih]

theorem skipMatching_valid (u i : ℕ) (hi : i+1<2*(u+1)) (M : List (ℕ × ℕ))
    (hM : M ∈ matchingFinset u) :
    M.map (mapEndpoints (skipAdjacent i)) ∈ residualMatchingFinset (u+1) i := by
  obtain ⟨hpart,hord,hsort⟩ := (mem_matchingFinset (u := u) (arcs := M)).mp hM
  apply residual_matching_complete (u+1) i hi
  · rw [arcEndpoints_mapEndpoints]
    exact (hpart.map (skipAdjacent i)).trans (skipAdjacent_range u i hi)
  · intro e he
    obtain ⟨f,hf,rfl⟩ := List.mem_map.mp he
    exact skipAdjacent_strictMono i (hord f hf)
  · apply hsort.map (mapEndpoints (skipAdjacent i))
    intro a b hab
    exact skipAdjacent_strictMono i hab
theorem unskipMatching_valid (u i : ℕ) (hi : i+1<2*(u+1)) (R : List (ℕ × ℕ))
    (hR : R ∈ residualMatchingFinset (u+1) i) :
    R.map (mapEndpoints (unskipAdjacent i)) ∈ matchingFinset u ∧
    (R.map (mapEndpoints (unskipAdjacent i))).map (mapEndpoints (skipAdjacent i)) = R := by
  obtain ⟨hpart,hord,hsort⟩ := residual_matching_valid (u+1) i R hR
  have havoid : ∀ x ∈ arcEndpoints R, x≠i ∧ x≠i+1 := by
    intro x hx
    have hx' := hpart.mem_iff.mp hx
    have hn : ((List.range (2*(u+1))).erase i).Nodup := List.Nodup.erase i List.nodup_range
    have hx1 := (List.Nodup.mem_erase_iff hn).mp hx'
    have hx0 := (List.Nodup.mem_erase_iff List.nodup_range).mp hx1.2
    exact ⟨hx0.1,hx1.1⟩
  have hedge (e : ℕ × ℕ) (he : e ∈ R) :
      e.1≠i ∧ e.1≠i+1 ∧ e.2≠i ∧ e.2≠i+1 := by
    have h1 := havoid e.1 (by unfold arcEndpoints; exact List.mem_flatMap.mpr ⟨e,he,by simp⟩)
    have h2 := havoid e.2 (by unfold arcEndpoints; exact List.mem_flatMap.mpr ⟨e,he,by simp⟩)
    exact ⟨h1.1,h1.2,h2.1,h2.2⟩
  have hback : (R.map (mapEndpoints (unskipAdjacent i))).map (mapEndpoints (skipAdjacent i)) = R := by
    rw [List.map_map]
    conv_rhs => rw [← List.map_id R]
    apply List.map_congr_left
    intro e he
    obtain ⟨h0,h1,h2,h3⟩ := hedge e he
    simp [mapEndpoints,skip_unskipAdjacent i e.1 h0 h1,
      skip_unskipAdjacent i e.2 h2 h3]
  have hrange : ((((List.range (2*(u+1))).erase i).erase (i+1)).map (unskipAdjacent i)).Perm
      (List.range (2*u)) := by
    have hp := (skipAdjacent_range u i hi).symm.map (unskipAdjacent i)
    simpa [List.map_map,Function.comp_def,unskip_skipAdjacent] using hp
  refine ⟨?_,hback⟩
  apply (mem_matchingFinset (u := u) (arcs := R.map (mapEndpoints (unskipAdjacent i)))).mpr
  refine ⟨?_,?_,?_⟩
  · rw [arcEndpoints_mapEndpoints]
    exact (hpart.map (unskipAdjacent i)).trans hrange
  · intro e he
    obtain ⟨f,hf,rfl⟩ := List.mem_map.mp he
    obtain ⟨h0,h1,h2,h3⟩ := hedge f hf
    exact unskipAdjacent_lt i f.1 f.2 (hord f hf) h0 h1 h2 h3
  · apply List.pairwise_map.mpr
    apply hsort.imp_of_mem
    intro a b ha hb hab
    obtain ⟨_,_,ha0,ha1⟩ := hedge a ha
    obtain ⟨_,_,hb0,hb1⟩ := hedge b hb
    exact unskipAdjacent_lt i b.2 a.2 hab hb0 hb1 ha0 ha1
theorem edgeCross_skipAdjacent (i : ℕ) (e f : ℕ × ℕ) :
    edgeCross (mapEndpoints (skipAdjacent i) e) (mapEndpoints (skipAdjacent i) f) = edgeCross e f := by
  simp only [edgeCross,crosses,mapEndpoints, (skipAdjacent_strictMono i).lt_iff_lt]

theorem crossingCount_skipAdjacent (i : ℕ) (M : List (ℕ × ℕ)) :
    crossingCount (M.map (mapEndpoints (skipAdjacent i))) = crossingCount M := by
  induction M with
  | nil => rfl
  | cons e es ih =>
    simp only [List.map_cons,crossingCount,ih]
    congr 1
    rw [List.map_map]
    apply congrArg List.sum
    apply List.map_congr_left
    intro f hf
    exact edgeCross_skipAdjacent i e f

theorem skipMatching_injective (i : ℕ) : Function.Injective (fun M : List (ℕ × ℕ) =>
    M.map (mapEndpoints (skipAdjacent i))) := by
  intro M N h
  have h' := congrArg (List.map (mapEndpoints (unskipAdjacent i))) h
  simp only [List.map_map,Function.comp_def,mapEndpoints,unskip_skipAdjacent] at h'
  simpa using h'

theorem twin_rows_delete_standard (u i : ℕ) (hi : i+1<2*(u+1)) {R : Type*} [CommRing R]
    (w : ℕ → ℕ → R)
    (htwin : ∀ k, k≠i → k≠i+1 →
      w (min i k) (max i k) = w (min (i+1) k) (max (i+1) k)) :
    (∑ M ∈ matchingFinset (u+1), (-1:R)^(pairCount crossContribution M) * edgeProduct w M) =
      w i (i+1) * ∑ M ∈ matchingFinset u,
        (-1:R)^(pairCount crossContribution M) *
          edgeProduct (fun a b => w (skipAdjacent i a) (skipAdjacent i b)) M := by
  rw [twin_rows_delete_residual (u+1) i hi w htwin]
  congr 1
  symm
  apply Finset.sum_bij (fun M _ => M.map (mapEndpoints (skipAdjacent i)))
  · intro M hM
    exact skipMatching_valid u i hi M hM
  · intro M hM N hN heq
    exact skipMatching_injective i heq
  · intro M hM
    obtain ⟨hsmall,hback⟩ := unskipMatching_valid u i hi M hM
    exact ⟨M.map (mapEndpoints (unskipAdjacent i)),hsmall,hback⟩
  · intro M hM
    obtain ⟨_,hord,hsort⟩ := (mem_matchingFinset (u := u) (arcs := M)).mp hM
    rw [← crossingCount_eq_pairCount M hord hsort, crossingCount_skipAdjacent]
    simp [edgeProduct,List.map_map,mapEndpoints,Function.comp_def]
end JohnsonPfaffian
