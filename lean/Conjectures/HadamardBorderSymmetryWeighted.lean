import Conjectures.HadamardBorderSymmetryArithmetic

/-! A finite weighted-sum bound for the paired-fiber correlation obstruction. -/

namespace HadamardBorderSymmetry

open scoped BigOperators

theorem abs_sum_mul_le48 {ι : Type*} [Fintype ι] (x s : ι → ℤ)
    (hx : ∀ i, |x i| < 25) (hs : ∑ i, |s i| ≤ 2) :
    |∑ i, x i * s i| ≤ 48 := by
  calc
    |∑ i, x i * s i| ≤ ∑ i, |x i * s i| :=
      Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ i, 24 * |s i| := by
      apply Finset.sum_le_sum
      intro i _
      rw [abs_mul]
      have hi : |x i| ≤ 24 := by have := hx i; omega
      exact mul_le_mul_of_nonneg_right hi (abs_nonneg (s i))
    _ = 24 * ∑ i, |s i| := by rw [Finset.mul_sum]
    _ ≤ 48 := by omega

theorem small_pair_sum_correlation_impossible {ι : Type*} [Fintype ι] (x s : ι → ℤ)
    (hx : ∀ i, |x i| < 25) (hs : ∑ i, |s i| ≤ 2)
    (hcorr : ∑ i, x i * s i = 298) : False := by
  have h := abs_sum_mul_le48 x s hx hs
  rw [hcorr] at h
  norm_num at h

end HadamardBorderSymmetry
