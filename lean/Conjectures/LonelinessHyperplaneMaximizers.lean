import Conjectures.LonelinessHyperplaneHaar
import Conjectures.LonelinessHyperplaneLattice

/-! Equality in the hyperplane bound when every normal coordinate is
nonzero. Equality in the weighted box bound forces every coordinate
error to follow the same sign of the normal. The maximizing torus
points therefore lie in two explicit points. -/

namespace Loneliness.Hyperplane

open scoped BigOperators
open Loneliness.SubspaceDensity

noncomputable section

variable {ι : Type*} [Fintype ι]

theorem abs_pairing_le_normalMass_mul
    (m : ι → ℤ) (y : ι → ℝ) (δ : ℝ) (hy : ∀ i, |y i| ≤ δ) :
    |pairing m y| ≤ normalMass m * δ := by
  calc
    _ ≤ ∑ i, |(m i : ℝ) * y i| := Finset.abs_sum_le_sum_abs _ _
    _ = ∑ i, |(m i : ℝ)| * |y i| := by simp only [abs_mul]
    _ ≤ ∑ i, |(m i : ℝ)| * δ := by
      apply Finset.sum_le_sum
      intro i _
      exact mul_le_mul_of_nonneg_left (hy i) (abs_nonneg _)
    _ = _ := by rw [← Finset.sum_mul]; rfl

theorem eq_signChoice_of_pairing_eq_normalMass_mul
    (m : ι → ℤ) (hsupport : ∀ i, m i ≠ 0)
    (y : ι → ℝ) (δ : ℝ) (hy : ∀ i, |y i| ≤ δ)
    (hpair : pairing m y = normalMass m * δ) : y = δ • signChoice m := by
  have hnonneg : ∀ i, 0 ≤ |(m i : ℝ)| * δ - (m i : ℝ) * y i := by
    intro i
    have hprod : (m i : ℝ) * y i ≤ |(m i : ℝ)| * |y i| := by
      rw [← abs_mul]
      exact le_abs_self _
    have hbound := mul_le_mul_of_nonneg_left (hy i) (abs_nonneg (m i : ℝ))
    linarith
  have hsum : (∑ i, |(m i : ℝ)| * δ - (m i : ℝ) * y i) = 0 := by
    rw [Finset.sum_sub_distrib, ← Finset.sum_mul]
    change normalMass m * δ - pairing m y = 0
    rw [hpair, sub_self]
  funext i
  have hi := Finset.single_le_sum (fun j _ => hnonneg j) (Finset.mem_univ i)
  rw [hsum] at hi
  have heq : (m i : ℝ) * y i = |(m i : ℝ)| * δ := by linarith [hnonneg i]
  have hne : (m i : ℝ) ≠ 0 := by exact_mod_cast hsupport i
  change y i = δ * signChoice m i
  by_cases hsign : 0 ≤ (m i : ℝ)
  · rw [abs_of_nonneg hsign] at heq
    simpa only [signChoice, if_pos hsign, mul_one] using mul_left_cancel₀ hne heq
  · rw [abs_of_neg (lt_of_not_ge hsign)] at heq
    have hyi : y i = -δ := mul_left_cancel₀ hne (by nlinarith [heq])
    simpa only [signChoice, if_neg hsign, mul_neg_one] using hyi

theorem eq_or_neg_signChoice_of_abs_pairing_eq
    (m : ι → ℤ) (hsupport : ∀ i, m i ≠ 0)
    (y : ι → ℝ) (δ : ℝ) (hy : ∀ i, |y i| ≤ δ)
    (hpair : |pairing m y| = normalMass m * δ) :
    y = δ • signChoice m ∨ y = (-δ) • signChoice m := by
  by_cases hsign : 0 ≤ pairing m y
  · left
    apply eq_signChoice_of_pairing_eq_normalMass_mul m hsupport y δ hy
    simpa only [abs_of_nonneg hsign] using hpair
  · right
    have hneg : pairing m (-y) = normalMass m * δ := by
      change (∑ i, (m i : ℝ) * (-y i)) = _
      rw [show (∑ i, (m i : ℝ) * (-y i)) = -pairing m y by
        simp only [pairing, mul_neg, Finset.sum_neg_distrib]]
      simpa only [abs_of_neg (lt_of_not_ge hsign)] using hpair
    have hyneg : ∀ i, |(-y) i| ≤ δ := by
      intro i
      simpa only [Pi.neg_apply, abs_neg] using hy i
    have he := eq_signChoice_of_pairing_eq_normalMass_mul m hsupport (-y) δ hyneg hneg
    have hnegated := congrArg (fun x : ι → ℝ => -x) he
    simpa only [neg_neg, neg_smul] using hnegated

theorem unitCircle_integer_eq_zero (z : ℤ) : ((z : ℝ) : UnitAddCircle) = 0 := by
  apply (AddCircle.coe_eq_zero_iff (1 : ℝ)).mpr
  exact ⟨z, by simp only [zsmul_eq_mul, mul_one]⟩

variable [Nonempty ι]

/-- Every maximizing point, reduced modulo integers, is one of the two
explicit sign points. The nonzero-coordinate assumption is essential. -/
theorem full_support_maximizer
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hsupport : ∀ i, m i ≠ 0)
    (s x : ι → ℝ) (hx : pairing m x = 0)
    (hmax : pointClearance (s + x) = predictedValue m s) :
    (∀ i, (((s + x) i : ℝ) : UnitAddCircle) =
      ((1 / 2 - (distance (pairing m (centerMinus s)) / normalMass m) *
        signChoice m i : ℝ) : UnitAddCircle)) ∨
    (∀ i, (((s + x) i : ℝ) : UnitAddCircle) =
      ((1 / 2 + (distance (pairing m (centerMinus s)) / normalMass m) *
        signChoice m i : ℝ) : UnitAddCircle)) := by
  let δ := distance (pairing m (centerMinus s)) / normalMass m
  let w := centerMinus s - x
  let z : ι → ℤ := fun i => round (w i)
  let y := w - integerVector z
  have hA := normalMass_pos m hm
  have hy : ∀ i, |y i| ≤ δ := by
    intro i
    change |w i - (round (w i) : ℝ)| ≤ δ
    change distance (w i) ≤ δ
    have he : w i = 1 / 2 - (s + x) i := by
      simp only [w, centerMinus, Pi.sub_apply, Pi.add_apply]
      ring
    rw [he, distance_half_sub]
    have hc := point_le_distance (s + x) i
    rw [hmax] at hc
    dsimp only [predictedValue] at hc
    dsimp only [δ]
    linarith
  have hpair : pairing m y = pairing m (centerMinus s) - (integerPairing m z : ℝ) := by
    dsimp only [y, w]
    rw [pairing_sub, pairing_sub, hx, sub_zero, pairing_integerVector]
    rfl
  have hdist : distance (pairing m y) = distance (pairing m (centerMinus s)) := by
    rw [hpair]
    simpa only [Int.cast_neg, sub_eq_add_neg] using
      CriticalFamilies.distance_add_int (pairing m (centerMinus s)) (-integerPairing m z)
  have hδ : normalMass m * δ = distance (pairing m (centerMinus s)) := by
    dsimp only [δ]
    field_simp [hA.ne'] <;> ring
  have habs : |pairing m y| = normalMass m * δ := by
    apply le_antisymm (abs_pairing_le_normalMass_mul m y δ hy)
    calc
      normalMass m * δ = distance (pairing m (centerMinus s)) := hδ
      _ = distance (pairing m y) := hdist.symm
      _ ≤ |pairing m y| := by simpa only [Int.cast_zero, sub_zero] using distance_le_int (pairing m y) 0
  have hmod : ∀ i, (((s + x) i : ℝ) : UnitAddCircle) =
      ((1 / 2 - y i : ℝ) : UnitAddCircle) := by
    intro i
    have he : (s + x) i = (1 / 2 - y i) + ((-z i : ℤ) : ℝ) := by
      simp only [y, w, centerMinus, integerVector, Pi.sub_apply, Pi.add_apply, Int.cast_neg]
      ring
    rw [he, AddCircle.coe_add, unitCircle_integer_eq_zero, add_zero]
  obtain hp | hn := eq_or_neg_signChoice_of_abs_pairing_eq m hsupport y δ hy habs
  · left
    intro i
    have hi := congrFun hp i
    dsimp only [Pi.smul_apply, smul_eq_mul] at hi
    rw [hmod i, hi]
  · right
    intro i
    have hi := congrFun hn i
    dsimp only [Pi.smul_apply, smul_eq_mul] at hi
    rw [hmod i, hi]
    congr 1 <;> dsimp only [δ] <;> ring

theorem full_support_endpoint_velocity_points
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hsupport : ∀ i, m i ≠ 0)
    (v : ι → ℤ) (hv : integerPairing m v = 0) (s : ι → ℝ)
    (hvalue : shiftedVelocityValue v s = predictedValue m s) :
    ∃ t ∈ Set.Icc (0 : ℝ) 1,
      (∀ i, ((s i + t * (v i : ℝ) : ℝ) : UnitAddCircle) =
        ((1 / 2 - (distance (pairing m (centerMinus s)) / normalMass m) *
          signChoice m i : ℝ) : UnitAddCircle)) ∨
      (∀ i, ((s i + t * (v i : ℝ) : ℝ) : UnitAddCircle) =
        ((1 / 2 + (distance (pairing m (centerMinus s)) / normalMass m) *
          signChoice m i : ℝ) : UnitAddCircle)) := by
  obtain ⟨t, ht, hmax⟩ := shiftedVelocityValue_max v s
  have hx : pairing m (t • integerVector v) = 0 := by
    rw [pairing_smul, pairing_integerVector]
    change t * (integerPairing m v : ℝ) = 0
    rw [hv, Int.cast_zero, mul_zero]
  refine ⟨t, ht, ?_⟩
  simpa only [Pi.add_apply, Pi.smul_apply, smul_eq_mul, integerVector] using
    full_support_maximizer m hm hsupport s (t • integerVector v) hx (hmax.trans hvalue)

end

end Loneliness.Hyperplane
