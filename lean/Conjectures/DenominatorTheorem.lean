import Conjectures.DenominatorLimit
import Conjectures.DenominatorPrefixCertificate
import Conjectures.DenominatorMinimality

namespace DenominatorForest

open Polynomial PrefixCertificate

theorem primary_common_denominator :
    (Denominator.dualQ:PowerSeries ℚ)*primarySeries=
      ((Denominator.primaryR*factorF:ℚ[X]):PowerSeries ℚ) := by
  have h := primary_generic_identity
  simpa only [← Polynomial.coe_sub,primary_denominator,primary_numerator] using h

theorem primary_identity :
    (Denominator.primaryQ:PowerSeries ℚ)*primarySeries=(Denominator.primaryR:PowerSeries ℚ) := by
  have h := primary_common_denominator
  rw [commonDenominator_factor,Polynomial.coe_mul,Polynomial.coe_mul] at h
  have hu : IsUnit (factorF:PowerSeries ℚ) := by
    apply PowerSeries.isUnit_iff_constantCoeff.mpr
    rw [← PowerSeries.coeff_zero_eq_constantCoeff_apply,Polynomial.coeff_coe]
    have hc : factorF.coeff 0=1 := by simp [factorF]
    rw [hc]
    exact isUnit_one
  apply hu.mul_left_cancel
  calc
    (factorF:PowerSeries ℚ)*((Denominator.primaryQ:PowerSeries ℚ)*primarySeries)=
        (Denominator.primaryQ:PowerSeries ℚ)*(factorF:PowerSeries ℚ)*primarySeries := by ring
    _ = (Denominator.primaryR:PowerSeries ℚ)*(factorF:PowerSeries ℚ) := h
    _ = (factorF:PowerSeries ℚ)*(Denominator.primaryR:PowerSeries ℚ) := by ring

theorem dual_identity :
    (Denominator.dualQ:PowerSeries ℚ)*dualSeries=(Denominator.dualR:PowerSeries ℚ) := by
  have h := dual_generic_identity
  simpa only [← Polynomial.coe_sub,dual_denominator,dual_numerator] using h

theorem primary_identity_of_orbit_limit (H : PowerSeries ℚ)
    (hH : IsOrbitLevelLimit primaryWord H) :
    (Denominator.primaryQ:PowerSeries ℚ)*H=(Denominator.primaryR:PowerSeries ℚ) := by
  rw [orbitLevelLimit_unique primaryWord H primarySeries hH primary_level_limit]
  exact primary_identity

theorem dual_identity_of_orbit_limit (H : PowerSeries ℚ)
    (hH : IsOrbitLevelLimit dualWord H) :
    (Denominator.dualQ:PowerSeries ℚ)*H=(Denominator.dualR:PowerSeries ℚ) := by
  rw [orbitLevelLimit_unique dualWord H dualSeries hH dual_level_limit]
  exact dual_identity

theorem primary_denominator_minimal (A B : ℚ[X])
    (hB : (B:PowerSeries ℚ)*primarySeries=(A:PowerSeries ℚ)) (hB0 : B ≠ 0) :
    5 ≤ B.natDegree :=
  Denominator.primary_minimal_degree primarySeries primary_identity A B hB hB0

theorem dual_denominator_minimal (A B : ℚ[X])
    (hB : (B:PowerSeries ℚ)*dualSeries=(A:PowerSeries ℚ)) (hB0 : B ≠ 0) :
    10 ≤ B.natDegree :=
  Denominator.dual_minimal_degree dualSeries dual_identity A B hB hB0

/-- The primary length-ten primitive necklace has an actual limiting level
series whose reduced denominator has degree five. -/
theorem pham_denominator_counterexample :
    primaryWord.length=10 ∧ RotationsDistinct primaryWord ∧
    IsOrbitLevelLimit primaryWord primarySeries ∧
    (Denominator.primaryQ:PowerSeries ℚ)*primarySeries=(Denominator.primaryR:PowerSeries ℚ) ∧
    IsCoprime Denominator.primaryQ Denominator.primaryR ∧
    Denominator.primaryQ.natDegree=5 ∧
    (∀ A B : ℚ[X], (B:PowerSeries ℚ)*primarySeries=(A:PowerSeries ℚ) → B ≠ 0 → 5 ≤ B.natDegree) :=
  ⟨primary_length,primary_rotations_distinct,primary_level_limit,primary_identity,
    Denominator.primary_coprime,primary_denominator_degree,primary_denominator_minimal⟩

/-- Reversing and complementing the word gives a primitive dual with reduced
denominator degree ten. Its limit is again derived from actual finite levels. -/
theorem pham_dual_denominator :
    dualWord=primaryWord.reverse.map (fun b => 1-b) ∧
    dualWord.length=10 ∧ RotationsDistinct dualWord ∧
    IsOrbitLevelLimit dualWord dualSeries ∧
    (Denominator.dualQ:PowerSeries ℚ)*dualSeries=(Denominator.dualR:PowerSeries ℚ) ∧
    IsCoprime Denominator.dualQ Denominator.dualR ∧
    Denominator.dualQ.natDegree=10 ∧
    (∀ A B : ℚ[X], (B:PowerSeries ℚ)*dualSeries=(A:PowerSeries ℚ) → B ≠ 0 → 10 ≤ B.natDegree) :=
  ⟨dual_reverse_complement,dual_length,dual_rotations_distinct,dual_level_limit,dual_identity,
    Denominator.dual_coprime,dual_denominator_degree,dual_denominator_minimal⟩

end DenominatorForest
