module

public import Conjectures.FranklSmallCyclicTransportG021B004Data
public import Conjectures.FranklSmallCyclicOrbit7Block021

/-! Literal source entries reuse their existing proof directly.
Other targets use the finite injective mask-transport theorem.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G021.B004

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked0 : Weights.entryCheck 8 Data.target0 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source0) (points := Data.points0)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B021.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt_mem ⟨22, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked1 : Weights.entryCheck 8 Data.target1 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source1) (points := Data.points1)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B021.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt_mem ⟨29, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked2 : Weights.entryCheck 8 Data.target2 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source2) (points := Data.points2)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B021.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt_mem ⟨66, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked3 : Weights.entryCheck 8 Data.target3 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source3) (points := Data.points3)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B021.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt_mem ⟨81, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked4 : Weights.entryCheck 8 Data.target4 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source4) (points := Data.points4)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B021.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt_mem ⟨8, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked5 : Weights.entryCheck 8 Data.target5 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source5) (points := Data.points5)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B021.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt_mem ⟨13, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked6 : Weights.entryCheck 8 Data.target6 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source6) (points := Data.points6)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B021.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt_mem ⟨66, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked7 : Weights.entryCheck 8 Data.target7 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source7) (points := Data.points7)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B021.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt_mem ⟨81, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked8 : Weights.entryCheck 8 Data.target8 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source8) (points := Data.points8)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B021.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt_mem ⟨8, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked9 : Weights.entryCheck 8 Data.target9 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source9) (points := Data.points9)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B021.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt_mem ⟨13, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period8_checked :
    Weights.batchCheck 8 Data.period8Entries = true := by
  simp only [Data.period8Entries, Weights.batchCheck, List.all_cons, List.all_nil,
    checked0, checked1, checked2, checked3, checked4, checked5, checked6, checked7, checked8, checked9, Bool.true_and]

theorem period8_chunk_checked :
    Weights.batchCheck 8 (Data.period8Chunk.rows.map RowCoverage.TaggedRow.entry) = true := by
  rw [Data.period8Chunk_entries]
  exact period8_checked

theorem period8_each_checked {entry : Weights.Entry}
    (he : entry ∈ Data.period8Entries) :
    MaskWindows.windowCheck 8 (Weights.shapeWord entry) (Weights.siteWeights entry) = true :=
  Weights.batchCheck_entry period8_checked he

end FranklSmallCyclic.TransportBatches.G021.B004
