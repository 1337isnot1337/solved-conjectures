module
public import Conjectures.LassalleFiniteRowBatching

@[expose] public section
namespace LassalleRefinement

set_option maxRecDepth 24000 in
set_option maxHeartbeats 0 in
private theorem row_40_checked : rowTriplesStrict (candidateRow 40) = true := by
  decide +kernel

set_option maxRecDepth 24000 in
set_option maxHeartbeats 0 in
private theorem row_41_checked : rowTriplesStrict (candidateRow 41) = true := by
  decide +kernel

set_option maxRecDepth 24000 in
set_option maxHeartbeats 0 in
private theorem row_42_checked : rowTriplesStrict (candidateRow 42) = true := by
  decide +kernel

theorem small_rows_04 : candidateRowsChecked 40 43 := by
  apply candidateRowsChecked_of_pointwise
  intro k hLow hHigh
  have h : k = 40 ∨ k = 41 ∨ k = 42 := by omega
  rcases h with rfl | rfl | rfl
  · exact row_40_checked
  · exact row_41_checked
  · exact row_42_checked

end LassalleRefinement
