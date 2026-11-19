module

public import Conjectures.FranklSmallCyclicWeightsPilotData

/-! Every row is checked on the literal period-8 quotient.
No native replay result or external count is a theorem premise. -/
@[expose] public section

namespace FranklSmallCyclic.Weights.Period8Pilot

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked0 : batchCheck 8 Pilot.chunk0 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked1 : batchCheck 8 Pilot.chunk1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked2 : batchCheck 8 Pilot.chunk2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked3 : batchCheck 8 Pilot.chunk3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked4 : batchCheck 8 Pilot.chunk4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked5 : batchCheck 8 Pilot.chunk5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked6 : batchCheck 8 Pilot.chunk6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked7 : batchCheck 8 Pilot.chunk7 = true := by
  decide +kernel

theorem checked : batchCheck 8 Pilot.entries = true := by
  have hjoin (left right : List Entry) :
      batchCheck 8 (left ++ right) = (batchCheck 8 left && batchCheck 8 right) := by
    simp only [batchCheck, List.all_append]
  simp only [Pilot.entries, hjoin, checked0, checked1, checked2, checked3, checked4, checked5, checked6, checked7, Bool.true_and]

theorem each_checked {e : Entry} (he : e ∈ Pilot.entries) :
    MaskWindows.windowCheck 8 (shapeWord e) (siteWeights e) = true :=
  batchCheck_entry checked he

end FranklSmallCyclic.Weights.Period8Pilot
