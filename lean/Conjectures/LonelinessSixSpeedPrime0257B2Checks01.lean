import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 32 through 63. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0032_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 32 3
      (fragments 32) (frames 32) = true := by
  decide +kernel

private theorem frame0033_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 33 3
      (fragments 33) (frames 33) = true := by
  decide +kernel

private theorem frame0034_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 34 3
      (fragments 34) (frames 34) = true := by
  decide +kernel

private theorem frame0035_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 35 3
      (fragments 35) (frames 35) = true := by
  decide +kernel

private theorem frame0036_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 36 3
      (fragments 36) (frames 36) = true := by
  decide +kernel

private theorem frame0037_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 37 3
      (fragments 37) (frames 37) = true := by
  decide +kernel

private theorem frame0038_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 38 3
      (fragments 38) (frames 38) = true := by
  decide +kernel

private theorem frame0039_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 39 3
      (fragments 39) (frames 39) = true := by
  decide +kernel

private theorem frame0040_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 40 3
      (fragments 40) (frames 40) = true := by
  decide +kernel

private theorem frame0041_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 41 3
      (fragments 41) (frames 41) = true := by
  decide +kernel

private theorem frame0042_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 42 3
      (fragments 42) (frames 42) = true := by
  decide +kernel

private theorem frame0043_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 43 3
      (fragments 43) (frames 43) = true := by
  decide +kernel

private theorem frame0044_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 44 3
      (fragments 44) (frames 44) = true := by
  decide +kernel

private theorem frame0045_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 45 3
      (fragments 45) (frames 45) = true := by
  decide +kernel

private theorem frame0046_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 46 3
      (fragments 46) (frames 46) = true := by
  decide +kernel

private theorem frame0047_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 47 3
      (fragments 47) (frames 47) = true := by
  decide +kernel

private theorem frame0048_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 48 3
      (fragments 48) (frames 48) = true := by
  decide +kernel

private theorem frame0049_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 49 3
      (fragments 49) (frames 49) = true := by
  decide +kernel

private theorem frame0050_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 50 3
      (fragments 50) (frames 50) = true := by
  decide +kernel

private theorem frame0051_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 51 3
      (fragments 51) (frames 51) = true := by
  decide +kernel

private theorem frame0052_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 52 3
      (fragments 52) (frames 52) = true := by
  decide +kernel

private theorem frame0053_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 53 3
      (fragments 53) (frames 53) = true := by
  decide +kernel

private theorem frame0054_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 54 3
      (fragments 54) (frames 54) = true := by
  decide +kernel

private theorem frame0055_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 55 3
      (fragments 55) (frames 55) = true := by
  decide +kernel

private theorem frame0056_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 56 3
      (fragments 56) (frames 56) = true := by
  decide +kernel

private theorem frame0057_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 57 3
      (fragments 57) (frames 57) = true := by
  decide +kernel

private theorem frame0058_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 58 3
      (fragments 58) (frames 58) = true := by
  decide +kernel

private theorem frame0059_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 59 3
      (fragments 59) (frames 59) = true := by
  decide +kernel

private theorem frame0060_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 60 3
      (fragments 60) (frames 60) = true := by
  decide +kernel

private theorem frame0061_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 61 3
      (fragments 61) (frames 61) = true := by
  decide +kernel

private theorem frame0062_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 62 3
      (fragments 62) (frames 62) = true := by
  decide +kernel

private theorem frame0063_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 63 3
      (fragments 63) (frames 63) = true := by
  decide +kernel

theorem block01_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 32) 3
      (fragments (j.val + 32)) (frames (j.val + 32)) = true := by
  fin_cases j
  · exact frame0032_checked
  · exact frame0033_checked
  · exact frame0034_checked
  · exact frame0035_checked
  · exact frame0036_checked
  · exact frame0037_checked
  · exact frame0038_checked
  · exact frame0039_checked
  · exact frame0040_checked
  · exact frame0041_checked
  · exact frame0042_checked
  · exact frame0043_checked
  · exact frame0044_checked
  · exact frame0045_checked
  · exact frame0046_checked
  · exact frame0047_checked
  · exact frame0048_checked
  · exact frame0049_checked
  · exact frame0050_checked
  · exact frame0051_checked
  · exact frame0052_checked
  · exact frame0053_checked
  · exact frame0054_checked
  · exact frame0055_checked
  · exact frame0056_checked
  · exact frame0057_checked
  · exact frame0058_checked
  · exact frame0059_checked
  · exact frame0060_checked
  · exact frame0061_checked
  · exact frame0062_checked
  · exact frame0063_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
