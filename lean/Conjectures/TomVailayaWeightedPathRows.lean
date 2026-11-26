import Conjectures.TomVailayaPathRows
import Mathlib.FieldTheory.RatFunc.AsPolynomial
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse

/-! The path test rows over the rational function field in the ascent parameter. -/

open scoped Polynomial
open Polynomial Matrix

namespace TomVailaya

noncomputable section

/-- The rows used to distinguish transfer operators by their path tests. -/
def pathTestRows {R : Type*} [CommSemiring R] {N : ℕ}
    (x : Fin N → R) (q : R) : Matrix (Fin N) (Fin N) R :=
  fun k => (1 : Fin N → R) ᵥ* (colorMatrix x q pathEdge) ^ k.val

private theorem map_pathEdge {R S : Type*} [CommSemiring R] [CommSemiring S]
    (f : R →+* S) {N : ℕ} (x : Fin N → R) (q : R) :
    (colorMatrix x q pathEdge).map f = colorMatrix (f ∘ x) (f q) pathEdge := by
  ext b a
  simp only [Matrix.map_apply, colorMatrix_pathEdge, Function.comp_apply, map_mul, arcFactor]
  split <;> simp_all
  split <;> simp_all

theorem map_pathTestRows {R S : Type*} [CommSemiring R] [CommSemiring S]
    (f : R →+* S) {N : ℕ} (x : Fin N → R) (q : R) :
    (pathTestRows x q).map f = pathTestRows (f ∘ x) (f q) := by
  have hone : f ∘ (1 : Fin N → R) = 1 := by
    funext i
    simp
  ext k b
  simp only [Matrix.map_apply, pathTestRows, RingHom.map_vecMul, Matrix.map_pow,
    map_pathEdge, hone]

variable {K : Type*} [Field K]

/-- Specializing the path test matrix at (q=1) produces a nonzero
determinant. The symbolic determinant is therefore nonzero as a polynomial. -/
theorem polynomial_pathTestRows_det_ne_zero {N : ℕ} (x : Fin N → K)
    (hx : Function.Injective x) :
    (pathTestRows (Polynomial.C ∘ x) (Polynomial.X : K[X])).det ≠ 0 := by
  have hunit : IsUnit (pathTestRows x 1) :=
    Matrix.linearIndependent_row_iff_isUnit.mp (pathRows_linearIndependent x hx)
  have hnonzero : (pathTestRows x 1).det ≠ 0 :=
    isUnit_iff_ne_zero.mp ((Matrix.isUnit_iff_isUnit_det _).mp hunit)
  intro hz
  apply hnonzero
  let f := Polynomial.evalRingHom (1 : K)
  have h := congrArg f hz
  rw [RingHom.map_det, map_zero] at h
  change ((pathTestRows (Polynomial.C ∘ x) (Polynomial.X : K[X])).map f).det = 0 at h
  have hmap : (pathTestRows (Polynomial.C ∘ x) (Polynomial.X : K[X])).map f =
      pathTestRows x 1 := by
    rw [map_pathTestRows]
    have hx' : f ∘ (Polynomial.C ∘ x) = x := by
      funext i
      simp [f]
    rw [hx']
    simp [f]
  exact hmap ▸ h

/-- The first (N) weighted path test rows are independent over (K(q))
for distinct color variables in (K). -/
theorem weightedPathRows_linearIndependent {N : ℕ} (x : Fin N → K) (hx : Function.Injective x) :
    LinearIndependent (RatFunc K) (pathTestRows (RatFunc.C ∘ x) (RatFunc.X : RatFunc K)).row := by
  let f := algebraMap (K[X]) (RatFunc K)
  let A := pathTestRows (Polynomial.C ∘ x) (Polynomial.X : K[X])
  have hmap : A.map f = pathTestRows (RatFunc.C ∘ x) (RatFunc.X : RatFunc K) := by
    dsimp only [A]
    rw [map_pathTestRows]
    simp [f, Function.comp_def]
  rw [← hmap]
  apply Matrix.linearIndependent_rows_of_det_ne_zero (A := A.map f)
  intro h
  have hzero : f A.det = f 0 := by
    rw [RingHom.map_det, map_zero]
    exact h
  exact polynomial_pathTestRows_det_ne_zero x hx
    (IsFractionRing.injective (K[X]) (RatFunc K) hzero)

end

end TomVailaya
