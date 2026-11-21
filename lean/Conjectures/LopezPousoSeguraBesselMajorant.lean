import Conjectures.LopezPousoSeguraBesselDenominator
open Filter
open scoped Topology
namespace BesselWeights

theorem denominator_majorant_summable (a x y : ℕ → ℝ) (A B c : ℝ)
    (hA : 0 ≤ A) (hB : 0 ≤ B) (hc : 0 < c)
    (ha : ∀ᶠ (n : ℕ) in atTop, |a n| ≤ A*((n:ℝ)+1))
    (hd : ∀ᶠ (n : ℕ) in atTop, |x n-y n| ≤ B/((n:ℝ)+1)^2)
    (hmin : ∀ᶠ (n : ℕ) in atTop, c*((n:ℝ)+1)^2 ≤ min (x n) (y n)) :
    Summable (fun n => 2 * |a n| * |x n-y n| / min (x n) (y n)) := by
  apply deviation_summable_of_cubic_bound _ (2*A*B/c)
  filter_upwards [ha,hd,hmin] with n han hdn hmn
  let u : ℝ := (n:ℝ)+1
  have hu : 0 < u := by dsimp [u]; positivity
  have hminpos : 0 < min (x n) (y n) := lt_of_lt_of_le (by positivity) hmn
  have hbound : 2 * |a n| * |x n-y n| / min (x n) (y n) ≤
      (2*(A*u)*(B/u^2))/(c*u^2) := by
    gcongr
  have heq : (2*(A*u)*(B/u^2))/(c*u^2) = (2*A*B/c)/u^3 := by
    field_simp
  have hnon : 0 ≤ 2 * |a n| * |x n-y n| / min (x n) (y n) := by positivity
  rw [Real.norm_eq_abs, abs_of_nonneg hnon]
  simpa [u, heq] using hbound

theorem denominator_correction_from_growth (a x y : ℕ → ℝ) (t : ℕ → ℝ) (A B c : ℝ)
    (hA : 0 ≤ A) (hB : 0 ≤ B) (hc : 0 < c)
    (hx : ∀ k, 0 < x k) (hy : ∀ k, 0 < y k)
    (ha : ∀ᶠ (n : ℕ) in atTop, |a n| ≤ A*((n:ℝ)+1))
    (hd : ∀ᶠ (n : ℕ) in atTop, |x n-y n| ≤ B/((n:ℝ)+1)^2)
    (hmin : ∀ᶠ (n : ℕ) in atTop, c*((n:ℝ)+1)^2 ≤ min (x n) (y n))
    (ht : Tendsto t atTop (𝓝 0)) (htpos : ∀ᶠ n in atTop, 0 ≤ t n) :
    Tendsto (fun n => ∑' k, a k*(1/(1+x k*t n)^2-1/(1+y k*t n)^2)) atTop (𝓝 0) :=
  denominator_correction_tendsto a x y t hx hy
    (denominator_majorant_summable a x y A B c hA hB hc ha hd hmin) ht htpos
end BesselWeights
