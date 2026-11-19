import Conjectures.LonelinessFiveSpeedBoundedCheckBlocks
import Conjectures.LonelinessFiveSpeedLineReductionData
import Conjectures.LonelinessFiveSpeedBoundedCandidates
import Conjectures.LonelinessFiveSpeedScalarTreeMask1009
import Conjectures.LonelinessFiveSpeedScalarTreeMask1013

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M66

open Matrix
open scoped Matrix

def badSlopes : List ℕ := [0, 3, 77, 143, 183, 252, 302, 378, 403, 415, 432, 503, 504, 505, 550, 576, 720, 733, 756, 757, 807, 882, 1005, 1008]

theorem slopes_checked : slopeCoverCheck 1009
    (treeMask 1009 ScalarTrees.P1009.tree) (boundedMaps 66) badSlopes = true := by
  decide +kernel

private theorem pairs_range_000_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [0, 3, 77, 143] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_000_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [0, 3, 77, 143] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [0, 3, 77, 143] candidateTuples 128 64 = true := by
  decide +kernel

private theorem pairs_range_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [0, 3, 77, 143] candidateTuples 192 64 = true := by
  decide +kernel

private theorem pairs_range_000_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [0, 3, 77, 143] candidateTuples 256 21 = true := by
  decide +kernel

private theorem pairs_range_join_000_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [0, 3, 77, 143] candidateTuples 0 128 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [0, 3, 77, 143] candidateTuples 0 64 64
    pairs_range_000_000 pairs_range_000_001

private theorem pairs_range_join_000_003_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [0, 3, 77, 143] candidateTuples 192 85 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [0, 3, 77, 143] candidateTuples 192 64 21
    pairs_range_000_003 pairs_range_000_004

private theorem pairs_range_join_000_002_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [0, 3, 77, 143] candidateTuples 128 149 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [0, 3, 77, 143] candidateTuples 128 64 85
    pairs_range_000_002 pairs_range_join_000_003_005

private theorem pairs_range_join_000_000_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [0, 3, 77, 143] candidateTuples 0 277 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [0, 3, 77, 143] candidateTuples 0 128 149
    pairs_range_join_000_000_002 pairs_range_join_000_002_005

private theorem pairs_chunk_000 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [0, 3, 77, 143] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [0, 3, 77, 143] candidateTuples pairs_range_join_000_000_005

private theorem pairs_range_001_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [183, 252, 302, 378] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_001_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [183, 252, 302, 378] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_001_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [183, 252, 302, 378] candidateTuples 128 64 = true := by
  decide +kernel

private theorem pairs_range_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [183, 252, 302, 378] candidateTuples 192 64 = true := by
  decide +kernel

private theorem pairs_range_001_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [183, 252, 302, 378] candidateTuples 256 21 = true := by
  decide +kernel

private theorem pairs_range_join_001_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [183, 252, 302, 378] candidateTuples 0 128 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [183, 252, 302, 378] candidateTuples 0 64 64
    pairs_range_001_000 pairs_range_001_001

private theorem pairs_range_join_001_003_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [183, 252, 302, 378] candidateTuples 192 85 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [183, 252, 302, 378] candidateTuples 192 64 21
    pairs_range_001_003 pairs_range_001_004

private theorem pairs_range_join_001_002_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [183, 252, 302, 378] candidateTuples 128 149 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [183, 252, 302, 378] candidateTuples 128 64 85
    pairs_range_001_002 pairs_range_join_001_003_005

private theorem pairs_range_join_001_000_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [183, 252, 302, 378] candidateTuples 0 277 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [183, 252, 302, 378] candidateTuples 0 128 149
    pairs_range_join_001_000_002 pairs_range_join_001_002_005

private theorem pairs_chunk_001 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [183, 252, 302, 378] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [183, 252, 302, 378] candidateTuples pairs_range_join_001_000_005

private theorem pairs_range_002_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [403, 415, 432, 503] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_002_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [403, 415, 432, 503] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_002_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [403, 415, 432, 503] candidateTuples 128 64 = true := by
  decide +kernel

private theorem pairs_range_002_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [403, 415, 432, 503] candidateTuples 192 64 = true := by
  decide +kernel

private theorem pairs_range_002_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [403, 415, 432, 503] candidateTuples 256 21 = true := by
  decide +kernel

private theorem pairs_range_join_002_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [403, 415, 432, 503] candidateTuples 0 128 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [403, 415, 432, 503] candidateTuples 0 64 64
    pairs_range_002_000 pairs_range_002_001

private theorem pairs_range_join_002_003_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [403, 415, 432, 503] candidateTuples 192 85 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [403, 415, 432, 503] candidateTuples 192 64 21
    pairs_range_002_003 pairs_range_002_004

private theorem pairs_range_join_002_002_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [403, 415, 432, 503] candidateTuples 128 149 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [403, 415, 432, 503] candidateTuples 128 64 85
    pairs_range_002_002 pairs_range_join_002_003_005

private theorem pairs_range_join_002_000_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [403, 415, 432, 503] candidateTuples 0 277 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [403, 415, 432, 503] candidateTuples 0 128 149
    pairs_range_join_002_000_002 pairs_range_join_002_002_005

private theorem pairs_chunk_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [403, 415, 432, 503] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [403, 415, 432, 503] candidateTuples pairs_range_join_002_000_005

private theorem pairs_range_003_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [504, 505, 550, 576] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_003_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [504, 505, 550, 576] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_003_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [504, 505, 550, 576] candidateTuples 128 64 = true := by
  decide +kernel

private theorem pairs_range_003_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [504, 505, 550, 576] candidateTuples 192 64 = true := by
  decide +kernel

private theorem pairs_range_003_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [504, 505, 550, 576] candidateTuples 256 21 = true := by
  decide +kernel

private theorem pairs_range_join_003_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [504, 505, 550, 576] candidateTuples 0 128 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [504, 505, 550, 576] candidateTuples 0 64 64
    pairs_range_003_000 pairs_range_003_001

private theorem pairs_range_join_003_003_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [504, 505, 550, 576] candidateTuples 192 85 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [504, 505, 550, 576] candidateTuples 192 64 21
    pairs_range_003_003 pairs_range_003_004

private theorem pairs_range_join_003_002_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [504, 505, 550, 576] candidateTuples 128 149 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [504, 505, 550, 576] candidateTuples 128 64 85
    pairs_range_003_002 pairs_range_join_003_003_005

private theorem pairs_range_join_003_000_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [504, 505, 550, 576] candidateTuples 0 277 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [504, 505, 550, 576] candidateTuples 0 128 149
    pairs_range_join_003_000_002 pairs_range_join_003_002_005

private theorem pairs_chunk_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [504, 505, 550, 576] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [504, 505, 550, 576] candidateTuples pairs_range_join_003_000_005

private theorem pairs_range_004_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [720, 733, 756, 757] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_004_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [720, 733, 756, 757] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_004_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [720, 733, 756, 757] candidateTuples 128 64 = true := by
  decide +kernel

private theorem pairs_range_004_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [720, 733, 756, 757] candidateTuples 192 64 = true := by
  decide +kernel

private theorem pairs_range_004_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [720, 733, 756, 757] candidateTuples 256 21 = true := by
  decide +kernel

private theorem pairs_range_join_004_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [720, 733, 756, 757] candidateTuples 0 128 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [720, 733, 756, 757] candidateTuples 0 64 64
    pairs_range_004_000 pairs_range_004_001

private theorem pairs_range_join_004_003_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [720, 733, 756, 757] candidateTuples 192 85 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [720, 733, 756, 757] candidateTuples 192 64 21
    pairs_range_004_003 pairs_range_004_004

private theorem pairs_range_join_004_002_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [720, 733, 756, 757] candidateTuples 128 149 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [720, 733, 756, 757] candidateTuples 128 64 85
    pairs_range_004_002 pairs_range_join_004_003_005

private theorem pairs_range_join_004_000_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [720, 733, 756, 757] candidateTuples 0 277 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [720, 733, 756, 757] candidateTuples 0 128 149
    pairs_range_join_004_000_002 pairs_range_join_004_002_005

private theorem pairs_chunk_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [720, 733, 756, 757] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [720, 733, 756, 757] candidateTuples pairs_range_join_004_000_005

private theorem pairs_range_005_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [807, 882, 1005, 1008] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_005_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [807, 882, 1005, 1008] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_005_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [807, 882, 1005, 1008] candidateTuples 128 64 = true := by
  decide +kernel

private theorem pairs_range_005_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [807, 882, 1005, 1008] candidateTuples 192 64 = true := by
  decide +kernel

private theorem pairs_range_005_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [807, 882, 1005, 1008] candidateTuples 256 21 = true := by
  decide +kernel

private theorem pairs_range_join_005_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [807, 882, 1005, 1008] candidateTuples 0 128 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [807, 882, 1005, 1008] candidateTuples 0 64 64
    pairs_range_005_000 pairs_range_005_001

private theorem pairs_range_join_005_003_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [807, 882, 1005, 1008] candidateTuples 192 85 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [807, 882, 1005, 1008] candidateTuples 192 64 21
    pairs_range_005_003 pairs_range_005_004

private theorem pairs_range_join_005_002_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [807, 882, 1005, 1008] candidateTuples 128 149 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [807, 882, 1005, 1008] candidateTuples 128 64 85
    pairs_range_005_002 pairs_range_join_005_003_005

private theorem pairs_range_join_005_000_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [807, 882, 1005, 1008] candidateTuples 0 277 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [807, 882, 1005, 1008] candidateTuples 0 128 149
    pairs_range_join_005_000_002 pairs_range_join_005_002_005

private theorem pairs_chunk_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [807, 882, 1005, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [807, 882, 1005, 1008] candidateTuples pairs_range_join_005_000_005

private theorem pairs_join_001_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [183, 252, 302, 378, 403, 415, 432, 503] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [183, 252, 302, 378] [403, 415, 432, 503] candidateTuples
    pairs_chunk_001 pairs_chunk_002

private theorem pairs_join_000_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [0, 3, 77, 143, 183, 252, 302, 378, 403, 415, 432, 503] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [0, 3, 77, 143] [183, 252, 302, 378, 403, 415, 432, 503] candidateTuples
    pairs_chunk_000 pairs_join_001_003

private theorem pairs_join_004_006 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [720, 733, 756, 757, 807, 882, 1005, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [720, 733, 756, 757] [807, 882, 1005, 1008] candidateTuples
    pairs_chunk_004 pairs_chunk_005

private theorem pairs_join_003_006 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [504, 505, 550, 576, 720, 733, 756, 757, 807, 882, 1005, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [504, 505, 550, 576] [720, 733, 756, 757, 807, 882, 1005, 1008] candidateTuples
    pairs_chunk_003 pairs_join_004_006

private theorem pairs_join_000_006 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) [0, 3, 77, 143, 183, 252, 302, 378, 403, 415, 432, 503, 504, 505, 550, 576, 720, 733, 756, 757, 807, 882, 1005, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66) (23 * boundedMapL 66)
    [0, 3, 77, 143, 183, 252, 302, 378, 403, 415, 432, 503] [504, 505, 550, 576, 720, 733, 756, 757, 807, 882, 1005, 1008] candidateTuples
    pairs_join_000_003 pairs_join_003_006

theorem pairs_checked : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 66)
    (23 * boundedMapL 66) badSlopes candidateTuples = true := by
  exact pairs_join_000_006

theorem sound (x : ℕ) (hx : 0 < x) (hxK : x ≤ (23 * boundedMapL 66))
    (y : ℤ) (hy : y.natAbs ≤ (23 * boundedMapL 66)) (hcop : Nat.gcd x y.natAbs = 1)
    (hnonzero : ∀ i, ((boundedMaps 66) *ᵥ ![(x : ℤ), y]) i ≠ 0)
    (hdistinct : Function.Injective (fun i => (((boundedMaps 66) *ᵥ ![(x : ℤ), y]) i).natAbs))
    (hnot : ¬Loneliness.CriticalFamilies.ContainsCriticalQuadruple
      (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 66) *ᵥ ![(x : ℤ), y])))
    (hlow : Loneliness.value (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 66) *ᵥ ![(x : ℤ), y])) < (1 / 5 : ℝ)) :
    Loneliness.Modular.primitiveDirection ((boundedMaps 66) *ᵥ ![(x : ℤ), y]) ∈ candidateTuples :=
  boundedSlopeScanCheck_candidates 1009 1013
    (treeMask 1009 ScalarTrees.P1009.tree) (treeMask 1013 ScalarTrees.P1013.tree)
    (boundedMaps 66) (23 * boundedMapL 66) badSlopes candidateTuples
    ScalarTrees.P1009.prime (by decide) (by decide +kernel)
    ScalarTrees.P1009.sound ScalarTrees.P1013.sound slopes_checked pairs_checked
    x hx hxK y hy hcop hnonzero hdistinct hnot hlow

end Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M66
