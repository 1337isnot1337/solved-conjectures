module

public import Conjectures.FranklSpanFourGraphMasks

/-! Fixed occurrence patterns. Their semantic checks below use Lean's
kernel reduction; the Python geometry is only a witness producer. -/
@[expose] public section

namespace FranklSpanFour.Graph.LocalData

def patterns : List ℕ := [7, 11, 13, 14, 19, 21, 22, 25, 26, 28, 35, 37, 49, 50, 52, 67, 70, 81, 82, 84, 97, 98, 112, 176, 208, 224, 261, 262, 273, 274, 276, 289, 292, 304, 322, 324, 336, 352, 400, 416, 448, 517, 518, 529, 530, 532, 545, 548, 560, 578, 580, 592, 769, 770, 772, 784, 800, 832, 1029, 1041, 1044, 1057, 1060, 1072, 1120, 1281, 1284, 1296, 1312, 1344, 1537, 1540, 1552, 1568, 1792, 2816, 3328, 3584, 4102, 4114, 4116, 4162, 4164, 4176, 4192, 4354, 4356, 4368, 4384, 4416, 4610, 4612, 4624, 4672, 4864, 5152, 5184, 5376, 5632, 6400, 6656, 7168, 8198, 8210, 8212, 8258, 8260, 8272, 8288, 8450, 8452, 8464, 8480, 8512, 8706, 8708, 8720, 8768, 8960, 9248, 9280, 9472, 12290, 12292, 12304, 12320, 12352, 12544, 12800, 13312, 16390, 16402, 16404, 16450, 16452, 16464, 16642, 16644, 16656, 16704, 16898, 16900, 16912, 16960, 17152, 17920, 20482, 20484, 20496, 20544, 20736, 20992, 21504, 24578, 24580, 24592, 24640, 24832, 25088, 28672, 45056, 53248, 57344]

def pairRows : List PairRow :=
  [
    { shape := 0, x := 3, y := 4, forbidden := 15728640 },
    { shape := 0, x := 3, y := 5, forbidden := 262176 },
    { shape := 0, x := 4, y := 5, forbidden := 30 },
    { shape := 1, x := 3, y := 4, forbidden := 263192576 },
    { shape := 1, x := 3, y := 6, forbidden := 132128 },
    { shape := 1, x := 4, y := 6, forbidden := 542 },
    { shape := 2, x := 3, y := 5, forbidden := 251920384 },
    { shape := 2, x := 3, y := 6, forbidden := 4326400 },
    { shape := 2, x := 5, y := 6, forbidden := 478 },
    { shape := 3, x := 3, y := 4, forbidden := 267386880 },
    { shape := 3, x := 3, y := 5, forbidden := 251920416 },
    { shape := 3, x := 3, y := 6, forbidden := 4326432 },
    { shape := 3, x := 4, y := 5, forbidden := 251658270 },
    { shape := 3, x := 4, y := 6, forbidden := 4194846 },
    { shape := 3, x := 5, y := 6, forbidden := 510 }
  ]

set_option maxRecDepth 65536 in
set_option maxHeartbeats 0 in
theorem patterns_checked : patternMetadataCheck patterns = true := by
  decide +kernel

set_option maxRecDepth 65536 in
set_option maxHeartbeats 0 in
theorem pairRows_checked : pairMetadataCheck pairRows = true := by
  decide +kernel

theorem pair_prune_sound (a : ℕ) (hc : pairMaskCheck pairRows a = true) :
    FranklCyclic.windowPairCheck (wordOfCode 7 a) = true :=
  pairMaskCheck_sound pairRows_checked a hc

end FranklSpanFour.Graph.LocalData
