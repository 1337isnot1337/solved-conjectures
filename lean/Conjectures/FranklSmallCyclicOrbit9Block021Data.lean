module

public import Conjectures.FranklSmallCyclicOrbitArithmetic

/-! Generated arithmetic block for period 9. Distinct representative IDs
and original candidate rows are recorded in the companion input manifest.
Orbit packet SHA256: 0994809d949f2eb51a6fa9a4899e60b87476a7fe0479bd428f4280ccd801bd6c
-/
@[expose] public section

namespace FranklSmallCyclic.OrbitBatches.P9.B021.Data

def representativeIds : List ℕ := [9439, 9440, 9441, 9442, 9443, 9444, 9445, 9446, 9447]

def sourceRows : List ℕ := [816, 1618, 1726, 1554, 1568, 619, 727, 555, 569]

def chunk0 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9439; original row 816.
    { word := [0, 8, 0, 4, 2, 0, 8], weights := [0, 0, 1, 0] },
    -- Representative 9440; original row 1618.
    { word := [0, 12, 4, 4, 8, 0, 8], weights := [1, 0, 1, 0] }
  ]

def chunk1 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9441; original row 1726.
    { word := [0, 12, 12, 4, 8, 0, 8], weights := [1, 0, 1, 0] },
    -- Representative 9442; original row 1554.
    { word := [0, 12, 2, 0, 1, 0, 8], weights := [0, 1, 0, 1] }
  ]

def chunk2 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9443; original row 1568.
    { word := [0, 12, 2, 0, 9, 0, 8], weights := [0, 1, 0, 1] },
    -- Representative 9444; original row 619.
    { word := [0, 4, 4, 4, 8, 0, 8], weights := [1, 0, 1, 0] }
  ]

def chunk3 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9445; original row 727.
    { word := [0, 4, 12, 4, 8, 0, 8], weights := [1, 0, 1, 0] },
    -- Representative 9446; original row 555.
    { word := [0, 4, 2, 0, 1, 0, 8], weights := [0, 1, 0, 1] }
  ]

def chunk4 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 9447; original row 569.
    { word := [0, 4, 2, 0, 9, 0, 8], weights := [0, 1, 0, 1] }
  ]

def entries : List FranklSmallCyclic.Weights.Entry :=
  chunk0 ++ chunk1 ++ chunk2 ++ chunk3 ++ chunk4

theorem representativeIds_length : representativeIds.length = 9 := by decide +kernel

theorem sourceRows_length : sourceRows.length = 9 := by decide +kernel

theorem entries_length : entries.length = 9 := by decide +kernel

theorem representativeIds_nodup : representativeIds.Nodup := by decide +kernel

def entryAt (index : Fin 9) : FranklSmallCyclic.Weights.Entry :=
  entries.get ⟨index.val, by simpa only [entries_length] using index.isLt⟩

theorem entryAt_mem (index : Fin 9) : entryAt index ∈ entries :=
  List.get_mem _ _

end FranklSmallCyclic.OrbitBatches.P9.B021.Data
