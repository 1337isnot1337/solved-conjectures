import Mathlib.Analysis.Analytic.IsolatedZeros
import Mathlib.Analysis.SpecialFunctions.ExpDeriv
import Mathlib.Analysis.SpecialFunctions.Log.Deriv
import Mathlib.Tactic

/-! A globally smooth version of the regular part of the finite Euler
product logarithm. The value at zero is supplied by a divided derivative. -/
noncomputable section
namespace LineSize.EulerKernel
open Real Filter
open scoped Topology

def meanExp (x : ℝ) : ℝ := -dslope (fun y : ℝ => exp (-y)) 0 x

theorem meanExp_of_ne {x : ℝ} (hx : x ≠ 0) :
    meanExp x=(1-exp (-x))/x := by
  simp only [meanExp,dslope_of_ne _ hx,slope,sub_zero,neg_zero,exp_zero,smul_eq_mul]
  rw [div_eq_mul_inv]
  ring

@[simp] theorem meanExp_zero : meanExp 0=1 := by
  have hd : HasDerivAt (fun x : ℝ => exp (-x)) (-1) 0 := by
    simpa using (Real.hasDerivAt_exp (-(0 : ℝ))).comp 0 (hasDerivAt_id 0).neg
  simp [meanExp,dslope_same,hd.deriv]

theorem meanExp_pos (x : ℝ) : 0 < meanExp x := by
  rcases lt_trichotomy x 0 with hx | hx | hx
  · rw [meanExp_of_ne hx.ne]
    apply div_pos_of_neg_of_neg
    · have he : 1 < exp (-x) := Real.one_lt_exp_iff.mpr (by linarith)
      linarith
    · exact hx
  · subst x
    simp
  · rw [meanExp_of_ne hx.ne']
    apply div_pos
    · have he : exp (-x) < 1 := Real.exp_lt_one_iff.mpr (by linarith)
      linarith
    · exact hx

theorem meanExp_analyticAt (x : ℝ) : AnalyticAt ℝ meanExp x := by
  by_cases hx : x=0
  · subst x
    obtain ⟨p,hp⟩ := (show AnalyticAt ℝ (fun y : ℝ => exp (-y)) 0 by fun_prop)
    have hds : AnalyticAt ℝ (dslope (fun y : ℝ => exp (-y)) 0) 0 :=
      ⟨p.fslope,hp.has_fpower_series_dslope_fslope⟩
    exact hds.neg
  · have hquot : AnalyticAt ℝ (fun y : ℝ => (1-exp (-y))/y) x := by
      exact (analyticAt_const.sub (analyticAt_id.neg.rexp)).div analyticAt_id hx
    apply hquot.congr
    filter_upwards [eventually_ne_nhds hx] with y hy
    exact (meanExp_of_ne hy).symm

theorem meanExp_contDiff (n : ℕ) : ContDiff ℝ n meanExp :=
  contDiff_iff_contDiffAt.mpr (fun x => (meanExp_analyticAt x).contDiffAt)

def smoothLog (x : ℝ) : ℝ := -log (meanExp x)

@[simp] theorem smoothLog_zero : smoothLog 0=0 := by simp [smoothLog]

theorem smoothLog_contDiff (n : ℕ) : ContDiff ℝ n smoothLog :=
  ((meanExp_contDiff n).log (fun x => (meanExp_pos x).ne')).neg

theorem smoothLog_eq {x : ℝ} (hx : 0 < x) :
    smoothLog x=log x-log (1-exp (-x)) := by
  have he : exp (-x) < 1 := Real.exp_lt_one_iff.mpr (by linarith)
  have hnum : 1-exp (-x) ≠ 0 := (sub_pos.mpr he).ne'
  rw [smoothLog,meanExp_of_ne hx.ne',Real.log_div hnum hx.ne']
  ring

theorem smoothLog_continuous : Continuous smoothLog := (smoothLog_contDiff 0).continuous

end LineSize.EulerKernel
