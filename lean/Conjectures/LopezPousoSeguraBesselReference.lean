import Conjectures.LopezPousoSeguraBesselConditional
import Mathlib.MeasureTheory.Integral.IntegralEqImproper
open Filter Set MeasureTheory
open scoped Topology
namespace BesselWeights

noncomputable def refKernel (x : ℝ) : ℝ := x/(1+x^2)^2
noncomputable def refPrimitive (x : ℝ) : ℝ := -(1/2:ℝ)/(1+x^2)

theorem refPrimitive_hasDeriv (x : ℝ) : HasDerivAt refPrimitive (refKernel x) x := by
  have hn : 1+x^2 ≠ 0 := by positivity
  have hh := (hasDerivAt_const x (-(1/2:ℝ))).div ((hasDerivAt_const x 1).add ((hasDerivAt_id x).pow 2)) hn
  convert hh using 1
  all_goals try { funext t; simp [refPrimitive] }
  all_goals simp only [Pi.add_apply, Pi.pow_apply, id_eq, Nat.reduceSub, pow_one, mul_one]
  all_goals unfold refKernel
  all_goals field_simp [hn]
  all_goals ring

theorem refPrimitive_tendsto : Tendsto refPrimitive atTop (𝓝 0) := by
  have ht : Tendsto (fun x : ℝ => 1+x^2) atTop atTop := by
    have hs : Tendsto (fun x : ℝ => x^2) atTop atTop := tendsto_pow_atTop (n := 2) (by norm_num)
    have hc : Tendsto (fun _ : ℝ => (1:ℝ)) atTop (𝓝 1) := tendsto_const_nhds
    exact hc.add_atTop hs
  have hi := tendsto_inv_atTop_zero.comp ht
  have hh := hi.const_mul (-(1/2:ℝ))
  change Tendsto (fun x : ℝ => -(1/2:ℝ)/(1+x^2)) atTop (𝓝 0)
  simpa [div_eq_mul_inv, Function.comp_def] using hh

theorem refKernel_integral : (∫ x in Ioi (0:ℝ), refKernel x) = 1/2 := by
  have hh := integral_Ioi_of_hasDerivAt_of_nonneg' (a := (0:ℝ))
    (fun x _ => refPrimitive_hasDeriv x)
    (show ∀ x ∈ Ioi (0:ℝ), 0 ≤ refKernel x by
      intro x hx
      have hx' : 0 < x := hx
      unfold refKernel
      positivity) refPrimitive_tendsto
  simpa [refPrimitive] using hh

theorem refKernel_deriv_at_zero : HasDerivAt refKernel 1 0 := by
  have hh := (hasDerivAt_id (0:ℝ)).div
    (((hasDerivAt_const (0:ℝ) 1).add ((hasDerivAt_id (0:ℝ)).pow 2)).pow 2) (by norm_num)
  convert hh using 1
  · funext x; simp [refKernel]
  · norm_num

theorem bernoulli_two_three_quarters : ((3/4:ℝ)^2-(3/4)+1/6) = -(1/48:ℝ) := by norm_num
end BesselWeights
