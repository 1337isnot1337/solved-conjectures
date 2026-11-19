module

public import Conjectures.FranklSmallCyclicTransportG008B002Data
public import Conjectures.FranklSmallCyclicOrbit7Block008

/-! Literal source entries reuse their existing proof directly.
Other targets use the finite injective mask-transport theorem.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G008.B002

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked0 : Weights.entryCheck 7 Data.target0 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source0) (points := Data.points0)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨80, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked1 : Weights.entryCheck 7 Data.target1 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source1) (points := Data.points1)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨77, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked2 : Weights.entryCheck 7 Data.target2 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source2) (points := Data.points2)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨35, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked3 : Weights.entryCheck 7 Data.target3 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source3) (points := Data.points3)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨35, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked4 : Weights.entryCheck 7 Data.target4 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source4) (points := Data.points4)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨36, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked5 : Weights.entryCheck 7 Data.target5 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source5) (points := Data.points5)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨36, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked6 : Weights.entryCheck 7 Data.target6 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source6) (points := Data.points6)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨1, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked7 : Weights.entryCheck 7 Data.target7 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source7) (points := Data.points7)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨29, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked8 : Weights.entryCheck 7 Data.target8 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source8) (points := Data.points8)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨21, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked9 : Weights.entryCheck 7 Data.target9 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source9) (points := Data.points9)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨33, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked10 : Weights.entryCheck 7 Data.target10 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source10) (points := Data.points10)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨30, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked11 : Weights.entryCheck 7 Data.target11 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source11) (points := Data.points11)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨22, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked12 : Weights.entryCheck 7 Data.target12 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source12) (points := Data.points12)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨26, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked13 : Weights.entryCheck 7 Data.target13 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source13) (points := Data.points13)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨23, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked14 : Weights.entryCheck 7 Data.target14 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source14) (points := Data.points14)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨39, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked15 : Weights.entryCheck 7 Data.target15 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source15) (points := Data.points15)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨2, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked16 : Weights.entryCheck 7 Data.target16 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source16) (points := Data.points16)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨32, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked17 : Weights.entryCheck 7 Data.target17 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source17) (points := Data.points17)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨28, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked18 : Weights.entryCheck 7 Data.target18 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source18) (points := Data.points18)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨34, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked19 : Weights.entryCheck 7 Data.target19 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source19) (points := Data.points19)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨31, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked20 : Weights.entryCheck 7 Data.target20 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source20) (points := Data.points20)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨25, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked21 : Weights.entryCheck 7 Data.target21 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source21) (points := Data.points21)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨27, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked22 : Weights.entryCheck 7 Data.target22 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source22) (points := Data.points22)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨24, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked23 : Weights.entryCheck 7 Data.target23 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source23) (points := Data.points23)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨102, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked24 : Weights.entryCheck 7 Data.target24 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source24) (points := Data.points24)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨105, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked25 : Weights.entryCheck 7 Data.target25 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source25) (points := Data.points25)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨100, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked26 : Weights.entryCheck 7 Data.target26 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source26) (points := Data.points26)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨101, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked27 : Weights.entryCheck 7 Data.target27 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source27) (points := Data.points27)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨106, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked28 : Weights.entryCheck 7 Data.target28 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source28) (points := Data.points28)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨111, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked29 : Weights.entryCheck 7 Data.target29 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source29) (points := Data.points29)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨113, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked30 : Weights.entryCheck 7 Data.target30 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source30) (points := Data.points30)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨112, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked31 : Weights.entryCheck 7 Data.target31 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source31) (points := Data.points31)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨103, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked32 : Weights.entryCheck 7 Data.target32 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source32) (points := Data.points32)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨104, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked33 : Weights.entryCheck 7 Data.target33 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source33) (points := Data.points33)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨98, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked34 : Weights.entryCheck 7 Data.target34 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source34) (points := Data.points34)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨99, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked35 : Weights.entryCheck 7 Data.target35 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source35) (points := Data.points35)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨107, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked36 : Weights.entryCheck 7 Data.target36 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source36) (points := Data.points36)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨108, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked37 : Weights.entryCheck 7 Data.target37 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source37) (points := Data.points37)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨110, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked38 : Weights.entryCheck 7 Data.target38 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source38) (points := Data.points38)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨109, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked39 : Weights.entryCheck 7 Data.target39 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source39) (points := Data.points39)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨0, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked40 : Weights.entryCheck 7 Data.target40 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source40) (points := Data.points40)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨17, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked41 : Weights.entryCheck 7 Data.target41 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source41) (points := Data.points41)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨18, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked42 : Weights.entryCheck 7 Data.target42 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source42) (points := Data.points42)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨37, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked43 : Weights.entryCheck 7 Data.target43 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source43) (points := Data.points43)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨37, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked44 : Weights.entryCheck 7 Data.target44 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source44) (points := Data.points44)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨38, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked45 : Weights.entryCheck 7 Data.target45 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source45) (points := Data.points45)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨38, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked46 : Weights.entryCheck 7 Data.target46 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source46) (points := Data.points46)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨3, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked47 : Weights.entryCheck 7 Data.target47 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source47) (points := Data.points47)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨7, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked48 : Weights.entryCheck 7 Data.target48 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source48) (points := Data.points48)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨15, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked49 : Weights.entryCheck 7 Data.target49 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source49) (points := Data.points49)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨4, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked50 : Weights.entryCheck 7 Data.target50 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source50) (points := Data.points50)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨8, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked51 : Weights.entryCheck 7 Data.target51 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source51) (points := Data.points51)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨12, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked52 : Weights.entryCheck 7 Data.target52 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source52) (points := Data.points52)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨9, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked53 : Weights.entryCheck 7 Data.target53 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source53) (points := Data.points53)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨6, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked54 : Weights.entryCheck 7 Data.target54 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source54) (points := Data.points54)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨14, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked55 : Weights.entryCheck 7 Data.target55 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source55) (points := Data.points55)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨16, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked56 : Weights.entryCheck 7 Data.target56 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source56) (points := Data.points56)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨5, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked57 : Weights.entryCheck 7 Data.target57 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source57) (points := Data.points57)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨11, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked58 : Weights.entryCheck 7 Data.target58 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source58) (points := Data.points58)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨13, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked59 : Weights.entryCheck 7 Data.target59 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source59) (points := Data.points59)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨10, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked60 : Weights.entryCheck 7 Data.target60 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source60) (points := Data.points60)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨124, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked61 : Weights.entryCheck 7 Data.target61 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source61) (points := Data.points61)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨122, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked62 : Weights.entryCheck 7 Data.target62 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source62) (points := Data.points62)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨117, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked63 : Weights.entryCheck 7 Data.target63 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source63) (points := Data.points63)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨121, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked64 : Weights.entryCheck 7 Data.target64 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source64) (points := Data.points64)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨116, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked65 : Weights.entryCheck 7 Data.target65 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source65) (points := Data.points65)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨123, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked66 : Weights.entryCheck 7 Data.target66 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source66) (points := Data.points66)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨118, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked67 : Weights.entryCheck 7 Data.target67 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source67) (points := Data.points67)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨125, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked68 : Weights.entryCheck 7 Data.target68 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source68) (points := Data.points68)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨126, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked69 : Weights.entryCheck 7 Data.target69 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source69) (points := Data.points69)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨120, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked70 : Weights.entryCheck 7 Data.target70 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source70) (points := Data.points70)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨115, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked71 : Weights.entryCheck 7 Data.target71 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source71) (points := Data.points71)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨119, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked72 : Weights.entryCheck 7 Data.target72 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source72) (points := Data.points72)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨114, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked73 : Weights.entryCheck 7 Data.target73 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source73) (points := Data.points73)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨127, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked74 : Weights.entryCheck 8 Data.target74 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source74) (points := Data.points74)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨3, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked75 : Weights.entryCheck 8 Data.target75 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source75) (points := Data.points75)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨29, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked76 : Weights.entryCheck 8 Data.target76 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source76) (points := Data.points76)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨6, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked77 : Weights.entryCheck 8 Data.target77 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source77) (points := Data.points77)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨32, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked78 : Weights.entryCheck 8 Data.target78 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source78) (points := Data.points78)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨29, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked79 : Weights.entryCheck 8 Data.target79 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source79) (points := Data.points79)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨32, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked80 : Weights.entryCheck 8 Data.target80 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source80) (points := Data.points80)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨3, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked81 : Weights.entryCheck 8 Data.target81 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 7) (source := Data.source81) (points := Data.points81)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P7.B008.window_checked
      (FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt_mem ⟨6, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period7_checked :
    Weights.batchCheck 7 Data.period7Entries = true := by
  simp only [Data.period7Entries, Weights.batchCheck, List.all_cons, List.all_nil,
    checked0, checked1, checked2, checked3, checked4, checked5, checked6, checked7, checked8, checked9, checked10, checked11, checked12, checked13, checked14, checked15, checked16, checked17, checked18, checked19, checked20, checked21, checked22, checked23, checked24, checked25, checked26, checked27, checked28, checked29, checked30, checked31, checked32, checked33, checked34, checked35, checked36, checked37, checked38, checked39, checked40, checked41, checked42, checked43, checked44, checked45, checked46, checked47, checked48, checked49, checked50, checked51, checked52, checked53, checked54, checked55, checked56, checked57, checked58, checked59, checked60, checked61, checked62, checked63, checked64, checked65, checked66, checked67, checked68, checked69, checked70, checked71, checked72, checked73, Bool.true_and]

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
    checked74, checked75, checked76, checked77, checked78, checked79, checked80, checked81, Bool.true_and]

theorem period8_chunk_checked :
    Weights.batchCheck 8 (Data.period8Chunk.rows.map RowCoverage.TaggedRow.entry) = true := by
  rw [Data.period8Chunk_entries]
  exact period8_checked

theorem period8_each_checked {entry : Weights.Entry}
    (he : entry ∈ Data.period8Entries) :
    MaskWindows.windowCheck 8 (Weights.shapeWord entry) (Weights.siteWeights entry) = true :=
  Weights.batchCheck_entry period8_checked he

end FranklSmallCyclic.TransportBatches.G008.B002
