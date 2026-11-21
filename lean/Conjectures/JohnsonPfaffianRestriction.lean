import Conjectures.JohnsonPfaffianSparse
namespace JohnsonPfaffian

noncomputable def compressedInterval (u i : ℕ) (J : ℕ × ℕ) : ℕ × ℕ :=
  let S := restrictedInterval u i J
  if h : S.Nonempty then (S.min' h,S.max' h) else (0,0)

theorem compressedInterval_mem (u i : ℕ) (J : ℕ × ℕ) (a : ℕ)
    (hS : (restrictedInterval u i J).Nonempty) :
    a ∈ restrictedInterval u i J ↔ (compressedInterval u i J).1 ≤ a ∧ a ≤ (compressedInterval u i J).2 := by
  simp only [compressedInterval, dite_eq_left hS]
  constructor
  · intro ha
    exact ⟨Finset.min'_le _ a ha, Finset.le_max' _ a ha⟩
  · rintro ⟨ha,hb⟩
    exact restrictedInterval_convex u i J _ a _ (Finset.min'_mem _ hS) (Finset.max'_mem _ hS) ha hb

theorem compressedInterval_pair (u i : ℕ) (J : ℕ × ℕ) (a b : ℕ) (hab : a<b) :
    (a ∈ restrictedInterval u i J ∧ b ∈ restrictedInterval u i J) ↔
    ((compressedInterval u i J).1 ≤ a ∧ a ≤ (compressedInterval u i J).2 ∧
      (compressedInterval u i J).1 ≤ b ∧ b ≤ (compressedInterval u i J).2) := by
  classical
  by_cases h : (restrictedInterval u i J).Nonempty
  · simp only [compressedInterval_mem u i J _ h, and_assoc]
  · have he : restrictedInterval u i J = ∅ := Finset.not_nonempty_iff_eq_empty.mp h
    simp [he,compressedInterval]
    omega
theorem compressedInterval_valid (u i : ℕ) (J : ℕ × ℕ) (hu : 0<u) :
    (compressedInterval u i J).1 ≤ (compressedInterval u i J).2 ∧
      (compressedInterval u i J).2 < 2*u := by
  classical
  by_cases h : (restrictedInterval u i J).Nonempty
  · simp only [compressedInterval,dite_eq_left h]
    constructor
    · exact Finset.min'_le _ _ (Finset.max'_mem _ h)
    · have := (restrictedInterval_mem u i J _).mp (Finset.max'_mem _ h)
      exact this.1
  · simp [compressedInterval,h]
    omega

noncomputable def compressedIntervalWeights {R : Type*} [CommRing R] (u i : ℕ)
    (I : Finset (ℕ × ℕ)) (t : ℕ × ℕ → R) (K : ℕ × ℕ) : R :=
  ∑ J ∈ I.filter (fun J => compressedInterval u i J = K), t J

theorem intervalWeight_restrict {R : Type*} [CommRing R] (u i : ℕ)
    (I : Finset (ℕ × ℕ)) (t : ℕ × ℕ → R) (a b : ℕ) (hab : a<b) (hb : b<2*u) :
    intervalWeight I t (skipAdjacent i a) (skipAdjacent i b) =
      intervalWeight (I.image (compressedInterval u i)) (compressedIntervalWeights u i I t) a b := by
  classical
  have ha : a<2*u := by omega
  rw [restricted_interval_weight u i I t a b ha hb]
  unfold intervalWeight compressedIntervalWeights
  have hfiber := Finset.sum_fiberwise_of_maps_to (t := I.image (compressedInterval u i))
    (g := compressedInterval u i) (fun J hJ => Finset.mem_image_of_mem _ hJ)
    (fun J => if a ∈ restrictedInterval u i J ∧ b ∈ restrictedInterval u i J then t J else 0)
  rw [← hfiber]
  apply Finset.sum_congr rfl
  intro K hK
  by_cases hKcond : K.1 ≤ a ∧ a ≤ K.2 ∧ K.1 ≤ b ∧ b ≤ K.2
  · simp only [ite_eq_left hKcond]
    apply Finset.sum_congr rfl
    intro J hJ
    have hj := (Finset.mem_filter.mp hJ).2
    have hc := (compressedInterval_pair u i J a b hab).mpr (by simpa [hj] using hKcond)
    simp [hc]
  · simp only [ite_eq_right hKcond]
    apply Finset.sum_eq_zero
    intro J hJ
    have hj := (Finset.mem_filter.mp hJ).2
    have hc : ¬(a ∈ restrictedInterval u i J ∧ b ∈ restrictedInterval u i J) := by
      intro h
      apply hKcond
      simpa [hj] using (compressedInterval_pair u i J a b hab).mp h
    simp [hc]
theorem restricted_matching_edgeProduct {R : Type*} [CommRing R] (u i : ℕ)
    (I : Finset (ℕ × ℕ)) (t : ℕ × ℕ → R) (M : List (ℕ × ℕ))
    (hM : M ∈ GilmoreCrossingNesting.matchingFinset u) :
    edgeProduct (fun a b => intervalWeight I t (skipAdjacent i a) (skipAdjacent i b)) M =
      edgeProduct (intervalWeight (I.image (compressedInterval u i)) (compressedIntervalWeights u i I t)) M := by
  unfold edgeProduct
  apply congrArg List.prod
  apply List.map_congr_left
  intro e he
  have hvalid := valid_matching_edges u M hM e he
  exact intervalWeight_restrict u i I t e.1 e.2 hvalid.1 hvalid.2

theorem sparse_interval_inductive_step (u : ℕ) {R : Type*} [CommRing R]
    (I : Finset (ℕ × ℕ)) (t : ℕ × ℕ → R)
    (hcard : I.card ≤ u+1) (hvalid : ∀ J ∈ I, J.1 ≤ J.2 ∧ J.2 < 2*(u+1)) :
    (∑ M ∈ GilmoreCrossingNesting.matchingFinset (u+1),
      (-1:R)^(GilmoreCrossingNesting.pairCount GilmoreCrossingNesting.crossContribution M) * edgeProduct (intervalWeight I t) M) = 0 ∨
    ∃ i, i+1<2*(u+1) ∧
      (∑ M ∈ GilmoreCrossingNesting.matchingFinset (u+1),
        (-1:R)^(GilmoreCrossingNesting.pairCount GilmoreCrossingNesting.crossContribution M) * edgeProduct (intervalWeight I t) M) =
        intervalWeight I t i (i+1) * ∑ M ∈ GilmoreCrossingNesting.matchingFinset u,
          (-1:R)^(GilmoreCrossingNesting.pairCount GilmoreCrossingNesting.crossContribution M) *
            edgeProduct (intervalWeight (I.image (compressedInterval u i)) (compressedIntervalWeights u i I t)) M := by
  rcases sparse_interval_reduction u I t hcard hvalid with hz | ⟨i,hi,heq⟩
  · exact Or.inl hz
  · right
    refine ⟨i,hi,?_⟩
    rw [heq]
    congr 1
    apply Finset.sum_congr rfl
    intro M hM
    rw [restricted_matching_edgeProduct u i I t M hM]
end JohnsonPfaffian
