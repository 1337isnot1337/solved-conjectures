module

public import Conjectures.FranklSmallCyclicTransportG003B002Data
public import Conjectures.FranklSmallCyclicOrbit7Block003

/-! Literal source entries reuse their existing proof directly.
Other targets use the finite injective mask-transport theorem.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G003.B002

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked0 : Weights.entryCheck 7 Data.target0 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source0) (points := Data.points0)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨75, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked1 : Weights.entryCheck 7 Data.target1 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source1) (points := Data.points1)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨68, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked2 : Weights.entryCheck 7 Data.target2 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source2) (points := Data.points2)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨77, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked3 : Weights.entryCheck 7 Data.target3 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source3) (points := Data.points3)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨70, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked4 : Weights.entryCheck 7 Data.target4 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source4) (points := Data.points4)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨115, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked5 : Weights.entryCheck 7 Data.target5 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source5) (points := Data.points5)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨95, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked6 : Weights.entryCheck 7 Data.target6 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source6) (points := Data.points6)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨76, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked7 : Weights.entryCheck 7 Data.target7 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source7) (points := Data.points7)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨69, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked8 : Weights.entryCheck 7 Data.target8 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source8) (points := Data.points8)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨55, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked9 : Weights.entryCheck 7 Data.target9 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source9) (points := Data.points9)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨58, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked10 : Weights.entryCheck 7 Data.target10 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source10) (points := Data.points10)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨126, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked11 : Weights.entryCheck 7 Data.target11 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source11) (points := Data.points11)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨106, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked12 : Weights.entryCheck 7 Data.target12 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source12) (points := Data.points12)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨56, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked13 : Weights.entryCheck 7 Data.target13 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source13) (points := Data.points13)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨57, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked14 : Weights.entryCheck 7 Data.target14 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source14) (points := Data.points14)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨125, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked15 : Weights.entryCheck 7 Data.target15 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source15) (points := Data.points15)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨105, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked16 : Weights.entryCheck 7 Data.target16 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source16) (points := Data.points16)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨110, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked17 : Weights.entryCheck 7 Data.target17 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source17) (points := Data.points17)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨109, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked18 : Weights.entryCheck 7 Data.target18 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source18) (points := Data.points18)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨36, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked19 : Weights.entryCheck 7 Data.target19 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source19) (points := Data.points19)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨32, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked20 : Weights.entryCheck 7 Data.target20 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source20) (points := Data.points20)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨118, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked21 : Weights.entryCheck 7 Data.target21 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source21) (points := Data.points21)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨102, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked22 : Weights.entryCheck 7 Data.target22 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source22) (points := Data.points22)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨38, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked23 : Weights.entryCheck 7 Data.target23 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source23) (points := Data.points23)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨34, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked24 : Weights.entryCheck 7 Data.target24 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source24) (points := Data.points24)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨117, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked25 : Weights.entryCheck 7 Data.target25 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source25) (points := Data.points25)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨101, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked26 : Weights.entryCheck 7 Data.target26 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source26) (points := Data.points26)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨37, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked27 : Weights.entryCheck 7 Data.target27 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source27) (points := Data.points27)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨33, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked28 : Weights.entryCheck 7 Data.target28 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source28) (points := Data.points28)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨35, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked29 : Weights.entryCheck 7 Data.target29 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source29) (points := Data.points29)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt_mem ⟨31, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period7_checked :
    Weights.batchCheck 7 Data.period7Entries = true := by
  simp only [Data.period7Entries, Weights.batchCheck, List.all_cons, List.all_nil,
    checked0, checked1, checked2, checked3, checked4, checked5, checked6, checked7, checked8, checked9, checked10, checked11, checked12, checked13, checked14, checked15, checked16, checked17, checked18, checked19, checked20, checked21, checked22, checked23, checked24, checked25, checked26, checked27, checked28, checked29, Bool.true_and]

theorem period7_chunk_checked :
    Weights.batchCheck 7 (Data.period7Chunk.rows.map RowCoverage.TaggedRow.entry) = true := by
  rw [Data.period7Chunk_entries]
  exact period7_checked

theorem period7_each_checked {entry : Weights.Entry}
    (he : entry ∈ Data.period7Entries) :
    MaskWindows.windowCheck 7 (Weights.shapeWord entry) (Weights.siteWeights entry) = true :=
  Weights.batchCheck_entry period7_checked he

end FranklSmallCyclic.TransportBatches.G003.B002
