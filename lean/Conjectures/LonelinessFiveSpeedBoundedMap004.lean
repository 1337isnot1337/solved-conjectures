import Conjectures.LonelinessFiveSpeedBoundedCheckBlocks
import Conjectures.LonelinessFiveSpeedLineReductionData
import Conjectures.LonelinessFiveSpeedBoundedCandidates
import Conjectures.LonelinessFiveSpeedScalarTreeMask1009
import Conjectures.LonelinessFiveSpeedScalarTreeMask1013

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M4

open Matrix
open scoped Matrix

def badSlopes : List ℕ := [0, 2, 3, 143, 167, 252, 287, 403, 503, 504, 505, 604, 671, 672, 673, 720, 784, 864, 882, 1005, 1007, 1008]

theorem slopes_checked : slopeCoverCheck 1009
    (treeMask 1009 ScalarTrees.P1009.tree) (boundedMaps 4) badSlopes = true := by
  decide +kernel

private theorem pairs_range_000_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [0, 2, 3, 143] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_000_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [0, 2, 3, 143] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [0, 2, 3, 143] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_000_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [0, 2, 3, 143] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4) (23 * boundedMapL 4)
    [0, 2, 3, 143] candidateTuples 64 64 57
    pairs_range_000_001 pairs_range_000_002

private theorem pairs_range_join_000_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [0, 2, 3, 143] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4) (23 * boundedMapL 4)
    [0, 2, 3, 143] candidateTuples 0 64 121
    pairs_range_000_000 pairs_range_join_000_001_003

private theorem pairs_chunk_000 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [0, 2, 3, 143] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4) (23 * boundedMapL 4)
    [0, 2, 3, 143] candidateTuples pairs_range_join_000_000_003

private theorem pairs_range_001_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [167, 252, 287, 403] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_001_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [167, 252, 287, 403] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_001_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [167, 252, 287, 403] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_001_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [167, 252, 287, 403] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4) (23 * boundedMapL 4)
    [167, 252, 287, 403] candidateTuples 64 64 57
    pairs_range_001_001 pairs_range_001_002

private theorem pairs_range_join_001_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [167, 252, 287, 403] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4) (23 * boundedMapL 4)
    [167, 252, 287, 403] candidateTuples 0 64 121
    pairs_range_001_000 pairs_range_join_001_001_003

private theorem pairs_chunk_001 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [167, 252, 287, 403] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4) (23 * boundedMapL 4)
    [167, 252, 287, 403] candidateTuples pairs_range_join_001_000_003

private theorem pairs_range_002_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [503, 504, 505, 604] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_002_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [503, 504, 505, 604] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_002_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [503, 504, 505, 604] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_002_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [503, 504, 505, 604] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4) (23 * boundedMapL 4)
    [503, 504, 505, 604] candidateTuples 64 64 57
    pairs_range_002_001 pairs_range_002_002

private theorem pairs_range_join_002_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [503, 504, 505, 604] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4) (23 * boundedMapL 4)
    [503, 504, 505, 604] candidateTuples 0 64 121
    pairs_range_002_000 pairs_range_join_002_001_003

private theorem pairs_chunk_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [503, 504, 505, 604] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4) (23 * boundedMapL 4)
    [503, 504, 505, 604] candidateTuples pairs_range_join_002_000_003

private theorem pairs_range_003_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [671, 672, 673, 720] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_003_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [671, 672, 673, 720] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_003_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [671, 672, 673, 720] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_003_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [671, 672, 673, 720] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4) (23 * boundedMapL 4)
    [671, 672, 673, 720] candidateTuples 64 64 57
    pairs_range_003_001 pairs_range_003_002

private theorem pairs_range_join_003_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [671, 672, 673, 720] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4) (23 * boundedMapL 4)
    [671, 672, 673, 720] candidateTuples 0 64 121
    pairs_range_003_000 pairs_range_join_003_001_003

private theorem pairs_chunk_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [671, 672, 673, 720] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4) (23 * boundedMapL 4)
    [671, 672, 673, 720] candidateTuples pairs_range_join_003_000_003

private theorem pairs_range_004_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [784, 864, 882, 1005] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_004_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [784, 864, 882, 1005] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_004_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [784, 864, 882, 1005] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_004_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [784, 864, 882, 1005] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4) (23 * boundedMapL 4)
    [784, 864, 882, 1005] candidateTuples 64 64 57
    pairs_range_004_001 pairs_range_004_002

private theorem pairs_range_join_004_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [784, 864, 882, 1005] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4) (23 * boundedMapL 4)
    [784, 864, 882, 1005] candidateTuples 0 64 121
    pairs_range_004_000 pairs_range_join_004_001_003

private theorem pairs_chunk_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [784, 864, 882, 1005] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4) (23 * boundedMapL 4)
    [784, 864, 882, 1005] candidateTuples pairs_range_join_004_000_003

private theorem pairs_range_005_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [1007, 1008] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_005_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [1007, 1008] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_005_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [1007, 1008] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_005_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [1007, 1008] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4) (23 * boundedMapL 4)
    [1007, 1008] candidateTuples 64 64 57
    pairs_range_005_001 pairs_range_005_002

private theorem pairs_range_join_005_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [1007, 1008] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4) (23 * boundedMapL 4)
    [1007, 1008] candidateTuples 0 64 121
    pairs_range_005_000 pairs_range_join_005_001_003

private theorem pairs_chunk_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4) (23 * boundedMapL 4)
    [1007, 1008] candidateTuples pairs_range_join_005_000_003

private theorem pairs_join_001_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [167, 252, 287, 403, 503, 504, 505, 604] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4) (23 * boundedMapL 4)
    [167, 252, 287, 403] [503, 504, 505, 604] candidateTuples
    pairs_chunk_001 pairs_chunk_002

private theorem pairs_join_000_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [0, 2, 3, 143, 167, 252, 287, 403, 503, 504, 505, 604] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4) (23 * boundedMapL 4)
    [0, 2, 3, 143] [167, 252, 287, 403, 503, 504, 505, 604] candidateTuples
    pairs_chunk_000 pairs_join_001_003

private theorem pairs_join_004_006 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [784, 864, 882, 1005, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4) (23 * boundedMapL 4)
    [784, 864, 882, 1005] [1007, 1008] candidateTuples
    pairs_chunk_004 pairs_chunk_005

private theorem pairs_join_003_006 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [671, 672, 673, 720, 784, 864, 882, 1005, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4) (23 * boundedMapL 4)
    [671, 672, 673, 720] [784, 864, 882, 1005, 1007, 1008] candidateTuples
    pairs_chunk_003 pairs_join_004_006

private theorem pairs_join_000_006 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) [0, 2, 3, 143, 167, 252, 287, 403, 503, 504, 505, 604, 671, 672, 673, 720, 784, 864, 882, 1005, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4) (23 * boundedMapL 4)
    [0, 2, 3, 143, 167, 252, 287, 403, 503, 504, 505, 604] [671, 672, 673, 720, 784, 864, 882, 1005, 1007, 1008] candidateTuples
    pairs_join_000_003 pairs_join_003_006

theorem pairs_checked : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 4)
    (23 * boundedMapL 4) badSlopes candidateTuples = true := by
  exact pairs_join_000_006

theorem sound (x : ℕ) (hx : 0 < x) (hxK : x ≤ (23 * boundedMapL 4))
    (y : ℤ) (hy : y.natAbs ≤ (23 * boundedMapL 4)) (hcop : Nat.gcd x y.natAbs = 1)
    (hnonzero : ∀ i, ((boundedMaps 4) *ᵥ ![(x : ℤ), y]) i ≠ 0)
    (hdistinct : Function.Injective (fun i => (((boundedMaps 4) *ᵥ ![(x : ℤ), y]) i).natAbs))
    (hnot : ¬Loneliness.CriticalFamilies.ContainsCriticalQuadruple
      (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 4) *ᵥ ![(x : ℤ), y])))
    (hlow : Loneliness.value (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 4) *ᵥ ![(x : ℤ), y])) < (1 / 5 : ℝ)) :
    Loneliness.Modular.primitiveDirection ((boundedMaps 4) *ᵥ ![(x : ℤ), y]) ∈ candidateTuples :=
  boundedSlopeScanCheck_candidates 1009 1013
    (treeMask 1009 ScalarTrees.P1009.tree) (treeMask 1013 ScalarTrees.P1013.tree)
    (boundedMaps 4) (23 * boundedMapL 4) badSlopes candidateTuples
    ScalarTrees.P1009.prime (by decide) (by decide +kernel)
    ScalarTrees.P1009.sound ScalarTrees.P1013.sound slopes_checked pairs_checked
    x hx hxK y hy hcop hnonzero hdistinct hnot hlow

end Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M4
