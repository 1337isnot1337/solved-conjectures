import Conjectures.LiFullCoeffTrunc
import Conjectures.LiEvaluationData
import Conjectures.LiCoefficientInterpolation

/-!
# The negative elementary coefficient of Li's tree

This file certifies the supplementary coefficient `-6304` in the research
note. The five proper-colouring evaluations use the leaf-elimination
machinery contributed by aadrianvv in PR #35. The evaluation and interpolation
modules supplied by the team coordinating in issue #40 provide the exact
five equations; the full-colour transfer also uses aadrianvv's development.

No numerical coefficient is assumed: the five elementary coefficients follow
from the checked evaluations and the proved inverse matrix. All five full
elementary coefficient identities hold for every finite colour type of
cardinality at least 31.

The formal ambient objects are finite polynomials: the proper-colouring
polynomial is expressed in elementary coordinates by the inverse of
`MvPolynomial.esymmAlgEquiv`. Stability under every finite colour set with
at least 31 elements identifies the coefficient of the stable chromatic
symmetric function. In particular, `Li.not_elementary_positive` is literally
failure of coefficientwise nonnegativity of `LiFull.fullECoords`, the full
31-colour elementary coordinates. The development does not construct a
separate infinite-variable symmetric-function ring.
-/

open MvPolynomial
open scoped BigOperators

namespace LiNegativeCoefficient

/-- The five values to be proved, in increasing order of the exponent of `e₃`. -/
def values : Fin 5 → ℚ := ![29, 83, -6304, -6800, -8384]

/-- These are genuine coefficients in the elementary-symmetric basis. -/
noncomputable def coefficient (i : Fin 5) : ℚ :=
  LiFull.chromECoords.coeff (LiInterpolation.exponents i)

/-- Every one of the five `e₂,e₃` coefficients follows from the exact evaluations. -/
theorem coefficient_eq (i : Fin 5) : coefficient i = values i := by
  have h := LiInterpolation.scaled_chromatic_coefficient
    (Li.chromPoly Li.T) (Li.chromPoly_isSymmetric Li.T)
    (Li.chromPoly_isHomogeneous Li.T) i
  change LiInterpolation.denominators i * coefficient i =
    ∑ j : Fin 5, LiInterpolation.numerators i j *
      MvPolynomial.aeval (LiEvaluation.colorWeights j) (Li.chromPoly Li.T) at h
  simp_rw [LiEvaluation.eval_chromPoly] at h
  apply mul_left_cancel₀ (ne_of_gt (LiInterpolation.denominators_pos i))
  rw [h]
  fin_cases i <;>
    norm_num [values, LiInterpolation.denominators, LiInterpolation.numerators,
      LiEvaluation.values, Fin.sum_univ_succ]

/-- All five elementary coefficients using only the generators `e₂,e₃`. -/
theorem five_coefficients :
    coefficient 0 = 29 ∧ coefficient 1 = 83 ∧ coefficient 2 = -6304 ∧
      coefficient 3 = -6800 ∧ coefficient 4 = -8384 := by
  exact ⟨coefficient_eq 0, coefficient_eq 1, coefficient_eq 2,
    coefficient_eq 3, coefficient_eq 4⟩

theorem three_variable_negative_coefficient :
    LiFull.chromECoords.coeff
      (Finsupp.single (1 : Fin 3) 8 + Finsupp.single (2 : Fin 3) 5) = -6304 := by
  exact coefficient_eq 2

theorem embDomain_negative_index :
    Finsupp.embDomain LiFull.iota
      (Finsupp.single (1 : Fin 3) 8 + Finsupp.single (2 : Fin 3) 5) =
      Finsupp.single (1 : Fin 31) 8 + Finsupp.single (2 : Fin 31) 5 := by
  rw [Finsupp.embDomain_add, Finsupp.embDomain_single, Finsupp.embDomain_single]
  rfl

end LiNegativeCoefficient

namespace Li

/-- All five `e₂,e₃` coefficients in the full 31-colour elementary basis. -/
theorem full_e2e3_coefficients (i : Fin 5) :
    ((MvPolynomial.esymmAlgEquiv (Fin 31) ℚ (n := 31) (by decide)).symm
      ⟨LiFull.fullChromPoly T, LiFull.fullChromPoly_isSymmetric T⟩).coeff
      (Finsupp.embDomain LiFull.iota (LiInterpolation.exponents i)) =
        LiNegativeCoefficient.values i := by
  change LiFull.fullECoords.coeff
    (Finsupp.embDomain LiFull.iota (LiInterpolation.exponents i)) = _
  rw [← LiFull.kill31_coeff LiFull.fullECoords (LiInterpolation.exponents i),
    LiFull.kill31_fullECoords]
  exact LiNegativeCoefficient.coefficient_eq i

/-- All five full coefficients are unchanged by adding more colours. -/
theorem full_e2e3_coefficients_fin (N : ℕ) (hN : 31 ≤ N) (i : Fin 5) :
    ((MvPolynomial.esymmAlgEquiv (Fin N) ℚ (n := N) (Fintype.card_fin N)).symm
      ⟨LiFull.fullChromPolyOn (σ := Fin N) T,
        LiFull.fullChromPolyOn_isSymmetric T⟩).coeff
      (Finsupp.embDomain (LiFull.iotaMN hN)
        (Finsupp.embDomain LiFull.iota (LiInterpolation.exponents i))) =
          LiNegativeCoefficient.values i := by
  change (LiFull.fullECoordsFin hN).coeff
    (Finsupp.embDomain (LiFull.iotaMN hN)
      (Finsupp.embDomain LiFull.iota (LiInterpolation.exponents i))) = _
  rw [← LiFull.killMN_coeff hN (LiFull.fullECoordsFin hN)
    (Finsupp.embDomain LiFull.iota (LiInterpolation.exponents i)),
    LiFull.killMN_fullECoords hN]
  exact full_e2e3_coefficients i

/-- The five full elementary coefficients for every sufficient finite colour set. -/
theorem full_e2e3_coefficients_of_card {σ : Type*} [Fintype σ] [DecidableEq σ]
    (hσ : 31 ≤ Fintype.card σ) (i : Fin 5) :
    ((MvPolynomial.esymmAlgEquiv σ ℚ (n := Fintype.card σ) rfl).symm
      ⟨LiFull.fullChromPolyOn (σ := σ) T,
        LiFull.fullChromPolyOn_isSymmetric T⟩).coeff
      (Finsupp.embDomain (LiFull.iotaMN hσ)
        (Finsupp.embDomain LiFull.iota (LiInterpolation.exponents i))) =
          LiNegativeCoefficient.values i := by
  rw [LiFull.eCoords_eq_of_equiv hσ]
  exact full_e2e3_coefficients_fin (Fintype.card σ) hσ i

/-- The negative coefficient stated in the note: `[e₂⁸ e₃⁵] X_T = -6304`.
The coefficient is taken in the full elementary-symmetric basis. -/
theorem full_negative_coefficient :
    ((MvPolynomial.esymmAlgEquiv (Fin 31) ℚ (n := 31) (by decide)).symm
      ⟨LiFull.fullChromPoly T, LiFull.fullChromPoly_isSymmetric T⟩).coeff
      (Finsupp.single (1 : Fin 31) 8 + Finsupp.single (2 : Fin 31) 5) = -6304 := by
  rw [← LiNegativeCoefficient.embDomain_negative_index]
  exact full_e2e3_coefficients 2

/-- The same negative coefficient for every finite number of colours at least 31. -/
theorem full_negative_coefficient_fin (N : ℕ) (hN : 31 ≤ N) :
    ((MvPolynomial.esymmAlgEquiv (Fin N) ℚ (n := N) (Fintype.card_fin N)).symm
      ⟨LiFull.fullChromPolyOn (σ := Fin N) T,
        LiFull.fullChromPolyOn_isSymmetric T⟩).coeff
      (Finsupp.single (⟨1, by omega⟩ : Fin N) 8 +
        Finsupp.single (⟨2, by omega⟩ : Fin N) 5) = -6304 := by
  change (LiFull.fullECoordsFin hN).coeff
    (Finsupp.single (⟨1, by omega⟩ : Fin N) 8 +
      Finsupp.single (⟨2, by omega⟩ : Fin N) 5) = -6304
  have hemb : Finsupp.embDomain (LiFull.iotaMN hN)
      (Finsupp.single (1 : Fin 31) 8 + Finsupp.single (2 : Fin 31) 5) =
      Finsupp.single (⟨1, by omega⟩ : Fin N) 8 +
        Finsupp.single (⟨2, by omega⟩ : Fin N) 5 := by
    rw [Finsupp.embDomain_add, Finsupp.embDomain_single, Finsupp.embDomain_single]
    rfl
  rw [← hemb, ← LiFull.killMN_coeff hN (LiFull.fullECoordsFin hN)
    (Finsupp.single (1 : Fin 31) 8 + Finsupp.single (2 : Fin 31) 5),
    LiFull.killMN_fullECoords hN]
  exact full_negative_coefficient

/-- Colour labels do not affect the negative full elementary coefficient. -/
theorem full_negative_coefficient_of_card {σ : Type*} [Fintype σ] [DecidableEq σ]
    (hσ : 31 ≤ Fintype.card σ) :
    ((MvPolynomial.esymmAlgEquiv σ ℚ (n := Fintype.card σ) rfl).symm
      ⟨LiFull.fullChromPolyOn (σ := σ) T,
        LiFull.fullChromPolyOn_isSymmetric T⟩).coeff
      (Finsupp.single (⟨1, by omega⟩ : Fin (Fintype.card σ)) 8 +
        Finsupp.single (⟨2, by omega⟩ : Fin (Fintype.card σ)) 5) = -6304 := by
  rw [LiFull.eCoords_eq_of_equiv hσ]
  exact full_negative_coefficient_fin (Fintype.card σ) hσ

/-- The counterexample is not elementary-positive. -/
theorem not_elementary_positive :
    ¬ (∀ d : Fin 31 →₀ ℕ, 0 ≤ LiFull.fullECoords.coeff d) := by
  intro h
  have hneg := h (Finsupp.single (1 : Fin 31) 8 + Finsupp.single (2 : Fin 31) 5)
  rw [show LiFull.fullECoords.coeff
    (Finsupp.single (1 : Fin 31) 8 + Finsupp.single (2 : Fin 31) 5) = -6304 from
    full_negative_coefficient] at hneg
  norm_num at hneg

/-- Every sufficiently large finite colour specialization has a negative
coefficient in its full elementary coordinates. -/
theorem not_elementary_positive_of_card {σ : Type*} [Fintype σ] [DecidableEq σ]
    (hσ : 31 ≤ Fintype.card σ) :
    ¬ (∀ d : Fin (Fintype.card σ) →₀ ℕ,
      0 ≤ ((MvPolynomial.esymmAlgEquiv σ ℚ (n := Fintype.card σ) rfl).symm
        ⟨LiFull.fullChromPolyOn (σ := σ) T,
          LiFull.fullChromPolyOn_isSymmetric T⟩).coeff d) := by
  intro h
  have hneg := h (Finsupp.single (⟨1, by omega⟩ : Fin (Fintype.card σ)) 8 +
    Finsupp.single (⟨2, by omega⟩ : Fin (Fintype.card σ)) 5)
  rw [full_negative_coefficient_of_card hσ] at hneg
  norm_num at hneg

end Li
