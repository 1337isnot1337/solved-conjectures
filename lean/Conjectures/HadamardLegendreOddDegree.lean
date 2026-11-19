import Conjectures.HadamardLegendreArithmetic
import Mathlib.Algebra.QuadraticAlgebra.Basic
import Mathlib.LinearAlgebra.FiniteDimensional.Defs
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.ToLin

/-!
# A two-square obstruction in odd degree

For commuting rational matrices X and Y with X² + Y² = q I, the determinant
of X + iY has rational coordinates whose squares sum to q to the matrix
dimension. Applying this to the multiplication matrices of two elements
shows that a finite commutative rational algebra containing a solution
of x² + y² = 599 has even dimension.
-/

namespace HadamardLegendre

open scoped BigOperators

abbrev GaussianRational := QuadraticAlgebra ℚ (-1) 0

private theorem gaussian_re_sum {ι : Type*} [Fintype ι] (f : ι → GaussianRational) :
    (∑ i, f i).re = ∑ i, (f i).re :=
  map_sum (QuadraticAlgebra.reₗ (-1 : ℚ) 0) f Finset.univ

private theorem gaussian_im_sum {ι : Type*} [Fintype ι] (f : ι → GaussianRational) :
    (∑ i, f i).im = ∑ i, (f i).im :=
  map_sum (QuadraticAlgebra.imₗ (-1 : ℚ) 0) f Finset.univ

def gaussianMatrix {ι : Type*} (X Y : Matrix ι ι ℚ) :
    Matrix ι ι GaussianRational :=
  fun i j => ⟨X i j, Y i j⟩

theorem gaussianMatrix_mul_conj {ι : Type*} [Fintype ι]
    (X Y : Matrix ι ι ℚ) :
    gaussianMatrix X Y * (gaussianMatrix X Y).map star =
      gaussianMatrix (X * X + Y * Y) (Y * X - X * Y) := by
  funext i j
  apply QuadraticAlgebra.ext
  · simp [gaussianMatrix, Matrix.mul_apply, gaussian_re_sum,
      Finset.sum_add_distrib]
  · simp [gaussianMatrix, Matrix.mul_apply, gaussian_im_sum,
      Finset.sum_add_distrib, Finset.sum_neg_distrib, sub_eq_add_neg] <;> ring

theorem rational_matrix_sum_two_squares {ι : Type*} [Fintype ι] [DecidableEq ι]
    (X Y : Matrix ι ι ℚ) (q : ℚ) (hcomm : X * Y = Y * X)
    (hsq : X * X + Y * Y = q • (1 : Matrix ι ι ℚ)) :
    ∃ a b : ℚ, a ^ 2 + b ^ 2 = q ^ Fintype.card ι := by
  let M := gaussianMatrix X Y
  have hprod : M * M.map star =
      algebraMap ℚ GaussianRational q • (1 : Matrix ι ι GaussianRational) := by
    dsimp [M]
    rw [gaussianMatrix_mul_conj, hsq, hcomm, sub_self]
    funext i j
    change (⟨q * (if i = j then 1 else 0), 0⟩ : GaussianRational) =
      algebraMap ℚ GaussianRational q * (if i = j then 1 else 0)
    by_cases hij : i = j
    · simp only [ite_eq_left hij, mul_one]
    · simp only [ite_eq_right hij, mul_zero]
  have hstar : (M.map star).det = star M.det :=
    ((starRingEnd GaussianRational).map_det M).symm
  have hdet := congrArg Matrix.det hprod
  rw [Matrix.det_mul, hstar, Matrix.det_smul, Matrix.det_one, mul_one] at hdet
  have hnorm :
      algebraMap ℚ GaussianRational (QuadraticAlgebra.norm M.det) =
        algebraMap ℚ GaussianRational (q ^ Fintype.card ι) := by
    rw [QuadraticAlgebra.algebraMap_norm_eq_mul_star, map_pow]
    exact hdet
  have hnormQ : QuadraticAlgebra.norm M.det = q ^ Fintype.card ι :=
    QuadraticAlgebra.C_injective hnorm
  refine ⟨M.det.re, M.det.im, ?_⟩
  simpa [QuadraticAlgebra.norm_def, pow_two] using hnormQ

theorem even_finrank_of_sum_two_squares_599 (K : Type*) [CommRing K]
    [Algebra ℚ K] [Module.Finite ℚ K] (x y : K)
    (h : x ^ 2 + y ^ 2 = 599) : Even (Module.finrank ℚ K) := by
  classical
  let b := Module.finBasis ℚ K
  let L := Algebra.leftMulMatrix b
  have hcomm : L x * L y = L y * L x := by
    rw [← map_mul, ← map_mul, mul_comm x y]
  have hsq : L x * L x + L y * L y =
      (599 : ℚ) • (1 : Matrix (Fin (Module.finrank ℚ K)) _ ℚ) := by
    rw [← Algebra.algebraMap_eq_smul_one]
    simpa only [pow_two, map_add, map_mul, map_ofNat] using congrArg L h
  obtain ⟨a, c, hac⟩ := rational_matrix_sum_two_squares (L x) (L y) 599 hcomm hsq
  have he := rational_sum_two_squares_pow_599_even a c
    (Fintype.card (Fin (Module.finrank ℚ K))) hac
  simpa only [Fintype.card_fin] using he

theorem not_sum_two_squares_599_of_odd_finrank (K : Type*) [CommRing K]
    [Algebra ℚ K] [Module.Finite ℚ K] (hodd : Odd (Module.finrank ℚ K))
    (x y : K) : x ^ 2 + y ^ 2 ≠ 599 := by
  intro h
  obtain ⟨m, hm⟩ := even_finrank_of_sum_two_squares_599 K x y h
  obtain ⟨n, hn⟩ := hodd
  omega

end HadamardLegendre
