module

public import Conjectures.FranklSmallCyclicOrbitArithmetic

/-! Generated arithmetic block for period 10. Distinct representative IDs
and original candidate rows are recorded in the companion input manifest.
Orbit packet SHA256: a361100bee79d5e087d091ce4f4b95c51992c6527edc8a8d9d98e62e1bb44416
-/
@[expose] public section

namespace FranklSmallCyclic.OrbitBatches.P10.B003.Data

def representativeIds : List ℕ := [9640, 9641, 9642, 9643, 9644, 9645, 9646, 9647, 9648, 9649, 9650, 9651, 9652, 9653, 9654, 9655, 9656, 9657, 9658, 9659, 9660, 9661, 9662, 9663, 9664, 9665, 9666, 9667, 9668, 9669, 9670, 9671, 9672, 9673, 9674, 9675, 9676, 9677, 9678, 9679, 9680, 9681, 9682, 9683, 9684, 9685, 9686, 9687, 9688, 9689, 9690, 9691, 9692, 9693, 9694, 9695, 9696, 9697, 9698, 9699, 9700, 9701, 9702, 9703]

def sourceRows : List ℕ := [7613, 7611, 7606, 7527, 7609, 6091, 4697, 3346, 6085, 4691, 2826, 2992, 3065, 2877, 2827, 2993, 3066, 2878, 2473, 2503, 3036, 2852, 2491, 6312, 6190, 4982, 4827, 5305, 6313, 6191, 4983, 4828, 5306, 6271, 6132, 6105, 4908, 4738, 4711, 2481, 2477, 3965, 3857, 3153, 2571, 2449, 2553, 4064, 3101, 3699, 2519, 3026, 4051, 3093, 3686, 2511, 3018, 4140, 5461, 6506, 6548, 5497, 5176, 5218]

def chunk0 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9640; original row 7613.
    { word := [10, 2, 0, 9, 8, 10, 10], weights := [1, 1, 0, 1] },
    -- Representative 9641; original row 7611.
    { word := [10, 2, 0, 9, 8, 9, 12], weights := [1, 1, 0, 1] }
  ]

def chunk1 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9642; original row 7606.
    { word := [10, 2, 0, 9, 8, 2, 10], weights := [1, 1, 0, 1] },
    -- Representative 9643; original row 7527.
    { word := [10, 0, 9, 8, 1, 4, 10], weights := [1, 0, 1, 1] }
  ]

def chunk2 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9644; original row 7609.
    { word := [10, 2, 0, 9, 8, 8, 12], weights := [1, 1, 0, 1] },
    -- Representative 9645; original row 6091.
    { word := [8, 10, 0, 8, 9, 4, 12], weights := [0, 2, 1, 1] }
  ]

def chunk3 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9646; original row 4697.
    { word := [8, 2, 0, 8, 9, 4, 12], weights := [0, 2, 1, 1] },
    -- Representative 9647; original row 3346.
    { word := [2, 10, 8, 12, 8, 4, 10], weights := [2, 1, 2, 1] }
  ]

def chunk4 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9648; original row 6085.
    { word := [8, 10, 0, 8, 1, 4, 10], weights := [0, 2, 1, 1] },
    -- Representative 9649; original row 4691.
    { word := [8, 2, 0, 8, 1, 4, 10], weights := [0, 2, 1, 1] }
  ]

def chunk5 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9650; original row 2826.
    { word := [2, 8, 0, 4, 8, 4, 10], weights := [1, 0, 1, 0] },
    -- Representative 9651; original row 2992.
    { word := [2, 8, 8, 4, 8, 4, 10], weights := [1, 0, 1, 0] }
  ]

def chunk6 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9652; original row 3065.
    { word := [2, 8, 8, 12, 8, 4, 10], weights := [1, 0, 1, 0] },
    -- Representative 9653; original row 2877.
    { word := [2, 8, 0, 12, 8, 4, 10], weights := [1, 0, 1, 0] }
  ]

def chunk7 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9654; original row 2827.
    { word := [2, 8, 0, 4, 8, 4, 12], weights := [1, 0, 0, 1] },
    -- Representative 9655; original row 2993.
    { word := [2, 8, 8, 4, 8, 4, 12], weights := [1, 0, 0, 1] }
  ]

def chunk8 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9656; original row 3066.
    { word := [2, 8, 8, 12, 8, 4, 12], weights := [1, 0, 1, 0] },
    -- Representative 9657; original row 2878.
    { word := [2, 8, 0, 12, 8, 4, 12], weights := [1, 0, 1, 0] }
  ]

def chunk9 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9658; original row 2473.
    { word := [2, 0, 8, 4, 8, 4, 12], weights := [1, 0, 0, 1] },
    -- Representative 9659; original row 2503.
    { word := [2, 0, 8, 12, 8, 4, 12], weights := [1, 0, 1, 0] }
  ]

def chunk10 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9660; original row 3036.
    { word := [2, 8, 8, 12, 0, 4, 10], weights := [1, 0, 1, 0] },
    -- Representative 9661; original row 2852.
    { word := [2, 8, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }
  ]

def chunk11 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9662; original row 2491.
    { word := [2, 0, 8, 12, 0, 4, 10], weights := [1, 0, 1, 0] },
    -- Representative 9663; original row 6312.
    { word := [8, 10, 10, 10, 8, 4, 10], weights := [1, 1, 1, 1] }
  ]

def chunk12 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9664; original row 6190.
    { word := [8, 10, 2, 10, 8, 4, 10], weights := [1, 1, 1, 1] },
    -- Representative 9665; original row 4982.
    { word := [8, 2, 10, 10, 8, 4, 10], weights := [1, 1, 1, 1] }
  ]

def chunk13 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9666; original row 4827.
    { word := [8, 2, 2, 10, 8, 4, 10], weights := [1, 1, 1, 1] },
    -- Representative 9667; original row 5305.
    { word := [8, 6, 8, 12, 8, 4, 10], weights := [1, 1, 1, 1] }
  ]

def chunk14 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9668; original row 6313.
    { word := [8, 10, 10, 10, 8, 4, 12], weights := [1, 1, 1, 1] },
    -- Representative 9669; original row 6191.
    { word := [8, 10, 2, 10, 8, 4, 12], weights := [1, 1, 1, 1] }
  ]

def chunk15 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9670; original row 4983.
    { word := [8, 2, 10, 10, 8, 4, 12], weights := [1, 1, 1, 1] },
    -- Representative 9671; original row 4828.
    { word := [8, 2, 2, 10, 8, 4, 12], weights := [1, 1, 1, 1] }
  ]

def chunk16 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9672; original row 5306.
    { word := [8, 6, 8, 12, 8, 4, 12], weights := [1, 1, 1, 1] },
    -- Representative 9673; original row 6271.
    { word := [8, 10, 8, 10, 8, 4, 12], weights := [0, 2, 0, 1] }
  ]

def chunk17 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9674; original row 6132.
    { word := [8, 10, 0, 10, 8, 4, 12], weights := [0, 2, 0, 1] },
    -- Representative 9675; original row 6105.
    { word := [8, 10, 0, 9, 8, 4, 12], weights := [0, 3, 1, 0] }
  ]

def chunk18 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9676; original row 4908.
    { word := [8, 2, 8, 10, 8, 4, 12], weights := [0, 2, 0, 1] },
    -- Representative 9677; original row 4738.
    { word := [8, 2, 0, 10, 8, 4, 12], weights := [0, 2, 0, 1] }
  ]

def chunk19 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9678; original row 4711.
    { word := [8, 2, 0, 9, 8, 4, 12], weights := [0, 3, 1, 0] },
    -- Representative 9679; original row 2481.
    { word := [2, 0, 8, 9, 12, 4, 12], weights := [1, 0, 1, 1] }
  ]

def chunk20 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9680; original row 2477.
    { word := [2, 0, 8, 9, 4, 4, 12], weights := [1, 0, 1, 1] },
    -- Representative 9681; original row 3965.
    { word := [4, 8, 12, 10, 8, 4, 12], weights := [1, 1, 1, 1] }
  ]

def chunk21 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9682; original row 3857.
    { word := [4, 8, 4, 10, 8, 4, 12], weights := [1, 1, 1, 1] },
    -- Representative 9683; original row 3153.
    { word := [2, 8, 12, 10, 8, 4, 12], weights := [2, 1, 1, 2] }
  ]

def chunk22 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9684; original row 2571.
    { word := [2, 0, 12, 10, 8, 4, 12], weights := [1, 0, 1, 1] },
    -- Representative 9685; original row 2449.
    { word := [2, 0, 4, 10, 8, 4, 12], weights := [1, 0, 1, 1] }
  ]

def chunk23 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9686; original row 2553.
    { word := [2, 0, 12, 10, 0, 4, 10], weights := [1, 0, 1, 1] },
    -- Representative 9687; original row 4064.
    { word := [4, 12, 8, 8, 9, 4, 12], weights := [1, 0, 1, 1] }
  ]

def chunk24 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9688; original row 3101.
    { word := [2, 8, 9, 8, 9, 4, 12], weights := [1, 0, 1, 1] },
    -- Representative 9689; original row 3699.
    { word := [4, 4, 8, 8, 9, 4, 12], weights := [1, 0, 1, 1] }
  ]

def chunk25 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9690; original row 2519.
    { word := [2, 0, 9, 8, 9, 4, 12], weights := [1, 0, 1, 1] },
    -- Representative 9691; original row 3026.
    { word := [2, 8, 8, 8, 9, 4, 12], weights := [1, 0, 1, 1] }
  ]

def chunk26 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9692; original row 4051.
    { word := [4, 12, 8, 8, 1, 4, 10], weights := [1, 0, 1, 1] },
    -- Representative 9693; original row 3093.
    { word := [2, 8, 9, 8, 1, 4, 10], weights := [1, 0, 1, 1] }
  ]

def chunk27 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9694; original row 3686.
    { word := [4, 4, 8, 8, 1, 4, 10], weights := [1, 0, 1, 1] },
    -- Representative 9695; original row 2511.
    { word := [2, 0, 9, 8, 1, 4, 10], weights := [1, 0, 1, 1] }
  ]

def chunk28 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9696; original row 3018.
    { word := [2, 8, 8, 8, 1, 4, 10], weights := [1, 0, 1, 1] },
    -- Representative 9697; original row 4140.
    { word := [8, 0, 1, 4, 8, 4, 10], weights := [1, 0, 1, 0] }
  ]

def chunk29 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9698; original row 5461.
    { word := [8, 8, 1, 4, 8, 4, 10], weights := [1, 0, 1, 0] },
    -- Representative 9699; original row 6506.
    { word := [8, 12, 8, 4, 8, 4, 10], weights := [1, 0, 1, 0] }
  ]

def chunk30 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9700; original row 6548.
    { word := [8, 12, 8, 12, 8, 4, 10], weights := [1, 0, 1, 0] },
    -- Representative 9701; original row 5497.
    { word := [8, 8, 1, 12, 8, 4, 10], weights := [1, 0, 1, 0] }
  ]

def chunk31 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9702; original row 5176.
    { word := [8, 4, 8, 4, 8, 4, 10], weights := [1, 0, 1, 0] },
    -- Representative 9703; original row 5218.
    { word := [8, 4, 8, 12, 8, 4, 10], weights := [1, 0, 1, 0] }
  ]

def entries : List FranklSmallCyclic.Weights.Entry :=
  chunk0 ++ chunk1 ++ chunk2 ++ chunk3 ++ chunk4 ++ chunk5 ++ chunk6 ++ chunk7 ++ chunk8 ++ chunk9 ++ chunk10 ++ chunk11 ++ chunk12 ++ chunk13 ++ chunk14 ++ chunk15 ++ chunk16 ++ chunk17 ++ chunk18 ++ chunk19 ++ chunk20 ++ chunk21 ++ chunk22 ++ chunk23 ++ chunk24 ++ chunk25 ++ chunk26 ++ chunk27 ++ chunk28 ++ chunk29 ++ chunk30 ++ chunk31

theorem representativeIds_length : representativeIds.length = 64 := by decide +kernel

theorem sourceRows_length : sourceRows.length = 64 := by decide +kernel

theorem entries_length : entries.length = 64 := by decide +kernel

theorem representativeIds_nodup : representativeIds.Nodup := by decide +kernel

def entryAt (index : Fin 64) : FranklSmallCyclic.Weights.Entry :=
  entries.get ⟨index.val, by simpa only [entries_length] using index.isLt⟩

theorem entryAt_mem (index : Fin 64) : entryAt index ∈ entries :=
  List.get_mem _ _

end FranklSmallCyclic.OrbitBatches.P10.B003.Data
