import Conjectures.JohnsonPfaffianAllMatching
import Mathlib.Algebra.Order.BigOperators.GroupWithZero.Finset

/-!
# Johnson's conjecture

The circular interval product theorem in Section 2 of the existing proof.
Circular support excludes the two alternating four-vertex patterns, which
gives the uncrossing inequality factor by factor.
-/

namespace JohnsonPfaffian

open GilmoreCrossingNesting

theorem circular_intervalFactor_uncrossing {n : ℕ} {S : ℕ → Bool}
    (hS : CircularSupport n S) (t : ℝ) (ht : 1 ≤ t)
    (a b c d : ℕ) (hab : a < b) (hbc : b < c) (hcd : c < d) (hd : d < n) :
    intervalFactor t (S a) (S c) * intervalFactor t (S b) (S d) ≤
      intervalFactor t (S a) (S b) * intervalFactor t (S c) (S d) := by
  have h1010 : ¬(S a = true ∧ S b = false ∧ S c = true ∧ S d = false) := by
    rintro ⟨ha, hb, hc, hd'⟩
    rcases hS with hS | hS
    · have h := hS a b c hab.le hbc.le (lt_trans hcd hd) ha hc
      simp [hb] at h
    · have h := hS b c d hbc.le hcd.le hd (by simp [hb]) (by simp [hd'])
      simp [hc] at h
  have h0101 : ¬(S a = false ∧ S b = true ∧ S c = false ∧ S d = true) := by
    rintro ⟨ha, hb, hc, hd'⟩
    rcases hS with hS | hS
    · have h := hS b c d hbc.le hcd.le hd hb hd'
      simp [hc] at h
    · have h := hS a b c hab.le hbc.le (lt_trans hcd hd) (by simp [ha]) (by simp [hc])
      simp [hb] at h
  cases ha : S a <;> cases hb : S b <;> cases hc : S c <;> cases hd' : S d <;>
    simp_all [intervalFactor]

theorem CircularData.uncrossing (D : CircularData) {n : ℕ} (hD : D.Valid n)
    (a b c d : ℕ) (hab : a < b) (hbc : b < c) (hcd : c < d) (hd : d < n) :
    D.weight a c * D.weight b d ≤ D.weight a b * D.weight c d := by
  have hp :
      (∏ q, intervalFactor (D.parameter q) (D.support q a) (D.support q c) *
        intervalFactor (D.parameter q) (D.support q b) (D.support q d)) ≤
      ∏ q, intervalFactor (D.parameter q) (D.support q a) (D.support q b) *
        intervalFactor (D.parameter q) (D.support q c) (D.support q d) := by
    apply Finset.prod_le_prod₀
    · intro q _
      exact mul_nonneg (intervalFactor_positive _ _ _ (lt_of_lt_of_le zero_lt_one (hD.2.1 q))).le
        (intervalFactor_positive _ _ _ (lt_of_lt_of_le zero_lt_one (hD.2.1 q))).le
    · intro q _
      exact circular_intervalFactor_uncrossing (hD.1 q) _ (hD.2.1 q) a b c d hab hbc hcd hd
  have hdiag : 0 ≤ D.diagonal a * D.diagonal b * D.diagonal c * D.diagonal d := by
    apply le_of_lt
    exact mul_pos (mul_pos (mul_pos (hD.2.2 a (by omega)) (hD.2.2 b (by omega)))
      (hD.2.2 c (by omega))) (hD.2.2 d hd)
  have h := mul_le_mul_of_nonneg_left hp hdiag
  simp only [Finset.prod_mul_distrib] at h
  unfold CircularData.weight
  convert h using 1 <;> ring

/-- Every perfect matching is bounded by the Pfaffian for every circular interval product. -/
theorem CircularData.matching_bound (u : ℕ) (D : CircularData) (hD : D.Valid (2*u))
    (M : List (ℕ × ℕ)) (hM : M ∈ matchingFinset u) :
    edgeProduct D.weight M ≤ matchingPfaffian u D.weight :=
  D.matching_bound_of_uncrossing u hD (D.uncrossing hD) M hM

end JohnsonPfaffian
