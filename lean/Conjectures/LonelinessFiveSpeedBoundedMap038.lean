import Conjectures.LonelinessFiveSpeedBoundedCheckBlocks
import Conjectures.LonelinessFiveSpeedLineReductionData
import Conjectures.LonelinessFiveSpeedBoundedCandidates
import Conjectures.LonelinessFiveSpeedScalarTreeMask1009
import Conjectures.LonelinessFiveSpeedScalarTreeMask1013

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M38

open Matrix
open scoped Matrix

def badSlopes : List ℕ := [0, 3, 4, 143, 168, 183, 223, 224, 252, 334, 335, 336, 338, 403, 432, 502, 503, 504, 505, 506, 576, 605, 670, 672, 673, 674, 756, 784, 785, 825, 840, 865, 1004, 1005, 1008]

theorem slopes_checked : slopeCoverCheck 1009
    (treeMask 1009 ScalarTrees.P1009.tree) (boundedMaps 38) badSlopes = true := by
  decide +kernel

private theorem pairs_range_000_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [0, 3, 4, 143] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_000_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [0, 3, 4, 143] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [0, 3, 4, 143] candidateTuples 128 64 = true := by
  decide +kernel

private theorem pairs_range_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [0, 3, 4, 143] candidateTuples 192 64 = true := by
  decide +kernel

private theorem pairs_range_000_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [0, 3, 4, 143] candidateTuples 256 21 = true := by
  decide +kernel

private theorem pairs_range_join_000_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [0, 3, 4, 143] candidateTuples 0 128 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [0, 3, 4, 143] candidateTuples 0 64 64
    pairs_range_000_000 pairs_range_000_001

private theorem pairs_range_join_000_003_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [0, 3, 4, 143] candidateTuples 192 85 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [0, 3, 4, 143] candidateTuples 192 64 21
    pairs_range_000_003 pairs_range_000_004

private theorem pairs_range_join_000_002_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [0, 3, 4, 143] candidateTuples 128 149 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [0, 3, 4, 143] candidateTuples 128 64 85
    pairs_range_000_002 pairs_range_join_000_003_005

private theorem pairs_range_join_000_000_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [0, 3, 4, 143] candidateTuples 0 277 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [0, 3, 4, 143] candidateTuples 0 128 149
    pairs_range_join_000_000_002 pairs_range_join_000_002_005

private theorem pairs_chunk_000 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [0, 3, 4, 143] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [0, 3, 4, 143] candidateTuples pairs_range_join_000_000_005

private theorem pairs_range_001_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [168, 183, 223, 224] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_001_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [168, 183, 223, 224] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_001_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [168, 183, 223, 224] candidateTuples 128 64 = true := by
  decide +kernel

private theorem pairs_range_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [168, 183, 223, 224] candidateTuples 192 64 = true := by
  decide +kernel

private theorem pairs_range_001_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [168, 183, 223, 224] candidateTuples 256 21 = true := by
  decide +kernel

private theorem pairs_range_join_001_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [168, 183, 223, 224] candidateTuples 0 128 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [168, 183, 223, 224] candidateTuples 0 64 64
    pairs_range_001_000 pairs_range_001_001

private theorem pairs_range_join_001_003_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [168, 183, 223, 224] candidateTuples 192 85 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [168, 183, 223, 224] candidateTuples 192 64 21
    pairs_range_001_003 pairs_range_001_004

private theorem pairs_range_join_001_002_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [168, 183, 223, 224] candidateTuples 128 149 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [168, 183, 223, 224] candidateTuples 128 64 85
    pairs_range_001_002 pairs_range_join_001_003_005

private theorem pairs_range_join_001_000_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [168, 183, 223, 224] candidateTuples 0 277 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [168, 183, 223, 224] candidateTuples 0 128 149
    pairs_range_join_001_000_002 pairs_range_join_001_002_005

private theorem pairs_chunk_001 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [168, 183, 223, 224] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [168, 183, 223, 224] candidateTuples pairs_range_join_001_000_005

private theorem pairs_range_002_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [252, 334, 335, 336] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_002_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [252, 334, 335, 336] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_002_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [252, 334, 335, 336] candidateTuples 128 64 = true := by
  decide +kernel

private theorem pairs_range_002_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [252, 334, 335, 336] candidateTuples 192 64 = true := by
  decide +kernel

private theorem pairs_range_002_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [252, 334, 335, 336] candidateTuples 256 21 = true := by
  decide +kernel

private theorem pairs_range_join_002_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [252, 334, 335, 336] candidateTuples 0 128 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [252, 334, 335, 336] candidateTuples 0 64 64
    pairs_range_002_000 pairs_range_002_001

private theorem pairs_range_join_002_003_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [252, 334, 335, 336] candidateTuples 192 85 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [252, 334, 335, 336] candidateTuples 192 64 21
    pairs_range_002_003 pairs_range_002_004

private theorem pairs_range_join_002_002_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [252, 334, 335, 336] candidateTuples 128 149 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [252, 334, 335, 336] candidateTuples 128 64 85
    pairs_range_002_002 pairs_range_join_002_003_005

private theorem pairs_range_join_002_000_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [252, 334, 335, 336] candidateTuples 0 277 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [252, 334, 335, 336] candidateTuples 0 128 149
    pairs_range_join_002_000_002 pairs_range_join_002_002_005

private theorem pairs_chunk_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [252, 334, 335, 336] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [252, 334, 335, 336] candidateTuples pairs_range_join_002_000_005

private theorem pairs_range_003_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [338, 403, 432, 502] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_003_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [338, 403, 432, 502] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_003_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [338, 403, 432, 502] candidateTuples 128 64 = true := by
  decide +kernel

private theorem pairs_range_003_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [338, 403, 432, 502] candidateTuples 192 64 = true := by
  decide +kernel

private theorem pairs_range_003_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [338, 403, 432, 502] candidateTuples 256 21 = true := by
  decide +kernel

private theorem pairs_range_join_003_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [338, 403, 432, 502] candidateTuples 0 128 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [338, 403, 432, 502] candidateTuples 0 64 64
    pairs_range_003_000 pairs_range_003_001

private theorem pairs_range_join_003_003_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [338, 403, 432, 502] candidateTuples 192 85 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [338, 403, 432, 502] candidateTuples 192 64 21
    pairs_range_003_003 pairs_range_003_004

private theorem pairs_range_join_003_002_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [338, 403, 432, 502] candidateTuples 128 149 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [338, 403, 432, 502] candidateTuples 128 64 85
    pairs_range_003_002 pairs_range_join_003_003_005

private theorem pairs_range_join_003_000_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [338, 403, 432, 502] candidateTuples 0 277 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [338, 403, 432, 502] candidateTuples 0 128 149
    pairs_range_join_003_000_002 pairs_range_join_003_002_005

private theorem pairs_chunk_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [338, 403, 432, 502] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [338, 403, 432, 502] candidateTuples pairs_range_join_003_000_005

private theorem pairs_range_004_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [503, 504, 505, 506] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_004_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [503, 504, 505, 506] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_004_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [503, 504, 505, 506] candidateTuples 128 64 = true := by
  decide +kernel

private theorem pairs_range_004_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [503, 504, 505, 506] candidateTuples 192 64 = true := by
  decide +kernel

private theorem pairs_range_004_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [503, 504, 505, 506] candidateTuples 256 21 = true := by
  decide +kernel

private theorem pairs_range_join_004_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [503, 504, 505, 506] candidateTuples 0 128 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [503, 504, 505, 506] candidateTuples 0 64 64
    pairs_range_004_000 pairs_range_004_001

private theorem pairs_range_join_004_003_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [503, 504, 505, 506] candidateTuples 192 85 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [503, 504, 505, 506] candidateTuples 192 64 21
    pairs_range_004_003 pairs_range_004_004

private theorem pairs_range_join_004_002_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [503, 504, 505, 506] candidateTuples 128 149 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [503, 504, 505, 506] candidateTuples 128 64 85
    pairs_range_004_002 pairs_range_join_004_003_005

private theorem pairs_range_join_004_000_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [503, 504, 505, 506] candidateTuples 0 277 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [503, 504, 505, 506] candidateTuples 0 128 149
    pairs_range_join_004_000_002 pairs_range_join_004_002_005

private theorem pairs_chunk_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [503, 504, 505, 506] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [503, 504, 505, 506] candidateTuples pairs_range_join_004_000_005

private theorem pairs_range_005_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [576, 605, 670, 672] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_005_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [576, 605, 670, 672] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_005_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [576, 605, 670, 672] candidateTuples 128 64 = true := by
  decide +kernel

private theorem pairs_range_005_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [576, 605, 670, 672] candidateTuples 192 64 = true := by
  decide +kernel

private theorem pairs_range_005_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [576, 605, 670, 672] candidateTuples 256 21 = true := by
  decide +kernel

private theorem pairs_range_join_005_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [576, 605, 670, 672] candidateTuples 0 128 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [576, 605, 670, 672] candidateTuples 0 64 64
    pairs_range_005_000 pairs_range_005_001

private theorem pairs_range_join_005_003_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [576, 605, 670, 672] candidateTuples 192 85 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [576, 605, 670, 672] candidateTuples 192 64 21
    pairs_range_005_003 pairs_range_005_004

private theorem pairs_range_join_005_002_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [576, 605, 670, 672] candidateTuples 128 149 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [576, 605, 670, 672] candidateTuples 128 64 85
    pairs_range_005_002 pairs_range_join_005_003_005

private theorem pairs_range_join_005_000_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [576, 605, 670, 672] candidateTuples 0 277 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [576, 605, 670, 672] candidateTuples 0 128 149
    pairs_range_join_005_000_002 pairs_range_join_005_002_005

private theorem pairs_chunk_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [576, 605, 670, 672] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [576, 605, 670, 672] candidateTuples pairs_range_join_005_000_005

private theorem pairs_range_006_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [673, 674, 756, 784] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_006_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [673, 674, 756, 784] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_006_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [673, 674, 756, 784] candidateTuples 128 64 = true := by
  decide +kernel

private theorem pairs_range_006_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [673, 674, 756, 784] candidateTuples 192 64 = true := by
  decide +kernel

private theorem pairs_range_006_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [673, 674, 756, 784] candidateTuples 256 21 = true := by
  decide +kernel

private theorem pairs_range_join_006_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [673, 674, 756, 784] candidateTuples 0 128 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [673, 674, 756, 784] candidateTuples 0 64 64
    pairs_range_006_000 pairs_range_006_001

private theorem pairs_range_join_006_003_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [673, 674, 756, 784] candidateTuples 192 85 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [673, 674, 756, 784] candidateTuples 192 64 21
    pairs_range_006_003 pairs_range_006_004

private theorem pairs_range_join_006_002_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [673, 674, 756, 784] candidateTuples 128 149 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [673, 674, 756, 784] candidateTuples 128 64 85
    pairs_range_006_002 pairs_range_join_006_003_005

private theorem pairs_range_join_006_000_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [673, 674, 756, 784] candidateTuples 0 277 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [673, 674, 756, 784] candidateTuples 0 128 149
    pairs_range_join_006_000_002 pairs_range_join_006_002_005

private theorem pairs_chunk_006 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [673, 674, 756, 784] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [673, 674, 756, 784] candidateTuples pairs_range_join_006_000_005

private theorem pairs_range_007_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [785, 825, 840, 865] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_007_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [785, 825, 840, 865] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_007_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [785, 825, 840, 865] candidateTuples 128 64 = true := by
  decide +kernel

private theorem pairs_range_007_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [785, 825, 840, 865] candidateTuples 192 64 = true := by
  decide +kernel

private theorem pairs_range_007_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [785, 825, 840, 865] candidateTuples 256 21 = true := by
  decide +kernel

private theorem pairs_range_join_007_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [785, 825, 840, 865] candidateTuples 0 128 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [785, 825, 840, 865] candidateTuples 0 64 64
    pairs_range_007_000 pairs_range_007_001

private theorem pairs_range_join_007_003_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [785, 825, 840, 865] candidateTuples 192 85 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [785, 825, 840, 865] candidateTuples 192 64 21
    pairs_range_007_003 pairs_range_007_004

private theorem pairs_range_join_007_002_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [785, 825, 840, 865] candidateTuples 128 149 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [785, 825, 840, 865] candidateTuples 128 64 85
    pairs_range_007_002 pairs_range_join_007_003_005

private theorem pairs_range_join_007_000_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [785, 825, 840, 865] candidateTuples 0 277 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [785, 825, 840, 865] candidateTuples 0 128 149
    pairs_range_join_007_000_002 pairs_range_join_007_002_005

private theorem pairs_chunk_007 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [785, 825, 840, 865] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [785, 825, 840, 865] candidateTuples pairs_range_join_007_000_005

private theorem pairs_range_008_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [1004, 1005, 1008] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_008_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [1004, 1005, 1008] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_008_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [1004, 1005, 1008] candidateTuples 128 64 = true := by
  decide +kernel

private theorem pairs_range_008_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [1004, 1005, 1008] candidateTuples 192 64 = true := by
  decide +kernel

private theorem pairs_range_008_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [1004, 1005, 1008] candidateTuples 256 21 = true := by
  decide +kernel

private theorem pairs_range_join_008_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [1004, 1005, 1008] candidateTuples 0 128 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [1004, 1005, 1008] candidateTuples 0 64 64
    pairs_range_008_000 pairs_range_008_001

private theorem pairs_range_join_008_003_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [1004, 1005, 1008] candidateTuples 192 85 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [1004, 1005, 1008] candidateTuples 192 64 21
    pairs_range_008_003 pairs_range_008_004

private theorem pairs_range_join_008_002_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [1004, 1005, 1008] candidateTuples 128 149 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [1004, 1005, 1008] candidateTuples 128 64 85
    pairs_range_008_002 pairs_range_join_008_003_005

private theorem pairs_range_join_008_000_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [1004, 1005, 1008] candidateTuples 0 277 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [1004, 1005, 1008] candidateTuples 0 128 149
    pairs_range_join_008_000_002 pairs_range_join_008_002_005

private theorem pairs_chunk_008 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [1004, 1005, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [1004, 1005, 1008] candidateTuples pairs_range_join_008_000_005

private theorem pairs_join_000_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [0, 3, 4, 143, 168, 183, 223, 224] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [0, 3, 4, 143] [168, 183, 223, 224] candidateTuples
    pairs_chunk_000 pairs_chunk_001

private theorem pairs_join_002_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [252, 334, 335, 336, 338, 403, 432, 502] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [252, 334, 335, 336] [338, 403, 432, 502] candidateTuples
    pairs_chunk_002 pairs_chunk_003

private theorem pairs_join_000_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [0, 3, 4, 143, 168, 183, 223, 224, 252, 334, 335, 336, 338, 403, 432, 502] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [0, 3, 4, 143, 168, 183, 223, 224] [252, 334, 335, 336, 338, 403, 432, 502] candidateTuples
    pairs_join_000_002 pairs_join_002_004

private theorem pairs_join_004_006 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [503, 504, 505, 506, 576, 605, 670, 672] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [503, 504, 505, 506] [576, 605, 670, 672] candidateTuples
    pairs_chunk_004 pairs_chunk_005

private theorem pairs_join_007_009 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [785, 825, 840, 865, 1004, 1005, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [785, 825, 840, 865] [1004, 1005, 1008] candidateTuples
    pairs_chunk_007 pairs_chunk_008

private theorem pairs_join_006_009 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [673, 674, 756, 784, 785, 825, 840, 865, 1004, 1005, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [673, 674, 756, 784] [785, 825, 840, 865, 1004, 1005, 1008] candidateTuples
    pairs_chunk_006 pairs_join_007_009

private theorem pairs_join_004_009 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [503, 504, 505, 506, 576, 605, 670, 672, 673, 674, 756, 784, 785, 825, 840, 865, 1004, 1005, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [503, 504, 505, 506, 576, 605, 670, 672] [673, 674, 756, 784, 785, 825, 840, 865, 1004, 1005, 1008] candidateTuples
    pairs_join_004_006 pairs_join_006_009

private theorem pairs_join_000_009 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) [0, 3, 4, 143, 168, 183, 223, 224, 252, 334, 335, 336, 338, 403, 432, 502, 503, 504, 505, 506, 576, 605, 670, 672, 673, 674, 756, 784, 785, 825, 840, 865, 1004, 1005, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38) (23 * boundedMapL 38)
    [0, 3, 4, 143, 168, 183, 223, 224, 252, 334, 335, 336, 338, 403, 432, 502] [503, 504, 505, 506, 576, 605, 670, 672, 673, 674, 756, 784, 785, 825, 840, 865, 1004, 1005, 1008] candidateTuples
    pairs_join_000_004 pairs_join_004_009

theorem pairs_checked : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 38)
    (23 * boundedMapL 38) badSlopes candidateTuples = true := by
  exact pairs_join_000_009

theorem sound (x : ℕ) (hx : 0 < x) (hxK : x ≤ (23 * boundedMapL 38))
    (y : ℤ) (hy : y.natAbs ≤ (23 * boundedMapL 38)) (hcop : Nat.gcd x y.natAbs = 1)
    (hnonzero : ∀ i, ((boundedMaps 38) *ᵥ ![(x : ℤ), y]) i ≠ 0)
    (hdistinct : Function.Injective (fun i => (((boundedMaps 38) *ᵥ ![(x : ℤ), y]) i).natAbs))
    (hnot : ¬Loneliness.CriticalFamilies.ContainsCriticalQuadruple
      (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 38) *ᵥ ![(x : ℤ), y])))
    (hlow : Loneliness.value (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 38) *ᵥ ![(x : ℤ), y])) < (1 / 5 : ℝ)) :
    Loneliness.Modular.primitiveDirection ((boundedMaps 38) *ᵥ ![(x : ℤ), y]) ∈ candidateTuples :=
  boundedSlopeScanCheck_candidates 1009 1013
    (treeMask 1009 ScalarTrees.P1009.tree) (treeMask 1013 ScalarTrees.P1013.tree)
    (boundedMaps 38) (23 * boundedMapL 38) badSlopes candidateTuples
    ScalarTrees.P1009.prime (by decide) (by decide +kernel)
    ScalarTrees.P1009.sound ScalarTrees.P1013.sound slopes_checked pairs_checked
    x hx hxK y hy hcop hnonzero hdistinct hnot hlow

end Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M38
