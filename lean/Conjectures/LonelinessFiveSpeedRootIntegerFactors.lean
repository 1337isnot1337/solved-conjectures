import Conjectures.LonelinessFiveSpeedRootSemanticsForms
import Mathlib.Tactic.Ring

/-! The six extra factors attached to an actual relation x+y=z. The same
definition applies when the two addends are equal. Joint control of x+y
gives the required 4C bound for every factor. -/

namespace Loneliness.FiveSpeedRoot

def tripleExtraFactors (x y : ℕ) : Fin 6 → ℤ :=
  ![(y : ℤ) - 3 * (x : ℤ), 3 * (y : ℤ) - (x : ℤ),
    (y : ℤ) + 4 * (x : ℤ), 4 * (y : ℤ) + (x : ℤ),
    3 * (y : ℤ) + 4 * (x : ℤ), 4 * (y : ℤ) + 3 * (x : ℤ)]

def tripleExtraCoefficients : Fin 6 → Fin 2 → ℤ :=
  ![![-3, 1], ![-1, 3], ![4, 1], ![1, 4], ![4, 3], ![3, 4]]

theorem tripleExtraFactors_eq_coefficients (x y : ℕ) (i : Fin 6) :
    tripleExtraFactors x y i =
      tripleExtraCoefficients i 0 * (x : ℤ) +
        tripleExtraCoefficients i 1 * (y : ℤ) := by
  fin_cases i <;> simp [tripleExtraFactors, tripleExtraCoefficients] <;> ring

theorem tripleExtraCoefficients_bound :
    ∀ i : Fin 6, ∀ j : Fin 2, (tripleExtraCoefficients i j).natAbs ≤ 4 := by
  decide +kernel

theorem two_coordinate_natAbs_bound (x y C : ℕ) (hxy : x + y ≤ C)
    (a b : ℤ) (ha : a.natAbs ≤ 4) (hb : b.natAbs ≤ 4) :
    (a * (x : ℤ) + b * (y : ℤ)).natAbs ≤ 4 * C := by
  calc
    (a * (x : ℤ) + b * (y : ℤ)).natAbs ≤
        (a * (x : ℤ)).natAbs + (b * (y : ℤ)).natAbs := Int.natAbs_add_le _ _
    _ = a.natAbs * x + b.natAbs * y := by
      simp only [Int.natAbs_mul, Int.natAbs_natCast]
    _ ≤ 4 * x + 4 * y :=
      Nat.add_le_add (Nat.mul_le_mul_right x ha) (Nat.mul_le_mul_right y hb)
    _ = 4 * (x + y) := (Nat.mul_add 4 x y).symm
    _ ≤ 4 * C := Nat.mul_le_mul_left 4 hxy

theorem tripleExtraFactors_natAbs_le (x y C : ℕ) (hxy : x + y ≤ C) (i : Fin 6) :
    (tripleExtraFactors x y i).natAbs ≤ 4 * C := by
  rw [tripleExtraFactors_eq_coefficients]
  exact two_coordinate_natAbs_bound x y C hxy _ _
    (tripleExtraCoefficients_bound i 0) (tripleExtraCoefficients_bound i 1)

theorem tripleExtraFactors_zero_iff (x y : ℕ) (hx : 0 < x) (hy : 0 < y) :
    (∃ i : Fin 6, tripleExtraFactors x y i = 0) ↔ y = 3 * x ∨ x = 3 * y := by
  constructor
  · rintro ⟨i, hi⟩
    fin_cases i <;> simp [tripleExtraFactors] at hi <;> omega
  · rintro (h | h)
    · exact ⟨0, by simp [tripleExtraFactors, h, Nat.cast_mul]⟩
    · exact ⟨1, by simp [tripleExtraFactors, h, Nat.cast_mul]⟩

theorem tripleExtraFactors_zero_gives_134 (x y z : ℕ) (hx : 0 < x) (hy : 0 < y)
    (hxy : x + y = z) (hzero : ∃ i : Fin 6, tripleExtraFactors x y i = 0) :
    (y = 3 * x ∧ z = 4 * x) ∨ (x = 3 * y ∧ z = 4 * y) := by
  rcases (tripleExtraFactors_zero_iff x y hx hy).mp hzero with h | h
  · exact Or.inl ⟨h, by omega⟩
  · exact Or.inr ⟨h, by omega⟩

theorem tripleExtraFactors_nonzero_of_no_134 (x y z : ℕ)
    (hx : 0 < x) (hy : 0 < y) (hxy : x + y = z)
    (hnot : ¬((y = 3 * x ∧ z = 4 * x) ∨ (x = 3 * y ∧ z = 4 * y))) :
    ∀ i : Fin 6, tripleExtraFactors x y i ≠ 0 := by
  intro i hi
  exact hnot (tripleExtraFactors_zero_gives_134 x y z hx hy hxy ⟨i, hi⟩)

end Loneliness.FiveSpeedRoot
