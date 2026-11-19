import Conjectures.LonelinessFiveSpeedBoundedCheckBlocks
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

private theorem pairs_range_000_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [0, 3, 4, 8] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_000_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [0, 3, 4, 8] candidateTuples 64 6 = true := by
  decide +kernel

private theorem pairs_range_join_000_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [0, 3, 4, 8] candidateTuples 0 70 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41) (23 * boundedMapL 41)
    [0, 3, 4, 8] candidateTuples 0 64 6
    pairs_range_000_000 pairs_range_000_001

private theorem pairs_chunk_000 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [0, 3, 4, 8] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41) (23 * boundedMapL 41)
    [0, 3, 4, 8] candidateTuples pairs_range_join_000_000_002

private theorem pairs_range_001_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [143, 168, 252, 253] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_001_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [143, 168, 252, 253] candidateTuples 64 6 = true := by
  decide +kernel

private theorem pairs_range_join_001_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [143, 168, 252, 253] candidateTuples 0 70 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41) (23 * boundedMapL 41)
    [143, 168, 252, 253] candidateTuples 0 64 6
    pairs_range_001_000 pairs_range_001_001

private theorem pairs_chunk_001 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [143, 168, 252, 253] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41) (23 * boundedMapL 41)
    [143, 168, 252, 253] candidateTuples pairs_range_join_001_000_002

private theorem pairs_range_002_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [335, 338, 432, 502] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_002_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [335, 338, 432, 502] candidateTuples 64 6 = true := by
  decide +kernel

private theorem pairs_range_join_002_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [335, 338, 432, 502] candidateTuples 0 70 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41) (23 * boundedMapL 41)
    [335, 338, 432, 502] candidateTuples 0 64 6
    pairs_range_002_000 pairs_range_002_001

private theorem pairs_chunk_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [335, 338, 432, 502] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41) (23 * boundedMapL 41)
    [335, 338, 432, 502] candidateTuples pairs_range_join_002_000_002

private theorem pairs_range_003_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [503, 504, 505, 506] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_003_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [503, 504, 505, 506] candidateTuples 64 6 = true := by
  decide +kernel

private theorem pairs_range_join_003_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [503, 504, 505, 506] candidateTuples 0 70 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41) (23 * boundedMapL 41)
    [503, 504, 505, 506] candidateTuples 0 64 6
    pairs_range_003_000 pairs_range_003_001

private theorem pairs_chunk_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [503, 504, 505, 506] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41) (23 * boundedMapL 41)
    [503, 504, 505, 506] candidateTuples pairs_range_join_003_000_002

private theorem pairs_range_004_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [576, 670, 673, 755] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_004_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [576, 670, 673, 755] candidateTuples 64 6 = true := by
  decide +kernel

private theorem pairs_range_join_004_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [576, 670, 673, 755] candidateTuples 0 70 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41) (23 * boundedMapL 41)
    [576, 670, 673, 755] candidateTuples 0 64 6
    pairs_range_004_000 pairs_range_004_001

private theorem pairs_chunk_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [576, 670, 673, 755] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41) (23 * boundedMapL 41)
    [576, 670, 673, 755] candidateTuples pairs_range_join_004_000_002

private theorem pairs_range_005_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [756, 840, 865, 1000] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_005_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [756, 840, 865, 1000] candidateTuples 64 6 = true := by
  decide +kernel

private theorem pairs_range_join_005_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [756, 840, 865, 1000] candidateTuples 0 70 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41) (23 * boundedMapL 41)
    [756, 840, 865, 1000] candidateTuples 0 64 6
    pairs_range_005_000 pairs_range_005_001

private theorem pairs_chunk_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [756, 840, 865, 1000] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41) (23 * boundedMapL 41)
    [756, 840, 865, 1000] candidateTuples pairs_range_join_005_000_002

private theorem pairs_range_006_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [1004, 1005, 1008] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_006_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [1004, 1005, 1008] candidateTuples 64 6 = true := by
  decide +kernel

private theorem pairs_range_join_006_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [1004, 1005, 1008] candidateTuples 0 70 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41) (23 * boundedMapL 41)
    [1004, 1005, 1008] candidateTuples 0 64 6
    pairs_range_006_000 pairs_range_006_001

private theorem pairs_chunk_006 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [1004, 1005, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41) (23 * boundedMapL 41)
    [1004, 1005, 1008] candidateTuples pairs_range_join_006_000_002

private theorem pairs_join_001_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [143, 168, 252, 253, 335, 338, 432, 502] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41) (23 * boundedMapL 41)
    [143, 168, 252, 253] [335, 338, 432, 502] candidateTuples
    pairs_chunk_001 pairs_chunk_002

private theorem pairs_join_000_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [0, 3, 4, 8, 143, 168, 252, 253, 335, 338, 432, 502] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41) (23 * boundedMapL 41)
    [0, 3, 4, 8] [143, 168, 252, 253, 335, 338, 432, 502] candidateTuples
    pairs_chunk_000 pairs_join_001_003

private theorem pairs_join_003_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [503, 504, 505, 506, 576, 670, 673, 755] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41) (23 * boundedMapL 41)
    [503, 504, 505, 506] [576, 670, 673, 755] candidateTuples
    pairs_chunk_003 pairs_chunk_004

private theorem pairs_join_005_007 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [756, 840, 865, 1000, 1004, 1005, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41) (23 * boundedMapL 41)
    [756, 840, 865, 1000] [1004, 1005, 1008] candidateTuples
    pairs_chunk_005 pairs_chunk_006

private theorem pairs_join_003_007 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [503, 504, 505, 506, 576, 670, 673, 755, 756, 840, 865, 1000, 1004, 1005, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41) (23 * boundedMapL 41)
    [503, 504, 505, 506, 576, 670, 673, 755] [756, 840, 865, 1000, 1004, 1005, 1008] candidateTuples
    pairs_join_003_005 pairs_join_005_007

private theorem pairs_join_000_007 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) [0, 3, 4, 8, 143, 168, 252, 253, 335, 338, 432, 502, 503, 504, 505, 506, 576, 670, 673, 755, 756, 840, 865, 1000, 1004, 1005, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41) (23 * boundedMapL 41)
    [0, 3, 4, 8, 143, 168, 252, 253, 335, 338, 432, 502] [503, 504, 505, 506, 576, 670, 673, 755, 756, 840, 865, 1000, 1004, 1005, 1008] candidateTuples
    pairs_join_000_003 pairs_join_003_007

theorem pairs_checked : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 41)
    (23 * boundedMapL 41) badSlopes candidateTuples = true := by
  exact pairs_join_000_007

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
