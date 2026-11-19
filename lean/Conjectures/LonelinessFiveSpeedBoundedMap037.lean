import Conjectures.LonelinessFiveSpeedBoundedCheckBlocks
import Conjectures.LonelinessFiveSpeedLineReductionData
import Conjectures.LonelinessFiveSpeedBoundedCandidates
import Conjectures.LonelinessFiveSpeedScalarTreeMask1009
import Conjectures.LonelinessFiveSpeedScalarTreeMask1013

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M37

open Matrix
open scoped Matrix

def badSlopes : List ℕ := [0, 1, 2, 3, 5, 77, 112, 201, 232, 251, 252, 378, 404, 432, 448, 458, 503, 504, 505, 550, 560, 576, 604, 630, 756, 757, 776, 807, 896, 931, 1003, 1005, 1006, 1007, 1008]

theorem slopes_checked : slopeCoverCheck 1009
    (treeMask 1009 ScalarTrees.P1009.tree) (boundedMaps 37) badSlopes = true := by
  decide +kernel

private theorem pairs_range_000_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [0, 1, 2, 3] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_000_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [0, 1, 2, 3] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_000_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [0, 1, 2, 3] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37) (23 * boundedMapL 37)
    [0, 1, 2, 3] candidateTuples 0 64 29
    pairs_range_000_000 pairs_range_000_001

private theorem pairs_chunk_000 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [0, 1, 2, 3] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37) (23 * boundedMapL 37)
    [0, 1, 2, 3] candidateTuples pairs_range_join_000_000_002

private theorem pairs_range_001_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [5, 77, 112, 201] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_001_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [5, 77, 112, 201] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_001_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [5, 77, 112, 201] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37) (23 * boundedMapL 37)
    [5, 77, 112, 201] candidateTuples 0 64 29
    pairs_range_001_000 pairs_range_001_001

private theorem pairs_chunk_001 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [5, 77, 112, 201] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37) (23 * boundedMapL 37)
    [5, 77, 112, 201] candidateTuples pairs_range_join_001_000_002

private theorem pairs_range_002_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [232, 251, 252, 378] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_002_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [232, 251, 252, 378] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_002_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [232, 251, 252, 378] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37) (23 * boundedMapL 37)
    [232, 251, 252, 378] candidateTuples 0 64 29
    pairs_range_002_000 pairs_range_002_001

private theorem pairs_chunk_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [232, 251, 252, 378] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37) (23 * boundedMapL 37)
    [232, 251, 252, 378] candidateTuples pairs_range_join_002_000_002

private theorem pairs_range_003_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [404, 432, 448, 458] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_003_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [404, 432, 448, 458] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_003_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [404, 432, 448, 458] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37) (23 * boundedMapL 37)
    [404, 432, 448, 458] candidateTuples 0 64 29
    pairs_range_003_000 pairs_range_003_001

private theorem pairs_chunk_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [404, 432, 448, 458] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37) (23 * boundedMapL 37)
    [404, 432, 448, 458] candidateTuples pairs_range_join_003_000_002

private theorem pairs_range_004_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [503, 504, 505, 550] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_004_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [503, 504, 505, 550] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_004_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [503, 504, 505, 550] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37) (23 * boundedMapL 37)
    [503, 504, 505, 550] candidateTuples 0 64 29
    pairs_range_004_000 pairs_range_004_001

private theorem pairs_chunk_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [503, 504, 505, 550] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37) (23 * boundedMapL 37)
    [503, 504, 505, 550] candidateTuples pairs_range_join_004_000_002

private theorem pairs_range_005_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [560, 576, 604, 630] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_005_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [560, 576, 604, 630] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_005_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [560, 576, 604, 630] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37) (23 * boundedMapL 37)
    [560, 576, 604, 630] candidateTuples 0 64 29
    pairs_range_005_000 pairs_range_005_001

private theorem pairs_chunk_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [560, 576, 604, 630] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37) (23 * boundedMapL 37)
    [560, 576, 604, 630] candidateTuples pairs_range_join_005_000_002

private theorem pairs_range_006_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [756, 757, 776, 807] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_006_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [756, 757, 776, 807] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_006_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [756, 757, 776, 807] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37) (23 * boundedMapL 37)
    [756, 757, 776, 807] candidateTuples 0 64 29
    pairs_range_006_000 pairs_range_006_001

private theorem pairs_chunk_006 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [756, 757, 776, 807] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37) (23 * boundedMapL 37)
    [756, 757, 776, 807] candidateTuples pairs_range_join_006_000_002

private theorem pairs_range_007_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [896, 931, 1003, 1005] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_007_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [896, 931, 1003, 1005] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_007_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [896, 931, 1003, 1005] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37) (23 * boundedMapL 37)
    [896, 931, 1003, 1005] candidateTuples 0 64 29
    pairs_range_007_000 pairs_range_007_001

private theorem pairs_chunk_007 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [896, 931, 1003, 1005] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37) (23 * boundedMapL 37)
    [896, 931, 1003, 1005] candidateTuples pairs_range_join_007_000_002

private theorem pairs_range_008_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [1006, 1007, 1008] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_008_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [1006, 1007, 1008] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_008_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [1006, 1007, 1008] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37) (23 * boundedMapL 37)
    [1006, 1007, 1008] candidateTuples 0 64 29
    pairs_range_008_000 pairs_range_008_001

private theorem pairs_chunk_008 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [1006, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37) (23 * boundedMapL 37)
    [1006, 1007, 1008] candidateTuples pairs_range_join_008_000_002

private theorem pairs_join_000_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [0, 1, 2, 3, 5, 77, 112, 201] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37) (23 * boundedMapL 37)
    [0, 1, 2, 3] [5, 77, 112, 201] candidateTuples
    pairs_chunk_000 pairs_chunk_001

private theorem pairs_join_002_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [232, 251, 252, 378, 404, 432, 448, 458] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37) (23 * boundedMapL 37)
    [232, 251, 252, 378] [404, 432, 448, 458] candidateTuples
    pairs_chunk_002 pairs_chunk_003

private theorem pairs_join_000_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [0, 1, 2, 3, 5, 77, 112, 201, 232, 251, 252, 378, 404, 432, 448, 458] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37) (23 * boundedMapL 37)
    [0, 1, 2, 3, 5, 77, 112, 201] [232, 251, 252, 378, 404, 432, 448, 458] candidateTuples
    pairs_join_000_002 pairs_join_002_004

private theorem pairs_join_004_006 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [503, 504, 505, 550, 560, 576, 604, 630] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37) (23 * boundedMapL 37)
    [503, 504, 505, 550] [560, 576, 604, 630] candidateTuples
    pairs_chunk_004 pairs_chunk_005

private theorem pairs_join_007_009 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [896, 931, 1003, 1005, 1006, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37) (23 * boundedMapL 37)
    [896, 931, 1003, 1005] [1006, 1007, 1008] candidateTuples
    pairs_chunk_007 pairs_chunk_008

private theorem pairs_join_006_009 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [756, 757, 776, 807, 896, 931, 1003, 1005, 1006, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37) (23 * boundedMapL 37)
    [756, 757, 776, 807] [896, 931, 1003, 1005, 1006, 1007, 1008] candidateTuples
    pairs_chunk_006 pairs_join_007_009

private theorem pairs_join_004_009 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [503, 504, 505, 550, 560, 576, 604, 630, 756, 757, 776, 807, 896, 931, 1003, 1005, 1006, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37) (23 * boundedMapL 37)
    [503, 504, 505, 550, 560, 576, 604, 630] [756, 757, 776, 807, 896, 931, 1003, 1005, 1006, 1007, 1008] candidateTuples
    pairs_join_004_006 pairs_join_006_009

private theorem pairs_join_000_009 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) [0, 1, 2, 3, 5, 77, 112, 201, 232, 251, 252, 378, 404, 432, 448, 458, 503, 504, 505, 550, 560, 576, 604, 630, 756, 757, 776, 807, 896, 931, 1003, 1005, 1006, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37) (23 * boundedMapL 37)
    [0, 1, 2, 3, 5, 77, 112, 201, 232, 251, 252, 378, 404, 432, 448, 458] [503, 504, 505, 550, 560, 576, 604, 630, 756, 757, 776, 807, 896, 931, 1003, 1005, 1006, 1007, 1008] candidateTuples
    pairs_join_000_004 pairs_join_004_009

theorem pairs_checked : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 37)
    (23 * boundedMapL 37) badSlopes candidateTuples = true := by
  exact pairs_join_000_009

theorem sound (x : ℕ) (hx : 0 < x) (hxK : x ≤ (23 * boundedMapL 37))
    (y : ℤ) (hy : y.natAbs ≤ (23 * boundedMapL 37)) (hcop : Nat.gcd x y.natAbs = 1)
    (hnonzero : ∀ i, ((boundedMaps 37) *ᵥ ![(x : ℤ), y]) i ≠ 0)
    (hdistinct : Function.Injective (fun i => (((boundedMaps 37) *ᵥ ![(x : ℤ), y]) i).natAbs))
    (hnot : ¬Loneliness.CriticalFamilies.ContainsCriticalQuadruple
      (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 37) *ᵥ ![(x : ℤ), y])))
    (hlow : Loneliness.value (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 37) *ᵥ ![(x : ℤ), y])) < (1 / 5 : ℝ)) :
    Loneliness.Modular.primitiveDirection ((boundedMaps 37) *ᵥ ![(x : ℤ), y]) ∈ candidateTuples :=
  boundedSlopeScanCheck_candidates 1009 1013
    (treeMask 1009 ScalarTrees.P1009.tree) (treeMask 1013 ScalarTrees.P1013.tree)
    (boundedMaps 37) (23 * boundedMapL 37) badSlopes candidateTuples
    ScalarTrees.P1009.prime (by decide) (by decide +kernel)
    ScalarTrees.P1009.sound ScalarTrees.P1013.sound slopes_checked pairs_checked
    x hx hxK y hy hcop hnonzero hdistinct hnot hlow

end Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M37
