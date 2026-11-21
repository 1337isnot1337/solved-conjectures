module

public import Mathlib.Basic.Real.Basic
public import Mathlib.RingTheory.Polynomial.Vieta
public import Mathlib.Algebra.BigOperators.Fin
public import Mathlib.Algebra.Order.BigOperators.GroupWithZero.Finset
public import Mathlib.Tactic.NormNum
public import Mathlib.Tactic.Ring
public import Lean.Elab.Tactic.Omega

/-!
# Finite algebra for Gröchenig's Gaussian blocks

Positive roots give strictly alternating coefficients through the exact
finite Vieta formula. Splitting a product at a test index gives its sign,
and adjacent signed-positive values have a negative product.
-/

@[expose] public section

namespace Grochenig

open Polynomial
open scoped BigOperators

theorem coeff_prod_X_sub_C_signed_pos {ι : Type*} (s : Finset ι) (r : ι → ℝ)
    (hr : ∀ i ∈ s, 0 < r i) (k : ℕ) (hk : k ≤ s.card) :
    0 < (-1 : ℝ) ^ (s.card - k) * (∏ i ∈ s, (X - C (r i))).coeff k := by
  classical
  have hpoly : (∏ i ∈ s, (X - C (r i))) = ∏ i ∈ s, (X + C (-r i)) := by
    apply Finset.prod_congr rfl
    intro i _
    simp [sub_eq_add_neg]
  rw [hpoly, Finset.prod_X_add_C_coeff s (fun i => -r i) hk]
  have hsum : (∑ t ∈ s.powersetCard (s.card - k), ∏ i ∈ t, -r i) =
      (-1 : ℝ) ^ (s.card - k) *
        ∑ t ∈ s.powersetCard (s.card - k), ∏ i ∈ t, r i := by
    rw [Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro t ht
    rw [Finset.prod_neg, (Finset.mem_powersetCard.mp ht).2]
  have hsq : (-1 : ℝ) ^ (s.card - k) * (-1 : ℝ) ^ (s.card - k) = 1 := by
    rw [← mul_pow]
    norm_num
  rw [hsum, ← mul_assoc, hsq, one_mul]
  apply Finset.sum_pos
  · intro t ht
    apply Finset.prod_pos
    intro i hi
    exact hr i ((Finset.mem_powersetCard.mp ht).1 hi)
  · exact Finset.powersetCard_nonempty.mpr (Nat.sub_le s.card k)

theorem signed_product_range_pos (N j : ℕ) (hj : j ≤ N) (f : ℕ → ℝ)
    (hfirst : ∀ i < j, 0 < f i) (hlast : ∀ i < N - j, f (j + i) < 0) :
    0 < (-1 : ℝ) ^ (N - j) * ∏ i ∈ Finset.range N, f i := by
  have hsplit : (∏ i ∈ Finset.range N, f i) =
      (∏ i ∈ Finset.range j, f i) * ∏ i ∈ Finset.range (N - j), f (j + i) := by
    simpa only [Nat.add_sub_of_le hj] using Finset.prod_range_add f j (N - j)
  have hfirst' : 0 < ∏ i ∈ Finset.range j, f i :=
    Finset.prod_pos fun i hi => hfirst i (Finset.mem_range.mp hi)
  have hlast' : 0 < (-1 : ℝ) ^ (N - j) *
      ∏ i ∈ Finset.range (N - j), f (j + i) := by
    have hp : 0 < ∏ i ∈ Finset.range (N - j), -f (j + i) :=
      Finset.prod_pos fun i hi => neg_pos.mpr (hlast i (Finset.mem_range.mp hi))
    simpa only [Finset.prod_neg, Finset.card_range] using hp
  rw [hsplit]
  convert mul_pos hfirst' hlast' using 1
  ring

theorem adjacent_mul_neg_of_signed_pos {N k : ℕ} {a b : ℝ} (hk : k < N)
    (ha : 0 < (-1 : ℝ) ^ (N - k) * a)
    (hb : 0 < (-1 : ℝ) ^ (N - (k + 1)) * b) : a * b < 0 := by
  let s : ℝ := (-1 : ℝ) ^ (N - (k + 1))
  have hsign : (-1 : ℝ) ^ (N - k) = -s := by
    rw [show N - k = (N - (k + 1)) + 1 by omega, pow_succ, mul_neg_one]
  have hsq : s * s = 1 := by
    dsimp [s]
    rw [← mul_pow]
    norm_num
  rw [hsign] at ha
  have hp : 0 < (-s * a) * (s * b) := mul_pos ha hb
  have heq : (-s * a) * (s * b) = -(a * b) := by
    calc
      _ = -(s * s) * (a * b) := by ring
      _ = _ := by rw [hsq]; ring
  rw [heq] at hp
  exact neg_pos.mp hp

end Grochenig
