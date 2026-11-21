import Conjectures.LopezPousoSeguraBesselTannery
open Filter
open scoped Topology
namespace BesselWeights

theorem deviation_constant_from_resolvents (R R₀ t : ℕ → ℝ) (D : ℝ)
    (hR : Tendsto (fun n => (R n-t n/4)/(t n)^2) atTop (𝓝 0))
    (hR₀ : Tendsto (fun n => (R₀ n-t n/4)/(t n)^2) atTop
      (𝓝 (-1/16+Real.pi^2/192)))
    (hD : Tendsto (fun n => (R n-R₀ n)/(t n)^2) atTop (𝓝 D)) :
    D = 1/16-Real.pi^2/192 := by
  have hh := hR.sub hR₀
  have h' : Tendsto (fun n => (R n-R₀ n)/(t n)^2) atTop (𝓝 (0-(-1/16+Real.pi^2/192))) := by
    apply hh.congr'
    filter_upwards with n
    ring
  have he := tendsto_nhds_unique hD h'
  linarith

theorem resolvent_remainder_from_lower_bound (t I : ℕ → ℝ)
    (ht : Tendsto t atTop (𝓝 0))
    (hp : ∀ᶠ n in atTop, 0 < t n ∧ 1/(4*t n) ≤ I n) :
    Tendsto (fun n => ((t n/4)*(1-1/(I n)^2)-t n/4)/(t n)^2) atTop (𝓝 0) := by
  have hupper : Tendsto (fun n => 4*t n) atTop (𝓝 0) := by simpa using ht.const_mul 4
  have hlower : Tendsto (fun n => -(4*t n)) atTop (𝓝 0) := by simpa using hupper.neg
  apply tendsto_of_tendsto_of_tendsto_of_le_of_le' hlower hupper
  · filter_upwards [hp] with n ⟨htn, hI⟩
    have hIpos : 0 < I n := lt_of_lt_of_le (by positivity) hI
    have hb : 1 ≤ 4*t n*I n := by
      have hh := (div_le_iff₀ (show 0 < 4*t n by positivity)).1 hI
      nlinarith
    have hsq : 1 ≤ (4*t n*I n)^2 := by nlinarith [sq_nonneg (4*t n*I n-1)]
    have htne : t n ≠ 0 := ne_of_gt htn
    have hIne : I n ≠ 0 := ne_of_gt hIpos
    have hden : 0 < (4*t n*(I n)^2) := by positivity
    have bound : 1/(4*t n*(I n)^2) ≤ 4*t n := by
      apply (div_le_iff₀ hden).2
      nlinarith
    have heq : ((t n/4)*(1-1/(I n)^2)-t n/4)/(t n)^2 = -(1/(4*t n*(I n)^2)) := by
      field_simp
      ring
    rw [heq]
    linarith
  · filter_upwards [hp] with n ⟨htn, hI⟩
    have hIpos : 0 < I n := lt_of_lt_of_le (by positivity) hI
    have htne : t n ≠ 0 := ne_of_gt htn
    have hIne : I n ≠ 0 := ne_of_gt hIpos
    have heq : ((t n/4)*(1-1/(I n)^2)-t n/4)/(t n)^2 = -(1/(4*t n*(I n)^2)) := by
      field_simp
      ring
    rw [heq]
    have : 0 ≤ 1/(4*t n*(I n)^2) := by positivity
    linarith
end BesselWeights
