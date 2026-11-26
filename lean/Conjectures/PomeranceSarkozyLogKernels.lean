module
public import Mathlib.Analysis.SpecialFunctions.Log.Deriv
public import Mathlib.MeasureTheory.Integral.IntervalIntegral.FundThmCalculus
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Positivity

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory
open scoped Interval

noncomputable def reciprocalLog (t : ℝ) : ℝ := (Real.log t)⁻¹
noncomputable def logKernel (t : ℝ) : ℝ := 1/(t*Real.log t)
noncomputable def logSquaredKernel (t : ℝ) : ℝ := 1/(t*(Real.log t)^2)

theorem hasDerivAt_reciprocalLog {t : ℝ} (ht : 1<t) :
    HasDerivAt reciprocalLog (-logSquaredKernel t) t := by
  have hpos : 0<t := zero_lt_one.trans ht
  have hlog := Real.log_pos ht
  have h := (Real.hasDerivAt_log hpos.ne').inv hlog.ne'
  unfold reciprocalLog logSquaredKernel
  convert h using 1
  field_simp

theorem hasDerivAt_log_log {t : ℝ} (ht : 1<t) :
    HasDerivAt (fun x : ℝ => Real.log (Real.log x)) (logKernel t) t := by
  have hpos : 0<t := zero_lt_one.trans ht
  have hlog := Real.log_pos ht
  have h := (Real.hasDerivAt_log hlog.ne').comp t (Real.hasDerivAt_log hpos.ne')
  have he : (Real.log t)⁻¹*t⁻¹=logKernel t := by
    unfold logKernel
    rw [one_div,mul_inv_rev]
  change HasDerivAt (fun x : ℝ => Real.log (Real.log x)) ((Real.log t)⁻¹*t⁻¹) t at h
  rw [he] at h
  exact h

theorem logKernel_intervalIntegrable {x : ℝ} (hx : 2≤x) :
    IntervalIntegrable logKernel volume 2 x := by
  apply ContinuousOn.intervalIntegrable
  intro t ht
  rw [Set.uIcc_of_le hx] at ht
  have h1 : 1<t := (by norm_num : (1:ℝ)<2).trans_le ht.1
  have hpos : 0<t := zero_lt_one.trans h1
  have hlog := Real.log_pos h1
  unfold logKernel
  exact (continuousAt_const.div (continuousAt_id.mul (Real.continuousAt_log hpos.ne'))
    (mul_ne_zero hpos.ne' hlog.ne')).continuousWithinAt

theorem logSquaredKernel_intervalIntegrable {x : ℝ} (hx : 2≤x) :
    IntervalIntegrable logSquaredKernel volume 2 x := by
  apply ContinuousOn.intervalIntegrable
  intro t ht
  rw [Set.uIcc_of_le hx] at ht
  have h1 : 1<t := (by norm_num : (1:ℝ)<2).trans_le ht.1
  have hpos : 0<t := zero_lt_one.trans h1
  have hlog := Real.log_pos h1
  unfold logSquaredKernel
  exact (continuousAt_const.div (continuousAt_id.mul ((Real.continuousAt_log hpos.ne').pow 2))
    (mul_ne_zero hpos.ne' (pow_ne_zero _ hlog.ne'))).continuousWithinAt

theorem logKernel_integral {x : ℝ} (hx : 2≤x) :
    (∫ t in (2:ℝ)..x, logKernel t) =
      Real.log (Real.log x)-Real.log (Real.log 2) := by
  apply intervalIntegral.integral_eq_sub_of_hasDerivAt _ (logKernel_intervalIntegrable hx)
  intro t ht
  rw [Set.uIcc_of_le hx] at ht
  exact hasDerivAt_log_log ((by norm_num : (1:ℝ)<2).trans_le ht.1)

theorem logSquaredKernel_integral {x : ℝ} (hx : 2≤x) :
    (∫ t in (2:ℝ)..x, logSquaredKernel t) =
      reciprocalLog 2-reciprocalLog x := by
  have h := intervalIntegral.integral_eq_sub_of_hasDerivAt
    (f:=fun t => -reciprocalLog t) (f':=logSquaredKernel)
    (by
      intro t ht
      rw [Set.uIcc_of_le hx] at ht
      change HasDerivAt (-reciprocalLog) (logSquaredKernel t) t
      simpa only [neg_neg] using (hasDerivAt_reciprocalLog
        ((by norm_num : (1:ℝ)<2).trans_le ht.1)).neg)
    (logSquaredKernel_intervalIntegrable hx)
  linarith

end PomeranceSarkozy
