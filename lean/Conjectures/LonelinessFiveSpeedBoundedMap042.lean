import Conjectures.LonelinessFiveSpeedBoundedCheckDefs
import Conjectures.LonelinessFiveSpeedLineReductionData
import Conjectures.LonelinessFiveSpeedBoundedCandidates
import Conjectures.LonelinessFiveSpeedScalarTreeMask1009
import Conjectures.LonelinessFiveSpeedScalarTreeMask1013

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M42

open Matrix
open scoped Matrix

def badSlopes : List ℕ := [0, 2, 4, 6, 13, 15, 17, 19, 21, 32, 34, 36, 973, 975, 977, 988, 990, 992, 994, 996, 1003, 1005, 1007]

theorem slopes_checked : slopeCoverCheck 1009
    (treeMask 1009 ScalarTrees.P1009.tree) (boundedMaps 42) badSlopes = true := by
  decide +kernel

theorem pairs_checked : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 42)
    (23 * boundedMapL 42) badSlopes candidateTuples = true := by
  decide +kernel

theorem sound (x : ℕ) (hx : 0 < x) (hxK : x ≤ (23 * boundedMapL 42))
    (y : ℤ) (hy : y.natAbs ≤ (23 * boundedMapL 42)) (hcop : Nat.gcd x y.natAbs = 1)
    (hnonzero : ∀ i, ((boundedMaps 42) *ᵥ ![(x : ℤ), y]) i ≠ 0)
    (hdistinct : Function.Injective (fun i => (((boundedMaps 42) *ᵥ ![(x : ℤ), y]) i).natAbs))
    (hnot : ¬Loneliness.CriticalFamilies.ContainsCriticalQuadruple
      (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 42) *ᵥ ![(x : ℤ), y])))
    (hlow : Loneliness.value (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 42) *ᵥ ![(x : ℤ), y])) < (1 / 5 : ℝ)) :
    Loneliness.Modular.primitiveDirection ((boundedMaps 42) *ᵥ ![(x : ℤ), y]) ∈ candidateTuples :=
  boundedSlopeScanCheck_candidates 1009 1013
    (treeMask 1009 ScalarTrees.P1009.tree) (treeMask 1013 ScalarTrees.P1013.tree)
    (boundedMaps 42) (23 * boundedMapL 42) badSlopes candidateTuples
    ScalarTrees.P1009.prime (by decide) (by decide +kernel)
    ScalarTrees.P1009.sound ScalarTrees.P1013.sound slopes_checked pairs_checked
    x hx hxK y hy hcop hnonzero hdistinct hnot hlow

end Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M42
