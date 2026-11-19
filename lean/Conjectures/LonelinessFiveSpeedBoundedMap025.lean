import Conjectures.LonelinessFiveSpeedBoundedCheckBlocks
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

private theorem pairs_range_000_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [0, 1, 2, 3] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_000_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [0, 1, 2, 3] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_000_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [0, 1, 2, 3] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [0, 1, 2, 3] candidateTuples 0 64 29
    pairs_range_000_000 pairs_range_000_001

private theorem pairs_chunk_000 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [0, 1, 2, 3] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [0, 1, 2, 3] candidateTuples pairs_range_join_000_000_002

private theorem pairs_range_001_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [5, 6, 23, 83] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_001_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [5, 6, 23, 83] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_001_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [5, 6, 23, 83] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [5, 6, 23, 83] candidateTuples 0 64 29
    pairs_range_001_000 pairs_range_001_001

private theorem pairs_chunk_001 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [5, 6, 23, 83] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [5, 6, 23, 83] candidateTuples pairs_range_join_001_000_002

private theorem pairs_range_002_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [100, 112, 125, 126] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_002_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [100, 112, 125, 126] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_002_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [100, 112, 125, 126] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [100, 112, 125, 126] candidateTuples 0 64 29
    pairs_range_002_000 pairs_range_002_001

private theorem pairs_chunk_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [100, 112, 125, 126] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [100, 112, 125, 126] candidateTuples pairs_range_join_002_000_002

private theorem pairs_range_003_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [143, 144, 177, 183] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_003_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [143, 144, 177, 183] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_003_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [143, 144, 177, 183] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [143, 144, 177, 183] candidateTuples 0 64 29
    pairs_range_003_000 pairs_range_003_001

private theorem pairs_chunk_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [143, 144, 177, 183] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [143, 144, 177, 183] candidateTuples pairs_range_join_003_000_002

private theorem pairs_range_004_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [201, 202, 223, 224] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_004_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [201, 202, 223, 224] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_004_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [201, 202, 223, 224] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [201, 202, 223, 224] candidateTuples 0 64 29
    pairs_range_004_000 pairs_range_004_001

private theorem pairs_chunk_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [201, 202, 223, 224] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [201, 202, 223, 224] candidateTuples pairs_range_join_004_000_002

private theorem pairs_range_005_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [225, 232, 251, 252] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_005_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [225, 232, 251, 252] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_005_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [225, 232, 251, 252] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [225, 232, 251, 252] candidateTuples 0 64 29
    pairs_range_005_000 pairs_range_005_001

private theorem pairs_chunk_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [225, 232, 251, 252] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [225, 232, 251, 252] candidateTuples pairs_range_join_005_000_002

private theorem pairs_range_006_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [253, 275, 288, 310] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_006_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [253, 275, 288, 310] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_006_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [253, 275, 288, 310] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [253, 275, 288, 310] candidateTuples 0 64 29
    pairs_range_006_000 pairs_range_006_001

private theorem pairs_chunk_006 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [253, 275, 288, 310] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [253, 275, 288, 310] candidateTuples pairs_range_join_006_000_002

private theorem pairs_range_007_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [334, 335, 336, 337] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_007_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [334, 335, 336, 337] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_007_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [334, 335, 336, 337] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [334, 335, 336, 337] candidateTuples 0 64 29
    pairs_range_007_000 pairs_range_007_001

private theorem pairs_chunk_007 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [334, 335, 336, 337] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [334, 335, 336, 337] candidateTuples pairs_range_join_007_000_002

private theorem pairs_range_008_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [338, 341, 343, 378] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_008_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [338, 341, 343, 378] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_008_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [338, 341, 343, 378] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [338, 341, 343, 378] candidateTuples 0 64 29
    pairs_range_008_000 pairs_range_008_001

private theorem pairs_chunk_008 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [338, 341, 343, 378] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [338, 341, 343, 378] candidateTuples pairs_range_join_008_000_002

private theorem pairs_range_009_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [387, 403, 404, 432] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_009_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [387, 403, 404, 432] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_009_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [387, 403, 404, 432] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [387, 403, 404, 432] candidateTuples 0 64 29
    pairs_range_009_000 pairs_range_009_001

private theorem pairs_chunk_009 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [387, 403, 404, 432] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [387, 403, 404, 432] candidateTuples pairs_range_join_009_000_002

private theorem pairs_range_010_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [441, 458, 477, 501] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_010_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [441, 458, 477, 501] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_010_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [441, 458, 477, 501] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [441, 458, 477, 501] candidateTuples 0 64 29
    pairs_range_010_000 pairs_range_010_001

private theorem pairs_chunk_010 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [441, 458, 477, 501] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [441, 458, 477, 501] candidateTuples pairs_range_join_010_000_002

private theorem pairs_range_011_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [502, 503, 504, 505] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_011_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [502, 503, 504, 505] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_011_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [502, 503, 504, 505] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [502, 503, 504, 505] candidateTuples 0 64 29
    pairs_range_011_000 pairs_range_011_001

private theorem pairs_chunk_011 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [502, 503, 504, 505] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [502, 503, 504, 505] candidateTuples pairs_range_join_011_000_002

private theorem pairs_range_012_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [506, 508, 570, 576] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_012_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [506, 508, 570, 576] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_012_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [506, 508, 570, 576] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [506, 508, 570, 576] candidateTuples 0 64 29
    pairs_range_012_000 pairs_range_012_001

private theorem pairs_chunk_012 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [506, 508, 570, 576] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [506, 508, 570, 576] candidateTuples pairs_range_join_012_000_002

private theorem pairs_range_013_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [588, 593, 604, 605] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_013_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [588, 593, 604, 605] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_013_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [588, 593, 604, 605] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [588, 593, 604, 605] candidateTuples 0 64 29
    pairs_range_013_000 pairs_range_013_001

private theorem pairs_chunk_013 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [588, 593, 604, 605] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [588, 593, 604, 605] candidateTuples pairs_range_join_013_000_002

private theorem pairs_range_014_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [616, 630, 706, 721] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_014_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [616, 630, 706, 721] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_014_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [616, 630, 706, 721] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [616, 630, 706, 721] candidateTuples 0 64 29
    pairs_range_014_000 pairs_range_014_001

private theorem pairs_chunk_014 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [616, 630, 706, 721] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [616, 630, 706, 721] candidateTuples pairs_range_join_014_000_002

private theorem pairs_range_015_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [739, 754, 756, 784] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_015_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [739, 754, 756, 784] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_015_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [739, 754, 756, 784] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [739, 754, 756, 784] candidateTuples 0 64 29
    pairs_range_015_000 pairs_range_015_001

private theorem pairs_chunk_015 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [739, 754, 756, 784] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [739, 754, 756, 784] candidateTuples pairs_range_join_015_000_002

private theorem pairs_range_016_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [840, 841, 865, 896] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_016_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [840, 841, 865, 896] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_016_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [840, 841, 865, 896] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [840, 841, 865, 896] candidateTuples 0 64 29
    pairs_range_016_000 pairs_range_016_001

private theorem pairs_chunk_016 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [840, 841, 865, 896] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [840, 841, 865, 896] candidateTuples pairs_range_join_016_000_002

private theorem pairs_range_017_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [931, 936, 976, 1000] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_017_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [931, 936, 976, 1000] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_017_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [931, 936, 976, 1000] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [931, 936, 976, 1000] candidateTuples 0 64 29
    pairs_range_017_000 pairs_range_017_001

private theorem pairs_chunk_017 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [931, 936, 976, 1000] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [931, 936, 976, 1000] candidateTuples pairs_range_join_017_000_002

private theorem pairs_range_018_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [1005, 1006, 1008] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_018_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [1005, 1006, 1008] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_018_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [1005, 1006, 1008] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [1005, 1006, 1008] candidateTuples 0 64 29
    pairs_range_018_000 pairs_range_018_001

private theorem pairs_chunk_018 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [1005, 1006, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [1005, 1006, 1008] candidateTuples pairs_range_join_018_000_002

private theorem pairs_join_000_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [0, 1, 2, 3, 5, 6, 23, 83] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [0, 1, 2, 3] [5, 6, 23, 83] candidateTuples
    pairs_chunk_000 pairs_chunk_001

private theorem pairs_join_002_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [100, 112, 125, 126, 143, 144, 177, 183] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [100, 112, 125, 126] [143, 144, 177, 183] candidateTuples
    pairs_chunk_002 pairs_chunk_003

private theorem pairs_join_000_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [0, 1, 2, 3, 5, 6, 23, 83, 100, 112, 125, 126, 143, 144, 177, 183] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [0, 1, 2, 3, 5, 6, 23, 83] [100, 112, 125, 126, 143, 144, 177, 183] candidateTuples
    pairs_join_000_002 pairs_join_002_004

private theorem pairs_join_004_006 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [201, 202, 223, 224, 225, 232, 251, 252] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [201, 202, 223, 224] [225, 232, 251, 252] candidateTuples
    pairs_chunk_004 pairs_chunk_005

private theorem pairs_join_007_009 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [334, 335, 336, 337, 338, 341, 343, 378] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [334, 335, 336, 337] [338, 341, 343, 378] candidateTuples
    pairs_chunk_007 pairs_chunk_008

private theorem pairs_join_006_009 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [253, 275, 288, 310, 334, 335, 336, 337, 338, 341, 343, 378] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [253, 275, 288, 310] [334, 335, 336, 337, 338, 341, 343, 378] candidateTuples
    pairs_chunk_006 pairs_join_007_009

private theorem pairs_join_004_009 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [201, 202, 223, 224, 225, 232, 251, 252, 253, 275, 288, 310, 334, 335, 336, 337, 338, 341, 343, 378] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [201, 202, 223, 224, 225, 232, 251, 252] [253, 275, 288, 310, 334, 335, 336, 337, 338, 341, 343, 378] candidateTuples
    pairs_join_004_006 pairs_join_006_009

private theorem pairs_join_000_009 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [0, 1, 2, 3, 5, 6, 23, 83, 100, 112, 125, 126, 143, 144, 177, 183, 201, 202, 223, 224, 225, 232, 251, 252, 253, 275, 288, 310, 334, 335, 336, 337, 338, 341, 343, 378] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [0, 1, 2, 3, 5, 6, 23, 83, 100, 112, 125, 126, 143, 144, 177, 183] [201, 202, 223, 224, 225, 232, 251, 252, 253, 275, 288, 310, 334, 335, 336, 337, 338, 341, 343, 378] candidateTuples
    pairs_join_000_004 pairs_join_004_009

private theorem pairs_join_009_011 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [387, 403, 404, 432, 441, 458, 477, 501] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [387, 403, 404, 432] [441, 458, 477, 501] candidateTuples
    pairs_chunk_009 pairs_chunk_010

private theorem pairs_join_012_014 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [506, 508, 570, 576, 588, 593, 604, 605] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [506, 508, 570, 576] [588, 593, 604, 605] candidateTuples
    pairs_chunk_012 pairs_chunk_013

private theorem pairs_join_011_014 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [502, 503, 504, 505, 506, 508, 570, 576, 588, 593, 604, 605] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [502, 503, 504, 505] [506, 508, 570, 576, 588, 593, 604, 605] candidateTuples
    pairs_chunk_011 pairs_join_012_014

private theorem pairs_join_009_014 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [387, 403, 404, 432, 441, 458, 477, 501, 502, 503, 504, 505, 506, 508, 570, 576, 588, 593, 604, 605] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [387, 403, 404, 432, 441, 458, 477, 501] [502, 503, 504, 505, 506, 508, 570, 576, 588, 593, 604, 605] candidateTuples
    pairs_join_009_011 pairs_join_011_014

private theorem pairs_join_014_016 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [616, 630, 706, 721, 739, 754, 756, 784] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [616, 630, 706, 721] [739, 754, 756, 784] candidateTuples
    pairs_chunk_014 pairs_chunk_015

private theorem pairs_join_017_019 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [931, 936, 976, 1000, 1005, 1006, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [931, 936, 976, 1000] [1005, 1006, 1008] candidateTuples
    pairs_chunk_017 pairs_chunk_018

private theorem pairs_join_016_019 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [840, 841, 865, 896, 931, 936, 976, 1000, 1005, 1006, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [840, 841, 865, 896] [931, 936, 976, 1000, 1005, 1006, 1008] candidateTuples
    pairs_chunk_016 pairs_join_017_019

private theorem pairs_join_014_019 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [616, 630, 706, 721, 739, 754, 756, 784, 840, 841, 865, 896, 931, 936, 976, 1000, 1005, 1006, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [616, 630, 706, 721, 739, 754, 756, 784] [840, 841, 865, 896, 931, 936, 976, 1000, 1005, 1006, 1008] candidateTuples
    pairs_join_014_016 pairs_join_016_019

private theorem pairs_join_009_019 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [387, 403, 404, 432, 441, 458, 477, 501, 502, 503, 504, 505, 506, 508, 570, 576, 588, 593, 604, 605, 616, 630, 706, 721, 739, 754, 756, 784, 840, 841, 865, 896, 931, 936, 976, 1000, 1005, 1006, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [387, 403, 404, 432, 441, 458, 477, 501, 502, 503, 504, 505, 506, 508, 570, 576, 588, 593, 604, 605] [616, 630, 706, 721, 739, 754, 756, 784, 840, 841, 865, 896, 931, 936, 976, 1000, 1005, 1006, 1008] candidateTuples
    pairs_join_009_014 pairs_join_014_019

private theorem pairs_join_000_019 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) [0, 1, 2, 3, 5, 6, 23, 83, 100, 112, 125, 126, 143, 144, 177, 183, 201, 202, 223, 224, 225, 232, 251, 252, 253, 275, 288, 310, 334, 335, 336, 337, 338, 341, 343, 378, 387, 403, 404, 432, 441, 458, 477, 501, 502, 503, 504, 505, 506, 508, 570, 576, 588, 593, 604, 605, 616, 630, 706, 721, 739, 754, 756, 784, 840, 841, 865, 896, 931, 936, 976, 1000, 1005, 1006, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25) (23 * boundedMapL 25)
    [0, 1, 2, 3, 5, 6, 23, 83, 100, 112, 125, 126, 143, 144, 177, 183, 201, 202, 223, 224, 225, 232, 251, 252, 253, 275, 288, 310, 334, 335, 336, 337, 338, 341, 343, 378] [387, 403, 404, 432, 441, 458, 477, 501, 502, 503, 504, 505, 506, 508, 570, 576, 588, 593, 604, 605, 616, 630, 706, 721, 739, 754, 756, 784, 840, 841, 865, 896, 931, 936, 976, 1000, 1005, 1006, 1008] candidateTuples
    pairs_join_000_009 pairs_join_009_019

theorem pairs_checked : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 25)
    (23 * boundedMapL 25) badSlopes candidateTuples = true := by
  exact pairs_join_000_019

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
