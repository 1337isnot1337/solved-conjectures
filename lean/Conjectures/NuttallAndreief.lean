module

public import Conjectures.NuttallDifferentiatedMoment
import all Conjectures.NuttallDifferentiatedMoment
public import Mathlib.MeasureTheory.Integral.Pi
public import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
public import Mathlib.Tactic

public section
namespace NuttallCumulants

open MeasureTheory Finset
open Equiv

variable {ι Ω : Type*} [Fintype ι] [DecidableEq ι] [MeasurableSpace Ω]

private def signR (σ : Perm ι) : ℝ := ((Perm.sign σ : ℤ) : ℝ)

private theorem signR_mul_self (σ : Perm ι) : signR σ * signR σ = 1 := by
  rcases Int.units_eq_one_or (Perm.sign σ) with h | h <;> norm_num [signR,h]

private theorem det_weighted_double_sum (A : Matrix ι ι ℝ) :
    (∑ σ : Perm ι, ∑ τ : Perm ι, (signR σ * signR τ) * ∏ j, A (σ j) (τ j)) =
      (Fintype.card (Perm ι) : ℝ) * A.det := by
  have h (σ : Perm ι) :
      (∑ τ : Perm ι, (signR σ * signR τ) * ∏ j, A (σ j) (τ j)) = A.det := by
    calc
      _ = signR σ * (A.transpose.submatrix id σ).det := by
        rw [Matrix.det_apply', mul_sum]
        apply sum_congr rfl
        intro τ _
        simp only [signR, Matrix.submatrix_apply, Matrix.transpose_apply, id_eq, mul_assoc]
      _ = A.det := by
        rw [Matrix.det_permute', Matrix.det_transpose, ← mul_assoc]
        change (signR σ * signR σ) * A.det = A.det
        rw [signR_mul_self, one_mul]
  simp only [h, sum_const, card_univ, nsmul_eq_mul]

/-- Andréief's identity for a finite family over a common sigma-finite
measure, in the product-measure normalization. -/
theorem andreief_integral_det_mul (μ : Measure Ω) [SigmaFinite μ]
    (f g : ι → Ω → ℝ)
    (hfg : ∀ i j, Integrable (fun x => f i x * g j x) μ) :
    (∫ x : ι → Ω,
      (Matrix.of (fun i j => f i (x j)) : Matrix ι ι ℝ).det *
      (Matrix.of (fun i j => g i (x j)) : Matrix ι ι ℝ).det
      ∂(Measure.pi fun _ => μ)) =
    (Fintype.card (Perm ι) : ℝ) *
      (Matrix.of (fun i j => ∫ y, f i y * g j y ∂μ) : Matrix ι ι ℝ).det := by
  classical
  let ν : Measure (ι → Ω) := Measure.pi fun _ => μ
  let A : Matrix ι ι ℝ := Matrix.of (fun i j => ∫ y, f i y * g j y ∂μ)
  let F (σ τ : Perm ι) (x : ι → Ω) := (signR σ * signR τ) *
    ∏ j, f (σ j) (x j) * g (τ j) (x j)
  have hf (σ τ : Perm ι) : Integrable (F σ τ) ν :=
    (Integrable.fintype_prod (fun j => hfg (σ j) (τ j))).const_mul _
  have hS (σ : Perm ι) : Integrable (fun x => ∑ τ : Perm ι, F σ τ x) ν :=
    integrable_finsetSum Finset.univ (fun τ _ => hf σ τ)
  have he (x : ι → Ω) :
      (Matrix.of (fun i j => f i (x j)) : Matrix ι ι ℝ).det *
      (Matrix.of (fun i j => g i (x j)) : Matrix ι ι ℝ).det =
        ∑ σ : Perm ι, ∑ τ : Perm ι, F σ τ x := by
    rw [Matrix.det_apply', Matrix.det_apply', sum_mul]
    apply sum_congr rfl
    intro σ _
    rw [mul_sum]
    apply sum_congr rfl
    intro τ _
    simp only [F, signR, Matrix.of_apply, Finset.prod_mul_distrib]
    ring
  change (∫ x, _ ∂ν) = (Fintype.card (Perm ι):ℝ) * A.det
  simp_rw [he]
  rw [integral_finsetSum _ (fun σ _ => hS σ)]
  simp_rw [integral_finsetSum _ (fun τ _ => hf _ τ)]
  have hi (σ τ : Perm ι) : (∫ x, F σ τ x ∂ν) =
      (signR σ * signR τ) * ∏ j, A (σ j) (τ j) := by
    unfold F ν A
    rw [integral_const_mul,
      integral_fintype_prod_eq_prod (fun j z => f (σ j) z * g (τ j) z)]
    rfl
  simp_rw [hi]
  exact det_weighted_double_sum A

def rowMomentPower (m : ℕ) {s : ℕ} (i : Fin s) : ℕ := m - i.val - 1

noncomputable def cumulantHankel (m s : ℕ) (u : ℝ) : Matrix (Fin s) (Fin s) ℝ :=
  Matrix.of fun i j => iteratedDeriv (i.val+j.val) (repeatedTail m) u

noncomputable def cumulantPowerMatrix (m s : ℕ) (x : Fin s → ℝ) :
    Matrix (Fin s) (Fin s) ℝ := Matrix.of fun i j => (x j)^(rowMomentPower m i)

noncomputable def thetaDerivativeMatrix (s : ℕ) (u : ℝ) (x : Fin s → ℝ) :
    Matrix (Fin s) (Fin s) ℝ := Matrix.of fun i j => iteratedDeriv i.val thetaKernel (u+x j)

noncomputable def cumulantRowFactor (m : ℕ) {s : ℕ} (i : Fin s) : ℝ :=
  (-1:ℝ)^i.val / ((rowMomentPower m i).factorial : ℝ)

/-- Determinant-level integral formula for the literal cumulants in §4,
before simplifying the determinant of the powers to a Vandermonde. -/
theorem cumulantHankel_det_integral (m s : ℕ) (hs : s ≤ m) {u : ℝ} (hu : 0 ≤ u) :
    (s.factorial : ℝ) * (cumulantHankel m s u).det =
      (∏ i : Fin s, cumulantRowFactor m i) *
        ∫ x : Fin s → ℝ, (cumulantPowerMatrix m s x).det *
          (thetaDerivativeMatrix s u x).det
          ∂(Measure.pi fun _ => volume.restrict (Set.Ioi (0:ℝ))) := by
  let μ := volume.restrict (Set.Ioi (0:ℝ))
  let f (i : Fin s) (v : ℝ) := v^(rowMomentPower m i)
  let g (j : Fin s) (v : ℝ) := iteratedDeriv j.val thetaKernel (u+v)
  let A : Matrix (Fin s) (Fin s) ℝ := Matrix.of (fun i j => ∫ v, f i v * g j v ∂μ)
  have hin (i j : Fin s) : Integrable (fun v => f i v * g j v) μ :=
    differentiatedMoment_integrable (rowMomentPower m i) j.val hu
  have hA := andreief_integral_det_mul μ f g hin
  change (∫ x : Fin s → ℝ, (cumulantPowerMatrix m s x).det *
    (thetaDerivativeMatrix s u x).det ∂(Measure.pi fun _ => μ)) =
      (Fintype.card (Perm (Fin s)) : ℝ) * A.det at hA
  rw [Fintype.card_perm, Fintype.card_fin] at hA
  have hmat : cumulantHankel m s u = Matrix.diagonal (cumulantRowFactor m) * A := by
    ext i j
    have hik : rowMomentPower m i+1+i.val=m := by
      have hi := i.isLt
      unfold rowMomentPower
      omega
    change iteratedDeriv (i.val+j.val) (repeatedTail m) u = _
    rw [Matrix.diagonal_mul]
    change _ = cumulantRowFactor m i * differentiatedMoment (rowMomentPower m i) j.val u
    simpa only [hik, cumulantRowFactor] using
      repeatedTail_hankel_entry_integral (rowMomentPower m i) i.val j.val hu
  rw [hA, hmat, Matrix.det_mul, Matrix.det_diagonal]
  ring

end NuttallCumulants
