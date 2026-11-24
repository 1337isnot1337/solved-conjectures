import Mathlib.Algebra.Polynomial.Degree.Operations
import Mathlib.Algebra.Polynomial.Expand
import Mathlib.Data.Nat.Choose.Cast
import Mathlib.Tactic.ComputeDegree
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-!
# Rowland–Sistos Barrón conjecture

The actual two-variable polynomial used in the existing entry
`results/rowland-sistos-barron/PROOF.md`, Sections 2–4. The outer variable
is the exponential marker and the inner variable is the sequence index.
The coefficient rank is a sum of degrees of these actual coefficient
polynomials, rather than a separately prescribed numerical sequence.
-/

open Polynomial
open scoped BigOperators

namespace RowlandSistosBarron

noncomputable section

/-- `T (1 + Y^3) + Y (1 - Y^3)`, with outer variable `Y`. -/
def basePolynomial : Polynomial (Polynomial ℚ) :=
  C X * (1 + X ^ 3) + X * (1 - X ^ 3)

/-- The actual coefficient of `Y^k` in the `M`th power of the source polynomial. -/
def coefficientPolynomial (M k : ℕ) : Polynomial ℚ :=
  (basePolynomial ^ M).coeff k

/-- The contribution of one nonzero polynomial to recurrence rank. -/
def polynomialRank (p : Polynomial ℚ) : ℕ :=
  if p = 0 then 0 else p.natDegree + 1

/-- Sum of the nonzero polynomial degrees plus one over every possible exponential root. -/
def coefficientRank (M : ℕ) : ℕ :=
  ∑ k ∈ Finset.range (4 * M + 1), polynomialRank (coefficientPolynomial M k)

theorem basePolynomial_eq :
    basePolynomial = C X + X + C X * X ^ 3 - X ^ 4 := by
  unfold basePolynomial
  ring

theorem basePolynomial_natDegree_le : basePolynomial.natDegree ≤ 4 := by
  rw [basePolynomial_eq]
  compute_degree

theorem basePolynomial_pow_natDegree_le (M : ℕ) :
    (basePolynomial ^ M).natDegree ≤ 4 * M := by
  simpa [Nat.mul_comm] using
    natDegree_pow_le.trans (Nat.mul_le_mul_left M basePolynomial_natDegree_le)

theorem coefficientPolynomial_eq_zero {M k : ℕ} (hk : 4 * M < k) :
    coefficientPolynomial M k = 0 :=
  coeff_eq_zero_of_natDegree_lt (lt_of_le_of_lt (basePolynomial_pow_natDegree_le M) hk)

@[simp] theorem polynomialRank_zero : polynomialRank 0 = 0 := by
  simp [polynomialRank]

theorem polynomialRank_of_ne_zero {p : Polynomial ℚ} (hp : p ≠ 0) :
    polynomialRank p = p.natDegree + 1 := by
  simp [polynomialRank, hp]

theorem coefficientRank_one : coefficientRank 1 = 6 := by
  norm_num [coefficientRank, coefficientPolynomial, basePolynomial_eq,
    Finset.sum_range_succ, coeff_add, coeff_sub, coeff_C_mul, coeff_X_pow, coeff_X,
    polynomialRank]

end

end RowlandSistosBarron
