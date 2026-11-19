module

public import Conjectures.FranklSmallCyclicTransportG038B004Data
public import Conjectures.FranklSmallCyclicOrbit8Block012

/-! Literal source entries reuse their existing proof directly.
Other targets use the finite injective mask-transport theorem.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G038.B004

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked0 : Weights.entryCheck 10 Data.target0 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source0) (points := Data.points0)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B012.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt_mem ⟨61, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked1 : Weights.entryCheck 10 Data.target1 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source1) (points := Data.points1)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B012.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt_mem ⟨79, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked2 : Weights.entryCheck 10 Data.target2 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source2) (points := Data.points2)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B012.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt_mem ⟨53, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked3 : Weights.entryCheck 10 Data.target3 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source3) (points := Data.points3)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B012.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt_mem ⟨53, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked4 : Weights.entryCheck 10 Data.target4 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source4) (points := Data.points4)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B012.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt_mem ⟨48, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked5 : Weights.entryCheck 10 Data.target5 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source5) (points := Data.points5)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B012.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt_mem ⟨49, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked6 : Weights.entryCheck 10 Data.target6 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source6) (points := Data.points6)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B012.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt_mem ⟨86, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked7 : Weights.entryCheck 10 Data.target7 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source7) (points := Data.points7)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B012.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt_mem ⟨41, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked8 : Weights.entryCheck 10 Data.target8 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source8) (points := Data.points8)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B012.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt_mem ⟨41, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked9 : Weights.entryCheck 10 Data.target9 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source9) (points := Data.points9)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B012.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt_mem ⟨36, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked10 : Weights.entryCheck 10 Data.target10 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source10) (points := Data.points10)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B012.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt_mem ⟨37, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked11 : Weights.entryCheck 10 Data.target11 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source11) (points := Data.points11)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B012.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt_mem ⟨72, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked12 : Weights.entryCheck 10 Data.target12 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source12) (points := Data.points12)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B012.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt_mem ⟨25, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked13 : Weights.entryCheck 10 Data.target13 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source13) (points := Data.points13)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B012.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt_mem ⟨25, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked14 : Weights.entryCheck 10 Data.target14 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source14) (points := Data.points14)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B012.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt_mem ⟨20, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked15 : Weights.entryCheck 10 Data.target15 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source15) (points := Data.points15)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B012.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt_mem ⟨21, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period10_checked :
    Weights.batchCheck 10 Data.period10Entries = true := by
  simp only [Data.period10Entries, Weights.batchCheck, List.all_cons, List.all_nil,
    checked0, checked1, checked2, checked3, checked4, checked5, checked6, checked7, checked8, checked9, checked10, checked11, checked12, checked13, checked14, checked15, Bool.true_and]

theorem period10_chunk_checked :
    Weights.batchCheck 10 (Data.period10Chunk.rows.map RowCoverage.TaggedRow.entry) = true := by
  rw [Data.period10Chunk_entries]
  exact period10_checked

theorem period10_each_checked {entry : Weights.Entry}
    (he : entry ∈ Data.period10Entries) :
    MaskWindows.windowCheck 10 (Weights.shapeWord entry) (Weights.siteWeights entry) = true :=
  Weights.batchCheck_entry period10_checked he

end FranklSmallCyclic.TransportBatches.G038.B004
