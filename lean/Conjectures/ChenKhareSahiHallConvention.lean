module

public import Mathlib.Basic.Real.Basic
public import Mathlib.LinearAlgebra.Matrix.Notation
public import Mathlib.Algebra.BigOperators.Fin
public import Mathlib.Tactic.FinCases
public import Mathlib.Tactic.NormNum
public import Mathlib.Tactic.Linarith
public import Mathlib.Tactic.Ring

/-!
# A finite-variable Hall convention check

Section 2.3 of arXiv:2509.19649v2 writes the diagonal power-sum Hall form on
the finite-variable power basis with parts at most the number of variables.
That form does not give the standard Macdonald polynomials in general.

In two variables and degree three, at `q = t = 1/2`, equation (5.3) gives
`P_(3) = p_2 p_1` and `P_(2,1) = (p_1^3 - p_2 p_1) / 2`. The literal
finite-variable diagonal form gives their pairing as `-1`, not zero.
This check explains why the separate formalization uses the standard stable
Hall family before specialization. It does not change that family's pairing.
-/

@[expose] public section

namespace ChenKhareSahi.HallConvention

open scoped BigOperators

/-- Coordinates in the actual two-variable degree-three power basis
`(p_2 p_1, p_1^3)`. -/
abbrev Vector := Fin 2 → ℝ

noncomputable def realize (v : Vector) (x y : ℝ) : ℝ :=
  v 0 * ((x ^ 2 + y ^ 2) * (x + y)) + v 1 * (x + y) ^ 3

theorem realize_injective : Function.Injective realize := by
  intro v w h
  have h1 := congrFun (congrFun h 1) 0
  have h2 := congrFun (congrFun h 1) 1
  norm_num [realize] at h1 h2
  funext i
  fin_cases i
  · change v 0 = w 0
    linarith
  · change v 1 = w 1
    linarith

/-- At `q=t=1/2`, the source's diagonal weights are `z_(2,1)=2`
and `z_(1,1,1)=6`. -/
noncomputable def finiteHall (v w : Vector) : ℝ :=
  2 * v 0 * w 0 + 6 * v 1 * w 1

theorem diagonal_weights_half :
    (2 : ℝ) * ((1 - (1/2 : ℝ)^2) / (1 - (1/2 : ℝ)^2)) *
      ((1 - (1/2 : ℝ)) / (1 - (1/2 : ℝ))) = 2 ∧
    (6 : ℝ) * (((1 - (1/2 : ℝ)) / (1 - (1/2 : ℝ))) ^ 3) = 6 := by
  norm_num

noncomputable def rowThree : Vector := ![1, 0]
noncomputable def rowTwoOne : Vector := ![-(1/2), 1/2]

theorem realize_rowThree (x y : ℝ) :
    realize rowThree x y = x^3 + x^2*y + x*y^2 + y^3 := by
  simp only [realize, rowThree, Matrix.cons_val_zero, Matrix.cons_val_one,
    one_mul, zero_mul, add_zero]
  ring

theorem realize_rowTwoOne (x y : ℝ) :
    realize rowTwoOne x y = x^2*y + x*y^2 := by
  simp only [realize, rowTwoOne, Matrix.cons_val_zero, Matrix.cons_val_one]
  ring

noncomputable def pochhammer (a q : ℝ) (k : ℕ) : ℝ :=
  ∏ i ∈ Finset.range k, (1 - a * q^i)

/-- The two-variable one-row formula in equation (5.3). -/
noncomputable def sourceOneRow (q t : ℝ) (d : ℕ) (x y : ℝ) : ℝ :=
  ∑ i ∈ Finset.range (d + 1),
    pochhammer q q d / (pochhammer q q i * pochhammer q q (d-i)) *
      (pochhammer t q i * pochhammer t q (d-i)) / pochhammer t q d * x^i * y^(d-i)

theorem sourceOneRow_half_three (x y : ℝ) :
    sourceOneRow (1/2) (1/2) 3 x y = realize rowThree x y := by
  rw [realize_rowThree]
  norm_num [sourceOneRow, pochhammer, Finset.sum_range_succ, Finset.prod_range_succ]
  ring

theorem sourceOneRow_half_two_one (x y : ℝ) :
    x*y * sourceOneRow (1/2) (1/2) 1 x y = realize rowTwoOne x y := by
  rw [realize_rowTwoOne]
  norm_num [sourceOneRow, pochhammer, Finset.sum_range_succ, Finset.prod_range_succ]
  ring

/-- The finite-variable diagonal form is not the stable Hall form after
specialization: these two standard Macdonald polynomials are not orthogonal. -/
theorem finiteHall_source_pairing : finiteHall rowThree rowTwoOne = -1 := by
  norm_num [finiteHall, rowThree, rowTwoOne]

theorem source_formulas_not_finiteHall_orthogonal :
    (0 : ℝ) < 1/2 ∧ (1/2 : ℝ) < 1 ∧
      (∀ x y, sourceOneRow (1/2) (1/2) 3 x y = realize rowThree x y) ∧
      (∀ x y, x*y * sourceOneRow (1/2) (1/2) 1 x y = realize rowTwoOne x y) ∧
      finiteHall rowThree rowTwoOne ≠ 0 := by
  refine ⟨by norm_num, by norm_num, sourceOneRow_half_three,
    sourceOneRow_half_two_one, ?_⟩
  rw [finiteHall_source_pairing]
  norm_num

end ChenKhareSahi.HallConvention
