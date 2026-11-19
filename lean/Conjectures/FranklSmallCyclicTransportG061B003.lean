module

public import Conjectures.FranklSmallCyclicTransportG061B003Data
public import Conjectures.FranklSmallCyclicOrbit9Block008

/-! Literal source entries reuse their existing proof directly.
Other targets use the finite injective mask-transport theorem.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G061.B003

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked0 : Weights.entryCheck 9 Data.target0 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source0) (points := Data.points0)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨26, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked1 : Weights.entryCheck 9 Data.target1 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source1) (points := Data.points1)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨26, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked2 : Weights.entryCheck 9 Data.target2 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source2) (points := Data.points2)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨63, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked3 : Weights.entryCheck 9 Data.target3 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source3) (points := Data.points3)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨27, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked4 : Weights.entryCheck 9 Data.target4 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source4) (points := Data.points4)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨62, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked5 : Weights.entryCheck 9 Data.target5 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source5) (points := Data.points5)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨54, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked6 : Weights.entryCheck 9 Data.target6 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source6) (points := Data.points6)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨51, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked7 : Weights.entryCheck 9 Data.target7 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source7) (points := Data.points7)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨23, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked8 : Weights.entryCheck 9 Data.target8 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source8) (points := Data.points8)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨65, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked9 : Weights.entryCheck 9 Data.target9 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source9) (points := Data.points9)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨65, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked10 : Weights.entryCheck 9 Data.target10 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source10) (points := Data.points10)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨89, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked11 : Weights.entryCheck 9 Data.target11 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source11) (points := Data.points11)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨29, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked12 : Weights.entryCheck 9 Data.target12 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source12) (points := Data.points12)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨29, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked13 : Weights.entryCheck 9 Data.target13 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source13) (points := Data.points13)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨64, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked14 : Weights.entryCheck 9 Data.target14 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source14) (points := Data.points14)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨28, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked15 : Weights.entryCheck 9 Data.target15 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source15) (points := Data.points15)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨65, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked16 : Weights.entryCheck 9 Data.target16 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source16) (points := Data.points16)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨55, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked17 : Weights.entryCheck 9 Data.target17 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source17) (points := Data.points17)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨15, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked18 : Weights.entryCheck 9 Data.target18 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source18) (points := Data.points18)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨7, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked19 : Weights.entryCheck 9 Data.target19 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source19) (points := Data.points19)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨20, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked20 : Weights.entryCheck 9 Data.target20 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source20) (points := Data.points20)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨12, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked21 : Weights.entryCheck 9 Data.target21 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source21) (points := Data.points21)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨22, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked22 : Weights.entryCheck 9 Data.target22 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source22) (points := Data.points22)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨14, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked23 : Weights.entryCheck 9 Data.target23 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source23) (points := Data.points23)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨21, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked24 : Weights.entryCheck 9 Data.target24 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source24) (points := Data.points24)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨13, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked25 : Weights.entryCheck 9 Data.target25 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source25) (points := Data.points25)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨2, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked26 : Weights.entryCheck 9 Data.target26 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source26) (points := Data.points26)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨0, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked27 : Weights.entryCheck 9 Data.target27 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source27) (points := Data.points27)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt_mem ⟨1, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period9_checked :
    Weights.batchCheck 9 Data.period9Entries = true := by
  simp only [Data.period9Entries, Weights.batchCheck, List.all_cons, List.all_nil,
    checked0, checked1, checked2, checked3, checked4, checked5, checked6, checked7, checked8, checked9, checked10, checked11, checked12, checked13, checked14, checked15, checked16, checked17, checked18, checked19, checked20, checked21, checked22, checked23, checked24, checked25, checked26, checked27, Bool.true_and]

theorem period9_chunk_checked :
    Weights.batchCheck 9 (Data.period9Chunk.rows.map RowCoverage.TaggedRow.entry) = true := by
  rw [Data.period9Chunk_entries]
  exact period9_checked

theorem period9_each_checked {entry : Weights.Entry}
    (he : entry ∈ Data.period9Entries) :
    MaskWindows.windowCheck 9 (Weights.shapeWord entry) (Weights.siteWeights entry) = true :=
  Weights.batchCheck_entry period9_checked he

end FranklSmallCyclic.TransportBatches.G061.B003
