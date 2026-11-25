import Mathlib.Analysis.Normed.Group.Basic
import Mathlib.Analysis.Complex.Basic
import Mathlib.Data.Finset.Card
import Mathlib.Tactic

/-! The deterministic support-cardinality repair in the circulant Fourier
construction. One repaired support works simultaneously for every bounded mode. -/

open Finset

namespace NemethSeberryShu

private theorem sum_difference_of_subset {α : Type*} [DecidableEq α] {S T : Finset α}
    (hST : S ⊆ T) (f : α → ℂ) (hf : ∀ i, ‖f i‖ ≤ 1) :
    ‖(∑ i ∈ T, f i) - (∑ i ∈ S, f i)‖ ≤ (T.card - S.card : ℕ) := by
  have hdiff : (∑ i ∈ T, f i) - (∑ i ∈ S, f i) = ∑ i ∈ T \ S, f i := by
    exact sub_eq_of_eq_add (sum_sdiff hST).symm
  rw [hdiff, ← card_sdiff_of_subset hST]
  calc
    _ ≤ ∑ i ∈ T \ S, ‖f i‖ := norm_sum_le _ _
    _ ≤ ∑ _i ∈ T \ S, (1 : ℝ) := sum_le_sum (fun i _ => hf i)
    _ = _ := by simp

/-- A support can be resized with at most one unit of Fourier change per
element inserted or deleted. The same support works for every frequency. -/
theorem repair_support {α : Type*} [Fintype α] [DecidableEq α] (S : Finset α) {k : ℕ}
    (hk : k ≤ Fintype.card α) :
    ∃ T : Finset α, T.card = k ∧ ∀ f : α → ℂ, (∀ i, ‖f i‖ ≤ 1) →
      ‖(∑ i ∈ T, f i) - (∑ i ∈ S, f i)‖ ≤ ((S.card - k) + (k - S.card) : ℕ) := by
  rcases le_total k S.card with h | h
  · obtain ⟨T, _, ht, hcard⟩ := exists_subsuperset_card_eq (empty_subset S)
      (by simp : (∅ : Finset α).card ≤ k) h
    refine ⟨T, hcard, fun f hf => ?_⟩
    rw [norm_sub_rev, Nat.sub_eq_zero_of_le h, Nat.add_zero, ← hcard]
    exact sum_difference_of_subset ht f hf
  · obtain ⟨T, ht, _, hcard⟩ := exists_subsuperset_card_eq (subset_univ S) h (by simpa using hk)
    refine ⟨T, hcard, fun f hf => ?_⟩
    rw [Nat.sub_eq_zero_of_le h, Nat.zero_add, ← hcard]
    exact sum_difference_of_subset ht f hf

/-- The uniform Fourier error after the row size is repaired. -/
theorem repair_with_uniform_error {α ι : Type*} [Fintype α] [DecidableEq α]
    (S : Finset α) {k : ℕ} (hk : k ≤ Fintype.card α)
    (modes : ι → α → ℂ) (target : ι → ℂ) (E : ℝ)
    (hmode : ∀ l i, ‖modes l i‖ ≤ 1)
    (hsize : (((S.card - k) + (k - S.card) : ℕ) : ℝ) ≤ E)
    (herror : ∀ l, ‖(∑ i ∈ S, modes l i) - target l‖ ≤ E) :
    ∃ T : Finset α, T.card = k ∧ ∀ l, ‖(∑ i ∈ T, modes l i) - target l‖ ≤ 2 * E := by
  obtain ⟨T, hT, hbound⟩ := repair_support S hk
  refine ⟨T, hT, fun l => ?_⟩
  have htri : (∑ i ∈ T, modes l i) - target l =
      ((∑ i ∈ T, modes l i) - ∑ i ∈ S, modes l i) +
        ((∑ i ∈ S, modes l i) - target l) := by abel
  rw [htri, two_mul]
  exact (norm_add_le _ _).trans
    (add_le_add ((hbound _ (hmode l)).trans hsize) (herror l))

end NemethSeberryShu
