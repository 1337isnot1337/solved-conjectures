import Conjectures.LonelinessFiveSpeedBoundedCheckBlocks
import Conjectures.LonelinessFiveSpeedLineReductionData
import Conjectures.LonelinessFiveSpeedBoundedCandidates
import Conjectures.LonelinessFiveSpeedScalarTreeMask1009
import Conjectures.LonelinessFiveSpeedScalarTreeMask1013

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M18

open Matrix
open scoped Matrix

def badSlopes : List ℕ := [0, 183, 252, 432, 504, 560, 576, 593, 605, 672, 698, 756, 859, 874, 1007]

theorem slopes_checked : slopeCoverCheck 1009
    (treeMask 1009 ScalarTrees.P1009.tree) (boundedMaps 18) badSlopes = true := by
  decide +kernel

private theorem pairs_range_000_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [0, 183, 252, 432] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_000_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [0, 183, 252, 432] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [0, 183, 252, 432] candidateTuples 128 64 = true := by
  decide +kernel

private theorem pairs_range_000_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [0, 183, 252, 432] candidateTuples 192 64 = true := by
  decide +kernel

private theorem pairs_range_000_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [0, 183, 252, 432] candidateTuples 256 21 = true := by
  decide +kernel

private theorem pairs_range_join_000_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [0, 183, 252, 432] candidateTuples 0 128 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18) (23 * boundedMapL 18)
    [0, 183, 252, 432] candidateTuples 0 64 64
    pairs_range_000_000 pairs_range_000_001

private theorem pairs_range_join_000_003_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [0, 183, 252, 432] candidateTuples 192 85 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18) (23 * boundedMapL 18)
    [0, 183, 252, 432] candidateTuples 192 64 21
    pairs_range_000_003 pairs_range_000_004

private theorem pairs_range_join_000_002_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [0, 183, 252, 432] candidateTuples 128 149 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18) (23 * boundedMapL 18)
    [0, 183, 252, 432] candidateTuples 128 64 85
    pairs_range_000_002 pairs_range_join_000_003_005

private theorem pairs_range_join_000_000_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [0, 183, 252, 432] candidateTuples 0 277 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18) (23 * boundedMapL 18)
    [0, 183, 252, 432] candidateTuples 0 128 149
    pairs_range_join_000_000_002 pairs_range_join_000_002_005

private theorem pairs_chunk_000 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [0, 183, 252, 432] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18) (23 * boundedMapL 18)
    [0, 183, 252, 432] candidateTuples pairs_range_join_000_000_005

private theorem pairs_range_001_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [504, 560, 576, 593] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_001_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [504, 560, 576, 593] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_001_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [504, 560, 576, 593] candidateTuples 128 64 = true := by
  decide +kernel

private theorem pairs_range_001_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [504, 560, 576, 593] candidateTuples 192 64 = true := by
  decide +kernel

private theorem pairs_range_001_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [504, 560, 576, 593] candidateTuples 256 21 = true := by
  decide +kernel

private theorem pairs_range_join_001_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [504, 560, 576, 593] candidateTuples 0 128 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18) (23 * boundedMapL 18)
    [504, 560, 576, 593] candidateTuples 0 64 64
    pairs_range_001_000 pairs_range_001_001

private theorem pairs_range_join_001_003_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [504, 560, 576, 593] candidateTuples 192 85 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18) (23 * boundedMapL 18)
    [504, 560, 576, 593] candidateTuples 192 64 21
    pairs_range_001_003 pairs_range_001_004

private theorem pairs_range_join_001_002_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [504, 560, 576, 593] candidateTuples 128 149 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18) (23 * boundedMapL 18)
    [504, 560, 576, 593] candidateTuples 128 64 85
    pairs_range_001_002 pairs_range_join_001_003_005

private theorem pairs_range_join_001_000_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [504, 560, 576, 593] candidateTuples 0 277 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18) (23 * boundedMapL 18)
    [504, 560, 576, 593] candidateTuples 0 128 149
    pairs_range_join_001_000_002 pairs_range_join_001_002_005

private theorem pairs_chunk_001 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [504, 560, 576, 593] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18) (23 * boundedMapL 18)
    [504, 560, 576, 593] candidateTuples pairs_range_join_001_000_005

private theorem pairs_range_002_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [605, 672, 698, 756] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_002_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [605, 672, 698, 756] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_002_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [605, 672, 698, 756] candidateTuples 128 64 = true := by
  decide +kernel

private theorem pairs_range_002_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [605, 672, 698, 756] candidateTuples 192 64 = true := by
  decide +kernel

private theorem pairs_range_002_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [605, 672, 698, 756] candidateTuples 256 21 = true := by
  decide +kernel

private theorem pairs_range_join_002_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [605, 672, 698, 756] candidateTuples 0 128 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18) (23 * boundedMapL 18)
    [605, 672, 698, 756] candidateTuples 0 64 64
    pairs_range_002_000 pairs_range_002_001

private theorem pairs_range_join_002_003_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [605, 672, 698, 756] candidateTuples 192 85 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18) (23 * boundedMapL 18)
    [605, 672, 698, 756] candidateTuples 192 64 21
    pairs_range_002_003 pairs_range_002_004

private theorem pairs_range_join_002_002_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [605, 672, 698, 756] candidateTuples 128 149 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18) (23 * boundedMapL 18)
    [605, 672, 698, 756] candidateTuples 128 64 85
    pairs_range_002_002 pairs_range_join_002_003_005

private theorem pairs_range_join_002_000_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [605, 672, 698, 756] candidateTuples 0 277 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18) (23 * boundedMapL 18)
    [605, 672, 698, 756] candidateTuples 0 128 149
    pairs_range_join_002_000_002 pairs_range_join_002_002_005

private theorem pairs_chunk_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [605, 672, 698, 756] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18) (23 * boundedMapL 18)
    [605, 672, 698, 756] candidateTuples pairs_range_join_002_000_005

private theorem pairs_range_003_000 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [859, 874, 1007] candidateTuples 0 64 = true := by
  decide +kernel

private theorem pairs_range_003_001 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [859, 874, 1007] candidateTuples 64 64 = true := by
  decide +kernel

private theorem pairs_range_003_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [859, 874, 1007] candidateTuples 128 64 = true := by
  decide +kernel

private theorem pairs_range_003_003 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [859, 874, 1007] candidateTuples 192 64 = true := by
  decide +kernel

private theorem pairs_range_003_004 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [859, 874, 1007] candidateTuples 256 21 = true := by
  decide +kernel

private theorem pairs_range_join_003_000_002 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [859, 874, 1007] candidateTuples 0 128 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18) (23 * boundedMapL 18)
    [859, 874, 1007] candidateTuples 0 64 64
    pairs_range_003_000 pairs_range_003_001

private theorem pairs_range_join_003_003_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [859, 874, 1007] candidateTuples 192 85 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18) (23 * boundedMapL 18)
    [859, 874, 1007] candidateTuples 192 64 21
    pairs_range_003_003 pairs_range_003_004

private theorem pairs_range_join_003_002_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [859, 874, 1007] candidateTuples 128 149 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18) (23 * boundedMapL 18)
    [859, 874, 1007] candidateTuples 128 64 85
    pairs_range_003_002 pairs_range_join_003_003_005

private theorem pairs_range_join_003_000_005 : boundedSlopeRangeCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [859, 874, 1007] candidateTuples 0 277 = true :=
  boundedSlopeRangeCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18) (23 * boundedMapL 18)
    [859, 874, 1007] candidateTuples 0 128 149
    pairs_range_join_003_000_002 pairs_range_join_003_002_005

private theorem pairs_chunk_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [859, 874, 1007] candidateTuples = true :=
  boundedSlopeScanCheck_of_full_range 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18) (23 * boundedMapL 18)
    [859, 874, 1007] candidateTuples pairs_range_join_003_000_005

private theorem pairs_join_000_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [0, 183, 252, 432, 504, 560, 576, 593] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18) (23 * boundedMapL 18)
    [0, 183, 252, 432] [504, 560, 576, 593] candidateTuples
    pairs_chunk_000 pairs_chunk_001

private theorem pairs_join_002_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [605, 672, 698, 756, 859, 874, 1007] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18) (23 * boundedMapL 18)
    [605, 672, 698, 756] [859, 874, 1007] candidateTuples
    pairs_chunk_002 pairs_chunk_003

private theorem pairs_join_000_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) [0, 183, 252, 432, 504, 560, 576, 593, 605, 672, 698, 756, 859, 874, 1007] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18) (23 * boundedMapL 18)
    [0, 183, 252, 432, 504, 560, 576, 593] [605, 672, 698, 756, 859, 874, 1007] candidateTuples
    pairs_join_000_002 pairs_join_002_004

theorem pairs_checked : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 18)
    (23 * boundedMapL 18) badSlopes candidateTuples = true := by
  exact pairs_join_000_004

theorem sound (x : ℕ) (hx : 0 < x) (hxK : x ≤ (23 * boundedMapL 18))
    (y : ℤ) (hy : y.natAbs ≤ (23 * boundedMapL 18)) (hcop : Nat.gcd x y.natAbs = 1)
    (hnonzero : ∀ i, ((boundedMaps 18) *ᵥ ![(x : ℤ), y]) i ≠ 0)
    (hdistinct : Function.Injective (fun i => (((boundedMaps 18) *ᵥ ![(x : ℤ), y]) i).natAbs))
    (hnot : ¬Loneliness.CriticalFamilies.ContainsCriticalQuadruple
      (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 18) *ᵥ ![(x : ℤ), y])))
    (hlow : Loneliness.value (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 18) *ᵥ ![(x : ℤ), y])) < (1 / 5 : ℝ)) :
    Loneliness.Modular.primitiveDirection ((boundedMaps 18) *ᵥ ![(x : ℤ), y]) ∈ candidateTuples :=
  boundedSlopeScanCheck_candidates 1009 1013
    (treeMask 1009 ScalarTrees.P1009.tree) (treeMask 1013 ScalarTrees.P1013.tree)
    (boundedMaps 18) (23 * boundedMapL 18) badSlopes candidateTuples
    ScalarTrees.P1009.prime (by decide) (by decide +kernel)
    ScalarTrees.P1009.sound ScalarTrees.P1013.sound slopes_checked pairs_checked
    x hx hxK y hy hcop hnonzero hdistinct hnot hlow

end Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M18
