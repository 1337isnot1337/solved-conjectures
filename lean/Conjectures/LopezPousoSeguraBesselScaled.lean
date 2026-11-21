import Conjectures.LopezPousoSeguraBesselResolve
open Filter
open scoped Topology
namespace BesselWeights

theorem deviation_scaled_resolvent (δ ell : ℕ → ℝ) (s : ℕ → ℝ)
    (hδ : Summable δ) (hell : ∀ k, 0 ≤ ell k) (hs : Tendsto s atTop atTop) :
    Tendsto (fun n => (s n)^4 * ∑' k, δ k / (ell k + (s n)^2)^2) atTop (𝓝 (∑' k, δ k)) := by
  have hs2 : Tendsto (fun n => (s n)^2) atTop atTop :=
    (tendsto_pow_atTop (n := 2) (by norm_num)).comp hs
  have ht : Tendsto (fun n => 1/(s n)^2) atTop (𝓝 0) := by
    simpa [one_div, Function.comp_def] using (tendsto_inv_atTop_zero.comp hs2)
  have htp : ∀ᶠ n in atTop, 0 ≤ 1/(s n)^2 := Filter.Eventually.of_forall (fun n => by positivity)
  have hh := deviation_resolvent_tendsto δ ell (fun n => 1/(s n)^2) hδ hell ht htp
  apply hh.congr'
  filter_upwards [hs.eventually_gt_atTop 0] with n hn
  rw [← tsum_mul_left]
  apply tsum_congr
  intro k
  have hsn : s n ≠ 0 := ne_of_gt hn
  have hk : 0 ≤ ell k := hell k
  have hden : ell k+(s n)^2 ≠ 0 := by positivity
  have hden2 : 1+ell k*(1/(s n)^2) ≠ 0 := by positivity
  field_simp [hsn, hden, hden2]
  ring
end BesselWeights
