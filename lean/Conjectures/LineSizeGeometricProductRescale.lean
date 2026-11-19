import Conjectures.LineSizeGeometricProductLog

/-! Vanishing logarithmic error at the Fourier scale `t*sqrt(t)`.
The proof works along arbitrary filters and permits the product length
to vary, subject only to the stated eventual bound on `r*t`. -/
noncomputable section
namespace LineSize.Geometric

open Real Filter
open scoped Topology

theorem rescaled_cubic_identity {t : ℝ} (ht : 0 < t) (y : ℝ) :
    |t * sqrt t * y| ^ 3 / t ^ 4 = sqrt t * |y| ^ 3 := by
  have hs : 0 < sqrt t := Real.sqrt_pos.mpr ht
  have hs3 : sqrt t ^ 3 = sqrt t * t := by
    calc
      sqrt t ^ 3 = sqrt t * (sqrt t) ^ 2 := by ring
      _ = sqrt t * t := by rw [Real.sq_sqrt ht.le]
  rw [abs_mul, abs_of_pos (mul_pos ht hs), mul_pow, mul_pow, hs3]
  field_simp

theorem logarithm_scaled_error_bound {b t y : ℝ} (r : ℕ)
    (hb : 0 < b) (ht : 0 < t) (hr : (r : ℝ) * t ≤ b)
    (hy : sqrt t * |y| ≤ 1 / 2) (hby : b * (sqrt t * |y|) ≤ 1) :
    ‖logarithm r t (t * sqrt t * y) - quadratic r t (t * sqrt t * y)‖ ≤
      b * cubicConstant b * sqrt t * |y| ^ 3 := by
  have hs : 0 < sqrt t := Real.sqrt_pos.mpr ht
  have htheta : |t * sqrt t * y| ≤ t / 2 := by
    rw [abs_mul, abs_of_pos (mul_pos ht hs)]
    nlinarith [mul_le_mul_of_nonneg_left hy ht.le]
  have hbtheta : b * |t * sqrt t * y| ≤ t := by
    rw [abs_mul, abs_of_pos (mul_pos ht hs)]
    nlinarith [mul_le_mul_of_nonneg_left hby ht.le]
  have h := logarithm_quadratic_error r hb ht hr htheta hbtheta
  have hid : b * cubicConstant b * |t * sqrt t * y| ^ 3 / t ^ 4 =
      b * cubicConstant b * sqrt t * |y| ^ 3 := by
    calc
      _ = (b * cubicConstant b) * (|t * sqrt t * y| ^ 3 / t ^ 4) := by ring
      _ = _ := by rw [rescaled_cubic_identity ht]; ring
  rwa [hid] at h

theorem logarithm_scaled_error_tendsto {α : Type*} {l : Filter α}
    {r : α → ℕ} {t : α → ℝ} {b : ℝ}
    (hb : 0 < b) (ht : Tendsto t l (𝓝 0)) (htpos : ∀ᶠ k in l, 0 < t k)
    (hr : ∀ᶠ k in l, (r k : ℝ) * t k ≤ b) (y : ℝ) :
    Tendsto (fun k => logarithm (r k) (t k) (t k * sqrt (t k) * y) -
      quadratic (r k) (t k) (t k * sqrt (t k) * y)) l (𝓝 0) := by
  have hsqrt : Tendsto (fun k => sqrt (t k)) l (𝓝 0) := by
    simpa only [Real.sqrt_zero, Function.comp_def] using
      (Real.continuous_sqrt.tendsto 0).comp ht
  have hy : Tendsto (fun k => sqrt (t k) * |y|) l (𝓝 0) := by
    simpa only [zero_mul] using hsqrt.mul_const |y|
  have hc : Tendsto (fun _ : α => b) l (𝓝 b) := tendsto_const_nhds
  have hby : Tendsto (fun k => b * (sqrt (t k) * |y|)) l (𝓝 0) := by
    simpa only [mul_zero] using hc.mul hy
  have hsmall := hy.eventually (gt_mem_nhds (by norm_num : (0 : ℝ) < 1 / 2))
  have hbsmall := hby.eventually (gt_mem_nhds (by norm_num : (0 : ℝ) < 1))
  have hbound : ∀ᶠ k in l,
      ‖logarithm (r k) (t k) (t k * sqrt (t k) * y) -
        quadratic (r k) (t k) (t k * sqrt (t k) * y)‖ ≤
        b * cubicConstant b * sqrt (t k) * |y| ^ 3 := by
    filter_upwards [htpos, hr, hsmall, hbsmall] with k hk hkr hky hkby
    exact logarithm_scaled_error_bound (r k) hb hk hkr hky.le hkby.le
  have hC : Tendsto (fun _ : α => b * cubicConstant b) l (𝓝 (b * cubicConstant b)) :=
    tendsto_const_nhds
  have hlimit : Tendsto (fun k => b * cubicConstant b * sqrt (t k) * |y| ^ 3)
      l (𝓝 0) := by
    simpa only [mul_zero, zero_mul] using (hC.mul hsqrt).mul_const (|y| ^ 3)
  apply tendsto_zero_iff_norm_tendsto_zero.mpr
  exact squeeze_zero' (Filter.Eventually.of_forall (fun k => norm_nonneg _)) hbound hlimit

end LineSize.Geometric
