module

public import Conjectures.VishnyakovaPolarization
public import Mathlib.Algebra.Polynomial.BigOperators
public import Mathlib.Data.Nat.Factorial.BigOperators

/-!
# Binomial algebra for Vishnyakova's transformed polynomials

The finite binomial transform and its three-term recurrence are proved from a
one-step recurrence for the original falling/rising-factorial coefficients.
-/

@[expose] public section

namespace VishnyakovaRootRadius

open Polynomial
open scoped BigOperators

/-- The binomial transform, defined by the finite operator `(t + shift)^n`. -/
noncomputable def binomialValue (c : ℕ → ℂ) (t : ℂ) : ℕ → ℂ
  | 0 => c 0
  | n + 1 => t * binomialValue c t n + binomialValue (fun k => c (k + 1)) t n

theorem binomialValue_add (c d : ℕ → ℂ) (t : ℂ) (n : ℕ) :
    binomialValue (fun k => c k + d k) t n =
      binomialValue c t n + binomialValue d t n := by
  induction n generalizing c d with
  | zero => simp [binomialValue]
  | succ n ih =>
    simp only [binomialValue, ih]
    ring

theorem binomialValue_mul (a : ℂ) (c : ℕ → ℂ) (t : ℂ) (n : ℕ) :
    binomialValue (fun k => a * c k) t n = a * binomialValue c t n := by
  induction n generalizing c with
  | zero => simp [binomialValue]
  | succ n ih =>
    simp only [binomialValue, ih]
    ring

theorem binomialValue_index_mul (c : ℕ → ℂ) (t : ℂ) (n : ℕ) :
    binomialValue (fun k => (k : ℂ) * c k) t (n + 1) =
      ((n + 1 : ℕ) : ℂ) * binomialValue (fun k => c (k + 1)) t n := by
  induction n generalizing c with
  | zero => simp [binomialValue]
  | succ n ih =>
    have hfun : (fun k : ℕ => ((k + 1 : ℕ) : ℂ) * c (k + 1)) =
        (fun k : ℕ => (k : ℂ) * c (k + 1) + c (k + 1)) := by
      funext k
      push_cast
      ring
    rw [binomialValue, ih, hfun, binomialValue_add, ih]
    rw [binomialValue]
    push_cast
    ring

/-- The three-term recurrence before multiplication by the rising-factorial
normalization.  It holds for every coefficient sequence satisfying the stated
one-step identity. -/
theorem binomial_three_term (beta z t : ℂ) (c : ℕ → ℂ)
    (hc : ∀ k : ℕ, (beta + (k : ℂ)) * c (k + 1) = (z - (k : ℂ)) * c k)
    (n : ℕ) :
    (beta + ((n + 1 : ℕ) : ℂ)) * binomialValue c t (n + 2) =
      (z - ((n + 1 : ℕ) : ℂ) +
        (2 * ((n + 1 : ℕ) : ℂ) + beta) * t) * binomialValue c t (n + 1) +
      t * (1 - t) * ((n + 1 : ℕ) : ℂ) * binomialValue c t n := by
  have hfun : (fun k => z * c k) =
      (fun k => beta * c (k + 1) + (k : ℂ) * c (k + 1) + (k : ℂ) * c k) := by
    funext k
    linear_combination -hc k
  have he : z * binomialValue c t (n + 1) =
      beta * binomialValue (fun k => c (k + 1)) t (n + 1) +
      ((n + 1 : ℕ) : ℂ) * binomialValue (fun k => c (k + 1 + 1)) t n +
      ((n + 1 : ℕ) : ℂ) * binomialValue (fun k => c (k + 1)) t n := by
    rw [← binomialValue_mul, hfun, binomialValue_add, binomialValue_add,
      binomialValue_mul, binomialValue_index_mul, binomialValue_index_mul]
  have h0 : binomialValue c t (n + 1) =
      t * binomialValue c t n + binomialValue (fun k => c (k + 1)) t n := rfl
  have h1 : binomialValue c t (n + 2) =
      t * binomialValue c t (n + 1) +
        binomialValue (fun k => c (k + 1)) t (n + 1) := rfl
  have h2 : binomialValue (fun k => c (k + 1)) t (n + 1) =
      t * binomialValue (fun k => c (k + 1)) t n +
        binomialValue (fun k => c (k + 1 + 1)) t n := rfl
  linear_combination -he + (beta + ((n + 1 : ℕ) : ℂ)) * h1 +
    ((n + 1 : ℕ) : ℂ) * h2 + ((n + 1 : ℕ) : ℂ) * (1 - t) * h0

/-- Apply a prescribed coefficient sequence to a literal polynomial. -/
noncomputable def coefficientPairing (c : ℕ → ℂ) (p : ℂ[X]) : ℂ :=
  p.sum (fun k a => a * c k)

theorem coefficientPairing_add (c : ℕ → ℂ) (p q : ℂ[X]) :
    coefficientPairing c (p + q) = coefficientPairing c p + coefficientPairing c q := by
  unfold coefficientPairing
  apply Polynomial.sum_add_index <;> intros <;> simp [add_mul]

theorem coefficientPairing_monomial (c : ℕ → ℂ) (k : ℕ) (a : ℂ) :
    coefficientPairing c (Polynomial.monomial k a) = a * c k := by
  simp [coefficientPairing]

theorem coefficientPairing_one (c : ℕ → ℂ) : coefficientPairing c 1 = c 0 := by
  simpa only [Polynomial.monomial_zero_left, Polynomial.C_1, one_mul] using
    coefficientPairing_monomial c 0 1

theorem coefficientPairing_C_mul (c : ℕ → ℂ) (p : ℂ[X]) (a : ℂ) :
    coefficientPairing c (Polynomial.C a * p) = a * coefficientPairing c p := by
  induction p using Polynomial.induction_on' with
  | add p q hp hq => rw [mul_add, coefficientPairing_add, hp, hq, coefficientPairing_add]; ring
  | monomial k b =>
    rw [Polynomial.C_mul_monomial, coefficientPairing_monomial, coefficientPairing_monomial]
    ring

theorem coefficientPairing_X_mul (c : ℕ → ℂ) (p : ℂ[X]) :
    coefficientPairing c (Polynomial.X * p) =
      coefficientPairing (fun k => c (k + 1)) p := by
  induction p using Polynomial.induction_on' with
  | add p q hp hq => rw [mul_add, coefficientPairing_add, hp, hq, coefficientPairing_add]
  | monomial k b =>
    rw [Polynomial.X_mul_monomial, coefficientPairing_monomial, coefficientPairing_monomial]

theorem coefficientPairing_linear_mul (c : ℕ → ℂ) (p : ℂ[X]) (a : ℂ) :
    coefficientPairing c ((Polynomial.C a + Polynomial.X) * p) =
      a * coefficientPairing c p + coefficientPairing (fun k => c (k + 1)) p := by
  rw [add_mul, coefficientPairing_add, coefficientPairing_C_mul, coefficientPairing_X_mul]

theorem binomialValue_eq_pairing (c : ℕ → ℂ) (t : ℂ) (n : ℕ) :
    binomialValue c t n =
      coefficientPairing c ((Polynomial.C t + Polynomial.X) ^ n) := by
  induction n generalizing c with
  | zero => simp [binomialValue, coefficientPairing_one]
  | succ n ih =>
    rw [binomialValue, ih, ih, pow_succ', coefficientPairing_linear_mul]

theorem coefficientPairing_sum_range (c : ℕ → ℂ) (p : ℂ[X]) (n : ℕ)
    (hdeg : p.natDegree ≤ n) :
    coefficientPairing c p = ∑ k ∈ Finset.range (n + 1), p.coeff k * c k := by
  classical
  apply Polynomial.sum_eq_of_subset
  · intro k; simp
  · intro k hk
    apply Finset.mem_range.mpr
    exact Nat.lt_succ_of_le ((Polynomial.le_natDegree_of_ne_zero
      (Polynomial.mem_support_iff.mp hk)).trans hdeg)

theorem binomialValue_sum (c : ℕ → ℂ) (t : ℂ) (n : ℕ) :
    binomialValue c t n =
      ∑ k ∈ Finset.range (n + 1), (n.choose k : ℂ) * c k * t ^ (n - k) := by
  have hdeg : ((Polynomial.C t + Polynomial.X) ^ n : ℂ[X]).natDegree ≤ n := by
    calc
      _ ≤ n * (Polynomial.C t + Polynomial.X : ℂ[X]).natDegree :=
        Polynomial.natDegree_pow_le
      _ = n := by rw [add_comm, Polynomial.natDegree_X_add_C, mul_one]
  rw [binomialValue_eq_pairing, coefficientPairing_sum_range c _ n hdeg]
  apply Finset.sum_congr rfl
  intro k hk
  rw [add_comm (Polynomial.C t), Polynomial.coeff_X_add_C_pow]
  ring

theorem diagonalPolynomial_eval_binomial (c : ℕ → ℂ) (n : ℕ) (t : ℂ) :
    (diagonalPolynomial n (fun k => c (n - k))).eval t = binomialValue c t n := by
  classical
  rw [binomialValue_sum]
  unfold diagonalPolynomial
  rw [Polynomial.eval_finsetSum]
  simp only [Polynomial.eval_mul, Polynomial.eval_C, Polynomial.eval_pow, Polynomial.eval_X]
  have href := Finset.sum_range_reflect
    (fun k => (n.choose k : ℂ) * c k * t ^ (n - k)) (n + 1)
  simp only [Nat.add_sub_cancel] at href
  rw [← href]
  apply Finset.sum_congr rfl
  intro k hk
  have hkn : k ≤ n := Nat.le_of_lt_succ (Finset.mem_range.mp hk)
  rw [Nat.choose_symm hkn, Nat.sub_sub_self hkn]

theorem realPolarValue_add (as : List ℝ) (c d : ℕ → ℂ) :
    realPolarValue (fun k => c k + d k) as =
      realPolarValue c as + realPolarValue d as := by
  induction as generalizing c d with
  | nil => simp [realPolarValue]
  | cons a as ih =>
    simp only [realPolarValue]
    have hfun : (fun k => c k + d k + (a : ℂ) * (c (k + 1) + d (k + 1))) =
        (fun k => (c k + (a : ℂ) * c (k + 1)) + (d k + (a : ℂ) * d (k + 1))) := by
      funext k; ring
    rw [hfun, ih]

theorem realPolarValue_mul (as : List ℝ) (a : ℂ) (c : ℕ → ℂ) :
    realPolarValue (fun k => a * c k) as = a * realPolarValue c as := by
  induction as generalizing c with
  | nil => simp [realPolarValue]
  | cons b as ih =>
    simp only [realPolarValue]
    have hfun : (fun k => a * c k + (b : ℂ) * (a * c (k + 1))) =
        (fun k => a * (c k + (b : ℂ) * c (k + 1))) := by
      funext k; ring
    rw [hfun, ih]

theorem realPolarValue_congr (as : List ℝ) (c d : ℕ → ℂ)
    (hc : ∀ k, k ≤ as.length → c k = d k) :
    realPolarValue c as = realPolarValue d as := by
  induction as generalizing c d with
  | nil => exact hc 0 (by simp)
  | cons a as ih =>
    apply ih
    intro k hk
    rw [hc k (by simp only [List.length_cons]; omega),
      hc (k + 1) (by simp only [List.length_cons]; omega)]

/-- The source's monic polynomial with roots `-a_i`. -/
noncomputable def parameterPolynomial (as : List ℝ) : ℂ[X] :=
  (as.map (fun a => Polynomial.C (a : ℂ) + Polynomial.X)).prod

/-- The recursive specialization is exactly coefficient pairing with the
literal product of linear factors. -/
theorem coefficientPairing_product (as : List ℝ) (c : ℕ → ℂ) :
    coefficientPairing c (parameterPolynomial as) =
      realPolarValue (fun k => c (as.length - k)) as := by
  induction as generalizing c with
  | nil => simp [parameterPolynomial, realPolarValue, coefficientPairing_one]
  | cons a as ih =>
    have hp : parameterPolynomial (a :: as) =
        (Polynomial.C (a : ℂ) + Polynomial.X) * parameterPolynomial as := by
      simp [parameterPolynomial]
    rw [hp, coefficientPairing_linear_mul, ih, ih]
    simp only [List.length_cons, realPolarValue]
    have hfun :
        realPolarValue (fun k => c (as.length + 1 - k) +
          (a : ℂ) * c (as.length + 1 - (k + 1))) as =
        realPolarValue (fun k => c (as.length - k + 1) +
          (a : ℂ) * c (as.length - k)) as := by
      apply realPolarValue_congr
      intro k hk
      rw [show as.length + 1 - k = as.length - k + 1 by omega,
        show as.length + 1 - (k + 1) = as.length - k by omega]
    rw [hfun, realPolarValue_add, realPolarValue_mul]
    ring

/-- Arbitrary independent real parameters inherit the proved diagonal
nonvanishing statement.  All polynomial definitions are literal. -/
theorem coefficientPairing_product_ne_zero (as : List ℝ) (c : ℕ → ℂ)
    (hdiag : ∀ t : ℂ, 0 ≤ t.im → binomialValue c t as.length ≠ 0) :
    coefficientPairing c (parameterPolynomial as) ≠ 0 := by
  rw [coefficientPairing_product]
  apply realPolarValue_ne_zero
  intro t ht
  rw [diagonalPolynomial_eval_binomial]
  exact hdiag t ht

/-- The normalized falling-factorial coefficients in the definition of
`L_beta` from the source. -/
noncomputable def fallingProduct (z : ℂ) (n : ℕ) : ℂ :=
  ∏ k ∈ Finset.range n, (z - (k : ℂ))

noncomputable def risingProduct (beta : ℝ) (n : ℕ) : ℝ :=
  ∏ k ∈ Finset.range n, (beta + (k : ℝ))

theorem risingProduct_succ (beta : ℝ) (n : ℕ) :
    risingProduct beta (n + 1) = risingProduct beta n * (beta + (n : ℝ)) :=
  Finset.prod_range_succ _ _

theorem fallingProduct_succ (z : ℂ) (n : ℕ) :
    fallingProduct z (n + 1) = fallingProduct z n * (z - (n : ℂ)) :=
  Finset.prod_range_succ _ _

noncomputable def sourceCoefficient (beta : ℝ) (z : ℂ) (n : ℕ) : ℂ :=
  fallingProduct z n / (risingProduct beta n : ℂ)

theorem risingProduct_pos (beta : ℝ) (hbeta : 0 < beta) (n : ℕ) :
    0 < risingProduct beta n := by
  apply Finset.prod_pos
  intro k hk
  exact add_pos_of_pos_of_nonneg hbeta (Nat.cast_nonneg k)

theorem risingProduct_one (n : ℕ) : risingProduct 1 n = (n.factorial : ℝ) := by
  induction n with
  | zero => simp [risingProduct]
  | succ n ih =>
    rw [risingProduct_succ, ih, Nat.factorial_succ]
    push_cast
    ring

theorem sourceCoefficient_zero (beta : ℝ) (z : ℂ) : sourceCoefficient beta z 0 = 1 := by
  simp [sourceCoefficient, fallingProduct, risingProduct]

theorem sourceCoefficient_step (beta : ℝ) (hbeta : 0 < beta) (z : ℂ) (n : ℕ) :
    ((beta : ℂ) + (n : ℂ)) * sourceCoefficient beta z (n + 1) =
      (z - (n : ℂ)) * sourceCoefficient beta z n := by
  have hr : (risingProduct beta n : ℂ) ≠ 0 := by
    exact_mod_cast (risingProduct_pos beta hbeta n).ne'
  have hstep : (beta : ℂ) + (n : ℂ) ≠ 0 := by
    have h : (0 : ℝ) < beta + (n : ℝ) :=
      add_pos_of_pos_of_nonneg hbeta (Nat.cast_nonneg n)
    exact_mod_cast h.ne'
  have hf : fallingProduct z (n + 1) = fallingProduct z n * (z - (n : ℂ)) := by
    exact Finset.prod_range_succ _ _
  have hrstep : risingProduct beta (n + 1) = risingProduct beta n * (beta + (n : ℝ)) := by
    exact Finset.prod_range_succ _ _
  unfold sourceCoefficient
  rw [hf, hrstep]
  push_cast
  field_simp [hr, hstep]

theorem source_binomial_three_term (beta : ℝ) (hbeta : 0 < beta) (z t : ℂ) (n : ℕ) :
    ((beta : ℂ) + ((n + 1 : ℕ) : ℂ)) *
        binomialValue (sourceCoefficient beta z) t (n + 2) =
      (z - ((n + 1 : ℕ) : ℂ) +
        (2 * ((n + 1 : ℕ) : ℂ) + (beta : ℂ)) * t) *
          binomialValue (sourceCoefficient beta z) t (n + 1) +
      t * (1 - t) * ((n + 1 : ℕ) : ℂ) *
        binomialValue (sourceCoefficient beta z) t n :=
  binomial_three_term (beta : ℂ) z t (sourceCoefficient beta z)
    (sourceCoefficient_step beta hbeta z) n

/-- The monic diagonal polynomial, evaluated at `z` and `t`. -/
noncomputable def monicDiagonalValue (beta : ℝ) (z t : ℂ) (n : ℕ) : ℂ :=
  (risingProduct beta n : ℂ) * binomialValue (sourceCoefficient beta z) t n

theorem monicDiagonalValue_zero (beta : ℝ) (z t : ℂ) :
    monicDiagonalValue beta z t 0 = 1 := by
  simp [monicDiagonalValue, risingProduct, binomialValue, sourceCoefficient_zero]

theorem monicDiagonalValue_one (beta : ℝ) (hbeta : 0 < beta) (z t : ℂ) :
    monicDiagonalValue beta z t 1 = z + (beta : ℂ) * t := by
  have h := sourceCoefficient_step beta hbeta z 0
  simp only [Nat.cast_zero, add_zero, sub_zero, zero_add, sourceCoefficient_zero,
    mul_one] at h
  simp only [monicDiagonalValue, risingProduct, Finset.prod_range_one,
    Nat.cast_zero, add_zero, binomialValue, sourceCoefficient_zero,
    mul_one]
  linear_combination h

theorem monicDiagonalValue_recurrence (beta : ℝ) (hbeta : 0 < beta) (z t : ℂ) (n : ℕ) :
    monicDiagonalValue beta z t (n + 2) =
      (z - ((n + 1 : ℕ) : ℂ) +
        (2 * ((n + 1 : ℕ) : ℂ) + (beta : ℂ)) * t) *
          monicDiagonalValue beta z t (n + 1) +
      t * (1 - t) * ((n + 1 : ℕ) : ℂ) * ((n : ℂ) + (beta : ℂ)) *
        monicDiagonalValue beta z t n := by
  have h := source_binomial_three_term beta hbeta z t n
  unfold monicDiagonalValue
  simp only [show n + 2 = (n + 1) + 1 by omega, risingProduct_succ,
    Complex.ofReal_mul, Complex.ofReal_add, Complex.ofReal_natCast]
  linear_combination (risingProduct beta n : ℂ) * ((beta : ℂ) + (n : ℂ)) * h

noncomputable def ascendingProduct (z : ℂ) (n : ℕ) : ℂ :=
  ∏ k ∈ Finset.range n, (z + (k : ℂ))

theorem ascendingProduct_succ (z : ℂ) (n : ℕ) :
    ascendingProduct z (n + 1) = ascendingProduct z n * (z + (n : ℂ)) :=
  Finset.prod_range_succ _ _

theorem monicDiagonalValue_at_zero (beta : ℝ) (hbeta : 0 < beta) (z : ℂ) (n : ℕ) :
    monicDiagonalValue beta z 0 n = fallingProduct z n := by
  induction n with
  | zero => simp [monicDiagonalValue_zero, fallingProduct]
  | succ n ih =>
    cases n with
    | zero => simp [monicDiagonalValue_one beta hbeta, fallingProduct]
    | succ n =>
      rw [monicDiagonalValue_recurrence beta hbeta, fallingProduct_succ]
      simp only [mul_zero, add_zero, zero_mul, ih]
      ring

theorem monicDiagonalValue_at_one (beta : ℝ) (hbeta : 0 < beta) (z : ℂ) (n : ℕ) :
    monicDiagonalValue beta z 1 n = ascendingProduct (z + (beta : ℂ)) n := by
  induction n with
  | zero => simp [monicDiagonalValue_zero, ascendingProduct]
  | succ n ih =>
    cases n with
    | zero => simp [monicDiagonalValue_one beta hbeta, ascendingProduct]
    | succ n =>
      rw [monicDiagonalValue_recurrence beta hbeta, ascendingProduct_succ]
      simp only [sub_self, mul_zero, zero_mul, add_zero, mul_one, ih]
      ring

theorem fallingProduct_ne_zero (z : ℂ) (hz : z.im ≠ 0) (n : ℕ) :
    fallingProduct z n ≠ 0 := by
  apply Finset.prod_ne_zero_iff.mpr
  intro k hk h
  apply hz
  simpa using congrArg Complex.im h

theorem ascendingProduct_ne_zero (z : ℂ) (hz : z.im ≠ 0) (n : ℕ) :
    ascendingProduct z n ≠ 0 := by
  apply Finset.prod_ne_zero_iff.mpr
  intro k hk h
  apply hz
  simpa using congrArg Complex.im h

end VishnyakovaRootRadius
