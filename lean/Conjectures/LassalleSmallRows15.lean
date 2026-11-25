module
public import Conjectures.LassalleFiniteRowBatching

@[expose] public section
namespace LassalleRefinement

set_option maxRecDepth 24000 in
set_option maxHeartbeats 0 in
theorem small_rows_15 : candidateRowsChecked 53 54 := by
  unfold candidateRowsChecked
  decide +kernel

end LassalleRefinement
