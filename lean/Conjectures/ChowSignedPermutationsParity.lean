module

public import Conjectures.ChowSignedPermutationsBasic

/-!
# Even and odd signed permutations have the same type-D enumerator

Negating the first entry exchanges the first-sum descent and the first
adjacent descent. All other adjacent descents are unchanged. This gives an
explicit parity-changing involution on the actual signed permutations.
-/

@[expose] public section

namespace Chow

open Polynomial
open scoped BigOperators

def flipFirst {n : ℕ} (σ : SignedPermutation (n + 1)) : SignedPermutation (n + 1) :=
  (σ.1, Function.update σ.2 0 (!σ.2 0))

theorem flipFirst_involutive (n : ℕ) :
    Function.Involutive (flipFirst : SignedPermutation (n + 1) → SignedPermutation (n + 1)) := by
  intro σ
  apply Prod.ext
  · rfl
  · funext i
    by_cases hi : i = 0 <;> simp [flipFirst, hi]

def flipFirstEquiv (n : ℕ) : Equiv.Perm (SignedPermutation (n + 1)) where
  toFun := flipFirst
  invFun := flipFirst
  left_inv := flipFirst_involutive n
  right_inv := flipFirst_involutive n

@[simp] theorem entry_flipFirst_zero {n : ℕ} (σ : SignedPermutation (n + 1)) :
    entry (flipFirst σ) 0 = -entry σ 0 := by
  change letterValue (σ.1 0, Function.update σ.2 0 (!σ.2 0) 0) = _
  rw [Function.update_self]
  exact letterValue_negLetter (σ.1 0, σ.2 0)

theorem entry_flipFirst_of_ne_zero {n : ℕ} (σ : SignedPermutation (n + 1))
    (i : Fin (n + 1)) (hi : i ≠ 0) : entry (flipFirst σ) i = entry σ i := by
  simp [entry, flipFirst, hi]

@[simp] theorem entry_flipFirst_succ {n : ℕ} (σ : SignedPermutation (n + 1))
    (i : Fin n) : entry (flipFirst σ) i.succ = entry σ i.succ :=
  entry_flipFirst_of_ne_zero σ _ (Fin.succ_ne_zero _)

theorem negativeCount_eq_sum {n : ℕ} (σ : SignedPermutation n) :
    negativeCount σ = ∑ i : Fin n, if σ.2 i = true then 1 else 0 := by
  simp [negativeCount]

@[simp] theorem even_negativeCount_flipFirst {n : ℕ} (σ : SignedPermutation (n + 1)) :
    Even (negativeCount (flipFirst σ)) ↔ ¬ Even (negativeCount σ) := by
  cases h : σ.2 0
  · have hc : negativeCount (flipFirst σ) = negativeCount σ + 1 := by
      rw [negativeCount_eq_sum, negativeCount_eq_sum,
        Fin.sum_univ_succ, Fin.sum_univ_succ]
      simp [flipFirst, h, add_comm]
    rw [hc]
    exact Nat.even_add_one
  · have hc : negativeCount σ = negativeCount (flipFirst σ) + 1 := by
      rw [negativeCount_eq_sum, negativeCount_eq_sum,
        Fin.sum_univ_succ, Fin.sum_univ_succ]
      simp [flipFirst, h, add_comm]
    rw [hc, Nat.even_add_one, not_not]

@[simp] theorem desD_flipFirst (r : ℕ) (σ : SignedPermutation (r + 2)) :
    desD r (flipFirst σ) = desD r σ := by
  have hentry1 : entry (flipFirst σ) 1 = entry σ 1 := by
    simpa only [Fin.succ_zero_eq_one] using
      entry_flipFirst_succ σ (0 : Fin (r + 1))
  have hsum :
      (∑ i : Fin (r + 1),
        if entry (flipFirst σ) i.castSucc > entry (flipFirst σ) i.succ then 1 else 0) =
      (if -entry σ 0 > entry σ 1 then 1 else 0) +
        ∑ i : Fin r, if entry σ i.succ.castSucc > entry σ i.succ.succ then 1 else 0 := by
    rw [Fin.sum_univ_succ]
    congr 1
    simp [hentry1]
  unfold desD
  rw [hsum, entry_flipFirst_zero, hentry1, Fin.sum_univ_succ]
  have h1 : (-entry σ 0 + entry σ 1 < 0) ↔ entry σ 0 > entry σ 1 := by omega
  have h2 : (-entry σ 0 > entry σ 1) ↔ entry σ 0 + entry σ 1 < 0 := by omega
  simp only [h1, h2, Fin.castSucc_zero, Fin.succ_zero_eq_one]
  ac_rfl

/-- The factor two comes from an explicit statistic-preserving parity pairing. -/
theorem allSignedEulerian_eq_two_typeDEulerian (r : ℕ) :
    allSignedEulerian r = C 2 * typeDEulerian r := by
  have hodd :
      (∑ σ : SignedPermutation (r + 2),
        if ¬Even (negativeCount σ) then (X : ℝ[X]) ^ desD r σ else 0) = typeDEulerian r := by
    have h := Equiv.sum_comp (flipFirstEquiv (r + 1))
      (fun σ : SignedPermutation (r + 2) =>
        if Even (negativeCount σ) then (X : ℝ[X]) ^ desD r σ else 0)
    change (∑ σ : SignedPermutation (r + 2),
      if Even (negativeCount (flipFirst σ)) then
        (X : ℝ[X]) ^ desD r (flipFirst σ) else 0) = _ at h
    simpa only [even_negativeCount_flipFirst, desD_flipFirst, typeDEulerian] using h
  have hsplit : allSignedEulerian r = typeDEulerian r +
      (∑ σ : SignedPermutation (r + 2),
        if ¬Even (negativeCount σ) then (X : ℝ[X]) ^ desD r σ else 0) := by
    unfold allSignedEulerian typeDEulerian
    rw [← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro σ _
    by_cases h : Even (negativeCount σ) <;> simp [h]
  rw [hsplit, hodd, Polynomial.C_ofNat]
  ring

end Chow
