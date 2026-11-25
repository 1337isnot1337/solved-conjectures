import Conjectures.KauersKoutschanSchurMoment
import Mathlib.Algebra.MvPolynomial.Funext
import Mathlib.LinearAlgebra.Finsupp.LSum

/-! Preserve the row-marker polynomials through the two factorial moments. -/

open scoped BigOperators

namespace KauersKoutschan

open Polynomial

variable {R : Type*} [CommRing R]

private def coefficientsLinear : MvPolynomial (Fin 2) R →ₗ[R] ((Fin 2 →₀ ℕ) →₀ R) where
  toFun p := AddMonoidAlgebra.coeff p
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

/-- The two-coordinate factorial functional with arbitrary coefficient ring. -/
noncomputable def factorialMomentPair : MvPolynomial (Fin 2) R →ₗ[R] R :=
  (Finsupp.lsum R fun d : Fin 2 →₀ ℕ =>
    ((d 0).factorial * (d 1).factorial : R) • (LinearMap.id : R →ₗ[R] R)).comp coefficientsLinear

theorem factorialMomentPair_apply (p : MvPolynomial (Fin 2) R) :
    factorialMomentPair p =
      ∑ d ∈ p.support, p.coeff d * ((d 0).factorial : R) * ((d 1).factorial : R) := by
  classical
  simp only [factorialMomentPair, LinearMap.comp_apply, Finsupp.coe_lsum, Finsupp.sum,
    LinearMap.smul_apply, LinearMap.id_coe, id_eq, smul_eq_mul]
  apply Finset.sum_congr rfl
  intro d _
  change ((d 0).factorial : R) * ((d 1).factorial : R) * p.coeff d = _
  ring

theorem factorialMomentPair_monomial (d : Fin 2 →₀ ℕ) (a : R) :
    factorialMomentPair (MvPolynomial.monomial d a) = a * ((d 0).factorial : R) * ((d 1).factorial : R) := by
  classical
  by_cases h : a = 0
  · simp [h]
  · simp [factorialMomentPair_apply, MvPolynomial.support_monomial, h]

theorem map_factorialMomentPair {S : Type*} [CommRing S]
    (f : R →+* S) (p : MvPolynomial (Fin 2) R) :
    f (factorialMomentPair p) = factorialMomentPair (MvPolynomial.map f p) := by
  induction p using MvPolynomial.induction_on' with
  | add p q hp hq => simp only [map_add, hp, hq]
  | monomial d a => simp [factorialMomentPair_monomial]

/-- The character with coefficient-ring values for the two scalings. -/
noncomputable def genericSchurCharacter (a b : R) (j m : ℕ) : MvPolynomial (Fin 2) R :=
  let x := MvPolynomial.X (0 : Fin 2)
  let y := MvPolynomial.X (1 : Fin 2)
  let d := MvPolynomial.C (a * b) * (1 - x - y)
  let t := MvPolynomial.C a * (x - 1) + MvPolynomial.C b * (y - 1)
  d ^ j * (traceComplete d m).eval t

theorem map_genericSchurCharacter {S : Type*} [CommRing S]
    (f : R →+* S) (a b : R) (j m : ℕ) :
    MvPolynomial.map f (genericSchurCharacter a b j m) = genericSchurCharacter (f a) (f b) j m := by
  simp only [genericSchurCharacter, map_mul, map_pow, map_eval_traceComplete,
    MvPolynomial.map_C, MvPolynomial.map_X, map_add, map_sub, map_one]

noncomputable abbrev rowMarker (i : Fin 2) : TwoVariablePolynomial := MvPolynomial.X i

/-- The moment factorization holds as an equality of the literal
row-marker polynomials. -/
theorem polynomial_factorial_schur_moment (j m : ℕ) :
    let u := rowMarker 0
    let v := rowMarker 1
    factorialMomentPair (genericSchurCharacter u v j m) =
      (u * v) ^ j * (traceComplete (u * v) m).eval (u + v) *
        MvPolynomial.C (dividedDifference (j + (m + 1)) j : ℝ) := by
  dsimp only
  apply MvPolynomial.funext
  intro f
  rw [map_factorialMomentPair, map_genericSchurCharacter, map_mul, map_mul, map_pow,
    map_eval_traceComplete, MvPolynomial.eval_C, map_mul, map_add]
  simp only [rowMarker, MvPolynomial.eval_X]
  rw [factorialMomentPair_apply]
  exact independent_factorial_schur_moment (f 0) (f 1) j m

end KauersKoutschan
