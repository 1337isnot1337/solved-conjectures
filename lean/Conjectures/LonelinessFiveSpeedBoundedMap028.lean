import Conjectures.LonelinessFiveSpeedBoundedCheckBlocks
import Conjectures.LonelinessFiveSpeedLineReductionData
import Conjectures.LonelinessFiveSpeedBoundedCandidates
import Conjectures.LonelinessFiveSpeedScalarTreeMask1009
import Conjectures.LonelinessFiveSpeedScalarTreeMask1013

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M28

open Matrix
open scoped Matrix

def badSlopes : List ℕ := [0, 1, 2, 4, 6, 124, 125, 200, 201, 250, 251, 252, 333, 334, 335, 336, 377, 401, 402, 604, 605, 629, 670, 671, 672, 673, 754, 755, 756, 805, 806, 881, 882, 1000, 1002, 1004, 1005, 1006, 1007, 1008]

theorem slopes_checked : slopeCoverCheck 1009
    (treeMask 1009 ScalarTrees.P1009.tree) (boundedMaps 28) badSlopes = true := by
  decide +kernel

private theorem pairs_range_000_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [0, 1, 2, 4] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_000_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [0, 1, 2, 4] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_000_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [0, 1, 2, 4] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [0, 1, 2, 4] candidateTuples 0 64 29
    pairs_range_000_000 pairs_range_000_001

private theorem pairs_chunk_000 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [0, 1, 2, 4] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [0, 1, 2, 4] candidateTuples pairs_range_join_000_000_002

private theorem pairs_range_001_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [6, 124, 125, 200] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_001_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [6, 124, 125, 200] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_001_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [6, 124, 125, 200] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [6, 124, 125, 200] candidateTuples 0 64 29
    pairs_range_001_000 pairs_range_001_001

private theorem pairs_chunk_001 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [6, 124, 125, 200] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [6, 124, 125, 200] candidateTuples pairs_range_join_001_000_002

private theorem pairs_range_002_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [201, 250, 251, 252] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_002_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [201, 250, 251, 252] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_002_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [201, 250, 251, 252] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [201, 250, 251, 252] candidateTuples 0 64 29
    pairs_range_002_000 pairs_range_002_001

private theorem pairs_chunk_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [201, 250, 251, 252] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [201, 250, 251, 252] candidateTuples pairs_range_join_002_000_002

private theorem pairs_range_003_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [333, 334, 335, 336] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_003_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [333, 334, 335, 336] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_003_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [333, 334, 335, 336] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [333, 334, 335, 336] candidateTuples 0 64 29
    pairs_range_003_000 pairs_range_003_001

private theorem pairs_chunk_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [333, 334, 335, 336] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [333, 334, 335, 336] candidateTuples pairs_range_join_003_000_002

private theorem pairs_range_004_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [377, 401, 402, 604] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_004_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [377, 401, 402, 604] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_004_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [377, 401, 402, 604] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [377, 401, 402, 604] candidateTuples 0 64 29
    pairs_range_004_000 pairs_range_004_001

private theorem pairs_chunk_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [377, 401, 402, 604] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [377, 401, 402, 604] candidateTuples pairs_range_join_004_000_002

private theorem pairs_range_005_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [605, 629, 670, 671] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_005_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [605, 629, 670, 671] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_005_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [605, 629, 670, 671] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [605, 629, 670, 671] candidateTuples 0 64 29
    pairs_range_005_000 pairs_range_005_001

private theorem pairs_chunk_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [605, 629, 670, 671] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [605, 629, 670, 671] candidateTuples pairs_range_join_005_000_002

private theorem pairs_range_006_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [672, 673, 754, 755] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_006_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [672, 673, 754, 755] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_006_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [672, 673, 754, 755] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [672, 673, 754, 755] candidateTuples 0 64 29
    pairs_range_006_000 pairs_range_006_001

private theorem pairs_chunk_006 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [672, 673, 754, 755] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [672, 673, 754, 755] candidateTuples pairs_range_join_006_000_002

private theorem pairs_range_007_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [756, 805, 806, 881] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_007_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [756, 805, 806, 881] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_007_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [756, 805, 806, 881] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [756, 805, 806, 881] candidateTuples 0 64 29
    pairs_range_007_000 pairs_range_007_001

private theorem pairs_chunk_007 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [756, 805, 806, 881] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [756, 805, 806, 881] candidateTuples pairs_range_join_007_000_002

private theorem pairs_range_008_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [882, 1000, 1002, 1004] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_008_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [882, 1000, 1002, 1004] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_008_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [882, 1000, 1002, 1004] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [882, 1000, 1002, 1004] candidateTuples 0 64 29
    pairs_range_008_000 pairs_range_008_001

private theorem pairs_chunk_008 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [882, 1000, 1002, 1004] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [882, 1000, 1002, 1004] candidateTuples pairs_range_join_008_000_002

private theorem pairs_range_009_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [1005, 1006, 1007, 1008] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_009_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [1005, 1006, 1007, 1008] candidateTuples 64 29 = true := by
  decide +kernel

private theorem pairs_range_join_009_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [1005, 1006, 1007, 1008] candidateTuples 0 93 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [1005, 1006, 1007, 1008] candidateTuples 0 64 29
    pairs_range_009_000 pairs_range_009_001

private theorem pairs_chunk_009 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [1005, 1006, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [1005, 1006, 1007, 1008] candidateTuples pairs_range_join_009_000_002

private theorem pairs_join_000_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [0, 1, 2, 4, 6, 124, 125, 200] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [0, 1, 2, 4] [6, 124, 125, 200] candidateTuples
    pairs_chunk_000 pairs_chunk_001

private theorem pairs_join_003_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [333, 334, 335, 336, 377, 401, 402, 604] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [333, 334, 335, 336] [377, 401, 402, 604] candidateTuples
    pairs_chunk_003 pairs_chunk_004

private theorem pairs_join_002_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [201, 250, 251, 252, 333, 334, 335, 336, 377, 401, 402, 604] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [201, 250, 251, 252] [333, 334, 335, 336, 377, 401, 402, 604] candidateTuples
    pairs_chunk_002 pairs_join_003_005

private theorem pairs_join_000_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [0, 1, 2, 4, 6, 124, 125, 200, 201, 250, 251, 252, 333, 334, 335, 336, 377, 401, 402, 604] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [0, 1, 2, 4, 6, 124, 125, 200] [201, 250, 251, 252, 333, 334, 335, 336, 377, 401, 402, 604] candidateTuples
    pairs_join_000_002 pairs_join_002_005

private theorem pairs_join_005_007 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [605, 629, 670, 671, 672, 673, 754, 755] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [605, 629, 670, 671] [672, 673, 754, 755] candidateTuples
    pairs_chunk_005 pairs_chunk_006

private theorem pairs_join_008_010 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [882, 1000, 1002, 1004, 1005, 1006, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [882, 1000, 1002, 1004] [1005, 1006, 1007, 1008] candidateTuples
    pairs_chunk_008 pairs_chunk_009

private theorem pairs_join_007_010 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [756, 805, 806, 881, 882, 1000, 1002, 1004, 1005, 1006, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [756, 805, 806, 881] [882, 1000, 1002, 1004, 1005, 1006, 1007, 1008] candidateTuples
    pairs_chunk_007 pairs_join_008_010

private theorem pairs_join_005_010 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [605, 629, 670, 671, 672, 673, 754, 755, 756, 805, 806, 881, 882, 1000, 1002, 1004, 1005, 1006, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [605, 629, 670, 671, 672, 673, 754, 755] [756, 805, 806, 881, 882, 1000, 1002, 1004, 1005, 1006, 1007, 1008] candidateTuples
    pairs_join_005_007 pairs_join_007_010

private theorem pairs_join_000_010 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) [0, 1, 2, 4, 6, 124, 125, 200, 201, 250, 251, 252, 333, 334, 335, 336, 377, 401, 402, 604, 605, 629, 670, 671, 672, 673, 754, 755, 756, 805, 806, 881, 882, 1000, 1002, 1004, 1005, 1006, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28) (23 * boundedMapL 28)
    [0, 1, 2, 4, 6, 124, 125, 200, 201, 250, 251, 252, 333, 334, 335, 336, 377, 401, 402, 604] [605, 629, 670, 671, 672, 673, 754, 755, 756, 805, 806, 881, 882, 1000, 1002, 1004, 1005, 1006, 1007, 1008] candidateTuples
    pairs_join_000_005 pairs_join_005_010

theorem pairs_checked : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 28)
    (23 * boundedMapL 28) badSlopes candidateTuples = true := by
  exact pairs_join_000_010

theorem sound (x : ℕ) (hx : 0 < x) (hxK : x ≤ (23 * boundedMapL 28))
    (y : ℤ) (hy : y.natAbs ≤ (23 * boundedMapL 28)) (hcop : Nat.gcd x y.natAbs = 1)
    (hnonzero : ∀ i, ((boundedMaps 28) *ᵥ ![(x : ℤ), y]) i ≠ 0)
    (hdistinct : Function.Injective (fun i => (((boundedMaps 28) *ᵥ ![(x : ℤ), y]) i).natAbs))
    (hnot : ¬Loneliness.CriticalFamilies.ContainsCriticalQuadruple
      (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 28) *ᵥ ![(x : ℤ), y])))
    (hlow : Loneliness.value (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 28) *ᵥ ![(x : ℤ), y])) < (1 / 5 : ℝ)) :
    Loneliness.Modular.primitiveDirection ((boundedMaps 28) *ᵥ ![(x : ℤ), y]) ∈ candidateTuples :=
  boundedSlopeScanCheck_candidates 1009 1013
    (treeMask 1009 ScalarTrees.P1009.tree) (treeMask 1013 ScalarTrees.P1013.tree)
    (boundedMaps 28) (23 * boundedMapL 28) badSlopes candidateTuples
    ScalarTrees.P1009.prime (by decide) (by decide +kernel)
    ScalarTrees.P1009.sound ScalarTrees.P1013.sound slopes_checked pairs_checked
    x hx hxK y hy hcop hnonzero hdistinct hnot hlow

end Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M28
