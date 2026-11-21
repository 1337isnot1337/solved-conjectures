import Conjectures.LopezPousoSeguraBesselSummable
namespace BesselWeights

theorem reciprocal_square_difference_bound (x y t : ℝ) (hx : 0 < x) (hxy : x ≤ y) (ht : 0 ≤ t) :
    0 ≤ 1/(1+x*t)^2 - 1/(1+y*t)^2 ∧
      1/(1+x*t)^2 - 1/(1+y*t)^2 ≤ 2*(y-x)/x := by
  have ha : 0 < 1+x*t := by positivity
  have hy : 0 < y := lt_of_lt_of_le hx hxy
  have hb : 0 < 1+y*t := by positivity
  have hab : 1+x*t ≤ 1+y*t := by nlinarith [mul_nonneg (sub_nonneg.mpr hxy) ht]
  have ia : 0 < 1/(1+x*t) := by positivity
  have ib : 0 < 1/(1+y*t) := by positivity
  have iba : 1/(1+y*t) ≤ 1/(1+x*t) := by gcongr
  have ia1 : 1/(1+x*t) ≤ 1 := by
    apply (div_le_one ha).2
    nlinarith [mul_nonneg hx.le ht]
  have ib1 : 1/(1+y*t) ≤ 1 := le_trans iba ia1
  have hdiff : 1/(1+x*t)-1/(1+y*t) ≤ (y-x)/x := by
    have he : 1/(1+x*t)-1/(1+y*t) = ((y-x)*t)/((1+x*t)*(1+y*t)) := by
      field_simp [ne_of_gt ha, ne_of_gt hb]
      ring
    rw [he]
    apply (div_le_div_iff₀ (mul_pos ha hb) hx).2
    have h1 : 0 ≤ (y-x)*t*x*((1+y*t)-1) := mul_nonneg (by positivity) (by nlinarith [mul_nonneg (le_trans hx.le hxy) ht])
    have h2 : 0 ≤ (y-x)*(1+y*t) := mul_nonneg (sub_nonneg.mpr hxy) hb.le
    nlinarith
  have hprod : 0 ≤ 1/(1+x*t)-1/(1+y*t) := sub_nonneg.mpr iba
  have hfactor :
      1/(1+x*t)^2 - 1/(1+y*t)^2 =
        (1/(1+x*t)-1/(1+y*t))*(1/(1+x*t)+1/(1+y*t)) := by
    field_simp [ne_of_gt ha, ne_of_gt hb]
    ring
  rw [hfactor]
  constructor
  · positivity
  · have hsum : 1/(1+x*t)+1/(1+y*t) ≤ 2 := by linarith
    have h1 := mul_le_mul_of_nonneg_left hsum hprod
    have h2 := mul_le_mul_of_nonneg_left hdiff (show (0:ℝ) ≤ 2 by norm_num)
    calc
      _ ≤ (1/(1+x*t)-1/(1+y*t))*2 := h1
      _ = 2*(1/(1+x*t)-1/(1+y*t)) := by ring
      _ ≤ 2*((y-x)/x) := h2
      _ = 2*(y-x)/x := by ring

theorem reciprocal_square_abs_bound (x y t : ℝ) (hx : 0 < x) (hy : 0 < y) (ht : 0 ≤ t) :
    |1/(1+x*t)^2 - 1/(1+y*t)^2| ≤ 2*|x-y|/(min x y) := by
  by_cases hxy : x ≤ y
  · have hh := reciprocal_square_difference_bound x y t hx hxy ht
    have hsub : |x-y| = y-x := by rw [abs_of_nonpos (sub_nonpos.mpr hxy)]; ring
    rw [abs_of_nonneg hh.1, hsub, min_eq_left hxy]
    exact hh.2
  · have hyx : y ≤ x := le_of_not_ge hxy
    have hh := reciprocal_square_difference_bound y x t hy hyx ht
    have hsub : |x-y| = x-y := abs_of_nonneg (sub_nonneg.mpr hyx)
    rw [abs_sub_comm, abs_of_nonneg hh.1, hsub, min_eq_right hyx]
    exact hh.2

open Filter
open scoped Topology

theorem denominator_correction_tendsto (a x y : ℕ → ℝ) (t : ℕ → ℝ)
    (hx : ∀ k, 0 < x k) (hy : ∀ k, 0 < y k)
    (hbound : Summable (fun k => 2 * |a k| * |x k-y k| / (min (x k) (y k))))
    (ht : Tendsto t atTop (𝓝 0)) (htpos : ∀ᶠ n in atTop, 0 ≤ t n) :
    Tendsto (fun n => ∑' k, a k*(1/(1+x k*t n)^2-1/(1+y k*t n)^2)) atTop (𝓝 0) := by
  have hh : Tendsto (fun n => ∑' k, a k*(1/(1+x k*t n)^2-1/(1+y k*t n)^2)) atTop (𝓝 (∑' _ : ℕ, (0:ℝ))) := by
    apply tendsto_tsum_of_dominated_convergence hbound
    · intro k
      have hc : ContinuousAt (fun z : ℝ => a k*(1/(1+x k*z)^2-1/(1+y k*z)^2)) 0 := by
        fun_prop (disch := norm_num)
      have hh := hc.tendsto.comp ht
      simpa [Function.comp_def] using hh
    · filter_upwards [htpos] with n hn k
      rw [Real.norm_eq_abs, abs_mul]
      have hb := reciprocal_square_abs_bound (x k) (y k) (t n) (hx k) (hy k) hn
      have hm := mul_le_mul_of_nonneg_left hb (abs_nonneg (a k))
      convert hm using 1 <;> ring
  simpa using hh
end BesselWeights
