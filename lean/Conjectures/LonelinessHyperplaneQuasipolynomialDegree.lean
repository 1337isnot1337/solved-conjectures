import Conjectures.LonelinessHyperplaneQuasipolynomialClosure
import Mathlib.Analysis.Polynomial.Basic
import Mathlib.Analysis.Normed.Field.Lemmas

/-!
# Exact quasipolynomial degree bounds from counting bounds

A polynomial dominated on positive integers by another polynomial cannot have
larger degree. Applying this on each progression lowers the degree bound of the
same exact quasipolynomial formulas. Values at zero are left unchanged.
-/

namespace Loneliness.Hyperplane.QuasipolynomialArithmetic

open Polynomial Filter

theorem natDegree_le_of_nat_abs_eval_le
    (P Q : ℚ[X]) (hQ : Q ≠ 0)
    (hbound : ∀ n : ℕ, 0 < n → |P.eval (n : ℚ)| ≤ |Q.eval (n : ℚ)|) :
    P.natDegree ≤ Q.natDegree := by
  by_contra hdegree
  have hlt : Q.natDegree < P.natDegree := lt_of_not_ge hdegree
  have hP : P ≠ 0 := by
    intro hzero
    rw [hzero, natDegree_zero] at hlt
    omega
  have hdegrees : Q.degree < P.degree := by
    rw [degree_eq_natDegree hQ, degree_eq_natDegree hP]
    exact_mod_cast hlt
  have ht : Tendsto (fun n : ℕ => |P.eval (n : ℚ) / Q.eval (n : ℚ)|)
      atTop atTop :=
    (P.abs_div_tendsto_atTop_atTop_of_degree_gt Q hdegrees hQ).comp
      tendsto_natCast_atTop_atTop
  have hsmall : ∀ᶠ n : ℕ in atTop, |P.eval (n : ℚ) / Q.eval (n : ℚ)| ≤ 1 := by
    filter_upwards [eventually_ge_atTop 1] with n hn
    rw [abs_div]
    by_cases hzero : Q.eval (n : ℚ) = 0
    · simp only [hzero, abs_zero, div_zero, zero_le_one]
    · exact (div_le_one (abs_pos.mpr hzero)).mpr (hbound n (by omega))
  have hlarge : ∀ᶠ n : ℕ in atTop, 1 < |P.eval (n : ℚ) / Q.eval (n : ℚ)| :=
    ht.eventually (eventually_gt_atTop 1)
  obtain ⟨n, hn, hn'⟩ := (hsmall.and hlarge).exists
  exact (not_lt_of_ge hn) hn'

/-- Only a positive-integer bound is needed; the progression polynomials
and their exact values at every nonnegative argument are retained. -/
theorem IsQuasipolynomial.degree_of_power_bound
    {f : ℕ → ℚ} {e : ℕ} (hf : IsQuasipolynomial f e) (R d : ℕ)
    (hbound : ∀ N : ℕ, 0 < N → |f N| ≤ (R : ℚ) * (N : ℚ) ^ d) :
    IsQuasipolynomial f d := by
  obtain ⟨M, hM, P, _, heval⟩ := hf
  refine ⟨M, hM, P, ?_, heval⟩
  intro r
  let L : ℚ[X] := C (M : ℚ) * X + C (r : ℚ)
  let Q : ℚ[X] := C ((R + 1 : ℕ) : ℚ) * L ^ d
  have hL : L ≠ 0 := by
    intro hzero
    have hcoeff := congrArg (fun p : ℚ[X] => p.coeff 1) hzero
    have hMzero : (M : ℚ) = 0 := by
      simpa only [L, coeff_add, coeff_C_mul, coeff_X_one, mul_one,
        coeff_C, one_ne_zero, ite_false, add_zero, coeff_zero] using hcoeff
    exact (Nat.cast_ne_zero.mpr hM.ne') hMzero
  have hQ : Q ≠ 0 :=
    mul_ne_zero (C_ne_zero.mpr (by exact_mod_cast (Nat.succ_ne_zero R)))
      (pow_ne_zero d hL)
  have hLdegree : L.natDegree ≤ 1 := by
    apply natDegree_add_le_of_degree_le
    · exact (natDegree_C_mul_le _ _).trans natDegree_X_le
    · simp only [natDegree_C]
      omega
  have hQdegree : Q.natDegree ≤ d := by
    apply (natDegree_C_mul_le _ _).trans
    simpa only [Nat.mul_one] using natDegree_pow_le_of_le d hLdegree
  apply (natDegree_le_of_nat_abs_eval_le (P r) Q hQ ?_).trans hQdegree
  intro n hn
  have hN : 0 < M * n + (r : ℕ) :=
    (Nat.mul_pos hM hn).trans_le (Nat.le_add_right _ _)
  have hb := hbound (M * n + (r : ℕ)) hN
  rw [heval r n] at hb
  have hbase : 0 ≤ (M : ℚ) * (n : ℚ) + (r : ℚ) := by positivity
  have hb' : |(P r).eval (n : ℚ)| ≤
      (R : ℚ) * ((M : ℚ) * (n : ℚ) + (r : ℚ)) ^ d := by
    simpa only [Nat.cast_add, Nat.cast_mul] using hb
  have hR : (R : ℚ) ≤ ((R + 1 : ℕ) : ℚ) := by exact_mod_cast Nat.le_succ R
  have hvalue : Q.eval (n : ℚ) =
      ((R + 1 : ℕ) : ℚ) * ((M : ℚ) * (n : ℚ) + (r : ℚ)) ^ d := by
    simp only [Q, L, eval_mul, eval_C, eval_pow, eval_add, eval_X]
  rw [hvalue, abs_of_nonneg (mul_nonneg (Nat.cast_nonneg _) (pow_nonneg hbase d))]
  exact hb'.trans (mul_le_mul_of_nonneg_right hR (pow_nonneg hbase d))

/-- A literal finite-count bound gives the degree bound even when the exact
quasipolynomial is only identified with the count for `N ≥ 1`. -/
theorem IsQuasipolynomial.degree_of_nat_count_bound
    {q : ℕ → ℚ} {e : ℕ} (hq : IsQuasipolynomial q e)
    (count : ℕ → ℕ) (heq : ∀ N : ℕ, 0 < N → q N = (count N : ℚ))
    (R d : ℕ) (hbound : ∀ N : ℕ, count N ≤ R * N ^ d) :
    IsQuasipolynomial q d := by
  apply hq.degree_of_power_bound R d
  intro N hN
  rw [heq N hN, abs_of_nonneg (Nat.cast_nonneg _)]
  exact_mod_cast hbound N

end Loneliness.Hyperplane.QuasipolynomialArithmetic
