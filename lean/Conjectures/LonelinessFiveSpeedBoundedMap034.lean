import Conjectures.LonelinessFiveSpeedBoundedCheckBlocks
import Conjectures.LonelinessFiveSpeedLineReductionData
import Conjectures.LonelinessFiveSpeedBoundedCandidates
import Conjectures.LonelinessFiveSpeedScalarTreeMask1009
import Conjectures.LonelinessFiveSpeedScalarTreeMask1013

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M34

open Matrix
open scoped Matrix

def badSlopes : List ℕ := [0, 2, 3, 77, 112, 167, 168, 201, 251, 252, 288, 302, 378, 432, 448, 458, 503, 504, 505, 506, 560, 576, 593, 605, 630, 672, 673, 756, 757, 807, 825, 864, 865, 874, 896, 917, 931, 1005, 1007, 1008]

theorem slopes_checked : slopeCoverCheck 1009
    (treeMask 1009 ScalarTrees.P1009.tree) (boundedMaps 34) badSlopes = true := by
  decide +kernel

private theorem pairs_range_000_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [0, 2, 3, 77] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_000_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [0, 2, 3, 77] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_000_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [0, 2, 3, 77] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [0, 2, 3, 77] candidateTuples 0 64 52
    pairs_range_000_000 pairs_range_000_001

private theorem pairs_chunk_000 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [0, 2, 3, 77] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [0, 2, 3, 77] candidateTuples pairs_range_join_000_000_002

private theorem pairs_range_001_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [112, 167, 168, 201] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_001_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [112, 167, 168, 201] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_001_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [112, 167, 168, 201] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [112, 167, 168, 201] candidateTuples 0 64 52
    pairs_range_001_000 pairs_range_001_001

private theorem pairs_chunk_001 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [112, 167, 168, 201] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [112, 167, 168, 201] candidateTuples pairs_range_join_001_000_002

private theorem pairs_range_002_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [251, 252, 288, 302] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_002_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [251, 252, 288, 302] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_002_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [251, 252, 288, 302] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [251, 252, 288, 302] candidateTuples 0 64 52
    pairs_range_002_000 pairs_range_002_001

private theorem pairs_chunk_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [251, 252, 288, 302] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [251, 252, 288, 302] candidateTuples pairs_range_join_002_000_002

private theorem pairs_range_003_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [378, 432, 448, 458] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_003_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [378, 432, 448, 458] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_003_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [378, 432, 448, 458] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [378, 432, 448, 458] candidateTuples 0 64 52
    pairs_range_003_000 pairs_range_003_001

private theorem pairs_chunk_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [378, 432, 448, 458] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [378, 432, 448, 458] candidateTuples pairs_range_join_003_000_002

private theorem pairs_range_004_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [503, 504, 505, 506] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_004_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [503, 504, 505, 506] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_004_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [503, 504, 505, 506] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [503, 504, 505, 506] candidateTuples 0 64 52
    pairs_range_004_000 pairs_range_004_001

private theorem pairs_chunk_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [503, 504, 505, 506] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [503, 504, 505, 506] candidateTuples pairs_range_join_004_000_002

private theorem pairs_range_005_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [560, 576, 593, 605] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_005_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [560, 576, 593, 605] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_005_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [560, 576, 593, 605] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [560, 576, 593, 605] candidateTuples 0 64 52
    pairs_range_005_000 pairs_range_005_001

private theorem pairs_chunk_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [560, 576, 593, 605] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [560, 576, 593, 605] candidateTuples pairs_range_join_005_000_002

private theorem pairs_range_006_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [630, 672, 673, 756] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_006_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [630, 672, 673, 756] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_006_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [630, 672, 673, 756] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [630, 672, 673, 756] candidateTuples 0 64 52
    pairs_range_006_000 pairs_range_006_001

private theorem pairs_chunk_006 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [630, 672, 673, 756] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [630, 672, 673, 756] candidateTuples pairs_range_join_006_000_002

private theorem pairs_range_007_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [757, 807, 825, 864] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_007_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [757, 807, 825, 864] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_007_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [757, 807, 825, 864] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [757, 807, 825, 864] candidateTuples 0 64 52
    pairs_range_007_000 pairs_range_007_001

private theorem pairs_chunk_007 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [757, 807, 825, 864] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [757, 807, 825, 864] candidateTuples pairs_range_join_007_000_002

private theorem pairs_range_008_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [865, 874, 896, 917] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_008_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [865, 874, 896, 917] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_008_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [865, 874, 896, 917] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [865, 874, 896, 917] candidateTuples 0 64 52
    pairs_range_008_000 pairs_range_008_001

private theorem pairs_chunk_008 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [865, 874, 896, 917] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [865, 874, 896, 917] candidateTuples pairs_range_join_008_000_002

private theorem pairs_range_009_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [931, 1005, 1007, 1008] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_009_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [931, 1005, 1007, 1008] candidateTuples 64 52 = true := by
  decide +kernel

private theorem pairs_range_join_009_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [931, 1005, 1007, 1008] candidateTuples 0 116 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [931, 1005, 1007, 1008] candidateTuples 0 64 52
    pairs_range_009_000 pairs_range_009_001

private theorem pairs_chunk_009 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [931, 1005, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [931, 1005, 1007, 1008] candidateTuples pairs_range_join_009_000_002

private theorem pairs_join_000_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [0, 2, 3, 77, 112, 167, 168, 201] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [0, 2, 3, 77] [112, 167, 168, 201] candidateTuples
    pairs_chunk_000 pairs_chunk_001

private theorem pairs_join_003_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [378, 432, 448, 458, 503, 504, 505, 506] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [378, 432, 448, 458] [503, 504, 505, 506] candidateTuples
    pairs_chunk_003 pairs_chunk_004

private theorem pairs_join_002_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [251, 252, 288, 302, 378, 432, 448, 458, 503, 504, 505, 506] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [251, 252, 288, 302] [378, 432, 448, 458, 503, 504, 505, 506] candidateTuples
    pairs_chunk_002 pairs_join_003_005

private theorem pairs_join_000_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [0, 2, 3, 77, 112, 167, 168, 201, 251, 252, 288, 302, 378, 432, 448, 458, 503, 504, 505, 506] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [0, 2, 3, 77, 112, 167, 168, 201] [251, 252, 288, 302, 378, 432, 448, 458, 503, 504, 505, 506] candidateTuples
    pairs_join_000_002 pairs_join_002_005

private theorem pairs_join_005_007 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [560, 576, 593, 605, 630, 672, 673, 756] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [560, 576, 593, 605] [630, 672, 673, 756] candidateTuples
    pairs_chunk_005 pairs_chunk_006

private theorem pairs_join_008_010 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [865, 874, 896, 917, 931, 1005, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [865, 874, 896, 917] [931, 1005, 1007, 1008] candidateTuples
    pairs_chunk_008 pairs_chunk_009

private theorem pairs_join_007_010 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [757, 807, 825, 864, 865, 874, 896, 917, 931, 1005, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [757, 807, 825, 864] [865, 874, 896, 917, 931, 1005, 1007, 1008] candidateTuples
    pairs_chunk_007 pairs_join_008_010

private theorem pairs_join_005_010 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [560, 576, 593, 605, 630, 672, 673, 756, 757, 807, 825, 864, 865, 874, 896, 917, 931, 1005, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [560, 576, 593, 605, 630, 672, 673, 756] [757, 807, 825, 864, 865, 874, 896, 917, 931, 1005, 1007, 1008] candidateTuples
    pairs_join_005_007 pairs_join_007_010

private theorem pairs_join_000_010 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) [0, 2, 3, 77, 112, 167, 168, 201, 251, 252, 288, 302, 378, 432, 448, 458, 503, 504, 505, 506, 560, 576, 593, 605, 630, 672, 673, 756, 757, 807, 825, 864, 865, 874, 896, 917, 931, 1005, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34) (23 * boundedMapL 34)
    [0, 2, 3, 77, 112, 167, 168, 201, 251, 252, 288, 302, 378, 432, 448, 458, 503, 504, 505, 506] [560, 576, 593, 605, 630, 672, 673, 756, 757, 807, 825, 864, 865, 874, 896, 917, 931, 1005, 1007, 1008] candidateTuples
    pairs_join_000_005 pairs_join_005_010

theorem pairs_checked : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 34)
    (23 * boundedMapL 34) badSlopes candidateTuples = true := by
  exact pairs_join_000_010

theorem sound (x : ℕ) (hx : 0 < x) (hxK : x ≤ (23 * boundedMapL 34))
    (y : ℤ) (hy : y.natAbs ≤ (23 * boundedMapL 34)) (hcop : Nat.gcd x y.natAbs = 1)
    (hnonzero : ∀ i, ((boundedMaps 34) *ᵥ ![(x : ℤ), y]) i ≠ 0)
    (hdistinct : Function.Injective (fun i => (((boundedMaps 34) *ᵥ ![(x : ℤ), y]) i).natAbs))
    (hnot : ¬Loneliness.CriticalFamilies.ContainsCriticalQuadruple
      (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 34) *ᵥ ![(x : ℤ), y])))
    (hlow : Loneliness.value (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 34) *ᵥ ![(x : ℤ), y])) < (1 / 5 : ℝ)) :
    Loneliness.Modular.primitiveDirection ((boundedMaps 34) *ᵥ ![(x : ℤ), y]) ∈ candidateTuples :=
  boundedSlopeScanCheck_candidates 1009 1013
    (treeMask 1009 ScalarTrees.P1009.tree) (treeMask 1013 ScalarTrees.P1013.tree)
    (boundedMaps 34) (23 * boundedMapL 34) badSlopes candidateTuples
    ScalarTrees.P1009.prime (by decide) (by decide +kernel)
    ScalarTrees.P1009.sound ScalarTrees.P1013.sound slopes_checked pairs_checked
    x hx hxK y hy hcop hnonzero hdistinct hnot hlow

end Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M34
