import Conjectures.LonelinessFiveSpeedBoundedCheckBlocks
import Conjectures.LonelinessFiveSpeedLineReductionData
import Conjectures.LonelinessFiveSpeedBoundedCandidates
import Conjectures.LonelinessFiveSpeedScalarTreeMask1009
import Conjectures.LonelinessFiveSpeedScalarTreeMask1013

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M104

open Matrix
open scoped Matrix

def badSlopes : List ℕ := [0, 2, 3, 4, 7, 112, 143, 168, 252, 334, 335, 337, 338, 378, 432, 502, 503, 504, 505, 506, 576, 605, 606, 670, 672, 673, 755, 756, 757, 806, 807, 840, 865, 882, 1000, 1003, 1004, 1005, 1007, 1008]

theorem slopes_checked : slopeCoverCheck 1009
    (treeMask 1009 ScalarTrees.P1009.tree) (boundedMaps 104) badSlopes = true := by
  decide +kernel

private theorem pairs_range_000_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [0, 2, 3, 4] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_000_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [0, 2, 3, 4] candidateTuples 64 6 = true := by
  decide +kernel

private theorem pairs_range_join_000_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [0, 2, 3, 4] candidateTuples 0 70 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [0, 2, 3, 4] candidateTuples 0 64 6
    pairs_range_000_000 pairs_range_000_001

private theorem pairs_chunk_000 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [0, 2, 3, 4] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [0, 2, 3, 4] candidateTuples pairs_range_join_000_000_002

private theorem pairs_range_001_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [7, 112, 143, 168] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_001_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [7, 112, 143, 168] candidateTuples 64 6 = true := by
  decide +kernel

private theorem pairs_range_join_001_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [7, 112, 143, 168] candidateTuples 0 70 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [7, 112, 143, 168] candidateTuples 0 64 6
    pairs_range_001_000 pairs_range_001_001

private theorem pairs_chunk_001 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [7, 112, 143, 168] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [7, 112, 143, 168] candidateTuples pairs_range_join_001_000_002

private theorem pairs_range_002_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [252, 334, 335, 337] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_002_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [252, 334, 335, 337] candidateTuples 64 6 = true := by
  decide +kernel

private theorem pairs_range_join_002_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [252, 334, 335, 337] candidateTuples 0 70 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [252, 334, 335, 337] candidateTuples 0 64 6
    pairs_range_002_000 pairs_range_002_001

private theorem pairs_chunk_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [252, 334, 335, 337] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [252, 334, 335, 337] candidateTuples pairs_range_join_002_000_002

private theorem pairs_range_003_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [338, 378, 432, 502] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_003_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [338, 378, 432, 502] candidateTuples 64 6 = true := by
  decide +kernel

private theorem pairs_range_join_003_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [338, 378, 432, 502] candidateTuples 0 70 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [338, 378, 432, 502] candidateTuples 0 64 6
    pairs_range_003_000 pairs_range_003_001

private theorem pairs_chunk_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [338, 378, 432, 502] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [338, 378, 432, 502] candidateTuples pairs_range_join_003_000_002

private theorem pairs_range_004_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [503, 504, 505, 506] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_004_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [503, 504, 505, 506] candidateTuples 64 6 = true := by
  decide +kernel

private theorem pairs_range_join_004_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [503, 504, 505, 506] candidateTuples 0 70 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [503, 504, 505, 506] candidateTuples 0 64 6
    pairs_range_004_000 pairs_range_004_001

private theorem pairs_chunk_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [503, 504, 505, 506] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [503, 504, 505, 506] candidateTuples pairs_range_join_004_000_002

private theorem pairs_range_005_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [576, 605, 606, 670] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_005_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [576, 605, 606, 670] candidateTuples 64 6 = true := by
  decide +kernel

private theorem pairs_range_join_005_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [576, 605, 606, 670] candidateTuples 0 70 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [576, 605, 606, 670] candidateTuples 0 64 6
    pairs_range_005_000 pairs_range_005_001

private theorem pairs_chunk_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [576, 605, 606, 670] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [576, 605, 606, 670] candidateTuples pairs_range_join_005_000_002

private theorem pairs_range_006_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [672, 673, 755, 756] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_006_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [672, 673, 755, 756] candidateTuples 64 6 = true := by
  decide +kernel

private theorem pairs_range_join_006_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [672, 673, 755, 756] candidateTuples 0 70 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [672, 673, 755, 756] candidateTuples 0 64 6
    pairs_range_006_000 pairs_range_006_001

private theorem pairs_chunk_006 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [672, 673, 755, 756] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [672, 673, 755, 756] candidateTuples pairs_range_join_006_000_002

private theorem pairs_range_007_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [757, 806, 807, 840] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_007_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [757, 806, 807, 840] candidateTuples 64 6 = true := by
  decide +kernel

private theorem pairs_range_join_007_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [757, 806, 807, 840] candidateTuples 0 70 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [757, 806, 807, 840] candidateTuples 0 64 6
    pairs_range_007_000 pairs_range_007_001

private theorem pairs_chunk_007 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [757, 806, 807, 840] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [757, 806, 807, 840] candidateTuples pairs_range_join_007_000_002

private theorem pairs_range_008_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [865, 882, 1000, 1003] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_008_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [865, 882, 1000, 1003] candidateTuples 64 6 = true := by
  decide +kernel

private theorem pairs_range_join_008_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [865, 882, 1000, 1003] candidateTuples 0 70 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [865, 882, 1000, 1003] candidateTuples 0 64 6
    pairs_range_008_000 pairs_range_008_001

private theorem pairs_chunk_008 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [865, 882, 1000, 1003] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [865, 882, 1000, 1003] candidateTuples pairs_range_join_008_000_002

private theorem pairs_range_009_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [1004, 1005, 1007, 1008] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_009_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [1004, 1005, 1007, 1008] candidateTuples 64 6 = true := by
  decide +kernel

private theorem pairs_range_join_009_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [1004, 1005, 1007, 1008] candidateTuples 0 70 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [1004, 1005, 1007, 1008] candidateTuples 0 64 6
    pairs_range_009_000 pairs_range_009_001

private theorem pairs_chunk_009 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [1004, 1005, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [1004, 1005, 1007, 1008] candidateTuples pairs_range_join_009_000_002

private theorem pairs_join_000_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [0, 2, 3, 4, 7, 112, 143, 168] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [0, 2, 3, 4] [7, 112, 143, 168] candidateTuples
    pairs_chunk_000 pairs_chunk_001

private theorem pairs_join_003_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [338, 378, 432, 502, 503, 504, 505, 506] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [338, 378, 432, 502] [503, 504, 505, 506] candidateTuples
    pairs_chunk_003 pairs_chunk_004

private theorem pairs_join_002_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [252, 334, 335, 337, 338, 378, 432, 502, 503, 504, 505, 506] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [252, 334, 335, 337] [338, 378, 432, 502, 503, 504, 505, 506] candidateTuples
    pairs_chunk_002 pairs_join_003_005

private theorem pairs_join_000_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [0, 2, 3, 4, 7, 112, 143, 168, 252, 334, 335, 337, 338, 378, 432, 502, 503, 504, 505, 506] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [0, 2, 3, 4, 7, 112, 143, 168] [252, 334, 335, 337, 338, 378, 432, 502, 503, 504, 505, 506] candidateTuples
    pairs_join_000_002 pairs_join_002_005

private theorem pairs_join_005_007 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [576, 605, 606, 670, 672, 673, 755, 756] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [576, 605, 606, 670] [672, 673, 755, 756] candidateTuples
    pairs_chunk_005 pairs_chunk_006

private theorem pairs_join_008_010 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [865, 882, 1000, 1003, 1004, 1005, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [865, 882, 1000, 1003] [1004, 1005, 1007, 1008] candidateTuples
    pairs_chunk_008 pairs_chunk_009

private theorem pairs_join_007_010 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [757, 806, 807, 840, 865, 882, 1000, 1003, 1004, 1005, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [757, 806, 807, 840] [865, 882, 1000, 1003, 1004, 1005, 1007, 1008] candidateTuples
    pairs_chunk_007 pairs_join_008_010

private theorem pairs_join_005_010 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [576, 605, 606, 670, 672, 673, 755, 756, 757, 806, 807, 840, 865, 882, 1000, 1003, 1004, 1005, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [576, 605, 606, 670, 672, 673, 755, 756] [757, 806, 807, 840, 865, 882, 1000, 1003, 1004, 1005, 1007, 1008] candidateTuples
    pairs_join_005_007 pairs_join_007_010

private theorem pairs_join_000_010 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) [0, 2, 3, 4, 7, 112, 143, 168, 252, 334, 335, 337, 338, 378, 432, 502, 503, 504, 505, 506, 576, 605, 606, 670, 672, 673, 755, 756, 757, 806, 807, 840, 865, 882, 1000, 1003, 1004, 1005, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104) (23 * boundedMapL 104)
    [0, 2, 3, 4, 7, 112, 143, 168, 252, 334, 335, 337, 338, 378, 432, 502, 503, 504, 505, 506] [576, 605, 606, 670, 672, 673, 755, 756, 757, 806, 807, 840, 865, 882, 1000, 1003, 1004, 1005, 1007, 1008] candidateTuples
    pairs_join_000_005 pairs_join_005_010

theorem pairs_checked : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 104)
    (23 * boundedMapL 104) badSlopes candidateTuples = true := by
  exact pairs_join_000_010

theorem sound (x : ℕ) (hx : 0 < x) (hxK : x ≤ (23 * boundedMapL 104))
    (y : ℤ) (hy : y.natAbs ≤ (23 * boundedMapL 104)) (hcop : Nat.gcd x y.natAbs = 1)
    (hnonzero : ∀ i, ((boundedMaps 104) *ᵥ ![(x : ℤ), y]) i ≠ 0)
    (hdistinct : Function.Injective (fun i => (((boundedMaps 104) *ᵥ ![(x : ℤ), y]) i).natAbs))
    (hnot : ¬Loneliness.CriticalFamilies.ContainsCriticalQuadruple
      (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 104) *ᵥ ![(x : ℤ), y])))
    (hlow : Loneliness.value (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 104) *ᵥ ![(x : ℤ), y])) < (1 / 5 : ℝ)) :
    Loneliness.Modular.primitiveDirection ((boundedMaps 104) *ᵥ ![(x : ℤ), y]) ∈ candidateTuples :=
  boundedSlopeScanCheck_candidates 1009 1013
    (treeMask 1009 ScalarTrees.P1009.tree) (treeMask 1013 ScalarTrees.P1013.tree)
    (boundedMaps 104) (23 * boundedMapL 104) badSlopes candidateTuples
    ScalarTrees.P1009.prime (by decide) (by decide +kernel)
    ScalarTrees.P1009.sound ScalarTrees.P1013.sound slopes_checked pairs_checked
    x hx hxK y hy hcop hnonzero hdistinct hnot hlow

end Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M104
