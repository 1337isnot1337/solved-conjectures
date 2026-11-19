import Conjectures.LineSizeGeometricCharacteristic

/-! A quantitative second-order logarithmic expansion of the actual
geometric characteristic factor. The error is explicit in its parameter;
no limiting distribution or local limit theorem is assumed. -/
noncomputable section
namespace LineSize.Geometric

open Finset

def linear (x : ℝ) : ℂ := Complex.I * (x : ℂ)

@[simp] theorem linear_norm (x : ℝ) : ‖linear x‖ = |x| := by
  simp [linear, Complex.norm_real, Real.norm_eq_abs]

theorem linear_sq (x : ℝ) : (linear x) ^ 2 = -((x ^ 2 : ℝ) : ℂ) := by
  simp [linear, mul_pow, Complex.I_sq]

theorem phase_quadratic_error {x : ℝ} (hx : |x| ≤ 1) :
    ‖phase x - 1 - linear x‖ ≤ |x| ^ 2 := by
  have h := Complex.norm_exp_sub_one_sub_id_le (x := linear x)
    (by simpa only [linear_norm] using hx)
  rw [linear_norm] at h
  simpa only [phase, linear] using h

theorem phase_cubic_error {x : ℝ} (hx : |x| ≤ 1) :
    ‖phase x - 1 - linear x + ((x ^ 2 : ℝ) : ℂ) / 2‖ ≤
      Real.exp 1 * |x| ^ 3 := by
  have hsum : (∑ j ∈ range 3, linear x ^ j / (j.factorial : ℂ)) =
      1 + linear x - ((x ^ 2 : ℝ) : ℂ) / 2 := by
    simp only [sum_range_succ, sum_range_zero, pow_zero, pow_one, Nat.factorial,
      Nat.cast_one, Nat.cast_mul, div_one, zero_add, linear_sq]
    ring
  have hid : phase x - 1 - linear x + ((x ^ 2 : ℝ) : ℂ) / 2 =
      Complex.exp (linear x) - ∑ j ∈ range 3, linear x ^ j / (j.factorial : ℂ) := by
    rw [hsum]
    change Complex.exp (linear x) - 1 - linear x + ((x ^ 2 : ℝ) : ℂ) / 2 = _
    ring
  rw [hid]
  calc
    _ ≤ ‖linear x‖ ^ 3 * Real.exp ‖linear x‖ :=
      Complex.norm_exp_sub_sum_le_norm_mul_exp _ 3
    _ = |x| ^ 3 * Real.exp |x| := by rw [linear_norm]
    _ ≤ |x| ^ 3 * Real.exp 1 := by gcongr
    _ = Real.exp 1 * |x| ^ 3 := by ring

theorem inverse_log_quadratic_error {w : ℂ} (hw : ‖w‖ ≤ 1 / 2) :
    ‖Complex.log (1 - w)⁻¹ - (w + w ^ 2 / 2)‖ ≤ (2 / 3 : ℝ) * ‖w‖ ^ 3 := by
  have hw1 : ‖w‖ < 1 := lt_of_le_of_lt hw (by norm_num)
  have h := Complex.norm_log_one_sub_inv_add_logTaylor_neg_le 2 hw1
  have hpoly : Complex.logTaylor 3 (-w) = -w - w ^ 2 / 2 := by
    simp only [Complex.logTaylor, sum_range_succ, sum_range_zero, pow_zero,
      pow_one, Nat.cast_zero, Nat.cast_one, Nat.cast_ofNat, div_zero, div_one,
      zero_add]
    ring
  have hid : Complex.log (1 - w)⁻¹ + Complex.logTaylor 3 (-w) =
      Complex.log (1 - w)⁻¹ - (w + w ^ 2 / 2) := by rw [hpoly]; ring
  norm_num only at h
  rw [hid] at h
  have hinv : (1 - ‖w‖)⁻¹ ≤ 2 := by
    rw [inv_eq_one_div, div_le_iff₀ (sub_pos.mpr hw1)]
    linarith
  calc
    _ ≤ ‖w‖ ^ 3 * (1 - ‖w‖)⁻¹ / 3 := h
    _ ≤ ‖w‖ ^ 3 * 2 / 3 := by gcongr
    _ = (2 / 3 : ℝ) * ‖w‖ ^ 3 := by ring

theorem perturbation_linear_error {q x : ℝ} (hq : 0 ≤ q) (hq1 : q < 1)
    (hx : |x| ≤ 1) :
    ‖perturbation q x - ((q / (1 - q) : ℝ) : ℂ) * linear x‖ ≤
      q / (1 - q) * |x| ^ 2 := by
  have ha : 0 ≤ q / (1 - q) := div_nonneg hq (sub_pos.mpr hq1).le
  have hid : perturbation q x - ((q / (1 - q) : ℝ) : ℂ) * linear x =
      ((q / (1 - q) : ℝ) : ℂ) * (phase x - 1 - linear x) := by
    unfold perturbation
    push_cast
    ring
  rw [hid, norm_mul]
  have hnorm : ‖((q / (1 - q) : ℝ) : ℂ)‖ = q / (1 - q) :=
    Complex.norm_of_nonneg ha
  rw [hnorm]
  exact mul_le_mul_of_nonneg_left (phase_quadratic_error hx) ha

theorem perturbation_cubic_error {q x : ℝ} (hq : 0 ≤ q) (hq1 : q < 1)
    (hx : |x| ≤ 1) :
    ‖perturbation q x - ((q / (1 - q) : ℝ) : ℂ) * linear x +
      ((q / (1 - q) * x ^ 2 / 2 : ℝ) : ℂ)‖ ≤
      (q / (1 - q)) * Real.exp 1 * |x| ^ 3 := by
  have ha : 0 ≤ q / (1 - q) := div_nonneg hq (sub_pos.mpr hq1).le
  have hid : perturbation q x - ((q / (1 - q) : ℝ) : ℂ) * linear x +
      ((q / (1 - q) * x ^ 2 / 2 : ℝ) : ℂ) =
      ((q / (1 - q) : ℝ) : ℂ) *
        (phase x - 1 - linear x + ((x ^ 2 : ℝ) : ℂ) / 2) := by
    unfold perturbation
    push_cast
    ring
  rw [hid, norm_mul, Complex.norm_of_nonneg ha]
  calc
    _ ≤ (q / (1 - q)) * (Real.exp 1 * |x| ^ 3) :=
      mul_le_mul_of_nonneg_left (phase_cubic_error hx) ha
    _ = (q / (1 - q)) * Real.exp 1 * |x| ^ 3 := by ring

theorem perturbation_square_error {q x : ℝ} (hq : 0 ≤ q) (hq1 : q < 1)
    (hx : |x| ≤ 1) :
    ‖(perturbation q x) ^ 2 - (((q / (1 - q) : ℝ) : ℂ) * linear x) ^ 2‖ ≤
      2 * (q / (1 - q)) ^ 2 * |x| ^ 3 := by
  let a : ℝ := q / (1 - q)
  let w := perturbation q x
  let l : ℂ := (a : ℂ) * linear x
  have ha : 0 ≤ a := div_nonneg hq (sub_pos.mpr hq1).le
  have hl : ‖l‖ = a * |x| := by
    dsimp only [l]
    rw [norm_mul, Complex.norm_of_nonneg ha, linear_norm]
  have hlinear : ‖w - l‖ ≤ a * |x| ^ 2 := by
    simpa only [w, l, a]
      using perturbation_linear_error hq hq1 hx
  have hw : ‖w‖ ≤ a * |x| := perturbation_norm hq hq1 x
  change ‖w ^ 2 - l ^ 2‖ ≤ 2 * a ^ 2 * |x| ^ 3
  rw [show w ^ 2 - l ^ 2 = (w - l) * (w + l) by ring, norm_mul]
  calc
    _ ≤ (a * |x| ^ 2) * (‖w‖ + ‖l‖) := mul_le_mul hlinear (norm_add_le _ _) (by positivity) (by positivity)
    _ ≤ (a * |x| ^ 2) * (a * |x| + a * |x|) := by rw [hl]; gcongr
    _ = 2 * a ^ 2 * |x| ^ 3 := by ring

theorem scalarFactor_log_quadratic_error {q x : ℝ}
    (hq : 0 ≤ q) (hq1 : q < 1) (hx : |x| ≤ 1)
    (hw : ‖perturbation q x‖ ≤ 1 / 2) :
    ‖Complex.log (scalarFactor q x) -
      (((q / (1 - q) : ℝ) : ℂ) * linear x -
        ((q / (1 - q) ^ 2 * x ^ 2 / 2 : ℝ) : ℂ))‖ ≤
      (Real.exp 1 * (q / (1 - q)) + (q / (1 - q)) ^ 2 +
        (2 / 3 : ℝ) * (q / (1 - q)) ^ 3) * |x| ^ 3 := by
  let a : ℝ := q / (1 - q)
  let w := perturbation q x
  let l : ℂ := (a : ℂ) * linear x
  have ha : 0 ≤ a := div_nonneg hq (sub_pos.mpr hq1).le
  have hl2 : l ^ 2 = -((a ^ 2 * x ^ 2 : ℝ) : ℂ) := by
    dsimp only [l]
    rw [mul_pow, linear_sq]
    push_cast
    ring
  have hparam : a + a ^ 2 = q / (1 - q) ^ 2 := by
    dsimp [a]
    field_simp
    <;> ring
  let target : ℂ := l - (((a + a ^ 2) * x ^ 2 / 2 : ℝ) : ℂ)
  have hid : w + w ^ 2 / 2 - target =
      (w - l + ((a * x ^ 2 / 2 : ℝ) : ℂ)) + (w ^ 2 - l ^ 2) / 2 := by
    rw [hl2]
    dsimp [target]
    push_cast
    ring
  have hpoly : ‖w + w ^ 2 / 2 - target‖ ≤
      (Real.exp 1 * a + a ^ 2) * |x| ^ 3 := by
    have h1 : ‖w - l + ((a * x ^ 2 / 2 : ℝ) : ℂ)‖ ≤ a * Real.exp 1 * |x| ^ 3 := by
      simpa only [w, l, a]
        using perturbation_cubic_error hq hq1 hx
    have h2 : ‖w ^ 2 - l ^ 2‖ ≤ 2 * a ^ 2 * |x| ^ 3 := by
      simpa only [w, l, a]
        using perturbation_square_error hq hq1 hx
    rw [hid]
    calc
      _ ≤ ‖w - l + ((a * x ^ 2 / 2 : ℝ) : ℂ)‖ + ‖(w ^ 2 - l ^ 2) / 2‖ := norm_add_le _ _
      _ = ‖w - l + ((a * x ^ 2 / 2 : ℝ) : ℂ)‖ + ‖w ^ 2 - l ^ 2‖ / 2 := by norm_num [norm_div]
      _ ≤ a * Real.exp 1 * |x| ^ 3 + (2 * a ^ 2 * |x| ^ 3) / 2 := by gcongr
      _ = (Real.exp 1 * a + a ^ 2) * |x| ^ 3 := by ring
  have hlog : ‖Complex.log (scalarFactor q x) - (w + w ^ 2 / 2)‖ ≤
      (2 / 3 : ℝ) * a ^ 3 * |x| ^ 3 := by
    rw [scalarFactor_eq_inv_one_sub hq1]
    calc
      _ ≤ (2 / 3 : ℝ) * ‖w‖ ^ 3 := inverse_log_quadratic_error hw
      _ ≤ (2 / 3 : ℝ) * (a * |x|) ^ 3 := by gcongr; exact perturbation_norm hq hq1 x
      _ = (2 / 3 : ℝ) * a ^ 3 * |x| ^ 3 := by ring
  have htarget : target = ((q / (1 - q) : ℝ) : ℂ) * linear x -
      ((q / (1 - q) ^ 2 * x ^ 2 / 2 : ℝ) : ℂ) := by
    dsimp [target, l]
    rw [hparam]
    rfl
  rw [← htarget]
  have hsplit : Complex.log (scalarFactor q x) - target =
      (Complex.log (scalarFactor q x) - (w + w ^ 2 / 2)) +
        (w + w ^ 2 / 2 - target) := by ring
  rw [hsplit]
  calc
    _ ≤ ‖Complex.log (scalarFactor q x) - (w + w ^ 2 / 2)‖ +
      ‖w + w ^ 2 / 2 - target‖ := norm_add_le _ _
    _ ≤ (2 / 3 : ℝ) * a ^ 3 * |x| ^ 3 +
      (Real.exp 1 * a + a ^ 2) * |x| ^ 3 := add_le_add hlog hpoly
    _ = _ := by dsimp [a]; ring

end LineSize.Geometric
