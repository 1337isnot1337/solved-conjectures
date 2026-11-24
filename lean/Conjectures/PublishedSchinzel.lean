import Mathlib.Algebra.Polynomial.Bivariate
import Mathlib.Algebra.Polynomial.SpecificDegree
import Mathlib.Algebra.Polynomial.Degree.Domain
import Mathlib.Data.Set.Finite.Basic
import Mathlib.Tactic.ComputeDegree
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring
import Lean.Elab.Tactic.Omega

/-!
# Schinzel's conjecture

The polynomial-orbit conjecture attributed to A. Schinzel (1963).
This file formalizes Umberto Zannier's counterexample as published in
Giulio Peruginelli, *Integer values of polynomials*, PhD thesis, Pisa (2008),
introduction pp. 4 and 6 and Chapter 4, section 4.1, p. 57.
Source: https://etd.adm.unipi.it/theses/available/etd-11282008-095329/unrestricted/PhDThesis.pdf

The bivariate polynomial and its irreducibility use Mathlib polynomials.
The target includes every set, degree, symmetry, and rational-orbit hypothesis.
-/

open Polynomial
open scoped Polynomial.Bivariate

namespace Published.Schinzel

noncomputable section

/-- Schinzel's property for a rational bivariate polynomial. -/
def HasSchinzelProperty (f : ℚ[X][Y]) : Prop :=
  ∃ S : Set ℚ, S.Infinite ∧ ∀ x ∈ S, ∃ y ∈ S, f.evalEval x y = 0

/-- The full conjecture as stated in Peruginelli's 2008 thesis. -/
def SchinzelConjecture : Prop :=
  ∀ f : ℚ[X][Y], Irreducible f → HasSchinzelProperty f →
    f.natDegree = 1 ∨ Bivariate.swap f = f

/-- Zannier's published polynomial. -/
def witness : ℚ[X][Y] :=
  Y ^ 2 - C (2 * (X ^ 2 + X)) * Y + C ((X ^ 2 - X) ^ 2)

theorem witness_monic : witness.Monic := by
  unfold witness
  monicity!

theorem witness_degree : witness.natDegree = 2 := by
  unfold witness
  compute_degree!

theorem witness_eval (x y : ℚ) :
    witness.evalEval x y = y ^ 2 - 2 * (x ^ 2 + x) * y + (x ^ 2 - x) ^ 2 := by
  simp [witness, evalEval, eval_sub, eval_add, eval_mul, eval_pow]

theorem witness_no_polynomial_root (g : ℚ[X]) : ¬ witness.IsRoot g := by
  intro hg
  have heq : g ^ 2 - 2 * (X ^ 2 + X) * g + (X ^ 2 - X) ^ 2 = 0 := by
    simpa [IsRoot, witness] using hg
  have hsquare : (g - (X ^ 2 + X)) ^ 2 = (4 : ℚ[X]) * X ^ 3 := by
    linear_combination heq
  have hdeg := congrArg Polynomial.natDegree hsquare
  have hright : ((4 : ℚ[X]) * X ^ 3).natDegree = 3 := by
    compute_degree!
  rw [Polynomial.natDegree_pow, hright] at hdeg
  omega

theorem witness_irreducible : Irreducible witness := by
  rw [witness_monic.irreducible_iff_roots_eq_zero_of_degree_le_three
    (by simp [witness_degree]) (by simp [witness_degree])]
  apply Multiset.eq_zero_of_forall_notMem
  intro g hg
  exact witness_no_polynomial_root g ((mem_roots witness_monic.ne_zero).mp hg)

theorem witness_parametrization (t : ℚ) :
    witness.evalEval (t ^ 2) ((t * (t + 1)) ^ 2) = 0 := by
  rw [witness_eval]
  ring

theorem rational_squares_infinite : (Set.range (fun t : ℚ => t ^ 2)).Infinite := by
  apply Set.infinite_of_injective_forall_mem
    (f := fun n : ℕ => (n : ℚ) ^ 2)
  · intro m n h
    have heq : (m : ℚ) = (n : ℚ) :=
      (sq_eq_sq₀ (Nat.cast_nonneg m) (Nat.cast_nonneg n)).mp h
    exact_mod_cast heq
  · intro n
    exact ⟨(n : ℚ), rfl⟩

theorem witness_has_property : HasSchinzelProperty witness := by
  refine ⟨Set.range (fun t : ℚ => t ^ 2), rational_squares_infinite, ?_⟩
  rintro x ⟨t, rfl⟩
  exact ⟨(t * (t + 1)) ^ 2, ⟨t * (t + 1), rfl⟩, witness_parametrization t⟩

theorem witness_not_symmetric : Bivariate.swap witness ≠ witness := by
  intro h
  have heval := congrArg (fun p : ℚ[X][Y] => p.aevalAeval (0 : ℚ) 1) h
  rw [Bivariate.aevalAeval_swap] at heval
  simp only [coe_aevalAeval_eq_evalEval] at heval
  norm_num [witness_eval] at heval

/-- The whole universally quantified conjecture is false. -/
theorem schinzel_conjecture_false : ¬ SchinzelConjecture := by
  intro h
  rcases h witness witness_irreducible witness_has_property with hlinear | hsymm
  · rw [witness_degree] at hlinear
    omega
  · exact witness_not_symmetric hsymm

#print axioms witness_irreducible
#print axioms schinzel_conjecture_false

end

end Published.Schinzel
