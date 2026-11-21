import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Data.Finset.Prod

namespace SunDisjointCosets

/-- Count nonempty fibers when each one contains at least `width` points. -/
theorem projection_card_mul_le {α β : Type*} [DecidableEq β]
    (points : Finset α) (f : α → β) (width : ℕ)
    (h : ∀ b ∈ points.image f, width ≤ (points.filter fun a => f a = b).card) :
    (points.image f).card * width ≤ points.card := by
  calc
    _ = ∑ _b ∈ points.image f, width := by simp
    _ ≤ ∑ b ∈ points.image f, (points.filter fun a => f a = b).card := Finset.sum_le_sum h
    _ = points.card := (Finset.card_eq_sum_card_image f points).symm

/-- The equality case of the two projection bounds forces an entire rectangle. -/
theorem rectangular_complement {α β : Type*} [DecidableEq α] [DecidableEq β]
    (holes : Finset (α × β)) {rows cols : ℕ} (hr : 0 < rows) (hc : 0 < cols)
    (size : holes.card = rows * cols)
    (rowFiber : ∀ x ∈ holes.image Prod.fst,
      cols ≤ (holes.filter fun a => a.1 = x).card)
    (colFiber : ∀ y ∈ holes.image Prod.snd,
      rows ≤ (holes.filter fun a => a.2 = y).card) :
    holes = (holes.image Prod.fst) ×ˢ (holes.image Prod.snd) := by
  have rowBound := projection_card_mul_le holes Prod.fst cols rowFiber
  have colBound := projection_card_mul_le holes Prod.snd rows colFiber
  rw [size] at rowBound colBound
  rw [Nat.mul_comm rows cols] at colBound
  have height := Nat.le_of_mul_le_mul_right rowBound hc
  have width := Nat.le_of_mul_le_mul_right colBound hr
  apply Finset.eq_of_subset_of_card_le
  · intro point hpoint
    exact Finset.mem_product.mpr
      ⟨Finset.mem_image_of_mem Prod.fst hpoint, Finset.mem_image_of_mem Prod.snd hpoint⟩
  · rw [Finset.card_product, size]
    exact Nat.mul_le_mul height width

end SunDisjointCosets
