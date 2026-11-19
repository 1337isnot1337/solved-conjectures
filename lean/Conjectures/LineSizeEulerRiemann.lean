import Conjectures.LineSizeEulerTrapezoid
import Conjectures.LineSizeEulerMoments

/-! Uniform Riemann errors for the literal geometric mean and variance.
The smooth values at zero are used only to justify quadrature; all sampled
arguments are strictly positive and agree with the literal quotients. -/
noncomputable section
namespace LineSize.EulerKernel

open Real Set MeasureTheory Finset
open scoped Interval

def rightSum (f : ℝ → ℝ) (r : ℕ) (t : ℝ) : ℝ :=
  ∑ j ∈ range r, f (((j : ℝ) + 1) * t)

theorem trapezoidal_rightSum (f : ℝ → ℝ) {r : ℕ} (hr : 0 < r) (t : ℝ) :
    trapezoidal_integral f r 0 ((r : ℝ) * t) =
      t * (rightSum f r t - (f ((r : ℝ) * t) - f 0) / 2) := by
  have hr0 : (r : ℝ) ≠ 0 := Nat.cast_ne_zero.mpr hr.ne'
  have harg (j : ℕ) :
      ((j : ℝ) + 1) * ((r : ℝ) * t) / (r : ℝ) = ((j : ℝ) + 1) * t := by
    field_simp [hr0]
  have hstep : ((r : ℝ) * t) / (r : ℝ) = t := by field_simp [hr0]
  have hsplit : rightSum f r t =
      (∑ j ∈ range (r - 1), f (((j : ℝ) + 1) * t)) + f ((r : ℝ) * t) := by
    unfold rightSum
    conv_lhs => rw [← Nat.sub_one_add_one_eq_of_pos hr]
    rw [sum_range_succ]
    congr 1
    congr 1
    simp only [Nat.cast_sub hr, Nat.cast_one, sub_add_cancel]
  simp only [trapezoidal_integral, sub_zero, zero_add, hstep, harg]
  rw [hsplit]
  ring

theorem rightSum_error_bound {f : ℝ → ℝ} (hf : ContDiff ℝ 2 f)
    {r : ℕ} {t D : ℝ} (hr : 0 < r) (ht : 0 < t) (hD : 0 ≤ D)
    (hbound : ∀ x ∈ Icc 0 ((r : ℝ) * t), |iteratedDeriv 2 f x| ≤ D) :
    |t * rightSum f r t - ∫ x in 0..((r : ℝ) * t), f x| ≤
      (r : ℝ) * t ^ 3 * D / 12 + t * |f ((r : ℝ) * t) - f 0| / 2 := by
  have hrpos : (0 : ℝ) < r := Nat.cast_pos.mpr hr
  have hu : 0 < (r : ℝ) * t := mul_pos hrpos ht
  have hbound' : ∀ x,
      |iteratedDerivWithin 2 f (uIcc 0 ((r : ℝ) * t)) x| ≤ D := by
    rw [uIcc_of_le hu.le]
    intro x
    by_cases hx : x ∈ Icc 0 ((r : ℝ) * t)
    · rw [iteratedDerivWithin_eq_iteratedDeriv (uniqueDiffOn_Icc hu) hf.contDiffAt hx]
      exact hbound x hx
    · rw [iteratedDerivWithin_succ, derivWithin_zero_of_notMem_closure
        (by rwa [closure_Icc]), abs_zero]
      exact hD
  have herr := trapezoidal_error_le_of_c2
    (f := f) (a := 0) (b := (r : ℝ) * t) hf.contDiffOn hbound' hr
  rw [trapezoidal_error, trapezoidal_rightSum f hr] at herr
  simp only [sub_zero, abs_of_pos hu] at herr
  have hright : ((r : ℝ) * t) ^ 3 * D / (12 * (r : ℝ) ^ 2) =
      (r : ℝ) * t ^ 3 * D / 12 := by
    field_simp
  rw [hright] at herr
  have hid : t * rightSum f r t - (∫ x in 0..((r : ℝ) * t), f x) =
      (t * (rightSum f r t - (f ((r : ℝ) * t) - f 0) / 2) -
        (∫ x in 0..((r : ℝ) * t), f x)) +
      t * (f ((r : ℝ) * t) - f 0) / 2 := by ring
  rw [hid]
  calc
    _ ≤ |t * (rightSum f r t - (f ((r : ℝ) * t) - f 0) / 2) -
        (∫ x in 0..((r : ℝ) * t), f x)| +
        |t * (f ((r : ℝ) * t) - f 0) / 2| := abs_add_le _ _
    _ ≤ (r : ℝ) * t ^ 3 * D / 12 + t * |f ((r : ℝ) * t) - f 0| / 2 := by
      rw [abs_div, abs_mul, abs_of_pos ht, abs_of_pos (by norm_num : (0 : ℝ) < 2)]
      exact add_le_add herr le_rfl

theorem rightSum_error_uniform {f : ℝ → ℝ} (hf : ContDiff ℝ 2 f)
    {b : ℝ} (hb : 0 < b) :
    ∃ C : ℝ, 0 < C ∧ ∀ (r : ℕ) (t : ℝ), 0 < t → t ≤ 1 → (r : ℝ) * t ≤ b →
      |t * rightSum f r t - ∫ x in 0..((r : ℝ) * t), f x| ≤ C * t := by
  obtain ⟨B, hBbound⟩ := isCompact_Icc.exists_bound_of_continuousOn hf.continuous.continuousOn
  obtain ⟨D, hDbound⟩ := isCompact_Icc.exists_bound_of_continuousOn
    (ContDiff.continuous_iteratedDeriv' 2 hf).continuousOn
  have hzero : (0 : ℝ) ∈ Icc 0 b := ⟨le_rfl, hb.le⟩
  have hB : 0 ≤ B := (norm_nonneg _).trans (hBbound 0 hzero)
  have hD : 0 ≤ D := (norm_nonneg _).trans (hDbound 0 hzero)
  refine ⟨b * D / 12 + B + 1, by positivity, ?_⟩
  intro r t ht ht1 hu
  rcases Nat.eq_zero_or_pos r with rfl | hr
  · simpa [rightSum] using
      (show (0 : ℝ) ≤ (b * D / 12 + B + 1) * t by positivity)
  have hrt : 0 ≤ (r : ℝ) * t := by positivity
  have hend : |f ((r : ℝ) * t) - f 0| ≤ 2 * B := by
    have h1 : |f ((r : ℝ) * t)| ≤ B := by
      simpa only [Real.norm_eq_abs] using hBbound ((r : ℝ) * t) ⟨hrt, hu⟩
    have h0 : |f 0| ≤ B := by simpa only [Real.norm_eq_abs] using hBbound 0 hzero
    exact (abs_sub _ _).trans (by linarith)
  have herr := rightSum_error_bound hf hr ht hD (fun x hx => by
    simpa only [Real.norm_eq_abs] using hDbound x ⟨hx.1, hx.2.trans hu⟩)
  have hquadratic : t ^ 2 ≤ t := by nlinarith
  calc
    _ ≤ (r : ℝ) * t ^ 3 * D / 12 + t * |f ((r : ℝ) * t) - f 0| / 2 := herr
    _ = ((r : ℝ) * t) * t ^ 2 * D / 12 + t * |f ((r : ℝ) * t) - f 0| / 2 := by ring
    _ ≤ b * t * D / 12 + t * (2 * B) / 2 := by gcongr
    _ ≤ (b * D / 12 + B + 1) * t := by nlinarith

theorem weightedMean_error_uniform {b : ℝ} (hb : 0 < b) :
    ∃ C : ℝ, 0 < C ∧ ∀ (r : ℕ) (t : ℝ), 0 < t → t ≤ 1 → (r : ℝ) * t ≤ b →
      |t ^ 2 * weightedMean r t -
        (∫ x in 0..((r : ℝ) * t), Profile.meanKernel x)| ≤ C * t := by
  obtain ⟨C, hC, hbound⟩ := rightSum_error_uniform (meanSmooth_contDiff 2) hb
  refine ⟨C, hC, ?_⟩
  intro r t ht ht1 hu
  have h := hbound r t ht ht1 hu
  rw [integral_meanSmooth (by positivity)] at h
  have hid : t ^ 2 * weightedMean r t = t * rightSum meanSmooth r t := by
    rw [pow_two, mul_assoc, scaled_weightedMean r ht]
    rfl
  rw [hid]
  exact h

theorem weightedVariance_error_uniform {b : ℝ} (hb : 0 < b) :
    ∃ C : ℝ, 0 < C ∧ ∀ (r : ℕ) (t : ℝ), 0 < t → t ≤ 1 → (r : ℝ) * t ≤ b →
      |t ^ 3 * weightedVariance r t - Profile.V ((r : ℝ) * t)| ≤ C * t := by
  obtain ⟨C, hC, hbound⟩ := rightSum_error_uniform (varianceSmooth_contDiff 2) hb
  refine ⟨C, hC, ?_⟩
  intro r t ht ht1 hu
  have h := hbound r t ht ht1 hu
  rw [integral_varianceSmooth (by positivity)] at h
  have hid : t ^ 3 * weightedVariance r t = t * rightSum varianceSmooth r t := by
    calc
      _ = t * (t ^ 2 * weightedVariance r t) := by ring
      _ = t * rightSum varianceSmooth r t := by rw [scaled_weightedVariance r ht]; rfl
  rw [hid]
  exact h

end LineSize.EulerKernel
