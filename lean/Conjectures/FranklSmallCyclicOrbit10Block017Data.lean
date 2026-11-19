module

public import Conjectures.FranklSmallCyclicOrbitArithmetic

/-! Generated arithmetic block for period 10. Distinct representative IDs
and original candidate rows are recorded in the companion input manifest.
Orbit packet SHA256: a361100bee79d5e087d091ce4f4b95c51992c6527edc8a8d9d98e62e1bb44416
-/
@[expose] public section

namespace FranklSmallCyclic.OrbitBatches.P10.B017.Data

def representativeIds : List ℕ := [10536, 10537, 10538, 10539, 10540, 10541, 10542, 10543, 10544, 10545, 10546, 10547, 10548, 10549, 10550, 10551, 10552, 10553, 10554, 10555, 10556, 10557, 10558, 10559, 10560, 10561, 10562, 10563, 10564, 10565, 10566, 10567, 10568, 10569, 10570, 10571, 10572, 10573, 10574, 10575, 10576, 10577, 10578, 10579, 10580, 10581, 10582, 10583, 10584, 10585, 10586, 10587, 10588, 10589, 10590, 10591, 10592, 10593, 10594, 10595, 10596, 10597, 10598, 10599]

def sourceRows : List ℕ := [2880, 3040, 2855, 2495, 4999, 4844, 6241, 6081, 4878, 4687, 6079, 4876, 4685, 4704, 2566, 2444, 4047, 4055, 3089, 3097, 3682, 3690, 2507, 2515, 2956, 3022, 5743, 5751, 6303, 6325, 4387, 4395, 5198, 5240, 5702, 5735, 5739, 5747, 6175, 6203, 4383, 4391, 5172, 5214, 5694, 5728, 4358, 4379, 4143, 5464, 6233, 6277, 5500, 5180, 5222, 4179, 5365, 5428, 5339, 5403, 4121, 4477, 4301, 4922]

def chunk0 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10536; original row 2880.
    { word := [2, 8, 0, 12, 8, 12, 8], weights := [1, 0, 1, 0] },
    -- Representative 10537; original row 3040.
    { word := [2, 8, 8, 12, 0, 12, 8], weights := [0, 0, 1, 0] }
  ]

def chunk1 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10538; original row 2855.
    { word := [2, 8, 0, 12, 0, 12, 8], weights := [1, 0, 1, 0] },
    -- Representative 10539; original row 2495.
    { word := [2, 0, 8, 12, 0, 12, 8], weights := [0, 0, 1, 0] }
  ]

def chunk2 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10540; original row 4999.
    { word := [8, 2, 10, 10, 8, 12, 8], weights := [0, 1, 1, 0] },
    -- Representative 10541; original row 4844.
    { word := [8, 2, 2, 10, 8, 12, 8], weights := [0, 1, 1, 0] }
  ]

def chunk3 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10542; original row 6241.
    { word := [8, 10, 8, 6, 8, 12, 8], weights := [0, 1, 1, 0] },
    -- Representative 10543; original row 6081.
    { word := [8, 10, 0, 6, 8, 12, 8], weights := [1, 1, 1, 1] }
  ]

def chunk4 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10544; original row 4878.
    { word := [8, 2, 8, 6, 8, 12, 8], weights := [0, 1, 1, 0] },
    -- Representative 10545; original row 4687.
    { word := [8, 2, 0, 6, 8, 12, 8], weights := [1, 1, 1, 1] }
  ]

def chunk5 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10546; original row 6079.
    { word := [8, 10, 0, 6, 0, 12, 8], weights := [1, 1, 1, 1] },
    -- Representative 10547; original row 4876.
    { word := [8, 2, 8, 6, 0, 12, 8], weights := [1, 0, 1, 1] }
  ]

def chunk6 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10548; original row 4685.
    { word := [8, 2, 0, 6, 0, 12, 8], weights := [1, 1, 1, 1] },
    -- Representative 10549; original row 4704.
    { word := [8, 2, 0, 9, 0, 12, 8], weights := [0, 1, 1, 0] }
  ]

def chunk7 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10550; original row 2566.
    { word := [2, 0, 12, 10, 0, 12, 8], weights := [1, 0, 1, 1] },
    -- Representative 10551; original row 2444.
    { word := [2, 0, 4, 10, 0, 12, 8], weights := [1, 0, 1, 1] }
  ]

def chunk8 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10552; original row 4047.
    { word := [4, 12, 8, 0, 1, 12, 8], weights := [0, 0, 1, 0] },
    -- Representative 10553; original row 4055.
    { word := [4, 12, 8, 8, 1, 12, 8], weights := [0, 0, 1, 0] }
  ]

def chunk9 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10554; original row 3089.
    { word := [2, 8, 9, 0, 1, 12, 8], weights := [0, 0, 1, 0] },
    -- Representative 10555; original row 3097.
    { word := [2, 8, 9, 8, 1, 12, 8], weights := [0, 0, 1, 0] }
  ]

def chunk10 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10556; original row 3682.
    { word := [4, 4, 8, 0, 1, 12, 8], weights := [0, 0, 1, 0] },
    -- Representative 10557; original row 3690.
    { word := [4, 4, 8, 8, 1, 12, 8], weights := [0, 0, 1, 0] }
  ]

def chunk11 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10558; original row 2507.
    { word := [2, 0, 9, 0, 1, 12, 8], weights := [0, 0, 1, 0] },
    -- Representative 10559; original row 2515.
    { word := [2, 0, 9, 8, 1, 12, 8], weights := [0, 0, 1, 0] }
  ]

def chunk12 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10560; original row 2956.
    { word := [2, 8, 8, 0, 1, 12, 8], weights := [0, 0, 1, 0] },
    -- Representative 10561; original row 3022.
    { word := [2, 8, 8, 8, 1, 12, 8], weights := [0, 0, 1, 0] }
  ]

def chunk13 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10562; original row 5743.
    { word := [8, 8, 9, 4, 12, 12, 8], weights := [1, 0, 0, 1] },
    -- Representative 10563; original row 5751.
    { word := [8, 8, 9, 12, 12, 12, 8], weights := [1, 0, 0, 1] }
  ]

def chunk14 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10564; original row 6303.
    { word := [8, 10, 10, 2, 8, 10, 8], weights := [1, 0, 0, 1] },
    -- Representative 10565; original row 6325.
    { word := [8, 10, 10, 10, 8, 10, 8], weights := [1, 0, 0, 1] }
  ]

def chunk15 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10566; original row 4387.
    { word := [8, 0, 9, 4, 12, 12, 8], weights := [1, 0, 0, 1] },
    -- Representative 10567; original row 4395.
    { word := [8, 0, 9, 12, 12, 12, 8], weights := [1, 0, 0, 1] }
  ]

def chunk16 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10568; original row 5198.
    { word := [8, 4, 8, 4, 12, 12, 8], weights := [1, 0, 0, 1] },
    -- Representative 10569; original row 5240.
    { word := [8, 4, 8, 12, 12, 12, 8], weights := [1, 0, 0, 1] }
  ]

def chunk17 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10570; original row 5702.
    { word := [8, 8, 8, 4, 12, 12, 8], weights := [1, 0, 0, 1] },
    -- Representative 10571; original row 5735.
    { word := [8, 8, 8, 12, 12, 12, 8], weights := [1, 0, 0, 1] }
  ]

def chunk18 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10572; original row 5739.
    { word := [8, 8, 9, 4, 4, 12, 8], weights := [1, 0, 0, 1] },
    -- Representative 10573; original row 5747.
    { word := [8, 8, 9, 12, 4, 12, 8], weights := [1, 0, 0, 1] }
  ]

def chunk19 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10574; original row 6175.
    { word := [8, 10, 2, 2, 8, 10, 8], weights := [1, 0, 0, 1] },
    -- Representative 10575; original row 6203.
    { word := [8, 10, 2, 10, 8, 10, 8], weights := [1, 0, 0, 1] }
  ]

def chunk20 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10576; original row 4383.
    { word := [8, 0, 9, 4, 4, 12, 8], weights := [1, 0, 0, 1] },
    -- Representative 10577; original row 4391.
    { word := [8, 0, 9, 12, 4, 12, 8], weights := [1, 0, 0, 1] }
  ]

def chunk21 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10578; original row 5172.
    { word := [8, 4, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] },
    -- Representative 10579; original row 5214.
    { word := [8, 4, 8, 12, 4, 12, 8], weights := [1, 0, 0, 1] }
  ]

def chunk22 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10580; original row 5694.
    { word := [8, 8, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] },
    -- Representative 10581; original row 5728.
    { word := [8, 8, 8, 12, 4, 12, 8], weights := [1, 0, 0, 1] }
  ]

def chunk23 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10582; original row 4358.
    { word := [8, 0, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] },
    -- Representative 10583; original row 4379.
    { word := [8, 0, 8, 12, 4, 12, 8], weights := [1, 0, 0, 1] }
  ]

def chunk24 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10584; original row 4143.
    { word := [8, 0, 1, 4, 8, 12, 8], weights := [1, 0, 1, 0] },
    -- Representative 10585; original row 5464.
    { word := [8, 8, 1, 4, 8, 12, 8], weights := [1, 0, 1, 0] }
  ]

def chunk25 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10586; original row 6233.
    { word := [8, 10, 8, 2, 8, 10, 8], weights := [0, 1, 0, 0] },
    -- Representative 10587; original row 6277.
    { word := [8, 10, 8, 10, 8, 10, 8], weights := [0, 1, 0, 0] }
  ]

def chunk26 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10588; original row 5500.
    { word := [8, 8, 1, 12, 8, 12, 8], weights := [1, 0, 1, 0] },
    -- Representative 10589; original row 5180.
    { word := [8, 4, 8, 4, 8, 12, 8], weights := [0, 0, 1, 0] }
  ]

def chunk27 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10590; original row 5222.
    { word := [8, 4, 8, 12, 8, 12, 8], weights := [0, 0, 1, 0] },
    -- Representative 10591; original row 4179.
    { word := [8, 0, 1, 12, 8, 12, 8], weights := [1, 0, 1, 0] }
  ]

def chunk28 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10592; original row 5365.
    { word := [8, 8, 0, 4, 8, 12, 8], weights := [1, 0, 1, 0] },
    -- Representative 10593; original row 5428.
    { word := [8, 8, 0, 12, 8, 12, 8], weights := [1, 0, 1, 0] }
  ]

def chunk29 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10594; original row 5339.
    { word := [8, 8, 0, 4, 0, 12, 8], weights := [1, 0, 3, 0] },
    -- Representative 10595; original row 5403.
    { word := [8, 8, 0, 12, 0, 12, 8], weights := [1, 0, 1, 0] }
  ]

def chunk30 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10596; original row 4121.
    { word := [8, 0, 0, 12, 0, 12, 8], weights := [0, 0, 1, 0] },
    -- Representative 10597; original row 4477.
    { word := [8, 0, 12, 10, 0, 12, 8], weights := [1, 0, 1, 1] }
  ]

def chunk31 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10598; original row 4301.
    { word := [8, 0, 4, 10, 0, 12, 8], weights := [1, 0, 1, 1] },
    -- Representative 10599; original row 4922.
    { word := [8, 2, 8, 12, 12, 4, 8], weights := [0, 1, 1, 0] }
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

end FranklSmallCyclic.OrbitBatches.P10.B017.Data
