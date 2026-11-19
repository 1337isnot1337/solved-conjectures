module

public import Conjectures.FranklSpanFourResidualTailChunks
public import Conjectures.FranklSpanFourResidualTailData

/-! Complete bounded exterior chunks for original width-five witness 27. -/
@[expose] public section

namespace FranklSpanFour.Assembly.ResidualTail.Certificate27

set_option maxRecDepth 65536
set_option maxHeartbeats 4000000

private def chunks : List (List ℕ) := [
  [0, 1, 2, 3],
  [4, 5, 6, 7],
  [256, 257, 258, 259],
  [260, 261, 262, 263],
  [512, 513, 514, 515],
  [516, 517, 518, 519],
  [768, 769, 770, 771],
  [772, 773, 774, 775],
  [1024, 1025, 1026, 1027],
  [1028, 1029, 1030, 1031],
  [1280, 1281, 1282, 1283],
  [1284, 1285, 1286, 1287],
  [1536, 1537, 1538, 1539],
  [1540, 1541, 1542, 1543],
  [1792, 1793, 1794, 1795],
  [1796, 1797, 1798, 1799]
]

private theorem checkedInfo :
    metadataCheck (entries[27]!) = true ∧ positiveCheck (entries[27]!) = true ∧
      chunks.flatten = outside (entries[27]!) := by
  decide +kernel

private theorem checked0 :
    chunkCheck (entries[27]!) [0, 1, 2, 3] = true := by
  decide +kernel

private theorem checked1 :
    chunkCheck (entries[27]!) [4, 5, 6, 7] = true := by
  decide +kernel

private theorem checked2 :
    chunkCheck (entries[27]!) [256, 257, 258, 259] = true := by
  decide +kernel

private theorem checked3 :
    chunkCheck (entries[27]!) [260, 261, 262, 263] = true := by
  decide +kernel

private theorem checked4 :
    chunkCheck (entries[27]!) [512, 513, 514, 515] = true := by
  decide +kernel

private theorem checked5 :
    chunkCheck (entries[27]!) [516, 517, 518, 519] = true := by
  decide +kernel

private theorem checked6 :
    chunkCheck (entries[27]!) [768, 769, 770, 771] = true := by
  decide +kernel

private theorem checked7 :
    chunkCheck (entries[27]!) [772, 773, 774, 775] = true := by
  decide +kernel

private theorem checked8 :
    chunkCheck (entries[27]!) [1024, 1025, 1026, 1027] = true := by
  decide +kernel

private theorem checked9 :
    chunkCheck (entries[27]!) [1028, 1029, 1030, 1031] = true := by
  decide +kernel

private theorem checked10 :
    chunkCheck (entries[27]!) [1280, 1281, 1282, 1283] = true := by
  decide +kernel

private theorem checked11 :
    chunkCheck (entries[27]!) [1284, 1285, 1286, 1287] = true := by
  decide +kernel

private theorem checked12 :
    chunkCheck (entries[27]!) [1536, 1537, 1538, 1539] = true := by
  decide +kernel

private theorem checked13 :
    chunkCheck (entries[27]!) [1540, 1541, 1542, 1543] = true := by
  decide +kernel

private theorem checked14 :
    chunkCheck (entries[27]!) [1792, 1793, 1794, 1795] = true := by
  decide +kernel

private theorem checked15 :
    chunkCheck (entries[27]!) [1796, 1797, 1798, 1799] = true := by
  decide +kernel

theorem checked : entryCheck (entries[27]!) = true := by
  apply entryCheck_of_chunks checkedInfo.1 checkedInfo.2.1 checkedInfo.2.2
  simp only [chunks, List.all_cons, List.all_nil, checked0, checked1, checked2, checked3, checked4, checked5, checked6, checked7, checked8, checked9, checked10, checked11, checked12, checked13, checked14, checked15,
    Bool.true_and]

end FranklSpanFour.Assembly.ResidualTail.Certificate27
