import Mathlib.RingTheory.MvPolynomial.WeightedHomogeneous
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic.FinCases

/-!
# Extracting the five `e₂,e₃` coefficients in weighted degree 31

After setting the degree-one elementary generator to zero, only the exponent
pairs `(14,1)`, `(11,3)`, `(8,5)`, `(5,7)` and `(2,9)` can remain. This lemma
turns exact proper-colouring evaluations into equations for those five genuine
elementary-basis coefficients. It does not assume any numerical coefficient.
-/

open MvPolynomial
open scoped BigOperators

namespace LiCoefficientExtraction

noncomputable def exponent (a b : ℕ) : Fin 3 →₀ ℕ :=
  Finsupp.single 1 a + Finsupp.single 2 b

def powers : Fin 5 → ℕ × ℕ := ![(14, 1), (11, 3), (8, 5), (5, 7), (2, 9)]

noncomputable def index (i : Fin 5) : Fin 3 →₀ ℕ := exponent (powers i).1 (powers i).2

@[simp] theorem exponent_zero (a b : ℕ) : exponent a b 0 = 0 := by
  simp [exponent]

@[simp] theorem exponent_one (a b : ℕ) : exponent a b 1 = a := by
  simp [exponent]

@[simp] theorem exponent_two (a b : ℕ) : exponent a b 2 = b := by
  simp [exponent]

theorem index_injective : Function.Injective index := by
  intro i j h
  have hfirst : (powers i).1 = (powers j).1 := by
    simpa [index] using congrArg (fun d : Fin 3 →₀ ℕ => d 1) h
  fin_cases i <;> fin_cases j <;> simp_all [powers]

theorem index_of_weight (d : Fin 3 →₀ ℕ)
    (hd : Finsupp.weight (fun i : Fin 3 => i.val + 1) d = 31) (h0 : d 0 = 0) :
    ∃ i : Fin 5, d = index i := by
  have hw : d 0 + 2 * d 1 + 3 * d 2 = 31 := by
    simpa [Finsupp.weight_eq_sum, Fin.sum_univ_three, mul_comm, mul_left_comm,
      mul_assoc] using hd
  have hcases :
      (d 1 = 14 ∧ d 2 = 1) ∨ (d 1 = 11 ∧ d 2 = 3) ∨
      (d 1 = 8 ∧ d 2 = 5) ∨ (d 1 = 5 ∧ d 2 = 7) ∨ (d 1 = 2 ∧ d 2 = 9) := by
    omega
  rcases hcases with ⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨h1, h2⟩
  · refine ⟨0, ?_⟩
    ext j
    fin_cases j <;> simp [index, exponent, powers, h0, h1, h2]
  · refine ⟨1, ?_⟩
    ext j
    fin_cases j <;> simp [index, exponent, powers, h0, h1, h2]
  · refine ⟨2, ?_⟩
    ext j
    fin_cases j <;> simp [index, exponent, powers, h0, h1, h2]
  · refine ⟨3, ?_⟩
    ext j
    fin_cases j <;> simp [index, exponent, powers, h0, h1, h2]
  · refine ⟨4, ?_⟩
    ext j
    fin_cases j <;> simp [index, exponent, powers, h0, h1, h2]

section Evaluation

variable {R : Type*} [CommRing R] [Algebra ℚ R]

theorem aeval_monomial_zero_first (d : Fin 3 →₀ ℕ) (q : ℚ) (s t : R) :
    MvPolynomial.aeval ![0, s, t] (MvPolynomial.monomial d q) =
      algebraMap ℚ R q * (0 ^ d 0 * s ^ d 1 * t ^ d 2) := by
  rw [MvPolynomial.aeval_monomial]
  have hp : (d.prod fun i k => (![0, s, t] : Fin 3 → R) i ^ k) =
      ∏ i : Fin 3, (![0, s, t] : Fin 3 → R) i ^ d i := by
    rw [Finsupp.prod_of_support_subset d (Finset.subset_univ _)
      (fun i k => (![0, s, t] : Fin 3 → R) i ^ k) (by intro i _; simp)]
  rw [hp, Fin.prod_univ_three]
  rfl

theorem aeval_monomial_index (i : Fin 5) (q : ℚ) (s t : R) :
    MvPolynomial.aeval ![0, s, t] (MvPolynomial.monomial (index i) q) =
      algebraMap ℚ R q * s ^ (powers i).1 * t ^ (powers i).2 := by
  rw [aeval_monomial_zero_first]
  simp [index, mul_assoc]

theorem aeval_monomial_of_weight (d : Fin 3 →₀ ℕ)
    (hd : Finsupp.weight (fun i : Fin 3 => i.val + 1) d = 31)
    (q : ℚ) (s t : R) :
    MvPolynomial.aeval ![0, s, t] (MvPolynomial.monomial d q) =
      ∑ i : Fin 5, if d = index i then
        algebraMap ℚ R q * s ^ (powers i).1 * t ^ (powers i).2 else 0 := by
  classical
  by_cases h0 : d 0 = 0
  · obtain ⟨i, rfl⟩ := index_of_weight d hd h0
    rw [aeval_monomial_index, Finset.sum_eq_single i]
    · simp
    · intro j _ hji
      exact ite_eq_right (fun h => hji (index_injective h.symm))
    · simp
  · rw [aeval_monomial_zero_first, zero_pow h0]
    simp only [zero_mul, mul_zero]
    symm
    apply Finset.sum_eq_zero
    intro i _
    apply ite_eq_right
    intro h
    apply h0
    rw [h]
    simp [index]

/-- The entire weighted-degree31 specialization has only five possible terms. -/
theorem aeval_eq_five_terms (p : MvPolynomial (Fin 3) ℚ)
    (hp : MvPolynomial.IsWeightedHomogeneous (fun i : Fin 3 => i.val + 1) p 31)
    (s t : R) :
    MvPolynomial.aeval ![0, s, t] p =
      ∑ i : Fin 5, algebraMap ℚ R (p.coeff (index i)) *
        s ^ (powers i).1 * t ^ (powers i).2 := by
  classical
  conv_lhs => rw [MvPolynomial.as_sum p]
  rw [map_sum]
  have hterms : ∀ d ∈ p.support,
      MvPolynomial.aeval ![0, s, t] (MvPolynomial.monomial d (p.coeff d)) =
        ∑ i : Fin 5, if d = index i then
          algebraMap ℚ R (p.coeff d) * s ^ (powers i).1 * t ^ (powers i).2 else 0 := by
    intro d hd
    exact aeval_monomial_of_weight d (hp (Finsupp.mem_support_iff.mp hd)) (p.coeff d) s t
  rw [Finset.sum_congr rfl hterms, Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro i _
  rw [Finset.sum_eq_single (index i)]
  · simp
  · intro d _ hdi
    exact ite_eq_right hdi
  · intro hi
    rw [Finsupp.notMem_support_iff.mp hi]
    simp

end Evaluation

end LiCoefficientExtraction
