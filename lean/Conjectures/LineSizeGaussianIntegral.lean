import Conjectures.LineSizeGaussianIntegralBasic
import Conjectures.LineSizeAnalyticProfile

/-!
# The saddle's double-Gaussian normalization

The variance relation used here is the checked identity for the literal
profile integral.  No value of that integral is an extra hypothesis.
-/

noncomputable section

open MeasureTheory

namespace LineSize.GaussianIntegral

def saddleKernel (p : ℝ × ℝ) : ℂ :=
  kernel (3/2) (Profile.V0/2) (3*Profile.u0) p

theorem saddle_determinant :
    4*(3/2 : ℝ)*(Profile.V0/2)+(3*Profile.u0)^2 = 6*Profile.A := by
  rw [Profile.V0_eq]
  ring

theorem integrable_saddleKernel : Integrable saddleKernel (volume.prod volume) :=
  integrable_kernel (by norm_num : (0 : ℝ) < 3/2)
    (half_pos Profile.V0_pos) (3*Profile.u0)

theorem iterated_saddleKernel :
    (∫ y : ℝ, ∫ x : ℝ, saddleKernel (y,x)) =
      ((2*Real.pi/Real.sqrt (6*Profile.A) : ℝ) : ℂ) := by
  have h := iterated_integral (by norm_num : (0 : ℝ) < 3/2)
    (half_pos Profile.V0_pos) (3*Profile.u0)
  rw [saddle_determinant] at h
  exact h

theorem integral_saddleKernel :
    (∫ p : ℝ × ℝ, saddleKernel p ∂(volume.prod volume)) =
      ((2*Real.pi/Real.sqrt (6*Profile.A) : ℝ) : ℂ) := by
  rw [integral_prod _ integrable_saddleKernel]
  exact iterated_saddleKernel

theorem saddle_normalization_pos : 0 < 2*Real.pi/Real.sqrt (6*Profile.A) := by
  apply div_pos (by positivity)
  exact Real.sqrt_pos.2 (mul_pos (by norm_num) Profile.A_pos)

theorem saddle_iterated_integral_literal :
    (∫ y : ℝ, ∫ x : ℝ,
      Complex.exp (((-(3/2 : ℝ)*x^2-(Profile.V0/2)*y^2 : ℝ) : ℂ) +
        Complex.I * ((3*Profile.u0*y*x : ℝ) : ℂ))) =
      ((2*Real.pi/Real.sqrt (6*Profile.A) : ℝ) : ℂ) := by
  simpa only [saddleKernel, kernel] using iterated_saddleKernel

end LineSize.GaussianIntegral
