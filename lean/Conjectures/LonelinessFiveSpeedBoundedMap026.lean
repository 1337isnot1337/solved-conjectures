import Conjectures.LonelinessFiveSpeedBoundedCheckDefs
import Conjectures.LonelinessFiveSpeedLineReductionData
import Conjectures.LonelinessFiveSpeedBoundedCandidates
import Conjectures.LonelinessFiveSpeedScalarTreeMask1009
import Conjectures.LonelinessFiveSpeedScalarTreeMask1013

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M26

open Matrix
open scoped Matrix

def badSlopes : List ℕ := [0, 2, 3, 8, 32, 72, 77, 112, 143, 167, 168, 224, 252, 254, 269, 287, 302, 378, 392, 403, 404, 415, 420, 432, 438, 500, 502, 503, 504, 505, 506, 507, 531, 550, 567, 576, 604, 605, 621, 630, 665, 667, 670, 671, 672, 673, 674, 698, 720, 733, 755, 756, 757, 776, 783, 784, 785, 806, 807, 825, 831, 864, 865, 882, 883, 896, 908, 925, 985, 1002, 1003, 1005, 1006, 1007, 1008]

theorem slopes_checked : slopeCoverCheck 1009
    (treeMask 1009 ScalarTrees.P1009.tree) (boundedMaps 26) badSlopes = true := by
  decide +kernel

theorem pairs_checked : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 26)
    (23 * boundedMapL 26) badSlopes candidateTuples = true := by
  decide +kernel

theorem sound (x : ℕ) (hx : 0 < x) (hxK : x ≤ (23 * boundedMapL 26))
    (y : ℤ) (hy : y.natAbs ≤ (23 * boundedMapL 26)) (hcop : Nat.gcd x y.natAbs = 1)
    (hnonzero : ∀ i, ((boundedMaps 26) *ᵥ ![(x : ℤ), y]) i ≠ 0)
    (hdistinct : Function.Injective (fun i => (((boundedMaps 26) *ᵥ ![(x : ℤ), y]) i).natAbs))
    (hnot : ¬Loneliness.CriticalFamilies.ContainsCriticalQuadruple
      (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 26) *ᵥ ![(x : ℤ), y])))
    (hlow : Loneliness.value (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 26) *ᵥ ![(x : ℤ), y])) < (1 / 5 : ℝ)) :
    Loneliness.Modular.primitiveDirection ((boundedMaps 26) *ᵥ ![(x : ℤ), y]) ∈ candidateTuples :=
  boundedSlopeScanCheck_candidates 1009 1013
    (treeMask 1009 ScalarTrees.P1009.tree) (treeMask 1013 ScalarTrees.P1013.tree)
    (boundedMaps 26) (23 * boundedMapL 26) badSlopes candidateTuples
    ScalarTrees.P1009.prime (by decide) (by decide +kernel)
    ScalarTrees.P1009.sound ScalarTrees.P1013.sound slopes_checked pairs_checked
    x hx hxK y hy hcop hnonzero hdistinct hnot hlow

end Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M26
