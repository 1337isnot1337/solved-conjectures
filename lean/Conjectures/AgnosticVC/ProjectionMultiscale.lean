module

public import Conjectures.AgnosticVC.ProjectionOverlap
public import Conjectures.AgnosticVC.ProjectionInverse
import Mathlib.Tactic

@[expose] public section

/-! Application of the overlap and inverse estimates to the scales `d * 4^j`. -/

namespace AgnosticVC

open scoped BigOperators InnerProductSpace
open Finset

variable {α : Type*} [Fintype α] [DecidableEq α]
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
variable (S : Finset α → Submodule ℝ E) [∀ s, (S s).HasOrthogonalProjection]

/-- Cumulative projection bands, extended by zero on the left and the identity on the right. -/
noncomputable def projectionScaleCumulative (d J i : ℕ) : E →L[ℝ] E :=
  if i = 0 then 0 else if i ≤ J + 1 then averagedProjection S (d * 4 ^ (i - 1)) else 1

/-- The differences of cumulative scale projections. -/
noncomputable def projectionScaleBand (d J i : ℕ) : E →L[ℝ] E :=
  projectionScaleCumulative S d J (i + 1) - projectionScaleCumulative S d J i

/-- The multiscale operator, written as a weighted sum of its positive bands. -/
noncomputable def projectionScaleOperator (d J : ℕ) (base : ℝ) : E →L[ℝ] E :=
  ∑ i : Fin (J + 2), projectionScaleWeight base i • projectionScaleBand S d J i

variable {S}

private theorem cumulative_middle {d J i : ℕ} (hi : i ≤ J) :
    projectionScaleCumulative S d J (i + 1) = averagedProjection S (d * 4 ^ i) := by
  simp [projectionScaleCumulative, Nat.succ_le_succ hi]

private theorem cumulative_last (d J : ℕ) :
    projectionScaleCumulative S d J (J + 2) = 1 := by
  simp [projectionScaleCumulative]

omit [DecidableEq α] in
private theorem scaleFits {d J : ℕ} (hN : d * 4 ^ J ≤ Fintype.card α) {i : ℕ} (hi : i ≤ J) :
    d * 4 ^ i ≤ Fintype.card α :=
  (Nat.mul_le_mul_left d (Nat.pow_le_pow_right (by decide) hi)).trans hN

private theorem cumulative_positive (d J i : ℕ) : (projectionScaleCumulative S d J i).IsPositive := by
  unfold projectionScaleCumulative
  split_ifs
  · exact ContinuousLinearMap.isPositive_zero
  · exact averagedProjection_isPositive S _
  · exact ContinuousLinearMap.isPositive_one

private theorem cumulative_le_one {d J : ℕ} (hN : d * 4 ^ J ≤ Fintype.card α) (i : ℕ) :
    projectionScaleCumulative S d J i ≤ 1 := by
  unfold projectionScaleCumulative
  split_ifs with h₀ h
  · exact ContinuousLinearMap.nonneg_iff_isPositive.mpr ContinuousLinearMap.isPositive_one
  · exact averagedProjection_le_one S _ (scaleFits hN (by omega))
  · exact le_rfl

private theorem cumulative_mono {d J : ℕ} (hS : Monotone S) (hN : d * 4 ^ J ≤ Fintype.card α) :
    Monotone (projectionScaleCumulative S d J) := by
  intro i j hij
  by_cases hi : i = 0
  · simpa [projectionScaleCumulative, hi] using
      (ContinuousLinearMap.nonneg_iff_isPositive.mpr (cumulative_positive (S := S) d J j))
  by_cases hj : J + 1 < j
  · simpa [projectionScaleCumulative, show j ≠ 0 by omega, not_le.mpr hj] using
      cumulative_le_one (S := S) hN i
  have hi' : i - 1 ≤ j - 1 := Nat.sub_le_sub_right hij 1
  have hle : d * 4 ^ (i - 1) ≤ d * 4 ^ (j - 1) :=
    Nat.mul_le_mul_left _ (Nat.pow_le_pow_right (by decide) hi')
  simpa [projectionScaleCumulative, hi, show j ≠ 0 by omega, show i ≤ J + 1 by omega,
    show j ≤ J + 1 by omega] using averagedProjection_mono S hS hle (scaleFits hN (by omega))

theorem projectionScaleBand_positive {d J : ℕ} (hS : Monotone S)
    (hN : d * 4 ^ J ≤ Fintype.card α) (i : ℕ) :
    (projectionScaleBand S d J i).IsPositive :=
  ContinuousLinearMap.le_def.mp (cumulative_mono hS hN (Nat.le_succ i))

private theorem bands_sum (d J : ℕ) (x : E) :
    (∑ i : Fin (J + 2), projectionScaleBand S d J i x) = x := by
  simp only [projectionScaleBand, sub_apply]
  rw [Fin.sum_univ_eq_sum_range (fun i => projectionScaleCumulative S d J (i + 1) x -
    projectionScaleCumulative S d J i x),
    sum_range_sub (fun i => projectionScaleCumulative S d J i x)]
  simp [projectionScaleCumulative]

private theorem band_le_cumulative (d J i : ℕ) :
    projectionScaleBand S d J i ≤ projectionScaleCumulative S d J (i + 1) := by
  exact sub_le_self _ (ContinuousLinearMap.nonneg_iff_isPositive.mpr (cumulative_positive d J i))

private theorem band_le_complement_cumulative {d J : ℕ}
    (hN : d * 4 ^ J ≤ Fintype.card α) (i : ℕ) :
    projectionScaleBand S d J i ≤ 1 - projectionScaleCumulative S d J i :=
  sub_le_sub_right (cumulative_le_one hN (i + 1)) _


@[simp] theorem projectionScaleBand_zero (d J : ℕ) :
    projectionScaleBand S d J 0 = averagedProjection S d := by
  simp [projectionScaleBand, projectionScaleCumulative]

/-- A positive band is dominated by the residual of the preceding scale. -/
theorem projectionScaleBand_le_prev_residual {d J i : ℕ}
    (hN : d * 4 ^ J ≤ Fintype.card α) (hi : 0 < i) (hi' : i ≤ J + 1) :
    projectionScaleBand S d J i ≤ 1 - averagedProjection S (d * 4 ^ (i - 1)) := by
  have he : projectionScaleCumulative S d J i = averagedProjection S (d * 4 ^ (i - 1)) := by
    simp [projectionScaleCumulative, hi.ne', hi']
  rw [← he]
  exact band_le_complement_cumulative hN i

private theorem band_pair_of_lt {d J : ℕ} (hS : Monotone S)
    (hN : d * 4 ^ J ≤ Fintype.card α) {i j : Fin (J + 2)} (hij : i < j) (x y : E) :
    ⟪projectionScaleBand S d J i x, projectionScaleBand S d J j y⟫_ℝ ^ 2 ≤
      projectionScaleDecay i j ^ 2 *
        (⟪projectionScaleBand S d J i x, x⟫_ℝ * ⟪projectionScaleBand S d J j y, y⟫_ℝ) := by
  have hlt : (i : ℕ) < j := hij
  have hi : (i : ℕ) ≤ J := by have := j.isLt; omega
  have hj : (j : ℕ) - 1 ≤ J := by have := j.isLt; omega
  refine projectionBand_pair (projectionScaleBand_positive hS hN i)
    (projectionScaleBand_positive hS hN j)
    (cumulative_positive d J (i + 1)) (band_le_cumulative d J i)
    (band_le_complement_cumulative hN j) (fun z => ?_) x y
  rw [cumulative_middle hi, show (j : ℕ) = (j : ℕ) - 1 + 1 by omega,
    cumulative_middle hj]
  let k := 4 ^ ((j : ℕ) - (i : ℕ) - 1)
  have hk : 0 < k := by dsimp [k]; positivity
  have hkM : k * (d * 4 ^ (i : ℕ)) ≤ d * 4 ^ ((j : ℕ) - 1) := by
    dsimp [k]
    rw [mul_left_comm, ← pow_add]
    have he : (j : ℕ) - (i : ℕ) - 1 + (i : ℕ) = (j : ℕ) - 1 := by omega
    rw [he]
  have h := averagedProjection_overlap S hS hk hkM (scaleFits hN hj) z
  have hdec : projectionScaleDecay i j ^ 2 = (k : ℝ)⁻¹ := by
    unfold projectionScaleDecay k
    rw [max_eq_right hlt.le, min_eq_left hlt.le, ← pow_mul, Nat.cast_pow]
    simp only [Nat.cast_ofNat]
    rw [mul_comm _ 2, pow_mul]
    rw [show (1 / 2 : ℝ) ^ 2 = 4⁻¹ by norm_num, inv_pow]
  simpa only [hdec, Nat.sub_add_cancel (by omega : 1 ≤ (j : ℕ))] using h

private theorem band_pair {d J : ℕ} (hS : Monotone S)
    (hN : d * 4 ^ J ≤ Fintype.card α) (i j : Fin (J + 2)) (x y : E) :
    ⟪projectionScaleBand S d J j x, projectionScaleBand S d J i y⟫_ℝ ^ 2 ≤
      projectionScaleDecay i j ^ 2 *
        (⟪projectionScaleBand S d J j x, x⟫_ℝ * ⟪projectionScaleBand S d J i y, y⟫_ℝ) := by
  rcases lt_trichotomy j i with h | rfl | h
  · simpa only [projectionScaleDecay, max_comm, min_comm] using band_pair_of_lt hS hN h x y
  · have hB := projectionScaleBand_positive hS hN j
    have hB1 := (band_le_cumulative (S := S) d J j).trans (cumulative_le_one hN (j + 1))
    apply projectionBand_pair (K := 1) (L := 1) hB hB ContinuousLinearMap.isPositive_one hB1 hB1
    intro z
    simp [projectionScaleDecay]
  · simpa only [real_inner_comm (projectionScaleBand S d J i y), mul_comm
      ⟪projectionScaleBand S d J i y, y⟫_ℝ] using band_pair_of_lt hS hN h y x


/-- The band representation is the weighted sum of the averaged projections and full entropy. -/
theorem projectionScaleOperator_eq (d J : ℕ) (base : ℝ) :
    projectionScaleOperator S d J base =
      projectionScaleWeight base (J + 1) • (1 : E →L[ℝ] E) +
        ∑ i : Fin (J + 1),
          (projectionScaleWeight base i - projectionScaleWeight base (i + 1)) •
            averagedProjection S (d * 4 ^ (i : ℕ)) := by
  unfold projectionScaleOperator
  simp only [projectionScaleBand, smul_sub, sum_sub_distrib]
  rw [Fin.sum_univ_castSucc (f := fun i =>
    projectionScaleWeight base (i : ℕ) • projectionScaleCumulative S d J ((i : ℕ) + 1)),
    Fin.sum_univ_succ (f := fun i =>
    projectionScaleWeight base (i : ℕ) • projectionScaleCumulative S d J (i : ℕ))]
  simp only [Fin.val_castSucc, Fin.val_last, Fin.val_zero, Fin.val_succ,
    show projectionScaleCumulative S d J 0 = 0 by simp [projectionScaleCumulative],
    cumulative_last, smul_zero, zero_add, sub_smul, sum_sub_distrib]
  have heq (i : Fin (J + 1)) :
      projectionScaleCumulative S d J ((i : ℕ) + 1) = averagedProjection S (d * 4 ^ (i : ℕ)) :=
    cumulative_middle (Nat.le_of_lt_succ i.isLt)
  simp_rw [heq]
  abel

/-- The multiscale inverse estimate for projections averaged over subsets of sizes
`d, 4*d, …, 4^J*d`. This form bounds any solution of the corresponding linear system. -/
theorem projectionScale_inverse_bound {d J : ℕ} {base : ℝ} (hbase : 0 < base)
    (hS : Monotone S) (hN : d * 4 ^ J ≤ Fintype.card α) {x z : E}
    (hz : projectionScaleOperator S d J base z = x) :
    ‖z‖ ^ 2 ≤ 4 * ∑ i : Fin (J + 2),
      (projectionScaleWeight base i)⁻¹ ^ 2 * ⟪projectionScaleBand S d J i x, x⟫_ℝ := by
  have hschur := projectionScale_schur (n := J + 2) hbase
  have hz' : (∑ i : Fin (J + 2), projectionScaleWeight base i • projectionScaleBand S d J i z) = x := by
    simpa only [projectionScaleOperator, _root_.sum_apply, smul_apply] using hz
  exact projection_inverse_bound (fun i : Fin (J + 2) => projectionScaleBand S d J i)
    (fun i => projectionScaleWeight base i) (fun i j => projectionScaleDecay i j)
    (fun i => projectionScaleBand_positive hS hN i) (bands_sum d J)
    (fun i j => by unfold projectionScaleDecay; positivity) (band_pair hS hN)
    (fun i => (hschur.1 i).trans (by norm_num)) (fun j => (hschur.2 j).trans (by norm_num)) hz'


/-- The multiscale operator has a unique inverse on a finite-dimensional space. -/
theorem projectionScaleOperator_bijective [FiniteDimensional ℝ E] {d J : ℕ} {base : ℝ}
    (hbase : 0 < base) (hS : Monotone S) (hN : d * 4 ^ J ≤ Fintype.card α) :
    Function.Bijective (projectionScaleOperator S d J base) := by
  have hinj : Function.Injective (projectionScaleOperator S d J base) := by
    intro x y hxy
    have h : projectionScaleOperator S d J base (x - y) = 0 := by rw [map_sub, hxy, sub_self]
    have hz := projectionScale_inverse_bound hbase hS hN h
    simp only [map_zero, inner_zero_left, mul_zero, sum_const_zero] at hz
    exact sub_eq_zero.mp (norm_eq_zero.mp (by nlinarith [norm_nonneg (x - y)] : ‖x - y‖ = 0))
  exact ⟨hinj, LinearMap.injective_iff_surjective.mp
    (show Function.Injective (projectionScaleOperator S d J base).toLinearMap from hinj)⟩

end AgnosticVC
