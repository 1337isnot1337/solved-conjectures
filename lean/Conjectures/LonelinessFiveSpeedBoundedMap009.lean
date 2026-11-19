import Conjectures.LonelinessFiveSpeedBoundedCheckBlocks
import Conjectures.LonelinessFiveSpeedLineReductionData
import Conjectures.LonelinessFiveSpeedBoundedCandidates
import Conjectures.LonelinessFiveSpeedScalarTreeMask1009
import Conjectures.LonelinessFiveSpeedScalarTreeMask1013

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M9

open Matrix
open scoped Matrix

def badSlopes : List ℕ := [0, 1, 2, 5, 7, 12, 330, 500, 501, 502, 503, 673, 991, 996, 998, 1001, 1002, 1003, 1005, 1007]

theorem slopes_checked : slopeCoverCheck 1009
    (treeMask 1009 ScalarTrees.P1009.tree) (boundedMaps 9) badSlopes = true := by
  decide +kernel

private theorem pairs_range_000_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [0, 1, 2, 5] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_000_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [0, 1, 2, 5] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [0, 1, 2, 5] candidateTuples 128 34 = true := by
  decide +kernel

private theorem pairs_range_join_000_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [0, 1, 2, 5] candidateTuples 64 98 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9) (23 * boundedMapL 9)
    [0, 1, 2, 5] candidateTuples 64 64 34
    pairs_range_000_001 pairs_range_000_002

private theorem pairs_range_join_000_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [0, 1, 2, 5] candidateTuples 0 162 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9) (23 * boundedMapL 9)
    [0, 1, 2, 5] candidateTuples 0 64 98
    pairs_range_000_000 pairs_range_join_000_001_003

private theorem pairs_chunk_000 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [0, 1, 2, 5] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9) (23 * boundedMapL 9)
    [0, 1, 2, 5] candidateTuples pairs_range_join_000_000_003

private theorem pairs_range_001_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [7, 12, 330, 500] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_001_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [7, 12, 330, 500] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_001_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [7, 12, 330, 500] candidateTuples 128 34 = true := by
  decide +kernel

private theorem pairs_range_join_001_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [7, 12, 330, 500] candidateTuples 64 98 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9) (23 * boundedMapL 9)
    [7, 12, 330, 500] candidateTuples 64 64 34
    pairs_range_001_001 pairs_range_001_002

private theorem pairs_range_join_001_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [7, 12, 330, 500] candidateTuples 0 162 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9) (23 * boundedMapL 9)
    [7, 12, 330, 500] candidateTuples 0 64 98
    pairs_range_001_000 pairs_range_join_001_001_003

private theorem pairs_chunk_001 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [7, 12, 330, 500] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9) (23 * boundedMapL 9)
    [7, 12, 330, 500] candidateTuples pairs_range_join_001_000_003

private theorem pairs_range_002_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [501, 502, 503, 673] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_002_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [501, 502, 503, 673] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_002_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [501, 502, 503, 673] candidateTuples 128 34 = true := by
  decide +kernel

private theorem pairs_range_join_002_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [501, 502, 503, 673] candidateTuples 64 98 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9) (23 * boundedMapL 9)
    [501, 502, 503, 673] candidateTuples 64 64 34
    pairs_range_002_001 pairs_range_002_002

private theorem pairs_range_join_002_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [501, 502, 503, 673] candidateTuples 0 162 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9) (23 * boundedMapL 9)
    [501, 502, 503, 673] candidateTuples 0 64 98
    pairs_range_002_000 pairs_range_join_002_001_003

private theorem pairs_chunk_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [501, 502, 503, 673] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9) (23 * boundedMapL 9)
    [501, 502, 503, 673] candidateTuples pairs_range_join_002_000_003

private theorem pairs_range_003_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [991, 996, 998, 1001] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_003_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [991, 996, 998, 1001] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_003_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [991, 996, 998, 1001] candidateTuples 128 34 = true := by
  decide +kernel

private theorem pairs_range_join_003_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [991, 996, 998, 1001] candidateTuples 64 98 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9) (23 * boundedMapL 9)
    [991, 996, 998, 1001] candidateTuples 64 64 34
    pairs_range_003_001 pairs_range_003_002

private theorem pairs_range_join_003_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [991, 996, 998, 1001] candidateTuples 0 162 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9) (23 * boundedMapL 9)
    [991, 996, 998, 1001] candidateTuples 0 64 98
    pairs_range_003_000 pairs_range_join_003_001_003

private theorem pairs_chunk_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [991, 996, 998, 1001] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9) (23 * boundedMapL 9)
    [991, 996, 998, 1001] candidateTuples pairs_range_join_003_000_003

private theorem pairs_range_004_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [1002, 1003, 1005, 1007] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_004_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [1002, 1003, 1005, 1007] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_004_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [1002, 1003, 1005, 1007] candidateTuples 128 34 = true := by
  decide +kernel

private theorem pairs_range_join_004_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [1002, 1003, 1005, 1007] candidateTuples 64 98 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9) (23 * boundedMapL 9)
    [1002, 1003, 1005, 1007] candidateTuples 64 64 34
    pairs_range_004_001 pairs_range_004_002

private theorem pairs_range_join_004_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [1002, 1003, 1005, 1007] candidateTuples 0 162 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9) (23 * boundedMapL 9)
    [1002, 1003, 1005, 1007] candidateTuples 0 64 98
    pairs_range_004_000 pairs_range_join_004_001_003

private theorem pairs_chunk_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [1002, 1003, 1005, 1007] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9) (23 * boundedMapL 9)
    [1002, 1003, 1005, 1007] candidateTuples pairs_range_join_004_000_003

private theorem pairs_join_000_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [0, 1, 2, 5, 7, 12, 330, 500] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9) (23 * boundedMapL 9)
    [0, 1, 2, 5] [7, 12, 330, 500] candidateTuples
    pairs_chunk_000 pairs_chunk_001

private theorem pairs_join_003_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [991, 996, 998, 1001, 1002, 1003, 1005, 1007] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9) (23 * boundedMapL 9)
    [991, 996, 998, 1001] [1002, 1003, 1005, 1007] candidateTuples
    pairs_chunk_003 pairs_chunk_004

private theorem pairs_join_002_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [501, 502, 503, 673, 991, 996, 998, 1001, 1002, 1003, 1005, 1007] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9) (23 * boundedMapL 9)
    [501, 502, 503, 673] [991, 996, 998, 1001, 1002, 1003, 1005, 1007] candidateTuples
    pairs_chunk_002 pairs_join_003_005

private theorem pairs_join_000_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) [0, 1, 2, 5, 7, 12, 330, 500, 501, 502, 503, 673, 991, 996, 998, 1001, 1002, 1003, 1005, 1007] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9) (23 * boundedMapL 9)
    [0, 1, 2, 5, 7, 12, 330, 500] [501, 502, 503, 673, 991, 996, 998, 1001, 1002, 1003, 1005, 1007] candidateTuples
    pairs_join_000_002 pairs_join_002_005

theorem pairs_checked : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 9)
    (23 * boundedMapL 9) badSlopes candidateTuples = true := by
  exact pairs_join_000_005

theorem sound (x : ℕ) (hx : 0 < x) (hxK : x ≤ (23 * boundedMapL 9))
    (y : ℤ) (hy : y.natAbs ≤ (23 * boundedMapL 9)) (hcop : Nat.gcd x y.natAbs = 1)
    (hnonzero : ∀ i, ((boundedMaps 9) *ᵥ ![(x : ℤ), y]) i ≠ 0)
    (hdistinct : Function.Injective (fun i => (((boundedMaps 9) *ᵥ ![(x : ℤ), y]) i).natAbs))
    (hnot : ¬Loneliness.CriticalFamilies.ContainsCriticalQuadruple
      (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 9) *ᵥ ![(x : ℤ), y])))
    (hlow : Loneliness.value (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 9) *ᵥ ![(x : ℤ), y])) < (1 / 5 : ℝ)) :
    Loneliness.Modular.primitiveDirection ((boundedMaps 9) *ᵥ ![(x : ℤ), y]) ∈ candidateTuples :=
  boundedSlopeScanCheck_candidates 1009 1013
    (treeMask 1009 ScalarTrees.P1009.tree) (treeMask 1013 ScalarTrees.P1013.tree)
    (boundedMaps 9) (23 * boundedMapL 9) badSlopes candidateTuples
    ScalarTrees.P1009.prime (by decide) (by decide +kernel)
    ScalarTrees.P1009.sound ScalarTrees.P1013.sound slopes_checked pairs_checked
    x hx hxK y hy hcop hnonzero hdistinct hnot hlow

end Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M9
