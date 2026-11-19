module

public import Conjectures.FranklSmallCyclicTransportG044B000Data
public import Conjectures.FranklSmallCyclicOrbit8Block018

/-! Literal source entries reuse their existing proof directly.
Other targets use the finite injective mask-transport theorem.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G044.B000

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked0 : Weights.entryCheck 8 Data.target0 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨101, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked1 : Weights.entryCheck 8 Data.target1 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨104, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked2 : Weights.entryCheck 8 Data.target2 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨91, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked3 : Weights.entryCheck 8 Data.target3 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨81, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked4 : Weights.entryCheck 8 Data.target4 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨92, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked5 : Weights.entryCheck 8 Data.target5 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨82, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked6 : Weights.entryCheck 8 Data.target6 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨3, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked7 : Weights.entryCheck 8 Data.target7 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨29, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked8 : Weights.entryCheck 8 Data.target8 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨125, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked9 : Weights.entryCheck 8 Data.target9 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨126, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked10 : Weights.entryCheck 8 Data.target10 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨28, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked11 : Weights.entryCheck 8 Data.target11 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source11) (points := Data.points11)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨3, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked12 : Weights.entryCheck 8 Data.target12 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨18, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked13 : Weights.entryCheck 8 Data.target13 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source13) (points := Data.points13)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨29, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked14 : Weights.entryCheck 8 Data.target14 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨19, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked15 : Weights.entryCheck 8 Data.target15 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨16, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked16 : Weights.entryCheck 8 Data.target16 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source16) (points := Data.points16)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨28, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked17 : Weights.entryCheck 8 Data.target17 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨17, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked18 : Weights.entryCheck 8 Data.target18 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨74, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked19 : Weights.entryCheck 8 Data.target19 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨87, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked20 : Weights.entryCheck 8 Data.target20 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨99, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked21 : Weights.entryCheck 8 Data.target21 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨77, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked22 : Weights.entryCheck 8 Data.target22 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨88, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked23 : Weights.entryCheck 8 Data.target23 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨100, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked24 : Weights.entryCheck 8 Data.target24 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨78, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked25 : Weights.entryCheck 8 Data.target25 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨73, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked26 : Weights.entryCheck 8 Data.target26 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨22, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked27 : Weights.entryCheck 8 Data.target27 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨11, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked28 : Weights.entryCheck 8 Data.target28 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨20, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked29 : Weights.entryCheck 8 Data.target29 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨21, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked30 : Weights.entryCheck 8 Data.target30 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨10, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked31 : Weights.entryCheck 8 Data.target31 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨107, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked32 : Weights.entryCheck 8 Data.target32 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source32) (points := Data.points32)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨107, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked33 : Weights.entryCheck 8 Data.target33 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨105, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked34 : Weights.entryCheck 8 Data.target34 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨108, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked35 : Weights.entryCheck 8 Data.target35 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source35) (points := Data.points35)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨108, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked36 : Weights.entryCheck 8 Data.target36 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨106, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked37 : Weights.entryCheck 8 Data.target37 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨102, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked38 : Weights.entryCheck 8 Data.target38 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨103, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked39 : Weights.entryCheck 8 Data.target39 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨93, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked40 : Weights.entryCheck 8 Data.target40 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨83, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked41 : Weights.entryCheck 8 Data.target41 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨94, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked42 : Weights.entryCheck 8 Data.target42 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨84, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked43 : Weights.entryCheck 8 Data.target43 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨89, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked44 : Weights.entryCheck 8 Data.target44 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨79, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked45 : Weights.entryCheck 8 Data.target45 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨90, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked46 : Weights.entryCheck 8 Data.target46 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨80, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked47 : Weights.entryCheck 8 Data.target47 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨1, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked48 : Weights.entryCheck 8 Data.target48 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨121, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked49 : Weights.entryCheck 8 Data.target49 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨127, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked50 : Weights.entryCheck 8 Data.target50 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨117, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked51 : Weights.entryCheck 8 Data.target51 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨2, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked52 : Weights.entryCheck 8 Data.target52 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨124, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked53 : Weights.entryCheck 8 Data.target53 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨0, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked54 : Weights.entryCheck 8 Data.target54 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨120, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked55 : Weights.entryCheck 8 Data.target55 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨122, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked56 : Weights.entryCheck 8 Data.target56 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨118, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked57 : Weights.entryCheck 8 Data.target57 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨123, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked58 : Weights.entryCheck 8 Data.target58 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨119, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked59 : Weights.entryCheck 8 Data.target59 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source59) (points := Data.points59)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨1, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked60 : Weights.entryCheck 8 Data.target60 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source60) (points := Data.points60)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨2, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked61 : Weights.entryCheck 8 Data.target61 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨115, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked62 : Weights.entryCheck 8 Data.target62 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨23, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked63 : Weights.entryCheck 8 Data.target63 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨112, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked64 : Weights.entryCheck 8 Data.target64 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨14, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked65 : Weights.entryCheck 8 Data.target65 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨15, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked66 : Weights.entryCheck 8 Data.target66 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨110, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked67 : Weights.entryCheck 8 Data.target67 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨114, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked68 : Weights.entryCheck 8 Data.target68 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨111, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked69 : Weights.entryCheck 8 Data.target69 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨12, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked70 : Weights.entryCheck 8 Data.target70 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨13, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked71 : Weights.entryCheck 8 Data.target71 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨95, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked72 : Weights.entryCheck 8 Data.target72 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨98, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked73 : Weights.entryCheck 8 Data.target73 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨72, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked74 : Weights.entryCheck 8 Data.target74 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨85, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked75 : Weights.entryCheck 8 Data.target75 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨96, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked76 : Weights.entryCheck 8 Data.target76 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨75, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked77 : Weights.entryCheck 8 Data.target77 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨86, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked78 : Weights.entryCheck 8 Data.target78 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨97, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked79 : Weights.entryCheck 8 Data.target79 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨76, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked80 : Weights.entryCheck 8 Data.target80 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨71, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked81 : Weights.entryCheck 8 Data.target81 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source81) (points := Data.points81)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨101, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked82 : Weights.entryCheck 8 Data.target82 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source82) (points := Data.points82)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨104, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked83 : Weights.entryCheck 8 Data.target83 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source83) (points := Data.points83)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨91, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked84 : Weights.entryCheck 8 Data.target84 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source84) (points := Data.points84)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨81, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked85 : Weights.entryCheck 8 Data.target85 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source85) (points := Data.points85)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨92, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked86 : Weights.entryCheck 8 Data.target86 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source86) (points := Data.points86)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨82, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked87 : Weights.entryCheck 8 Data.target87 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source87) (points := Data.points87)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨74, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked88 : Weights.entryCheck 8 Data.target88 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source88) (points := Data.points88)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨87, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked89 : Weights.entryCheck 8 Data.target89 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source89) (points := Data.points89)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨99, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked90 : Weights.entryCheck 8 Data.target90 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source90) (points := Data.points90)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨77, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked91 : Weights.entryCheck 8 Data.target91 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source91) (points := Data.points91)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨88, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked92 : Weights.entryCheck 8 Data.target92 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source92) (points := Data.points92)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨100, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked93 : Weights.entryCheck 8 Data.target93 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source93) (points := Data.points93)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨78, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked94 : Weights.entryCheck 8 Data.target94 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source94) (points := Data.points94)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨73, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked95 : Weights.entryCheck 8 Data.target95 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source95) (points := Data.points95)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨102, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked96 : Weights.entryCheck 8 Data.target96 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source96) (points := Data.points96)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨103, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked97 : Weights.entryCheck 8 Data.target97 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source97) (points := Data.points97)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨93, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked98 : Weights.entryCheck 8 Data.target98 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source98) (points := Data.points98)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨83, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked99 : Weights.entryCheck 8 Data.target99 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source99) (points := Data.points99)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨94, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked100 : Weights.entryCheck 8 Data.target100 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source100) (points := Data.points100)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨84, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked101 : Weights.entryCheck 8 Data.target101 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source101) (points := Data.points101)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨89, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked102 : Weights.entryCheck 8 Data.target102 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source102) (points := Data.points102)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨79, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked103 : Weights.entryCheck 8 Data.target103 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source103) (points := Data.points103)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨90, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked104 : Weights.entryCheck 8 Data.target104 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source104) (points := Data.points104)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨80, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked105 : Weights.entryCheck 8 Data.target105 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source105) (points := Data.points105)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨72, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked106 : Weights.entryCheck 8 Data.target106 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source106) (points := Data.points106)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨85, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked107 : Weights.entryCheck 8 Data.target107 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source107) (points := Data.points107)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨96, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked108 : Weights.entryCheck 8 Data.target108 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source108) (points := Data.points108)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨75, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked109 : Weights.entryCheck 8 Data.target109 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source109) (points := Data.points109)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨86, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked110 : Weights.entryCheck 8 Data.target110 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source110) (points := Data.points110)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨97, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked111 : Weights.entryCheck 8 Data.target111 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source111) (points := Data.points111)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨76, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked112 : Weights.entryCheck 8 Data.target112 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source112) (points := Data.points112)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨71, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked113 : Weights.entryCheck 8 Data.target113 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨68, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked114 : Weights.entryCheck 8 Data.target114 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨60, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked115 : Weights.entryCheck 8 Data.target115 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨63, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked116 : Weights.entryCheck 8 Data.target116 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨70, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked117 : Weights.entryCheck 8 Data.target117 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨50, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked118 : Weights.entryCheck 8 Data.target118 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨51, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked119 : Weights.entryCheck 8 Data.target119 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨46, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked120 : Weights.entryCheck 8 Data.target120 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨36, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked121 : Weights.entryCheck 8 Data.target121 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨47, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked122 : Weights.entryCheck 8 Data.target122 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨37, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked123 : Weights.entryCheck 8 Data.target123 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨69, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked124 : Weights.entryCheck 8 Data.target124 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨26, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked125 : Weights.entryCheck 8 Data.target125 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨9, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked126 : Weights.entryCheck 8 Data.target126 = true := by
  exact FranklSmallCyclic.OrbitBatches.P8.B018.entryAt_checked ⟨116, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked127 : Weights.entryCheck 8 Data.target127 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 8) (source := Data.source127) (points := Data.points127)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P8.B018.window_checked
      (FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt_mem ⟨116, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period8_checked :
    Weights.batchCheck 8 Data.period8Entries = true := by
  simp only [Data.period8Entries, Weights.batchCheck, List.all_cons, List.all_nil,
    checked0, checked1, checked2, checked3, checked4, checked5, checked6, checked7, checked8, checked9, checked10, checked11, checked12, checked13, checked14, checked15, checked16, checked17, checked18, checked19, checked20, checked21, checked22, checked23, checked24, checked25, checked26, checked27, checked28, checked29, checked30, checked31, checked32, checked33, checked34, checked35, checked36, checked37, checked38, checked39, checked40, checked41, checked42, checked43, checked44, checked45, checked46, checked47, checked48, checked49, checked50, checked51, checked52, checked53, checked54, checked55, checked56, checked57, checked58, checked59, checked60, checked61, checked62, checked63, checked64, checked65, checked66, checked67, checked68, checked69, checked70, checked71, checked72, checked73, checked74, checked75, checked76, checked77, checked78, checked79, checked80, checked81, checked82, checked83, checked84, checked85, checked86, checked87, checked88, checked89, checked90, checked91, checked92, checked93, checked94, checked95, checked96, checked97, checked98, checked99, checked100, checked101, checked102, checked103, checked104, checked105, checked106, checked107, checked108, checked109, checked110, checked111, checked112, checked113, checked114, checked115, checked116, checked117, checked118, checked119, checked120, checked121, checked122, checked123, checked124, checked125, checked126, checked127, Bool.true_and]

theorem period8_chunk_checked :
    Weights.batchCheck 8 (Data.period8Chunk.rows.map RowCoverage.TaggedRow.entry) = true := by
  rw [Data.period8Chunk_entries]
  exact period8_checked

theorem period8_each_checked {entry : Weights.Entry}
    (he : entry ∈ Data.period8Entries) :
    MaskWindows.windowCheck 8 (Weights.shapeWord entry) (Weights.siteWeights entry) = true :=
  Weights.batchCheck_entry period8_checked he

end FranklSmallCyclic.TransportBatches.G044.B000
