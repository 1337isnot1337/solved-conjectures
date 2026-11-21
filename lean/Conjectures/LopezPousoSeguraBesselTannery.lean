import Conjectures.LopezPousoSeguraBesselFinite
import Mathlib.Analysis.Normed.Group.Tannery
open Filter
open scoped Topology
namespace BesselWeights

theorem deviation_resolvent_tendsto (δ ell : ℕ → ℝ) (t : ℕ → ℝ)
    (hδ : Summable δ) (hell : ∀ k, 0 ≤ ell k)
    (ht : Tendsto t atTop (𝓝 0)) (htpos : ∀ᶠ n in atTop, 0 ≤ t n) :
    Tendsto (fun n => ∑' k, δ k / (1+ell k*t n)^2) atTop (𝓝 (∑' k, δ k)) := by
  apply tendsto_tsum_of_dominated_convergence hδ.norm
  · intro k
    have hc : ContinuousAt (fun x : ℝ => δ k / (1+ell k*x)^2) 0 := by fun_prop (disch := norm_num)
    have hh := hc.tendsto.comp ht
    simpa [Function.comp_def] using hh
  · filter_upwards [htpos] with n hn k
    have hd : 1 ≤ (1+ell k*t n)^2 := by
      have hmul := mul_nonneg (hell k) hn
      nlinarith [sq_nonneg (ell k*t n)]
    have hden : 0 ≤ (1+ell k*t n)^2 := sq_nonneg _
    rw [Real.norm_eq_abs, abs_div, abs_of_nonneg hden]
    exact div_le_self (abs_nonneg _) hd
end BesselWeights
