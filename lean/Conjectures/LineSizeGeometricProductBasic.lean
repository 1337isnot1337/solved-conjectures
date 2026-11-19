import Conjectures.LineSizeGeometricCharacteristic
import Conjectures.LineSizeEulerMoments

/-! The literal finite product of geometric characteristic factors.
The logarithmic representation uses the principal logarithm of each
nonzero factor separately, so no assertion about a logarithm of a product
or its branch is required. -/
noncomputable section
namespace LineSize.Geometric

open Real Finset

def parameter (j : ℕ) (t : ℝ) : ℝ := exp (-t * ((j : ℝ) + 1))

theorem parameter_pos (j : ℕ) (t : ℝ) : 0 < parameter j t := Real.exp_pos _

theorem parameter_lt_one (j : ℕ) {t : ℝ} (ht : 0 < t) : parameter j t < 1 := by
  unfold parameter
  rw [Real.exp_lt_one_iff]
  have hj : 0 < (j : ℝ) + 1 := by positivity
  nlinarith

theorem parameter_mean (j : ℕ) {t : ℝ} (ht : 0 < t) :
    parameter j t / (1 - parameter j t) =
      1 / (exp (((j : ℝ) + 1) * t) - 1) := by
  have hx : 0 < ((j : ℝ) + 1) * t := by positivity
  have he : exp (((j : ℝ) + 1) * t) ≠ 0 := (Real.exp_pos _).ne'
  have hd : exp (((j : ℝ) + 1) * t) - 1 ≠ 0 :=
    (Profile.exp_sub_one_pos hx).ne'
  unfold parameter
  rw [show -t * ((j : ℝ) + 1) = -(((j : ℝ) + 1) * t) by ring, Real.exp_neg]
  field_simp

theorem parameter_variance (j : ℕ) {t : ℝ} (ht : 0 < t) :
    parameter j t / (1 - parameter j t) ^ 2 =
      exp (((j : ℝ) + 1) * t) / (exp (((j : ℝ) + 1) * t) - 1) ^ 2 := by
  have hx : 0 < ((j : ℝ) + 1) * t := by positivity
  have he : exp (((j : ℝ) + 1) * t) ≠ 0 := (Real.exp_pos _).ne'
  have hd : exp (((j : ℝ) + 1) * t) - 1 ≠ 0 :=
    (Profile.exp_sub_one_pos hx).ne'
  unfold parameter
  rw [show -t * ((j : ℝ) + 1) = -(((j : ℝ) + 1) * t) by ring, Real.exp_neg]
  field_simp

theorem parameter_mean_le (j : ℕ) {t : ℝ} (ht : 0 < t) :
    parameter j t / (1 - parameter j t) ≤ 1 / (((j : ℝ) + 1) * t) := by
  rw [parameter_mean j ht]
  apply one_div_le_one_div_of_le (by positivity)
  have h := Real.add_one_le_exp (((j : ℝ) + 1) * t)
  linarith

theorem parameter_perturbation_le (j : ℕ) {t : ℝ} (ht : 0 < t) (theta : ℝ) :
    ‖perturbation (parameter j t) (((j : ℝ) + 1) * theta)‖ ≤ |theta| / t := by
  have hj : 0 < (j : ℝ) + 1 := by positivity
  calc
    _ ≤ (parameter j t / (1 - parameter j t)) * |((j : ℝ) + 1) * theta| :=
      perturbation_norm (parameter_pos j t).le (parameter_lt_one j ht) _
    _ ≤ (1 / (((j : ℝ) + 1) * t)) * |((j : ℝ) + 1) * theta| :=
      mul_le_mul_of_nonneg_right (parameter_mean_le j ht) (abs_nonneg _)
    _ = |theta| / t := by
      rw [abs_mul, abs_of_pos hj]
      field_simp

def characteristic (r : ℕ) (t theta : ℝ) : ℂ :=
  ∏ j ∈ range r, scalarFactor (parameter j t) (((j : ℝ) + 1) * theta)

def logarithm (r : ℕ) (t theta : ℝ) : ℂ :=
  ∑ j ∈ range r, Complex.log (scalarFactor (parameter j t) (((j : ℝ) + 1) * theta))

theorem characteristic_ne_zero (r : ℕ) {t : ℝ} (ht : 0 < t) (theta : ℝ) :
    characteristic r t theta ≠ 0 := by
  apply Finset.prod_ne_zero_iff.mpr
  intro j _hj
  exact scalarFactor_ne_zero (parameter_pos j t).le (parameter_lt_one j ht) _

theorem exp_logarithm (r : ℕ) {t : ℝ} (ht : 0 < t) (theta : ℝ) :
    Complex.exp (logarithm r t theta) = characteristic r t theta := by
  unfold logarithm characteristic
  rw [Complex.exp_sum]
  apply Finset.prod_congr rfl
  intro j _hj
  exact Complex.exp_log (scalarFactor_ne_zero (parameter_pos j t).le
    (parameter_lt_one j ht) _)

theorem characteristic_norm (r : ℕ) {t : ℝ} (ht : 0 < t) (theta : ℝ) :
    ‖characteristic r t theta‖ =
      ∏ j ∈ range r, Fourier.geometricMajorant
        (exp (-t * ((j : ℝ) + 1))) (((j : ℝ) + 1) * theta) := by
  unfold characteristic
  rw [norm_prod]
  apply Finset.prod_congr rfl
  intro j _hj
  exact scalarFactor_norm_majorant (parameter_pos j t).le (parameter_lt_one j ht) _

theorem characteristic_norm_le_one (r : ℕ) {t : ℝ} (ht : 0 < t) (theta : ℝ) :
    ‖characteristic r t theta‖ ≤ 1 := by
  rw [characteristic_norm r ht]
  apply Finset.prod_le_one
  · intro j _hj
    exact (Fourier.geometricMajorant_pos (Real.exp_pos _).le).le
  · intro j _hj
    exact Fourier.geometricMajorant_le_one (Real.exp_pos _).le

theorem characteristic_continuous (r : ℕ) {t : ℝ} (ht : 0 < t) :
    Continuous (characteristic r t) := by
  unfold characteristic
  apply continuous_finset_prod
  intro j _hj
  exact (scalarFactor_continuous (parameter_pos j t).le (parameter_lt_one j ht)).comp
    (continuous_const.mul continuous_id)

end LineSize.Geometric
