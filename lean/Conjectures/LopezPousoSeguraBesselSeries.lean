import Conjectures.LopezPousoSeguraBesselDecomp
open Filter
open scoped Topology
namespace BesselWeights

theorem resolvent_series_summable (a x : ℕ → ℝ) (t A c : ℝ)
    (ht : 0 < t) (hA : 0 ≤ A) (hc : 0 < c)
    (ha : ∀ᶠ (n : ℕ) in atTop, |a n| ≤ A*((n:ℝ)+1))
    (hx : ∀ᶠ (n : ℕ) in atTop, c*((n:ℝ)+1)^2 ≤ x n) :
    Summable (fun n => a n/(1+x n*t)^2) := by
  apply deviation_summable_of_cubic_bound _ (A/(c*t)^2)
  filter_upwards [ha,hx] with n han hxn
  let u : ℝ := (n:ℝ)+1
  have hu : 0 < u := by dsimp [u]; positivity
  have hxt : 0 < x n := lt_of_lt_of_le (by positivity) hxn
  have hden : 0 < 1+x n*t := by positivity
  have hbase : c*u^2*t ≤ 1+x n*t := by nlinarith
  have hbound : |a n|/(1+x n*t)^2 ≤ (A*u)/(c*u^2*t)^2 := by gcongr
  have heq : (A*u)/(c*u^2*t)^2 = (A/(c*t)^2)/u^3 := by
    field_simp
  rw [Real.norm_eq_abs, abs_div, abs_of_nonneg (sq_nonneg (1+x n*t))]
  simpa [u, heq] using hbound

theorem normalized_resolvent_difference_from_bounds (a b x y : ℕ → ℝ) (t : ℕ → ℝ) (A B c C : ℝ)
    (hA : 0 ≤ A) (hB : 0 ≤ B) (hc : 0 < c)
    (hx : ∀ k, 0 < x k) (hy : ∀ k, 0 < y k)
    (hδ : ∀ᶠ (n : ℕ) in atTop, ‖a n-b n‖ ≤ C/((n:ℝ)+1)^3)
    (ha : ∀ᶠ (n : ℕ) in atTop, |a n| ≤ A*((n:ℝ)+1))
    (hb : ∀ᶠ (n : ℕ) in atTop, |b n| ≤ A*((n:ℝ)+1))
    (hd : ∀ᶠ (n : ℕ) in atTop, |x n-y n| ≤ B/((n:ℝ)+1)^2)
    (hmin : ∀ᶠ (n : ℕ) in atTop, c*((n:ℝ)+1)^2 ≤ min (x n) (y n))
    (ht : Tendsto t atTop (𝓝 0)) (htpos : ∀ᶠ n in atTop, 0 < t n) :
    Tendsto (fun n => (∑' k, a k/(1+x k*t n)^2) - (∑' k, b k/(1+y k*t n)^2))
      atTop (𝓝 (∑' k, (a k-b k))) := by
  have hxl : ∀ᶠ (n : ℕ) in atTop, c*((n:ℝ)+1)^2 ≤ x n := hmin.mono (fun _ h => le_trans h (min_le_left _ _))
  have hyl : ∀ᶠ (n : ℕ) in atTop, c*((n:ℝ)+1)^2 ≤ y n := hmin.mono (fun _ h => le_trans h (min_le_right _ _))
  have hsa : ∀ᶠ n in atTop, Summable (fun k => a k/(1+x k*t n)^2) :=
    htpos.mono (fun _ h => resolvent_series_summable a x _ A c h hA hc ha hxl)
  have hsb : ∀ᶠ n in atTop, Summable (fun k => b k/(1+y k*t n)^2) :=
    htpos.mono (fun _ h => resolvent_series_summable b y _ A c h hA hc hb hyl)
  exact normalized_resolvent_difference_from_growth a b x y t A B c C hA hB hc hx hy hδ hb hd hmin ht
    (htpos.mono (fun _ h => h.le)) hsa hsb
end BesselWeights
