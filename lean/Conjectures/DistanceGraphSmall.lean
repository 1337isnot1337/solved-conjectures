import Conjectures.LonelinessPairBridge

/-! Exact real-time character values for the twenty small cases in the note
and the additional gap-seven parameter k=12 used by the analytic proof.
Every finite upper and lower certificate is reduced by Lean's kernel. -/
namespace DistanceGraph.Small

set_option maxRecDepth 20000
set_option maxHeartbeats 0

theorem gap5_k2 : Loneliness.value [1,2,7] = (1 : ℝ)/3 := by
  simpa only [Nat.cast_one, Nat.cast_ofNat] using Loneliness.certified_pair_value
    [1,2,7] (by decide) (by decide) (by decide)
    1 3 1 3 (by decide) (by decide) (by decide) (by decide)

theorem gap5_k3 : Loneliness.value [1,3,8] = (4 : ℝ)/11 := by
  simpa only [Nat.cast_one, Nat.cast_ofNat] using Loneliness.certified_pair_value
    [1,3,8] (by decide) (by decide) (by decide)
    4 11 5 11 (by decide) (by decide) (by decide) (by decide)

theorem gap5_k4 : Loneliness.value [1,4,9] = (2 : ℝ)/5 := by
  simpa only [Nat.cast_one, Nat.cast_ofNat] using Loneliness.certified_pair_value
    [1,4,9] (by decide) (by decide) (by decide)
    2 5 2 5 (by decide) (by decide) (by decide) (by decide)

theorem gap5_k5 : Loneliness.value [1,5,10] = (1 : ℝ)/3 := by
  simpa only [Nat.cast_one, Nat.cast_ofNat] using Loneliness.certified_pair_value
    [1,5,10] (by decide) (by decide) (by decide)
    1 3 2 6 (by decide) (by decide) (by decide) (by decide)

theorem gap5_k7 : Loneliness.value [1,7,12] = (3 : ℝ)/8 := by
  simpa only [Nat.cast_one, Nat.cast_ofNat] using Loneliness.certified_pair_value
    [1,7,12] (by decide) (by decide) (by decide)
    3 8 3 8 (by decide) (by decide) (by decide) (by decide)

theorem gap5_k12 : Loneliness.value [1,12,17] = (5 : ℝ)/13 := by
  simpa only [Nat.cast_one, Nat.cast_ofNat] using Loneliness.certified_pair_value
    [1,12,17] (by decide) (by decide) (by decide)
    5 13 5 13 (by decide) (by decide) (by decide) (by decide)

theorem gap7_k2 : Loneliness.value [1,2,9] = (3 : ℝ)/10 := by
  simpa only [Nat.cast_one, Nat.cast_ofNat] using Loneliness.certified_pair_value
    [1,2,9] (by decide) (by decide) (by decide)
    3 10 3 10 (by decide) (by decide) (by decide) (by decide)

theorem gap7_k3 : Loneliness.value [1,3,10] = (5 : ℝ)/13 := by
  simpa only [Nat.cast_one, Nat.cast_ofNat] using Loneliness.certified_pair_value
    [1,3,10] (by decide) (by decide) (by decide)
    5 13 6 13 (by decide) (by decide) (by decide) (by decide)

theorem gap7_k4 : Loneliness.value [1,4,11] = (2 : ℝ)/5 := by
  simpa only [Nat.cast_one, Nat.cast_ofNat] using Loneliness.certified_pair_value
    [1,4,11] (by decide) (by decide) (by decide)
    2 5 2 5 (by decide) (by decide) (by decide) (by decide)

theorem gap7_k5 : Loneliness.value [1,5,12] = (6 : ℝ)/17 := by
  simpa only [Nat.cast_one, Nat.cast_ofNat] using Loneliness.certified_pair_value
    [1,5,12] (by decide) (by decide) (by decide)
    6 17 8 17 (by decide) (by decide) (by decide) (by decide)

theorem gap7_k6 : Loneliness.value [1,6,13] = (3 : ℝ)/7 := by
  simpa only [Nat.cast_one, Nat.cast_ofNat] using Loneliness.certified_pair_value
    [1,6,13] (by decide) (by decide) (by decide)
    3 7 3 7 (by decide) (by decide) (by decide) (by decide)

theorem gap7_k7 : Loneliness.value [1,7,14] = (1 : ℝ)/3 := by
  simpa only [Nat.cast_one, Nat.cast_ofNat] using Loneliness.certified_pair_value
    [1,7,14] (by decide) (by decide) (by decide)
    1 3 5 15 (by decide) (by decide) (by decide) (by decide)

theorem gap7_k9 : Loneliness.value [1,9,16] = (2 : ℝ)/5 := by
  simpa only [Nat.cast_one, Nat.cast_ofNat] using Loneliness.certified_pair_value
    [1,9,16] (by decide) (by decide) (by decide)
    2 5 4 10 (by decide) (by decide) (by decide) (by decide)

theorem gap7_k11 : Loneliness.value [1,11,18] = (5 : ℝ)/12 := by
  simpa only [Nat.cast_one, Nat.cast_ofNat] using Loneliness.certified_pair_value
    [1,11,18] (by decide) (by decide) (by decide)
    5 12 5 12 (by decide) (by decide) (by decide) (by decide)

theorem gap7_k14 : Loneliness.value [1,14,21] = (2 : ℝ)/5 := by
  simpa only [Nat.cast_one, Nat.cast_ofNat] using Loneliness.certified_pair_value
    [1,14,21] (by decide) (by decide) (by decide)
    2 5 6 15 (by decide) (by decide) (by decide) (by decide)

theorem gap7_k16 : Loneliness.value [1,16,23] = (7 : ℝ)/17 := by
  simpa only [Nat.cast_one, Nat.cast_ofNat] using Loneliness.certified_pair_value
    [1,16,23] (by decide) (by decide) (by decide)
    7 17 7 17 (by decide) (by decide) (by decide) (by decide)

theorem gap7_k18 : Loneliness.value [1,18,25] = (8 : ℝ)/19 := by
  simpa only [Nat.cast_one, Nat.cast_ofNat] using Loneliness.certified_pair_value
    [1,18,25] (by decide) (by decide) (by decide)
    8 19 8 19 (by decide) (by decide) (by decide) (by decide)

theorem gap7_k23 : Loneliness.value [1,23,30] = (5 : ℝ)/12 := by
  simpa only [Nat.cast_one, Nat.cast_ofNat] using Loneliness.certified_pair_value
    [1,23,30] (by decide) (by decide) (by decide)
    5 12 10 24 (by decide) (by decide) (by decide) (by decide)

theorem gap7_k25 : Loneliness.value [1,25,32] = (11 : ℝ)/26 := by
  simpa only [Nat.cast_one, Nat.cast_ofNat] using Loneliness.certified_pair_value
    [1,25,32] (by decide) (by decide) (by decide)
    11 26 11 26 (by decide) (by decide) (by decide) (by decide)

theorem gap7_k32 : Loneliness.value [1,32,39] = (14 : ℝ)/33 := by
  simpa only [Nat.cast_one, Nat.cast_ofNat] using Loneliness.certified_pair_value
    [1,32,39] (by decide) (by decide) (by decide)
    14 33 14 33 (by decide) (by decide) (by decide) (by decide)

theorem gap7_k12 : Loneliness.value [1,12,19] = (13 : ℝ)/31 := by
  simpa only [Nat.cast_one, Nat.cast_ofNat] using Loneliness.certified_pair_value
    [1,12,19] (by decide) (by decide) (by decide)
    13 31 14 31 (by decide) (by decide) (by decide) (by decide)

end DistanceGraph.Small

