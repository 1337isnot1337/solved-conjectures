import Conjectures.JuhnkePathsPolynomial
import Mathlib.Logic.Equiv.Fin.Basic

/-!
# Juhnke's conjecture

The boundary dimensions required by the all-dimensional statement. These
are proofs of the actual path counting polynomials, not separate results.
-/

namespace Juhnke

open scoped BigOperators
open Polynomial

theorem literalPath_zero_card : Fintype.card (LiteralPath 0) = 1 := by
  change Fintype.card (Σ c : Composition 0, Fin c.length → Bool) = 1
  rw [Fintype.card_sigma]
  have hz (c : Composition 0) : c.length = 0 := c.length_eq_zero.mpr rfl
  simp_rw [hz]
  simp [composition_card]

theorem pathPolynomial_zero : pathPolynomial 0 0 = 1 := by
  have hl (p : LiteralPath 0) : p.stepCount = 0 := p.1.length_eq_zero.mpr rfl
  have he (p : LiteralPath 0) : p.east = 0 := by
    have h := p.east_add_north
    omega
  simp [pathPolynomial, hl, he, composition_card]

@[simp] theorem eastCount_two (a b : Bool) :
    eastCount ![a, b] = (if a then 1 else 0) + (if b then 1 else 0) := by
  unfold eastCount
  rw [Fin.sum_univ_two]
  rfl

theorem pathPolynomial_two_zero : pathPolynomial 2 0 = X + X ^ 2 := by
  classical
  rw [pathPolynomial_runExpansion (by omega)]
  rw [← Equiv.sum_comp (finTwoArrowEquiv Bool).symm]
  simp [Fintype.sum_prod_type, finTwoArrowEquiv,
    runCount, changes, leftUnit, rightUnit]
  ring

theorem pathPolynomial_two_one : pathPolynomial 2 1 = 2 * X ^ 2 := by
  classical
  rw [pathPolynomial_runExpansion (by omega)]
  rw [← Equiv.sum_comp (finTwoArrowEquiv Bool).symm]
  simp [Fintype.sum_prod_type, finTwoArrowEquiv,
    runCount, changes, leftUnit, rightUnit]
  ring

/-- The two endpoint families in dimension three give exactly `z + 3z²`. -/
theorem pathPolynomial_dimension_three :
    pathPolynomial 2 0 + pathPolynomial 2 1 = X + 3 * X ^ 2 := by
  rw [pathPolynomial_two_zero, pathPolynomial_two_one]
  ring

end Juhnke
