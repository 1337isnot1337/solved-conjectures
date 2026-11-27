import Conjectures.AsgarliGhiocaYipPlaneFactor
import Mathlib.Algebra.MvPolynomial.NoZeroDivisors
import Mathlib.Algebra.Polynomial.Bivariate

/-! # The plane degree bound for the resolvent and its factors -/

namespace Conjectures.AsgarliGhiocaYip

open Finset Polynomial

variable {K : Type*} [Field K]

/-- Total degree, not the degree of the outer polynomial variable. -/
noncomputable def planeTotalDegree (P : PlanePolynomial K) : ℕ :=
  (Bivariate.equivMvPolynomial K P).totalDegree

private theorem planeTotalDegree_C_le (p : K[X]) : planeTotalDegree (C p) ≤ p.natDegree := by
  unfold planeTotalDegree
  nth_rw 1 [p.as_sum_range_C_mul_X_pow]
  simp only [map_sum, map_mul, map_pow, Bivariate.equivMvPolynomial_C_C, Bivariate.equivMvPolynomial_C_X]
  apply MvPolynomial.totalDegree_finsetSum_le
  intro j hj
  exact (MvPolynomial.totalDegree_mul _ _).trans (by
    simp only [MvPolynomial.totalDegree_C, MvPolynomial.totalDegree_X_pow, zero_add]
    exact Nat.le_of_lt_succ (mem_range.mp hj))

theorem planeTotalDegree_le {P : PlanePolynomial K} {N : ℕ} (hN : P.natDegree ≤ N)
    (hcoeff : ∀ j, (P.coeff j).natDegree ≤ N - j) : planeTotalDegree P ≤ N := by
  unfold planeTotalDegree
  nth_rw 1 [P.as_sum_range_C_mul_X_pow]
  simp only [map_sum, map_mul, map_pow, Bivariate.equivMvPolynomial_X]
  apply MvPolynomial.totalDegree_finsetSum_le
  intro j hj
  have hjN : j ≤ N := (Nat.le_of_lt_succ (mem_range.mp hj)).trans hN
  apply (MvPolynomial.totalDegree_mul _ _).trans
  rw [MvPolynomial.totalDegree_X_pow]
  exact (Nat.add_le_add_right ((planeTotalDegree_C_le _).trans (hcoeff j)) _).trans_eq
    (Nat.sub_add_cancel hjN)

theorem planeTotalDegree_le_of_dvd {F P : PlanePolynomial K} (h : F ∣ P) (hP : P ≠ 0) :
    planeTotalDegree F ≤ planeTotalDegree P := by
  obtain ⟨Q, hQ⟩ := h
  have hF : F ≠ 0 := by intro hf; simp [hQ, hf] at hP
  have hQ' : Q ≠ 0 := by intro hq; simp [hQ, hq] at hP
  let e := Bivariate.equivMvPolynomial K
  have hF' : e F ≠ 0 := by simpa only [map_zero] using e.injective.ne hF
  have hQ'' : e Q ≠ 0 := by simpa only [map_zero] using e.injective.ne hQ'
  change (e F).totalDegree ≤ (e P).totalDegree
  rw [hQ, map_mul, MvPolynomial.totalDegree_mul_of_isDomain hF' hQ'']
  exact Nat.le_add_right ..

end Conjectures.AsgarliGhiocaYip
