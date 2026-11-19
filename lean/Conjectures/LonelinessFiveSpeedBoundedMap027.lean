import Conjectures.LonelinessFiveSpeedBoundedCheckBlocks
import Conjectures.LonelinessFiveSpeedLineReductionData
import Conjectures.LonelinessFiveSpeedBoundedCandidates
import Conjectures.LonelinessFiveSpeedScalarTreeMask1009
import Conjectures.LonelinessFiveSpeedScalarTreeMask1013

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M27

open Matrix
open scoped Matrix

def badSlopes : List ℕ := [0, 2, 3, 8, 32, 72, 77, 112, 143, 167, 168, 224, 252, 254, 269, 287, 302, 378, 392, 403, 404, 415, 420, 432, 438, 500, 502, 503, 504, 505, 506, 507, 531, 550, 567, 576, 604, 605, 621, 630, 665, 667, 670, 671, 672, 673, 674, 698, 720, 733, 755, 756, 757, 776, 783, 784, 785, 806, 807, 825, 831, 864, 865, 882, 883, 896, 908, 925, 985, 1002, 1003, 1005, 1006, 1007, 1008]

theorem slopes_checked : slopeCoverCheck 1009
    (treeMask 1009 ScalarTrees.P1009.tree) (boundedMaps 27) badSlopes = true := by
  decide +kernel

private theorem pairs_range_000_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [0, 2, 3, 8] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_000_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [0, 2, 3, 8] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [0, 2, 3, 8] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_000_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [0, 2, 3, 8] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [0, 2, 3, 8] candidateTuples 64 64 57
    pairs_range_000_001 pairs_range_000_002

private theorem pairs_range_join_000_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [0, 2, 3, 8] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [0, 2, 3, 8] candidateTuples 0 64 121
    pairs_range_000_000 pairs_range_join_000_001_003

private theorem pairs_chunk_000 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [0, 2, 3, 8] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [0, 2, 3, 8] candidateTuples pairs_range_join_000_000_003

private theorem pairs_range_001_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [32, 72, 77, 112] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_001_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [32, 72, 77, 112] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_001_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [32, 72, 77, 112] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_001_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [32, 72, 77, 112] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [32, 72, 77, 112] candidateTuples 64 64 57
    pairs_range_001_001 pairs_range_001_002

private theorem pairs_range_join_001_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [32, 72, 77, 112] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [32, 72, 77, 112] candidateTuples 0 64 121
    pairs_range_001_000 pairs_range_join_001_001_003

private theorem pairs_chunk_001 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [32, 72, 77, 112] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [32, 72, 77, 112] candidateTuples pairs_range_join_001_000_003

private theorem pairs_range_002_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [143, 167, 168, 224] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_002_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [143, 167, 168, 224] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_002_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [143, 167, 168, 224] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_002_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [143, 167, 168, 224] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [143, 167, 168, 224] candidateTuples 64 64 57
    pairs_range_002_001 pairs_range_002_002

private theorem pairs_range_join_002_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [143, 167, 168, 224] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [143, 167, 168, 224] candidateTuples 0 64 121
    pairs_range_002_000 pairs_range_join_002_001_003

private theorem pairs_chunk_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [143, 167, 168, 224] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [143, 167, 168, 224] candidateTuples pairs_range_join_002_000_003

private theorem pairs_range_003_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [252, 254, 269, 287] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_003_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [252, 254, 269, 287] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_003_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [252, 254, 269, 287] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_003_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [252, 254, 269, 287] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [252, 254, 269, 287] candidateTuples 64 64 57
    pairs_range_003_001 pairs_range_003_002

private theorem pairs_range_join_003_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [252, 254, 269, 287] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [252, 254, 269, 287] candidateTuples 0 64 121
    pairs_range_003_000 pairs_range_join_003_001_003

private theorem pairs_chunk_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [252, 254, 269, 287] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [252, 254, 269, 287] candidateTuples pairs_range_join_003_000_003

private theorem pairs_range_004_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [302, 378, 392, 403] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_004_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [302, 378, 392, 403] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_004_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [302, 378, 392, 403] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_004_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [302, 378, 392, 403] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [302, 378, 392, 403] candidateTuples 64 64 57
    pairs_range_004_001 pairs_range_004_002

private theorem pairs_range_join_004_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [302, 378, 392, 403] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [302, 378, 392, 403] candidateTuples 0 64 121
    pairs_range_004_000 pairs_range_join_004_001_003

private theorem pairs_chunk_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [302, 378, 392, 403] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [302, 378, 392, 403] candidateTuples pairs_range_join_004_000_003

private theorem pairs_range_005_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [404, 415, 420, 432] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_005_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [404, 415, 420, 432] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_005_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [404, 415, 420, 432] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_005_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [404, 415, 420, 432] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [404, 415, 420, 432] candidateTuples 64 64 57
    pairs_range_005_001 pairs_range_005_002

private theorem pairs_range_join_005_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [404, 415, 420, 432] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [404, 415, 420, 432] candidateTuples 0 64 121
    pairs_range_005_000 pairs_range_join_005_001_003

private theorem pairs_chunk_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [404, 415, 420, 432] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [404, 415, 420, 432] candidateTuples pairs_range_join_005_000_003

private theorem pairs_range_006_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [438, 500, 502, 503] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_006_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [438, 500, 502, 503] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_006_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [438, 500, 502, 503] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_006_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [438, 500, 502, 503] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [438, 500, 502, 503] candidateTuples 64 64 57
    pairs_range_006_001 pairs_range_006_002

private theorem pairs_range_join_006_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [438, 500, 502, 503] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [438, 500, 502, 503] candidateTuples 0 64 121
    pairs_range_006_000 pairs_range_join_006_001_003

private theorem pairs_chunk_006 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [438, 500, 502, 503] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [438, 500, 502, 503] candidateTuples pairs_range_join_006_000_003

private theorem pairs_range_007_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [504, 505, 506, 507] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_007_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [504, 505, 506, 507] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_007_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [504, 505, 506, 507] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_007_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [504, 505, 506, 507] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [504, 505, 506, 507] candidateTuples 64 64 57
    pairs_range_007_001 pairs_range_007_002

private theorem pairs_range_join_007_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [504, 505, 506, 507] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [504, 505, 506, 507] candidateTuples 0 64 121
    pairs_range_007_000 pairs_range_join_007_001_003

private theorem pairs_chunk_007 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [504, 505, 506, 507] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [504, 505, 506, 507] candidateTuples pairs_range_join_007_000_003

private theorem pairs_range_008_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [531, 550, 567, 576] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_008_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [531, 550, 567, 576] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_008_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [531, 550, 567, 576] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_008_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [531, 550, 567, 576] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [531, 550, 567, 576] candidateTuples 64 64 57
    pairs_range_008_001 pairs_range_008_002

private theorem pairs_range_join_008_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [531, 550, 567, 576] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [531, 550, 567, 576] candidateTuples 0 64 121
    pairs_range_008_000 pairs_range_join_008_001_003

private theorem pairs_chunk_008 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [531, 550, 567, 576] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [531, 550, 567, 576] candidateTuples pairs_range_join_008_000_003

private theorem pairs_range_009_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [604, 605, 621, 630] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_009_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [604, 605, 621, 630] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_009_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [604, 605, 621, 630] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_009_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [604, 605, 621, 630] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [604, 605, 621, 630] candidateTuples 64 64 57
    pairs_range_009_001 pairs_range_009_002

private theorem pairs_range_join_009_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [604, 605, 621, 630] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [604, 605, 621, 630] candidateTuples 0 64 121
    pairs_range_009_000 pairs_range_join_009_001_003

private theorem pairs_chunk_009 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [604, 605, 621, 630] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [604, 605, 621, 630] candidateTuples pairs_range_join_009_000_003

private theorem pairs_range_010_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [665, 667, 670, 671] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_010_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [665, 667, 670, 671] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_010_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [665, 667, 670, 671] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_010_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [665, 667, 670, 671] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [665, 667, 670, 671] candidateTuples 64 64 57
    pairs_range_010_001 pairs_range_010_002

private theorem pairs_range_join_010_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [665, 667, 670, 671] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [665, 667, 670, 671] candidateTuples 0 64 121
    pairs_range_010_000 pairs_range_join_010_001_003

private theorem pairs_chunk_010 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [665, 667, 670, 671] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [665, 667, 670, 671] candidateTuples pairs_range_join_010_000_003

private theorem pairs_range_011_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [672, 673, 674, 698] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_011_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [672, 673, 674, 698] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_011_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [672, 673, 674, 698] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_011_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [672, 673, 674, 698] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [672, 673, 674, 698] candidateTuples 64 64 57
    pairs_range_011_001 pairs_range_011_002

private theorem pairs_range_join_011_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [672, 673, 674, 698] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [672, 673, 674, 698] candidateTuples 0 64 121
    pairs_range_011_000 pairs_range_join_011_001_003

private theorem pairs_chunk_011 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [672, 673, 674, 698] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [672, 673, 674, 698] candidateTuples pairs_range_join_011_000_003

private theorem pairs_range_012_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [720, 733, 755, 756] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_012_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [720, 733, 755, 756] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_012_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [720, 733, 755, 756] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_012_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [720, 733, 755, 756] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [720, 733, 755, 756] candidateTuples 64 64 57
    pairs_range_012_001 pairs_range_012_002

private theorem pairs_range_join_012_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [720, 733, 755, 756] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [720, 733, 755, 756] candidateTuples 0 64 121
    pairs_range_012_000 pairs_range_join_012_001_003

private theorem pairs_chunk_012 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [720, 733, 755, 756] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [720, 733, 755, 756] candidateTuples pairs_range_join_012_000_003

private theorem pairs_range_013_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [757, 776, 783, 784] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_013_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [757, 776, 783, 784] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_013_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [757, 776, 783, 784] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_013_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [757, 776, 783, 784] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [757, 776, 783, 784] candidateTuples 64 64 57
    pairs_range_013_001 pairs_range_013_002

private theorem pairs_range_join_013_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [757, 776, 783, 784] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [757, 776, 783, 784] candidateTuples 0 64 121
    pairs_range_013_000 pairs_range_join_013_001_003

private theorem pairs_chunk_013 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [757, 776, 783, 784] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [757, 776, 783, 784] candidateTuples pairs_range_join_013_000_003

private theorem pairs_range_014_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [785, 806, 807, 825] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_014_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [785, 806, 807, 825] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_014_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [785, 806, 807, 825] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_014_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [785, 806, 807, 825] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [785, 806, 807, 825] candidateTuples 64 64 57
    pairs_range_014_001 pairs_range_014_002

private theorem pairs_range_join_014_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [785, 806, 807, 825] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [785, 806, 807, 825] candidateTuples 0 64 121
    pairs_range_014_000 pairs_range_join_014_001_003

private theorem pairs_chunk_014 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [785, 806, 807, 825] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [785, 806, 807, 825] candidateTuples pairs_range_join_014_000_003

private theorem pairs_range_015_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [831, 864, 865, 882] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_015_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [831, 864, 865, 882] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_015_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [831, 864, 865, 882] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_015_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [831, 864, 865, 882] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [831, 864, 865, 882] candidateTuples 64 64 57
    pairs_range_015_001 pairs_range_015_002

private theorem pairs_range_join_015_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [831, 864, 865, 882] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [831, 864, 865, 882] candidateTuples 0 64 121
    pairs_range_015_000 pairs_range_join_015_001_003

private theorem pairs_chunk_015 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [831, 864, 865, 882] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [831, 864, 865, 882] candidateTuples pairs_range_join_015_000_003

private theorem pairs_range_016_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [883, 896, 908, 925] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_016_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [883, 896, 908, 925] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_016_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [883, 896, 908, 925] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_016_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [883, 896, 908, 925] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [883, 896, 908, 925] candidateTuples 64 64 57
    pairs_range_016_001 pairs_range_016_002

private theorem pairs_range_join_016_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [883, 896, 908, 925] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [883, 896, 908, 925] candidateTuples 0 64 121
    pairs_range_016_000 pairs_range_join_016_001_003

private theorem pairs_chunk_016 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [883, 896, 908, 925] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [883, 896, 908, 925] candidateTuples pairs_range_join_016_000_003

private theorem pairs_range_017_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [985, 1002, 1003, 1005] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_017_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [985, 1002, 1003, 1005] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_017_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [985, 1002, 1003, 1005] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_017_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [985, 1002, 1003, 1005] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [985, 1002, 1003, 1005] candidateTuples 64 64 57
    pairs_range_017_001 pairs_range_017_002

private theorem pairs_range_join_017_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [985, 1002, 1003, 1005] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [985, 1002, 1003, 1005] candidateTuples 0 64 121
    pairs_range_017_000 pairs_range_join_017_001_003

private theorem pairs_chunk_017 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [985, 1002, 1003, 1005] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [985, 1002, 1003, 1005] candidateTuples pairs_range_join_017_000_003

private theorem pairs_range_018_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [1006, 1007, 1008] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_018_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [1006, 1007, 1008] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_018_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [1006, 1007, 1008] candidateTuples 128 57 = true := by
  decide +kernel

private theorem pairs_range_join_018_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [1006, 1007, 1008] candidateTuples 64 121 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [1006, 1007, 1008] candidateTuples 64 64 57
    pairs_range_018_001 pairs_range_018_002

private theorem pairs_range_join_018_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [1006, 1007, 1008] candidateTuples 0 185 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [1006, 1007, 1008] candidateTuples 0 64 121
    pairs_range_018_000 pairs_range_join_018_001_003

private theorem pairs_chunk_018 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [1006, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [1006, 1007, 1008] candidateTuples pairs_range_join_018_000_003

private theorem pairs_join_000_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [0, 2, 3, 8, 32, 72, 77, 112] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [0, 2, 3, 8] [32, 72, 77, 112] candidateTuples
    pairs_chunk_000 pairs_chunk_001

private theorem pairs_join_002_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [143, 167, 168, 224, 252, 254, 269, 287] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [143, 167, 168, 224] [252, 254, 269, 287] candidateTuples
    pairs_chunk_002 pairs_chunk_003

private theorem pairs_join_000_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [0, 2, 3, 8, 32, 72, 77, 112, 143, 167, 168, 224, 252, 254, 269, 287] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [0, 2, 3, 8, 32, 72, 77, 112] [143, 167, 168, 224, 252, 254, 269, 287] candidateTuples
    pairs_join_000_002 pairs_join_002_004

private theorem pairs_join_004_006 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [302, 378, 392, 403, 404, 415, 420, 432] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [302, 378, 392, 403] [404, 415, 420, 432] candidateTuples
    pairs_chunk_004 pairs_chunk_005

private theorem pairs_join_007_009 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [504, 505, 506, 507, 531, 550, 567, 576] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [504, 505, 506, 507] [531, 550, 567, 576] candidateTuples
    pairs_chunk_007 pairs_chunk_008

private theorem pairs_join_006_009 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [438, 500, 502, 503, 504, 505, 506, 507, 531, 550, 567, 576] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [438, 500, 502, 503] [504, 505, 506, 507, 531, 550, 567, 576] candidateTuples
    pairs_chunk_006 pairs_join_007_009

private theorem pairs_join_004_009 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [302, 378, 392, 403, 404, 415, 420, 432, 438, 500, 502, 503, 504, 505, 506, 507, 531, 550, 567, 576] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [302, 378, 392, 403, 404, 415, 420, 432] [438, 500, 502, 503, 504, 505, 506, 507, 531, 550, 567, 576] candidateTuples
    pairs_join_004_006 pairs_join_006_009

private theorem pairs_join_000_009 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [0, 2, 3, 8, 32, 72, 77, 112, 143, 167, 168, 224, 252, 254, 269, 287, 302, 378, 392, 403, 404, 415, 420, 432, 438, 500, 502, 503, 504, 505, 506, 507, 531, 550, 567, 576] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [0, 2, 3, 8, 32, 72, 77, 112, 143, 167, 168, 224, 252, 254, 269, 287] [302, 378, 392, 403, 404, 415, 420, 432, 438, 500, 502, 503, 504, 505, 506, 507, 531, 550, 567, 576] candidateTuples
    pairs_join_000_004 pairs_join_004_009

private theorem pairs_join_009_011 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [604, 605, 621, 630, 665, 667, 670, 671] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [604, 605, 621, 630] [665, 667, 670, 671] candidateTuples
    pairs_chunk_009 pairs_chunk_010

private theorem pairs_join_012_014 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [720, 733, 755, 756, 757, 776, 783, 784] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [720, 733, 755, 756] [757, 776, 783, 784] candidateTuples
    pairs_chunk_012 pairs_chunk_013

private theorem pairs_join_011_014 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [672, 673, 674, 698, 720, 733, 755, 756, 757, 776, 783, 784] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [672, 673, 674, 698] [720, 733, 755, 756, 757, 776, 783, 784] candidateTuples
    pairs_chunk_011 pairs_join_012_014

private theorem pairs_join_009_014 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [604, 605, 621, 630, 665, 667, 670, 671, 672, 673, 674, 698, 720, 733, 755, 756, 757, 776, 783, 784] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [604, 605, 621, 630, 665, 667, 670, 671] [672, 673, 674, 698, 720, 733, 755, 756, 757, 776, 783, 784] candidateTuples
    pairs_join_009_011 pairs_join_011_014

private theorem pairs_join_014_016 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [785, 806, 807, 825, 831, 864, 865, 882] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [785, 806, 807, 825] [831, 864, 865, 882] candidateTuples
    pairs_chunk_014 pairs_chunk_015

private theorem pairs_join_017_019 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [985, 1002, 1003, 1005, 1006, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [985, 1002, 1003, 1005] [1006, 1007, 1008] candidateTuples
    pairs_chunk_017 pairs_chunk_018

private theorem pairs_join_016_019 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [883, 896, 908, 925, 985, 1002, 1003, 1005, 1006, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [883, 896, 908, 925] [985, 1002, 1003, 1005, 1006, 1007, 1008] candidateTuples
    pairs_chunk_016 pairs_join_017_019

private theorem pairs_join_014_019 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [785, 806, 807, 825, 831, 864, 865, 882, 883, 896, 908, 925, 985, 1002, 1003, 1005, 1006, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [785, 806, 807, 825, 831, 864, 865, 882] [883, 896, 908, 925, 985, 1002, 1003, 1005, 1006, 1007, 1008] candidateTuples
    pairs_join_014_016 pairs_join_016_019

private theorem pairs_join_009_019 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [604, 605, 621, 630, 665, 667, 670, 671, 672, 673, 674, 698, 720, 733, 755, 756, 757, 776, 783, 784, 785, 806, 807, 825, 831, 864, 865, 882, 883, 896, 908, 925, 985, 1002, 1003, 1005, 1006, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [604, 605, 621, 630, 665, 667, 670, 671, 672, 673, 674, 698, 720, 733, 755, 756, 757, 776, 783, 784] [785, 806, 807, 825, 831, 864, 865, 882, 883, 896, 908, 925, 985, 1002, 1003, 1005, 1006, 1007, 1008] candidateTuples
    pairs_join_009_014 pairs_join_014_019

private theorem pairs_join_000_019 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) [0, 2, 3, 8, 32, 72, 77, 112, 143, 167, 168, 224, 252, 254, 269, 287, 302, 378, 392, 403, 404, 415, 420, 432, 438, 500, 502, 503, 504, 505, 506, 507, 531, 550, 567, 576, 604, 605, 621, 630, 665, 667, 670, 671, 672, 673, 674, 698, 720, 733, 755, 756, 757, 776, 783, 784, 785, 806, 807, 825, 831, 864, 865, 882, 883, 896, 908, 925, 985, 1002, 1003, 1005, 1006, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27) (23 * boundedMapL 27)
    [0, 2, 3, 8, 32, 72, 77, 112, 143, 167, 168, 224, 252, 254, 269, 287, 302, 378, 392, 403, 404, 415, 420, 432, 438, 500, 502, 503, 504, 505, 506, 507, 531, 550, 567, 576] [604, 605, 621, 630, 665, 667, 670, 671, 672, 673, 674, 698, 720, 733, 755, 756, 757, 776, 783, 784, 785, 806, 807, 825, 831, 864, 865, 882, 883, 896, 908, 925, 985, 1002, 1003, 1005, 1006, 1007, 1008] candidateTuples
    pairs_join_000_009 pairs_join_009_019

theorem pairs_checked : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 27)
    (23 * boundedMapL 27) badSlopes candidateTuples = true := by
  exact pairs_join_000_019

theorem sound (x : ℕ) (hx : 0 < x) (hxK : x ≤ (23 * boundedMapL 27))
    (y : ℤ) (hy : y.natAbs ≤ (23 * boundedMapL 27)) (hcop : Nat.gcd x y.natAbs = 1)
    (hnonzero : ∀ i, ((boundedMaps 27) *ᵥ ![(x : ℤ), y]) i ≠ 0)
    (hdistinct : Function.Injective (fun i => (((boundedMaps 27) *ᵥ ![(x : ℤ), y]) i).natAbs))
    (hnot : ¬Loneliness.CriticalFamilies.ContainsCriticalQuadruple
      (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 27) *ᵥ ![(x : ℤ), y])))
    (hlow : Loneliness.value (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 27) *ᵥ ![(x : ℤ), y])) < (1 / 5 : ℝ)) :
    Loneliness.Modular.primitiveDirection ((boundedMaps 27) *ᵥ ![(x : ℤ), y]) ∈ candidateTuples :=
  boundedSlopeScanCheck_candidates 1009 1013
    (treeMask 1009 ScalarTrees.P1009.tree) (treeMask 1013 ScalarTrees.P1013.tree)
    (boundedMaps 27) (23 * boundedMapL 27) badSlopes candidateTuples
    ScalarTrees.P1009.prime (by decide) (by decide +kernel)
    ScalarTrees.P1009.sound ScalarTrees.P1013.sound slopes_checked pairs_checked
    x hx hxK y hy hcop hnonzero hdistinct hnot hlow

end Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M27
