import Conjectures.LonelinessFiveSpeedBoundedCheckBlocks
import Conjectures.LonelinessFiveSpeedLineReductionData
import Conjectures.LonelinessFiveSpeedBoundedCandidates
import Conjectures.LonelinessFiveSpeedScalarTreeMask1009
import Conjectures.LonelinessFiveSpeedScalarTreeMask1013

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M49

open Matrix
open scoped Matrix

def badSlopes : List ℕ := [0, 4, 5, 9, 250, 254, 255, 259, 500, 504, 505, 509, 750, 754, 755, 759, 1000, 1004, 1005]

theorem slopes_checked : slopeCoverCheck 1009
    (treeMask 1009 ScalarTrees.P1009.tree) (boundedMaps 49) badSlopes = true := by
  decide +kernel

private theorem pairs_range_000_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49)
    (23 * boundedMapL 49) [0, 4, 5, 9] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_000_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49)
    (23 * boundedMapL 49) [0, 4, 5, 9] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_000_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49)
    (23 * boundedMapL 49) [0, 4, 5, 9] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49) (23 * boundedMapL 49)
    [0, 4, 5, 9] candidateTuples 0 64 52
    pairs_range_000_000 pairs_range_000_001

private theorem pairs_chunk_000 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49)
    (23 * boundedMapL 49) [0, 4, 5, 9] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49) (23 * boundedMapL 49)
    [0, 4, 5, 9] candidateTuples pairs_range_join_000_000_002

private theorem pairs_range_001_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49)
    (23 * boundedMapL 49) [250, 254, 255, 259] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_001_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49)
    (23 * boundedMapL 49) [250, 254, 255, 259] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_001_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49)
    (23 * boundedMapL 49) [250, 254, 255, 259] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49) (23 * boundedMapL 49)
    [250, 254, 255, 259] candidateTuples 0 64 52
    pairs_range_001_000 pairs_range_001_001

private theorem pairs_chunk_001 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49)
    (23 * boundedMapL 49) [250, 254, 255, 259] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49) (23 * boundedMapL 49)
    [250, 254, 255, 259] candidateTuples pairs_range_join_001_000_002

private theorem pairs_range_002_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49)
    (23 * boundedMapL 49) [500, 504, 505, 509] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_002_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49)
    (23 * boundedMapL 49) [500, 504, 505, 509] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_002_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49)
    (23 * boundedMapL 49) [500, 504, 505, 509] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49) (23 * boundedMapL 49)
    [500, 504, 505, 509] candidateTuples 0 64 52
    pairs_range_002_000 pairs_range_002_001

private theorem pairs_chunk_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49)
    (23 * boundedMapL 49) [500, 504, 505, 509] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49) (23 * boundedMapL 49)
    [500, 504, 505, 509] candidateTuples pairs_range_join_002_000_002

private theorem pairs_range_003_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49)
    (23 * boundedMapL 49) [750, 754, 755, 759] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_003_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49)
    (23 * boundedMapL 49) [750, 754, 755, 759] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_003_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49)
    (23 * boundedMapL 49) [750, 754, 755, 759] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49) (23 * boundedMapL 49)
    [750, 754, 755, 759] candidateTuples 0 64 52
    pairs_range_003_000 pairs_range_003_001

private theorem pairs_chunk_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49)
    (23 * boundedMapL 49) [750, 754, 755, 759] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49) (23 * boundedMapL 49)
    [750, 754, 755, 759] candidateTuples pairs_range_join_003_000_002

private theorem pairs_range_004_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49)
    (23 * boundedMapL 49) [1000, 1004, 1005] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_004_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49)
    (23 * boundedMapL 49) [1000, 1004, 1005] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_004_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49)
    (23 * boundedMapL 49) [1000, 1004, 1005] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49) (23 * boundedMapL 49)
    [1000, 1004, 1005] candidateTuples 0 64 52
    pairs_range_004_000 pairs_range_004_001

private theorem pairs_chunk_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49)
    (23 * boundedMapL 49) [1000, 1004, 1005] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49) (23 * boundedMapL 49)
    [1000, 1004, 1005] candidateTuples pairs_range_join_004_000_002

private theorem pairs_join_000_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49)
    (23 * boundedMapL 49) [0, 4, 5, 9, 250, 254, 255, 259] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49) (23 * boundedMapL 49)
    [0, 4, 5, 9] [250, 254, 255, 259] candidateTuples
    pairs_chunk_000 pairs_chunk_001

private theorem pairs_join_003_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49)
    (23 * boundedMapL 49) [750, 754, 755, 759, 1000, 1004, 1005] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49) (23 * boundedMapL 49)
    [750, 754, 755, 759] [1000, 1004, 1005] candidateTuples
    pairs_chunk_003 pairs_chunk_004

private theorem pairs_join_002_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49)
    (23 * boundedMapL 49) [500, 504, 505, 509, 750, 754, 755, 759, 1000, 1004, 1005] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49) (23 * boundedMapL 49)
    [500, 504, 505, 509] [750, 754, 755, 759, 1000, 1004, 1005] candidateTuples
    pairs_chunk_002 pairs_join_003_005

private theorem pairs_join_000_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49)
    (23 * boundedMapL 49) [0, 4, 5, 9, 250, 254, 255, 259, 500, 504, 505, 509, 750, 754, 755, 759, 1000, 1004, 1005] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49) (23 * boundedMapL 49)
    [0, 4, 5, 9, 250, 254, 255, 259] [500, 504, 505, 509, 750, 754, 755, 759, 1000, 1004, 1005] candidateTuples
    pairs_join_000_002 pairs_join_002_005

theorem pairs_checked : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 49)
    (23 * boundedMapL 49) badSlopes candidateTuples = true := by
  exact pairs_join_000_005

theorem sound (x : ℕ) (hx : 0 < x) (hxK : x ≤ (23 * boundedMapL 49))
    (y : ℤ) (hy : y.natAbs ≤ (23 * boundedMapL 49)) (hcop : Nat.gcd x y.natAbs = 1)
    (hnonzero : ∀ i, ((boundedMaps 49) *ᵥ ![(x : ℤ), y]) i ≠ 0)
    (hdistinct : Function.Injective (fun i => (((boundedMaps 49) *ᵥ ![(x : ℤ), y]) i).natAbs))
    (hnot : ¬Loneliness.CriticalFamilies.ContainsCriticalQuadruple
      (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 49) *ᵥ ![(x : ℤ), y])))
    (hlow : Loneliness.value (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 49) *ᵥ ![(x : ℤ), y])) < (1 / 5 : ℝ)) :
    Loneliness.Modular.primitiveDirection ((boundedMaps 49) *ᵥ ![(x : ℤ), y]) ∈ candidateTuples :=
  boundedSlopeScanCheck_candidates 1009 1013
    (treeMask 1009 ScalarTrees.P1009.tree) (treeMask 1013 ScalarTrees.P1013.tree)
    (boundedMaps 49) (23 * boundedMapL 49) badSlopes candidateTuples
    ScalarTrees.P1009.prime (by decide) (by decide +kernel)
    ScalarTrees.P1009.sound ScalarTrees.P1013.sound slopes_checked pairs_checked
    x hx hxK y hy hcop hnonzero hdistinct hnot hlow

end Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M49
