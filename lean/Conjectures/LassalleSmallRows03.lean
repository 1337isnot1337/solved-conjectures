module
public import Conjectures.LassalleFiniteRowBatching

@[expose] public section
namespace LassalleRefinement

set_option maxRecDepth 24000 in
set_option maxHeartbeats 0 in
private theorem row_36_checked : rowTriplesStrict (candidateRow 36) = true := by
  decide +kernel

set_option maxRecDepth 24000 in
set_option maxHeartbeats 0 in
private theorem row_37_checked : rowTriplesStrict (candidateRow 37) = true := by
  decide +kernel

set_option maxRecDepth 24000 in
set_option maxHeartbeats 0 in
private theorem row_38_checked : rowTriplesStrict (candidateRow 38) = true := by
  decide +kernel

set_option maxRecDepth 24000 in
set_option maxHeartbeats 0 in
private theorem row_39_checked : rowTriplesStrict (candidateRow 39) = true := by
  decide +kernel

theorem small_rows_03 : candidateRowsChecked 36 40 := by
  apply candidateRowsChecked_of_pointwise
  intro k hLow hHigh
  have h : k = 36 ∨ k = 37 ∨ k = 38 ∨ k = 39 := by omega
  rcases h with rfl | rfl | rfl | rfl
  · exact row_36_checked
  · exact row_37_checked
  · exact row_38_checked
  · exact row_39_checked

end LassalleRefinement
