import Mathlib.Analysis.Calculus.ContDiff.Operations
import Mathlib.Analysis.Calculus.FDeriv.Pow
import Mathlib.LinearAlgebra.Eigenspace.Matrix
import Mathlib.Analysis.Complex.Basic
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring
import Mathlib.Tactic.FunProp
import Mathlib.Tactic.Convert

/-! Exact derivative algebra for the Cima--van den Essen--Gasull--Hubbers--Mañosas
counterexamples (Advances in Mathematics 131 (1997), Theorems 1.1 and 1.2).
The Jacobian is defined from Mathlib's actual Fréchet derivative.
This checkpoint is incomplete until hosted strict compilation and audit pass. -/

noncomputable section
namespace Published.MarkusYamabe

abbrev Space (n : ℕ) := Fin n → ℝ

def jacobian {n : ℕ} (F : Space n → Space n) (x : Space n) : Matrix (Fin n) (Fin n) ℝ :=
  fun i j => fderiv ℝ F x (Pi.single j 1) i

def complexJacobian {n : ℕ} (F : Space n → Space n) (x : Space n) :
    Matrix (Fin n) (Fin n) ℂ := (jacobian F x).map Complex.ofReal

def HasPolynomialCoordinates {n : ℕ} (F : Space n → Space n) : Prop :=
  ∀ i, ∃ p : MvPolynomial (Fin n) ℝ, ∀ x, MvPolynomial.eval x p = F x i

def d (x : Space 3) : ℝ := x 0 + x 2 * x 1

def field (a : ℝ) (x : Space 3) : Space 3 :=
  ![a * x 0 + x 2 * d x ^ 2, a * x 1 - d x ^ 2, a * x 2]

def proj (i : Fin 3) : Space 3 →L[ℝ] ℝ := ContinuousLinearMap.proj i

def dDeriv (x : Space 3) : Space 3 →L[ℝ] ℝ :=
  proj 0 + x 2 • proj 1 + x 1 • proj 2

def fieldDeriv (a : ℝ) (x : Space 3) : Space 3 →L[ℝ] Space 3 :=
  ContinuousLinearMap.pi ![
    a • proj 0 + (x 2 • ((2 * d x) • dDeriv x) + d x ^ 2 • proj 2),
    a • proj 1 - (2 * d x) • dDeriv x,
    a • proj 2]

theorem hasFDerivAt_d (x : Space 3) : HasFDerivAt d (dDeriv x) x := by
  convert (hasFDerivAt_apply (𝕜 := ℝ) 0 x).add
    ((hasFDerivAt_apply (𝕜 := ℝ) 2 x).mul (hasFDerivAt_apply (𝕜 := ℝ) 1 x)) using 1
  ext v
  simp [dDeriv, proj]
  ring

theorem hasFDerivAt_field (a : ℝ) (x : Space 3) :
    HasFDerivAt (field a) (fieldDeriv a x) x := by
  apply hasFDerivAt_pi.mpr
  intro i
  fin_cases i
  · convert ((hasFDerivAt_apply (𝕜 := ℝ) 0 x).const_mul a).add
      ((hasFDerivAt_apply (𝕜 := ℝ) 2 x).mul ((hasFDerivAt_d x).pow 2)) using 1 <;>
      simp [field, fieldDeriv, proj, d] <;> ext v <;> simp [dDeriv, proj] <;> ring
  · convert ((hasFDerivAt_apply (𝕜 := ℝ) 1 x).const_mul a).sub
      ((hasFDerivAt_d x).pow 2) using 1 <;>
      simp [field, fieldDeriv, proj, d] <;> ext v <;> simp [dDeriv, proj] <;> ring
  · simpa [field, fieldDeriv, proj] using
      (hasFDerivAt_apply (𝕜 := ℝ) 2 x).const_mul a

theorem contDiff_field (a : ℝ) : ContDiff ℝ ⊤ (field a) := by
  apply contDiff_pi.mpr
  intro i
  fin_cases i <;> simp only [field, Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.cons_val_two, d] <;> fun_prop

theorem field_zero (a : ℝ) : field a 0 = 0 := by
  ext i
  fin_cases i <;> simp [field, d]

theorem field_polynomial (a : ℝ) : HasPolynomialCoordinates (field a) := by
  intro i
  fin_cases i
  · refine ⟨MvPolynomial.C a * MvPolynomial.X 0 + MvPolynomial.X 2 *
      (MvPolynomial.X 0 + MvPolynomial.X 2 * MvPolynomial.X 1) ^ 2, ?_⟩
    intro x
    simp [field, d]
  · refine ⟨MvPolynomial.C a * MvPolynomial.X 1 -
      (MvPolynomial.X 0 + MvPolynomial.X 2 * MvPolynomial.X 1) ^ 2, ?_⟩
    intro x
    simp [field, d]
  · refine ⟨MvPolynomial.C a * MvPolynomial.X 2, ?_⟩
    intro x
    simp [field]

def jacobianFormula (a : ℝ) (x : Space 3) : Matrix (Fin 3) (Fin 3) ℝ :=
  !![a + 2 * x 2 * d x, 2 * x 2 ^ 2 * d x, d x ^ 2 + 2 * x 2 * x 1 * d x;
     -2 * d x, a - 2 * x 2 * d x, -2 * x 1 * d x;
     0, 0, a]

theorem jacobian_field (a : ℝ) (x : Space 3) :
    jacobian (field a) x = jacobianFormula a x := by
  ext i j
  rw [jacobian, (hasFDerivAt_field a x).fderiv]
  fin_cases i <;> fin_cases j <;>
    simp [fieldDeriv, dDeriv, proj, jacobianFormula] <;> ring

theorem eigenvalue_eq (a : ℝ) (x : Space 3) (z : ℂ)
    (hz : Module.End.HasEigenvalue (Matrix.toLin' (complexJacobian (field a) x)) z) :
    z = (a : ℂ) := by
  obtain ⟨v, hv⟩ := hz.exists_hasEigenvector
  have he := hv.apply_eq_smul
  have hvne : v ≠ 0 := hv.2
  by_contra hne
  have hza : z - (a : ℂ) ≠ 0 := sub_ne_zero.mpr hne
  have h0 := congr_fun he 0
  have h1 := congr_fun he 1
  have h2 := congr_fun he 2
  simp only [complexJacobian, jacobian_field, jacobianFormula, Matrix.toLin'_apply,
    Matrix.mulVec, dotProduct, Fin.sum_univ_succ, Fin.sum_univ_zero,
    Matrix.map_apply, Matrix.of_apply, Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.cons_val_two, Pi.smul_apply, smul_eq_mul, Complex.ofReal_add,
    Complex.ofReal_mul, Complex.ofReal_sub, Complex.ofReal_neg, Complex.ofReal_pow,
    Complex.ofReal_ofNat, Complex.ofReal_zero, add_zero, zero_mul] at h0 h1 h2
  have hv2 : v 2 = 0 := (mul_eq_zero.mp (show (z - (a : ℂ)) * v 2 = 0 by
    linear_combination -h2)).resolve_left hza
  have hp : v 0 + (x 2 : ℂ) * v 1 = 0 :=
    (mul_eq_zero.mp (show (z - (a : ℂ)) * (v 0 + (x 2 : ℂ) * v 1) = 0 by
      rw [hv2] at h0 h1
      linear_combination -h0 - (x 2 : ℂ) * h1)).resolve_left hza
  have hv1 : v 1 = 0 := (mul_eq_zero.mp (show (z - (a : ℂ)) * v 1 = 0 by
    rw [hv2] at h1
    linear_combination -h1 - 2 * (d x : ℂ) * hp)).resolve_left hza
  have hv0 : v 0 = 0 := by simpa [hv1] using hp
  apply hvne
  ext i
  fin_cases i <;> assumption

end Published.MarkusYamabe
