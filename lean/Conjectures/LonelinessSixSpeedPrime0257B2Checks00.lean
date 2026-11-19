import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 0 through 31. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0000_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 0 3
      (fragments 0) (frames 0) = true := by
  decide +kernel

private theorem frame0001_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 1 3
      (fragments 1) (frames 1) = true := by
  decide +kernel

private theorem frame0002_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 2 3
      (fragments 2) (frames 2) = true := by
  decide +kernel

private theorem frame0003_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 3 3
      (fragments 3) (frames 3) = true := by
  decide +kernel

private theorem frame0004_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 4 3
      (fragments 4) (frames 4) = true := by
  decide +kernel

private theorem frame0005_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 5 3
      (fragments 5) (frames 5) = true := by
  decide +kernel

private theorem frame0006_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 6 3
      (fragments 6) (frames 6) = true := by
  decide +kernel

private theorem frame0007_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 7 3
      (fragments 7) (frames 7) = true := by
  decide +kernel

private theorem frame0008_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 8 3
      (fragments 8) (frames 8) = true := by
  decide +kernel

private theorem frame0009_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 9 3
      (fragments 9) (frames 9) = true := by
  decide +kernel

private theorem frame0010_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 10 3
      (fragments 10) (frames 10) = true := by
  decide +kernel

private theorem frame0011_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 11 3
      (fragments 11) (frames 11) = true := by
  decide +kernel

private theorem frame0012_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 12 3
      (fragments 12) (frames 12) = true := by
  decide +kernel

private theorem frame0013_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 13 3
      (fragments 13) (frames 13) = true := by
  decide +kernel

private theorem frame0014_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 14 3
      (fragments 14) (frames 14) = true := by
  decide +kernel

private theorem frame0015_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 15 3
      (fragments 15) (frames 15) = true := by
  decide +kernel

private theorem frame0016_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 16 3
      (fragments 16) (frames 16) = true := by
  decide +kernel

private theorem frame0017_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 17 3
      (fragments 17) (frames 17) = true := by
  decide +kernel

private theorem frame0018_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 18 3
      (fragments 18) (frames 18) = true := by
  decide +kernel

private theorem frame0019_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 19 3
      (fragments 19) (frames 19) = true := by
  decide +kernel

private theorem frame0020_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 20 3
      (fragments 20) (frames 20) = true := by
  decide +kernel

private theorem frame0021_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 21 3
      (fragments 21) (frames 21) = true := by
  decide +kernel

private theorem frame0022_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 22 3
      (fragments 22) (frames 22) = true := by
  decide +kernel

private theorem frame0023_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 23 3
      (fragments 23) (frames 23) = true := by
  decide +kernel

private theorem frame0024_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 24 3
      (fragments 24) (frames 24) = true := by
  decide +kernel

private theorem frame0025_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 25 3
      (fragments 25) (frames 25) = true := by
  decide +kernel

private theorem frame0026_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 26 3
      (fragments 26) (frames 26) = true := by
  decide +kernel

private theorem frame0027_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 27 3
      (fragments 27) (frames 27) = true := by
  decide +kernel

private theorem frame0028_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 28 3
      (fragments 28) (frames 28) = true := by
  decide +kernel

private theorem frame0029_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 29 3
      (fragments 29) (frames 29) = true := by
  decide +kernel

private theorem frame0030_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 30 3
      (fragments 30) (frames 30) = true := by
  decide +kernel

private theorem frame0031_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 31 3
      (fragments 31) (frames 31) = true := by
  decide +kernel

theorem block00_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 0) 3
      (fragments (j.val + 0)) (frames (j.val + 0)) = true := by
  fin_cases j
  · exact frame0000_checked
  · exact frame0001_checked
  · exact frame0002_checked
  · exact frame0003_checked
  · exact frame0004_checked
  · exact frame0005_checked
  · exact frame0006_checked
  · exact frame0007_checked
  · exact frame0008_checked
  · exact frame0009_checked
  · exact frame0010_checked
  · exact frame0011_checked
  · exact frame0012_checked
  · exact frame0013_checked
  · exact frame0014_checked
  · exact frame0015_checked
  · exact frame0016_checked
  · exact frame0017_checked
  · exact frame0018_checked
  · exact frame0019_checked
  · exact frame0020_checked
  · exact frame0021_checked
  · exact frame0022_checked
  · exact frame0023_checked
  · exact frame0024_checked
  · exact frame0025_checked
  · exact frame0026_checked
  · exact frame0027_checked
  · exact frame0028_checked
  · exact frame0029_checked
  · exact frame0030_checked
  · exact frame0031_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
