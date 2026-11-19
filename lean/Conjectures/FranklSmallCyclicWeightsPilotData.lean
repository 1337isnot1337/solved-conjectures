module

public import Conjectures.FranklSmallCyclicWeights

/-! Generated representative rows from the original public width-four finder.
The input is candidate data. Period-specific batch theorems check the actual
modulo-n generator families through the verified window semantics.

Canonical complete-input SHA256: 5594610818abd7f41c76121924259bd1a9a1f86417da91dce2c0f8171bcceb6a
-/
@[expose] public section

namespace FranklSmallCyclic.Weights.Pilot

def sourceIndices : List ℕ := [0, 143, 224, 288, 469, 1553, 3447, 3506, 6030, 6279, 7962, 8172, 8307, 8361, 9045, 9087]

def chunk0 : List Entry :=
  [
    -- Original zero-based row 0.
    { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] },
    -- Original zero-based row 143.
    { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }
  ]

def chunk1 : List Entry :=
  [
    -- Original zero-based row 224.
    { word := [0, 1, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] },
    -- Original zero-based row 288.
    { word := [0, 1, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk2 : List Entry :=
  [
    -- Original zero-based row 469.
    { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] },
    -- Original zero-based row 1553.
    { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }
  ]

def chunk3 : List Entry :=
  [
    -- Original zero-based row 3447.
    { word := [4, 0, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] },
    -- Original zero-based row 3506.
    { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }
  ]

def chunk4 : List Entry :=
  [
    -- Original zero-based row 6030.
    { word := [8, 9, 8, 9, 12, 12, 12], weights := [1, 1, 1, 1] },
    -- Original zero-based row 6279.
    { word := [8, 10, 8, 10, 8, 12, 12], weights := [0, 3, 0, 1] }
  ]

def chunk5 : List Entry :=
  [
    -- Original zero-based row 7962.
    { word := [10, 8, 4, 10, 8, 12, 12], weights := [2, 2, 1, 3] },
    -- Original zero-based row 8172.
    { word := [10, 8, 12, 10, 8, 12, 12], weights := [2, 1, 1, 2] }
  ]

def chunk6 : List Entry :=
  [
    -- Original zero-based row 8307.
    { word := [10, 10, 8, 9, 8, 9, 12], weights := [1, 1, 0, 1] },
    -- Original zero-based row 8361.
    { word := [10, 10, 8, 12, 8, 12, 10], weights := [2, 1, 2, 1] }
  ]

def chunk7 : List Entry :=
  [
    -- Original zero-based row 9045.
    { word := [12, 10, 8, 10, 8, 12, 12], weights := [1, 2, 1, 2] },
    -- Original zero-based row 9087.
    { word := [12, 12, 12, 8, 8, 10, 10], weights := [0, 1, 1, 0] }
  ]

def entries : List Entry :=
  chunk0 ++ chunk1 ++ chunk2 ++ chunk3 ++ chunk4 ++ chunk5 ++ chunk6 ++ chunk7

end FranklSmallCyclic.Weights.Pilot
