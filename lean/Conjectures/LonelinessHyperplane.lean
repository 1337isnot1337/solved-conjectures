import Conjectures.LonelinessHyperplaneBasic

/-! Exact shifted loneliness on the real hyperplane of a primitive integer
normal. The attaining point is constructed from proved Bézout coefficients.
The orthogonal integer-velocity bound holds at every real time.

This module proves the deterministic part of the fixed-relation note. It
does not claim the probabilistic limit, a rate, or an endpoint frequency. -/

namespace Loneliness.Hyperplane

open scoped BigOperators
open Loneliness.SubspaceDensity

noncomputable section

variable {ι : Type*} [Fintype ι] [Nonempty ι]

theorem hyperplane_point_upper (m : ι → ℤ) (hA : 0 < normalMass m)
    (s x : ι → ℝ) (hx : pairing m x = 0) :
    pointClearance (s + x) ≤ predictedValue m s := by
  let p : ℝ := pointClearance (s + x)
  have hpair : pairing m (centerMinus s - x) = pairing m (centerMinus s) := by
    rw [pairing_sub, hx, sub_zero]
  have hdist := distance_pairing_le m (centerMinus s - x)
  rw [hpair] at hdist
  have hsum : (∑ i, |(m i : ℝ)| * distance ((centerMinus s - x) i)) ≤
      normalMass m * (1 / 2 - p) := by
    rw [normalMass, Finset.sum_mul]
    apply Finset.sum_le_sum
    intro i _
    apply mul_le_mul_of_nonneg_left ?_ (abs_nonneg (m i : ℝ))
    have hc := point_le_distance (s + x) i
    have he : (centerMinus s - x) i = 1 / 2 - (s + x) i := by
      simp only [centerMinus, Pi.sub_apply, Pi.add_apply]
      ring
    rw [he, distance_half_sub]
    dsimp only [p]
    linarith
  have hbound := hdist.trans hsum
  have hdiv : distance (pairing m (centerMinus s)) / normalMass m ≤ 1 / 2 - p := by
    apply (div_le_iff₀ hA).2
    simpa only [mul_comm] using hbound
  dsimp only [predictedValue]
  dsimp only [p] at hdiv
  linarith

/-- A maximum is attained in the actual real kernel of the normal, for
every shift. No density theorem or distribution assumption is used. -/
theorem shifted_hyperplane_attainment (m : ι → ℤ) (hm : PrimitiveNormal m)
    (s : ι → ℝ) :
    ∃ x ∈ relationSpace m, pointClearance (s + x) = predictedValue m s := by
  classical
  obtain ⟨e, he⟩ := primitive_bezout m hm
  have hA1 := one_le_normalMass m hm
  have hA := normalMass_pos m hm
  let y : ℝ := pairing m (centerMinus s)
  let q : ℤ := round y
  let b : ℝ := y - (q : ℝ)
  let x : ι → ℝ := centerMinus s - (b / normalMass m) • signChoice m -
    (q : ℝ) • integerVector e
  have heR : pairing m (integerVector e) = 1 := by
    rw [pairing_integerVector, he, Int.cast_one]
  have hx : pairing m x = 0 := by
    dsimp only [x]
    rw [pairing_sub, pairing_sub, pairing_smul, pairing_smul,
      pairing_signChoice, heR]
    change y - (b / normalMass m) * normalMass m - (q : ℝ) * 1 = 0
    rw [div_mul_cancel₀ _ (ne_of_gt hA)]
    dsimp only [b]
    ring
  have hsmall : distance y / normalMass m ≤ 1 / 2 := by
    apply (div_le_iff₀ hA).2
    have hy := distance_le_half y
    nlinarith
  have hcoordinate (i : ι) : distance ((s + x) i) = predictedValue m s := by
    have hperiod : (s + x) i =
        (1 / 2 - (b / normalMass m) * signChoice m i) + ((-q * e i : ℤ) : ℝ) := by
      dsimp only [x, centerMinus, integerVector]
      simp only [Pi.add_apply, Pi.sub_apply, Pi.smul_apply, smul_eq_mul,
        centerMinus, integerVector,
        Int.cast_mul, Int.cast_neg]
      ring
    have habs : |(b / normalMass m) * signChoice m i| =
        distance y / normalMass m := by
      rw [abs_mul, abs_signChoice, mul_one, abs_div, abs_of_pos hA]
      rfl
    rw [hperiod, CriticalFamilies.distance_add_int,
      distance_half_sub_of_abs_le_half _ (by rw [habs]; exact hsmall), habs]
    rfl
  refine ⟨x, hx, le_antisymm (hyperplane_point_upper m hA s x hx) ?_⟩
  exact le_point (fun i => (hcoordinate i).ge)

theorem shifted_hyperplane_value (m : ι → ℤ) (hm : PrimitiveNormal m)
    (s : ι → ℝ) :
    shiftedSpaceValue (relationSpace m) s = predictedValue m s := by
  apply le_antisymm
  · apply shiftedSpaceValue_le
    intro x hx
    exact hyperplane_point_upper m (normalMass_pos m hm) s x hx
  · obtain ⟨x, hx, he⟩ := shifted_hyperplane_attainment m hm s
    rw [← he]
    exact point_le_shiftedSpaceValue s hx

/-- The formula is the exact all-point maximum, stated without a supremum
definition in its conclusion. This includes all zero and mixed-sign normal
coordinates permitted by primitivity. -/
theorem shifted_hyperplane_maximum (m : ι → ℤ) (hm : PrimitiveNormal m)
    (s : ι → ℝ) :
    ∃ x : ι → ℝ, pairing m x = 0 ∧
      pointClearance (s + x) =
        1 / 2 - distance (∑ i, (m i : ℝ) * (1 / 2 - s i)) / (∑ i, |(m i : ℝ)|) ∧
      ∀ z : ι → ℝ, pairing m z = 0 →
        pointClearance (s + z) ≤ pointClearance (s + x) := by
  obtain ⟨x, hx, he⟩ := shifted_hyperplane_attainment m hm s
  refine ⟨x, hx, he, ?_⟩
  intro z hz
  rw [he]
  exact hyperplane_point_upper m (normalMass_pos m hm) s z hz

theorem orthogonal_velocity_bound (m : ι → ℤ) (hm : PrimitiveNormal m)
    (v : ι → ℤ) (horth : ∑ i, m i * v i = 0) (s : ι → ℝ) (t : ℝ) :
    pointClearance (s + t • integerVector v) ≤ predictedValue m s := by
  apply hyperplane_point_upper m (normalMass_pos m hm)
  rw [pairing_smul, pairing_integerVector, horth, Int.cast_zero, mul_zero]

theorem orthogonal_velocity_value_le (m : ι → ℤ) (hm : PrimitiveNormal m)
    (v : ι → ℤ) (horth : ∑ i, m i * v i = 0) (s : ι → ℝ) :
    shiftedVelocityValue v s ≤ predictedValue m s :=
  shiftedVelocityValue_le (fun t _ => orthogonal_velocity_bound m hm v horth s t)

end

end Loneliness.Hyperplane
