import Conjectures.TomVailayaColorTrace
import Mathlib.Algebra.Polynomial.BigOperators
import Mathlib.Algebra.Polynomial.Roots
import Mathlib.LinearAlgebra.LinearIndependent.Defs

/-! The path test rows after specialization at (q=1). -/

open scoped BigOperators Polynomial
open Polynomial Matrix

namespace TomVailaya

noncomputable section

variable {K : Type*} [Field K]

theorem colorMatrix_pathEdge_one {N : ℕ} (x : Fin N → K) :
    colorMatrix x 1 pathEdge = Matrix.vecMulVec x 1 - Matrix.diagonal x := by
  ext b a
  rw [colorMatrix_pathEdge, Matrix.sub_apply, Matrix.vecMulVec_apply]
  by_cases h : b = a
  · subst a
    simp [arcFactor]
  · simp [Matrix.diagonal_apply_ne _ h, arcFactor, Ne.symm h]

/-- A single polynomial describes each row of the iterated path test. -/
def pathRowPolynomial {N : ℕ} (x : Fin N → K) : ℕ → K[X]
  | 0 => 1
  | i + 1 =>
    C (∑ c : Fin N, (pathRowPolynomial x i).eval (x c) * x c) - pathRowPolynomial x i * X

theorem pathRowPolynomial_natDegree {N : ℕ} (x : Fin N → K) (k : ℕ) :
    (pathRowPolynomial x k).natDegree ≤ k := by
  induction k with
  | zero => simp [pathRowPolynomial]
  | succ k ih =>
    rw [pathRowPolynomial]
    refine (Polynomial.natDegree_sub_le _ _).trans (max_le ?_ ?_)
    · simpa only [Polynomial.natDegree_C] using Nat.zero_le (k + 1)
    · exact Polynomial.natDegree_mul_le_of_le ih (by simp)

theorem pathRowPolynomial_coeff {N : ℕ} (x : Fin N → K) (k : ℕ) :
    (pathRowPolynomial x k).coeff k = (-1 : K) ^ k := by
  induction k with
  | zero => simp [pathRowPolynomial]
  | succ k ih =>
    rw [pathRowPolynomial, Polynomial.coeff_sub, Polynomial.coeff_C_succ,
      Polynomial.coeff_mul_X, ih, zero_sub, pow_succ, mul_neg_one]

/-- The row `1ᵀ A^k` is the evaluation of the path row polynomial
at the color variables, before the Vandermonde argument. -/
theorem pathRow_eval {N : ℕ} (x : Fin N → K) (k : ℕ) (b : Fin N) :
    (((1 : Fin N → K) ᵥ* (colorMatrix x 1 pathEdge) ^ k) b) =
      (pathRowPolynomial x k).eval (x b) := by
  induction k generalizing b with
  | zero => simp [pathRowPolynomial]
  | succ k ih =>
    rw [pow_succ, ← Matrix.vecMul_vecMul]
    let r : Fin N → K := (1 : Fin N → K) ᵥ* (colorMatrix x 1 pathEdge) ^ k
    change (r ᵥ* colorMatrix x 1 pathEdge) b = _
    rw [colorMatrix_pathEdge_one, Matrix.vecMul_sub, Pi.sub_apply, Matrix.vecMul_diagonal,
      Matrix.vecMul_vecMulVec, Pi.smul_apply]
    simp [pathRowPolynomial, dotProduct, r, ih, Polynomial.eval_finsetSum]

/-- Evaluation of polynomials with strictly increasing degrees at distinct
points preserves independence in the square Vandermonde range. -/
theorem polynomialEvaluations_linearIndependent {N : ℕ} (x : Fin N → K)
    (hx : Function.Injective x) (P : Fin N → K[X])
    (hdegree : ∀ i, (P i).natDegree ≤ i.val) (hcoeff : ∀ i, (P i).coeff i.val ≠ 0) :
    LinearIndependent K (fun i b => (P i).eval (x b)) := by
  classical
  rw [Fintype.linearIndependent_iff]
  intro w hw i₀
  by_contra hi₀
  let Q : K[X] := ∑ i : Fin N, C (w i) * P i
  have hP (b : Fin N) : Q.eval (x b) = 0 := by
    have hb := congrFun hw b
    simpa only [Q, Polynomial.eval_finsetSum, Polynomial.eval_mul, Polynomial.eval_C,
      Finset.sum_apply, Pi.smul_apply, Pi.zero_apply, smul_eq_mul] using hb
  have hQdegree : Q.natDegree ≤ N - 1 := by
    apply Polynomial.natDegree_sum_le_of_forall_le
    intro i _
    have hi := i.isLt
    have hconst : (C (w i)).natDegree ≤ 0 := by simp
    exact (Polynomial.natDegree_mul_le_of_le hconst (hdegree i)).trans
      (by omega)
  have hzero : Q = 0 := Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero Q hx hP (by
    rw [Fintype.card_fin]
    have hi := i₀.isLt
    omega)
  let s := Finset.univ.filter (fun i : Fin N => w i ≠ 0)
  obtain ⟨i, hi, hmax⟩ := Finset.exists_max_image s Fin.val ⟨i₀, by simp [s, hi₀]⟩
  have hwi : w i ≠ 0 := (Finset.mem_filter.mp hi).2
  have hc := congrArg (fun p : K[X] => p.coeff i.val) hzero
  simp only [Q, Polynomial.finsetSum_coeff, Polynomial.coeff_C_mul, Polynomial.coeff_zero] at hc
  rw [Finset.sum_eq_single i] at hc
  · exact (mul_ne_zero hwi (hcoeff i)) hc
  · intro j _ hj
    by_cases hwj : w j = 0
    · rw [hwj, zero_mul]
    · have hji := hmax j (by simp [s, hwj])
      have hlt : j.val < i.val := lt_of_le_of_ne hji (fun h => hj (Fin.ext h))
      rw [Polynomial.coeff_eq_zero_of_natDegree_lt
        ((hdegree j).trans_lt hlt), mul_zero]
  · simp


/-- At `q = 1`, the first `N` path rows are independent whenever the
`N` color variables are distinct. -/
theorem pathRows_linearIndependent {N : ℕ} (x : Fin N → K) (hx : Function.Injective x) :
    LinearIndependent K (fun k : Fin N => (1 : Fin N → K) ᵥ* (colorMatrix x 1 pathEdge) ^ k.val) := by
  have hrow (k : Fin N) : (1 : Fin N → K) ᵥ* (colorMatrix x 1 pathEdge) ^ k.val =
      fun b => (pathRowPolynomial x k).eval (x b) := funext (pathRow_eval x k)
  simp_rw [hrow]
  apply polynomialEvaluations_linearIndependent x hx _ (fun i => pathRowPolynomial_natDegree x i)
  intro i
  rw [pathRowPolynomial_coeff]
  exact pow_ne_zero _ (neg_ne_zero.mpr one_ne_zero)

end

end TomVailaya
