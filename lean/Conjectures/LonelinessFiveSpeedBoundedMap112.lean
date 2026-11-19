import Conjectures.LonelinessFiveSpeedBoundedCheckBlocks
import Conjectures.LonelinessFiveSpeedLineReductionData
import Conjectures.LonelinessFiveSpeedBoundedCandidates
import Conjectures.LonelinessFiveSpeedScalarTreeMask1009
import Conjectures.LonelinessFiveSpeedScalarTreeMask1013

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M112

open Matrix
open scoped Matrix

def badSlopes : List ℕ := [0, 1, 2, 3, 126, 202, 252, 253, 335, 336, 337, 403, 606, 672, 673, 674, 756, 757, 807, 883, 1006, 1007, 1008]

theorem slopes_checked : slopeCoverCheck 1009
    (treeMask 1009 ScalarTrees.P1009.tree) (boundedMaps 112) badSlopes = true := by
  decide +kernel

private theorem pairs_chunk_000 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 112)
    (23 * boundedMapL 112) [0, 1, 2, 3] candidateTuples = true := by
  decide +kernel

private theorem pairs_chunk_001 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 112)
    (23 * boundedMapL 112) [126, 202, 252, 253] candidateTuples = true := by
  decide +kernel

private theorem pairs_chunk_002 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 112)
    (23 * boundedMapL 112) [335, 336, 337, 403] candidateTuples = true := by
  decide +kernel

private theorem pairs_chunk_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 112)
    (23 * boundedMapL 112) [606, 672, 673, 674] candidateTuples = true := by
  decide +kernel

private theorem pairs_chunk_004 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 112)
    (23 * boundedMapL 112) [756, 757, 807, 883] candidateTuples = true := by
  decide +kernel

private theorem pairs_chunk_005 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 112)
    (23 * boundedMapL 112) [1006, 1007, 1008] candidateTuples = true := by
  decide +kernel

private theorem pairs_join_001_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 112)
    (23 * boundedMapL 112) [126, 202, 252, 253, 335, 336, 337, 403] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 112) (23 * boundedMapL 112)
    [126, 202, 252, 253] [335, 336, 337, 403] candidateTuples
    pairs_chunk_001 pairs_chunk_002

private theorem pairs_join_000_003 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 112)
    (23 * boundedMapL 112) [0, 1, 2, 3, 126, 202, 252, 253, 335, 336, 337, 403] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 112) (23 * boundedMapL 112)
    [0, 1, 2, 3] [126, 202, 252, 253, 335, 336, 337, 403] candidateTuples
    pairs_chunk_000 pairs_join_001_003

private theorem pairs_join_004_006 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 112)
    (23 * boundedMapL 112) [756, 757, 807, 883, 1006, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 112) (23 * boundedMapL 112)
    [756, 757, 807, 883] [1006, 1007, 1008] candidateTuples
    pairs_chunk_004 pairs_chunk_005

private theorem pairs_join_003_006 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 112)
    (23 * boundedMapL 112) [606, 672, 673, 674, 756, 757, 807, 883, 1006, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 112) (23 * boundedMapL 112)
    [606, 672, 673, 674] [756, 757, 807, 883, 1006, 1007, 1008] candidateTuples
    pairs_chunk_003 pairs_join_004_006

private theorem pairs_join_000_006 : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 112)
    (23 * boundedMapL 112) [0, 1, 2, 3, 126, 202, 252, 253, 335, 336, 337, 403, 606, 672, 673, 674, 756, 757, 807, 883, 1006, 1007, 1008] candidateTuples = true :=
  boundedSlopeScanCheck_append_true 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 112) (23 * boundedMapL 112)
    [0, 1, 2, 3, 126, 202, 252, 253, 335, 336, 337, 403] [606, 672, 673, 674, 756, 757, 807, 883, 1006, 1007, 1008] candidateTuples
    pairs_join_000_003 pairs_join_003_006

theorem pairs_checked : boundedSlopeScanCheck 1009 1013
    (treeMask 1013 ScalarTrees.P1013.tree) (boundedMaps 112)
    (23 * boundedMapL 112) badSlopes candidateTuples = true := by
  exact pairs_join_000_006

theorem sound (x : ℕ) (hx : 0 < x) (hxK : x ≤ (23 * boundedMapL 112))
    (y : ℤ) (hy : y.natAbs ≤ (23 * boundedMapL 112)) (hcop : Nat.gcd x y.natAbs = 1)
    (hnonzero : ∀ i, ((boundedMaps 112) *ᵥ ![(x : ℤ), y]) i ≠ 0)
    (hdistinct : Function.Injective (fun i => (((boundedMaps 112) *ᵥ ![(x : ℤ), y]) i).natAbs))
    (hnot : ¬Loneliness.CriticalFamilies.ContainsCriticalQuadruple
      (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 112) *ᵥ ![(x : ℤ), y])))
    (hlow : Loneliness.value (Loneliness.CoordinateSubspace.integerSpeeds ((boundedMaps 112) *ᵥ ![(x : ℤ), y])) < (1 / 5 : ℝ)) :
    Loneliness.Modular.primitiveDirection ((boundedMaps 112) *ᵥ ![(x : ℤ), y]) ∈ candidateTuples :=
  boundedSlopeScanCheck_candidates 1009 1013
    (treeMask 1009 ScalarTrees.P1009.tree) (treeMask 1013 ScalarTrees.P1013.tree)
    (boundedMaps 112) (23 * boundedMapL 112) badSlopes candidateTuples
    ScalarTrees.P1009.prime (by decide) (by decide +kernel)
    ScalarTrees.P1009.sound ScalarTrees.P1013.sound slopes_checked pairs_checked
    x hx hxK y hy hcop hnonzero hdistinct hnot hlow

end Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M112
