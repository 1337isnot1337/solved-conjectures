import Conjectures.LonelinessFiveSpeedBoundedCheckBlocks
import Conjectures.LonelinessFiveSpeedLineReductionData
import Conjectures.LonelinessFiveSpeedBoundedCandidates
import Conjectures.LonelinessFiveSpeedScalarTreeMask1009
import Conjectures.LonelinessFiveSpeedScalarTreeMask1013

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M30

open Matrix
open scoped Matrix

def badSlopes : List ℕ := [0, 1, 2, 4, 5, 6, 9, 114, 145, 170, 254, 336, 337, 339, 340, 380, 434, 504, 505, 506, 507, 508, 578, 607, 608, 672, 674, 675, 757, 758, 759, 808, 809, 842, 867, 884, 1002, 1005, 1006, 1007]

theorem slopes_checked : slopeCoverCheck 1009
    (treeMask 1009 ScalarTrees.P1009.tree) (boundedMaps 30) badSlopes = true := by
  decide +kernel

private theorem pairs_range_000_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [0, 1, 2, 4] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_000_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [0, 1, 2, 4] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_000_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [0, 1, 2, 4] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [0, 1, 2, 4] candidateTuples 0 64 52
    pairs_range_000_000 pairs_range_000_001

private theorem pairs_chunk_000 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [0, 1, 2, 4] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [0, 1, 2, 4] candidateTuples pairs_range_join_000_000_002

private theorem pairs_range_001_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [5, 6, 9, 114] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_001_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [5, 6, 9, 114] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_001_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [5, 6, 9, 114] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [5, 6, 9, 114] candidateTuples 0 64 52
    pairs_range_001_000 pairs_range_001_001

private theorem pairs_chunk_001 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [5, 6, 9, 114] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [5, 6, 9, 114] candidateTuples pairs_range_join_001_000_002

private theorem pairs_range_002_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [145, 170, 254, 336] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_002_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [145, 170, 254, 336] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_002_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [145, 170, 254, 336] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [145, 170, 254, 336] candidateTuples 0 64 52
    pairs_range_002_000 pairs_range_002_001

private theorem pairs_chunk_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [145, 170, 254, 336] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [145, 170, 254, 336] candidateTuples pairs_range_join_002_000_002

private theorem pairs_range_003_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [337, 339, 340, 380] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_003_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [337, 339, 340, 380] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_003_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [337, 339, 340, 380] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [337, 339, 340, 380] candidateTuples 0 64 52
    pairs_range_003_000 pairs_range_003_001

private theorem pairs_chunk_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [337, 339, 340, 380] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [337, 339, 340, 380] candidateTuples pairs_range_join_003_000_002

private theorem pairs_range_004_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [434, 504, 505, 506] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_004_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [434, 504, 505, 506] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_004_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [434, 504, 505, 506] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [434, 504, 505, 506] candidateTuples 0 64 52
    pairs_range_004_000 pairs_range_004_001

private theorem pairs_chunk_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [434, 504, 505, 506] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [434, 504, 505, 506] candidateTuples pairs_range_join_004_000_002

private theorem pairs_range_005_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [507, 508, 578, 607] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_005_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [507, 508, 578, 607] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_005_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [507, 508, 578, 607] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [507, 508, 578, 607] candidateTuples 0 64 52
    pairs_range_005_000 pairs_range_005_001

private theorem pairs_chunk_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [507, 508, 578, 607] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [507, 508, 578, 607] candidateTuples pairs_range_join_005_000_002

private theorem pairs_range_006_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [608, 672, 674, 675] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_006_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [608, 672, 674, 675] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_006_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [608, 672, 674, 675] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [608, 672, 674, 675] candidateTuples 0 64 52
    pairs_range_006_000 pairs_range_006_001

private theorem pairs_chunk_006 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [608, 672, 674, 675] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [608, 672, 674, 675] candidateTuples pairs_range_join_006_000_002

private theorem pairs_range_007_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [757, 758, 759, 808] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_007_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [757, 758, 759, 808] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_007_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [757, 758, 759, 808] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [757, 758, 759, 808] candidateTuples 0 64 52
    pairs_range_007_000 pairs_range_007_001

private theorem pairs_chunk_007 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [757, 758, 759, 808] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [757, 758, 759, 808] candidateTuples pairs_range_join_007_000_002

private theorem pairs_range_008_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [809, 842, 867, 884] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_008_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [809, 842, 867, 884] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_008_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [809, 842, 867, 884] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [809, 842, 867, 884] candidateTuples 0 64 52
    pairs_range_008_000 pairs_range_008_001

private theorem pairs_chunk_008 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [809, 842, 867, 884] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [809, 842, 867, 884] candidateTuples pairs_range_join_008_000_002

private theorem pairs_range_009_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [1002, 1005, 1006, 1007] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_009_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [1002, 1005, 1006, 1007] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_009_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [1002, 1005, 1006, 1007] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [1002, 1005, 1006, 1007] candidateTuples 0 64 52
    pairs_range_009_000 pairs_range_009_001

private theorem pairs_chunk_009 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [1002, 1005, 1006, 1007] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [1002, 1005, 1006, 1007] candidateTuples pairs_range_join_009_000_002

private theorem pairs_join_000_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [0, 1, 2, 4, 5, 6, 9, 114] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [0, 1, 2, 4] [5, 6, 9, 114] candidateTuples
    pairs_chunk_000 pairs_chunk_001

private theorem pairs_join_003_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [337, 339, 340, 380, 434, 504, 505, 506] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [337, 339, 340, 380] [434, 504, 505, 506] candidateTuples
    pairs_chunk_003 pairs_chunk_004

private theorem pairs_join_002_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [145, 170, 254, 336, 337, 339, 340, 380, 434, 504, 505, 506] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [145, 170, 254, 336] [337, 339, 340, 380, 434, 504, 505, 506] candidateTuples
    pairs_chunk_002 pairs_join_003_005

private theorem pairs_join_000_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [0, 1, 2, 4, 5, 6, 9, 114, 145, 170, 254, 336, 337, 339, 340, 380, 434, 504, 505, 506] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [0, 1, 2, 4, 5, 6, 9, 114] [145, 170, 254, 336, 337, 339, 340, 380, 434, 504, 505, 506] candidateTuples
    pairs_join_000_002 pairs_join_002_005

private theorem pairs_join_005_007 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [507, 508, 578, 607, 608, 672, 674, 675] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [507, 508, 578, 607] [608, 672, 674, 675] candidateTuples
    pairs_chunk_005 pairs_chunk_006

private theorem pairs_join_008_010 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [809, 842, 867, 884, 1002, 1005, 1006, 1007] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [809, 842, 867, 884] [1002, 1005, 1006, 1007] candidateTuples
    pairs_chunk_008 pairs_chunk_009

private theorem pairs_join_007_010 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [757, 758, 759, 808, 809, 842, 867, 884, 1002, 1005, 1006, 1007] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [757, 758, 759, 808] [809, 842, 867, 884, 1002, 1005, 1006, 1007] candidateTuples
    pairs_chunk_007 pairs_join_008_010

private theorem pairs_join_005_010 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [507, 508, 578, 607, 608, 672, 674, 675, 757, 758, 759, 808, 809, 842, 867, 884, 1002, 1005, 1006, 1007] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [507, 508, 578, 607, 608, 672, 674, 675] [757, 758, 759, 808, 809, 842, 867, 884, 1002, 1005, 1006, 1007] candidateTuples
    pairs_join_005_007 pairs_join_007_010

private theorem pairs_join_000_010 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) [0, 1, 2, 4, 5, 6, 9, 114, 145, 170, 254, 336, 337, 339, 340, 380, 434, 504, 505, 506, 507, 508, 578, 607, 608, 672, 674, 675, 757, 758, 759, 808, 809, 842, 867, 884, 1002, 1005, 1006, 1007] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30) (23 * boundedMapL 30)
    [0, 1, 2, 4, 5, 6, 9, 114, 145, 170, 254, 336, 337, 339, 340, 380, 434, 504, 505, 506] [507, 508, 578, 607, 608, 672, 674, 675, 757, 758, 759, 808, 809, 842, 867, 884, 1002, 1005, 1006, 1007] candidateTuples
    pairs_join_000_005 pairs_join_005_010

theorem pairs_checked : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 30)
    (23 * boundedMapL 30) badSlopes candidateTuples = true := by
  exact pairs_join_000_010

theorem sound (x : ℕ) (hx : 0 < x) (hxK : x ≤ (23 * boundedMapL 30))
    (y : ℤ) (hy : y.natAbs ≤ (23 * boundedMapL 30)) (hcop : Nat.gcd x y.natAbs = 1)
    (hnonzero : ∀ i, ((boundedMaps 30) *ᵥ ![(x : ℤ), y]) i ≠ 0)
    (hdistinct : Function.Injective (fun i => (((boundedMaps 30) *ᵥ ![(x : ℤ), y]) i).natAbs))
    (hnot : ¬Loneliness.CriticalFamilies.ContainsCriticalQuadruple
      (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 30) *ᵥ ![(x : ℤ), y])))
    (hlow : Loneliness.value (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 30) *ᵥ ![(x : ℤ), y])) < (1 / 5 : ℝ)) :
    Loneliness.Modular.primitiveDirection ((boundedMaps 30) *ᵥ ![(x : ℤ), y]) ∈ candidateTuples :=
  boundedSlopeScanCheck_candidates 1009 1013
    (treeMask 1009 ScalarTrees.P1009.tree) (treeMask 1013 ScalarTrees.P1013.tree)
    (boundedMaps 30) (23 * boundedMapL 30) badSlopes candidateTuples
    ScalarTrees.P1009.prime (by decide) (by decide +kernel)
    ScalarTrees.P1009.sound ScalarTrees.P1013.sound slopes_checked pairs_checked
    x hx hxK y hy hcop hnonzero hdistinct hnot hlow

end Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M30
