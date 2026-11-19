import Conjectures.LonelinessFiveSpeedBoundedCheckDefs
import Conjectures.LonelinessFiveSpeedLineReductionData
import Conjectures.LonelinessFiveSpeedBoundedCandidates
import Conjectures.LonelinessFiveSpeedScalarTreeMask1009
import Conjectures.LonelinessFiveSpeedScalarTreeMask1013

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M41

open Matrix
open scoped Matrix

def badSlopes : List ℕ := [0, 3, 4, 8, 143, 168, 252, 253, 335, 338, 432, 502, 503, 504, 505, 506, 576, 670, 673, 755, 756, 840, 865, 1000, 1004, 1005, 1008]

theorem slopes_checked : slopeCoverCheck 1009
    (treeMask 1009 ScalarTrees.P1009.tree) (boundedMaps 41) badSlopes = true := by
  decide +kernel

theorem pairs_checked : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) badSlopes candidateTuples = true := by
  decide +kernel

theorem sound (x : ℕ) (hx : 0 < x) (hxK : x ≤ (23 * boundedMapL 41))
    (y : ℤ) (hy : y.natAbs ≤ (23 * boundedMapL 41)) (hcop : Nat.gcd x y.natAbs = 1)
    (hnonzero : ∀ i, ((boundedMaps 41) *ᵥ ![(x : ℤ), y]) i ≠ 0)
    (hdistinct : Function.Injective (fun i => (((boundedMaps 41) *ᵥ ![(x : ℤ), y]) i).natAbs))
    (hnot : ¬Loneliness.CriticalFamilies.ContainsCriticalQuadruple
      (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 41) *ᵥ ![(x : ℤ), y])))
    (hlow : Loneliness.value (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 41) *ᵥ ![(x : ℤ), y])) < (1 / 5 : ℝ)) :
    Loneliness.Modular.primitiveDirection ((boundedMaps 41) *ᵥ ![(x : ℤ), y]) ∈ candidateTuples :=
  boundedSlopeScanCheck_candidates 1009 1013
    (treeMask 1009 ScalarTrees.P1009.tree) (treeMask 1013 ScalarTrees.P1013.tree)
    (boundedMaps 41) (23 * boundedMapL 41) badSlopes candidateTuples
    ScalarTrees.P1009.prime (by decide) (by decide +kernel)
    ScalarTrees.P1009.sound ScalarTrees.P1013.sound slopes_checked pairs_checked
    x hx hxK y hy hcop hnonzero hdistinct hnot hlow

end Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M41
