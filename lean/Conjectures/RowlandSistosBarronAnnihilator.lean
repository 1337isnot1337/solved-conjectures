import Conjectures.RowlandSistosBarronExponential
import Mathlib.Algebra.Polynomial.RingDivision

/-!
# Rowland–Sistos Barrón conjecture

The annihilating polynomial of a literal exponential-polynomial sequence.
The crucial conclusion identifies each required root multiplicity; it is
not an assumption about the minimal order of a recurrence.
-/

noncomputable section

namespace RowlandSistosBarron

open Polynomial Finset Module

variable {K : Type*} [Field K] [CharZero K]

/-- The polynomial action induced by shifting `a^n p(n)`. -/
def polynomialShift (a : K) : Module.End K K[X] := a • taylor 1

theorem polynomialShift_pow_apply (a : K) (r : ℕ) (p : K[X]) :
    (polynomialShift a ^ r) p = a ^ r • taylor (r : K) p := by
  induction r with
  | zero => simp
  | succ r ih =>
    rw [pow_succ', Module.End.mul_apply, ih]
    simp only [polynomialShift, LinearMap.smul_apply, map_smul, smul_smul,
      taylor_taylor, Nat.cast_add, Nat.cast_one, pow_succ]
    simp only [mul_comm, add_comm]

theorem polynomialShift_aeval_apply (a : K) (q p : K[X]) :
    (aeval (polynomialShift a) q) p =
      ∑ j ∈ range (q.natDegree + 1), (q.coeff j * a ^ j) • taylor (j : K) p := by
  rw [aeval_eq_sum_range]
  simp only [LinearMap.sum_apply, LinearMap.smul_apply, polynomialShift_pow_apply,
    smul_smul]

theorem polynomialShift_aeval_natDegree_le (a : K) (q p : K[X]) :
    ((aeval (polynomialShift a) q) p).natDegree ≤ p.natDegree := by
  rw [polynomialShift_aeval_apply]
  apply natDegree_sum_le_of_forall_le
  intro j _
  exact (natDegree_smul_le _ _).trans (by rw [natDegree_taylor])

theorem polynomialShift_aeval_top_coeff (a : K) (q p : K[X]) :
    ((aeval (polynomialShift a) q) p).coeff p.natDegree =
      q.eval a * p.leadingCoeff := by
  rw [polynomialShift_aeval_apply, finsetSum_coeff]
  simp only [coeff_smul, coeff_taylor_natDegree, smul_eq_mul]
  rw [← sum_mul, ← eval_eq_sum_range]

theorem polynomialShift_aeval_ne_zero {a : K} {q p : K[X]}
    (hq : q.eval a ≠ 0) (hp : p ≠ 0) : (aeval (polynomialShift a) q) p ≠ 0 := by
  intro h
  have ht := polynomialShift_aeval_top_coeff a q p
  rw [h, coeff_zero] at ht
  exact (mul_ne_zero hq (leadingCoeff_ne_zero.mpr hp)) ht.symm

theorem polynomialShift_aeval_natDegree {a : K} {q p : K[X]}
    (hq : q.eval a ≠ 0) (hp : p ≠ 0) :
    ((aeval (polynomialShift a) q) p).natDegree = p.natDegree := by
  apply natDegree_eq_of_le_of_coeff_ne_zero (polynomialShift_aeval_natDegree_le _ _ _)
  rw [polynomialShift_aeval_top_coeff]
  exact mul_ne_zero hq (leadingCoeff_ne_zero.mpr hp)

theorem sequenceShift_aeval_exponentialPolynomial (a : K) (q p : K[X]) :
    (aeval (sequenceShift (K := K)) q) (exponentialPolynomial a p) =
      exponentialPolynomial a ((aeval (polynomialShift a) q) p) := by
  rw [polynomialShift_aeval_apply, map_sum, aeval_eq_sum_range]
  simp only [LinearMap.sum_apply]
  apply sum_congr rfl
  intro j _
  rw [map_smul]
  ext n
  simp only [LinearMap.smul_apply, Pi.smul_apply, smul_eq_mul,
    sequenceShift_pow_apply, exponentialPolynomial_apply, taylor_eval,
    Nat.cast_add, pow_add]
  ring

theorem sequenceShift_aeval_exponentialPolynomial_eq_zero_iff
    {a : K} (ha : a ≠ 0) (p q : K[X]) :
    (aeval (sequenceShift (K := K)) q) (exponentialPolynomial a p) = 0 ↔
      p = 0 ∨ (X - C a) ^ (p.natDegree + 1) ∣ q := by
  by_cases hp : p = 0
  · subst p
    simp
  by_cases hq : q = 0
  · subst q
    simp
  obtain ⟨h, hfactor, hn⟩ := exists_eq_pow_rootMultiplicity_mul_and_not_dvd q hq a
  have heval : h.eval a ≠ 0 := by
    simpa only [dvd_iff_isRoot, IsRoot.def] using hn
  have hpoly : (aeval (polynomialShift a) h) p ≠ 0 :=
    polynomialShift_aeval_ne_zero heval hp
  have hdeg : ((aeval (polynomialShift a) h) p).natDegree = p.natDegree :=
    polynomialShift_aeval_natDegree heval hp
  rw [hfactor, map_mul, map_pow, map_sub, aeval_X, aeval_C,
    Algebra.algebraMap_eq_smul_one, Module.End.mul_apply,
    sequenceShift_aeval_exponentialPolynomial, shifted_exponentialPolynomial_pow]
  rw [smul_eq_zero_iff_right (pow_ne_zero _ ha),
    exponentialPolynomial_eq_zero_iff ha, forwardDifference_iterate_eq_zero_iff]
  rw [hdeg]
  simp only [hpoly, hp, false_or]
  rw [← hfactor, ← le_rootMultiplicity_iff hq]
  omega

end RowlandSistosBarron
