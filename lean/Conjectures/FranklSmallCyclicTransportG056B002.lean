module

public import Conjectures.FranklSmallCyclicTransportG056B002Data
public import Conjectures.FranklSmallCyclicOrbit9Block003

/-! Literal source entries reuse their existing proof directly.
Other targets use the finite injective mask-transport theorem.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G056.B002

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked0 : Weights.entryCheck 9 Data.target0 = true := by
  exact FranklSmallCyclic.OrbitBatches.P9.B003.entryAt_checked ⟨89, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked1 : Weights.entryCheck 9 Data.target1 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source1) (points := Data.points1)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨115, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked2 : Weights.entryCheck 9 Data.target2 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source2) (points := Data.points2)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨115, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked3 : Weights.entryCheck 9 Data.target3 = true := by
  exact FranklSmallCyclic.OrbitBatches.P9.B003.entryAt_checked ⟨99, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked4 : Weights.entryCheck 9 Data.target4 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source4) (points := Data.points4)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨107, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked5 : Weights.entryCheck 9 Data.target5 = true := by
  exact FranklSmallCyclic.OrbitBatches.P9.B003.entryAt_checked ⟨85, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked6 : Weights.entryCheck 9 Data.target6 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source6) (points := Data.points6)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨93, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked7 : Weights.entryCheck 9 Data.target7 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source7) (points := Data.points7)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨112, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked8 : Weights.entryCheck 9 Data.target8 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source8) (points := Data.points8)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨114, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked9 : Weights.entryCheck 9 Data.target9 = true := by
  exact FranklSmallCyclic.OrbitBatches.P9.B003.entryAt_checked ⟨98, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked10 : Weights.entryCheck 9 Data.target10 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source10) (points := Data.points10)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨106, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked11 : Weights.entryCheck 9 Data.target11 = true := by
  exact FranklSmallCyclic.OrbitBatches.P9.B003.entryAt_checked ⟨82, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked12 : Weights.entryCheck 9 Data.target12 = true := by
  exact FranklSmallCyclic.OrbitBatches.P9.B003.entryAt_checked ⟨90, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked13 : Weights.entryCheck 9 Data.target13 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source13) (points := Data.points13)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨126, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked14 : Weights.entryCheck 9 Data.target14 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source14) (points := Data.points14)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨126, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked15 : Weights.entryCheck 9 Data.target15 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source15) (points := Data.points15)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨125, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked16 : Weights.entryCheck 9 Data.target16 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source16) (points := Data.points16)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨88, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked17 : Weights.entryCheck 9 Data.target17 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source17) (points := Data.points17)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨88, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked18 : Weights.entryCheck 9 Data.target18 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source18) (points := Data.points18)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨89, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked19 : Weights.entryCheck 9 Data.target19 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source19) (points := Data.points19)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨91, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked20 : Weights.entryCheck 9 Data.target20 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source20) (points := Data.points20)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨91, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked21 : Weights.entryCheck 9 Data.target21 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source21) (points := Data.points21)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨90, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked22 : Weights.entryCheck 9 Data.target22 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source22) (points := Data.points22)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨122, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked23 : Weights.entryCheck 9 Data.target23 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source23) (points := Data.points23)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨95, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked24 : Weights.entryCheck 9 Data.target24 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source24) (points := Data.points24)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨95, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked25 : Weights.entryCheck 9 Data.target25 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source25) (points := Data.points25)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨96, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked26 : Weights.entryCheck 9 Data.target26 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source26) (points := Data.points26)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨102, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked27 : Weights.entryCheck 9 Data.target27 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source27) (points := Data.points27)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨102, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked28 : Weights.entryCheck 9 Data.target28 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source28) (points := Data.points28)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨99, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked29 : Weights.entryCheck 9 Data.target29 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source29) (points := Data.points29)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨100, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked30 : Weights.entryCheck 9 Data.target30 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source30) (points := Data.points30)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨100, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked31 : Weights.entryCheck 9 Data.target31 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source31) (points := Data.points31)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨97, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked32 : Weights.entryCheck 9 Data.target32 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source32) (points := Data.points32)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨101, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked33 : Weights.entryCheck 9 Data.target33 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source33) (points := Data.points33)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨101, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked34 : Weights.entryCheck 9 Data.target34 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source34) (points := Data.points34)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨98, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked35 : Weights.entryCheck 9 Data.target35 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source35) (points := Data.points35)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨69, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked36 : Weights.entryCheck 9 Data.target36 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source36) (points := Data.points36)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨69, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked37 : Weights.entryCheck 9 Data.target37 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source37) (points := Data.points37)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨70, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked38 : Weights.entryCheck 9 Data.target38 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source38) (points := Data.points38)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨25, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked39 : Weights.entryCheck 9 Data.target39 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source39) (points := Data.points39)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨70, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked40 : Weights.entryCheck 9 Data.target40 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source40) (points := Data.points40)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨24, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked41 : Weights.entryCheck 9 Data.target41 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source41) (points := Data.points41)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨38, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked42 : Weights.entryCheck 9 Data.target42 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source42) (points := Data.points42)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨4, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked43 : Weights.entryCheck 9 Data.target43 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source43) (points := Data.points43)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨4, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked44 : Weights.entryCheck 9 Data.target44 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source44) (points := Data.points44)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨59, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked45 : Weights.entryCheck 9 Data.target45 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source45) (points := Data.points45)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨12, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked46 : Weights.entryCheck 9 Data.target46 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source46) (points := Data.points46)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨53, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked47 : Weights.entryCheck 9 Data.target47 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source47) (points := Data.points47)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨5, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked48 : Weights.entryCheck 9 Data.target48 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source48) (points := Data.points48)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨53, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked49 : Weights.entryCheck 9 Data.target49 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source49) (points := Data.points49)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨5, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked50 : Weights.entryCheck 9 Data.target50 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source50) (points := Data.points50)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨57, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked51 : Weights.entryCheck 9 Data.target51 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source51) (points := Data.points51)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨9, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked52 : Weights.entryCheck 9 Data.target52 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source52) (points := Data.points52)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨54, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked53 : Weights.entryCheck 9 Data.target53 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source53) (points := Data.points53)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨6, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked54 : Weights.entryCheck 9 Data.target54 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source54) (points := Data.points54)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨50, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked55 : Weights.entryCheck 9 Data.target55 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source55) (points := Data.points55)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨48, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked56 : Weights.entryCheck 9 Data.target56 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source56) (points := Data.points56)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨49, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked57 : Weights.entryCheck 9 Data.target57 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source57) (points := Data.points57)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨47, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked58 : Weights.entryCheck 9 Data.target58 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source58) (points := Data.points58)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨11, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked59 : Weights.entryCheck 9 Data.target59 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source59) (points := Data.points59)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨11, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked60 : Weights.entryCheck 9 Data.target60 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source60) (points := Data.points60)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨60, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked61 : Weights.entryCheck 9 Data.target61 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source61) (points := Data.points61)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨13, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked62 : Weights.entryCheck 9 Data.target62 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source62) (points := Data.points62)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨56, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked63 : Weights.entryCheck 9 Data.target63 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source63) (points := Data.points63)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨8, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked64 : Weights.entryCheck 9 Data.target64 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source64) (points := Data.points64)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨56, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked65 : Weights.entryCheck 9 Data.target65 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source65) (points := Data.points65)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨8, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked66 : Weights.entryCheck 9 Data.target66 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source66) (points := Data.points66)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨58, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked67 : Weights.entryCheck 9 Data.target67 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source67) (points := Data.points67)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨10, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked68 : Weights.entryCheck 9 Data.target68 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source68) (points := Data.points68)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨55, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked69 : Weights.entryCheck 9 Data.target69 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source69) (points := Data.points69)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨7, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked70 : Weights.entryCheck 9 Data.target70 = true := by
  exact FranklSmallCyclic.OrbitBatches.P9.B003.entryAt_checked ⟨78, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked71 : Weights.entryCheck 9 Data.target71 = true := by
  exact FranklSmallCyclic.OrbitBatches.P9.B003.entryAt_checked ⟨76, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked72 : Weights.entryCheck 9 Data.target72 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source72) (points := Data.points72)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨78, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked73 : Weights.entryCheck 9 Data.target73 = true := by
  exact FranklSmallCyclic.OrbitBatches.P9.B003.entryAt_checked ⟨74, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked74 : Weights.entryCheck 9 Data.target74 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source74) (points := Data.points74)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨127, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked75 : Weights.entryCheck 9 Data.target75 = true := by
  exact FranklSmallCyclic.OrbitBatches.P9.B003.entryAt_checked ⟨77, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked76 : Weights.entryCheck 9 Data.target76 = true := by
  exact FranklSmallCyclic.OrbitBatches.P9.B003.entryAt_checked ⟨73, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked77 : Weights.entryCheck 9 Data.target77 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source77) (points := Data.points77)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨77, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked78 : Weights.entryCheck 9 Data.target78 = true := by
  exact FranklSmallCyclic.OrbitBatches.P9.B003.entryAt_checked ⟨75, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked79 : Weights.entryCheck 9 Data.target79 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source79) (points := Data.points79)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨95, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked80 : Weights.entryCheck 9 Data.target80 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source80) (points := Data.points80)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨103, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked81 : Weights.entryCheck 9 Data.target81 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source81) (points := Data.points81)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨79, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked82 : Weights.entryCheck 9 Data.target82 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source82) (points := Data.points82)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨87, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked83 : Weights.entryCheck 9 Data.target83 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source83) (points := Data.points83)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨116, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked84 : Weights.entryCheck 9 Data.target84 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source84) (points := Data.points84)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨100, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked85 : Weights.entryCheck 9 Data.target85 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source85) (points := Data.points85)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨108, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked86 : Weights.entryCheck 9 Data.target86 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source86) (points := Data.points86)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨80, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked87 : Weights.entryCheck 9 Data.target87 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source87) (points := Data.points87)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨88, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked88 : Weights.entryCheck 9 Data.target88 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source88) (points := Data.points88)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨102, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked89 : Weights.entryCheck 9 Data.target89 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source89) (points := Data.points89)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨110, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked90 : Weights.entryCheck 9 Data.target90 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source90) (points := Data.points90)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨86, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked91 : Weights.entryCheck 9 Data.target91 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source91) (points := Data.points91)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨94, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked92 : Weights.entryCheck 9 Data.target92 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source92) (points := Data.points92)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨117, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked93 : Weights.entryCheck 9 Data.target93 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source93) (points := Data.points93)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨101, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked94 : Weights.entryCheck 9 Data.target94 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source94) (points := Data.points94)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨109, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked95 : Weights.entryCheck 9 Data.target95 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source95) (points := Data.points95)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨83, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked96 : Weights.entryCheck 9 Data.target96 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source96) (points := Data.points96)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨91, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked97 : Weights.entryCheck 9 Data.target97 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source97) (points := Data.points97)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨79, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked98 : Weights.entryCheck 9 Data.target98 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source98) (points := Data.points98)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨79, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked99 : Weights.entryCheck 9 Data.target99 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source99) (points := Data.points99)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨84, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked100 : Weights.entryCheck 9 Data.target100 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source100) (points := Data.points100)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨86, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked101 : Weights.entryCheck 9 Data.target101 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source101) (points := Data.points101)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨86, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked102 : Weights.entryCheck 9 Data.target102 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source102) (points := Data.points102)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨85, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked103 : Weights.entryCheck 9 Data.target103 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source103) (points := Data.points103)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨80, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked104 : Weights.entryCheck 9 Data.target104 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source104) (points := Data.points104)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨80, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked105 : Weights.entryCheck 9 Data.target105 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source105) (points := Data.points105)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨81, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked106 : Weights.entryCheck 9 Data.target106 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source106) (points := Data.points106)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨83, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked107 : Weights.entryCheck 9 Data.target107 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source107) (points := Data.points107)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨83, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked108 : Weights.entryCheck 9 Data.target108 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source108) (points := Data.points108)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨82, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked109 : Weights.entryCheck 9 Data.target109 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source109) (points := Data.points109)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨74, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked110 : Weights.entryCheck 9 Data.target110 = true := by
  exact FranklSmallCyclic.OrbitBatches.P9.B003.entryAt_checked ⟨72, by decide +kernel⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked111 : Weights.entryCheck 9 Data.target111 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source111) (points := Data.points111)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨124, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked112 : Weights.entryCheck 9 Data.target112 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source112) (points := Data.points112)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨124, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked113 : Weights.entryCheck 9 Data.target113 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source113) (points := Data.points113)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨76, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked114 : Weights.entryCheck 9 Data.target114 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source114) (points := Data.points114)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨72, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked115 : Weights.entryCheck 9 Data.target115 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source115) (points := Data.points115)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨123, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked116 : Weights.entryCheck 9 Data.target116 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source116) (points := Data.points116)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨75, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked117 : Weights.entryCheck 9 Data.target117 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source117) (points := Data.points117)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨73, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked118 : Weights.entryCheck 10 Data.target118 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source118) (points := Data.points118)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨1, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked119 : Weights.entryCheck 10 Data.target119 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source119) (points := Data.points119)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨3, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked120 : Weights.entryCheck 10 Data.target120 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source120) (points := Data.points120)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨0, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked121 : Weights.entryCheck 10 Data.target121 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source121) (points := Data.points121)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨2, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked122 : Weights.entryCheck 10 Data.target122 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source122) (points := Data.points122)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨50, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked123 : Weights.entryCheck 10 Data.target123 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source123) (points := Data.points123)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨57, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked124 : Weights.entryCheck 10 Data.target124 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source124) (points := Data.points124)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨65, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked125 : Weights.entryCheck 10 Data.target125 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source125) (points := Data.points125)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨58, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked126 : Weights.entryCheck 10 Data.target126 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source126) (points := Data.points126)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨66, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked127 : Weights.entryCheck 10 Data.target127 = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := 9) (source := Data.source127) (points := Data.points127)
  · decide +kernel
  · exact FranklSmallCyclic.OrbitBatches.P9.B003.window_checked
      (FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt_mem ⟨49, by decide +kernel⟩)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period9_checked :
    Weights.batchCheck 9 Data.period9Entries = true := by
  simp only [Data.period9Entries, Weights.batchCheck, List.all_cons, List.all_nil,
    checked0, checked1, checked2, checked3, checked4, checked5, checked6, checked7, checked8, checked9, checked10, checked11, checked12, checked13, checked14, checked15, checked16, checked17, checked18, checked19, checked20, checked21, checked22, checked23, checked24, checked25, checked26, checked27, checked28, checked29, checked30, checked31, checked32, checked33, checked34, checked35, checked36, checked37, checked38, checked39, checked40, checked41, checked42, checked43, checked44, checked45, checked46, checked47, checked48, checked49, checked50, checked51, checked52, checked53, checked54, checked55, checked56, checked57, checked58, checked59, checked60, checked61, checked62, checked63, checked64, checked65, checked66, checked67, checked68, checked69, checked70, checked71, checked72, checked73, checked74, checked75, checked76, checked77, checked78, checked79, checked80, checked81, checked82, checked83, checked84, checked85, checked86, checked87, checked88, checked89, checked90, checked91, checked92, checked93, checked94, checked95, checked96, checked97, checked98, checked99, checked100, checked101, checked102, checked103, checked104, checked105, checked106, checked107, checked108, checked109, checked110, checked111, checked112, checked113, checked114, checked115, checked116, checked117, Bool.true_and]

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
    checked118, checked119, checked120, checked121, checked122, checked123, checked124, checked125, checked126, checked127, Bool.true_and]

theorem period10_chunk_checked :
    Weights.batchCheck 10 (Data.period10Chunk.rows.map RowCoverage.TaggedRow.entry) = true := by
  rw [Data.period10Chunk_entries]
  exact period10_checked

theorem period10_each_checked {entry : Weights.Entry}
    (he : entry ∈ Data.period10Entries) :
    MaskWindows.windowCheck 10 (Weights.shapeWord entry) (Weights.siteWeights entry) = true :=
  Weights.batchCheck_entry period10_checked he

end FranklSmallCyclic.TransportBatches.G056.B002
