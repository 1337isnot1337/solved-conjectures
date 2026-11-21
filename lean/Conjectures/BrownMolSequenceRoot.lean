import Conjectures.BrownMolGeneralRoot
import Mathlib.Topology.Algebra.InfiniteSum.Basic

open Polynomial Filter
open scoped Topology
noncomputable section
namespace BrownMol

theorem roots_near_from_scaled_limits (p : ℕ → ℂ[X]) (x : ℕ → ℂ) (L : ℂ)
    (K : ℕ) (hK : 0 < K) (hL : L ≠ 0)
    (hdeg : ∀ n, (p n).natDegree ≤ K*n)
    (hval : Tendsto (fun n => (p n).eval (x n) / (n : ℂ)) atTop (𝓝 0))
    (hder : Tendsto (fun n => (p n).derivative.eval (x n) / (n : ℂ)^2) atTop (𝓝 L))
    (R : ℝ) (hR : 0 < R) :
    ∀ᶠ n in atTop, ∃ z, (p n).IsRoot z ∧ ‖x n-z‖ < R := by
  have hLpos : 0 < ‖L‖ := norm_pos_iff.mpr hL
  let ε : ℝ := R*‖L‖/(2*(K : ℝ))
  have hε : 0 < ε := by dsimp [ε]; positivity
  have hv := (Metric.tendsto_nhds.mp hval) ε hε
  have hd := (Metric.tendsto_nhds.mp hder) (‖L‖/2) (by positivity)
  filter_upwards [hv,hd,Filter.eventually_ge_atTop 1] with n hnv hnd hn
  have hn0 : 0 < (n : ℝ) := by exact_mod_cast hn
  have hv' : ‖(p n).eval (x n)‖ < ε*(n : ℝ) := by
    simp only [dist_zero_right, norm_div, norm_natCast] at hnv
    exact (div_lt_iff₀ hn0).mp hnv
  have hd' : ‖L‖/2 < ‖(p n).derivative.eval (x n)‖/(n : ℝ)^2 := by
    rw [dist_eq_norm] at hnd
    have ht := norm_sub_norm_le L ((p n).derivative.eval (x n)/(n : ℂ)^2)
    rw [norm_sub_rev] at ht
    simp only [norm_div, norm_pow, norm_natCast] at ht
    linarith
  have hd'' : (‖L‖/2)*(n : ℝ)^2 < ‖(p n).derivative.eval (x n)‖ := by
    exact (lt_div_iff₀ (by positivity)).mp hd'
  have hK0 : 0 < (K : ℝ) := by exact_mod_cast hK
  have hdeg' : ((p n).natDegree : ℝ) ≤ (K : ℝ)*(n : ℝ) := by exact_mod_cast hdeg n
  have hcalc : ((p n).natDegree : ℝ)*‖(p n).eval (x n)‖ < R*‖(p n).derivative.eval (x n)‖ := by
    have hv0 : 0 ≤ ‖(p n).eval (x n)‖ := norm_nonneg _
    have hm1 := mul_le_mul_of_nonneg_right hdeg' hv0
    have hm2 := mul_lt_mul_of_pos_left hv' (mul_pos hK0 hn0)
    have hm3 := mul_lt_mul_of_pos_left hd'' hR
    dsimp [ε] at hm2
    field_simp at hm2
    nlinarith
  exact root_near_of_derivative_bound (p n) (x n) R hR _ le_rfl hcalc
end BrownMol
end
