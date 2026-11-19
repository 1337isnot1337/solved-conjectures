module

public import Conjectures.FranklSmallCyclicOrbit10Block006Data

/-! Arithmetic for one bounded representative block. The checked conclusion
is the existing Weights.batchCheck predicate for the actual period 10. -/
@[expose] public section

namespace FranklSmallCyclic.OrbitBatches.P10.B006

open FranklSmallCyclic OrbitArithmetic

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked0 : cachedBatchCheck 10 Data.chunk0 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked1 : cachedBatchCheck 10 Data.chunk1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked2 : cachedBatchCheck 10 Data.chunk2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked3 : cachedBatchCheck 10 Data.chunk3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked4 : cachedBatchCheck 10 Data.chunk4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked5 : cachedBatchCheck 10 Data.chunk5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked6 : cachedBatchCheck 10 Data.chunk6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked7 : cachedBatchCheck 10 Data.chunk7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked8 : cachedBatchCheck 10 Data.chunk8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked9 : cachedBatchCheck 10 Data.chunk9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked10 : cachedBatchCheck 10 Data.chunk10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked11 : cachedBatchCheck 10 Data.chunk11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked12 : cachedBatchCheck 10 Data.chunk12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked13 : cachedBatchCheck 10 Data.chunk13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked14 : cachedBatchCheck 10 Data.chunk14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked15 : cachedBatchCheck 10 Data.chunk15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked16 : cachedBatchCheck 10 Data.chunk16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked17 : cachedBatchCheck 10 Data.chunk17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked18 : cachedBatchCheck 10 Data.chunk18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked19 : cachedBatchCheck 10 Data.chunk19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked20 : cachedBatchCheck 10 Data.chunk20 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked21 : cachedBatchCheck 10 Data.chunk21 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked22 : cachedBatchCheck 10 Data.chunk22 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked23 : cachedBatchCheck 10 Data.chunk23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked24 : cachedBatchCheck 10 Data.chunk24 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked25 : cachedBatchCheck 10 Data.chunk25 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked26 : cachedBatchCheck 10 Data.chunk26 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked27 : cachedBatchCheck 10 Data.chunk27 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked28 : cachedBatchCheck 10 Data.chunk28 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked29 : cachedBatchCheck 10 Data.chunk29 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked30 : cachedBatchCheck 10 Data.chunk30 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked31 : cachedBatchCheck 10 Data.chunk31 = true := by
  decide +kernel

theorem cached_checked : cachedBatchCheck 10 Data.entries = true := by
  simp only [Data.entries, cachedBatchCheck_append, checked0, checked1, checked2, checked3, checked4, checked5, checked6, checked7, checked8, checked9, checked10, checked11, checked12, checked13, checked14, checked15, checked16, checked17, checked18, checked19, checked20, checked21, checked22, checked23, checked24, checked25, checked26, checked27, checked28, checked29, checked30, checked31, Bool.true_and]

theorem checked : Weights.batchCheck 10 Data.entries = true :=
  cachedBatchCheck_sound cached_checked

theorem entry_checked {entry : Weights.Entry} (he : entry ∈ Data.entries) :
    Weights.entryCheck 10 entry = true :=
  List.all_eq_true.mp checked entry he

theorem entryAt_checked (index : Fin 64) :
    Weights.entryCheck 10 (Data.entryAt index) = true :=
  entry_checked (Data.entryAt_mem index)

theorem window_checked {entry : Weights.Entry} (he : entry ∈ Data.entries) :
    MaskWindows.windowCheck 10 (Weights.shapeWord entry) (Weights.siteWeights entry) = true :=
  Weights.batchCheck_entry checked he

end FranklSmallCyclic.OrbitBatches.P10.B006
