import Conjectures.HartkeMatchingExcessDigits
import Mathlib.Combinatorics.Colex

/-!
# Hartke–Stolee–West–Yancey's matching-excess conjecture

The binary subsets used to select return arcs. Mathlib already proves the
finite-set/power-of-two representation; the lemmas here connect that result
to the exact binary weight and length used by the division estimate.
-/

namespace HartkeMatchingExcess

open Finset

def binaryPositions (n : ℕ) : Finset ℕ := n.bitIndices.toFinset

theorem bitIndices_length (n : ℕ) : n.bitIndices.length = binaryWeight n := by
  induction n using Nat.binaryRec with
  | zero => simp
  | bit b n ih =>
    cases b <;> simp_all

theorem binaryPositions_card (n : ℕ) : (binaryPositions n).card = binaryWeight n := by
  rw [binaryPositions, List.toFinset_card_of_nodup Nat.bitIndices_nodup, bitIndices_length]

theorem binaryPositions_sum (n : ℕ) : ∑ i ∈ binaryPositions n, 2 ^ i = n :=
  Finset.sum_toFinset_bitIndices_two_pow n

theorem binaryPositions_lt_length {n i : ℕ} (hi : i ∈ binaryPositions n) :
    i < binaryLength n := by
  have hi' : i ∈ n.bitIndices := List.mem_toFinset.mp hi
  have hp := Nat.two_pow_le_of_mem_bitIndices hi'
  have hn : n < 2 ^ binaryLength n := (binaryLength_le_iff n _).mp le_rfl
  by_contra hge
  have hpow : (2 : ℕ) ^ binaryLength n ≤ 2 ^ i :=
    Nat.pow_le_pow_right (by omega) (by omega)
  omega

theorem binaryPositions_subset_range (n : ℕ) :
    binaryPositions n ⊆ range (binaryLength n) := by
  intro i hi
  exact mem_range.mpr (binaryPositions_lt_length hi)

theorem binary_subset_sum_below {r k : ℕ} (hr : r < 2 ^ k) :
    ∃ S : Finset ℕ, S ⊆ range k ∧ ∑ i ∈ S, 2 ^ i = r := by
  refine ⟨binaryPositions r, ?_, binaryPositions_sum r⟩
  have hl : binaryLength r ≤ k := (binaryLength_le_iff r k).mpr hr
  intro i hi
  exact mem_range.mpr (lt_of_lt_of_le (binaryPositions_lt_length hi) hl)

end HartkeMatchingExcess
