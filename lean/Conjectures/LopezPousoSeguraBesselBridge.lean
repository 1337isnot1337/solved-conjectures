import Conjectures.LopezPousoSeguraBesselSeries
open Filter
open scoped Topology
namespace BesselWeights

theorem normalized_deviation_constant (F G T : ℕ → ℝ) (D : ℝ)
    (hF : Tendsto (fun n => F n-T n) atTop (𝓝 0))
    (hG : Tendsto (fun n => G n-T n) atTop (𝓝 (-1/16+Real.pi^2/192)))
    (hD : Tendsto (fun n => F n-G n) atTop (𝓝 D)) :
    D = 1/16-Real.pi^2/192 := by
  have hh := hF.sub hG
  have hh' : Tendsto (fun n => F n-G n) atTop (𝓝 (0-(-1/16+Real.pi^2/192))) := by
    apply hh.congr'
    filter_upwards with n
    ring
  have he := tendsto_nhds_unique hD hh'
  linarith

theorem deviation_value_from_resolvent_bounds (a b x y : ℕ → ℝ) (t : ℕ → ℝ) (A B c C : ℝ)
    (hA : 0 ≤ A) (hB : 0 ≤ B) (hc : 0 < c)
    (hx : ∀ k, 0 < x k) (hy : ∀ k, 0 < y k)
    (hδ : ∀ᶠ (n : ℕ) in atTop, ‖a n-b n‖ ≤ C/((n:ℝ)+1)^3)
    (ha : ∀ᶠ (n : ℕ) in atTop, |a n| ≤ A*((n:ℝ)+1))
    (hb : ∀ᶠ (n : ℕ) in atTop, |b n| ≤ A*((n:ℝ)+1))
    (hd : ∀ᶠ (n : ℕ) in atTop, |x n-y n| ≤ B/((n:ℝ)+1)^2)
    (hmin : ∀ᶠ (n : ℕ) in atTop, c*((n:ℝ)+1)^2 ≤ min (x n) (y n))
    (ht : Tendsto t atTop (𝓝 0)) (htpos : ∀ᶠ n in atTop, 0 < t n)
    (hmain : Tendsto (fun n => (∑' k, a k/(1+x k*t n)^2)-1/(4*t n)) atTop (𝓝 0))
    (href : Tendsto (fun n => (∑' k, b k/(1+y k*t n)^2)-1/(4*t n)) atTop (𝓝 (-1/16+Real.pi^2/192))) :
    (∑' k, (a k-b k)) = 1/16-Real.pi^2/192 := by
  exact normalized_deviation_constant _ _ _ _ hmain href
    (normalized_resolvent_difference_from_bounds a b x y t A B c C hA hB hc hx hy hδ ha hb hd hmin ht htpos)

theorem normalized_main_resolvent_from_identity (F t I : ℕ → ℝ)
    (ht : Tendsto t atTop (𝓝 0))
    (hp : ∀ᶠ n in atTop, 0 < t n ∧ 1/(4*t n) ≤ I n)
    (hid : ∀ᶠ n in atTop, F n = ((t n/4)*(1-1/(I n)^2))/(t n)^2) :
    Tendsto (fun n => F n-1/(4*t n)) atTop (𝓝 0) := by
  have hh := resolvent_remainder_from_lower_bound t I ht hp
  apply hh.congr'
  filter_upwards [hp,hid] with n ⟨htn, hI⟩ hidn
  rw [hidn]
  have htne : t n ≠ 0 := ne_of_gt htn
  field_simp
end BesselWeights
