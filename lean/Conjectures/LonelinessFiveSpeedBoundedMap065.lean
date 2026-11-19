import Conjectures.LonelinessFiveSpeedBoundedCheckBlocks
import Conjectures.LonelinessFiveSpeedLineReductionData
import Conjectures.LonelinessFiveSpeedBoundedCandidates
import Conjectures.LonelinessFiveSpeedScalarTreeMask1009
import Conjectures.LonelinessFiveSpeedScalarTreeMask1013

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M65

open Matrix
open scoped Matrix

def badSlopes : List ℕ := [0, 3, 126, 201, 251, 252, 275, 288, 432, 458, 503, 504, 505, 576, 593, 605, 630, 706, 756, 825, 865, 931, 1005, 1008]

theorem slopes_checked : slopeCoverCheck 1009
    (treeMask 1009 ScalarTrees.P1009.tree) (boundedMaps 65) badSlopes = true := by
  decide +kernel

private theorem pairs_range_000_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [0, 3, 126, 201] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_000_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [0, 3, 126, 201] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [0, 3, 126, 201] candidateTuples 128 64 = true := by
  decide +kernel

private theorem pairs_range_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [0, 3, 126, 201] candidateTuples 192 16 = true := by
  decide +kernel

private theorem pairs_range_join_000_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [0, 3, 126, 201] candidateTuples 0 128 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [0, 3, 126, 201] candidateTuples 0 64 64
    pairs_range_000_000 pairs_range_000_001

private theorem pairs_range_join_000_002_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [0, 3, 126, 201] candidateTuples 128 80 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [0, 3, 126, 201] candidateTuples 128 64 16
    pairs_range_000_002 pairs_range_000_003

private theorem pairs_range_join_000_000_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [0, 3, 126, 201] candidateTuples 0 208 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [0, 3, 126, 201] candidateTuples 0 128 80
    pairs_range_join_000_000_002 pairs_range_join_000_002_004

private theorem pairs_chunk_000 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [0, 3, 126, 201] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [0, 3, 126, 201] candidateTuples pairs_range_join_000_000_004

private theorem pairs_range_001_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [251, 252, 275, 288] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_001_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [251, 252, 275, 288] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_001_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [251, 252, 275, 288] candidateTuples 128 64 = true := by
  decide +kernel

private theorem pairs_range_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [251, 252, 275, 288] candidateTuples 192 16 = true := by
  decide +kernel

private theorem pairs_range_join_001_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [251, 252, 275, 288] candidateTuples 0 128 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [251, 252, 275, 288] candidateTuples 0 64 64
    pairs_range_001_000 pairs_range_001_001

private theorem pairs_range_join_001_002_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [251, 252, 275, 288] candidateTuples 128 80 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [251, 252, 275, 288] candidateTuples 128 64 16
    pairs_range_001_002 pairs_range_001_003

private theorem pairs_range_join_001_000_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [251, 252, 275, 288] candidateTuples 0 208 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [251, 252, 275, 288] candidateTuples 0 128 80
    pairs_range_join_001_000_002 pairs_range_join_001_002_004

private theorem pairs_chunk_001 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [251, 252, 275, 288] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [251, 252, 275, 288] candidateTuples pairs_range_join_001_000_004

private theorem pairs_range_002_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [432, 458, 503, 504] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_002_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [432, 458, 503, 504] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_002_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [432, 458, 503, 504] candidateTuples 128 64 = true := by
  decide +kernel

private theorem pairs_range_002_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [432, 458, 503, 504] candidateTuples 192 16 = true := by
  decide +kernel

private theorem pairs_range_join_002_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [432, 458, 503, 504] candidateTuples 0 128 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [432, 458, 503, 504] candidateTuples 0 64 64
    pairs_range_002_000 pairs_range_002_001

private theorem pairs_range_join_002_002_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [432, 458, 503, 504] candidateTuples 128 80 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [432, 458, 503, 504] candidateTuples 128 64 16
    pairs_range_002_002 pairs_range_002_003

private theorem pairs_range_join_002_000_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [432, 458, 503, 504] candidateTuples 0 208 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [432, 458, 503, 504] candidateTuples 0 128 80
    pairs_range_join_002_000_002 pairs_range_join_002_002_004

private theorem pairs_chunk_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [432, 458, 503, 504] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [432, 458, 503, 504] candidateTuples pairs_range_join_002_000_004

private theorem pairs_range_003_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [505, 576, 593, 605] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_003_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [505, 576, 593, 605] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_003_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [505, 576, 593, 605] candidateTuples 128 64 = true := by
  decide +kernel

private theorem pairs_range_003_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [505, 576, 593, 605] candidateTuples 192 16 = true := by
  decide +kernel

private theorem pairs_range_join_003_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [505, 576, 593, 605] candidateTuples 0 128 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [505, 576, 593, 605] candidateTuples 0 64 64
    pairs_range_003_000 pairs_range_003_001

private theorem pairs_range_join_003_002_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [505, 576, 593, 605] candidateTuples 128 80 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [505, 576, 593, 605] candidateTuples 128 64 16
    pairs_range_003_002 pairs_range_003_003

private theorem pairs_range_join_003_000_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [505, 576, 593, 605] candidateTuples 0 208 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [505, 576, 593, 605] candidateTuples 0 128 80
    pairs_range_join_003_000_002 pairs_range_join_003_002_004

private theorem pairs_chunk_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [505, 576, 593, 605] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [505, 576, 593, 605] candidateTuples pairs_range_join_003_000_004

private theorem pairs_range_004_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [630, 706, 756, 825] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_004_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [630, 706, 756, 825] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_004_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [630, 706, 756, 825] candidateTuples 128 64 = true := by
  decide +kernel

private theorem pairs_range_004_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [630, 706, 756, 825] candidateTuples 192 16 = true := by
  decide +kernel

private theorem pairs_range_join_004_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [630, 706, 756, 825] candidateTuples 0 128 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [630, 706, 756, 825] candidateTuples 0 64 64
    pairs_range_004_000 pairs_range_004_001

private theorem pairs_range_join_004_002_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [630, 706, 756, 825] candidateTuples 128 80 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [630, 706, 756, 825] candidateTuples 128 64 16
    pairs_range_004_002 pairs_range_004_003

private theorem pairs_range_join_004_000_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [630, 706, 756, 825] candidateTuples 0 208 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [630, 706, 756, 825] candidateTuples 0 128 80
    pairs_range_join_004_000_002 pairs_range_join_004_002_004

private theorem pairs_chunk_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [630, 706, 756, 825] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [630, 706, 756, 825] candidateTuples pairs_range_join_004_000_004

private theorem pairs_range_005_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [865, 931, 1005, 1008] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_005_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [865, 931, 1005, 1008] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_005_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [865, 931, 1005, 1008] candidateTuples 128 64 = true := by
  decide +kernel

private theorem pairs_range_005_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [865, 931, 1005, 1008] candidateTuples 192 16 = true := by
  decide +kernel

private theorem pairs_range_join_005_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [865, 931, 1005, 1008] candidateTuples 0 128 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [865, 931, 1005, 1008] candidateTuples 0 64 64
    pairs_range_005_000 pairs_range_005_001

private theorem pairs_range_join_005_002_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [865, 931, 1005, 1008] candidateTuples 128 80 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [865, 931, 1005, 1008] candidateTuples 128 64 16
    pairs_range_005_002 pairs_range_005_003

private theorem pairs_range_join_005_000_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [865, 931, 1005, 1008] candidateTuples 0 208 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [865, 931, 1005, 1008] candidateTuples 0 128 80
    pairs_range_join_005_000_002 pairs_range_join_005_002_004

private theorem pairs_chunk_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [865, 931, 1005, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [865, 931, 1005, 1008] candidateTuples pairs_range_join_005_000_004

private theorem pairs_join_001_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [251, 252, 275, 288, 432, 458, 503, 504] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [251, 252, 275, 288] [432, 458, 503, 504] candidateTuples
    pairs_chunk_001 pairs_chunk_002

private theorem pairs_join_000_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [0, 3, 126, 201, 251, 252, 275, 288, 432, 458, 503, 504] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [0, 3, 126, 201] [251, 252, 275, 288, 432, 458, 503, 504] candidateTuples
    pairs_chunk_000 pairs_join_001_003

private theorem pairs_join_004_006 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [630, 706, 756, 825, 865, 931, 1005, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [630, 706, 756, 825] [865, 931, 1005, 1008] candidateTuples
    pairs_chunk_004 pairs_chunk_005

private theorem pairs_join_003_006 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [505, 576, 593, 605, 630, 706, 756, 825, 865, 931, 1005, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [505, 576, 593, 605] [630, 706, 756, 825, 865, 931, 1005, 1008] candidateTuples
    pairs_chunk_003 pairs_join_004_006

private theorem pairs_join_000_006 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) [0, 3, 126, 201, 251, 252, 275, 288, 432, 458, 503, 504, 505, 576, 593, 605, 630, 706, 756, 825, 865, 931, 1005, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65) (23 * boundedMapL 65)
    [0, 3, 126, 201, 251, 252, 275, 288, 432, 458, 503, 504] [505, 576, 593, 605, 630, 706, 756, 825, 865, 931, 1005, 1008] candidateTuples
    pairs_join_000_003 pairs_join_003_006

theorem pairs_checked : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 65)
    (23 * boundedMapL 65) badSlopes candidateTuples = true := by
  exact pairs_join_000_006

theorem sound (x : ℕ) (hx : 0 < x) (hxK : x ≤ (23 * boundedMapL 65))
    (y : ℤ) (hy : y.natAbs ≤ (23 * boundedMapL 65)) (hcop : Nat.gcd x y.natAbs = 1)
    (hnonzero : ∀ i, ((boundedMaps 65) *ᵥ ![(x : ℤ), y]) i ≠ 0)
    (hdistinct : Function.Injective (fun i => (((boundedMaps 65) *ᵥ ![(x : ℤ), y]) i).natAbs))
    (hnot : ¬Loneliness.CriticalFamilies.ContainsCriticalQuadruple
      (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 65) *ᵥ ![(x : ℤ), y])))
    (hlow : Loneliness.value (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 65) *ᵥ ![(x : ℤ), y])) < (1 / 5 : ℝ)) :
    Loneliness.Modular.primitiveDirection ((boundedMaps 65) *ᵥ ![(x : ℤ), y]) ∈ candidateTuples :=
  boundedSlopeScanCheck_candidates 1009 1013
    (treeMask 1009 ScalarTrees.P1009.tree) (treeMask 1013 ScalarTrees.P1013.tree)
    (boundedMaps 65) (23 * boundedMapL 65) badSlopes candidateTuples
    ScalarTrees.P1009.prime (by decide) (by decide +kernel)
    ScalarTrees.P1009.sound ScalarTrees.P1013.sound slopes_checked pairs_checked
    x hx hxK y hy hcop hnonzero hdistinct hnot hlow

end Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M65
