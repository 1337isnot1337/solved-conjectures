import Conjectures.LopezPousoSeguraBesselMajorant
open Filter
open scoped Topology
namespace BesselWeights

theorem normalized_resolvent_difference (a b x y : ℕ → ℝ) (t : ℕ → ℝ)
    (hx : ∀ k, 0 < x k) (hy : ∀ k, 0 < y k)
    (hδ : Summable (fun k => a k-b k))
    (hbound : Summable (fun k => 2 * |b k| * |x k-y k| / min (x k) (y k)))
    (ht : Tendsto t atTop (𝓝 0)) (htpos : ∀ᶠ n in atTop, 0 ≤ t n)
    (hsa : ∀ᶠ n in atTop, Summable (fun k => a k/(1+x k*t n)^2))
    (hsb : ∀ᶠ n in atTop, Summable (fun k => b k/(1+y k*t n)^2)) :
    Tendsto (fun n => (∑' k, a k/(1+x k*t n)^2) - (∑' k, b k/(1+y k*t n)^2))
      atTop (𝓝 (∑' k, (a k-b k))) := by
  have hδlim := deviation_resolvent_tendsto (fun k => a k-b k) x t hδ (fun k => (hx k).le) ht htpos
  have hcorr := denominator_correction_tendsto b x y t hx hy hbound ht htpos
  have hsum := hδlim.add hcorr
  have hsum' : Tendsto (fun n => (∑' k, (a k-b k)/(1+x k*t n)^2) +
      (∑' k, b k*(1/(1+x k*t n)^2-1/(1+y k*t n)^2))) atTop (𝓝 (∑' k, (a k-b k))) := by
    simpa using hsum
  apply hsum'.congr'
  filter_upwards [htpos,hsa,hsb] with n hn hnan hnbn
  have hdsum : Summable (fun k => (a k-b k)/(1+x k*t n)^2) := by
    apply hδ.norm.of_norm_bounded
    intro k
    have hd : 1 ≤ (1+x k*t n)^2 := by
      have hm := mul_nonneg (hx k).le hn
      nlinarith [sq_nonneg (x k*t n)]
    have hp : 0 ≤ (1+x k*t n)^2 := sq_nonneg _
    rw [Real.norm_eq_abs, abs_div, abs_of_nonneg hp]
    simpa [Real.norm_eq_abs] using div_le_self (abs_nonneg (a k-b k)) hd
  have hcsum : Summable (fun k => b k*(1/(1+x k*t n)^2-1/(1+y k*t n)^2)) := by
    apply hbound.of_norm_bounded
    intro k
    rw [Real.norm_eq_abs, abs_mul]
    have hh := mul_le_mul_of_nonneg_left (reciprocal_square_abs_bound (x k) (y k) (t n) (hx k) (hy k) hn) (abs_nonneg (b k))
    convert hh using 1 <;> ring
  have heq : ∀ k, a k/(1+x k*t n)^2 - b k/(1+y k*t n)^2 =
      (a k-b k)/(1+x k*t n)^2 + b k*(1/(1+x k*t n)^2-1/(1+y k*t n)^2) := by
    intro k
    ring
  have hh : (∑' k, (a k/(1+x k*t n)^2 - b k/(1+y k*t n)^2)) =
      (∑' k, ((a k-b k)/(1+x k*t n)^2 + b k*(1/(1+x k*t n)^2-1/(1+y k*t n)^2))) := tsum_congr heq
  rw [hnan.tsum_sub hnbn, hdsum.tsum_add hcsum] at hh
  exact hh.symm

theorem normalized_resolvent_difference_from_growth (a b x y : ℕ → ℝ) (t : ℕ → ℝ) (A B c C : ℝ)
    (hA : 0 ≤ A) (hB : 0 ≤ B) (hc : 0 < c)
    (hx : ∀ k, 0 < x k) (hy : ∀ k, 0 < y k)
    (hδ : ∀ᶠ (n : ℕ) in atTop, ‖a n-b n‖ ≤ C/((n:ℝ)+1)^3)
    (hb : ∀ᶠ (n : ℕ) in atTop, |b n| ≤ A*((n:ℝ)+1))
    (hd : ∀ᶠ (n : ℕ) in atTop, |x n-y n| ≤ B/((n:ℝ)+1)^2)
    (hmin : ∀ᶠ (n : ℕ) in atTop, c*((n:ℝ)+1)^2 ≤ min (x n) (y n))
    (ht : Tendsto t atTop (𝓝 0)) (htpos : ∀ᶠ n in atTop, 0 ≤ t n)
    (hsa : ∀ᶠ n in atTop, Summable (fun k => a k/(1+x k*t n)^2))
    (hsb : ∀ᶠ n in atTop, Summable (fun k => b k/(1+y k*t n)^2)) :
    Tendsto (fun n => (∑' k, a k/(1+x k*t n)^2) - (∑' k, b k/(1+y k*t n)^2))
      atTop (𝓝 (∑' k, (a k-b k))) :=
  normalized_resolvent_difference a b x y t hx hy
    (deviation_summable_of_cubic_bound (fun k => a k-b k) C hδ)
    (denominator_majorant_summable b x y A B c hA hB hc hb hd hmin) ht htpos hsa hsb
end BesselWeights
