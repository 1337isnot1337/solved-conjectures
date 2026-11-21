import Conjectures.HornakGraph
import Mathlib.Algebra.Order.BigOperators.Group.Finset

/-! Exact allocation of fixed-size pieces among finite arm capacities. -/
namespace Hornak
open scoped BigOperators

/-- Any number up to the total capacity can be distributed among the bins. -/
theorem allocate {α : Type*} [DecidableEq α] (s : Finset α) (capacity : α → ℕ)
    (a : ℕ) (ha : a ≤ ∑ i ∈ s, capacity i) :
    ∃ used : α → ℕ, (∀ i ∈ s, used i ≤ capacity i) ∧
      (∑ i ∈ s, used i) = a := by
  induction s using Finset.induction_on generalizing a with
  | empty =>
    have hz : a = 0 := by simpa using ha
    subst a
    exact ⟨fun _ => 0, by simp⟩
  | @insert x s hx ih =>
    simp only [Finset.sum_insert hx] at ha
    let t := min a (capacity x)
    have hrest : a - t ≤ ∑ i ∈ s, capacity i := by
      dsimp [t]
      omega
    obtain ⟨used, hb, he⟩ := ih (a-t) hrest
    refine ⟨Function.update used x t, ?_, ?_⟩
    · intro i hi
      rcases Finset.mem_insert.mp hi with rfl | hi
      · simp only [Function.update_self]
        exact Nat.min_le_right _ _
      · rw [Function.update_of_ne (by intro h; subst i; exact hx hi)]
        exact hb i hi
    · rw [Finset.sum_insert hx, Function.update_self]
      have hsum : (∑ i ∈ s, Function.update used x t i) = ∑ i ∈ s, used i := by
        apply Finset.sum_congr rfl
        intro i hi
        have hne : i ≠ x := by intro h; subst i; exact hx hi
        exact Function.update_of_ne hne t used
      rw [hsum, he]
      dsimp [t]
      omega

theorem allocate_iff {α : Type*} [DecidableEq α] (s : Finset α) (capacity : α → ℕ) (a : ℕ) :
    (∃ used : α → ℕ, (∀ i ∈ s, used i ≤ capacity i) ∧ (∑ i ∈ s, used i) = a) ↔
      a ≤ ∑ i ∈ s, capacity i := by
  constructor
  · rintro ⟨used, hb, he⟩
    rw [← he]
    exact Finset.sum_le_sum (fun i hi => hb i hi)
  · exact allocate s capacity a

/-- Once the larger pieces are assigned, the number of smaller pieces that
fits in an arm is exactly its remaining capacity divided by their size. -/
theorem arm_capacity_iff (x i b a : ℕ) (hi : 0 < i) (hb : b*(i+1) ≤ x) :
    a*i + b*(i+1) ≤ x ↔ a ≤ (x-b*(i+1))/i := by
  rw [Nat.le_div_iff_mul_le hi]
  omega

/-- The written proof's fixed-larger-pieces allocation criterion, for an
arbitrary finite set of arms and every positive smaller piece size. -/
theorem fixed_large_packing_iff {α : Type*} [DecidableEq α] (s : Finset α)
    (capacity large : α → ℕ) (i a : ℕ) (hi : 0 < i)
    (hb : ∀ j ∈ s, large j*(i+1) ≤ capacity j) :
    (∃ small : α → ℕ, (∀ j ∈ s, small j*i + large j*(i+1) ≤ capacity j) ∧
      (∑ j ∈ s, small j) = a) ↔
    a ≤ ∑ j ∈ s, (capacity j-large j*(i+1))/i := by
  constructor
  · rintro ⟨small, hs, hsum⟩
    apply (allocate_iff s (fun j => (capacity j-large j*(i+1))/i) a).mp
    refine ⟨small, ?_, hsum⟩
    intro j hj
    exact (arm_capacity_iff _ _ _ _ hi (hb j hj)).mp (hs j hj)
  · intro ha
    obtain ⟨small, hs, hsum⟩ := allocate s (fun j => (capacity j-large j*(i+1))/i) a ha
    refine ⟨small, ?_, hsum⟩
    intro j hj
    exact (arm_capacity_iff _ _ _ _ hi (hb j hj)).mpr (hs j hj)

end Hornak
