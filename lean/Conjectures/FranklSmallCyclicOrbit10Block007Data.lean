module

public import Conjectures.FranklSmallCyclicOrbitArithmetic

/-! Generated arithmetic block for period 10. Distinct representative IDs
and original candidate rows are recorded in the companion input manifest.
Orbit packet SHA256: a361100bee79d5e087d091ce4f4b95c51992c6527edc8a8d9d98e62e1bb44416
-/
@[expose] public section

namespace FranklSmallCyclic.OrbitBatches.P10.B007.Data

def representativeIds : List ℕ := [9896, 9897, 9898, 9899, 9900, 9901, 9902, 9903, 9904, 9905, 9906, 9907, 9908, 9909, 9910, 9911, 9912, 9913, 9914, 9915, 9916, 9917, 9918, 9919, 9920, 9921, 9922, 9923, 9924, 9925, 9926, 9927, 9928, 9929, 9930, 9931, 9932, 9933, 9934, 9935, 9936, 9937, 9938, 9939, 9940, 9941, 9942, 9943, 9944, 9945, 9946, 9947, 9948, 9949, 9950, 9951, 9952, 9953, 9954, 9955, 9956, 9957, 9958, 9959]

def sourceRows : List ℕ := [6170, 6298, 6320, 6198, 6171, 6299, 6321, 6199, 6231, 6275, 6134, 6220, 6261, 6128, 4586, 4603, 6159, 6182, 6130, 4513, 6072, 6112, 6070, 6110, 6065, 6102, 6063, 6100, 6068, 6108, 4652, 4559, 6151, 6143, 4683, 4789, 4950, 4989, 4834, 4766, 4934, 4967, 4805, 4856, 4897, 4733, 4790, 4951, 4990, 4835, 4791, 4952, 4991, 4836, 4868, 4912, 4740, 4767, 4935, 4968, 4806, 4857, 4898, 4734]

def chunk0 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9896; original row 6170.
    { word := [8, 10, 2, 2, 8, 8, 10], weights := [1, 0, 0, 1] },
    -- Representative 9897; original row 6298.
    { word := [8, 10, 10, 2, 8, 8, 10], weights := [1, 0, 0, 1] }
  ]

def chunk1 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9898; original row 6320.
    { word := [8, 10, 10, 10, 8, 8, 10], weights := [1, 0, 0, 1] },
    -- Representative 9899; original row 6198.
    { word := [8, 10, 2, 10, 8, 8, 10], weights := [1, 0, 0, 1] }
  ]

def chunk2 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9900; original row 6171.
    { word := [8, 10, 2, 2, 8, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 9901; original row 6299.
    { word := [8, 10, 10, 2, 8, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk3 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9902; original row 6321.
    { word := [8, 10, 10, 10, 8, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 9903; original row 6199.
    { word := [8, 10, 2, 10, 8, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk4 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9904; original row 6231.
    { word := [8, 10, 8, 2, 8, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 9905; original row 6275.
    { word := [8, 10, 8, 10, 8, 8, 12], weights := [0, 1, 0, 0] }
  ]

def chunk5 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9906; original row 6134.
    { word := [8, 10, 0, 10, 8, 8, 12], weights := [0, 1, 0, 0] },
    -- Representative 9907; original row 6220.
    { word := [8, 10, 8, 2, 0, 8, 10], weights := [1, 0, 0, 1] }
  ]

def chunk6 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9908; original row 6261.
    { word := [8, 10, 8, 10, 0, 8, 10], weights := [1, 0, 0, 1] },
    -- Representative 9909; original row 6128.
    { word := [8, 10, 0, 10, 0, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk7 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9910; original row 4586.
    { word := [8, 1, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] },
    -- Representative 9911; original row 4603.
    { word := [8, 1, 8, 12, 4, 12, 8], weights := [1, 0, 0, 1] }
  ]

def chunk8 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9912; original row 6159.
    { word := [8, 10, 2, 2, 8, 0, 12], weights := [1, 0, 0, 1] },
    -- Representative 9913; original row 6182.
    { word := [8, 10, 2, 10, 8, 0, 12], weights := [1, 1, 0, 0] }
  ]

def chunk9 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9914; original row 6130.
    { word := [8, 10, 0, 10, 8, 0, 12], weights := [0, 1, 0, 0] },
    -- Representative 9915; original row 4513.
    { word := [8, 1, 0, 12, 0, 12, 8], weights := [0, 0, 1, 0] }
  ]

def chunk10 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9916; original row 6072.
    { word := [8, 10, 0, 1, 8, 10, 10], weights := [0, 1, 0, 0] },
    -- Representative 9917; original row 6112.
    { word := [8, 10, 0, 9, 8, 10, 10], weights := [0, 1, 0, 0] }
  ]

def chunk11 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9918; original row 6070.
    { word := [8, 10, 0, 1, 8, 9, 12], weights := [0, 1, 0, 0] },
    -- Representative 9919; original row 6110.
    { word := [8, 10, 0, 9, 8, 9, 12], weights := [0, 1, 0, 0] }
  ]

def chunk12 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9920; original row 6065.
    { word := [8, 10, 0, 1, 8, 2, 10], weights := [0, 1, 0, 0] },
    -- Representative 9921; original row 6102.
    { word := [8, 10, 0, 9, 8, 2, 10], weights := [0, 1, 0, 0] }
  ]

def chunk13 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9922; original row 6063.
    { word := [8, 10, 0, 1, 8, 1, 12], weights := [0, 1, 0, 0] },
    -- Representative 9923; original row 6100.
    { word := [8, 10, 0, 9, 8, 1, 12], weights := [0, 1, 0, 0] }
  ]

def chunk14 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9924; original row 6068.
    { word := [8, 10, 0, 1, 8, 8, 12], weights := [0, 1, 0, 0] },
    -- Representative 9925; original row 6108.
    { word := [8, 10, 0, 9, 8, 8, 12], weights := [0, 1, 0, 0] }
  ]

def chunk15 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9926; original row 4652.
    { word := [8, 1, 12, 10, 0, 12, 8], weights := [1, 0, 1, 1] },
    -- Representative 9927; original row 4559.
    { word := [8, 1, 4, 10, 0, 12, 8], weights := [1, 0, 1, 1] }
  ]

def chunk16 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9928; original row 6151.
    { word := [8, 10, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] },
    -- Representative 9929; original row 6143.
    { word := [8, 10, 0, 12, 2, 0, 12], weights := [1, 1, 0, 1] }
  ]

def chunk17 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9930; original row 4683.
    { word := [8, 2, 0, 2, 0, 8, 9], weights := [1, 2, 0, 1] },
    -- Representative 9931; original row 4789.
    { word := [8, 2, 2, 2, 8, 8, 9], weights := [1, 0, 0, 1] }
  ]

def chunk18 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9932; original row 4950.
    { word := [8, 2, 10, 2, 8, 8, 9], weights := [1, 0, 0, 1] },
    -- Representative 9933; original row 4989.
    { word := [8, 2, 10, 10, 8, 8, 9], weights := [1, 0, 0, 1] }
  ]

def chunk19 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9934; original row 4834.
    { word := [8, 2, 2, 10, 8, 8, 9], weights := [1, 0, 0, 1] },
    -- Representative 9935; original row 4766.
    { word := [8, 2, 2, 2, 0, 8, 9], weights := [1, 0, 0, 1] }
  ]

def chunk20 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9936; original row 4934.
    { word := [8, 2, 10, 2, 0, 8, 9], weights := [1, 0, 0, 1] },
    -- Representative 9937; original row 4967.
    { word := [8, 2, 10, 10, 0, 8, 9], weights := [1, 0, 0, 1] }
  ]

def chunk21 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9938; original row 4805.
    { word := [8, 2, 2, 10, 0, 8, 9], weights := [1, 0, 0, 1] },
    -- Representative 9939; original row 4856.
    { word := [8, 2, 8, 2, 0, 8, 9], weights := [1, 0, 0, 1] }
  ]

def chunk22 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9940; original row 4897.
    { word := [8, 2, 8, 10, 0, 8, 9], weights := [1, 0, 0, 1] },
    -- Representative 9941; original row 4733.
    { word := [8, 2, 0, 10, 0, 8, 9], weights := [1, 0, 0, 1] }
  ]

def chunk23 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9942; original row 4790.
    { word := [8, 2, 2, 2, 8, 8, 10], weights := [1, 0, 0, 1] },
    -- Representative 9943; original row 4951.
    { word := [8, 2, 10, 2, 8, 8, 10], weights := [1, 0, 0, 1] }
  ]

def chunk24 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9944; original row 4990.
    { word := [8, 2, 10, 10, 8, 8, 10], weights := [1, 0, 0, 1] },
    -- Representative 9945; original row 4835.
    { word := [8, 2, 2, 10, 8, 8, 10], weights := [1, 0, 0, 1] }
  ]

def chunk25 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9946; original row 4791.
    { word := [8, 2, 2, 2, 8, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 9947; original row 4952.
    { word := [8, 2, 10, 2, 8, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk26 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9948; original row 4991.
    { word := [8, 2, 10, 10, 8, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 9949; original row 4836.
    { word := [8, 2, 2, 10, 8, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk27 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9950; original row 4868.
    { word := [8, 2, 8, 2, 8, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 9951; original row 4912.
    { word := [8, 2, 8, 10, 8, 8, 12], weights := [0, 1, 0, 0] }
  ]

def chunk28 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9952; original row 4740.
    { word := [8, 2, 0, 10, 8, 8, 12], weights := [0, 1, 0, 0] },
    -- Representative 9953; original row 4767.
    { word := [8, 2, 2, 2, 0, 8, 10], weights := [1, 0, 0, 1] }
  ]

def chunk29 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9954; original row 4935.
    { word := [8, 2, 10, 2, 0, 8, 10], weights := [1, 0, 0, 1] },
    -- Representative 9955; original row 4968.
    { word := [8, 2, 10, 10, 0, 8, 10], weights := [1, 0, 0, 1] }
  ]

def chunk30 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9956; original row 4806.
    { word := [8, 2, 2, 10, 0, 8, 10], weights := [1, 0, 0, 1] },
    -- Representative 9957; original row 4857.
    { word := [8, 2, 8, 2, 0, 8, 10], weights := [1, 0, 0, 1] }
  ]

def chunk31 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9958; original row 4898.
    { word := [8, 2, 8, 10, 0, 8, 10], weights := [1, 0, 0, 1] },
    -- Representative 9959; original row 4734.
    { word := [8, 2, 0, 10, 0, 8, 12], weights := [1, 0, 0, 1] }
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

end FranklSmallCyclic.OrbitBatches.P10.B007.Data
