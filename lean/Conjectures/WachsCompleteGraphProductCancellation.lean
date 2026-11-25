module
public import Mathlib.Algebra.BigOperators.Ring.Finset
public import Mathlib.Data.Int.Basic
public import Mathlib.Data.Fintype.Pi
public import Mathlib.Order.PiLex

@[expose] public section
namespace WachsCompleteGraph
open Classical

/-- The product of cumulative integer weights over a finite dependent family
is the cumulative weight for the product of the orders. -/
theorem cumulative_product {ι : Type*} {α : ι → Type*}
    [Fintype ι] [∀ i, Fintype (α i)] [∀ i, Preorder (α i)]
    (f : ∀ i, α i → ℤ) (a : ∀ i, α i) :
    (∑ x : (∀ i, α i) with x ≤ a, ∏ i, f i (x i)) =
      ∏ i, ∑ y : α i with y ≤ a i, f i y := by
  classical
  rw [Finset.prod_univ_sum]
  congr 1
  ext x
  simp only [Finset.mem_filter, Finset.mem_univ, true_and, Fintype.mem_piFinset]
  rfl

/-- If all the coordinate functions satisfy the Möbius cancellation law,
their product satisfies the same law at the tuple of bottoms. -/
theorem cumulative_product_moebius {ι : Type*} {α : ι → Type*}
    [Fintype ι] [∀ i, Fintype (α i)] [∀ i, Preorder (α i)] [∀ i, OrderBot (α i)]
    (f : ∀ i, α i → ℤ)
    (hf : ∀ i a, (∑ y : α i with y ≤ a, f i y) = if a = ⊥ then 1 else 0)
    (a : ∀ i, α i) :
    (∑ x : (∀ i, α i) with x ≤ a, ∏ i, f i (x i)) = if a = ⊥ then 1 else 0 := by
  classical
  rw [cumulative_product]
  simp_rw [hf]
  by_cases h : a = ⊥
  · subst a
    simp
  · rw [ite_eq_right h]
    obtain ⟨i, hi⟩ : ∃ i, a i ≠ ⊥ := by
      by_contra! ha
      exact h (funext ha)
    apply Finset.prod_eq_zero (Finset.mem_univ i)
    exact ite_eq_right hi

end WachsCompleteGraph
