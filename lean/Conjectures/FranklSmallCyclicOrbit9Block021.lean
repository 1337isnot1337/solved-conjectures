module

public import Conjectures.FranklSmallCyclicOrbit9Block021Data

/-! Arithmetic for one bounded representative block. The checked conclusion
is the existing Weights.batchCheck predicate for the actual period 9. -/
@[expose] public section

namespace FranklSmallCyclic.OrbitBatches.P9.B021

open FranklSmallCyclic OrbitArithmetic

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked0 : cachedBatchCheck 9 Data.chunk0 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked1 : cachedBatchCheck 9 Data.chunk1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked2 : cachedBatchCheck 9 Data.chunk2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked3 : cachedBatchCheck 9 Data.chunk3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked4 : cachedBatchCheck 9 Data.chunk4 = true := by
  decide +kernel

theorem cached_checked : cachedBatchCheck 9 Data.entries = true := by
  simp only [Data.entries, cachedBatchCheck_append, checked0, checked1, checked2, checked3, checked4, Bool.true_and]

theorem checked : Weights.batchCheck 9 Data.entries = true :=
  cachedBatchCheck_sound cached_checked

theorem entry_checked {entry : Weights.Entry} (he : entry ∈ Data.entries) :
    Weights.entryCheck 9 entry = true :=
  List.all_eq_true.mp checked entry he

theorem entryAt_checked (index : Fin 9) :
    Weights.entryCheck 9 (Data.entryAt index) = true :=
  entry_checked (Data.entryAt_mem index)

theorem window_checked {entry : Weights.Entry} (he : entry ∈ Data.entries) :
    MaskWindows.windowCheck 9 (Weights.shapeWord entry) (Weights.siteWeights entry) = true :=
  Weights.batchCheck_entry checked he

end FranklSmallCyclic.OrbitBatches.P9.B021
