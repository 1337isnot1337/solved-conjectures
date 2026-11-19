import Conjectures.LineSizeCoefficientIntegralBasis
import Conjectures.LineSizeGeneratingEvaluationBasic
import Mathlib.MeasureTheory.Integral.DominatedConvergence

/-! Coefficient recovery for an arbitrary absolutely convergent complex series.
The hypothesis is the summability of `‖a n‖ * q^n` at one real radius.
Termwise integration follows from a constant summable norm majorant. -/
noncomputable section
namespace LineSize.CoefficientIntegral

open Complex Real Finset MeasureTheory PowerSeries
open Generating
open scoped Interval

def coefficientSeries (a : ℕ → ℂ) (z : ℂ) : ℂ := ∑' m : ℕ, a m*z^m

def coefficientFourierTerm (a : ℕ → ℂ) (q : ℝ) (n m : ℕ) (theta : ℝ) : ℂ :=
  a m*circlePoint q theta^m*fourierKernel n theta

theorem continuous_coefficientFourierTerm (a : ℕ → ℂ) (q : ℝ) (n m : ℕ) :
    Continuous (coefficientFourierTerm a q n m) := by
  unfold coefficientFourierTerm circlePoint fourierKernel
  fun_prop

theorem norm_coefficientFourierTerm (a : ℕ → ℂ) {q : ℝ} (hq : 0 ≤ q)
    (n m : ℕ) (theta : ℝ) :
    ‖coefficientFourierTerm a q n m theta‖=‖a m‖*q^m := by
  rw [coefficientFourierTerm,norm_mul,norm_mul,norm_pow,
    norm_circlePoint hq,norm_fourierKernel,mul_one]

theorem hasSum_circleSeries (a : ℕ → ℂ) {q : ℝ} (hq : 0 ≤ q)
    (hsum : Summable (fun m : ℕ => ‖a m‖*q^m)) (theta : ℝ) :
    HasSum (fun m : ℕ => a m*circlePoint q theta^m)
      (coefficientSeries a (circlePoint q theta)) := by
  have hs : Summable (fun m : ℕ => ‖a m*circlePoint q theta^m‖) := by
    simpa only [norm_mul,norm_pow,norm_circlePoint hq] using hsum
  exact hs.of_norm.hasSum

theorem coefficientFourierTerm_eq_frequency (a : ℕ → ℂ) (q theta : ℝ)
    (n m : ℕ) :
    coefficientFourierTerm a q n m theta=(a m*(q : ℂ)^m)*frequency m n theta := by
  rw [coefficientFourierTerm,mul_assoc,circlePoint_pow_mul_kernel,← mul_assoc]

theorem integral_coefficientFourierTerm (a : ℕ → ℂ) (q : ℝ) (n m : ℕ) :
    (∫ theta in -Real.pi..Real.pi, coefficientFourierTerm a q n m theta)=
      if m=n then (2*(Real.pi : ℂ))*(a n*(q : ℂ)^n) else 0 := by
  simp_rw [coefficientFourierTerm_eq_frequency]
  rw [intervalIntegral.integral_const_mul,integral_frequency]
  by_cases hmn : m=n
  · subst m
    simp only [ite_eq_left (show n=n from rfl)]
    ring
  · simp only [ite_eq_right hmn,mul_zero]

theorem hasSum_integral_coefficientFourierTerm (a : ℕ → ℂ) {q : ℝ} (hq : 0 ≤ q)
    (hsum : Summable (fun m : ℕ => ‖a m‖*q^m)) (n : ℕ) :
    HasSum
      (fun m : ℕ => ∫ theta in -Real.pi..Real.pi, coefficientFourierTerm a q n m theta)
      (∫ theta in -Real.pi..Real.pi,
        coefficientSeries a (circlePoint q theta)*fourierKernel n theta) := by
  apply intervalIntegral.hasSum_integral_of_dominated_convergence
    (bound := fun m (_theta : ℝ) => ‖a m‖*q^m)
  · intro m
    exact (continuous_coefficientFourierTerm a q n m).aestronglyMeasurable
  · intro m
    exact Filter.Eventually.of_forall
      (fun theta _ => le_of_eq (norm_coefficientFourierTerm a hq n m theta))
  · exact Filter.Eventually.of_forall (fun _ _ => hsum)
  · exact intervalIntegrable_const
  · exact Filter.Eventually.of_forall
      (fun theta _ => (hasSum_circleSeries a hq hsum theta).mul_right (fourierKernel n theta))

theorem integral_coefficientSeries (a : ℕ → ℂ) {q : ℝ} (hq : 0 ≤ q)
    (hsum : Summable (fun m : ℕ => ‖a m‖*q^m)) (n : ℕ) :
    (∫ theta in -Real.pi..Real.pi,
      coefficientSeries a (circlePoint q theta)*fourierKernel n theta)=
        (2*(Real.pi : ℂ))*(a n*(q : ℂ)^n) := by
  have hoff : ∀ m ∉ ({n} : Finset ℕ),
      (∫ theta in -Real.pi..Real.pi, coefficientFourierTerm a q n m theta)=0 := by
    intro m hm
    rw [integral_coefficientFourierTerm,
      ite_eq_right (by simpa only [mem_singleton] using hm)]
  have hfinite : HasSum
      (fun m : ℕ => ∫ theta in -Real.pi..Real.pi, coefficientFourierTerm a q n m theta)
      ((2*(Real.pi : ℂ))*(a n*(q : ℂ)^n)) := by
    have h : HasSum
        (fun m : ℕ => ∫ theta in -Real.pi..Real.pi, coefficientFourierTerm a q n m theta)
        (∑ m ∈ ({n} : Finset ℕ),
          ∫ theta in -Real.pi..Real.pi, coefficientFourierTerm a q n m theta) :=
      hasSum_sum_of_ne_finset_zero hoff
    have hself : (∫ theta in -Real.pi..Real.pi, coefficientFourierTerm a q n n theta)=
        (2*(Real.pi : ℂ))*(a n*(q : ℂ)^n) := by
      rw [integral_coefficientFourierTerm,ite_eq_left rfl]
    rw [sum_singleton,hself] at h
    exact h
  exact (hasSum_integral_coefficientFourierTerm a hq hsum n).unique hfinite

theorem coefficientSeries_fourier (a : ℕ → ℂ) {q : ℝ} (hq : 0 ≤ q)
    (hsum : Summable (fun m : ℕ => ‖a m‖*q^m)) (n : ℕ) :
    a n*(q : ℂ)^n=(1/(2*(Real.pi : ℂ)))*
      ∫ theta in -Real.pi..Real.pi,
        coefficientSeries a (circlePoint q theta)*fourierKernel n theta := by
  have hpi : 2*(Real.pi : ℂ) ≠ 0 := by
    apply mul_ne_zero (by norm_num)
    exact_mod_cast Real.pi_ne_zero
  rw [integral_coefficientSeries a hq hsum n,one_div,inv_mul_cancel_left₀ hpi]

def powerSeriesValue (f : PowerSeries ℚ) (z : ℂ) : ℂ :=
  coefficientSeries (fun m : ℕ => Rat.castHom ℂ (coeff m f)) z

theorem powerSeriesValue_eq {f : PowerSeries ℚ} {z value : ℂ}
    (hf : HasSeriesValue f z value) : powerSeriesValue f z=value := by
  simpa only [powerSeriesValue,coefficientSeries,seriesTerm] using hf.hasSum.tsum_eq

theorem summable_radius_of_hasSeriesValue {f : PowerSeries ℚ} {q : ℝ} {value : ℂ}
    (hq : 0 ≤ q) (hf : HasSeriesValue f (q : ℂ) value) :
    Summable (fun m : ℕ => ‖Rat.castHom ℂ (coeff m f)‖*q^m) := by
  simpa only [seriesTerm,norm_mul,norm_pow,Complex.norm_of_nonneg hq] using hf.summable_norm

theorem powerSeries_integral {f : PowerSeries ℚ} {q : ℝ} {value : ℂ}
    (hq : 0 ≤ q) (hf : HasSeriesValue f (q : ℂ) value) (n : ℕ) :
    (∫ theta in -Real.pi..Real.pi,
      powerSeriesValue f (circlePoint q theta)*fourierKernel n theta)=
        (2*(Real.pi : ℂ))*(Rat.castHom ℂ (coeff n f)*(q : ℂ)^n) := by
  exact integral_coefficientSeries (fun m : ℕ => Rat.castHom ℂ (coeff m f)) hq
    (summable_radius_of_hasSeriesValue hq hf) n

theorem powerSeries_coefficient_integral {f : PowerSeries ℚ} {q : ℝ} {value : ℂ}
    (hq : 0 ≤ q) (hf : HasSeriesValue f (q : ℂ) value) (n : ℕ) :
    Rat.castHom ℂ (coeff n f)*(q : ℂ)^n=(1/(2*(Real.pi : ℂ)))*
      ∫ theta in -Real.pi..Real.pi,
        powerSeriesValue f (circlePoint q theta)*fourierKernel n theta := by
  exact coefficientSeries_fourier (fun m : ℕ => Rat.castHom ℂ (coeff m f)) hq
    (summable_radius_of_hasSeriesValue hq hf) n

end LineSize.CoefficientIntegral
