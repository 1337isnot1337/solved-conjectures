import Conjectures.LonelinessModularCoverFuelCuts
import Conjectures.LonelinessFiveRunnerPrime0163B004Data
import Mathlib.Tactic.FinCases

/-! Exact bounded support checks for frames 128 through 138. -/

namespace Loneliness.Modular.FiveRunner.Prime0163.B004

set_option maxRecDepth 20000
set_option maxHeartbeats 0

theorem frame00128_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 128 3
      (fragments 128) (frames 128) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00129_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 129 3
      (fragments 129) (frames 129) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00130_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 130 3
      (fragments 130) (frames 130) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00131_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 131 3
      (fragments 131) (frames 131) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00132_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 132 3
      (fragments 132) (frames 132) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00133_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 133 3
      (fragments 133) (frames 133) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00134_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 134 3
      (fragments 134) (frames 134) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00135_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 135 3
      (fragments 135) (frames 135) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00136_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 136 3
      (fragments 136) (frames 136) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00137_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 137 3
      (fragments 137) (frames 137) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00138_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 138 3
      (fragments 138) (frames 138) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem block001_checked (j : Fin 11) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 128) 3
      (fragments (j.val + 128)) (frames (j.val + 128)) = true := by
  fin_cases j
  · exact frame00128_checked
  · exact frame00129_checked
  · exact frame00130_checked
  · exact frame00131_checked
  · exact frame00132_checked
  · exact frame00133_checked
  · exact frame00134_checked
  · exact frame00135_checked
  · exact frame00136_checked
  · exact frame00137_checked
  · exact frame00138_checked

end Loneliness.Modular.FiveRunner.Prime0163.B004
