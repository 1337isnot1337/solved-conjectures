module

public import Conjectures.KVZGammaDensityBasic
public import Conjectures.KVZGammaPowerAlgebra
public import Conjectures.KVZGammaWronskian
public import Mathlib.Analysis.SpecialFunctions.ExpDeriv

/-!
# Strict total positivity of the gamma-density kernel

The exponential Wronskian is a positive product times a Vandermonde
determinant. Positive row and column factors then give every ordered
minor of the literal gamma-density kernel.
-/

@[expose] public section

namespace KVZGamma

open Matrix Set
open scoped BigOperators ContDiff

theorem exponential_wronskian_eq {r : ℕ} (a : Fin r → ℝ) (t : ℝ) :
    wronskian (fun j x => Real.exp (a j * x)) t =
      (∏ j : Fin r, Real.exp (a j * t)) * (Matrix.vandermonde a).det := by
  have hmatrix : jetMatrix (fun j x => Real.exp (a j * x)) t =
      Matrix.of (fun i j : Fin r => Real.exp (a j * t) *
        (Matrix.vandermonde a)ᵀ i j) := by
    ext i j
    change iteratedDeriv i.val (fun x => Real.exp (a j * x)) t =
      Real.exp (a j * t) * (a j) ^ i.val
    rw [iteratedDeriv_exp_const_mul]
    exact mul_comm _ _
  rw [wronskian, hmatrix, Matrix.det_mul_row, Matrix.det_transpose]

theorem exponential_wronskian_pos {r : ℕ} (a : Fin r → ℝ)
    (ha : StrictMono a) (t : ℝ) :
    0 < wronskian (fun j x => Real.exp (a j * x)) t := by
  rw [exponential_wronskian_eq]
  exact mul_pos (Finset.prod_pos fun j _ => Real.exp_pos _) (vandermonde_det_pos ha)

theorem exponential_initialWronskiansNonzero {r : ℕ} (a : Fin r → ℝ)
    (ha : StrictMono a) :
    initialWronskiansNonzero (fun j x => Real.exp (a j * x)) univ := by
  intro k hk t _
  apply (exponential_wronskian_pos (fun j : Fin k => a (j.castLE hk)) _ t).ne'
  intro i j hij
  exact ha hij

/-- The exponential kernel is strictly totally positive on the whole real line. -/
theorem exponential_det_pos {r : ℕ} (a t : Fin r → ℝ)
    (ha : StrictMono a) (ht : StrictMono t) :
    0 < (Matrix.of fun i j : Fin r => Real.exp (a i * t j)).det := by
  have hp := evaluationDet_mul_wronskian_pos isOpen_univ convex_univ
    (fun j x => Real.exp (a j * x))
    (fun j => ((contDiff_const.mul contDiff_id).exp).contDiffOn)
    (exponential_initialWronskiansNonzero a ha) t ht (fun _ => mem_univ _)
    (t := 0) (mem_univ 0)
  have hE := pos_of_mul_pos_left hp (exponential_wronskian_pos a ha 0).le
  rw [← Matrix.det_transpose]
  exact hE

theorem gammaDensity_det_factorization {r : ℕ} (a u : Fin r → ℝ)
    (hupos : ∀ j, 0 < u j) :
    (Matrix.of fun i j : Fin r => gammaDensity (a i) (u j)).det =
      (∏ i : Fin r, (Real.Gamma (a i))⁻¹) *
      ((∏ j : Fin r, Real.exp (-u j) / u j) *
        (Matrix.of fun i j : Fin r => Real.exp (a i * Real.log (u j))).det) := by
  have hmatrix : (Matrix.of fun i j : Fin r => gammaDensity (a i) (u j)) =
      Matrix.of (fun i j : Fin r => (Real.Gamma (a i))⁻¹ *
        ((Real.exp (-u j) / u j) * Real.exp (a i * Real.log (u j)))) := by
    ext i j
    simp only [Matrix.of_apply]
    rw [gammaDensity_eq_exp (a i) (hupos j)]
    ring
  rw [hmatrix]
  calc
    _ = (∏ i : Fin r, (Real.Gamma (a i))⁻¹) *
        (Matrix.of fun i j : Fin r => (Real.exp (-u j) / u j) *
          Real.exp (a i * Real.log (u j))).det :=
      Matrix.det_mul_column (fun i : Fin r => (Real.Gamma (a i))⁻¹)
        (Matrix.of fun i j : Fin r => (Real.exp (-u j) / u j) *
          Real.exp (a i * Real.log (u j)))
    _ = _ := congrArg ((∏ i : Fin r, (Real.Gamma (a i))⁻¹) * ·)
      (Matrix.det_mul_row (fun j : Fin r => Real.exp (-u j) / u j)
        (Matrix.of fun i j : Fin r => Real.exp (a i * Real.log (u j))))

/-- Every minor with strictly increasing positive shape and argument nodes is positive. -/
theorem gammaDensity_det_pos {r : ℕ} (a u : Fin r → ℝ)
    (ha : StrictMono a) (hu : StrictMono u)
    (hapos : ∀ i, 0 < a i) (hupos : ∀ j, 0 < u j) :
    0 < (Matrix.of fun i j : Fin r => gammaDensity (a i) (u j)).det := by
  have hlog : StrictMono (fun j => Real.log (u j)) := by
    intro i j hij
    exact Real.log_lt_log (hupos i) (hu hij)
  rw [gammaDensity_det_factorization a u hupos]
  exact mul_pos
    (Finset.prod_pos fun i _ => inv_pos.mpr (Real.Gamma_pos_of_pos (hapos i)))
    (mul_pos (Finset.prod_pos fun j _ => div_pos (Real.exp_pos _) (hupos j))
      (exponential_det_pos a (fun j => Real.log (u j)) ha hlog))

theorem gammaDensity_transpose_det_pos {r : ℕ} (a u : Fin r → ℝ)
    (ha : StrictMono a) (hu : StrictMono u)
    (hapos : ∀ i, 0 < a i) (hupos : ∀ j, 0 < u j) :
    0 < (Matrix.of fun i j : Fin r => gammaDensity (a j) (u i)).det := by
  rw [← Matrix.det_transpose]
  exact gammaDensity_det_pos a u ha hu hapos hupos

end KVZGamma
