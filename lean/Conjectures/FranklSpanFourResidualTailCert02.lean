module

public import Conjectures.FranklSpanFourResidualTailChunks
public import Conjectures.FranklSpanFourResidualTailData

/-! Complete bounded exterior chunks for original width-five witness 02. -/
@[expose] public section

namespace FranklSpanFour.Assembly.ResidualTail.Certificate02

set_option maxRecDepth 65536
set_option maxHeartbeats 4000000

private def chunks : List (List ℕ) := [
  [0, 2, 4, 6],
  [256, 258, 260, 262],
  [512, 514, 516, 518],
  [768, 770, 772, 774],
  [1024, 1026, 1028, 1030],
  [1280, 1282, 1284, 1286],
  [1536, 1538, 1540, 1542],
  [1792, 1794, 1796, 1798]
]

private theorem checkedInfo :
    metadataCheck (entries[2]!) = true ∧ positiveCheck (entries[2]!) = true ∧
      chunks.flatten = outside (entries[2]!) := by
  decide +kernel

private theorem checked0 :
    chunkCheck (entries[2]!) [0, 2, 4, 6] = true := by
  decide +kernel

private theorem checked1 :
    chunkCheck (entries[2]!) [256, 258, 260, 262] = true := by
  decide +kernel

private theorem checked2 :
    chunkCheck (entries[2]!) [512, 514, 516, 518] = true := by
  decide +kernel

private theorem checked3 :
    chunkCheck (entries[2]!) [768, 770, 772, 774] = true := by
  decide +kernel

private theorem checked4 :
    chunkCheck (entries[2]!) [1024, 1026, 1028, 1030] = true := by
  decide +kernel

private theorem checked5 :
    chunkCheck (entries[2]!) [1280, 1282, 1284, 1286] = true := by
  decide +kernel

private theorem checked6 :
    chunkCheck (entries[2]!) [1536, 1538, 1540, 1542] = true := by
  decide +kernel

private theorem checked7 :
    chunkCheck (entries[2]!) [1792, 1794, 1796, 1798] = true := by
  decide +kernel

theorem checked : entryCheck (entries[2]!) = true := by
  apply entryCheck_of_chunks checkedInfo.1 checkedInfo.2.1 checkedInfo.2.2
  simp only [chunks, List.all_cons, List.all_nil, checked0, checked1, checked2, checked3, checked4, checked5, checked6, checked7,
    Bool.true_and]

end FranklSpanFour.Assembly.ResidualTail.Certificate02
