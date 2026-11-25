import Conjectures.RowlandSistosBarronAnnihilator
import Mathlib.Algebra.Polynomial.BigOperators

/-!
# Rowland–Sistos Barrón conjecture

The complete characteristic polynomial of a sum of actual exponential
polynomial sequences with pairwise distinct nonzero bases, including a
degree bound for every annihilator. The subsequent tail-recurrence bridge
uses this unrestricted algebraic result.
-/

noncomputable section

namespace RowlandSistosBarron

open Polynomial Finset Module

variable {K : Type*} [Field K]

def recurrenceWeight (p : K[X]) : ℕ := by
  classical
  exact if p = 0 then 0 else p.natDegree + 1

@[simp] theorem recurrenceWeight_zero : recurrenceWeight (0 : K[X]) = 0 := by
  simp [recurrenceWeight]

theorem recurrenceWeight_taylor (p : K[X]) (a : K) :
    recurrenceWeight (taylor a p) = recurrenceWeight p := by
  classical
  by_cases hp : p = 0
  · simp [recurrenceWeight, hp]
  · have ht : taylor a p ≠ 0 := (taylor_eq_zero a p).not.mpr hp
    simp [recurrenceWeight, ht, hp]

theorem recurrenceWeight_smul (p : K[X]) {a : K} (ha : a ≠ 0) :
    recurrenceWeight (a • p) = recurrenceWeight p := by
  classical
  by_cases hp : p = 0
  · simp [recurrenceWeight, hp]
  · have hs : a • p ≠ 0 := (smul_eq_zero_iff_right ha).not.mpr hp
    simp [recurrenceWeight, hs, hp, natDegree_smul _ ha]

variable {ι : Type*} [Fintype ι]

def characteristicPolynomial (a : ι → K) (p : ι → K[X]) : K[X] :=
  ∏ i, (X - C (a i)) ^ recurrenceWeight (p i)

theorem characteristicPolynomial_monic (a : ι → K) (p : ι → K[X]) :
    (characteristicPolynomial a p).Monic := by
  apply monic_prod_of_monic
  intro i _
  exact (monic_X_sub_C _).pow _

theorem characteristicPolynomial_natDegree (a : ι → K) (p : ι → K[X]) :
    (characteristicPolynomial a p).natDegree = ∑ i, recurrenceWeight (p i) := by
  rw [characteristicPolynomial, natDegree_prod_of_monic]
  · simp only [natDegree_pow, natDegree_X_sub_C, mul_one]
  · intro i _
    exact (monic_X_sub_C _).pow _

theorem characteristicPolynomial_coeff_zero_ne_zero (a : ι → K)
    (ha : ∀ i, a i ≠ 0) (p : ι → K[X]) :
    (characteristicPolynomial a p).coeff 0 ≠ 0 := by
  rw [coeff_zero_eq_eval_zero, characteristicPolynomial, eval_prod]
  apply prod_ne_zero_iff.mpr
  intro i _
  simp only [eval_pow, eval_sub, eval_X, eval_C, zero_sub]
  exact pow_ne_zero _ (neg_ne_zero.mpr (ha i))

variable [CharZero K]

theorem sequenceShift_aeval_exponentialPolynomial_eq_zero_iff_weight
    {a : K} (ha : a ≠ 0) (p q : K[X]) :
    (aeval (sequenceShift (K := K)) q) (exponentialPolynomial a p) = 0 ↔
      (X - C a) ^ recurrenceWeight p ∣ q := by
  rw [sequenceShift_aeval_exponentialPolynomial_eq_zero_iff ha]
  by_cases hp : p = 0 <;> simp [recurrenceWeight, hp]

theorem characteristicPolynomial_dvd_iff (a : ι → K)
    (hinj : Function.Injective a) (ha : ∀ i, a i ≠ 0) (p : ι → K[X]) (q : K[X]) :
    characteristicPolynomial a p ∣ q ↔
      (aeval (sequenceShift (K := K)) q) (∑ i, exponentialPolynomial (a i) (p i)) = 0 := by
  classical
  have hsum :
      (aeval (sequenceShift (K := K)) q) (∑ i, exponentialPolynomial (a i) (p i)) = 0 ↔
        ∀ i, (aeval (sequenceShift (K := K)) q) (exponentialPolynomial (a i) (p i)) = 0 := by
    rw [map_sum]
    simp only [sequenceShift_aeval_exponentialPolynomial]
    rw [exponentialPolynomial_sum_eq_zero_iff a hinj ha]
    exact forall_congr' fun i => (exponentialPolynomial_eq_zero_iff (ha i) _).symm
  rw [hsum]
  have hw : (∀ i, (aeval (sequenceShift (K := K)) q)
      (exponentialPolynomial (a i) (p i)) = 0) ↔
      ∀ i, (X - C (a i)) ^ recurrenceWeight (p i) ∣ q :=
    forall_congr' fun i =>
      sequenceShift_aeval_exponentialPolynomial_eq_zero_iff_weight (ha i) (p i) q
  rw [hw]
  constructor
  · intro h i
    exact (dvd_prod_of_mem (fun j => (X - C (a j)) ^ recurrenceWeight (p j))
      (mem_univ i)).trans h
  · intro h
    apply Fintype.prod_dvd_of_coprime
    · intro i j hij
      exact (pairwise_coprime_X_sub_C hinj hij).pow
    · exact h

theorem characteristicPolynomial_annihilates (a : ι → K)
    (hinj : Function.Injective a) (ha : ∀ i, a i ≠ 0) (p : ι → K[X]) :
    (aeval (sequenceShift (K := K)) (characteristicPolynomial a p))
      (∑ i, exponentialPolynomial (a i) (p i)) = 0 :=
  (characteristicPolynomial_dvd_iff a hinj ha p _).mp dvd_rfl

theorem characteristicPolynomial_minimal_degree (a : ι → K)
    (hinj : Function.Injective a) (ha : ∀ i, a i ≠ 0) (p : ι → K[X])
    (q : K[X]) (hq : q ≠ 0)
    (h : (aeval (sequenceShift (K := K)) q)
      (∑ i, exponentialPolynomial (a i) (p i)) = 0) :
    (∑ i, recurrenceWeight (p i)) ≤ q.natDegree := by
  rw [← characteristicPolynomial_natDegree a p]
  exact natDegree_le_of_dvd ((characteristicPolynomial_dvd_iff a hinj ha p q).mpr h) hq

end RowlandSistosBarron
