module
public import Conjectures.LassalleFiniteRowBatching

@[expose] public section
namespace LassalleRefinement

set_option maxRecDepth 24000 in
set_option maxHeartbeats 0 in
private theorem row_31_checked : rowTriplesStrict (candidateRow 31) = true := by
  decide +kernel

set_option maxRecDepth 24000 in
set_option maxHeartbeats 0 in
private theorem row_32_checked : rowTriplesStrict (candidateRow 32) = true := by
  decide +kernel

set_option maxRecDepth 24000 in
set_option maxHeartbeats 0 in
private theorem row_33_checked : rowTriplesStrict (candidateRow 33) = true := by
  decide +kernel

set_option maxRecDepth 24000 in
set_option maxHeartbeats 0 in
private theorem row_34_checked : rowTriplesStrict (candidateRow 34) = true := by
  decide +kernel

set_option maxRecDepth 24000 in
set_option maxHeartbeats 0 in
private theorem row_35_checked : rowTriplesStrict (candidateRow 35) = true := by
  decide +kernel

theorem small_rows_02 : candidateRowsChecked 31 36 := by
  apply candidateRowsChecked_of_pointwise
  intro k hLow hHigh
  have h : k = 31 ∨ k = 32 ∨ k = 33 ∨ k = 34 ∨ k = 35 := by omega
  rcases h with rfl | rfl | rfl | rfl | rfl
  · exact row_31_checked
  · exact row_32_checked
  · exact row_33_checked
  · exact row_34_checked
  · exact row_35_checked

end LassalleRefinement
