module

public import Conjectures.FranklSmallCyclicOrbitArithmetic

/-! Generated arithmetic block for period 10. Distinct representative IDs
and original candidate rows are recorded in the companion input manifest.
Orbit packet SHA256: a361100bee79d5e087d091ce4f4b95c51992c6527edc8a8d9d98e62e1bb44416
-/
@[expose] public section

namespace FranklSmallCyclic.OrbitBatches.P10.B000.Data

def representativeIds : List ℕ := [9448, 9449, 9450, 9451, 9452, 9453, 9454, 9455, 9456, 9457, 9458, 9459, 9460, 9461, 9462, 9463, 9464, 9465, 9466, 9467, 9468, 9469, 9470, 9471, 9472, 9473, 9474, 9475, 9476, 9477, 9478, 9479, 9480, 9481, 9482, 9483, 9484, 9485, 9486, 9487, 9488, 9489, 9490, 9491, 9492, 9493, 9494, 9495, 9496, 9497, 9498, 9499, 9500, 9501, 9502, 9503, 9504, 9505, 9506, 9507, 9508, 9509, 9510, 9511]

def sourceRows : List ℕ := [4096, 4095, 4080, 4079, 4094, 4089, 4092, 4084, 3292, 3181, 2697, 2592, 4088, 4083, 8361, 8011, 8084, 5897, 5956, 7844, 8012, 8085, 7895, 7491, 7521, 5871, 5931, 8055, 7870, 7512, 4514, 8358, 6030, 5919, 4595, 7499, 4504, 6026, 5915, 4591, 7495, 4500, 8372, 8350, 4662, 4569, 4653, 4560, 8172, 7962, 7592, 7470, 7583, 7461, 8309, 8117, 8302, 7537, 8042, 8200, 8112, 8193, 7532, 8037]

def chunk0 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9448; original row 4096.
    { word := [6, 10, 8, 8, 1, 12, 8], weights := [0, 1, 3, 0] },
    -- Representative 9449; original row 4095.
    { word := [6, 10, 8, 8, 1, 4, 8], weights := [0, 1, 3, 0] }
  ]

def chunk1 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9450; original row 4080.
    { word := [6, 2, 8, 8, 1, 12, 8], weights := [0, 1, 3, 0] },
    -- Representative 9451; original row 4079.
    { word := [6, 2, 8, 8, 1, 4, 8], weights := [0, 1, 3, 0] }
  ]

def chunk2 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9452; original row 4094.
    { word := [6, 8, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] },
    -- Representative 9453; original row 4089.
    { word := [6, 8, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }
  ]

def chunk3 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9454; original row 4092.
    { word := [6, 8, 8, 8, 9, 4, 12], weights := [1, 0, 1, 1] },
    -- Representative 9455; original row 4084.
    { word := [6, 8, 8, 8, 1, 4, 10], weights := [1, 0, 1, 1] }
  ]

def chunk4 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9456; original row 3292.
    { word := [2, 10, 8, 9, 8, 8, 6], weights := [1, 1, 0, 1] },
    -- Representative 9457; original row 3181.
    { word := [2, 10, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }
  ]

def chunk5 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9458; original row 2697.
    { word := [2, 2, 8, 9, 8, 8, 6], weights := [1, 1, 0, 1] },
    -- Representative 9459; original row 2592.
    { word := [2, 2, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }
  ]

def chunk6 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9460; original row 4088.
    { word := [6, 8, 8, 8, 1, 12, 8], weights := [0, 0, 1, 0] },
    -- Representative 9461; original row 4083.
    { word := [6, 8, 8, 8, 1, 4, 8], weights := [0, 0, 1, 0] }
  ]

def chunk7 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9462; original row 8361.
    { word := [10, 10, 8, 12, 8, 12, 10], weights := [2, 1, 2, 1] },
    -- Representative 9463; original row 8011.
    { word := [10, 8, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }
  ]

def chunk8 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9464; original row 8084.
    { word := [10, 8, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] },
    -- Representative 9465; original row 5897.
    { word := [8, 9, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }
  ]

def chunk9 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9466; original row 5956.
    { word := [8, 9, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] },
    -- Representative 9467; original row 7844.
    { word := [10, 8, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }
  ]

def chunk10 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9468; original row 8012.
    { word := [10, 8, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] },
    -- Representative 9469; original row 8085.
    { word := [10, 8, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }
  ]

def chunk11 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9470; original row 7895.
    { word := [10, 8, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] },
    -- Representative 9471; original row 7491.
    { word := [10, 0, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }
  ]

def chunk12 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9472; original row 7521.
    { word := [10, 0, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] },
    -- Representative 9473; original row 5871.
    { word := [8, 9, 0, 4, 0, 12, 12], weights := [1, 0, 1, 2] }
  ]

def chunk13 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9474; original row 5931.
    { word := [8, 9, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] },
    -- Representative 9475; original row 8055.
    { word := [10, 8, 8, 12, 0, 12, 10], weights := [1, 0, 1, 0] }
  ]

def chunk14 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9476; original row 7870.
    { word := [10, 8, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] },
    -- Representative 9477; original row 7512.
    { word := [10, 0, 8, 12, 0, 12, 10], weights := [1, 0, 1, 0] }
  ]

def chunk15 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9478; original row 4514.
    { word := [8, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] },
    -- Representative 9479; original row 8358.
    { word := [10, 10, 8, 12, 8, 4, 10], weights := [2, 1, 2, 1] }
  ]

def chunk16 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9480; original row 6030.
    { word := [8, 9, 8, 9, 12, 12, 12], weights := [1, 1, 1, 1] },
    -- Representative 9481; original row 5919.
    { word := [8, 9, 0, 9, 12, 12, 12], weights := [1, 1, 1, 1] }
  ]

def chunk17 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9482; original row 4595.
    { word := [8, 1, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] },
    -- Representative 9483; original row 7499.
    { word := [10, 0, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }
  ]

def chunk18 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9484; original row 4504.
    { word := [8, 1, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] },
    -- Representative 9485; original row 6026.
    { word := [8, 9, 8, 9, 4, 12, 12], weights := [1, 1, 1, 1] }
  ]

def chunk19 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9486; original row 5915.
    { word := [8, 9, 0, 9, 4, 12, 12], weights := [1, 1, 1, 1] },
    -- Representative 9487; original row 4591.
    { word := [8, 1, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }
  ]

def chunk20 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9488; original row 7495.
    { word := [10, 0, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] },
    -- Representative 9489; original row 4500.
    { word := [8, 1, 0, 9, 4, 12, 12], weights := [1, 0, 1, 1] }
  ]

def chunk21 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9490; original row 8372.
    { word := [10, 10, 8, 12, 10, 8, 10], weights := [1, 1, 1, 1] },
    -- Representative 9491; original row 8350.
    { word := [10, 10, 8, 12, 2, 8, 10], weights := [1, 1, 1, 1] }
  ]

def chunk22 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9492; original row 4662.
    { word := [8, 1, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] },
    -- Representative 9493; original row 4569.
    { word := [8, 1, 4, 10, 8, 12, 12], weights := [1, 0, 1, 1] }
  ]

def chunk23 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9494; original row 4653.
    { word := [8, 1, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] },
    -- Representative 9495; original row 4560.
    { word := [8, 1, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }
  ]

def chunk24 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9496; original row 8172.
    { word := [10, 8, 12, 10, 8, 12, 12], weights := [2, 1, 1, 2] },
    -- Representative 9497; original row 7962.
    { word := [10, 8, 4, 10, 8, 12, 12], weights := [2, 2, 1, 3] }
  ]

def chunk25 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9498; original row 7592.
    { word := [10, 0, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] },
    -- Representative 9499; original row 7470.
    { word := [10, 0, 4, 10, 8, 12, 12], weights := [1, 0, 1, 1] }
  ]

def chunk26 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9500; original row 7583.
    { word := [10, 0, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] },
    -- Representative 9501; original row 7461.
    { word := [10, 0, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }
  ]

def chunk27 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9502; original row 8309.
    { word := [10, 10, 8, 9, 8, 10, 10], weights := [1, 1, 0, 1] },
    -- Representative 9503; original row 8117.
    { word := [10, 8, 9, 8, 9, 12, 12], weights := [1, 0, 1, 1] }
  ]

def chunk28 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9504; original row 8302.
    { word := [10, 10, 8, 9, 8, 2, 10], weights := [1, 1, 0, 1] },
    -- Representative 9505; original row 7537.
    { word := [10, 0, 9, 8, 9, 12, 12], weights := [1, 0, 1, 1] }
  ]

def chunk29 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9506; original row 8042.
    { word := [10, 8, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] },
    -- Representative 9507; original row 8200.
    { word := [10, 10, 0, 9, 8, 10, 10], weights := [1, 1, 0, 1] }
  ]

def chunk30 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9508; original row 8112.
    { word := [10, 8, 9, 8, 1, 12, 10], weights := [1, 0, 1, 1] },
    -- Representative 9509; original row 8193.
    { word := [10, 10, 0, 9, 8, 2, 10], weights := [1, 1, 0, 1] }
  ]

def chunk31 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9510; original row 7532.
    { word := [10, 0, 9, 8, 1, 12, 10], weights := [1, 0, 1, 1] },
    -- Representative 9511; original row 8037.
    { word := [10, 8, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }
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

end FranklSmallCyclic.OrbitBatches.P10.B000.Data
