import Conjectures.LonelinessSixSpectrumNormGeometry
import Conjectures.LonelinessSixPlaneClassification

/-! The norm cutoff for vectors outside the three actual signed rational
critical planes. The proved four-speed bound is used internally. Complete
finite pair coverage and five-speed exhaustion are the remaining inputs.
-/

namespace Loneliness.SixSpectrumNormGeometry

open scoped BigOperators
open CoordinateSubspace

noncomputable section

/-- The integer vector belongs to none of the three critical plane types,
including every signed coordinate permutation of those planes. -/
def OffCritical (v : Fin 6 → ℕ) : Prop :=
  ∀ E : Submodule ℚ (Fin 6 → ℚ), SixPlane.CriticalPlane E →
    (fun i => (v i : ℚ)) ∉ E

theorem containingPlaneGap_of_checked_exhaustion
    (hchecked : SixPlane.CandidatePairsChecked)
    (hexhaustion : FiveSpeedCertificate.SporadicExhaustion)
    (v : Fin 6 → ℕ) (hpositive : ∀ i, 0 < v i) (hoff : OffCritical v) :
    ContainingPlaneGap v := by
  intro E hmem hdim
  have hfree : CoordinateFree E := by
    intro i
    refine ⟨(fun j => (v j : ℚ)), hmem, ?_⟩
    change (v i : ℚ) ≠ 0
    exact_mod_cast (hpositive i).ne'
  exact SixPlane.noncritical_value_ge_two_elevenths_of_checked_exhaustion
    hchecked hexhaustion E hfree hdim (fun hcritical => hoff E hcritical hmem)

theorem norm_lt_of_checked_exhaustion
    (hchecked : SixPlane.CandidatePairsChecked)
    (hexhaustion : FiveSpeedCertificate.SporadicExhaustion)
    (v : Fin 6 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) < (1 / 6 : ℝ)) (hoff : OffCritical v) :
    ‖KZBasis.realVector (fun i => (v i : ℤ))‖ < (21829 : ℝ) :=
  norm_lt v hpositive hprimitive hvalue.le four_speed_lonelyRunnerBound
    (containingPlaneGap_of_checked_exhaustion hchecked hexhaustion v hpositive hoff)

theorem natural_squaredNorm_lt_of_checked_exhaustion
    (hchecked : SixPlane.CandidatePairsChecked)
    (hexhaustion : FiveSpeedCertificate.SporadicExhaustion)
    (v : Fin 6 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) < (1 / 6 : ℝ)) (hoff : OffCritical v) :
    (∑ i, (v i) ^ 2) < 21829 ^ 2 :=
  natural_squaredNorm_lt v hpositive hprimitive hvalue.le four_speed_lonelyRunnerBound
    (containingPlaneGap_of_checked_exhaustion hchecked hexhaustion v hpositive hoff)

end

end Loneliness.SixSpectrumNormGeometry
