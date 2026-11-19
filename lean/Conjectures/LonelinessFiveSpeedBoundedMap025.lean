import Conjectures.LonelinessFiveSpeedBoundedCheckDefs
import Conjectures.LonelinessFiveSpeedLineReductionData
import Conjectures.LonelinessFiveSpeedBoundedCandidates
import Conjectures.LonelinessFiveSpeedScalarTreeMask1009
import Conjectures.LonelinessFiveSpeedScalarTreeMask1013

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M25

open Matrix
open scoped Matrix

def badSlopes : List ℕ := [0, 1, 2, 3, 5, 6, 23, 83, 100, 112, 125, 126, 143, 144, 177, 183, 201, 202, 223, 224, 225, 232, 251, 252, 253, 275, 288, 310, 334, 335, 336, 337, 338, 341, 343, 378, 387, 403, 404, 432, 441, 458, 477, 501, 502, 503, 504, 505, 506, 508, 570, 576, 588, 593, 604, 605, 616, 630, 706, 721, 739, 754, 756, 784, 840, 841, 865, 896, 931, 936, 976, 1000, 1005, 1006, 1008]

theorem slopes_checked : slopeCoverCheck 1009
    (treeMask 1009 ScalarTrees.P1009.tree) (boundedMaps 25) badSlopes = true := by
  decide +kernel

theorem pairs_checked : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) badSlopes candidateTuples = true := by
  decide +kernel

theorem sound (x : ℕ) (hx : 0 < x) (hxK : x ≤ (23 * boundedMapL 25))
    (y : ℤ) (hy : y.natAbs ≤ (23 * boundedMapL 25)) (hcop : Nat.gcd x y.natAbs = 1)
    (hnonzero : ∀ i, ((boundedMaps 25) *ᵥ ![(x : ℤ), y]) i ≠ 0)
    (hdistinct : Function.Injective (fun i => (((boundedMaps 25) *ᵥ ![(x : ℤ), y]) i).natAbs))
    (hnot : ¬Loneliness.CriticalFamilies.ContainsCriticalQuadruple
      (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 25) *ᵥ ![(x : ℤ), y])))
    (hlow : Loneliness.value (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 25) *ᵥ ![(x : ℤ), y])) < (1 / 5 : ℝ)) :
    Loneliness.Modular.primitiveDirection ((boundedMaps 25) *ᵥ ![(x : ℤ), y]) ∈ candidateTuples :=
  boundedSlopeScanCheck_candidates 1009 1013
    (treeMask 1009 ScalarTrees.P1009.tree) (treeMask 1013 ScalarTrees.P1013.tree)
    (boundedMaps 25) (23 * boundedMapL 25) badSlopes candidateTuples
    ScalarTrees.P1009.prime (by decide) (by decide +kernel)
    ScalarTrees.P1009.sound ScalarTrees.P1013.sound slopes_checked pairs_checked
    x hx hxK y hy hcop hnonzero hdistinct hnot hlow

end Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M25
