import Conjectures.TomVailayaPathSeries
import Conjectures.TomVailayaPathRows
import Mathlib.FieldTheory.RatFunc.AsPolynomial
import Mathlib.LinearAlgebra.LinearIndependent.Basic
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse

/-! The finite color-basis columns at the unweighted specialization. -/

open scoped BigOperators Polynomial
open Polynomial Matrix

namespace TomVailaya

noncomputable section

variable {K : Type*} [Field K] {N : ℕ}

/-- The paper's color-basis matrix, with zero-based column indices. -/
def colorBasis {R : Type*} [CommRing R] (x : Fin N → R) (q : R) : Matrix (Fin N) (Fin N) R :=
  fun b j => basisColumn x q j.val b

private def complementaryProduct (x : Fin N → K) (b : Fin N) : K[X] :=
  ∏ c ∈ Finset.univ.erase b, (1 + X * C (x c))

private theorem complementary_coeff_succ (x : Fin N → K) (b : Fin N) (k : ℕ) :
    (complementaryProduct x b).coeff (k + 1) =
      elementaryValue x (k + 1) - x b * (complementaryProduct x b).coeff k := by
  have hp : complementaryProduct x b * (1 + X * C (x b)) =
      ∏ c : Fin N, (1 + X * C (x c)) :=
    Finset.prod_erase_mul _ _ (Finset.mem_univ b)
  rw [mul_add, mul_one, show complementaryProduct x b * (X * C (x b)) =
    X * (C (x b) * complementaryProduct x b) by ring] at hp
  have h := congrArg (fun p : K[X] => p.coeff (k + 1)) hp
  simp only [Polynomial.coeff_add, Polynomial.coeff_X_mul, Polynomial.coeff_C_mul] at h
  exact eq_sub_of_add_eq h

private def columnEvalPolynomial (x : Fin N → K) : ℕ → K[X]
  | 0 => 1
  | k + 1 => C (elementaryValue x (k + 1)) - X * columnEvalPolynomial x k

private theorem columnEvalPolynomial_eval (x : Fin N → K) (b : Fin N) (k : ℕ) :
    (columnEvalPolynomial x k).eval (x b) = (complementaryProduct x b).coeff k := by
  induction k with
  | zero =>
    simp [columnEvalPolynomial, complementaryProduct, Polynomial.coeff_zero_eq_eval_zero,
      Polynomial.eval_prod]
  | succ k ih =>
    rw [columnEvalPolynomial, Polynomial.eval_sub, Polynomial.eval_C, Polynomial.eval_mul,
      Polynomial.eval_X, ih, complementary_coeff_succ]

private theorem columnEvalPolynomial_natDegree (x : Fin N → K) (k : ℕ) :
    (columnEvalPolynomial x k).natDegree ≤ k := by
  induction k with
  | zero => simp [columnEvalPolynomial]
  | succ k ih =>
    rw [columnEvalPolynomial]
    refine (Polynomial.natDegree_sub_le _ _).trans (max_le (by simp) ?_)
    exact (Polynomial.natDegree_mul_le_of_le Polynomial.natDegree_X_le ih).trans (by omega)

private theorem columnEvalPolynomial_coeff (x : Fin N → K) (k : ℕ) :
    (columnEvalPolynomial x k).coeff k = (-1 : K) ^ k := by
  induction k with
  | zero => simp [columnEvalPolynomial]
  | succ k ih =>
    rw [columnEvalPolynomial, Polynomial.coeff_sub, Polynomial.coeff_C_succ,
      Polynomial.coeff_X_mul, ih, zero_sub, pow_succ, mul_neg_one]

/-- The (k+1)-st unweighted color column is obtained by a common polynomial
evaluation followed by multiplication by the distinguished color variable. -/
theorem basisColumn_one_eval (x : Fin N → K) (k : ℕ) (b : Fin N) :
    basisColumn x 1 k b = x b * (columnEvalPolynomial x k).eval (x b) := by
  rw [basisColumn, colorSeries_one, Polynomial.coeff_C_mul, columnEvalPolynomial_eval]
  rfl

theorem colorBasis_one_columns_linearIndependent (x : Fin N → K)
    (hx : Function.Injective x) (hn : ∀ b, x b ≠ 0) :
    LinearIndependent K (colorBasis x 1).col := by
  have hEval := polynomialEvaluations_linearIndependent x hx
    (fun i => columnEvalPolynomial x i)
    (fun i => columnEvalPolynomial_natDegree x i) (fun i => by
      simp [columnEvalPolynomial_coeff])
  let D : (Fin N → K) →ₗ[K] (Fin N → K) :=
    { toFun := fun f b => x b * f b
      map_add' := by intro f g; funext b; exact mul_add _ _ _
      map_smul' := by intro c f; funext b; exact mul_left_comm _ _ _ }
  have hD : Function.Injective D := by
    intro f g h
    funext b
    exact mul_left_cancel₀ (hn b) (congrFun h b)
  have h := hEval.map' D (LinearMap.ker_eq_bot.mpr hD)
  convert h using 1
  funext k b
  exact basisColumn_one_eval x k b


theorem map_colorBasis {R S : Type*} [CommRing R] [CommRing S] (f : R →+* S)
    (x : Fin N → R) (q : R) :
    (colorBasis x q).map f = colorBasis (f ∘ x) (f q) := by
  ext b k
  exact map_basisColumn f x q k b

/-- The symbolic color-basis matrix is invertible over the rational
function field in the ascent parameter. -/
theorem weightedColorBasis_isUnit (x : Fin N → K) (hx : Function.Injective x)
    (hn : ∀ b, x b ≠ 0) :
    IsUnit (colorBasis (RatFunc.C ∘ x) (RatFunc.X : RatFunc K)) := by
  let A := colorBasis (Polynomial.C ∘ x) (Polynomial.X : K[X])
  let φ := Polynomial.evalRingHom (1 : K)
  have hspecialization : A.map φ = colorBasis x 1 := by
    dsimp only [A]
    rw [map_colorBasis]
    have hvariables : φ ∘ (Polynomial.C ∘ x) = x := by
      funext b
      simp [φ]
    rw [hvariables]
    simp [φ]
  have hunit : IsUnit (colorBasis x 1) :=
    Matrix.linearIndependent_col_iff_isUnit.mp (colorBasis_one_columns_linearIndependent x hx hn)
  have hne : (colorBasis x 1).det ≠ 0 :=
    isUnit_iff_ne_zero.mp ((Matrix.isUnit_iff_isUnit_det _).mp hunit)
  have hdet : A.det ≠ 0 := by
    intro h
    apply hne
    have hφ := congrArg φ h
    rw [RingHom.map_det, map_zero] at hφ
    change (A.map φ).det = 0 at hφ
    rwa [hspecialization] at hφ
  let f := algebraMap (K[X]) (RatFunc K)
  have hmap : A.map f = colorBasis (RatFunc.C ∘ x) (RatFunc.X : RatFunc K) := by
    dsimp only [A]
    rw [map_colorBasis]
    simp [f, Function.comp_def]
  rw [← hmap, Matrix.isUnit_iff_isUnit_det]
  apply isUnit_iff_ne_zero.mpr
  intro h
  have hzero : f A.det = f 0 := by
    rw [RingHom.map_det, map_zero]
    exact h
  exact hdet (IsFractionRing.injective (K[X]) (RatFunc K) hzero)

end

end TomVailaya
