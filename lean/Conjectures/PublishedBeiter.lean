import Mathlib.RingTheory.Polynomial.Cyclotomic.Basic
import Mathlib.Algebra.Polynomial.Coeff
import Mathlib.Algebra.Ring.GeomSum
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.NormNum.Prime
import Mathlib.Tactic.Ring

/-!
# Beiter's conjecture

Sister Marion Beiter's conjecture (1968), refuted using the exact published
witness in Gallot and Moree, arXiv:0712.2365v2, Conjecture 1 and Table 2.
The coefficient of X^4801 in Φ_(17*29*41) is -10, exceeding the claimed bound 9.

The polynomial is Mathlib's cyclotomic polynomial. The proof computes a single
coefficient from a proved product identity and finite geometric sums.
-/

open Polynomial Finset

namespace Published.Beiter

noncomputable section

/-- The original, universally quantified cyclotomic coefficient bound. -/
def BeiterConjecture : Prop :=
  ∀ p q r : ℕ, p.Prime → q.Prime → r.Prime → 2 < p → p < q → q < r →
    ∀ k : ℕ, 2 * |(cyclotomic (p * q * r) ℤ).coeff k| ≤ (p : ℤ) + 1

def denominator : ℤ[X] :=
  (1 - X) * (1 - X ^ 493) * (1 - X ^ 697) * (1 - X ^ 1189)

def numeratorSmall : ℤ[X] := (1 - X ^ 17) * (1 - X ^ 29) * (1 - X ^ 41)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem cyclotomic_product_identity :
    denominator * cyclotomic 20213 ℤ = numeratorSmall * (1 - X ^ 20213) := by
  have d17 : Nat.divisors 17 = {1, 17} := by decide
  have d29 : Nat.divisors 29 = {1, 29} := by decide
  have d41 : Nat.divisors 41 = {1, 41} := by decide
  have d493 : Nat.divisors 493 = {1, 17, 29, 493} := by decide
  have d697 : Nat.divisors 697 = {1, 17, 41, 697} := by decide
  have d1189 : Nat.divisors 1189 = {1, 29, 41, 1189} := by decide
  have d20213 : Nat.divisors 20213 = {1, 17, 29, 41, 493, 697, 1189, 20213} := by
    decide
  have h17 := prod_cyclotomic_eq_X_pow_sub_one (by decide : 0 < 17) ℤ
  have h29 := prod_cyclotomic_eq_X_pow_sub_one (by decide : 0 < 29) ℤ
  have h41 := prod_cyclotomic_eq_X_pow_sub_one (by decide : 0 < 41) ℤ
  have h493 := prod_cyclotomic_eq_X_pow_sub_one (by decide : 0 < 493) ℤ
  have h697 := prod_cyclotomic_eq_X_pow_sub_one (by decide : 0 < 697) ℤ
  have h1189 := prod_cyclotomic_eq_X_pow_sub_one (by decide : 0 < 1189) ℤ
  have h20213 := prod_cyclotomic_eq_X_pow_sub_one (by decide : 0 < 20213) ℤ
  simp only [d17, d29, d41, d493, d697, d1189, d20213] at
    h17 h29 h41 h493 h697 h1189 h20213
  norm_num at h17 h29 h41 h493 h697 h1189 h20213
  unfold denominator numeratorSmall
  have hs17 : (1 - X ^ 17 : ℤ[X]) = -((X - 1) * cyclotomic 17 ℤ) := by
    linear_combination -h17
  have hs29 : (1 - X ^ 29 : ℤ[X]) = -((X - 1) * cyclotomic 29 ℤ) := by
    linear_combination -h29
  have hs41 : (1 - X ^ 41 : ℤ[X]) = -((X - 1) * cyclotomic 41 ℤ) := by
    linear_combination -h41
  have hs493 : (1 - X ^ 493 : ℤ[X]) =
      -((X - 1) * cyclotomic 17 ℤ * cyclotomic 29 ℤ * cyclotomic 493 ℤ) := by
    linear_combination -h493
  have hs697 : (1 - X ^ 697 : ℤ[X]) =
      -((X - 1) * cyclotomic 17 ℤ * cyclotomic 41 ℤ * cyclotomic 697 ℤ) := by
    linear_combination -h697
  have hs1189 : (1 - X ^ 1189 : ℤ[X]) =
      -((X - 1) * cyclotomic 29 ℤ * cyclotomic 41 ℤ * cyclotomic 1189 ℤ) := by
    linear_combination -h1189
  have hs20213 : (1 - X ^ 20213 : ℤ[X]) =
      -((X - 1) * cyclotomic 17 ℤ * cyclotomic 29 ℤ * cyclotomic 41 ℤ *
        cyclotomic 493 ℤ * cyclotomic 697 ℤ * cyclotomic 1189 ℤ * cyclotomic 20213 ℤ) := by
    linear_combination -h20213
  rw [hs17, hs29, hs41, hs493, hs697, hs1189, hs20213]
  ring

/-- A finite geometric polynomial with step q. -/
def geometric (q len : ℕ) : ℤ[X] := ∑ i ∈ range len, X ^ (q * i)

theorem geometric_mul (q len : ℕ) :
    (1 - X ^ q) * geometric q len = 1 - X ^ (q * len) := by
  have h := geom_sum_mul (X ^ q : ℤ[X]) len
  simp only [← pow_mul] at h
  unfold geometric
  linear_combination -h

def inversePolynomial : ℤ[X] :=
  geometric 1 4802 * geometric 493 10 * geometric 697 7 * geometric 1189 5

def highFactors : ℤ[X] :=
  (1 - X ^ 4802) * (1 - X ^ 4930) * (1 - X ^ 4879) * (1 - X ^ 5945)

theorem denominator_inverse : denominator * inversePolynomial = highFactors := by
  unfold denominator inversePolynomial highFactors
  calc
    _ = ((1 - X ^ 1) * geometric 1 4802) *
        ((1 - X ^ 493) * geometric 493 10) *
        ((1 - X ^ 697) * geometric 697 7) *
        ((1 - X ^ 1189) * geometric 1189 5) := by ring
    _ = _ := by rw [geometric_mul, geometric_mul, geometric_mul, geometric_mul]; norm_num

theorem multiplied_identity :
    highFactors * cyclotomic 20213 ℤ =
      inversePolynomial * numeratorSmall * (1 - X ^ 20213) := by
  rw [← denominator_inverse]
  calc
    (denominator * inversePolynomial) * cyclotomic 20213 ℤ =
        inversePolynomial * (denominator * cyclotomic 20213 ℤ) := by ring
    _ = _ := by rw [cyclotomic_product_identity]; ring

theorem coeff_one_sub_X_pow_mul (f : ℤ[X]) (m n : ℕ) (h : n < m) :
    ((1 - X ^ m) * f).coeff n = f.coeff n := by
  rw [sub_mul, one_mul, coeff_sub, coeff_X_pow_mul']
  simp [not_le_of_gt h]

theorem coeff_mul_one_sub_X_pow (f : ℤ[X]) (m n : ℕ) (h : n < m) :
    (f * (1 - X ^ m)).coeff n = f.coeff n := by
  rw [mul_comm]
  exact coeff_one_sub_X_pow_mul f m n h

theorem coefficient_reduction :
    (cyclotomic 20213 ℤ).coeff 4801 =
      (inversePolynomial * numeratorSmall).coeff 4801 := by
  have h := congrArg (fun f : ℤ[X] => f.coeff 4801) multiplied_identity
  rw [coeff_mul_one_sub_X_pow _ 20213 4801 (by decide)] at h
  simp only [highFactors, mul_assoc] at h
  rw [coeff_one_sub_X_pow_mul _ 4802 4801 (by decide),
    coeff_one_sub_X_pow_mul _ 4930 4801 (by decide),
    coeff_one_sub_X_pow_mul _ 4879 4801 (by decide),
    coeff_one_sub_X_pow_mul _ 5945 4801 (by decide)] at h
  exact h

theorem geometric_one_coeff (len n : ℕ) :
    (geometric 1 len).coeff n = if n < len then 1 else 0 := by
  simp [geometric, finsetSum_coeff, coeff_X_pow, eq_comm]

theorem shifted_geometric_coeff (e n : ℕ) (hn : n < 4802) :
    (X ^ e * geometric 1 4802).coeff n = if e ≤ n then 1 else 0 := by
  rw [coeff_X_pow_mul', geometric_one_coeff,
    if_pos (lt_of_le_of_lt (Nat.sub_le n e) hn)]

/-- The eight numerator shifts, all evaluated by exact integer arithmetic. -/
def smallCoeff (n e : ℕ) : ℤ :=
  (if e ≤ n then 1 else 0) -
  (if e + 17 ≤ n then 1 else 0) -
  (if e + 29 ≤ n then 1 else 0) -
  (if e + 41 ≤ n then 1 else 0) +
  (if e + 46 ≤ n then 1 else 0) +
  (if e + 58 ≤ n then 1 else 0) +
  (if e + 70 ≤ n then 1 else 0) -
  (if e + 87 ≤ n then 1 else 0)

theorem term_coeff (e n : ℕ) (hn : n < 4802) :
    (geometric 1 4802 * X ^ e * numeratorSmall).coeff n = smallCoeff n e := by
  have hpoly : geometric 1 4802 * X ^ e * numeratorSmall =
      X ^ e * geometric 1 4802 - X ^ (e + 17) * geometric 1 4802 -
      X ^ (e + 29) * geometric 1 4802 - X ^ (e + 41) * geometric 1 4802 +
      X ^ (e + 46) * geometric 1 4802 + X ^ (e + 58) * geometric 1 4802 +
      X ^ (e + 70) * geometric 1 4802 - X ^ (e + 87) * geometric 1 4802 := by
    unfold numeratorSmall
    simp only [pow_add]
    ring
  rw [hpoly]
  simp only [coeff_add, coeff_sub, shifted_geometric_coeff _ _ hn, smallCoeff]

theorem coefficient_sum_reduction (n : ℕ) (hn : n < 4802) :
    (inversePolynomial * numeratorSmall).coeff n =
      ∑ a ∈ range 10, ∑ b ∈ range 7, ∑ c ∈ range 5,
        smallCoeff n (493 * a + 697 * b + 1189 * c) := by
  change (((geometric 1 4802 * (∑ a ∈ range 10, X ^ (493 * a))) *
      (∑ b ∈ range 7, X ^ (697 * b))) *
      (∑ c ∈ range 5, X ^ (1189 * c)) * numeratorSmall).coeff n = _
  simp only [Finset.mul_sum, Finset.sum_mul, finsetSum_coeff]
  apply Finset.sum_congr rfl
  intro a ha
  apply Finset.sum_congr rfl
  intro b hb
  apply Finset.sum_congr rfl
  intro c hc
  have hmul : geometric 1 4802 * X ^ (493 * a) * X ^ (697 * b) *
      X ^ (1189 * c) * numeratorSmall =
      geometric 1 4802 * X ^ (493 * a + 697 * b + 1189 * c) * numeratorSmall := by
    simp only [pow_add]
    ring
  rw [hmul, term_coeff _ _ hn]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem finite_coefficient_certificate :
    (∑ a ∈ range 10, ∑ b ∈ range 7, ∑ c ∈ range 5,
      smallCoeff 4801 (493 * a + 697 * b + 1189 * c)) = -10 := by
  decide

theorem cyclotomic_coefficient : (cyclotomic 20213 ℤ).coeff 4801 = -10 := by
  rw [coefficient_reduction, coefficient_sum_reduction _ (by decide),
    finite_coefficient_certificate]

/-- The published witness refutes the full original conjecture. -/
theorem beiter_conjecture_false : ¬ BeiterConjecture := by
  intro h
  have hw := h 17 29 41 (by norm_num) (by norm_num) (by norm_num)
    (by norm_num) (by norm_num) (by norm_num) 4801
  change 2 * |(cyclotomic 20213 ℤ).coeff 4801| ≤ (17 : ℤ) + 1 at hw
  rw [cyclotomic_coefficient] at hw
  norm_num at hw

#print axioms cyclotomic_coefficient
#print axioms beiter_conjecture_false

end

end Published.Beiter
