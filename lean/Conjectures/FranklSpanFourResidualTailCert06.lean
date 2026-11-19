module

public import Conjectures.FranklSpanFourResidualTailChunks
public import Conjectures.FranklSpanFourResidualTailData

/-! Complete bounded exterior chunks for original width-five witness 06. -/
@[expose] public section

namespace FranklSpanFour.Assembly.ResidualTail.Certificate06

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
  [772, 773, 774, 775]
]

private theorem checkedInfo :
    metadataCheck (entries[6]!) = true ∧ positiveCheck (entries[6]!) = true ∧
      chunks.flatten = outside (entries[6]!) := by
  decide +kernel

private theorem checked0 :
    chunkCheck (entries[6]!) [0, 1, 2, 3] = true := by
  decide +kernel

private theorem checked1 :
    chunkCheck (entries[6]!) [4, 5, 6, 7] = true := by
  decide +kernel

private theorem checked2 :
    chunkCheck (entries[6]!) [256, 257, 258, 259] = true := by
  decide +kernel

private theorem checked3 :
    chunkCheck (entries[6]!) [260, 261, 262, 263] = true := by
  decide +kernel

private theorem checked4 :
    chunkCheck (entries[6]!) [512, 513, 514, 515] = true := by
  decide +kernel

private theorem checked5 :
    chunkCheck (entries[6]!) [516, 517, 518, 519] = true := by
  decide +kernel

private theorem checked6 :
    chunkCheck (entries[6]!) [768, 769, 770, 771] = true := by
  decide +kernel

private theorem checked7 :
    chunkCheck (entries[6]!) [772, 773, 774, 775] = true := by
  decide +kernel

theorem checked : entryCheck (entries[6]!) = true := by
  apply entryCheck_of_chunks checkedInfo.1 checkedInfo.2.1 checkedInfo.2.2
  simp only [chunks, List.all_cons, List.all_nil, checked0, checked1, checked2, checked3, checked4, checked5, checked6, checked7,
    Bool.true_and]

end FranklSpanFour.Assembly.ResidualTail.Certificate06
