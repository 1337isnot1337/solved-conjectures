import Conjectures.LonelinessFiveSpeedBoundedCheckBlocks
import Conjectures.LonelinessFiveSpeedLineReductionData
import Conjectures.LonelinessFiveSpeedBoundedCandidates
import Conjectures.LonelinessFiveSpeedScalarTreeMask1009
import Conjectures.LonelinessFiveSpeedScalarTreeMask1013

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M56

open Matrix
open scoped Matrix

def badSlopes : List ℕ := [0, 3, 6, 10, 13, 16, 495, 498, 501, 504, 505, 508, 511, 514, 993, 996, 999, 1003, 1006]

theorem slopes_checked : slopeCoverCheck 1009
    (treeMask 1009 ScalarTrees.P1009.tree) (boundedMaps 56) badSlopes = true := by
  decide +kernel

private theorem pairs_range_000_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [0, 3, 6, 10] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_000_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [0, 3, 6, 10] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [0, 3, 6, 10] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_000_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [0, 3, 6, 10] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56) (23 * boundedMapL 56)
    [0, 3, 6, 10] candidateTuples 64 64 57
    pairs_range_000_001 pairs_range_000_002

private theorem pairs_range_join_000_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [0, 3, 6, 10] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56) (23 * boundedMapL 56)
    [0, 3, 6, 10] candidateTuples 0 64 121
    pairs_range_000_000 pairs_range_join_000_001_003

private theorem pairs_chunk_000 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [0, 3, 6, 10] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56) (23 * boundedMapL 56)
    [0, 3, 6, 10] candidateTuples pairs_range_join_000_000_003

private theorem pairs_range_001_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [13, 16, 495, 498] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_001_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [13, 16, 495, 498] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_001_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [13, 16, 495, 498] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_001_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [13, 16, 495, 498] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56) (23 * boundedMapL 56)
    [13, 16, 495, 498] candidateTuples 64 64 57
    pairs_range_001_001 pairs_range_001_002

private theorem pairs_range_join_001_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [13, 16, 495, 498] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56) (23 * boundedMapL 56)
    [13, 16, 495, 498] candidateTuples 0 64 121
    pairs_range_001_000 pairs_range_join_001_001_003

private theorem pairs_chunk_001 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [13, 16, 495, 498] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56) (23 * boundedMapL 56)
    [13, 16, 495, 498] candidateTuples pairs_range_join_001_000_003

private theorem pairs_range_002_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [501, 504, 505, 508] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_002_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [501, 504, 505, 508] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_002_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [501, 504, 505, 508] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_002_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [501, 504, 505, 508] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56) (23 * boundedMapL 56)
    [501, 504, 505, 508] candidateTuples 64 64 57
    pairs_range_002_001 pairs_range_002_002

private theorem pairs_range_join_002_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [501, 504, 505, 508] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56) (23 * boundedMapL 56)
    [501, 504, 505, 508] candidateTuples 0 64 121
    pairs_range_002_000 pairs_range_join_002_001_003

private theorem pairs_chunk_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [501, 504, 505, 508] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56) (23 * boundedMapL 56)
    [501, 504, 505, 508] candidateTuples pairs_range_join_002_000_003

private theorem pairs_range_003_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [511, 514, 993, 996] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_003_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [511, 514, 993, 996] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_003_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [511, 514, 993, 996] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_003_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [511, 514, 993, 996] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56) (23 * boundedMapL 56)
    [511, 514, 993, 996] candidateTuples 64 64 57
    pairs_range_003_001 pairs_range_003_002

private theorem pairs_range_join_003_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [511, 514, 993, 996] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56) (23 * boundedMapL 56)
    [511, 514, 993, 996] candidateTuples 0 64 121
    pairs_range_003_000 pairs_range_join_003_001_003

private theorem pairs_chunk_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [511, 514, 993, 996] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56) (23 * boundedMapL 56)
    [511, 514, 993, 996] candidateTuples pairs_range_join_003_000_003

private theorem pairs_range_004_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [999, 1003, 1006] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_004_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [999, 1003, 1006] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_004_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [999, 1003, 1006] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_004_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [999, 1003, 1006] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56) (23 * boundedMapL 56)
    [999, 1003, 1006] candidateTuples 64 64 57
    pairs_range_004_001 pairs_range_004_002

private theorem pairs_range_join_004_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [999, 1003, 1006] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56) (23 * boundedMapL 56)
    [999, 1003, 1006] candidateTuples 0 64 121
    pairs_range_004_000 pairs_range_join_004_001_003

private theorem pairs_chunk_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [999, 1003, 1006] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56) (23 * boundedMapL 56)
    [999, 1003, 1006] candidateTuples pairs_range_join_004_000_003

private theorem pairs_join_000_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [0, 3, 6, 10, 13, 16, 495, 498] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56) (23 * boundedMapL 56)
    [0, 3, 6, 10] [13, 16, 495, 498] candidateTuples
    pairs_chunk_000 pairs_chunk_001

private theorem pairs_join_003_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [511, 514, 993, 996, 999, 1003, 1006] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56) (23 * boundedMapL 56)
    [511, 514, 993, 996] [999, 1003, 1006] candidateTuples
    pairs_chunk_003 pairs_chunk_004

private theorem pairs_join_002_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [501, 504, 505, 508, 511, 514, 993, 996, 999, 1003, 1006] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56) (23 * boundedMapL 56)
    [501, 504, 505, 508] [511, 514, 993, 996, 999, 1003, 1006] candidateTuples
    pairs_chunk_002 pairs_join_003_005

private theorem pairs_join_000_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) [0, 3, 6, 10, 13, 16, 495, 498, 501, 504, 505, 508, 511, 514, 993, 996, 999, 1003, 1006] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56) (23 * boundedMapL 56)
    [0, 3, 6, 10, 13, 16, 495, 498] [501, 504, 505, 508, 511, 514, 993, 996, 999, 1003, 1006] candidateTuples
    pairs_join_000_002 pairs_join_002_005

theorem pairs_checked : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 56)
    (23 * boundedMapL 56) badSlopes candidateTuples = true := by
  exact pairs_join_000_005

theorem sound (x : ℕ) (hx : 0 < x) (hxK : x ≤ (23 * boundedMapL 56))
    (y : ℤ) (hy : y.natAbs ≤ (23 * boundedMapL 56)) (hcop : Nat.gcd x y.natAbs = 1)
    (hnonzero : ∀ i, ((boundedMaps 56) *ᵥ ![(x : ℤ), y]) i ≠ 0)
    (hdistinct : Function.Injective (fun i => (((boundedMaps 56) *ᵥ ![(x : ℤ), y]) i).natAbs))
    (hnot : ¬Loneliness.CriticalFamilies.ContainsCriticalQuadruple
      (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 56) *ᵥ ![(x : ℤ), y])))
    (hlow : Loneliness.value (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 56) *ᵥ ![(x : ℤ), y])) < (1 / 5 : ℝ)) :
    Loneliness.Modular.primitiveDirection ((boundedMaps 56) *ᵥ ![(x : ℤ), y]) ∈ candidateTuples :=
  boundedSlopeScanCheck_candidates 1009 1013
    (treeMask 1009 ScalarTrees.P1009.tree) (treeMask 1013 ScalarTrees.P1013.tree)
    (boundedMaps 56) (23 * boundedMapL 56) badSlopes candidateTuples
    ScalarTrees.P1009.prime (by decide) (by decide +kernel)
    ScalarTrees.P1009.sound ScalarTrees.P1013.sound slopes_checked pairs_checked
    x hx hxK y hy hcop hnonzero hdistinct hnot hlow

end Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M56
