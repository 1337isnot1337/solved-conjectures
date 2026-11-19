import Conjectures.LonelinessFiveSpeedBoundedCheckBlocks
import Conjectures.LonelinessFiveSpeedLineReductionData
import Conjectures.LonelinessFiveSpeedBoundedCandidates
import Conjectures.LonelinessFiveSpeedScalarTreeMask1009
import Conjectures.LonelinessFiveSpeedScalarTreeMask1013

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M107

open Matrix
open scoped Matrix

def badSlopes : List ℕ := [0, 2, 3, 4, 7, 125, 142, 167, 200, 201, 250, 251, 252, 334, 335, 337, 401, 402, 431, 501, 502, 503, 504, 505, 575, 629, 669, 670, 672, 673, 755, 839, 864, 895, 1000, 1003, 1004, 1005, 1007, 1008]

theorem slopes_checked : slopeCoverCheck 1009
    (treeMask 1009 ScalarTrees.P1009.tree) (boundedMaps 107) badSlopes = true := by
  decide +kernel

private theorem pairs_range_000_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [0, 2, 3, 4] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_000_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [0, 2, 3, 4] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_000_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [0, 2, 3, 4] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [0, 2, 3, 4] candidateTuples 0 64 52
    pairs_range_000_000 pairs_range_000_001

private theorem pairs_chunk_000 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [0, 2, 3, 4] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [0, 2, 3, 4] candidateTuples pairs_range_join_000_000_002

private theorem pairs_range_001_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [7, 125, 142, 167] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_001_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [7, 125, 142, 167] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_001_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [7, 125, 142, 167] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [7, 125, 142, 167] candidateTuples 0 64 52
    pairs_range_001_000 pairs_range_001_001

private theorem pairs_chunk_001 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [7, 125, 142, 167] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [7, 125, 142, 167] candidateTuples pairs_range_join_001_000_002

private theorem pairs_range_002_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [200, 201, 250, 251] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_002_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [200, 201, 250, 251] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_002_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [200, 201, 250, 251] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [200, 201, 250, 251] candidateTuples 0 64 52
    pairs_range_002_000 pairs_range_002_001

private theorem pairs_chunk_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [200, 201, 250, 251] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [200, 201, 250, 251] candidateTuples pairs_range_join_002_000_002

private theorem pairs_range_003_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [252, 334, 335, 337] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_003_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [252, 334, 335, 337] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_003_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [252, 334, 335, 337] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [252, 334, 335, 337] candidateTuples 0 64 52
    pairs_range_003_000 pairs_range_003_001

private theorem pairs_chunk_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [252, 334, 335, 337] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [252, 334, 335, 337] candidateTuples pairs_range_join_003_000_002

private theorem pairs_range_004_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [401, 402, 431, 501] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_004_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [401, 402, 431, 501] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_004_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [401, 402, 431, 501] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [401, 402, 431, 501] candidateTuples 0 64 52
    pairs_range_004_000 pairs_range_004_001

private theorem pairs_chunk_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [401, 402, 431, 501] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [401, 402, 431, 501] candidateTuples pairs_range_join_004_000_002

private theorem pairs_range_005_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [502, 503, 504, 505] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_005_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [502, 503, 504, 505] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_005_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [502, 503, 504, 505] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [502, 503, 504, 505] candidateTuples 0 64 52
    pairs_range_005_000 pairs_range_005_001

private theorem pairs_chunk_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [502, 503, 504, 505] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [502, 503, 504, 505] candidateTuples pairs_range_join_005_000_002

private theorem pairs_range_006_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [575, 629, 669, 670] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_006_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [575, 629, 669, 670] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_006_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [575, 629, 669, 670] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [575, 629, 669, 670] candidateTuples 0 64 52
    pairs_range_006_000 pairs_range_006_001

private theorem pairs_chunk_006 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [575, 629, 669, 670] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [575, 629, 669, 670] candidateTuples pairs_range_join_006_000_002

private theorem pairs_range_007_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [672, 673, 755, 839] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_007_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [672, 673, 755, 839] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_007_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [672, 673, 755, 839] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [672, 673, 755, 839] candidateTuples 0 64 52
    pairs_range_007_000 pairs_range_007_001

private theorem pairs_chunk_007 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [672, 673, 755, 839] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [672, 673, 755, 839] candidateTuples pairs_range_join_007_000_002

private theorem pairs_range_008_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [864, 895, 1000, 1003] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_008_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [864, 895, 1000, 1003] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_008_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [864, 895, 1000, 1003] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [864, 895, 1000, 1003] candidateTuples 0 64 52
    pairs_range_008_000 pairs_range_008_001

private theorem pairs_chunk_008 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [864, 895, 1000, 1003] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [864, 895, 1000, 1003] candidateTuples pairs_range_join_008_000_002

private theorem pairs_range_009_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [1004, 1005, 1007, 1008] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_009_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [1004, 1005, 1007, 1008] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_009_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [1004, 1005, 1007, 1008] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [1004, 1005, 1007, 1008] candidateTuples 0 64 52
    pairs_range_009_000 pairs_range_009_001

private theorem pairs_chunk_009 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [1004, 1005, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [1004, 1005, 1007, 1008] candidateTuples pairs_range_join_009_000_002

private theorem pairs_join_000_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [0, 2, 3, 4, 7, 125, 142, 167] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [0, 2, 3, 4] [7, 125, 142, 167] candidateTuples
    pairs_chunk_000 pairs_chunk_001

private theorem pairs_join_003_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [252, 334, 335, 337, 401, 402, 431, 501] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [252, 334, 335, 337] [401, 402, 431, 501] candidateTuples
    pairs_chunk_003 pairs_chunk_004

private theorem pairs_join_002_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [200, 201, 250, 251, 252, 334, 335, 337, 401, 402, 431, 501] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [200, 201, 250, 251] [252, 334, 335, 337, 401, 402, 431, 501] candidateTuples
    pairs_chunk_002 pairs_join_003_005

private theorem pairs_join_000_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [0, 2, 3, 4, 7, 125, 142, 167, 200, 201, 250, 251, 252, 334, 335, 337, 401, 402, 431, 501] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [0, 2, 3, 4, 7, 125, 142, 167] [200, 201, 250, 251, 252, 334, 335, 337, 401, 402, 431, 501] candidateTuples
    pairs_join_000_002 pairs_join_002_005

private theorem pairs_join_005_007 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [502, 503, 504, 505, 575, 629, 669, 670] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [502, 503, 504, 505] [575, 629, 669, 670] candidateTuples
    pairs_chunk_005 pairs_chunk_006

private theorem pairs_join_008_010 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [864, 895, 1000, 1003, 1004, 1005, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [864, 895, 1000, 1003] [1004, 1005, 1007, 1008] candidateTuples
    pairs_chunk_008 pairs_chunk_009

private theorem pairs_join_007_010 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [672, 673, 755, 839, 864, 895, 1000, 1003, 1004, 1005, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [672, 673, 755, 839] [864, 895, 1000, 1003, 1004, 1005, 1007, 1008] candidateTuples
    pairs_chunk_007 pairs_join_008_010

private theorem pairs_join_005_010 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [502, 503, 504, 505, 575, 629, 669, 670, 672, 673, 755, 839, 864, 895, 1000, 1003, 1004, 1005, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [502, 503, 504, 505, 575, 629, 669, 670] [672, 673, 755, 839, 864, 895, 1000, 1003, 1004, 1005, 1007, 1008] candidateTuples
    pairs_join_005_007 pairs_join_007_010

private theorem pairs_join_000_010 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) [0, 2, 3, 4, 7, 125, 142, 167, 200, 201, 250, 251, 252, 334, 335, 337, 401, 402, 431, 501, 502, 503, 504, 505, 575, 629, 669, 670, 672, 673, 755, 839, 864, 895, 1000, 1003, 1004, 1005, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107) (23 * boundedMapL 107)
    [0, 2, 3, 4, 7, 125, 142, 167, 200, 201, 250, 251, 252, 334, 335, 337, 401, 402, 431, 501] [502, 503, 504, 505, 575, 629, 669, 670, 672, 673, 755, 839, 864, 895, 1000, 1003, 1004, 1005, 1007, 1008] candidateTuples
    pairs_join_000_005 pairs_join_005_010

theorem pairs_checked : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 107)
    (23 * boundedMapL 107) badSlopes candidateTuples = true := by
  exact pairs_join_000_010

theorem sound (x : ℕ) (hx : 0 < x) (hxK : x ≤ (23 * boundedMapL 107))
    (y : ℤ) (hy : y.natAbs ≤ (23 * boundedMapL 107)) (hcop : Nat.gcd x y.natAbs = 1)
    (hnonzero : ∀ i, ((boundedMaps 107) *ᵥ ![(x : ℤ), y]) i ≠ 0)
    (hdistinct : Function.Injective (fun i => (((boundedMaps 107) *ᵥ ![(x : ℤ), y]) i).natAbs))
    (hnot : ¬Loneliness.CriticalFamilies.ContainsCriticalQuadruple
      (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 107) *ᵥ ![(x : ℤ), y])))
    (hlow : Loneliness.value (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 107) *ᵥ ![(x : ℤ), y])) < (1 / 5 : ℝ)) :
    Loneliness.Modular.primitiveDirection ((boundedMaps 107) *ᵥ ![(x : ℤ), y]) ∈ candidateTuples :=
  boundedSlopeScanCheck_candidates 1009 1013
    (treeMask 1009 ScalarTrees.P1009.tree) (treeMask 1013 ScalarTrees.P1013.tree)
    (boundedMaps 107) (23 * boundedMapL 107) badSlopes candidateTuples
    ScalarTrees.P1009.prime (by decide) (by decide +kernel)
    ScalarTrees.P1009.sound ScalarTrees.P1013.sound slopes_checked pairs_checked
    x hx hxK y hy hcop hnonzero hdistinct hnot hlow

end Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M107
