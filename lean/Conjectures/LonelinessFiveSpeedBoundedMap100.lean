import Conjectures.LonelinessFiveSpeedBoundedCheckBlocks
import Conjectures.LonelinessFiveSpeedLineReductionData
import Conjectures.LonelinessFiveSpeedBoundedCandidates
import Conjectures.LonelinessFiveSpeedScalarTreeMask1009
import Conjectures.LonelinessFiveSpeedScalarTreeMask1013

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M100

open Matrix
open scoped Matrix

def badSlopes : List ℕ := [0, 84, 126, 252, 757, 883, 925]

theorem slopes_checked : slopeCoverCheck 1009
    (treeMask 1009 ScalarTrees.P1009.tree) (boundedMaps 100) badSlopes = true := by
  decide +kernel

private theorem pairs_range_000_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 100)
    (23 * boundedMapL 100) [0, 84, 126, 252] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_000_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 100)
    (23 * boundedMapL 100) [0, 84, 126, 252] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_000_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 100)
    (23 * boundedMapL 100) [0, 84, 126, 252] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 100) (23 * boundedMapL 100)
    [0, 84, 126, 252] candidateTuples 0 64 52
    pairs_range_000_000 pairs_range_000_001

private theorem pairs_chunk_000 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 100)
    (23 * boundedMapL 100) [0, 84, 126, 252] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 100) (23 * boundedMapL 100)
    [0, 84, 126, 252] candidateTuples pairs_range_join_000_000_002

private theorem pairs_range_001_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 100)
    (23 * boundedMapL 100) [757, 883, 925] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_001_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 100)
    (23 * boundedMapL 100) [757, 883, 925] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_001_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 100)
    (23 * boundedMapL 100) [757, 883, 925] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 100) (23 * boundedMapL 100)
    [757, 883, 925] candidateTuples 0 64 52
    pairs_range_001_000 pairs_range_001_001

private theorem pairs_chunk_001 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 100)
    (23 * boundedMapL 100) [757, 883, 925] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 100) (23 * boundedMapL 100)
    [757, 883, 925] candidateTuples pairs_range_join_001_000_002

private theorem pairs_join_000_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 100)
    (23 * boundedMapL 100) [0, 84, 126, 252, 757, 883, 925] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 100) (23 * boundedMapL 100)
    [0, 84, 126, 252] [757, 883, 925] candidateTuples
    pairs_chunk_000 pairs_chunk_001

theorem pairs_checked : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 100)
    (23 * boundedMapL 100) badSlopes candidateTuples = true := by
  exact pairs_join_000_002

theorem sound (x : ℕ) (hx : 0 < x) (hxK : x ≤ (23 * boundedMapL 100))
    (y : ℤ) (hy : y.natAbs ≤ (23 * boundedMapL 100)) (hcop : Nat.gcd x y.natAbs = 1)
    (hnonzero : ∀ i, ((boundedMaps 100) *ᵥ ![(x : ℤ), y]) i ≠ 0)
    (hdistinct : Function.Injective (fun i => (((boundedMaps 100) *ᵥ ![(x : ℤ), y]) i).natAbs))
    (hnot : ¬Loneliness.CriticalFamilies.ContainsCriticalQuadruple
      (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 100) *ᵥ ![(x : ℤ), y])))
    (hlow : Loneliness.value (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 100) *ᵥ ![(x : ℤ), y])) < (1 / 5 : ℝ)) :
    Loneliness.Modular.primitiveDirection ((boundedMaps 100) *ᵥ ![(x : ℤ), y]) ∈ candidateTuples :=
  boundedSlopeScanCheck_candidates 1009 1013
    (treeMask 1009 ScalarTrees.P1009.tree) (treeMask 1013 ScalarTrees.P1013.tree)
    (boundedMaps 100) (23 * boundedMapL 100) badSlopes candidateTuples
    ScalarTrees.P1009.prime (by decide) (by decide +kernel)
    ScalarTrees.P1009.sound ScalarTrees.P1013.sound slopes_checked pairs_checked
    x hx hxK y hy hcop hnonzero hdistinct hnot hlow

end Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M100
