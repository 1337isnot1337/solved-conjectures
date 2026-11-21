import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

/-!
# Zhu's generalized Jacobi–Stirling counterexample

Variables 0, 1 and 2 of `Poly` are the source parameters a, b and x.
The rows are constructed from the source recurrence, not from precomputed
polynomials. `zhu_conjecture_false` negates coefficientwise nonnegativity for
all finite Hankel minors; `exact_coefficient` identifies the negative entry.
-/

namespace Zhu

variable {R : Type*} [CommRing R]

def entry (a b : R) : ℕ → ℕ → R
  | 0, 0 => 1
  | 0, _ + 1 => 0
  | n + 1, 0 => (a * 0^2 + b * 0) * entry a b n 0
  | n + 1, k + 1 => entry a b n k + (a * ((k + 1 : ℕ) : R)^2 + b * ((k + 1 : ℕ) : R)) * entry a b n (k + 1)

theorem entry_eq_zero_of_lt (a b : R) {n k : ℕ} (h : n < k) : entry a b n k = 0 := by
  induction n generalizing k with
  | zero => cases k with
    | zero => omega
    | succ k => rfl
  | succ n ih =>
    cases k with
    | zero => omega
    | succ k =>
      simp only [entry]
      rw [ih (by omega), ih (by omega)]
      simp

def row (a b x : R) (n : ℕ) : R :=
  ∑ k ∈ Finset.range (n + 1), entry a b n k * x ^ k

def hankel3 (a b x : R) : R :=
  let p := row a b x
  p 0 * (p 2 * p 4 - p 3 * p 3) -
    p 1 * (p 1 * p 4 - p 3 * p 2) +
    p 2 * (p 1 * p 3 - p 2 * p 2)

def hankelMatrix (a b x : R) : Matrix (Fin 3) (Fin 3) R :=
  fun i j => row a b x (i.val + j.val)

theorem matrix_det (a b x : R) : (hankelMatrix a b x).det = hankel3 a b x := by
  rw [Matrix.det_fin_three]
  simp [hankelMatrix, hankel3]
  ring

theorem determinant_identity (a b x : R) :
    hankel3 a b x = 2*x^3*((a+b)*(2*a+b)*(3*a+b)-2*a^2*x) := by
  simp [hankel3, row, entry, Finset.sum_range_succ]
  ring

theorem negative_region {K : Type*} [Field K] [LinearOrder K] [IsStrictOrderedRing K] (a b x : K)
    (ha : 0 < a) (hb : 0 ≤ b)
    (hx : (a+b)*(2*a+b)*(3*a+b)/(2*a^2) < x) :
    hankel3 a b x < 0 := by
  have hd : 0 < 2*a^2 := by positivity
  have hprod := (div_lt_iff₀ hd).mp hx
  have hxpos : 0 < x := by
    have hn : 0 ≤ (a+b)*(2*a+b)*(3*a+b) := by positivity
    have hq : 0 ≤ (a+b)*(2*a+b)*(3*a+b)/(2*a^2) := div_nonneg hn hd.le
    exact lt_of_le_of_lt hq hx
  rw [determinant_identity]
  have hf : 0 < 2*x^3 := by positivity
  apply mul_neg_of_pos_of_neg hf
  nlinarith

abbrev Poly := MvPolynomial (Fin 3) ℤ

noncomputable def determinant : Poly := hankel3 (MvPolynomial.X 0) (MvPolynomial.X 1) (MvPolynomial.X 2)

def valuation (i : Fin 3) : ℤ := if i = 2 then 13 else 1

theorem eval_determinant : MvPolynomial.eval valuation determinant = -8788 := by
  rw [determinant, determinant_identity]
  norm_num [valuation]

noncomputable def targetDegree : Fin 3 →₀ ℕ := Finsupp.single 0 2 + Finsupp.single 2 4

theorem exact_coefficient : determinant.coeff targetDegree = -4 := by
  rw [determinant, determinant_identity]
  ring_nf
  simp only [MvPolynomial.X, MvPolynomial.monomial_pow, one_pow,
    MvPolynomial.monomial_mul_monomial, one_mul]
  rw [show (12 : Poly) = MvPolynomial.C (12 : ℤ) by norm_num,
      show (22 : Poly) = MvPolynomial.C (22 : ℤ) by norm_num,
      show (2 : Poly) = MvPolynomial.C (2 : ℤ) by norm_num,
      show (4 : Poly) = MvPolynomial.C (4 : ℤ) by norm_num]
  simp only [mul_comm (MvPolynomial.monomial _ _) (MvPolynomial.C _),
    MvPolynomial.coeff_C_mul, AddMonoidAlgebra.coeff_add,
    AddMonoidAlgebra.coeff_sub, Finsupp.add_apply, Finsupp.sub_apply,
    MvPolynomial.coeff_monomial]
  simp [targetDegree, Finsupp.ext_iff, Fin.forall_fin_succ]

/-- The source asserts coefficientwise positivity for every finite Hankel minor. -/
noncomputable def coefficientwiseHankelTotalPositive : Prop :=
  ∀ (n : ℕ) (I J : Fin n → ℕ), StrictMono I → StrictMono J →
    ∀ d, (Matrix.det (fun i j =>
      row (MvPolynomial.X 0 : Poly) (MvPolynomial.X 1) (MvPolynomial.X 2) (I i + J j))).coeff d ≥ 0

theorem zhu_conjecture_false : ¬ coefficientwiseHankelTotalPositive := by
  intro h
  have hm : StrictMono (fun i : Fin 3 => i.val) := fun _ _ h => h
  have hh := h 3 (fun i => i.val) (fun i => i.val) hm hm targetDegree
  change 0 ≤ ((hankelMatrix (MvPolynomial.X 0 : Poly) (MvPolynomial.X 1)
    (MvPolynomial.X 2)).det).coeff targetDegree at hh
  rw [matrix_det] at hh
  change 0 ≤ determinant.coeff targetDegree at hh
  rw [exact_coefficient] at hh
  norm_num at hh

theorem eval_nonneg_of_coeff_nonneg (p : Poly)
    (hp : ∀ d, 0 ≤ p.coeff d) :
    0 ≤ MvPolynomial.eval valuation p := by
  rw [MvPolynomial.eval_eq]
  apply Finset.sum_nonneg
  intro d hd
  apply mul_nonneg (hp d)
  apply Finset.prod_nonneg
  intro i hi
  apply pow_nonneg
  fin_cases i <;> norm_num [valuation]

theorem coefficientwise_counterexample :
    ¬ ∀ d, 0 ≤ determinant.coeff d := by
  intro h
  have h' := eval_nonneg_of_coeff_nonneg determinant h
  rw [eval_determinant] at h'
  norm_num at h'

end Zhu
