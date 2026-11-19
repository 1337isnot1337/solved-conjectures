module

public import Conjectures.FranklSmallCyclicWeightsPilotData

/-! Every row is checked on the literal period-7 quotient.
No native replay result or external count is a theorem premise. -/
@[expose] public section

namespace FranklSmallCyclic.Weights.Period7Pilot

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked0 : batchCheck 7 Pilot.chunk0 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked1 : batchCheck 7 Pilot.chunk1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked2 : batchCheck 7 Pilot.chunk2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked3 : batchCheck 7 Pilot.chunk3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked4 : batchCheck 7 Pilot.chunk4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked5 : batchCheck 7 Pilot.chunk5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked6 : batchCheck 7 Pilot.chunk6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked7 : batchCheck 7 Pilot.chunk7 = true := by
  decide +kernel

theorem checked : batchCheck 7 Pilot.entries = true := by
  have hjoin (left right : List Entry) :
      batchCheck 7 (left ++ right) = (batchCheck 7 left && batchCheck 7 right) := by
    simp only [batchCheck, List.all_append]
  simp only [Pilot.entries, hjoin, checked0, checked1, checked2, checked3, checked4, checked5, checked6, checked7, Bool.true_and]

theorem each_checked {e : Entry} (he : e ∈ Pilot.entries) :
    MaskWindows.windowCheck 7 (shapeWord e) (siteWeights e) = true :=
  batchCheck_entry checked he

end FranklSmallCyclic.Weights.Period7Pilot
