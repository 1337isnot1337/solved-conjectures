import Mathlib.Analysis.SpecialFunctions.Gaussian.FourierTransform
import Mathlib.MeasureTheory.Integral.Prod
import Mathlib.Tactic.FunProp
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# A complex Gaussian with an imaginary mixed term

The coordinates are `(y,x)`, with Fourier frequency first.  Both diagonal
quadratic coefficients are positive; the real coupling is unrestricted.
-/

noncomputable section

open Set MeasureTheory
open scoped Topology

namespace LineSize.GaussianIntegral

theorem cpow_half_ofReal {x : ℝ} (hx : 0 ≤ x) :
    (x : ℂ)^(1/2 : ℂ) = (Real.sqrt x : ℂ) := by
  rw [Real.sqrt_eq_rpow, Complex.ofReal_cpow hx]
  norm_num

def kernel (a b c : ℝ) (p : ℝ × ℝ) : ℂ :=
  Complex.exp (((-a*p.2^2-b*p.1^2 : ℝ) : ℂ) +
    Complex.I * ((c*p.1*p.2 : ℝ) : ℂ))

theorem measurable_kernel (a b c : ℝ) : Measurable (kernel a b c) := by
  unfold kernel
  fun_prop

theorem norm_kernel (a b c : ℝ) (p : ℝ × ℝ) :
    ‖kernel a b c p‖ = Real.exp (-b*p.1^2) * Real.exp (-a*p.2^2) := by
  rw [kernel, Complex.norm_exp]
  have him : (Complex.I * ((c*p.1*p.2 : ℝ) : ℂ)).re = 0 := by
    simp [Complex.mul_re]
  rw [Complex.add_re, Complex.ofReal_re, him, add_zero, ← Real.exp_add]
  congr 1
  ring

theorem integrable_kernel {a b : ℝ} (ha : 0 < a) (hb : 0 < b) (c : ℝ) :
    Integrable (kernel a b c) (volume.prod volume) := by
  have hi := (integrable_exp_neg_mul_sq hb).mul_prod (integrable_exp_neg_mul_sq ha)
  apply hi.mono' (measurable_kernel a b c).aestronglyMeasurable
  exact ae_of_all _ (fun p => (norm_kernel a b c p).le)

theorem kernel_factor (a b c y x : ℝ) :
    kernel a b c (y,x) = ((Real.exp (-b*y^2) : ℝ) : ℂ) *
      (Complex.exp (Complex.I * ((c*y : ℝ) : ℂ) * (x : ℂ)) *
        Complex.exp (-(a : ℂ)*(x : ℂ)^2)) := by
  rw [kernel, Complex.ofReal_exp, ← Complex.exp_add, ← Complex.exp_add]
  congr 1
  simp only [Complex.ofReal_sub, Complex.ofReal_mul, Complex.ofReal_neg, Complex.ofReal_pow]
  ring

theorem inner_integral {a : ℝ} (ha : 0 < a) (b c y : ℝ) :
    (∫ x : ℝ, kernel a b c (y,x)) =
      (Real.sqrt (Real.pi/a) : ℂ) *
        Complex.exp (((-(b+c^2/(4*a))*y^2 : ℝ) : ℂ)) := by
  simp_rw [kernel_factor]
  rw [integral_const_mul,
    fourierIntegral_gaussian (by simpa only [Complex.ofReal_re] using ha) ((c*y : ℝ) : ℂ)]
  have hroot : ((Real.pi : ℂ)/(a : ℂ))^(1/2 : ℂ) = (Real.sqrt (Real.pi/a) : ℂ) := by
    rw [← Complex.ofReal_div]
    exact cpow_half_ofReal (div_nonneg Real.pi_pos.le ha.le)
  rw [hroot, Complex.ofReal_exp]
  calc
    Complex.exp (((-b*y^2 : ℝ) : ℂ)) *
        ((Real.sqrt (Real.pi/a) : ℂ) *
          Complex.exp (-((c*y : ℝ) : ℂ)^2/(4*(a : ℂ)))) =
      (Real.sqrt (Real.pi/a) : ℂ) *
        (Complex.exp (((-b*y^2 : ℝ) : ℂ)) *
          Complex.exp (-((c*y : ℝ) : ℂ)^2/(4*(a : ℂ)))) := by ring
    _ = (Real.sqrt (Real.pi/a) : ℂ) *
        Complex.exp (((-(b+c^2/(4*a))*y^2 : ℝ) : ℂ)) := by
      rw [← Complex.exp_add]
      apply congrArg (fun z : ℂ => (Real.sqrt (Real.pi/a) : ℂ) * Complex.exp z)
      simp only [Complex.ofReal_neg, Complex.ofReal_mul, Complex.ofReal_pow,
        Complex.ofReal_add, Complex.ofReal_div, Complex.ofReal_ofNat]
      ring

theorem iterated_integral_product {a : ℝ} (ha : 0 < a) (b c : ℝ) :
    (∫ y : ℝ, ∫ x : ℝ, kernel a b c (y,x)) =
      (Real.sqrt (Real.pi/a) : ℂ) *
        (Real.sqrt (Real.pi/(b+c^2/(4*a))) : ℂ) := by
  simp_rw [inner_integral ha]
  rw [integral_const_mul]
  simp_rw [← Complex.ofReal_exp]
  rw [integral_complex_ofReal, integral_gaussian]

theorem effective_quadratic_pos {a b : ℝ} (ha : 0 < a) (hb : 0 < b) (c : ℝ) :
    0 < b+c^2/(4*a) := by positivity

theorem determinant_pos {a b : ℝ} (ha : 0 < a) (hb : 0 < b) (c : ℝ) :
    0 < 4*a*b+c^2 := by positivity

theorem sqrt_normalization {a b : ℝ} (ha : 0 < a) (hb : 0 < b) (c : ℝ) :
    Real.sqrt (Real.pi/a) * Real.sqrt (Real.pi/(b+c^2/(4*a))) =
      2*Real.pi/Real.sqrt (4*a*b+c^2) := by
  let d := b+c^2/(4*a)
  let D := 4*a*b+c^2
  have hd : 0 < d := effective_quadratic_pos ha hb c
  have hD : 0 < D := determinant_pos ha hb c
  have h4a : 4*a ≠ 0 := ne_of_gt (by positivity : 0 < 4*a)
  have hident : D = 4*a*d := by
    calc
      D = 4*a*b+c^2*((4*a)/(4*a)) := by
        dsimp [D]
        rw [div_self h4a, mul_one]
      _ = 4*a*d := by dsimp [d]; ring
  have hsa : (Real.sqrt (Real.pi/a))^2 = Real.pi/a :=
    Real.sq_sqrt (div_nonneg Real.pi_pos.le ha.le)
  have hsd : (Real.sqrt (Real.pi/d))^2 = Real.pi/d :=
    Real.sq_sqrt (div_nonneg Real.pi_pos.le hd.le)
  have hsD : (Real.sqrt D)^2 = D := Real.sq_sqrt hD.le
  have hsq : (Real.sqrt (Real.pi/a) * Real.sqrt (Real.pi/d) * Real.sqrt D)^2 =
      (2*Real.pi)^2 := by
    rw [mul_pow, mul_pow, hsa, hsd, hsD, hident]
    calc
      (Real.pi/a) * (Real.pi/d) * (4*a*d) =
          4*Real.pi^2*((a/a)*(d/d)) := by ring
      _ = 4*Real.pi^2 := by simp only [div_self ha.ne', div_self hd.ne', mul_one]
      _ = (2*Real.pi)^2 := by ring
  apply (eq_div_iff (ne_of_gt (Real.sqrt_pos.2 hD))).2
  exact (sq_eq_sq₀ (by positivity) (by positivity)).1 hsq

theorem iterated_integral {a b : ℝ} (ha : 0 < a) (hb : 0 < b) (c : ℝ) :
    (∫ y : ℝ, ∫ x : ℝ, kernel a b c (y,x)) =
      ((2*Real.pi/Real.sqrt (4*a*b+c^2) : ℝ) : ℂ) := by
  rw [iterated_integral_product ha, ← Complex.ofReal_mul, sqrt_normalization ha hb]

theorem integral_kernel {a b : ℝ} (ha : 0 < a) (hb : 0 < b) (c : ℝ) :
    (∫ p : ℝ × ℝ, kernel a b c p ∂(volume.prod volume)) =
      ((2*Real.pi/Real.sqrt (4*a*b+c^2) : ℝ) : ℂ) := by
  rw [integral_prod _ (integrable_kernel ha hb c)]
  exact iterated_integral ha hb c

end LineSize.GaussianIntegral
