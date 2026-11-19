module

public import Conjectures.FranklSmallCyclicTransportG037B003Data
public import Conjectures.FranklSmallCyclicOrbit8Block011

/-! Literal source entries reuse their existing proof directly.
Other targets use the finite injective mask-transport theorem.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G037.B003

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked0 : Weights.entryCheck 10 Data.target0 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source0) (points := Data.points0)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B011.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B011.Data.entryAt_mem ⟨124, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked1 : Weights.entryCheck 10 Data.target1 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source1) (points := Data.points1)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B011.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B011.Data.entryAt_mem ⟨112, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked2 : Weights.entryCheck 10 Data.target2 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source2) (points := Data.points2)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B011.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B011.Data.entryAt_mem ⟨113, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period10_checked :
    Weights.batchCheck 10 Data.period10Entries = true := by
  simp only [Data.period10Entries, Weights.batchCheck, List.all_cons, List.all_nil,
    checked0, checked1, checked2, Bool.true_and]

theorem period10_chunk_checked :
    Weights.batchCheck 10 (Data.period10Chunk.rows.map RowCoverage.TaggedRow.entry) = true := by
  rw [Data.period10Chunk_entries]
  exact period10_checked

theorem period10_each_checked {entry : Weights.Entry}
    (he : entry ∈ Data.period10Entries) :
    MaskWindows.windowCheck 10 (Weights.shapeWord entry) (Weights.siteWeights entry) = true :=
  Weights.batchCheck_entry period10_checked he

end FranklSmallCyclic.TransportBatches.G037.B003
