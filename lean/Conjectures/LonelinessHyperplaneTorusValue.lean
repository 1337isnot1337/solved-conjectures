import Conjectures.LonelinessHyperplaneApproximation

/-! Identification of the real-time and torus formulations of shifted
loneliness, including the supremum over shifts. Both sides use their
actual parameter spaces; no density assumption is part of the bridge. -/

namespace Loneliness.Hyperplane

open Loneliness.SubspaceDensity

noncomputable section

variable {ι : Type*} [Fintype ι] [Nonempty ι]

def torusPointClearance (x : ι → UnitAddCircle) : ℝ :=
  Finset.univ.inf' Finset.univ_nonempty (fun i => ‖x i‖)

theorem torusPointClearance_coe (x : ι → ℝ) :
    torusPointClearance (fun i => (x i : UnitAddCircle)) = pointClearance x := by
  simp only [torusPointClearance, pointClearance, UnitAddCircle.norm_eq, distance]

theorem torus_velocity_clearance_coe (v : ι → ℤ) (s : ι → ℝ) (r : ℝ) :
    torusPointClearance ((fun i => (s i : UnitAddCircle)) +
      (fun i => v i • (r : UnitAddCircle))) =
        pointClearance (s + r • integerVector v) := by
  have he : (fun i => (((s + r • integerVector v) i : ℝ) : UnitAddCircle)) =
      (fun i => (s i : UnitAddCircle)) + (fun i => v i • (r : UnitAddCircle)) := by
    funext i
    simp only [Pi.add_apply, Pi.smul_apply, smul_eq_mul, integerVector,
      AddCircle.coe_add, coe_real_velocity]
  rw [← he, torusPointClearance_coe]

def torusVelocityValue (v : ι → ℤ) (s : ι → UnitAddCircle) : ℝ :=
  sSup (Set.range (fun t : UnitAddCircle =>
    torusPointClearance (s + fun i => v i • t)))

theorem torusVelocityValue_coe (v : ι → ℤ) (s : ι → ℝ) :
    torusVelocityValue v (fun i => (s i : UnitAddCircle)) = shiftedVelocityValue v s := by
  unfold torusVelocityValue shiftedVelocityValue
  apply congrArg sSup
  ext y
  constructor
  · rintro ⟨t, rfl⟩
    obtain ⟨r, hr, hrt⟩ := exists_unitCircle_representative t
    refine ⟨r, hr, ?_⟩
    rw [← hrt, torus_velocity_clearance_coe]
  · rintro ⟨r, _, rfl⟩
    exact ⟨(r : UnitAddCircle), torus_velocity_clearance_coe v s r⟩

theorem real_shift_surjective :
    Function.Surjective (fun s : ι → ℝ => fun i => (s i : UnitAddCircle)) := by
  intro s
  choose r _ hr using fun i => exists_unitCircle_representative (s i)
  exact ⟨r, funext hr⟩

theorem torusVelocityValue_max (v : ι → ℤ) (s : ι → UnitAddCircle) :
    ∃ t : UnitAddCircle,
      torusPointClearance (s + fun i => v i • t) = torusVelocityValue v s := by
  obtain ⟨r, rfl⟩ := real_shift_surjective s
  obtain ⟨t, _, ht⟩ := shiftedVelocityValue_max v r
  refine ⟨(t : UnitAddCircle), ?_⟩
  rw [torus_velocity_clearance_coe, torusVelocityValue_coe]
  exact ht

theorem torusVelocityValue_le_profile
    (m : ι → ℤ) (hm : PrimitiveNormal m) (v : ι → ℤ)
    (hv : integerPairing m v = 0) (s : ι → UnitAddCircle) :
    torusVelocityValue v s ≤ torusPredictedValue m s := by
  obtain ⟨r, rfl⟩ := real_shift_surjective s
  rw [torusVelocityValue_coe, torusPredictedValue_coe]
  exact orthogonal_velocity_value_le m hm v hv r

def torusUniformShiftGap (m v : ι → ℤ) : ℝ :=
  sSup (Set.range (fun s : ι → UnitAddCircle =>
    torusPredictedValue m s - torusVelocityValue v s))

theorem torusUniformShiftGap_eq_real (m v : ι → ℤ) :
    torusUniformShiftGap m v = uniformShiftGap m v := by
  unfold torusUniformShiftGap uniformShiftGap
  apply congrArg sSup
  ext y
  constructor
  · rintro ⟨s, hs⟩
    obtain ⟨r, rfl⟩ := real_shift_surjective s
    exact ⟨r, by simpa only [torusPredictedValue_coe, torusVelocityValue_coe] using hs⟩
  · rintro ⟨r, hr⟩
    refine ⟨fun i => (r i : UnitAddCircle), ?_⟩
    simpa only [torusPredictedValue_coe, torusVelocityValue_coe] using hr

end

end Loneliness.Hyperplane
