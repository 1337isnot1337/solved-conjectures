import Conjectures.JohnsonPfaffianEndpoint
namespace JohnsonPfaffian
open GilmoreCrossingNesting

def outerMatching (u : ℕ) (M : List (ℕ × ℕ)) : List (ℕ × ℕ) :=
  (0,2*u+1) :: M.map (mapEndpoints Nat.succ)

theorem outer_range_perm (u : ℕ) :
    (0::(2*u+1)::(List.range (2*u)).map Nat.succ).Perm (List.range (2*(u+1))) := by
  have hp : ((2*u+1)::(List.range (2*u)).map Nat.succ).Perm
      ((List.range (2*u)).map Nat.succ ++ [2*u+1]) := by
    simpa using (List.perm_middle (a := 2*u+1) (l₁ := (List.range (2*u)).map Nat.succ) (l₂ := [])).symm
  have hr : List.range (2*(u+1)) = 0 :: ((List.range (2*u)).map Nat.succ ++ [2*u+1]) := by
    have hn : 2*(u+1) = (2*u+1)+1 := by omega
    rw [hn,List.range_succ_eq_map,List.range_succ]
    simp
  rw [hr]
  exact hp.cons 0

theorem outerMatching_valid (u : ℕ) (M : List (ℕ × ℕ)) (hM : M ∈ matchingFinset u) :
    outerMatching u M ∈ matchingFinset (u+1) := by
  obtain ⟨hpart,hord,hsort⟩ := (mem_matchingFinset (u := u) (arcs := M)).mp hM
  apply (mem_matchingFinset (u := u+1) (arcs := outerMatching u M)).mpr
  refine ⟨?_,?_,?_⟩
  · simp only [outerMatching,arcEndpoints,List.flatMap_cons,List.cons_append,List.nil_append]
    have hp := (hpart.map Nat.succ).trans (List.Perm.refl _)
    have hmap : (M.map (mapEndpoints Nat.succ)).flatMap (fun e => [e.1,e.2]) = (arcEndpoints M).map Nat.succ := by
      exact arcEndpoints_mapEndpoints Nat.succ M
    rw [hmap]
    exact ((hp.cons (2*u+1)).cons 0).trans (outer_range_perm u)
  · intro e he
    simp only [outerMatching,List.mem_cons,List.mem_map] at he
    rcases he with rfl | ⟨f,hf,rfl⟩
    · simp
    · exact Nat.succ_lt_succ (hord f hf)
  · apply List.pairwise_cons.mpr
    constructor
    · intro e he
      obtain ⟨f,hf,rfl⟩ := List.mem_map.mp he
      have hv := valid_matching_edges u M hM f hf
      change Nat.succ f.2 < 2*u+1
      omega
    · exact hsort.map (mapEndpoints Nat.succ) (by intro a b hab; exact Nat.succ_lt_succ hab)
theorem outerMatching_surjective (u : ℕ) (N : List (ℕ × ℕ))
    (hN : N ∈ matchingFinset (u+1)) (he : (0,2*u+1) ∈ N) :
    ∃ M ∈ matchingFinset u, outerMatching u M = N := by
  let R := N.erase (0,2*u+1)
  obtain ⟨hpart,hord,hsort⟩ := (mem_matchingFinset (u := u+1) (arcs := N)).mp hN
  have hp := List.perm_cons_erase he
  have hflat : (arcEndpoints ((0,2*u+1)::R)).Perm (arcEndpoints N) := by
    unfold arcEndpoints
    apply hp.symm.flatMap
    intro a ha
    rfl
  have hrange := (hflat.trans hpart).trans (outer_range_perm u).symm
  have hrest : (arcEndpoints R).Perm ((List.range (2*u)).map Nat.succ) := by
    simp only [arcEndpoints,List.flatMap_cons,List.cons_append,List.nil_append] at hrange ⊢
    exact hrange.cons_inv.cons_inv
  have hpos : ∀ x ∈ arcEndpoints R, 0<x := by
    intro x hx
    have hx' := hrest.mem_iff.mp hx
    obtain ⟨a,ha,rfl⟩ := List.mem_map.mp hx'
    omega
  have hedge (e : ℕ × ℕ) (he' : e ∈ R) : 0<e.1 ∧ 0<e.2 := by
    constructor
    · apply hpos
      unfold arcEndpoints
      exact List.mem_flatMap.mpr ⟨e,he',by simp⟩
    · apply hpos
      unfold arcEndpoints
      exact List.mem_flatMap.mpr ⟨e,he',by simp⟩
  let M := R.map (mapEndpoints Nat.pred)
  have hback : M.map (mapEndpoints Nat.succ) = R := by
    dsimp [M]
    rw [List.map_map]
    conv_rhs => rw [← List.map_id R]
    apply List.map_congr_left
    intro e he'
    obtain ⟨h1,h2⟩ := hedge e he'
    change (Nat.succ (Nat.pred e.1), Nat.succ (Nat.pred e.2)) = e
    exact Prod.ext (Nat.succ_pred_eq_of_pos h1) (Nat.succ_pred_eq_of_pos h2)
  have hM : M ∈ matchingFinset u := by
    apply (mem_matchingFinset (u := u) (arcs := M)).mpr
    refine ⟨?_,?_,?_⟩
    · dsimp [M]
      rw [arcEndpoints_mapEndpoints]
      have hr := hrest.map Nat.pred
      simpa [List.map_map,Function.comp_def] using hr
    · intro e he'
      obtain ⟨f,hf,rfl⟩ := List.mem_map.mp he'
      have hfN : f ∈ N := List.mem_of_mem_erase hf
      have ho := hord f hfN
      have hh := hedge f hf
      change Nat.pred f.1 < Nat.pred f.2
      exact Nat.pred_lt_pred (Nat.ne_of_gt hh.1) ho
    · dsimp [M]
      apply List.pairwise_map.mpr
      have hsR := hsort.sublist (List.erase_sublist (a := (0,2*u+1)))
      apply hsR.imp_of_mem
      intro a b ha hb hab
      have h1 := (hedge a ha).2
      have h2 := (hedge b hb).2
      change Nat.pred b.2 < Nat.pred a.2
      exact Nat.pred_lt_pred (Nat.ne_of_gt h2) hab
  refine ⟨M,hM,?_⟩
  have hperm : N.Perm (outerMatching u M) := by
    simpa [outerMatching,hback] using hp
  have hsM := ((mem_matchingFinset (u := u+1) (arcs := outerMatching u M)).mp (outerMatching_valid u M hM)).2.2
  have heq : N = outerMatching u M := by
    apply List.Perm.eq_of_pairwise (le := fun a b : ℕ × ℕ => b.2 < a.2) ?_ hsort hsM hperm
    intro a b ha hb hab hba
    omega
  exact heq.symm
theorem outerMatching_injective (u : ℕ) : Function.Injective (outerMatching u) := by
  intro M N h
  have ht := congrArg List.tail h
  simp only [outerMatching,List.tail_cons] at ht
  have hp := congrArg (List.map (mapEndpoints Nat.pred)) ht
  simp [List.map_map,Function.comp_def,mapEndpoints] at hp
  exact hp

theorem outerMatching_partner (u : ℕ) (M : List (ℕ × ℕ)) (hM : M ∈ matchingFinset u) :
    zeroPartner u (outerMatching u M) = 2*u+1 := by
  have hN := outerMatching_valid u M hM
  have hp := zeroPartner_spec u (outerMatching u M) hN
  have he : (0,2*u+1) ∈ outerMatching u M := by simp [outerMatching]
  by_contra hn
  have hneq : (0,zeroPartner u (outerMatching u M)) ≠ (0,2*u+1) := by simp [hn]
  have hdis := matching_edges_disjoint (u+1) (outerMatching u M) hN _ _ hp.1 he hneq
  exact (List.disjoint_left.mp hdis (show 0 ∈ [0,zeroPartner u (outerMatching u M)] by simp)) (by simp)

theorem edgeCross_shift (e f : ℕ × ℕ) :
    edgeCross (mapEndpoints Nat.succ e) (mapEndpoints Nat.succ f) = edgeCross e f := by
  simp [edgeCross,crosses,mapEndpoints]

theorem crossingCount_shift (M : List (ℕ × ℕ)) :
    crossingCount (M.map (mapEndpoints Nat.succ)) = crossingCount M := by
  induction M with
  | nil => rfl
  | cons e es ih =>
    simp only [List.map_cons,crossingCount,ih]
    congr 1
    rw [List.map_map]
    apply congrArg List.sum
    apply List.map_congr_left
    intro f hf
    exact edgeCross_shift e f

theorem crossingCount_outerMatching (u : ℕ) (M : List (ℕ × ℕ)) (hM : M ∈ matchingFinset u) :
    crossingCount (outerMatching u M) = crossingCount M := by
  unfold outerMatching
  simp only [crossingCount]
  have hz : ((M.map (mapEndpoints Nat.succ)).map (edgeCross (0,2*u+1))).sum = 0 := by
    apply List.sum_eq_zero
    intro x hx
    obtain ⟨e,he,rfl⟩ := List.mem_map.mp hx
    obtain ⟨f,hf,rfl⟩ := List.mem_map.mp he
    have hv := valid_matching_edges u M hM f hf
    unfold edgeCross crosses mapEndpoints
    split_ifs <;> omega
  rw [hz,Nat.zero_add,crossingCount_shift]

theorem outerMatching_residualTerm (u : ℕ) (w : ℕ → ℕ → ℝ) (M : List (ℕ × ℕ))
    (hM : M ∈ matchingFinset u) :
    residualTerm u w (outerMatching u M) =
      (-1:ℝ)^(pairCount crossContribution M) * edgeProduct (fun a b => w (a+1) (b+1)) M := by
  have hN := outerMatching_valid u M hM
  obtain ⟨_,hoN,hsN⟩ := (mem_matchingFinset (u := u+1) (arcs := outerMatching u M)).mp hN
  obtain ⟨_,hoM,hsM⟩ := (mem_matchingFinset (u := u) (arcs := M)).mp hM
  unfold residualTerm
  rw [outerMatching_partner u M hM, ← crossingCount_eq_pairCount _ hoN hsN,
    crossingCount_outerMatching u M hM, crossingCount_eq_pairCount _ hoM hsM]
  simp [outerMatching,edgeProduct,List.map_map,mapEndpoints,Function.comp_def,Nat.succ_eq_add_one]
theorem final_prefix_difference (u : ℕ) (w : ℕ → ℕ → ℝ) :
    borderPrefix u (2*u+1) w - borderPrefix u (2*u) w =
      matchingPfaffian u (fun a b => w (a+1) (b+1)) := by
  classical
  rw [prefix_difference]
  unfold matchingPfaffian
  rw [← Finset.sum_filter]
  symm
  apply Finset.sum_bij (fun M _ => outerMatching u M)
  · intro M hM
    apply Finset.mem_filter.mpr
    exact ⟨outerMatching_valid u M hM,outerMatching_partner u M hM⟩
  · intro M hM N hN heq
    exact outerMatching_injective u heq
  · intro N hN
    obtain ⟨hN,hpartner⟩ := Finset.mem_filter.mp hN
    have he : (0,2*u+1) ∈ N := by simpa [hpartner] using (zeroPartner_spec u N hN).1
    obtain ⟨M,hM,hEq⟩ := outerMatching_surjective u N hN he
    exact ⟨M,hM,hEq⟩
  · intro M hM
    exact (outerMatching_residualTerm u w M hM).symm

theorem interval_endpoint_bound (u : ℕ) (hu : 0<u) (g : ℕ × ℕ → ℝ)
    (hg : ∀ J, 0≤g J) (hg0 : ∀ J, J.1=0 → g J=0) :
    let w := intervalWeight (intervalUniverse (2*(u+1))) g
    w 0 (2*u+1) * matchingPfaffian u (fun a b => w (a+1) (b+1)) ≤ matchingPfaffian (u+1) w := by
  have h := interval_endpoint_prefix_bound u hu g hg hg0
  dsimp only at h ⊢
  rw [final_prefix_difference] at h
  exact h
theorem interval_endpoint_general (u : ℕ) (hu : 0<u) (t : ℕ × ℕ → ℝ)
    (ht : ∀ J ∈ intervalUniverse (2*(u+1)), 0≤t J) :
    let w := intervalWeight (intervalUniverse (2*(u+1))) t
    w 0 (2*u+1) * matchingPfaffian u (fun a b => w (a+1) (b+1)) ≤ matchingPfaffian (u+1) w := by
  have h := interval_endpoint_prefix_general u hu t ht
  dsimp only at h ⊢
  rw [final_prefix_difference] at h
  exact h
theorem matchingFinset_one : matchingFinset 1 = {[(0,1)]} := by
  classical
  ext N
  constructor
  · intro hN
    obtain ⟨j,he,hj⟩ := matching_has_zero_edge 0 N hN
    have hv := valid_matching_edges 1 N hN (0,j) he
    have hj1 : j=1 := by omega
    subst j
    obtain ⟨M,hM,hEq⟩ := outerMatching_surjective 0 N hN he
    have hM0 : M=[] := by simpa [matchingFinset_zero] using hM
    simpa [hM0,outerMatching] using hEq.symm
  · intro hN
    have hEq : N = [(0,1)] := by simpa using hN
    subst N
    simpa [outerMatching] using outerMatching_valid 0 [] (by simp [matchingFinset_zero])

theorem matchingPfaffian_one (w : ℕ → ℕ → ℝ) : matchingPfaffian 1 w = w 0 1 := by
  simp [matchingPfaffian,matchingFinset_one,edgeProduct,pairCount,pointArcCount]

theorem matchingPfaffian_zero (w : ℕ → ℕ → ℝ) : matchingPfaffian 0 w = 1 := by
  simp [matchingPfaffian,matchingFinset_zero,edgeProduct,pairCount]

theorem interval_endpoint_all (u : ℕ) (t : ℕ × ℕ → ℝ)
    (ht : ∀ J ∈ intervalUniverse (2*(u+1)), 0≤t J) :
    let w := intervalWeight (intervalUniverse (2*(u+1))) t
    w 0 (2*u+1) * matchingPfaffian u (fun a b => w (a+1) (b+1)) ≤ matchingPfaffian (u+1) w := by
  by_cases hu : 0<u
  · exact interval_endpoint_general u hu t ht
  · have hu0 : u=0 := by omega
    subst u
    simp [matchingPfaffian_zero,matchingPfaffian_one]
end JohnsonPfaffian
