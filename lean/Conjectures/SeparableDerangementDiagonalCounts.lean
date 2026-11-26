module

public import Conjectures.SeparableDerangementDisplacement
public import Mathlib.SetTheory.Cardinal.Finite

/-! Count points on actual diagonals of direct or skew sums. -/

@[expose] public section

open scoped BigOperators

namespace SeparableDerangements

/-- The number of literal points on the specified diagonal. -/
noncomputable def diagonalCount {n : ℕ} (π : Equiv.Perm (Fin n)) (d : ℤ) : ℕ :=
  Nat.card {j : Fin n // displacement π j = d}

@[simp] theorem displacement_eq_zero_iff {n : ℕ} (π : Equiv.Perm (Fin n)) (j : Fin n) :
    displacement π j = 0 ↔ π j = j := by
  simp only [displacement, sub_eq_zero, Int.ofNat_inj]
  exact Fin.val_inj

/-- The exact decomposition of a diagonal fiber into the shifted
    diagonal fibers of the original blocks. -/
def diagonalFiberEquiv {k : ℕ} (skew : Bool) (m : Fin k → ℕ)
    (π : ∀ i, Equiv.Perm (Fin (m i))) (d : ℤ) :
    (Σ i, {j : Fin (m i) // displacement (π i) j =
      d - (if skew then (after m i : ℤ) - before m i else 0)}) ≃
      {j : Fin (∑ i, m i) // displacement (blockSums skew m π) j = d} := by
  let shift (i : Fin k) : ℤ := if skew then (after m i : ℤ) - before m i else 0
  let e : (Σ i : Fin k, Fin (m i)) ≃ Fin (∑ i, m i) := finSigmaFinEquiv
  have hEquiv (w : Σ i : Fin k, Fin (m i)) :
      displacement (π w.1) w.2 = d - shift w.1 ↔
        displacement (blockSums skew m π) (e w) = d := by
    obtain ⟨i, j⟩ := w
    change _ ↔ displacement (blockSums skew m π) (finSigmaFinEquiv ⟨i, j⟩) = d
    rw [← blockPosition_eq_finSigmaFinEquiv, displacement_blockSums]
    exact eq_sub_iff_add_eq
  let r : (Σ i, {j : Fin (m i) // displacement (π i) j = d - shift i}) ≃
      {w : (Σ i : Fin k, Fin (m i)) // displacement (π w.1) w.2 = d - shift w.1} :=
    { toFun := fun ⟨i, j⟩ => ⟨⟨i, j.val⟩, j.property⟩
      invFun := fun ⟨⟨i, j⟩, h⟩ => ⟨i, ⟨j, h⟩⟩
      left_inv := fun ⟨_, _⟩ => rfl
      right_inv := fun ⟨_, _⟩ => rfl }
  exact r.trans (e.subtypeEquiv hEquiv)

/-- The total point count is the sum of the shifted child counts. -/
theorem diagonalCount_blockSums {k : ℕ} (skew : Bool) (m : Fin k → ℕ)
    (π : ∀ i, Equiv.Perm (Fin (m i))) (d : ℤ) :
    diagonalCount (blockSums skew m π) d =
      ∑ i, diagonalCount (π i) (d - (if skew then (after m i : ℤ) - before m i else 0)) := by
  unfold diagonalCount
  rw [← Nat.card_congr (diagonalFiberEquiv skew m π d), Nat.card_sigma]

/-- The shifted counts in a fixed diagonal of a skew sum can be
    positive in at most one child. -/
theorem unique_positive_skew_diagonalCount {k : ℕ} (m : Fin k → ℕ)
    (π : ∀ i, Equiv.Perm (Fin (m i))) (d : ℤ) {i j : Fin k}
    (hi : 0 < diagonalCount (π i) (d - ((after m i : ℤ) - before m i)))
    (hj : 0 < diagonalCount (π j) (d - ((after m j : ℤ) - before m j))) :
    i = j := by
  obtain ⟨⟨a, ha⟩⟩ := (Nat.card_pos_iff.mp hi).1
  obtain ⟨⟨b, hb⟩⟩ := (Nat.card_pos_iff.mp hj).1
  apply same_skew_displacement_implies_same_block m π a b
  rw [displacement_blockSums, displacement_blockSums]
  simp only [ite_true]
  omega

end SeparableDerangements
