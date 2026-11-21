import Conjectures.JohnsonPfaffianExpansion
namespace JohnsonPfaffian
open GilmoreCrossingNesting

theorem borderPrefix_interior_congr (u q : ℕ) (w v : ℕ → ℕ → ℝ)
    (h : ∀ a b, 0<a → a<b → b<2*(u+1) → w a b = v a b) :
    borderPrefix u q w = borderPrefix u q v := by
  unfold borderPrefix
  apply Finset.sum_congr rfl
  intro M hM
  congr 1
  unfold edgeProduct
  apply congrArg List.prod
  apply List.map_congr_left
  intro e he
  have hv := valid_matching_edges (u+1) M hM e he
  by_cases h0 : e.1=0
  · simp [borderWeight,h0]
  · simp [borderWeight,h0,h e.1 e.2 (by omega) hv.1 hv.2]

theorem general_endpoint_prefix_bound (u : ℕ) (hu : 0<u) (w : ℕ → ℕ → ℝ)
    (g : ℕ × ℕ → ℝ) (hg : ∀ J, 0≤g J) (hg0 : ∀ J, J.1=0 → g J=0)
    (hint : ∀ a b, 0<a → a<b → b<2*(u+1) →
      w a b = intervalWeight (intervalUniverse (2*(u+1))) g a b)
    (hpos : ∀ j, 0<j → j<2*(u+1) → 0≤w 0 j)
    (hmono : ∀ j, 0<j → j+1<2*(u+1) → w 0 (j+1) ≤ w 0 j) :
    w 0 (2*u+1) * (borderPrefix u (2*u+1) w - borderPrefix u (2*u) w) ≤ matchingPfaffian (u+1) w := by
  let a : ℕ → ℝ := fun j => w 0 (j+1)
  let z : ℕ → ℝ := fun q => borderPrefix u q w
  have hz0 : z 0 = 0 := borderPrefix_zero u w
  have hapos : 0 ≤ a (2*u-1) := hpos _ (by omega) (by omega)
  have hz : ∀ q ≤ (2*u-1)+1, 0 ≤ z q := by
    intro q hq
    have hq' : q < 2*(u+1) := by omega
    rw [show z q = borderPrefix u q (intervalWeight (intervalUniverse (2*(u+1))) g) from borderPrefix_interior_congr u q w _ hint]
    exact border_prefix_matching_nonnegative u q hq' g hg hg0
  have hmono' : ∀ j < 2*u-1, a (j+1) ≤ a j := by
    intro j hj
    exact hmono (j+1) (by omega) (by omega)
  have hpartial := nonnegative_prefix_expansion a z (2*u-1) hz0 hapos hz hmono'
  have hN : 2*u-1+1 = 2*u := by omega
  rw [hN] at hpartial
  rw [matchingPfaffian_first_row, Finset.sum_range_succ]
  change w 0 (2*u+1) * (z (2*u+1)-z (2*u)) ≤
    (∑ j ∈ Finset.range (2*u), a j * (z (j+1)-z j)) + w 0 (2*u+1) * (z (2*u+1)-z (2*u))
  linarith
def interiorInterval (J : ℕ × ℕ) : ℕ × ℕ :=
  if J.2=0 then (1,1) else (max J.1 1,J.2)

theorem interiorInterval_valid (n : ℕ) (hn : 1<n) (J : ℕ × ℕ)
    (hJ : J ∈ intervalUniverse n) : interiorInterval J ∈ intervalUniverse n := by
  have hv := (mem_intervalUniverse n J).mp hJ
  apply (mem_intervalUniverse n (interiorInterval J)).mpr
  unfold interiorInterval
  split_ifs <;> simp_all
  all_goals omega

theorem interiorInterval_first_pos (J : ℕ × ℕ) : 0<(interiorInterval J).1 := by
  unfold interiorInterval
  split_ifs <;> simp_all

theorem interiorInterval_covers (J : ℕ × ℕ) (a b : ℕ)
    (ha : 0<a) (hab : a<b) :
    ((interiorInterval J).1 ≤ a ∧ a ≤ (interiorInterval J).2 ∧
      (interiorInterval J).1 ≤ b ∧ b ≤ (interiorInterval J).2) ↔
    (J.1 ≤ a ∧ a ≤ J.2 ∧ J.1 ≤ b ∧ b ≤ J.2) := by
  unfold interiorInterval
  split_ifs <;> simp_all <;> omega

noncomputable def interiorWeights (n : ℕ) (t : ℕ × ℕ → ℝ) (K : ℕ × ℕ) : ℝ :=
  ∑ J ∈ (intervalUniverse n).filter (fun J => interiorInterval J = K), t J

theorem interiorWeights_nonnegative (n : ℕ) (t : ℕ × ℕ → ℝ)
    (ht : ∀ J ∈ intervalUniverse n, 0≤t J) (K : ℕ × ℕ) : 0 ≤ interiorWeights n t K := by
  unfold interiorWeights
  apply Finset.sum_nonneg
  intro J hJ
  exact ht J (Finset.mem_filter.mp hJ).1

theorem interiorWeights_zero_first (n : ℕ) (t : ℕ × ℕ → ℝ) (K : ℕ × ℕ)
    (h0 : K.1=0) : interiorWeights n t K = 0 := by
  unfold interiorWeights
  apply Finset.sum_eq_zero
  intro J hJ
  have heq := (Finset.mem_filter.mp hJ).2
  have hp := interiorInterval_first_pos J
  rw [heq,h0] at hp
  omega

theorem intervalWeight_interior (n : ℕ) (hn : 1<n) (t : ℕ × ℕ → ℝ) (a b : ℕ)
    (ha : 0<a) (hab : a<b) :
    intervalWeight (intervalUniverse n) t a b = intervalWeight (intervalUniverse n) (interiorWeights n t) a b := by
  classical
  unfold intervalWeight interiorWeights
  have hfiber := Finset.sum_fiberwise_of_maps_to (t := intervalUniverse n)
    (g := interiorInterval) (fun J hJ => interiorInterval_valid n hn J hJ)
    (fun J => if J.1 ≤ a ∧ a ≤ J.2 ∧ J.1 ≤ b ∧ b ≤ J.2 then t J else 0)
  rw [← hfiber]
  apply Finset.sum_congr rfl
  intro K hK
  by_cases hKcond : K.1 ≤ a ∧ a ≤ K.2 ∧ K.1 ≤ b ∧ b ≤ K.2
  · simp only [ite_eq_left hKcond]
    apply Finset.sum_congr rfl
    intro J hJ
    have hj := (Finset.mem_filter.mp hJ).2
    have hc := (interiorInterval_covers J a b ha hab).mp (by simpa [hj] using hKcond)
    simp [hc]
  · simp only [ite_eq_right hKcond]
    apply Finset.sum_eq_zero
    intro J hJ
    have hj := (Finset.mem_filter.mp hJ).2
    have hc : ¬(J.1 ≤ a ∧ a ≤ J.2 ∧ J.1 ≤ b ∧ b ≤ J.2) := by
      intro h
      apply hKcond
      simpa [hj] using (interiorInterval_covers J a b ha hab).mpr h
    simp [hc]
theorem interval_endpoint_prefix_general (u : ℕ) (hu : 0<u) (t : ℕ × ℕ → ℝ)
    (ht : ∀ J ∈ intervalUniverse (2*(u+1)), 0≤t J) :
    let w := intervalWeight (intervalUniverse (2*(u+1))) t
    w 0 (2*u+1) * (borderPrefix u (2*u+1) w - borderPrefix u (2*u) w) ≤ matchingPfaffian (u+1) w := by
  let n := 2*(u+1)
  let w := intervalWeight (intervalUniverse n) t
  let g := interiorWeights n t
  have hn : 1<n := by dsimp [n]; omega
  have hg : ∀ J, 0≤g J := interiorWeights_nonnegative n t ht
  have hg0 : ∀ J, J.1=0 → g J=0 := interiorWeights_zero_first n t
  have hint : ∀ a b, 0<a → a<b → b<2*(u+1) → w a b = intervalWeight (intervalUniverse (2*(u+1))) g a b := by
    intro a b ha hab hb
    exact intervalWeight_interior n hn t a b ha hab
  have hpos : ∀ j, 0<j → j<2*(u+1) → 0≤w 0 j := by
    intro j hj hj'
    exact intervalWeight_nonnegative _ _ ht _ _
  have hmono : ∀ j, 0<j → j+1<2*(u+1) → w 0 (j+1) ≤ w 0 j := by
    intro j hj hj'
    exact intervalWeight_antitone_right _ _ ht 0 j (j+1) (by omega) (by omega)
  exact general_endpoint_prefix_bound u hu w g hg hg0 hint hpos hmono
end JohnsonPfaffian
