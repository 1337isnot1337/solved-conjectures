import Conjectures.LonelinessModularCoverFuelCuts
import Conjectures.LonelinessSixSpeedPrime0379B002Data

/-! Matched resource diagnostic on eight original support-frame propositions.
The whole prime is not claimed by this module. -/

namespace Loneliness.Modular.SixSpeed.Prime0379.FuelEightProbe

open Loneliness.Modular.SixSpeed.Prime0379.B002

set_option maxRecDepth 20000
set_option maxHeartbeats 0

theorem frame00000_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 0 3
      (fragments 0) (frames 0) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00001_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 1 3
      (fragments 1) (frames 1) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame01469_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 1469 3
      (fragments 1469) (frames 1469) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame01565_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 1565 3
      (fragments 1565) (frames 1565) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00002_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 2 3
      (fragments 2) (frames 2) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame01570_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 1570 3
      (fragments 1570) (frames 1570) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame01464_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 1464 3
      (fragments 1464) (frames 1464) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame01566_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 1566 3
      (fragments 1566) (frames 1566) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

end Loneliness.Modular.SixSpeed.Prime0379.FuelEightProbe
