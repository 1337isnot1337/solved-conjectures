import Mathlib.Analysis.SpecialFunctions.Complex.Log
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity

open Filter
open scoped Topology
noncomputable section
namespace BrownTargets

def w (a b : ℂ) (n : ℕ) : ℂ := -((n : ℂ)*b)/a^n

def t (a b : ℂ) (n : ℕ) : ℂ := a * Complex.exp (Complex.log (w a b n)/(n : ℂ))

theorem w_nonzero (a b : ℂ) (ha : ‖a‖ = 1) (hb : b ≠ 0) {n : ℕ} (hn : 0 < n) :
    w a b n ≠ 0 := by
  have ha0 : a ≠ 0 := by intro h; simp [h] at ha
  simp [w, ha0, hb, Nat.ne_of_gt hn]

theorem target_power (a b : ℂ) (ha : ‖a‖ = 1) (hb : b ≠ 0) {n : ℕ} (hn : 0 < n) :
    (t a b n)^n = -((n : ℂ)*b) := by
  have ha0 : a ≠ 0 := by intro h; simp [h] at ha
  have hn0 : (n : ℂ) ≠ 0 := Nat.cast_ne_zero.mpr (Nat.ne_of_gt hn)
  rw [t,mul_pow,← Complex.exp_nat_mul]
  have he : (n : ℂ)*(Complex.log (w a b n)/(n : ℂ)) = Complex.log (w a b n) := by field_simp
  rw [he, Complex.exp_log (w_nonzero a b ha hb hn)]
  dsimp [w]
  field_simp

theorem w_norm (a b : ℂ) (ha : ‖a‖ = 1) (n : ℕ) : ‖w a b n‖ = (n : ℝ)*‖b‖ := by
  simp [w, norm_pow, ha]

theorem log_over_n_tendsto_zero (a b : ℂ) (ha : ‖a‖ = 1) (hb : b ≠ 0) :
    Tendsto (fun n : ℕ => Complex.log (w a b n)/(n : ℂ)) atTop (𝓝 0) := by
  have hnormb : 0 < ‖b‖ := norm_pos_iff.mpr hb
  have hnat : Tendsto (fun n : ℕ => (n : ℝ)) atTop atTop := tendsto_natCast_atTop_atTop
  have hlog0 : Tendsto (fun x : ℝ => Real.log x / x) atTop (𝓝 0) := by
    simpa using Real.tendsto_pow_log_div_mul_add_atTop 1 0 1 (by norm_num)
  have hlog := hlog0.comp hnat
  have hconst : Tendsto (fun n : ℕ => (|Real.log ‖b‖|+Real.pi)/(n : ℝ)) atTop (𝓝 0) :=
    tendsto_const_nhds.div_atTop hnat
  have hmajor : Tendsto (fun n : ℕ => (Real.log (n : ℝ)+|Real.log ‖b‖|+Real.pi)/(n : ℝ)) atTop (𝓝 0) := by
    convert hlog.add hconst using 1
    ext n
    simp only [Function.comp_apply]
    ring
    all_goals simp
  apply squeeze_zero_norm' _ hmajor
  filter_upwards [Filter.eventually_ge_atTop 1] with n hn
  have hnpos : 0 < (n : ℝ) := by exact_mod_cast hn
  have hnne : (n : ℝ) ≠ 0 := ne_of_gt hnpos
  have hlogn : 0 ≤ Real.log (n : ℝ) := Real.log_nonneg (by exact_mod_cast hn)
  have hlogre : (Complex.log (w a b n)).re = Real.log (n : ℝ) + Real.log ‖b‖ := by
    rw [Complex.log_re, w_norm a b ha, Real.log_mul hnne (ne_of_gt hnormb)]
  have him := Complex.abs_arg_le_pi (w a b n)
  have htriangle := Complex.norm_le_abs_re_add_abs_im (Complex.log (w a b n))
  rw [hlogre, Complex.log_im] at htriangle
  have hnum : ‖Complex.log (w a b n)‖ ≤ Real.log (n : ℝ)+|Real.log ‖b‖|+Real.pi := by
    have habs := abs_add_le (Real.log (n : ℝ)) (Real.log ‖b‖)
    rw [abs_of_nonneg hlogn] at habs
    linarith
  rw [norm_div, Complex.norm_natCast]
  exact div_le_div_of_nonneg_right hnum hnpos.le

theorem target_tendsto (a b : ℂ) (ha : ‖a‖ = 1) (hb : b ≠ 0) :
    Tendsto (t a b) atTop (𝓝 a) := by
  have he := Complex.continuous_exp.continuousAt.tendsto.comp (log_over_n_tendsto_zero a b ha hb)
  change Tendsto (fun n => a * Complex.exp (Complex.log (w a b n)/(n : ℂ))) atTop (𝓝 a)
  simpa only [Function.comp_apply, Complex.exp_zero, mul_one] using tendsto_const_nhds.mul he
end BrownTargets
end
