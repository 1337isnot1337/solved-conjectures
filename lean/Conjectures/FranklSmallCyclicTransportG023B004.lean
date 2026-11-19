module

public import Conjectures.FranklSmallCyclicTransportG023B004Data
public import Conjectures.FranklSmallCyclicOrbit7Block023

/-! Literal source entries reuse their existing proof directly.
Other targets use the finite injective mask-transport theorem.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G023.B004

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked0 : Weights.entryCheck 8 Data.target0 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source0) (points := Data.points0)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B023.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt_mem ⟨47, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked1 : Weights.entryCheck 8 Data.target1 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source1) (points := Data.points1)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B023.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt_mem ⟨60, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked2 : Weights.entryCheck 8 Data.target2 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source2) (points := Data.points2)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B023.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt_mem ⟨48, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked3 : Weights.entryCheck 8 Data.target3 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source3) (points := Data.points3)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B023.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt_mem ⟨65, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked4 : Weights.entryCheck 8 Data.target4 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source4) (points := Data.points4)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B023.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt_mem ⟨57, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked5 : Weights.entryCheck 8 Data.target5 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source5) (points := Data.points5)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B023.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt_mem ⟨46, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked6 : Weights.entryCheck 8 Data.target6 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source6) (points := Data.points6)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B023.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt_mem ⟨66, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked7 : Weights.entryCheck 9 Data.target7 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source7) (points := Data.points7)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B023.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt_mem ⟨93, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked8 : Weights.entryCheck 9 Data.target8 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source8) (points := Data.points8)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B023.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt_mem ⟨64, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked9 : Weights.entryCheck 9 Data.target9 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source9) (points := Data.points9)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B023.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt_mem ⟨93, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked10 : Weights.entryCheck 9 Data.target10 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source10) (points := Data.points10)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B023.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt_mem ⟨64, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked11 : Weights.entryCheck 9 Data.target11 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source11) (points := Data.points11)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B023.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt_mem ⟨93, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked12 : Weights.entryCheck 9 Data.target12 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source12) (points := Data.points12)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B023.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt_mem ⟨64, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked13 : Weights.entryCheck 10 Data.target13 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source13) (points := Data.points13)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B023.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt_mem ⟨93, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked14 : Weights.entryCheck 10 Data.target14 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source14) (points := Data.points14)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B023.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt_mem ⟨64, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked15 : Weights.entryCheck 10 Data.target15 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source15) (points := Data.points15)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B023.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt_mem ⟨93, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked16 : Weights.entryCheck 10 Data.target16 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source16) (points := Data.points16)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B023.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt_mem ⟨64, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked17 : Weights.entryCheck 10 Data.target17 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source17) (points := Data.points17)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B023.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt_mem ⟨93, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked18 : Weights.entryCheck 10 Data.target18 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source18) (points := Data.points18)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B023.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt_mem ⟨64, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period8_checked :
    Weights.batchCheck 8 Data.period8Entries = true := by
  simp only [Data.period8Entries, Weights.batchCheck, List.all_cons, List.all_nil,
    checked0, checked1, checked2, checked3, checked4, checked5, checked6, Bool.true_and]

theorem period8_chunk_checked :
    Weights.batchCheck 8 (Data.period8Chunk.rows.map RowCoverage.TaggedRow.entry) = true := by
  rw [Data.period8Chunk_entries]
  exact period8_checked

theorem period8_each_checked {entry : Weights.Entry}
    (he : entry ∈ Data.period8Entries) :
    MaskWindows.windowCheck 8 (Weights.shapeWord entry) (Weights.siteWeights entry) = true :=
  Weights.batchCheck_entry period8_checked he

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period9_checked :
    Weights.batchCheck 9 Data.period9Entries = true := by
  simp only [Data.period9Entries, Weights.batchCheck, List.all_cons, List.all_nil,
    checked7, checked8, checked9, checked10, checked11, checked12, Bool.true_and]

theorem period9_chunk_checked :
    Weights.batchCheck 9 (Data.period9Chunk.rows.map RowCoverage.TaggedRow.entry) = true := by
  rw [Data.period9Chunk_entries]
  exact period9_checked

theorem period9_each_checked {entry : Weights.Entry}
    (he : entry ∈ Data.period9Entries) :
    MaskWindows.windowCheck 9 (Weights.shapeWord entry) (Weights.siteWeights entry) = true :=
  Weights.batchCheck_entry period9_checked he

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period10_checked :
    Weights.batchCheck 10 Data.period10Entries = true := by
  simp only [Data.period10Entries, Weights.batchCheck, List.all_cons, List.all_nil,
    checked13, checked14, checked15, checked16, checked17, checked18, Bool.true_and]

theorem period10_chunk_checked :
    Weights.batchCheck 10 (Data.period10Chunk.rows.map RowCoverage.TaggedRow.entry) = true := by
  rw [Data.period10Chunk_entries]
  exact period10_checked

theorem period10_each_checked {entry : Weights.Entry}
    (he : entry ∈ Data.period10Entries) :
    MaskWindows.windowCheck 10 (Weights.shapeWord entry) (Weights.siteWeights entry) = true :=
  Weights.batchCheck_entry period10_checked he

end FranklSmallCyclic.TransportBatches.G023.B004
