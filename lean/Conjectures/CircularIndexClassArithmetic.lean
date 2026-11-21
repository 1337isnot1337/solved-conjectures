import Conjectures.CircularIndexBase

/-!
# Translation arithmetic for the circulant color classes

Classes are indexed by `2*i + ε`.  The inverse of multiplication by three
on their cyclic index set gives the two shifts tested in this module.
-/

namespace CircularIndex

theorem mod_eq_alternatives (n a b : Nat) (_hn : 0 < n) (ha : a < 2 * n)
    (hb : b < n) (h : a % n = b) : a = b ∨ a = b + n := by
  by_cases hal : a < n
  · rw [Nat.mod_eq_of_lt hal] at h
    exact Or.inl h
  · have han : n ≤ a := by omega
    have has : a - n < n := by omega
    rw [Nat.mod_eq_sub_mod han, Nat.mod_eq_of_lt has] at h
    omega

theorem mod_eq_of_alternatives (n a b : Nat) (hb : b < n)
    (h : a = b ∨ a = b + n) : a % n = b := by
  rcases h with h | h
  · rw [h, Nat.mod_eq_of_lt hb]
  · rw [h, Nat.add_mod, Nat.mod_self, Nat.add_zero,
      Nat.mod_eq_of_lt hb, Nat.mod_eq_of_lt hb]

def classIndex (ε i : Nat) : Nat := 2 * i + ε

theorem classIndex_lt (g ε i : Nat) (hε : ε ≤ 1) (hi : i < order g) :
    classIndex ε i < 2 * order g := by
  simp only [classIndex]
  omega

theorem classIndex_injective (ε η i k : Nat) (hε : ε ≤ 1) (hη : η ≤ 1)
    (h : classIndex ε i = classIndex η k) : ε = η ∧ i = k := by
  simp only [classIndex] at h
  omega

theorem class_shift_one (g ε η i k : Nat) (hg : 2 ≤ g)
    (hε : ε ≤ 1) (hη : η ≤ 1) (hi : i < order g) (hk : k < order g)
    (h : classIndex η k = (classIndex ε i + (4 * g + 1)) % (2 * order g)) :
    ε + η = 1 ∧ k = (i + 2 * g + ε) % order g := by
  have hn : 0 < 2 * order g := by simp only [order]; omega
  have ha : classIndex ε i + (4 * g + 1) < 2 * (2 * order g) := by
    simp only [classIndex, order] at *
    omega
  have hb := classIndex_lt g η k hη hk
  have hc := mod_eq_alternatives (2 * order g)
    (classIndex ε i + (4 * g + 1)) (classIndex η k) hn ha hb h.symm
  have hpar : ε + η = 1 := by
    simp only [classIndex, order] at hc hi hk
    omega
  refine ⟨hpar, ?_⟩
  apply Eq.symm
  apply mod_eq_of_alternatives (order g) (i + 2 * g + ε) k hk
  simp only [classIndex] at hc
  omega

theorem class_shift_two (g ε η i k : Nat) (hg : 2 ≤ g)
    (hε : ε ≤ 1) (hη : η ≤ 1) (hi : i < order g) (hk : k < order g)
    (h : classIndex η k = (classIndex ε i + (8 * g + 2)) % (2 * order g)) :
    ε = η ∧ k = (i + (4 * g + 1)) % order g := by
  have hn : 0 < 2 * order g := by simp only [order]; omega
  have ha : classIndex ε i + (8 * g + 2) < 2 * (2 * order g) := by
    simp only [classIndex, order] at *
    omega
  have hb := classIndex_lt g η k hη hk
  have hc := mod_eq_alternatives (2 * order g)
    (classIndex ε i + (8 * g + 2)) (classIndex η k) hn ha hb h.symm
  have hpar : ε = η := by
    simp only [classIndex] at hc
    omega
  refine ⟨hpar, ?_⟩
  apply Eq.symm
  apply mod_eq_of_alternatives (order g) (i + (4 * g + 1)) k hk
  simp only [classIndex] at hc
  omega

end CircularIndex
