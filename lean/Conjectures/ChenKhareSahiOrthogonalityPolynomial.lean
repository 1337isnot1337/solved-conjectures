module

public import Conjectures.ChenKhareSahiOrthogonalityCore
public import Conjectures.ChenKhareSahiOrthogonalityPower
public import Conjectures.ChenKhareSahiOrthogonalityEvaluation

/-! Faithful literal polynomial coordinates for the degree-six stable Hall
calculation. The checked power identities and evaluation matrix connect both
basis directions and the Hall form to actual six-variable polynomial functions. -/

@[expose] public section

namespace ChenKhareSahi.Orthogonality

set_option maxRecDepth 32768
set_option maxHeartbeats 12000000
set_option linter.unusedSimpArgs false

/-- The coordinates used in the Hall pairing are the literal power-sum
coefficients of the same symmetric polynomial. -/
theorem power_coordinates_polynomial (v : RealVector) (x : Fin 6 → ℝ) :
    (∑ i : Index, v i * monomialSix i x) =
      ∑ i : Index, powerCoordinates v i * powerSix i x := by
  have hp : (fun i => powerSix i x) =
      (realMatrix powerTransition).mulVec (fun i => monomialSix i x) := by
    funext i
    exact power_expansion i x
  change dotProduct v (fun i => monomialSix i x) =
    dotProduct (powerCoordinates v) (fun i => powerSix i x)
  rw [hp, Matrix.dotProduct_mulVec]
  unfold powerCoordinates
  rw [Matrix.vecMul_vecMul, real_inverse_transition, Matrix.vecMul_one]

/-- The coordinate model faithfully represents the actual symmetric polynomial
functions. Equality at the eleven certified inputs already determines all
monomial coefficients. -/
theorem literal_polynomial_injective :
    Function.Injective (fun v : RealVector => fun x : Fin 6 → ℝ =>
      ∑ i : Index, v i * monomialSix i x) := by
  intro v w h
  have he : (realMatrix evaluationMatrix).mulVec v =
      (realMatrix evaluationMatrix).mulVec w := by
    funext i
    have hi := congrFun h (evaluationPoint i)
    change (∑ j : Index, (evaluationMatrix i j : ℝ) * v j) =
      ∑ j : Index, (evaluationMatrix i j : ℝ) * w j
    simpa only [evaluation_matrix_exact, mul_comm] using hi
  have hc := congrArg (fun y => (realMatrix evaluationInverse).mulVec y) he
  simpa only [Matrix.mulVec_mulVec, real_evaluation_inverse, Matrix.one_mulVec] using hc

/-- The source Hall form does not depend on a choice of representation of an
actual six-variable polynomial. -/
theorem hall_polynomial_well_defined (v v' w w' : RealVector)
    (hv : (fun x : Fin 6 → ℝ => ∑ i : Index, v i * monomialSix i x) =
      (fun x : Fin 6 → ℝ => ∑ i : Index, v' i * monomialSix i x))
    (hw : (fun x : Fin 6 → ℝ => ∑ i : Index, w i * monomialSix i x) =
      (fun x : Fin 6 → ℝ => ∑ i : Index, w' i * monomialSix i x)) :
    hall v w = hall v' w' := by
  rw [literal_polynomial_injective hv, literal_polynomial_injective hw]

end ChenKhareSahi.Orthogonality
