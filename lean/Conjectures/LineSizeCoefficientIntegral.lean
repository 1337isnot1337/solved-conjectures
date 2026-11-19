import Conjectures.LineSizeCoefficientIntegralBasis
import Conjectures.LineSizeGeneratingEvaluationUniform
import Mathlib.MeasureTheory.Integral.DominatedConvergence

/-! Fourier inversion for the actual number of real-plane line-size records.
The coefficient series is integrated term by term using its summable
constant norm bound. Exponential orthogonality then isolates one coefficient. -/
noncomputable section
namespace LineSize.CoefficientIntegral

open Complex Real Finset MeasureTheory
open Generating
open scoped Interval

def term (q : ℝ) (n m : ℕ) (theta : ℝ) : ℂ :=
  (lineSizeCount m : ℂ)*circlePoint q theta^m*fourierKernel n theta

theorem continuous_term (q : ℝ) (n m : ℕ) : Continuous (term q n m) := by
  unfold term circlePoint fourierKernel
  fun_prop

theorem term_norm_le {q : ℝ} (hq : 0 ≤ q) (n m : ℕ) (theta : ℝ) :
    ‖term q n m theta‖ ≤ (lineSizeCount m : ℝ)*q^m := by
  rw [term,norm_mul,norm_fourierKernel,mul_one]
  exact norm_lineSizeCount_term_le_radius m (circlePoint q theta)
    (le_of_eq (norm_circlePoint hq theta))

theorem term_eq_frequency (q theta : ℝ) (n m : ℕ) :
    term q n m theta=((lineSizeCount m : ℂ)*(q : ℂ)^m)*frequency m n theta := by
  rw [term,mul_assoc,circlePoint_pow_mul_kernel,← mul_assoc]

theorem integral_term (q : ℝ) (n m : ℕ) :
    (∫ theta in -Real.pi..Real.pi, term q n m theta)=
      if m=n then (2*(Real.pi : ℂ))*((lineSizeCount n : ℂ)*(q : ℂ)^n) else 0 := by
  simp_rw [term_eq_frequency]
  rw [intervalIntegral.integral_const_mul,integral_frequency]
  by_cases hmn : m=n
  · subst m
    rw [ite_eq_left rfl]
    ring
  · rw [ite_eq_right hmn,mul_zero]

theorem hasSum_integral_term {q : ℝ} (hq : 0 < q) (hq1 : q < 1) (n : ℕ) :
    HasSum (fun m : ℕ => ∫ theta in -Real.pi..Real.pi, term q n m theta)
      (∫ theta in -Real.pi..Real.pi,
        recordGenerating (circlePoint q theta)*fourierKernel n theta) := by
  have hnorm : ‖q‖ < 1 := by rwa [Real.norm_eq_abs,abs_of_nonneg hq.le]
  have hsummable : Summable (fun m : ℕ => (lineSizeCount m : ℝ)*q^m) :=
    (hasSum_lineSizeCount q hnorm).summable
  apply intervalIntegral.hasSum_integral_of_dominated_convergence
    (bound := fun m (_theta : ℝ) => (lineSizeCount m : ℝ)*q^m)
  · intro m
    exact (continuous_term q n m).aestronglyMeasurable
  · intro m
    exact Filter.Eventually.of_forall (fun theta _ => term_norm_le hq.le n m theta)
  · exact Filter.Eventually.of_forall (fun _ _ => hsummable)
  · exact intervalIntegrable_const
  · refine Filter.Eventually.of_forall (fun theta _ => ?_)
    have hz : ‖circlePoint q theta‖ < 1 := by rwa [norm_circlePoint hq.le]
    have hseries : HasSum
        (fun m : ℕ => (lineSizeCount m : ℂ)*circlePoint q theta^m)
        (recordGenerating (circlePoint q theta)) :=
      (summable_norm_lineSizeCount (circlePoint q theta) hz).of_norm.hasSum
    exact hseries.mul_right (fourierKernel n theta)

theorem integral_recordGenerating {q : ℝ} (hq : 0 < q) (hq1 : q < 1) (n : ℕ) :
    (∫ theta in -Real.pi..Real.pi,
      recordGenerating (circlePoint q theta)*fourierKernel n theta)=
        (2*(Real.pi : ℂ))*((lineSizeCount n : ℂ)*(q : ℂ)^n) := by
  have hoff : ∀ m ∉ ({n} : Finset ℕ),
      (∫ theta in -Real.pi..Real.pi, term q n m theta)=0 := by
    intro m hm
    rw [integral_term,ite_eq_right (by simpa only [mem_singleton] using hm)]
  have hfinite : HasSum
      (fun m : ℕ => ∫ theta in -Real.pi..Real.pi, term q n m theta)
      ((2*(Real.pi : ℂ))*((lineSizeCount n : ℂ)*(q : ℂ)^n)) := by
    have h : HasSum
        (fun m : ℕ => ∫ theta in -Real.pi..Real.pi, term q n m theta)
        (∑ m ∈ ({n} : Finset ℕ), ∫ theta in -Real.pi..Real.pi, term q n m theta) :=
      hasSum_sum_of_ne_finset_zero hoff
    have hself : (∫ theta in -Real.pi..Real.pi, term q n n theta)=
        (2*(Real.pi : ℂ))*((lineSizeCount n : ℂ)*(q : ℂ)^n) := by
      rw [integral_term,ite_eq_left rfl]
    rw [sum_singleton,hself] at h
    exact h
  exact (hasSum_integral_term hq hq1 n).unique hfinite

theorem two_pi_ne_zero : 2*(Real.pi : ℂ) ≠ 0 := by
  apply mul_ne_zero (by norm_num)
  exact_mod_cast Real.pi_ne_zero

theorem coefficient_integral {q : ℝ} (hq : 0 < q) (hq1 : q < 1) (n : ℕ) :
    (lineSizeCount n : ℂ)*(q : ℂ)^n=
      (1/(2*(Real.pi : ℂ)))*
        ∫ theta in -Real.pi..Real.pi,
          recordGenerating (circlePoint q theta)*fourierKernel n theta := by
  rw [integral_recordGenerating hq hq1 n,one_div,inv_mul_cancel_left₀ two_pi_ne_zero]

theorem coefficient_fourier {q : ℝ} (hq : 0 < q) (hq1 : q < 1) (n : ℕ) :
    (lineSizeCount n : ℂ)*(q : ℂ)^n=
      (1/(2*(Real.pi : ℂ)))*
        ∫ theta in -Real.pi..Real.pi,
          recordGenerating ((q : ℂ)*Complex.exp (Complex.I*(theta : ℂ)))*
            Complex.exp (-Complex.I*(n : ℂ)*(theta : ℂ)) := by
  simpa only [circlePoint,fourierKernel] using coefficient_integral hq hq1 n

theorem lineSizeCount_eq_integral {q : ℝ} (hq : 0 < q) (hq1 : q < 1) (n : ℕ) :
    (lineSizeCount n : ℂ)=
      (∫ theta in -Real.pi..Real.pi,
        recordGenerating (circlePoint q theta)*fourierKernel n theta)/
          ((2*(Real.pi : ℂ))*(q : ℂ)^n) := by
  have hqC : (q : ℂ) ≠ 0 := by exact_mod_cast hq.ne'
  apply (eq_div_iff (mul_ne_zero two_pi_ne_zero (pow_ne_zero n hqC))).mpr
  rw [integral_recordGenerating hq hq1 n]
  ring

end LineSize.CoefficientIntegral
