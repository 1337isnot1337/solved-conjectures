module

public import Conjectures.FranklSmallCyclicOrbitArithmetic

/-! Generated arithmetic block for period 10. Distinct representative IDs
and original candidate rows are recorded in the companion input manifest.
Orbit packet SHA256: a361100bee79d5e087d091ce4f4b95c51992c6527edc8a8d9d98e62e1bb44416
-/
@[expose] public section

namespace FranklSmallCyclic.OrbitBatches.P10.B015.Data

def representativeIds : List ℕ := [10408, 10409, 10410, 10411, 10412, 10413, 10414, 10415, 10416, 10417, 10418, 10419, 10420, 10421, 10422, 10423, 10424, 10425, 10426, 10427, 10428, 10429, 10430, 10431, 10432, 10433, 10434, 10435, 10436, 10437, 10438, 10439, 10440, 10441, 10442, 10443, 10444, 10445, 10446, 10447, 10448, 10449, 10450, 10451, 10452, 10453, 10454, 10455, 10456, 10457, 10458, 10459, 10460, 10461, 10462, 10463, 10464, 10465, 10466, 10467, 10468, 10469, 10470, 10471]

def sourceRows : List ℕ := [3337, 3353, 3331, 3215, 3207, 3388, 3374, 3383, 3369, 3242, 3228, 3237, 3223, 2691, 2688, 2586, 2583, 2823, 2989, 3062, 2874, 2660, 2674, 2727, 2710, 2472, 2502, 2613, 2607, 2488, 3676, 3672, 3674, 3670, 3662, 2764, 2746, 2762, 2744, 2726, 2652, 2686, 2748, 2732, 2651, 2685, 2747, 2731, 2480, 2476, 2756, 2740, 2757, 2570, 2448, 2550, 2701, 2699, 2694, 2518, 2696, 2596, 2594, 2589]

def chunk0 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10408; original row 3337.
    { word := [2, 10, 8, 12, 2, 8, 8], weights := [1, 1, 1, 1] },
    -- Representative 10409; original row 3353.
    { word := [2, 10, 8, 12, 10, 0, 8], weights := [1, 1, 1, 0] }
  ]

def chunk1 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10410; original row 3331.
    { word := [2, 10, 8, 12, 2, 0, 8], weights := [1, 1, 1, 0] },
    -- Representative 10411; original row 3215.
    { word := [2, 10, 0, 12, 10, 0, 8], weights := [1, 1, 1, 0] }
  ]

def chunk2 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10412; original row 3207.
    { word := [2, 10, 0, 12, 2, 0, 8], weights := [1, 1, 1, 0] },
    -- Representative 10413; original row 3388.
    { word := [2, 10, 10, 8, 9, 8, 8], weights := [1, 1, 1, 1] }
  ]

def chunk3 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10414; original row 3374.
    { word := [2, 10, 10, 8, 1, 8, 8], weights := [1, 1, 1, 1] },
    -- Representative 10415; original row 3383.
    { word := [2, 10, 10, 8, 9, 0, 8], weights := [1, 1, 0, 1] }
  ]

def chunk4 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10416; original row 3369.
    { word := [2, 10, 10, 8, 1, 0, 8], weights := [1, 1, 0, 1] },
    -- Representative 10417; original row 3242.
    { word := [2, 10, 2, 8, 9, 8, 8], weights := [1, 1, 1, 1] }
  ]

def chunk5 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10418; original row 3228.
    { word := [2, 10, 2, 8, 1, 8, 8], weights := [1, 1, 1, 1] },
    -- Representative 10419; original row 3237.
    { word := [2, 10, 2, 8, 9, 0, 8], weights := [1, 1, 0, 1] }
  ]

def chunk6 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10420; original row 3223.
    { word := [2, 10, 2, 8, 1, 0, 8], weights := [1, 1, 0, 1] },
    -- Representative 10421; original row 2691.
    { word := [2, 2, 8, 9, 0, 12, 8], weights := [1, 1, 2, 0] }
  ]

def chunk7 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10422; original row 2688.
    { word := [2, 2, 8, 9, 0, 4, 8], weights := [1, 1, 2, 0] },
    -- Representative 10423; original row 2586.
    { word := [2, 2, 0, 9, 0, 12, 8], weights := [1, 1, 2, 0] }
  ]

def chunk8 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10424; original row 2583.
    { word := [2, 2, 0, 9, 0, 4, 8], weights := [1, 1, 2, 0] },
    -- Representative 10425; original row 2823.
    { word := [2, 8, 0, 4, 8, 4, 2], weights := [1, 0, 1, 0] }
  ]

def chunk9 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10426; original row 2989.
    { word := [2, 8, 8, 4, 8, 4, 2], weights := [1, 0, 1, 0] },
    -- Representative 10427; original row 3062.
    { word := [2, 8, 8, 12, 8, 4, 2], weights := [1, 0, 1, 0] }
  ]

def chunk10 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10428; original row 2874.
    { word := [2, 8, 0, 12, 8, 4, 2], weights := [1, 0, 1, 0] },
    -- Representative 10429; original row 2660.
    { word := [2, 2, 8, 2, 0, 8, 2], weights := [1, 0, 0, 1] }
  ]

def chunk11 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10430; original row 2674.
    { word := [2, 2, 8, 2, 8, 8, 4], weights := [1, 0, 0, 1] },
    -- Representative 10431; original row 2727.
    { word := [2, 2, 8, 10, 8, 8, 4], weights := [1, 0, 0, 1] }
  ]

def chunk12 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10432; original row 2710.
    { word := [2, 2, 8, 10, 0, 8, 2], weights := [1, 0, 0, 1] },
    -- Representative 10433; original row 2472.
    { word := [2, 0, 8, 4, 8, 4, 4], weights := [1, 0, 0, 1] }
  ]

def chunk13 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10434; original row 2502.
    { word := [2, 0, 8, 12, 8, 4, 4], weights := [1, 0, 1, 0] },
    -- Representative 10435; original row 2613.
    { word := [2, 2, 0, 10, 8, 8, 4], weights := [1, 0, 0, 1] }
  ]

def chunk14 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10436; original row 2607.
    { word := [2, 2, 0, 10, 0, 8, 4], weights := [1, 0, 0, 1] },
    -- Representative 10437; original row 2488.
    { word := [2, 0, 8, 12, 0, 4, 2], weights := [1, 0, 1, 0] }
  ]

def chunk15 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10438; original row 3676.
    { word := [4, 2, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] },
    -- Representative 10439; original row 3672.
    { word := [4, 2, 8, 12, 4, 12, 8], weights := [1, 1, 1, 1] }
  ]

def chunk16 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10440; original row 3674.
    { word := [4, 2, 8, 12, 12, 4, 8], weights := [1, 1, 1, 1] },
    -- Representative 10441; original row 3670.
    { word := [4, 2, 8, 12, 4, 4, 8], weights := [1, 1, 1, 1] }
  ]

def chunk17 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10442; original row 3662.
    { word := [4, 2, 8, 10, 8, 6, 8], weights := [1, 1, 1, 1] },
    -- Representative 10443; original row 2764.
    { word := [2, 2, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] }
  ]

def chunk18 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10444; original row 2746.
    { word := [2, 2, 8, 12, 4, 12, 8], weights := [1, 1, 1, 1] },
    -- Representative 10445; original row 2762.
    { word := [2, 2, 8, 12, 12, 4, 8], weights := [1, 1, 1, 1] }
  ]

def chunk19 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10446; original row 2744.
    { word := [2, 2, 8, 12, 4, 4, 8], weights := [1, 1, 1, 1] },
    -- Representative 10447; original row 2726.
    { word := [2, 2, 8, 10, 8, 6, 8], weights := [1, 1, 1, 1] }
  ]

def chunk20 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10448; original row 2652.
    { word := [2, 2, 8, 0, 1, 12, 8], weights := [0, 1, 3, 0] },
    -- Representative 10449; original row 2686.
    { word := [2, 2, 8, 8, 1, 12, 8], weights := [0, 1, 3, 0] }
  ]

def chunk21 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10450; original row 2748.
    { word := [2, 2, 8, 12, 8, 12, 8], weights := [1, 0, 2, 0] },
    -- Representative 10451; original row 2732.
    { word := [2, 2, 8, 12, 0, 12, 8], weights := [1, 0, 2, 0] }
  ]

def chunk22 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10452; original row 2651.
    { word := [2, 2, 8, 0, 1, 4, 8], weights := [0, 1, 3, 0] },
    -- Representative 10453; original row 2685.
    { word := [2, 2, 8, 8, 1, 4, 8], weights := [0, 1, 3, 0] }
  ]

def chunk23 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10454; original row 2747.
    { word := [2, 2, 8, 12, 8, 4, 8], weights := [1, 0, 2, 0] },
    -- Representative 10455; original row 2731.
    { word := [2, 2, 8, 12, 0, 4, 8], weights := [1, 0, 2, 0] }
  ]

def chunk24 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10456; original row 2480.
    { word := [2, 0, 8, 9, 12, 4, 4], weights := [1, 0, 1, 1] },
    -- Representative 10457; original row 2476.
    { word := [2, 0, 8, 9, 4, 4, 4], weights := [1, 0, 1, 1] }
  ]

def chunk25 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10458; original row 2756.
    { word := [2, 2, 8, 12, 10, 8, 2], weights := [1, 1, 1, 1] },
    -- Representative 10459; original row 2740.
    { word := [2, 2, 8, 12, 2, 8, 2], weights := [1, 1, 1, 1] }
  ]

def chunk26 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10460; original row 2757.
    { word := [2, 2, 8, 12, 10, 8, 4], weights := [2, 1, 1, 2] },
    -- Representative 10461; original row 2570.
    { word := [2, 0, 12, 10, 8, 4, 4], weights := [1, 0, 1, 1] }
  ]

def chunk27 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10462; original row 2448.
    { word := [2, 0, 4, 10, 8, 4, 4], weights := [1, 0, 1, 1] },
    -- Representative 10463; original row 2550.
    { word := [2, 0, 12, 10, 0, 4, 2], weights := [1, 0, 1, 1] }
  ]

def chunk28 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10464; original row 2701.
    { word := [2, 2, 8, 9, 8, 10, 2], weights := [1, 1, 0, 1] },
    -- Representative 10465; original row 2699.
    { word := [2, 2, 8, 9, 8, 9, 4], weights := [1, 1, 0, 1] }
  ]

def chunk29 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10466; original row 2694.
    { word := [2, 2, 8, 9, 8, 2, 2], weights := [1, 1, 0, 1] },
    -- Representative 10467; original row 2518.
    { word := [2, 0, 9, 8, 9, 4, 4], weights := [1, 0, 1, 1] }
  ]

def chunk30 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10468; original row 2696.
    { word := [2, 2, 8, 9, 8, 8, 4], weights := [1, 1, 0, 1] },
    -- Representative 10469; original row 2596.
    { word := [2, 2, 0, 9, 8, 10, 2], weights := [1, 1, 0, 1] }
  ]

def chunk31 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10470; original row 2594.
    { word := [2, 2, 0, 9, 8, 9, 4], weights := [1, 1, 0, 1] },
    -- Representative 10471; original row 2589.
    { word := [2, 2, 0, 9, 8, 2, 2], weights := [1, 1, 0, 1] }
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

end FranklSmallCyclic.OrbitBatches.P10.B015.Data
