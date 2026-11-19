module

public import Conjectures.FranklSmallCyclicOrbitArithmetic

/-! Generated arithmetic block for period 10. Distinct representative IDs
and original candidate rows are recorded in the companion input manifest.
Orbit packet SHA256: a361100bee79d5e087d091ce4f4b95c51992c6527edc8a8d9d98e62e1bb44416
-/
@[expose] public section

namespace FranklSmallCyclic.OrbitBatches.P10.B014.Data

def representativeIds : List ℕ := [10344, 10345, 10346, 10347, 10348, 10349, 10350, 10351, 10352, 10353, 10354, 10355, 10356, 10357, 10358, 10359, 10360, 10361, 10362, 10363, 10364, 10365, 10366, 10367, 10368, 10369, 10370, 10371, 10372, 10373, 10374, 10375, 10376, 10377, 10378, 10379, 10380, 10381, 10382, 10383, 10384, 10385, 10386, 10387, 10388, 10389, 10390, 10391, 10392, 10393, 10394, 10395, 10396, 10397, 10398, 10399, 10400, 10401, 10402, 10403, 10404, 10405, 10406, 10407]

def sourceRows : List ℕ := [3068, 2879, 2474, 2504, 3038, 2854, 2493, 4041, 4037, 4039, 4035, 4027, 3344, 3365, 3343, 3363, 3341, 3321, 3246, 3281, 3348, 3327, 3245, 3280, 3345, 3326, 3357, 3335, 3157, 2947, 2575, 2453, 2564, 2442, 2482, 2478, 3296, 3102, 3289, 2520, 3027, 3185, 3095, 3178, 2513, 3020, 4013, 4031, 4009, 4025, 3250, 3262, 3272, 3325, 3312, 3268, 3319, 3299, 3257, 3307, 3169, 3197, 3190, 3359]

def chunk0 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10344; original row 3068.
    { word := [2, 8, 8, 12, 8, 12, 4], weights := [1, 0, 1, 0] },
    -- Representative 10345; original row 2879.
    { word := [2, 8, 0, 12, 8, 12, 4], weights := [1, 0, 1, 0] }
  ]

def chunk1 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10346; original row 2474.
    { word := [2, 0, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] },
    -- Representative 10347; original row 2504.
    { word := [2, 0, 8, 12, 8, 12, 4], weights := [1, 0, 1, 0] }
  ]

def chunk2 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10348; original row 3038.
    { word := [2, 8, 8, 12, 0, 12, 2], weights := [1, 0, 1, 0] },
    -- Representative 10349; original row 2854.
    { word := [2, 8, 0, 12, 0, 12, 4], weights := [1, 0, 1, 0] }
  ]

def chunk3 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10350; original row 2493.
    { word := [2, 0, 8, 12, 0, 12, 2], weights := [1, 0, 1, 0] },
    -- Representative 10351; original row 4041.
    { word := [4, 10, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] }
  ]

def chunk4 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10352; original row 4037.
    { word := [4, 10, 8, 12, 4, 12, 8], weights := [1, 1, 1, 1] },
    -- Representative 10353; original row 4039.
    { word := [4, 10, 8, 12, 12, 4, 8], weights := [1, 1, 1, 1] }
  ]

def chunk5 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10354; original row 4035.
    { word := [4, 10, 8, 12, 4, 4, 8], weights := [1, 1, 1, 1] },
    -- Representative 10355; original row 4027.
    { word := [4, 10, 8, 10, 8, 6, 8], weights := [1, 1, 1, 1] }
  ]

def chunk6 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10356; original row 3344.
    { word := [2, 10, 8, 12, 8, 4, 2], weights := [2, 1, 2, 1] },
    -- Representative 10357; original row 3365.
    { word := [2, 10, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] }
  ]

def chunk7 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10358; original row 3343.
    { word := [2, 10, 8, 12, 4, 12, 8], weights := [1, 1, 1, 1] },
    -- Representative 10359; original row 3363.
    { word := [2, 10, 8, 12, 12, 4, 8], weights := [1, 1, 1, 1] }
  ]

def chunk8 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10360; original row 3341.
    { word := [2, 10, 8, 12, 4, 4, 8], weights := [1, 1, 1, 1] },
    -- Representative 10361; original row 3321.
    { word := [2, 10, 8, 10, 8, 6, 8], weights := [1, 1, 1, 1] }
  ]

def chunk9 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10362; original row 3246.
    { word := [2, 10, 8, 0, 1, 12, 8], weights := [0, 1, 3, 0] },
    -- Representative 10363; original row 3281.
    { word := [2, 10, 8, 8, 1, 12, 8], weights := [0, 1, 3, 0] }
  ]

def chunk10 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10364; original row 3348.
    { word := [2, 10, 8, 12, 8, 12, 8], weights := [1, 0, 3, 0] },
    -- Representative 10365; original row 3327.
    { word := [2, 10, 8, 12, 0, 12, 8], weights := [1, 0, 3, 0] }
  ]

def chunk11 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10366; original row 3245.
    { word := [2, 10, 8, 0, 1, 4, 8], weights := [0, 1, 3, 0] },
    -- Representative 10367; original row 3280.
    { word := [2, 10, 8, 8, 1, 4, 8], weights := [0, 1, 3, 0] }
  ]

def chunk12 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10368; original row 3345.
    { word := [2, 10, 8, 12, 8, 4, 8], weights := [1, 0, 3, 0] },
    -- Representative 10369; original row 3326.
    { word := [2, 10, 8, 12, 0, 4, 8], weights := [1, 0, 3, 0] }
  ]

def chunk13 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10370; original row 3357.
    { word := [2, 10, 8, 12, 10, 8, 2], weights := [1, 1, 1, 1] },
    -- Representative 10371; original row 3335.
    { word := [2, 10, 8, 12, 2, 8, 2], weights := [1, 1, 1, 1] }
  ]

def chunk14 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10372; original row 3157.
    { word := [2, 8, 12, 10, 8, 12, 4], weights := [2, 1, 1, 2] },
    -- Representative 10373; original row 2947.
    { word := [2, 8, 4, 10, 8, 12, 4], weights := [2, 2, 1, 3] }
  ]

def chunk15 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10374; original row 2575.
    { word := [2, 0, 12, 10, 8, 12, 4], weights := [1, 0, 1, 1] },
    -- Representative 10375; original row 2453.
    { word := [2, 0, 4, 10, 8, 12, 4], weights := [1, 0, 1, 1] }
  ]

def chunk16 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10376; original row 2564.
    { word := [2, 0, 12, 10, 0, 12, 2], weights := [1, 0, 1, 1] },
    -- Representative 10377; original row 2442.
    { word := [2, 0, 4, 10, 0, 12, 2], weights := [1, 0, 1, 1] }
  ]

def chunk17 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10378; original row 2482.
    { word := [2, 0, 8, 9, 12, 12, 4], weights := [1, 0, 1, 1] },
    -- Representative 10379; original row 2478.
    { word := [2, 0, 8, 9, 4, 12, 4], weights := [1, 0, 1, 1] }
  ]

def chunk18 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10380; original row 3296.
    { word := [2, 10, 8, 9, 8, 10, 2], weights := [1, 1, 0, 1] },
    -- Representative 10381; original row 3102.
    { word := [2, 8, 9, 8, 9, 12, 4], weights := [1, 0, 1, 1] }
  ]

def chunk19 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10382; original row 3289.
    { word := [2, 10, 8, 9, 8, 2, 2], weights := [1, 1, 0, 1] },
    -- Representative 10383; original row 2520.
    { word := [2, 0, 9, 8, 9, 12, 4], weights := [1, 0, 1, 1] }
  ]

def chunk20 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10384; original row 3027.
    { word := [2, 8, 8, 8, 9, 12, 4], weights := [1, 0, 1, 1] },
    -- Representative 10385; original row 3185.
    { word := [2, 10, 0, 9, 8, 10, 2], weights := [1, 1, 0, 1] }
  ]

def chunk21 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10386; original row 3095.
    { word := [2, 8, 9, 8, 1, 12, 2], weights := [1, 0, 1, 1] },
    -- Representative 10387; original row 3178.
    { word := [2, 10, 0, 9, 8, 2, 2], weights := [1, 1, 0, 1] }
  ]

def chunk22 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10388; original row 2513.
    { word := [2, 0, 9, 8, 1, 12, 2], weights := [1, 0, 1, 1] },
    -- Representative 10389; original row 3020.
    { word := [2, 8, 8, 8, 1, 12, 2], weights := [1, 0, 1, 1] }
  ]

def chunk23 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10390; original row 4013.
    { word := [4, 10, 8, 2, 8, 10, 8], weights := [1, 0, 0, 1] },
    -- Representative 10391; original row 4031.
    { word := [4, 10, 8, 10, 8, 10, 8], weights := [1, 0, 0, 1] }
  ]

def chunk24 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10392; original row 4009.
    { word := [4, 10, 8, 2, 8, 2, 8], weights := [1, 0, 0, 1] },
    -- Representative 10393; original row 4025.
    { word := [4, 10, 8, 10, 8, 2, 8], weights := [1, 0, 0, 1] }
  ]

def chunk25 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10394; original row 3250.
    { word := [2, 10, 8, 2, 0, 1, 8], weights := [1, 0, 0, 1] },
    -- Representative 10395; original row 3262.
    { word := [2, 10, 8, 2, 0, 9, 8], weights := [1, 0, 0, 1] }
  ]

def chunk26 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10396; original row 3272.
    { word := [2, 10, 8, 2, 8, 10, 8], weights := [1, 0, 0, 1] },
    -- Representative 10397; original row 3325.
    { word := [2, 10, 8, 10, 8, 10, 8], weights := [1, 0, 0, 1] }
  ]

def chunk27 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10398; original row 3312.
    { word := [2, 10, 8, 10, 0, 9, 8], weights := [1, 0, 0, 1] },
    -- Representative 10399; original row 3268.
    { word := [2, 10, 8, 2, 8, 2, 8], weights := [1, 0, 0, 1] }
  ]

def chunk28 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10400; original row 3319.
    { word := [2, 10, 8, 10, 8, 2, 8], weights := [1, 0, 0, 1] },
    -- Representative 10401; original row 3299.
    { word := [2, 10, 8, 10, 0, 1, 8], weights := [1, 0, 0, 1] }
  ]

def chunk29 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10402; original row 3257.
    { word := [2, 10, 8, 2, 0, 8, 8], weights := [1, 0, 0, 1] },
    -- Representative 10403; original row 3307.
    { word := [2, 10, 8, 10, 0, 8, 8], weights := [1, 0, 0, 1] }
  ]

def chunk30 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10404; original row 3169.
    { word := [2, 10, 0, 2, 0, 8, 8], weights := [2, 1, 0, 1] },
    -- Representative 10405; original row 3197.
    { word := [2, 10, 0, 10, 0, 8, 8], weights := [1, 0, 0, 1] }
  ]

def chunk31 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 10406; original row 3190.
    { word := [2, 10, 0, 10, 0, 0, 8], weights := [1, 1, 0, 0] },
    -- Representative 10407; original row 3359.
    { word := [2, 10, 8, 12, 10, 8, 8], weights := [1, 1, 1, 1] }
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

end FranklSmallCyclic.OrbitBatches.P10.B014.Data
