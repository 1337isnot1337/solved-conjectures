import Conjectures.LonelinessHyperplaneMaximizers
import Conjectures.LonelinessHyperplaneUnshifted

/-! The unshifted endpoint event for a full-support normal. A maximizing
point lies on the signed ray through the coordinatewise sign vector.
The relevant point has order two in the even case, and order equal to
the normal mass in the odd case. All integer velocities are permitted. -/

namespace Loneliness.Hyperplane

open scoped BigOperators
open Loneliness.SubspaceDensity

noncomputable section

theorem unitCircle_add_integer (x : ℝ) (z : ℤ) :
    ((x + (z : ℝ) : ℝ) : UnitAddCircle) = (x : UnitAddCircle) := by
  rw [AddCircle.coe_add, unitCircle_integer_eq_zero, add_zero]

theorem distance_eq_abs_of_abs_le_half (x : ℝ) (hx : |x| ≤ 1 / 2) :
    distance x = |x| := by
  have h₁ := distance_half_sub x
  have h₂ := distance_half_sub_of_abs_le_half x hx
  linarith

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

theorem unitCircle_center_minus_sign (m : ι → ℤ) (i : ι) (δ : ℝ) :
    ((1 / 2 - δ * signChoice m i : ℝ) : UnitAddCircle) =
      (((1 / 2 - δ) * signChoice m i : ℝ) : UnitAddCircle) := by
  by_cases hi : 0 ≤ (m i : ℝ)
  · simp only [signChoice, ite_eq_left hi, mul_one]
  · simp only [signChoice, ite_eq_right hi]
    have he : 1 / 2 - δ * (-1) = (1 / 2 - δ) * (-1) + (1 : ℝ) := by ring
    rw [he]
    simpa only [Int.cast_one] using
      unitCircle_add_integer ((1 / 2 - δ) * (-1)) 1

theorem unitCircle_center_plus_sign (m : ι → ℤ) (i : ι) (δ : ℝ) :
    ((1 / 2 + δ * signChoice m i : ℝ) : UnitAddCircle) =
      -(((1 / 2 - δ) * signChoice m i : ℝ) : UnitAddCircle) := by
  have he : 1 / 2 + δ * signChoice m i =
      1 - (1 / 2 - δ * signChoice m i) := by ring
  rw [he, AddCircle.coe_sub,
    show ((1 : ℝ) : UnitAddCircle) = 0 from
      (by simpa only [Int.cast_one] using unitCircle_integer_eq_zero 1),
    zero_sub, unitCircle_center_minus_sign]

def unshiftedSignPoint (m : ι → ℤ) : ι → UnitAddCircle :=
  fun i => ((predictedValue m 0 * signChoice m i : ℝ) : UnitAddCircle)

variable [Nonempty ι]

theorem predictedValue_mem_Icc (m : ι → ℤ) (hm : PrimitiveNormal m) (s : ι → ℝ) :
    predictedValue m s ∈ Set.Icc (0 : ℝ) (1 / 2) := by
  obtain ⟨x, _, hx⟩ := shifted_hyperplane_attainment m hm s
  rw [← hx]
  exact ⟨point_nonneg _, point_le_half _⟩

theorem norm_unshiftedSignPoint (m : ι → ℤ) (hm : PrimitiveNormal m) (i : ι) :
    ‖unshiftedSignPoint m i‖ = predictedValue m 0 := by
  have hθ := predictedValue_mem_Icc m hm 0
  have habs : |predictedValue m 0 * signChoice m i| = predictedValue m 0 := by
    rw [abs_mul, abs_signChoice, mul_one, abs_of_nonneg hθ.1]
  change ‖((predictedValue m 0 * signChoice m i : ℝ) : UnitAddCircle)‖ = _
  rw [UnitAddCircle.norm_eq]
  change distance (predictedValue m 0 * signChoice m i) = _
  rw [distance_eq_abs_of_abs_le_half _ (by rw [habs]; exact hθ.2), habs]

/-- Equality in the hyperplane bound is equivalent to the velocity
circle passing through the signed maximizing point. -/
theorem unshifted_endpoint_iff_sign_point
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hsupport : ∀ i, m i ≠ 0)
    (v : ι → ℤ) (hv : integerPairing m v = 0) :
    shiftedVelocityValue v 0 = predictedValue m 0 ↔
      ∃ t : UnitAddCircle, ∀ i, v i • t = unshiftedSignPoint m i := by
  constructor
  · intro hvalue
    obtain ⟨r, _, hminus | hplus⟩ :=
      full_support_endpoint_velocity_points m hm hsupport v hv 0 hvalue
    · refine ⟨(r : UnitAddCircle), ?_⟩
      intro i
      have hi := hminus i
      simp only [Pi.zero_apply, zero_add] at hi
      calc
        v i • (r : UnitAddCircle) = ((r * (v i : ℝ) : ℝ) : UnitAddCircle) :=
          (coe_real_velocity v r i).symm
        _ = _ := hi
        _ = unshiftedSignPoint m i := by
          simpa only [unshiftedSignPoint, predictedValue] using
            unitCircle_center_minus_sign m i
              (distance (pairing m (centerMinus (0 : ι → ℝ))) / normalMass m)
    · refine ⟨-(r : UnitAddCircle), ?_⟩
      intro i
      have hi := hplus i
      simp only [Pi.zero_apply, zero_add] at hi
      calc
        v i • (-(r : UnitAddCircle)) = -((r * (v i : ℝ) : ℝ) : UnitAddCircle) := by
          rw [smul_neg, ← coe_real_velocity v r i]
        _ = -((1 / 2 + (distance (pairing m (centerMinus (0 : ι → ℝ))) /
            normalMass m) * signChoice m i : ℝ) : UnitAddCircle) := congrArg Neg.neg hi
        _ = unshiftedSignPoint m i := by
          simp only [unitCircle_center_plus_sign, neg_neg, unshiftedSignPoint, predictedValue]
  · rintro ⟨t, ht⟩
    obtain ⟨r, hr, rfl⟩ := exists_unitCircle_representative t
    have hcoordinate : ∀ i, distance ((0 + r • integerVector v) i) = predictedValue m 0 := by
      intro i
      simp only [Pi.add_apply, Pi.zero_apply, Pi.smul_apply, smul_eq_mul,
        integerVector, zero_add]
      calc
        distance (r * (v i : ℝ)) = ‖v i • (r : UnitAddCircle)‖ := by
          simp only [← coe_real_velocity v r i, UnitAddCircle.norm_eq, distance]
        _ = ‖unshiftedSignPoint m i‖ := congrArg norm (ht i)
        _ = predictedValue m 0 := norm_unshiftedSignPoint m hm i
    apply le_antisymm (orthogonal_velocity_value_le m hm v hv 0)
    exact (le_point (fun i => (hcoordinate i).ge)).trans (le_shiftedVelocityValue v 0 hr)

variable {Q : ℕ} [NeZero Q]

theorem velocity_hits_unit_multiple_iff
    (v : ι → ℤ) (b : ι → ZMod Q) (u : (ZMod Q)ˣ) :
    (∃ t : UnitAddCircle,
      ∀ i, v i • t = ZMod.toAddCircle ((u : ZMod Q) * b i)) ↔
    (∃ t : UnitAddCircle, ∀ i, v i • t = ZMod.toAddCircle (b i)) := by
  constructor
  · rintro ⟨t, ht⟩
    obtain ⟨z, hz⟩ := ZMod.intCast_surjective (↑(u⁻¹) : ZMod Q)
    refine ⟨z • t, ?_⟩
    intro i
    calc
      v i • (z • t) = z • (v i • t) := by rw [← mul_smul, mul_comm, mul_smul]
      _ = z • ZMod.toAddCircle ((u : ZMod Q) * b i) := by rw [ht i]
      _ = ZMod.toAddCircle ((z : ZMod Q) * ((u : ZMod Q) * b i)) := by
        rw [← map_zsmul, zsmul_eq_mul]
      _ = ZMod.toAddCircle (b i) := by
        rw [hz]
        exact congrArg ZMod.toAddCircle (Units.inv_mul_cancel_left u (b i))
  · rintro ⟨t, ht⟩
    obtain ⟨z, hz⟩ := ZMod.intCast_surjective (u : ZMod Q)
    refine ⟨z • t, ?_⟩
    intro i
    calc
      v i • (z • t) = z • (v i • t) := by rw [← mul_smul, mul_comm, mul_smul]
      _ = z • ZMod.toAddCircle (b i) := by rw [ht i]
      _ = ZMod.toAddCircle ((z : ZMod Q) * b i) := by rw [← map_zsmul, zsmul_eq_mul]
      _ = ZMod.toAddCircle ((u : ZMod Q) * b i) := by rw [hz]

theorem unshiftedSignPoint_unit_multiple
    (m : ι → ℤ) (hm : PrimitiveNormal m) [NeZero (endpointModulus m)] :
    ∃ u : (ZMod (endpointModulus m))ˣ, ∀ i,
      unshiftedSignPoint m i =
        ZMod.toAddCircle ((u : ZMod (endpointModulus m)) *
          canonicalResidue m (endpointModulus m) i) := by
  by_cases heven : Even (normalSize m)
  · have hQ : endpointModulus m = 2 := by simp only [endpointModulus, ite_eq_left heven]
    rw [hQ]
    refine ⟨1, ?_⟩
    intro i
    have hθ := predictedValue_zero_even m ((normalSize_even_iff m).mp heven)
    simp only [Units.val_one, one_mul, unshiftedSignPoint, hθ, canonicalResidue,
      ZMod.toAddCircle_intCast, integerSignChoice_coe, Nat.cast_ofNat]
    congr 1
    ring
  · have hA := normalSize_pos m hm
    letI : NeZero (normalSize m) := ⟨hA.ne'⟩
    have hQ : endpointModulus m = normalSize m := by
      simp only [endpointModulus, ite_eq_right heven]
    rw [hQ]
    obtain ⟨k, hk⟩ := (Nat.not_even_iff_odd.mp heven).exists_bit1
    have hzero : (2 : ZMod (normalSize m)) * (k : ZMod (normalSize m)) + 1 = 0 := by
      have hz : ((2 * k + 1 : ℕ) : ZMod (normalSize m)) = 0 := by
        rw [← hk]
        simp
      simpa only [Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat, Nat.cast_one] using hz
    have hunit : IsUnit (k : ZMod (normalSize m)) := by
      apply IsUnit.of_mul_eq_one (-2)
      calc
        _ = 1 - (2 * (k : ZMod (normalSize m)) + 1) := by ring
        _ = 1 := by rw [hzero, sub_zero]
    obtain ⟨u, hu⟩ := hunit
    have hθ : predictedValue m 0 = (k : ℝ) / (normalSize m : ℝ) := by
      rw [predictedValue_zero_odd m hm ((normalSize_odd_iff m).mp
        (Nat.not_even_iff_odd.mp heven)), normalMass_eq_normalSize]
      have hkR : (normalSize m : ℝ) = 2 * (k : ℝ) + 1 := by exact_mod_cast hk
      have hAR : (normalSize m : ℝ) ≠ 0 := by exact_mod_cast hA.ne'
      field_simp [hAR] <;> nlinarith [hkR]
    refine ⟨u, ?_⟩
    intro i
    change ((predictedValue m 0 * signChoice m i : ℝ) : UnitAddCircle) = _
    rw [hθ]
    calc
      (((k : ℝ) / (normalSize m : ℝ) * signChoice m i : ℝ) : UnitAddCircle) =
          (((((k : ℤ) * integerSignChoice m i : ℤ) : ℝ) /
            (normalSize m : ℝ) : ℝ) : UnitAddCircle) := by
        congr 1
        rw [Int.cast_mul, Int.cast_natCast, integerSignChoice_coe]
        ring
      _ = ZMod.toAddCircle (((k : ℤ) * integerSignChoice m i : ℤ) :
          ZMod (normalSize m)) := (ZMod.toAddCircle_intCast _).symm
      _ = ZMod.toAddCircle ((u : ZMod (normalSize m)) *
          canonicalResidue m (normalSize m) i) := by
        simp only [Int.cast_mul, Int.cast_natCast, hu, canonicalResidue]

/-- Exact geometric identification of the endpoint event. Full support
is required here, while the velocity need not be primitive. -/
theorem unshifted_endpoint_iff_canonical
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hsupport : ∀ i, m i ≠ 0)
    (v : ι → ℤ) (hv : integerPairing m v = 0) [NeZero (endpointModulus m)] :
    shiftedVelocityValue v 0 = predictedValue m 0 ↔
      ∃ t : UnitAddCircle, ∀ i, v i • t =
        ZMod.toAddCircle (canonicalResidue m (endpointModulus m) i) := by
  rw [unshifted_endpoint_iff_sign_point m hm hsupport v hv]
  obtain ⟨u, hu⟩ := unshiftedSignPoint_unit_multiple m hm
  simp_rw [hu]
  exact velocity_hits_unit_multiple_iff v (canonicalResidue m (endpointModulus m)) u

end

end Loneliness.Hyperplane
