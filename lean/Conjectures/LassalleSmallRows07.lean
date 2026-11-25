module
public import Conjectures.LassalleFiniteRowBatching

@[expose] public section
namespace LassalleRefinement

set_option maxRecDepth 24000 in
set_option maxHeartbeats 0 in
theorem small_rows_07 : candidateRowsChecked 45 46 := by
  unfold candidateRowsChecked
  decide +kernel

end LassalleRefinement
