import Conjectures.JohnsonPfaffianSmall
namespace JohnsonPfaffian

def rotateVertex (n x : ℕ) : ℕ := if x+1=n then 0 else x+1

def crosses (a b c d : ℕ) : Prop := (a<c ∧ c<b ∧ b<d) ∨ (c<a ∧ a<d ∧ d<b)

theorem crossing_rotate (n a b c d : ℕ) (ha : a<b) (hc : c<d)
    (hb : b<n) (hd : d<n) :
    crosses a b c d ↔ crosses
      (min (rotateVertex n a) (rotateVertex n b)) (max (rotateVertex n a) (rotateVertex n b))
      (min (rotateVertex n c) (rotateVertex n d)) (max (rotateVertex n c) (rotateVertex n d)) := by
  unfold crosses rotateVertex
  simp only [min_def, max_def]
  split_ifs <;> omega

instance crossesDecidable (a b c d : ℕ) : Decidable (crosses a b c d) := by
  unfold crosses
  infer_instance

def edgeCross (e f : ℕ × ℕ) : ℕ := if crosses e.1 e.2 f.1 f.2 then 1 else 0

def crossingCount : List (ℕ × ℕ) → ℕ
  | [] => 0
  | e::es => (es.map (edgeCross e)).sum + crossingCount es

def rotateEdge (n : ℕ) (e : ℕ × ℕ) : ℕ × ℕ :=
  (min (rotateVertex n e.1) (rotateVertex n e.2), max (rotateVertex n e.1) (rotateVertex n e.2))

theorem crosses_comm (a b c d : ℕ) : crosses a b c d ↔ crosses c d a b := by
  unfold crosses
  tauto

theorem edgeCross_comm (e f : ℕ × ℕ) : edgeCross e f = edgeCross f e := by
  simp only [edgeCross, crosses_comm]

theorem crossingCount_perm {M N : List (ℕ × ℕ)} (h : M.Perm N) : crossingCount M = crossingCount N := by
  induction h with
  | nil => rfl
  | cons e h ih =>
    simp only [crossingCount]
    rw [(h.map (edgeCross e)).sum_eq, ih]
  | swap e f es =>
    simp only [crossingCount, List.map_cons, List.sum_cons]
    rw [edgeCross_comm e f]
    omega
  | trans h₁ h₂ ih₁ ih₂ => exact ih₁.trans ih₂

theorem edgeCross_rotate (n : ℕ) (e f : ℕ × ℕ)
    (he : e.1 < e.2 ∧ e.2 < n) (hf : f.1 < f.2 ∧ f.2 < n) :
    edgeCross (rotateEdge n e) (rotateEdge n f) = edgeCross e f := by
  simp only [edgeCross, rotateEdge, ← crossing_rotate n e.1 e.2 f.1 f.2 he.1 hf.1 he.2 hf.2]

theorem crossingCount_rotate (n : ℕ) (M : List (ℕ × ℕ))
    (hM : ∀ e ∈ M, e.1 < e.2 ∧ e.2 < n) :
    crossingCount (M.map (rotateEdge n)) = crossingCount M := by
  induction M with
  | nil => rfl
  | cons e es ih =>
    have he : e.1 < e.2 ∧ e.2 < n := hM e (by simp)
    have hes : ∀ f ∈ es, f.1 < f.2 ∧ f.2 < n := by
      intro f hf
      exact hM f (by simp [hf])
    simp only [List.map_cons,crossingCount]
    rw [ih hes]
    congr 1
    simp only [List.map_map]
    apply congrArg List.sum
    apply List.map_congr_left
    intro f hf
    exact edgeCross_rotate n e f he (hes f hf)

theorem crossingCount_rotate_and_reorder (n : ℕ) (M N : List (ℕ × ℕ))
    (hM : ∀ e ∈ M, e.1 < e.2 ∧ e.2 < n)
    (hN : N.Perm (M.map (rotateEdge n))) : crossingCount N = crossingCount M := by
  rw [crossingCount_perm hN, crossingCount_rotate n M hM]

theorem edgeCross_eq_contribution (e f : ℕ × ℕ)
    (_he : e.1 < e.2) (_hf : f.1 < f.2) (hclose : f.2 < e.2) :
    edgeCross e f = GilmoreCrossingNesting.crossContribution e.1 f := by
  unfold edgeCross crosses GilmoreCrossingNesting.crossContribution
  split_ifs <;> omega

theorem crossingCount_eq_pairCount (M : List (ℕ × ℕ))
    (hord : ∀ e ∈ M, e.1 < e.2)
    (hsort : M.Pairwise (fun e f => f.2 < e.2)) :
    crossingCount M = GilmoreCrossingNesting.pairCount GilmoreCrossingNesting.crossContribution M := by
  induction M with
  | nil => rfl
  | cons e es ih =>
    have he : e.1 < e.2 := hord e (by simp)
    have hes : ∀ f ∈ es, f.1 < f.2 := by
      intro f hf
      exact hord f (by simp [hf])
    have hpair := List.pairwise_cons.mp hsort
    simp only [crossingCount,GilmoreCrossingNesting.pairCount,GilmoreCrossingNesting.pointArcCount]
    rw [ih hes hpair.2]
    congr 1
    apply congrArg List.sum
    apply List.map_congr_left
    intro f hf
    exact edgeCross_eq_contribution e f he (hes f hf) (hpair.1 f hf)

theorem matching_crossings_rotate (u : ℕ) (M N : List (ℕ × ℕ))
    (hM : M ∈ GilmoreCrossingNesting.matchingFinset u)
    (hN : N ∈ GilmoreCrossingNesting.matchingFinset u)
    (hperm : N.Perm (M.map (rotateEdge (2*u)))) :
    GilmoreCrossingNesting.pairCount GilmoreCrossingNesting.crossContribution N =
      GilmoreCrossingNesting.pairCount GilmoreCrossingNesting.crossContribution M := by
  obtain ⟨hpartM,hordM,hsortM⟩ := (GilmoreCrossingNesting.mem_matchingFinset (u := u) (arcs := M)).mp hM
  obtain ⟨hpartN,hordN,hsortN⟩ := (GilmoreCrossingNesting.mem_matchingFinset (u := u) (arcs := N)).mp hN
  have hvalid : ∀ e ∈ M, e.1 < e.2 ∧ e.2 < 2*u := by
    intro e he
    have he2 : e.2 ∈ GilmoreCrossingNesting.arcEndpoints M := by
      unfold GilmoreCrossingNesting.arcEndpoints
      exact List.mem_flatMap.mpr ⟨e, he, by simp⟩
    have hrange : e.2 ∈ List.range (2*u) := hpartM.mem_iff.mp he2
    exact ⟨hordM e he, List.mem_range.mp hrange⟩
  rw [← crossingCount_eq_pairCount N hordN hsortN, ← crossingCount_eq_pairCount M hordM hsortM]
  exact crossingCount_rotate_and_reorder (2*u) M N hvalid hperm

theorem rotate_range_perm (n : ℕ) : ((List.range n).map (rotateVertex n)).Perm (List.range n) := by
  have hinj : ∀ x ∈ List.range n, ∀ y ∈ List.range n, rotateVertex n x = rotateVertex n y → x = y := by
    intro x hx y hy he
    simp only [List.mem_range] at hx hy
    unfold rotateVertex at he
    split_ifs at he <;> omega
  have hnodup : ((List.range n).map (rotateVertex n)).Nodup := List.Nodup.map_on hinj List.nodup_range
  have hsubset : (List.range n).map (rotateVertex n) ⊆ List.range n := by
    intro z hz
    obtain ⟨x,hx,rfl⟩ := List.mem_map.mp hz
    simp only [List.mem_range] at hx ⊢
    unfold rotateVertex
    split_ifs <;> omega
  apply (List.subperm_of_subset hnodup hsubset).perm_of_length_le
  simp

theorem rotate_endpoints_perm (n : ℕ) (M : List (ℕ × ℕ)) :
    (GilmoreCrossingNesting.arcEndpoints (M.map (rotateEdge n))).Perm
      ((GilmoreCrossingNesting.arcEndpoints M).map (rotateVertex n)) := by
  induction M with
  | nil => simp [GilmoreCrossingNesting.arcEndpoints]
  | cons e es ih =>
    have hpair : ([min (rotateVertex n e.1) (rotateVertex n e.2), max (rotateVertex n e.1) (rotateVertex n e.2)] : List ℕ).Perm
        [rotateVertex n e.1, rotateVertex n e.2] := by
      by_cases h : rotateVertex n e.1 ≤ rotateVertex n e.2
      · simp [min_eq_left h, max_eq_right h]
      · have hh : rotateVertex n e.2 ≤ rotateVertex n e.1 := le_of_not_ge h
        simp only [min_eq_right hh, max_eq_left hh]
        exact List.Perm.swap _ _ _
    simpa [GilmoreCrossingNesting.arcEndpoints, rotateEdge] using hpair.append ih

theorem rotateVertex_inj (n x y : ℕ) (_hx : x<n) (_hy : y<n)
    (h : rotateVertex n x = rotateVertex n y) : x=y := by
  unfold rotateVertex at h
  split_ifs at h <;> omega

theorem rotateEdge_ordered (n : ℕ) (e : ℕ × ℕ) (he : e.1<e.2 ∧ e.2<n) :
    (rotateEdge n e).1 < (rotateEdge n e).2 := by
  have hne : rotateVertex n e.1 ≠ rotateVertex n e.2 := by
    intro hh
    have heq := rotateVertex_inj n e.1 e.2 (by omega) he.2 hh
    omega
  unfold rotateEdge
  dsimp only
  by_cases h : rotateVertex n e.1 ≤ rotateVertex n e.2
  · rw [min_eq_left h,max_eq_right h]
    omega
  · have hh : rotateVertex n e.2 ≤ rotateVertex n e.1 := le_of_not_ge h
    rw [min_eq_right hh,max_eq_left hh]
    omega

theorem rotated_matching_exists (u : ℕ) (M : List (ℕ × ℕ))
    (hM : M ∈ GilmoreCrossingNesting.matchingFinset u) :
    ∃ N ∈ GilmoreCrossingNesting.matchingFinset u, N.Perm (M.map (rotateEdge (2*u))) := by
  obtain ⟨hpart,hord,hsort⟩ := (GilmoreCrossingNesting.mem_matchingFinset (u := u) (arcs := M)).mp hM
  have hvalid : ∀ e ∈ M, e.1 < e.2 ∧ e.2 < 2*u := by
    intro e he
    have he2 : e.2 ∈ GilmoreCrossingNesting.arcEndpoints M := by
      unfold GilmoreCrossingNesting.arcEndpoints
      exact List.mem_flatMap.mpr ⟨e,he,by simp⟩
    exact ⟨hord e he, List.mem_range.mp (hpart.mem_iff.mp he2)⟩
  have hpart' : (GilmoreCrossingNesting.arcEndpoints (M.map (rotateEdge (2*u)))).Perm (List.range (2*u)) :=
    (rotate_endpoints_perm (2*u) M).trans ((hpart.map (rotateVertex (2*u))).trans (rotate_range_perm (2*u)))
  have hord' : ∀ e ∈ M.map (rotateEdge (2*u)), e.1<e.2 := by
    intro e he
    obtain ⟨e',he',rfl⟩ := List.mem_map.mp he
    exact rotateEdge_ordered (2*u) e' (hvalid e' he')
  obtain ⟨p,hp⟩ := GilmoreCrossingNesting.decodeMatching_surjective (M.map (rotateEdge (2*u))) hpart' hord'
  refine ⟨GilmoreCrossingNesting.decodeMatching p, ?_, hp⟩
  apply (GilmoreCrossingNesting.mem_matchingFinset (u := u) (arcs := GilmoreCrossingNesting.decodeMatching p)).mpr
  exact ⟨(GilmoreCrossingNesting.completePath_matching p.1 p.2).2.1,
    (GilmoreCrossingNesting.completePath_matching p.1 p.2).2.2,
    GilmoreCrossingNesting.closedArcs_sorted p.1 p.2⟩

def unrotateVertex (n x : ℕ) : ℕ := if x=0 then n-1 else x-1

def unrotateEdge (n : ℕ) (e : ℕ × ℕ) : ℕ × ℕ :=
  (min (unrotateVertex n e.1) (unrotateVertex n e.2), max (unrotateVertex n e.1) (unrotateVertex n e.2))

theorem unrotate_rotateVertex (n x : ℕ) (_hx : x<n) : unrotateVertex n (rotateVertex n x) = x := by
  by_cases h : x+1=n
  · have hn : n-1=x := by omega
    simp [rotateVertex, unrotateVertex, h, hn]
  · simp [rotateVertex, unrotateVertex, h]

theorem unrotate_rotateEdge (n : ℕ) (e : ℕ × ℕ) (he : e.1<e.2 ∧ e.2<n) :
    unrotateEdge n (rotateEdge n e) = e := by
  have h1 : e.1<n := by omega
  have h2 := he.2
  unfold unrotateEdge rotateEdge
  dsimp only
  by_cases h : rotateVertex n e.1 ≤ rotateVertex n e.2
  · rw [min_eq_left h, max_eq_right h, unrotate_rotateVertex n e.1 h1, unrotate_rotateVertex n e.2 h2]
    simp [min_eq_left he.1.le,max_eq_right he.1.le]
  · have hh : rotateVertex n e.2 ≤ rotateVertex n e.1 := le_of_not_ge h
    rw [min_eq_right hh, max_eq_left hh, unrotate_rotateVertex n e.1 h1, unrotate_rotateVertex n e.2 h2]
    simp [min_eq_right he.1.le,max_eq_left he.1.le]

theorem valid_matching_edges (u : ℕ) (M : List (ℕ × ℕ)) (hM : M ∈ GilmoreCrossingNesting.matchingFinset u) :
    ∀ e ∈ M, e.1 < e.2 ∧ e.2 < 2*u := by
  obtain ⟨hpart,hord,hsort⟩ := (GilmoreCrossingNesting.mem_matchingFinset (u := u) (arcs := M)).mp hM
  intro e he
  have he2 : e.2 ∈ GilmoreCrossingNesting.arcEndpoints M := by
    unfold GilmoreCrossingNesting.arcEndpoints
    exact List.mem_flatMap.mpr ⟨e,he,by simp⟩
  exact ⟨hord e he, List.mem_range.mp (hpart.mem_iff.mp he2)⟩

noncomputable def rotateMatching (u : ℕ) (M : {M // M ∈ GilmoreCrossingNesting.matchingFinset u}) :
    {M // M ∈ GilmoreCrossingNesting.matchingFinset u} := by
  classical
  let N := Classical.choose (rotated_matching_exists u M.val M.property)
  exact ⟨N, (Classical.choose_spec (rotated_matching_exists u M.val M.property)).1⟩

theorem rotateMatching_spec (u : ℕ) (M : {M // M ∈ GilmoreCrossingNesting.matchingFinset u}) :
    (rotateMatching u M).val.Perm (M.val.map (rotateEdge (2*u))) := by
  exact (Classical.choose_spec (rotated_matching_exists u M.val M.property)).2

theorem unrotate_rotate_list (u : ℕ) (M : List (ℕ × ℕ)) (hM : M ∈ GilmoreCrossingNesting.matchingFinset u) :
    (M.map (rotateEdge (2*u))).map (unrotateEdge (2*u)) = M := by
  rw [List.map_map]
  calc
    _ = M.map id := by
      apply List.map_congr_left
      intro e he
      exact unrotate_rotateEdge (2*u) e (valid_matching_edges u M hM e he)
    _ = M := List.map_id M

theorem rotateMatching_injective (u : ℕ) : Function.Injective (rotateMatching u) := by
  intro M N h
  apply Subtype.ext
  have hMN : (M.val.map (rotateEdge (2*u))).Perm (N.val.map (rotateEdge (2*u))) := by
    have hm := rotateMatching_spec u M
    have hn := rotateMatching_spec u N
    have heq : (rotateMatching u M).val = (rotateMatching u N).val := congrArg Subtype.val h
    rw [heq] at hm
    exact hm.symm.trans hn
  have hp := hMN.map (unrotateEdge (2*u))
  rw [unrotate_rotate_list u M.val M.property, unrotate_rotate_list u N.val N.property] at hp
  have hsM := ((GilmoreCrossingNesting.mem_matchingFinset (u := u) (arcs := M.val)).mp M.property).2.2
  have hsN := ((GilmoreCrossingNesting.mem_matchingFinset (u := u) (arcs := N.val)).mp N.property).2.2
  apply List.Perm.eq_of_pairwise (le := fun a b : ℕ × ℕ => b.2 < a.2) ?_ hsM hsN hp
  intro a b ha hb hab hba
  omega

theorem rotateMatching_bijective (u : ℕ) : Function.Bijective (rotateMatching u) := by
  have hinj := rotateMatching_injective u
  exact ⟨hinj, Finite.injective_iff_surjective.mp hinj⟩

noncomputable def rotateWeight (n : ℕ) (w : ℕ → ℕ → ℝ) (i j : ℕ) : ℝ :=
  w (min (unrotateVertex n i) (unrotateVertex n j)) (max (unrotateVertex n i) (unrotateVertex n j))

theorem rotate_weight_edge (n : ℕ) (w : ℕ → ℕ → ℝ) (e : ℕ × ℕ)
    (he : e.1<e.2 ∧ e.2<n) :
    rotateWeight n w (rotateEdge n e).1 (rotateEdge n e).2 = w e.1 e.2 := by
  change w (unrotateEdge n (rotateEdge n e)).1 (unrotateEdge n (rotateEdge n e)).2 = w e.1 e.2
  rw [unrotate_rotateEdge n e he]

theorem rotateMatching_edgeProduct (u : ℕ) (w : ℕ → ℕ → ℝ)
    (M : {M // M ∈ GilmoreCrossingNesting.matchingFinset u}) :
    edgeProduct (rotateWeight (2*u) w) (rotateMatching u M).val = edgeProduct w M.val := by
  unfold edgeProduct
  rw [((rotateMatching_spec u M).map (fun e => rotateWeight (2*u) w e.1 e.2)).prod_eq]
  rw [List.map_map]
  apply congrArg List.prod
  apply List.map_congr_left
  intro e he
  exact rotate_weight_edge (2*u) w e (valid_matching_edges u M.val M.property e he)

theorem matchingPfaffian_cyclic_rotation (u : ℕ) (w : ℕ → ℕ → ℝ) :
    matchingPfaffian u (rotateWeight (2*u) w) = matchingPfaffian u w := by
  unfold matchingPfaffian
  symm
  apply Finset.sum_bij (fun M hM => (rotateMatching u ⟨M,hM⟩).val)
  · intro M hM
    exact (rotateMatching u ⟨M,hM⟩).property
  · intro M hM N hN h
    have hh : rotateMatching u ⟨M,hM⟩ = rotateMatching u ⟨N,hN⟩ := Subtype.ext h
    exact congrArg Subtype.val (rotateMatching_injective u hh)
  · intro N hN
    obtain ⟨M,hM⟩ := (rotateMatching_bijective u).2 ⟨N,hN⟩
    exact ⟨M.val,M.property,congrArg Subtype.val hM⟩
  · intro M hM
    have hc := matching_crossings_rotate u M (rotateMatching u ⟨M,hM⟩).val hM
      (rotateMatching u ⟨M,hM⟩).property (rotateMatching_spec u ⟨M,hM⟩)
    have hw := rotateMatching_edgeProduct u w ⟨M,hM⟩
    rw [hc,hw]
end JohnsonPfaffian
