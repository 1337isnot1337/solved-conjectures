import Mathlib.Analysis.SpecialFunctions.Integrals.Basic
import Mathlib.Tactic

/-! Elementary exponential orthogonality on the interval `[-π, π]`.
The proof uses the antiderivative of the complex exponential. -/
noncomputable section
namespace LineSize.CoefficientIntegral

open Complex Real
open scoped Interval

def circlePoint (q theta : ℝ) : ℂ :=
  (q : ℂ)*Complex.exp (Complex.I*(theta : ℂ))

def fourierKernel (n : ℕ) (theta : ℝ) : ℂ :=
  Complex.exp (-Complex.I*(n : ℂ)*(theta : ℂ))

def frequency (m n : ℕ) (theta : ℝ) : ℂ :=
  Complex.exp (Complex.I*((m : ℂ)-(n : ℂ))*(theta : ℂ))

theorem continuous_circlePoint (q : ℝ) : Continuous (circlePoint q) := by
  unfold circlePoint
  fun_prop

theorem continuous_fourierKernel (n : ℕ) : Continuous (fourierKernel n) := by
  unfold fourierKernel
  fun_prop

theorem continuous_frequency (m n : ℕ) : Continuous (frequency m n) := by
  unfold frequency
  fun_prop

@[simp] theorem norm_circlePoint {q : ℝ} (hq : 0 ≤ q) (theta : ℝ) :
    ‖circlePoint q theta‖=q := by
  rw [circlePoint,norm_mul,Complex.norm_of_nonneg hq,
    Complex.norm_exp_I_mul_ofReal,mul_one]

@[simp] theorem norm_fourierKernel (n : ℕ) (theta : ℝ) :
    ‖fourierKernel n theta‖=1 := by
  unfold fourierKernel
  have harg : -Complex.I*(n : ℂ)*(theta : ℂ)=
      Complex.I*((-(n : ℝ)*theta : ℝ) : ℂ) := by
    push_cast
    ring
  rw [harg,Complex.norm_exp_I_mul_ofReal]

theorem circlePoint_pow_mul_kernel (q theta : ℝ) (m n : ℕ) :
    circlePoint q theta^m*fourierKernel n theta=(q : ℂ)^m*frequency m n theta := by
  unfold circlePoint fourierKernel frequency
  rw [mul_pow,mul_assoc,← Complex.exp_nat_mul (Complex.I*(theta : ℂ)) m,
    ← Complex.exp_add]
  congr 2
  ring

theorem frequency_exp_endpoints (m n : ℕ) :
    Complex.exp (Complex.I*((m : ℂ)-(n : ℂ))*(Real.pi : ℂ))=
      Complex.exp (Complex.I*((m : ℂ)-(n : ℂ))*((-Real.pi : ℝ) : ℂ)) := by
  have hplus : Complex.I*((m : ℂ)-(n : ℂ))*(Real.pi : ℂ)=
      (m : ℂ)*((Real.pi : ℂ)*Complex.I)-(n : ℂ)*((Real.pi : ℂ)*Complex.I) := by ring
  have hminus : Complex.I*((m : ℂ)-(n : ℂ))*((-Real.pi : ℝ) : ℂ)=
      (m : ℂ)*(-((Real.pi : ℂ)*Complex.I))-
        (n : ℂ)*(-((Real.pi : ℂ)*Complex.I)) := by
    push_cast
    ring
  rw [hplus,hminus]
  simp only [Complex.exp_sub,Complex.exp_nat_mul,Complex.exp_pi_mul_I,
    Complex.exp_neg_pi_mul_I]

theorem integral_frequency_of_ne (m n : ℕ) (hmn : m ≠ n) :
    (∫ theta in -Real.pi..Real.pi, frequency m n theta)=0 := by
  have hmnC : (m : ℂ) ≠ (n : ℂ) := by exact_mod_cast hmn
  have hc : Complex.I*((m : ℂ)-(n : ℂ)) ≠ 0 :=
    mul_ne_zero Complex.I_ne_zero (sub_ne_zero.mpr hmnC)
  unfold frequency
  rw [intervalIntegral.integral_exp_mul_complex hc,frequency_exp_endpoints,
    sub_self,zero_div]

@[simp] theorem integral_frequency_self (n : ℕ) :
    (∫ theta in -Real.pi..Real.pi, frequency n n theta)=2*(Real.pi : ℂ) := by
  simp only [frequency,sub_self,mul_zero,zero_mul,Complex.exp_zero,
    intervalIntegral.integral_const,sub_neg_eq_add,Complex.real_smul,mul_one,
    Complex.ofReal_add]
  ring

theorem integral_frequency (m n : ℕ) :
    (∫ theta in -Real.pi..Real.pi, frequency m n theta)=
      if m=n then 2*(Real.pi : ℂ) else 0 := by
  by_cases hmn : m=n
  · subst m
    rw [integral_frequency_self,ite_eq_left rfl]
  · rw [integral_frequency_of_ne m n hmn,ite_eq_right hmn]

end LineSize.CoefficientIntegral
