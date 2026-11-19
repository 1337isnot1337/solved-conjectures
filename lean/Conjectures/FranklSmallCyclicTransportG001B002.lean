module

public import Conjectures.FranklSmallCyclicTransportG001B002Data
public import Conjectures.FranklSmallCyclicOrbit7Block001

/-! Literal source entries reuse their existing proof directly.
Other targets use the finite injective mask-transport theorem.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G001.B002

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked0 : Weights.entryCheck 7 Data.target0 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source0) (points := Data.points0)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨80, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked1 : Weights.entryCheck 7 Data.target1 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source1) (points := Data.points1)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨68, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked2 : Weights.entryCheck 7 Data.target2 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source2) (points := Data.points2)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨53, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked3 : Weights.entryCheck 7 Data.target3 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source3) (points := Data.points3)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨62, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked4 : Weights.entryCheck 7 Data.target4 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source4) (points := Data.points4)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨49, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked5 : Weights.entryCheck 7 Data.target5 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source5) (points := Data.points5)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨75, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked6 : Weights.entryCheck 7 Data.target6 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source6) (points := Data.points6)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨0, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked7 : Weights.entryCheck 7 Data.target7 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source7) (points := Data.points7)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨72, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked8 : Weights.entryCheck 7 Data.target8 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source8) (points := Data.points8)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨71, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked9 : Weights.entryCheck 7 Data.target9 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source9) (points := Data.points9)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨23, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked10 : Weights.entryCheck 7 Data.target10 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source10) (points := Data.points10)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨27, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked11 : Weights.entryCheck 7 Data.target11 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source11) (points := Data.points11)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨21, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked12 : Weights.entryCheck 7 Data.target12 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source12) (points := Data.points12)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨18, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked13 : Weights.entryCheck 7 Data.target13 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source13) (points := Data.points13)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨14, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked14 : Weights.entryCheck 7 Data.target14 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source14) (points := Data.points14)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨17, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked15 : Weights.entryCheck 7 Data.target15 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source15) (points := Data.points15)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨11, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked16 : Weights.entryCheck 7 Data.target16 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source16) (points := Data.points16)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨29, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked17 : Weights.entryCheck 7 Data.target17 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source17) (points := Data.points17)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨12, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked18 : Weights.entryCheck 7 Data.target18 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source18) (points := Data.points18)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨9, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked19 : Weights.entryCheck 7 Data.target19 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source19) (points := Data.points19)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨13, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked20 : Weights.entryCheck 7 Data.target20 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source20) (points := Data.points20)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨10, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked21 : Weights.entryCheck 7 Data.target21 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source21) (points := Data.points21)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨2, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked22 : Weights.entryCheck 7 Data.target22 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source22) (points := Data.points22)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨125, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked23 : Weights.entryCheck 7 Data.target23 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source23) (points := Data.points23)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨79, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked24 : Weights.entryCheck 7 Data.target24 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source24) (points := Data.points24)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨78, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked25 : Weights.entryCheck 7 Data.target25 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source25) (points := Data.points25)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨83, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked26 : Weights.entryCheck 7 Data.target26 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source26) (points := Data.points26)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨82, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked27 : Weights.entryCheck 7 Data.target27 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source27) (points := Data.points27)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨124, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked28 : Weights.entryCheck 8 Data.target28 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source28) (points := Data.points28)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨77, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked29 : Weights.entryCheck 8 Data.target29 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source29) (points := Data.points29)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨75, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked30 : Weights.entryCheck 8 Data.target30 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source30) (points := Data.points30)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨77, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked31 : Weights.entryCheck 8 Data.target31 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source31) (points := Data.points31)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B001.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt_mem ⟨75, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period7_checked :
    Weights.batchCheck 7 Data.period7Entries = true := by
  simp only [Data.period7Entries, Weights.batchCheck, List.all_cons, List.all_nil,
    checked0, checked1, checked2, checked3, checked4, checked5, checked6, checked7, checked8, checked9, checked10, checked11, checked12, checked13, checked14, checked15, checked16, checked17, checked18, checked19, checked20, checked21, checked22, checked23, checked24, checked25, checked26, checked27, Bool.true_and]

theorem period7_chunk_checked :
    Weights.batchCheck 7 (Data.period7Chunk.rows.map RowCoverage.TaggedRow.entry) = true := by
  rw [Data.period7Chunk_entries]
  exact period7_checked

theorem period7_each_checked {entry : Weights.Entry}
    (he : entry ∈ Data.period7Entries) :
    MaskWindows.windowCheck 7 (Weights.shapeWord entry) (Weights.siteWeights entry) = true :=
  Weights.batchCheck_entry period7_checked he

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period8_checked :
    Weights.batchCheck 8 Data.period8Entries = true := by
  simp only [Data.period8Entries, Weights.batchCheck, List.all_cons, List.all_nil,
    checked28, checked29, checked30, checked31, Bool.true_and]

theorem period8_chunk_checked :
    Weights.batchCheck 8 (Data.period8Chunk.rows.map RowCoverage.TaggedRow.entry) = true := by
  rw [Data.period8Chunk_entries]
  exact period8_checked

theorem period8_each_checked {entry : Weights.Entry}
    (he : entry ∈ Data.period8Entries) :
    MaskWindows.windowCheck 8 (Weights.shapeWord entry) (Weights.siteWeights entry) = true :=
  Weights.batchCheck_entry period8_checked he

end FranklSmallCyclic.TransportBatches.G001.B002
