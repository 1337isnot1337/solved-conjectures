import Conjectures.RowlandSistosBarronDifference
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.LinearAlgebra.DFinsupp

/-!
# Rowland–Sistos Barrón conjecture

The shift operator on actual sequences and independence of exponential
polynomials at distinct nonzero bases. This discharges the independence step
in §1 of the repository's recorded proof rather than assuming it.
-/

noncomputable section

namespace RowlandSistosBarron

open Polynomial Finset Module

variable {K : Type*} [Field K]

/-- The actual unit shift of a sequence. -/
def sequenceShift : Module.End K (ℕ → K) where
  toFun u n := u (n + 1)
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

@[simp] theorem sequenceShift_apply (u : ℕ → K) (n : ℕ) :
    sequenceShift u n = u (n + 1) := rfl

theorem sequenceShift_pow_apply (u : ℕ → K) (r n : ℕ) :
    (sequenceShift ^ r) u n = u (n + r) := by
  induction r generalizing n with
  | zero => simp
  | succ r ih =>
    rw [pow_succ', Module.End.mul_apply, sequenceShift_apply, ih]
    congr 1
    omega

/-- A polynomial times an exponential, as an ordinary sequence. -/
def exponentialPolynomial (a : K) : K[X] →ₗ[K] (ℕ → K) where
  toFun p n := a ^ n * p.eval (n : K)
  map_add' p q := by ext n; simp [mul_add]
  map_smul' c p := by ext n; simp [mul_left_comm]

@[simp] theorem exponentialPolynomial_apply (a : K) (p : K[X]) (n : ℕ) :
    exponentialPolynomial a p n = a ^ n * p.eval (n : K) := rfl

variable [CharZero K]

theorem exponentialPolynomial_injective {a : K} (ha : a ≠ 0) :
    Function.Injective (exponentialPolynomial a) := by
  intro p q h
  apply polynomial_eq_of_nat_eval_eq
  intro n
  have hn := congrFun h n
  exact (mul_left_cancel₀ (pow_ne_zero n ha)) hn

@[simp] theorem exponentialPolynomial_eq_zero_iff {a : K} (ha : a ≠ 0)
    (p : K[X]) : exponentialPolynomial a p = 0 ↔ p = 0 := by
  exact map_eq_zero_iff _ (exponentialPolynomial_injective ha)

omit [CharZero K] in
theorem shifted_exponentialPolynomial (a : K) (p : K[X]) :
    (sequenceShift (K := K) - a • (1 : Module.End K (ℕ → K)))
        (exponentialPolynomial a p) =
      a • exponentialPolynomial a (forwardDifference p) := by
  ext n
  simp only [LinearMap.sub_apply, LinearMap.smul_apply, Module.End.one_apply,
    sequenceShift_apply, exponentialPolynomial_apply, Pi.sub_apply, Pi.smul_apply,
    smul_eq_mul, forwardDifference_eval, Nat.cast_add, Nat.cast_one, pow_succ]
  ring

omit [CharZero K] in
theorem shifted_exponentialPolynomial_pow (a : K) (p : K[X]) (r : ℕ) :
    ((sequenceShift (K := K) - a • (1 : Module.End K (ℕ → K))) ^ r)
        (exponentialPolynomial a p) =
      a ^ r • exponentialPolynomial a ((forwardDifference (K := K))^[r] p) := by
  induction r with
  | zero => simp
  | succ r ih =>
    rw [pow_succ', Module.End.mul_apply, ih, map_smul,
      shifted_exponentialPolynomial, smul_smul, pow_succ]
    rw [Function.iterate_succ_apply']

theorem exponentialPolynomial_mem_maxGenEigenspace (a : K) (p : K[X]) :
    exponentialPolynomial a p ∈ (sequenceShift (K := K)).maxGenEigenspace a := by
  rw [Module.End.mem_maxGenEigenspace]
  refine ⟨p.natDegree + 1, ?_⟩
  rw [shifted_exponentialPolynomial_pow]
  rw [(forwardDifference_iterate_eq_zero_iff p (p.natDegree + 1)).mpr
    (Or.inr (Nat.lt_succ_self _)), map_zero, smul_zero]

theorem exponentialPolynomial_sum_eq_zero_iff {ι : Type*} [Fintype ι]
    (a : ι → K) (ha : Function.Injective a) (ha0 : ∀ i, a i ≠ 0)
    (p : ι → K[X]) :
    (∑ i, exponentialPolynomial (a i) (p i)) = 0 ↔ ∀ i, p i = 0 := by
  classical
  constructor
  · intro h
    have hi := (sequenceShift (K := K)).independent_maxGenEigenspace.comp ha
    have hz := (iSupIndep_iff_finsetSum_eq_zero_imp_eq_zero _).mp hi univ
      (fun i => exponentialPolynomial (a i) (p i))
      (fun i _ => exponentialPolynomial_mem_maxGenEigenspace _ _) h
    intro i
    exact (exponentialPolynomial_eq_zero_iff (ha0 i) _).mp (hz i (mem_univ _))
  · intro h
    simp [h]

end RowlandSistosBarron
