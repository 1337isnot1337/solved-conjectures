import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 96 through 127. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0096_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 96 3
      (fragments 96) (frames 96) = true := by
  decide +kernel

private theorem frame0097_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 97 3
      (fragments 97) (frames 97) = true := by
  decide +kernel

private theorem frame0098_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 98 3
      (fragments 98) (frames 98) = true := by
  decide +kernel

private theorem frame0099_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 99 3
      (fragments 99) (frames 99) = true := by
  decide +kernel

private theorem frame0100_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 100 3
      (fragments 100) (frames 100) = true := by
  decide +kernel

private theorem frame0101_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 101 3
      (fragments 101) (frames 101) = true := by
  decide +kernel

private theorem frame0102_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 102 3
      (fragments 102) (frames 102) = true := by
  decide +kernel

private theorem frame0103_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 103 3
      (fragments 103) (frames 103) = true := by
  decide +kernel

private theorem frame0104_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 104 3
      (fragments 104) (frames 104) = true := by
  decide +kernel

private theorem frame0105_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 105 3
      (fragments 105) (frames 105) = true := by
  decide +kernel

private theorem frame0106_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 106 3
      (fragments 106) (frames 106) = true := by
  decide +kernel

private theorem frame0107_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 107 3
      (fragments 107) (frames 107) = true := by
  decide +kernel

private theorem frame0108_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 108 3
      (fragments 108) (frames 108) = true := by
  decide +kernel

private theorem frame0109_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 109 3
      (fragments 109) (frames 109) = true := by
  decide +kernel

private theorem frame0110_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 110 3
      (fragments 110) (frames 110) = true := by
  decide +kernel

private theorem frame0111_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 111 3
      (fragments 111) (frames 111) = true := by
  decide +kernel

private theorem frame0112_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 112 3
      (fragments 112) (frames 112) = true := by
  decide +kernel

private theorem frame0113_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 113 3
      (fragments 113) (frames 113) = true := by
  decide +kernel

private theorem frame0114_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 114 3
      (fragments 114) (frames 114) = true := by
  decide +kernel

private theorem frame0115_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 115 3
      (fragments 115) (frames 115) = true := by
  decide +kernel

private theorem frame0116_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 116 3
      (fragments 116) (frames 116) = true := by
  decide +kernel

private theorem frame0117_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 117 3
      (fragments 117) (frames 117) = true := by
  decide +kernel

private theorem frame0118_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 118 3
      (fragments 118) (frames 118) = true := by
  decide +kernel

private theorem frame0119_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 119 3
      (fragments 119) (frames 119) = true := by
  decide +kernel

private theorem frame0120_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 120 3
      (fragments 120) (frames 120) = true := by
  decide +kernel

private theorem frame0121_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 121 3
      (fragments 121) (frames 121) = true := by
  decide +kernel

private theorem frame0122_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 122 3
      (fragments 122) (frames 122) = true := by
  decide +kernel

private theorem frame0123_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 123 3
      (fragments 123) (frames 123) = true := by
  decide +kernel

private theorem frame0124_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 124 3
      (fragments 124) (frames 124) = true := by
  decide +kernel

private theorem frame0125_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 125 3
      (fragments 125) (frames 125) = true := by
  decide +kernel

private theorem frame0126_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 126 3
      (fragments 126) (frames 126) = true := by
  decide +kernel

private theorem frame0127_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 127 3
      (fragments 127) (frames 127) = true := by
  decide +kernel

theorem block03_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 96) 3
      (fragments (j.val + 96)) (frames (j.val + 96)) = true := by
  fin_cases j
  · exact frame0096_checked
  · exact frame0097_checked
  · exact frame0098_checked
  · exact frame0099_checked
  · exact frame0100_checked
  · exact frame0101_checked
  · exact frame0102_checked
  · exact frame0103_checked
  · exact frame0104_checked
  · exact frame0105_checked
  · exact frame0106_checked
  · exact frame0107_checked
  · exact frame0108_checked
  · exact frame0109_checked
  · exact frame0110_checked
  · exact frame0111_checked
  · exact frame0112_checked
  · exact frame0113_checked
  · exact frame0114_checked
  · exact frame0115_checked
  · exact frame0116_checked
  · exact frame0117_checked
  · exact frame0118_checked
  · exact frame0119_checked
  · exact frame0120_checked
  · exact frame0121_checked
  · exact frame0122_checked
  · exact frame0123_checked
  · exact frame0124_checked
  · exact frame0125_checked
  · exact frame0126_checked
  · exact frame0127_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
