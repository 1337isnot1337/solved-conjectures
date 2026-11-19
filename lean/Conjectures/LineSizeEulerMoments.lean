import Conjectures.LineSizeEulerKernel
import Conjectures.LineSizeAnalyticProfileIntegral

/-! Smooth extensions of the two geometric moment kernels. The literal
quotients in the profile have value zero at the origin; these extensions have
the correct continuous value one and the same interval integrals. -/
noncomputable section
namespace LineSize.EulerKernel

open Real Set MeasureTheory Finset

def meanSmooth (x : ℝ) : ℝ := exp (-x) / meanExp x
def varianceSmooth (x : ℝ) : ℝ := exp (-x) / (meanExp x) ^ 2

@[simp] theorem meanSmooth_zero : meanSmooth 0 = 1 := by simp [meanSmooth]
@[simp] theorem varianceSmooth_zero : varianceSmooth 0 = 1 := by simp [varianceSmooth]

theorem meanSmooth_pos (x : ℝ) : 0 < meanSmooth x :=
  div_pos (Real.exp_pos _) (meanExp_pos x)

theorem varianceSmooth_pos (x : ℝ) : 0 < varianceSmooth x :=
  div_pos (Real.exp_pos _) (sq_pos_of_pos (meanExp_pos x))

theorem meanSmooth_contDiff (n : ℕ) : ContDiff ℝ n meanSmooth := by
  have he : ContDiff ℝ n (fun x : ℝ => exp (-x)) := contDiff_id.neg.exp
  exact he.div (meanExp_contDiff n) (fun x => (meanExp_pos x).ne')

theorem varianceSmooth_contDiff (n : ℕ) : ContDiff ℝ n varianceSmooth := by
  have he : ContDiff ℝ n (fun x : ℝ => exp (-x)) := contDiff_id.neg.exp
  exact he.div ((meanExp_contDiff n).pow 2) (fun x => pow_ne_zero _ (meanExp_pos x).ne')

theorem meanSmooth_eq {x : ℝ} (hx : 0 < x) : meanSmooth x = Profile.meanKernel x := by
  have he : exp x ≠ 0 := (Real.exp_pos x).ne'
  have hd : exp x - 1 ≠ 0 := (Profile.exp_sub_one_pos hx).ne'
  unfold meanSmooth Profile.meanKernel
  rw [meanExp_of_ne hx.ne', Real.exp_neg]
  field_simp
  <;> ring

theorem varianceSmooth_eq {x : ℝ} (hx : 0 < x) :
    varianceSmooth x = Profile.varianceKernel x := by
  have he : exp x ≠ 0 := (Real.exp_pos x).ne'
  have hd : exp x - 1 ≠ 0 := (Profile.exp_sub_one_pos hx).ne'
  unfold varianceSmooth Profile.varianceKernel
  rw [meanExp_of_ne hx.ne', Real.exp_neg]
  field_simp
  <;> ring

theorem integral_meanSmooth {u : ℝ} (hu : 0 ≤ u) :
    (∫ x in 0..u, meanSmooth x) = ∫ x in 0..u, Profile.meanKernel x := by
  apply intervalIntegral.integral_congr_Ioo_of_le hu
  intro x hx
  exact meanSmooth_eq hx.1

theorem integral_varianceSmooth {u : ℝ} (hu : 0 ≤ u) :
    (∫ x in 0..u, varianceSmooth x) = Profile.V u := by
  apply intervalIntegral.integral_congr_Ioo_of_le hu
  intro x hx
  exact varianceSmooth_eq hx.1

def weightedMean (r : ℕ) (t : ℝ) : ℝ :=
  ∑ j ∈ range r, ((j : ℝ) + 1) / (exp (((j : ℝ) + 1) * t) - 1)

def weightedVariance (r : ℕ) (t : ℝ) : ℝ :=
  ∑ j ∈ range r, (((j : ℝ) + 1) ^ 2 * exp (((j : ℝ) + 1) * t)) /
    (exp (((j : ℝ) + 1) * t) - 1) ^ 2

theorem scaled_weightedMean (r : ℕ) {t : ℝ} (ht : 0 < t) :
    t * weightedMean r t = ∑ j ∈ range r, meanSmooth (((j : ℝ) + 1) * t) := by
  unfold weightedMean
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro j hj
  rw [meanSmooth_eq (by positivity)]
  unfold Profile.meanKernel
  ring

theorem scaled_weightedVariance (r : ℕ) {t : ℝ} (ht : 0 < t) :
    t ^ 2 * weightedVariance r t =
      ∑ j ∈ range r, varianceSmooth (((j : ℝ) + 1) * t) := by
  unfold weightedVariance
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro j hj
  rw [varianceSmooth_eq (by positivity)]
  unfold Profile.varianceKernel
  ring

end LineSize.EulerKernel
