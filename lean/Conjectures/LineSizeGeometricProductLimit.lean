import Conjectures.LineSizeGeometricProductRescale

/-! Limits of the literal finite geometric product, with an arbitrary real
centering. The hypotheses concern its actual first and second moments.
The logarithmic error and the extra geometric factor are proved here. -/
noncomputable section
namespace LineSize.Geometric

open Real Filter
open scoped Topology

theorem linear_add (x y : ℝ) : linear (x + y) = linear x + linear y := by
  unfold linear
  push_cast
  ring

theorem linear_continuous : Continuous linear := by
  unfold linear
  fun_prop

theorem extra_perturbation_tendsto {α : Type*} {l : Filter α} {t : α → ℝ}
    (ht : Tendsto t l (𝓝 0)) (htpos : ∀ᶠ k in l, 0 < t k) (y : ℝ) :
    Tendsto (fun k => perturbation (exp (-t k)) (t k * sqrt (t k) * y)) l (𝓝 0) := by
  have hsqrt : Tendsto (fun k => sqrt (t k)) l (𝓝 0) := by
    simpa only [Real.sqrt_zero, Function.comp_def] using
      (Real.continuous_sqrt.tendsto 0).comp ht
  have hlim : Tendsto (fun k => sqrt (t k) * |y|) l (𝓝 0) := by
    simpa only [zero_mul] using hsqrt.mul_const |y|
  have hbound : ∀ᶠ k in l,
      ‖perturbation (exp (-t k)) (t k * sqrt (t k) * y)‖ ≤ sqrt (t k) * |y| := by
    filter_upwards [htpos] with k hk
    have h := parameter_perturbation_le 0 hk (t k * sqrt (t k) * y)
    have hs : 0 < sqrt (t k) := Real.sqrt_pos.mpr hk
    have hid : |t k * sqrt (t k) * y| / t k = sqrt (t k) * |y| := by
      rw [abs_mul, abs_of_pos (mul_pos hk hs)]
      field_simp
    simpa only [parameter, Nat.cast_zero, zero_add, mul_one, one_mul, hid] using h
  apply tendsto_zero_iff_norm_tendsto_zero.mpr
  exact squeeze_zero' (Filter.Eventually.of_forall (fun k => norm_nonneg _)) hbound hlim

theorem extra_factor_tendsto {α : Type*} {l : Filter α} {t : α → ℝ}
    (ht : Tendsto t l (𝓝 0)) (htpos : ∀ᶠ k in l, 0 < t k) (y : ℝ) :
    Tendsto (fun k => scalarFactor (exp (-t k)) (t k * sqrt (t k) * y)) l (𝓝 1) := by
  have hw := extra_perturbation_tendsto ht htpos y
  have h1 : Tendsto (fun _ : α => (1 : ℂ)) l (𝓝 1) := tendsto_const_nhds
  have hinv := (h1.sub hw).inv₀ (by norm_num : (1 : ℂ) - 0 ≠ 0)
  simp only [sub_zero, inv_one] at hinv
  apply hinv.congr'
  filter_upwards [htpos] with k hk
  have hq : exp (-t k) < 1 := by rw [Real.exp_lt_one_iff]; linarith
  exact (scalarFactor_eq_inv_one_sub hq _).symm

theorem centered_quadratic_rescaled (r : ℕ) {t : ℝ} (ht : 0 < t) (s y : ℝ) :
    linear (s * (t * sqrt t * y)) + quadratic r t (t * sqrt t * y) =
      linear ((t * sqrt t * (s + EulerKernel.weightedMean r t)) * y) -
        (((t ^ 3 * EulerKernel.weightedVariance r t) * y ^ 2 / 2 : ℝ) : ℂ) := by
  have hsq : (t * sqrt t * y) ^ 2 = t ^ 3 * y ^ 2 := by
    calc
      _ = t ^ 2 * (sqrt t) ^ 2 * y ^ 2 := by ring
      _ = _ := by rw [Real.sq_sqrt ht.le]; ring
  unfold quadratic
  rw [← add_sub_assoc, ← linear_add]
  have hm : s * (t * sqrt t * y) +
      (t * sqrt t * y) * EulerKernel.weightedMean r t =
      (t * sqrt t * (s + EulerKernel.weightedMean r t)) * y := by ring
  rw [hm, hsq]
  congr 2
  ring

theorem centered_product_tendsto {α : Type*} {l : Filter α}
    {r : α → ℕ} {t s : α → ℝ} {b m v : ℝ}
    (hb : 0 < b) (ht : Tendsto t l (𝓝 0)) (htpos : ∀ᶠ k in l, 0 < t k)
    (hr : ∀ᶠ k in l, (r k : ℝ) * t k ≤ b)
    (hm : Tendsto (fun k => t k * sqrt (t k) *
      (s k + EulerKernel.weightedMean (r k) (t k))) l (𝓝 m))
    (hv : Tendsto (fun k => t k ^ 3 * EulerKernel.weightedVariance (r k) (t k)) l (𝓝 v))
    (y : ℝ) :
    Tendsto (fun k => phase (s k * (t k * sqrt (t k) * y)) *
      characteristic (r k) (t k) (t k * sqrt (t k) * y) *
        scalarFactor (exp (-t k)) (t k * sqrt (t k) * y)) l
      (𝓝 (Complex.exp (linear (m * y) - ((v * y ^ 2 / 2 : ℝ) : ℂ)))) := by
  have hmean := (linear_continuous.tendsto (m * y)).comp (hm.mul_const y)
  have hvariance := (Complex.continuous_ofReal.tendsto (v * y ^ 2 / 2)).comp
    ((hv.mul_const (y ^ 2)).div_const 2)
  have hpoly := hmean.sub hvariance
  have herr := logarithm_scaled_error_tendsto hb ht htpos hr y
  have hsum := hpoly.add herr
  simp only [add_zero] at hsum
  have hlog : Tendsto (fun k =>
      linear (s k * (t k * sqrt (t k) * y)) +
        logarithm (r k) (t k) (t k * sqrt (t k) * y)) l
      (𝓝 (linear (m * y) - ((v * y ^ 2 / 2 : ℝ) : ℂ))) := by
    apply hsum.congr'
    filter_upwards [htpos] with k hk
    dsimp only [Function.comp_apply]
    rw [← centered_quadratic_rescaled (r k) hk (s k) y]
    ring
  have hexp := (Complex.continuous_exp.tendsto _).comp hlog
  have hresult := hexp.mul (extra_factor_tendsto ht htpos y)
  simp only [mul_one] at hresult
  apply hresult.congr'
  filter_upwards [htpos] with k hk
  dsimp only [Function.comp_apply]
  rw [Complex.exp_add, exp_logarithm (r k) hk, phase, linear]

end LineSize.Geometric
