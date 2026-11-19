import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 64 through 95. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0064_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 64 3
      (fragments 64) (frames 64) = true := by
  decide +kernel

private theorem frame0065_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 65 3
      (fragments 65) (frames 65) = true := by
  decide +kernel

private theorem frame0066_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 66 3
      (fragments 66) (frames 66) = true := by
  decide +kernel

private theorem frame0067_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 67 3
      (fragments 67) (frames 67) = true := by
  decide +kernel

private theorem frame0068_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 68 3
      (fragments 68) (frames 68) = true := by
  decide +kernel

private theorem frame0069_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 69 3
      (fragments 69) (frames 69) = true := by
  decide +kernel

private theorem frame0070_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 70 3
      (fragments 70) (frames 70) = true := by
  decide +kernel

private theorem frame0071_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 71 3
      (fragments 71) (frames 71) = true := by
  decide +kernel

private theorem frame0072_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 72 3
      (fragments 72) (frames 72) = true := by
  decide +kernel

private theorem frame0073_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 73 3
      (fragments 73) (frames 73) = true := by
  decide +kernel

private theorem frame0074_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 74 3
      (fragments 74) (frames 74) = true := by
  decide +kernel

private theorem frame0075_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 75 3
      (fragments 75) (frames 75) = true := by
  decide +kernel

private theorem frame0076_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 76 3
      (fragments 76) (frames 76) = true := by
  decide +kernel

private theorem frame0077_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 77 3
      (fragments 77) (frames 77) = true := by
  decide +kernel

private theorem frame0078_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 78 3
      (fragments 78) (frames 78) = true := by
  decide +kernel

private theorem frame0079_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 79 3
      (fragments 79) (frames 79) = true := by
  decide +kernel

private theorem frame0080_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 80 3
      (fragments 80) (frames 80) = true := by
  decide +kernel

private theorem frame0081_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 81 3
      (fragments 81) (frames 81) = true := by
  decide +kernel

private theorem frame0082_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 82 3
      (fragments 82) (frames 82) = true := by
  decide +kernel

private theorem frame0083_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 83 3
      (fragments 83) (frames 83) = true := by
  decide +kernel

private theorem frame0084_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 84 3
      (fragments 84) (frames 84) = true := by
  decide +kernel

private theorem frame0085_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 85 3
      (fragments 85) (frames 85) = true := by
  decide +kernel

private theorem frame0086_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 86 3
      (fragments 86) (frames 86) = true := by
  decide +kernel

private theorem frame0087_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 87 3
      (fragments 87) (frames 87) = true := by
  decide +kernel

private theorem frame0088_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 88 3
      (fragments 88) (frames 88) = true := by
  decide +kernel

private theorem frame0089_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 89 3
      (fragments 89) (frames 89) = true := by
  decide +kernel

private theorem frame0090_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 90 3
      (fragments 90) (frames 90) = true := by
  decide +kernel

private theorem frame0091_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 91 3
      (fragments 91) (frames 91) = true := by
  decide +kernel

private theorem frame0092_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 92 3
      (fragments 92) (frames 92) = true := by
  decide +kernel

private theorem frame0093_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 93 3
      (fragments 93) (frames 93) = true := by
  decide +kernel

private theorem frame0094_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 94 3
      (fragments 94) (frames 94) = true := by
  decide +kernel

private theorem frame0095_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 95 3
      (fragments 95) (frames 95) = true := by
  decide +kernel

theorem block02_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 64) 3
      (fragments (j.val + 64)) (frames (j.val + 64)) = true := by
  fin_cases j
  · exact frame0064_checked
  · exact frame0065_checked
  · exact frame0066_checked
  · exact frame0067_checked
  · exact frame0068_checked
  · exact frame0069_checked
  · exact frame0070_checked
  · exact frame0071_checked
  · exact frame0072_checked
  · exact frame0073_checked
  · exact frame0074_checked
  · exact frame0075_checked
  · exact frame0076_checked
  · exact frame0077_checked
  · exact frame0078_checked
  · exact frame0079_checked
  · exact frame0080_checked
  · exact frame0081_checked
  · exact frame0082_checked
  · exact frame0083_checked
  · exact frame0084_checked
  · exact frame0085_checked
  · exact frame0086_checked
  · exact frame0087_checked
  · exact frame0088_checked
  · exact frame0089_checked
  · exact frame0090_checked
  · exact frame0091_checked
  · exact frame0092_checked
  · exact frame0093_checked
  · exact frame0094_checked
  · exact frame0095_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
