import Conjectures.JohnsonPfaffianResidual
namespace JohnsonPfaffian
open GilmoreCrossingNesting

noncomputable def intervalWeight {R : Type*} [CommRing R] (I : Finset (ℕ × ℕ))
    (t : ℕ × ℕ → R) (a b : ℕ) : R :=
  ∑ J ∈ I, if J.1 ≤ a ∧ a ≤ J.2 ∧ J.1 ≤ b ∧ b ≤ J.2 then t J else 0

theorem intervalWeight_twin {R : Type*} [CommRing R] (I : Finset (ℕ × ℕ))
    (t : ℕ × ℕ → R) (i : ℕ)
    (htwin : ∀ J ∈ I, (J.1 ≤ i ∧ i ≤ J.2) ↔ (J.1 ≤ i+1 ∧ i+1 ≤ J.2)) :
    ∀ k, k≠i → k≠i+1 →
      intervalWeight I t (min i k) (max i k) =
      intervalWeight I t (min (i+1) k) (max (i+1) k) := by
  intro k hk0 hk1
  unfold intervalWeight
  apply Finset.sum_congr rfl
  intro J hJ
  have hh (a b : ℕ) :
      (J.1 ≤ min a b ∧ min a b ≤ J.2 ∧ J.1 ≤ max a b ∧ max a b ≤ J.2) ↔
      ((J.1 ≤ a ∧ a ≤ J.2) ∧ (J.1 ≤ b ∧ b ≤ J.2)) := by
    simp only [le_min_iff, min_le_iff, le_max_iff, max_le_iff]
    tauto
  simp only [hh,htwin J hJ]

theorem intervalWeight_twin_delete (u i : ℕ) (hi : i+1<2*(u+1))
    {R : Type*} [CommRing R] (I : Finset (ℕ × ℕ)) (t : ℕ × ℕ → R)
    (htwin : ∀ J ∈ I, (J.1 ≤ i ∧ i ≤ J.2) ↔ (J.1 ≤ i+1 ∧ i+1 ≤ J.2)) :
    (∑ M ∈ matchingFinset (u+1), (-1:R)^(pairCount crossContribution M) * edgeProduct (intervalWeight I t) M) =
      intervalWeight I t i (i+1) * ∑ M ∈ matchingFinset u,
        (-1:R)^(pairCount crossContribution M) *
          edgeProduct (fun a b => intervalWeight I t (skipAdjacent i a) (skipAdjacent i b)) M :=
  twin_rows_delete_standard u i hi (intervalWeight I t) (intervalWeight_twin I t i htwin)
theorem uncovered_interval_weight {R : Type*} [CommRing R] (I : Finset (ℕ × ℕ))
    (t : ℕ × ℕ → R) (v a b : ℕ)
    (huncovered : ∀ J ∈ I, ¬ (J.1 ≤ v ∧ v ≤ J.2)) (hv : a=v ∨ b=v) :
    intervalWeight I t a b = 0 := by
  unfold intervalWeight
  apply Finset.sum_eq_zero
  intro J hJ
  have h := huncovered J hJ
  split_ifs with hp
  · exfalso
    apply h
    rcases hv with rfl | rfl <;> omega
  · rfl

theorem uncovered_interval_matching_sum (u v : ℕ) {R : Type*} [CommRing R]
    (I : Finset (ℕ × ℕ)) (t : ℕ × ℕ → R) (hv : v<2*u)
    (huncovered : ∀ J ∈ I, ¬ (J.1 ≤ v ∧ v ≤ J.2)) :
    ∑ M ∈ matchingFinset u, (-1:R)^(pairCount crossContribution M) * edgeProduct (intervalWeight I t) M = 0 := by
  apply Finset.sum_eq_zero
  intro M hM
  obtain ⟨e,he,hei⟩ := matching_edge_at_vertex u v M hM hv
  have hezero := uncovered_interval_weight I t v e.1 e.2 huncovered hei
  have hp : edgeProduct (intervalWeight I t) M = 0 := by
    unfold edgeProduct
    apply List.prod_eq_zero
    exact List.mem_map.mpr ⟨e,he,hezero⟩
  simp [hp]

theorem sparse_interval_reduction (u : ℕ) {R : Type*} [CommRing R]
    (I : Finset (ℕ × ℕ)) (t : ℕ × ℕ → R)
    (hcard : I.card ≤ u+1) (hvalid : ∀ J ∈ I, J.1 ≤ J.2 ∧ J.2 < 2*(u+1)) :
    (∑ M ∈ matchingFinset (u+1), (-1:R)^(pairCount crossContribution M) * edgeProduct (intervalWeight I t) M) = 0 ∨
    ∃ i, i+1<2*(u+1) ∧
      (∑ M ∈ matchingFinset (u+1), (-1:R)^(pairCount crossContribution M) * edgeProduct (intervalWeight I t) M) =
        intervalWeight I t i (i+1) * ∑ M ∈ matchingFinset u,
          (-1:R)^(pairCount crossContribution M) *
            edgeProduct (fun a b => intervalWeight I t (skipAdjacent i a) (skipAdjacent i b)) M := by
  classical
  by_cases hcover : ∀ v < 2*(u+1), ∃ J ∈ I, J.1 ≤ v ∧ v ≤ J.2
  · obtain ⟨i,hi,htwin⟩ := covered_intervals_have_twins (2*(u+1)) I (by omega) (by omega) hvalid hcover
    exact Or.inr ⟨i,hi,intervalWeight_twin_delete u i hi I t htwin⟩
  · push Not at hcover
    obtain ⟨v,hv,hno⟩ := hcover
    exact Or.inl (uncovered_interval_matching_sum (u+1) v I t hv (by intro J hJ h; exact Nat.not_le_of_gt (hno J hJ h.1) h.2))
noncomputable def restrictedInterval (u i : ℕ) (J : ℕ × ℕ) : Finset ℕ :=
  (Finset.range (2*u)).filter (fun x => J.1 ≤ skipAdjacent i x ∧ skipAdjacent i x ≤ J.2)

theorem restrictedInterval_mem (u i : ℕ) (J : ℕ × ℕ) (x : ℕ) :
    x ∈ restrictedInterval u i J ↔
      x<2*u ∧ J.1 ≤ skipAdjacent i x ∧ skipAdjacent i x ≤ J.2 := by
  simp [restrictedInterval]

theorem restrictedInterval_convex (u i : ℕ) (J : ℕ × ℕ) (a b c : ℕ)
    (ha : a ∈ restrictedInterval u i J) (hc : c ∈ restrictedInterval u i J)
    (hab : a≤b) (hbc : b≤c) : b ∈ restrictedInterval u i J := by
  rw [restrictedInterval_mem] at ha hc ⊢
  have hab' := (skipAdjacent_strictMono i).monotone hab
  have hbc' := (skipAdjacent_strictMono i).monotone hbc
  omega

theorem restricted_interval_weight {R : Type*} [CommRing R] (u i : ℕ)
    (I : Finset (ℕ × ℕ)) (t : ℕ × ℕ → R) (a b : ℕ) (ha : a<2*u) (hb : b<2*u) :
    intervalWeight I t (skipAdjacent i a) (skipAdjacent i b) =
      ∑ J ∈ I, if a ∈ restrictedInterval u i J ∧ b ∈ restrictedInterval u i J then t J else 0 := by
  unfold intervalWeight
  apply Finset.sum_congr rfl
  intro J hJ
  simp [restrictedInterval_mem,ha,hb, and_assoc]
end JohnsonPfaffian
