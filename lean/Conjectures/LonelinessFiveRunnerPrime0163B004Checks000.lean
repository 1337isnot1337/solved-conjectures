import Conjectures.LonelinessModularCoverFuelCuts
import Conjectures.LonelinessFiveRunnerPrime0163B004Data
import Mathlib.Tactic.FinCases

/-! Exact bounded support checks for frames 0 through 127. -/

namespace Loneliness.Modular.FiveRunner.Prime0163.B004

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

theorem frame00002_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 2 3
      (fragments 2) (frames 2) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00003_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 3 3
      (fragments 3) (frames 3) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00004_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 4 3
      (fragments 4) (frames 4) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00005_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 5 3
      (fragments 5) (frames 5) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00006_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 6 3
      (fragments 6) (frames 6) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00007_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 7 3
      (fragments 7) (frames 7) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00008_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 8 3
      (fragments 8) (frames 8) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00009_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 9 3
      (fragments 9) (frames 9) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00010_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 10 3
      (fragments 10) (frames 10) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00011_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 11 3
      (fragments 11) (frames 11) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00012_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 12 3
      (fragments 12) (frames 12) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00013_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 13 3
      (fragments 13) (frames 13) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00014_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 14 3
      (fragments 14) (frames 14) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00015_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 15 3
      (fragments 15) (frames 15) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00016_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 16 3
      (fragments 16) (frames 16) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00017_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 17 3
      (fragments 17) (frames 17) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00018_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 18 3
      (fragments 18) (frames 18) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00019_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 19 3
      (fragments 19) (frames 19) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00020_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 20 3
      (fragments 20) (frames 20) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00021_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 21 3
      (fragments 21) (frames 21) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00022_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 22 3
      (fragments 22) (frames 22) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00023_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 23 3
      (fragments 23) (frames 23) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00024_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 24 3
      (fragments 24) (frames 24) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00025_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 25 3
      (fragments 25) (frames 25) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00026_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 26 3
      (fragments 26) (frames 26) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00027_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 27 3
      (fragments 27) (frames 27) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00028_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 28 3
      (fragments 28) (frames 28) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00029_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 29 3
      (fragments 29) (frames 29) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00030_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 30 3
      (fragments 30) (frames 30) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00031_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 31 3
      (fragments 31) (frames 31) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00032_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 32 3
      (fragments 32) (frames 32) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00033_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 33 3
      (fragments 33) (frames 33) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00034_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 34 3
      (fragments 34) (frames 34) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00035_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 35 3
      (fragments 35) (frames 35) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00036_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 36 3
      (fragments 36) (frames 36) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00037_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 37 3
      (fragments 37) (frames 37) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00038_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 38 3
      (fragments 38) (frames 38) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00039_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 39 3
      (fragments 39) (frames 39) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00040_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 40 3
      (fragments 40) (frames 40) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00041_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 41 3
      (fragments 41) (frames 41) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00042_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 42 3
      (fragments 42) (frames 42) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00043_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 43 3
      (fragments 43) (frames 43) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00044_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 44 3
      (fragments 44) (frames 44) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00045_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 45 3
      (fragments 45) (frames 45) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00046_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 46 3
      (fragments 46) (frames 46) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00047_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 47 3
      (fragments 47) (frames 47) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00048_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 48 3
      (fragments 48) (frames 48) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00049_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 49 3
      (fragments 49) (frames 49) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00050_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 50 3
      (fragments 50) (frames 50) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00051_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 51 3
      (fragments 51) (frames 51) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00052_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 52 3
      (fragments 52) (frames 52) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00053_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 53 3
      (fragments 53) (frames 53) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00054_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 54 3
      (fragments 54) (frames 54) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00055_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 55 3
      (fragments 55) (frames 55) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00056_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 56 3
      (fragments 56) (frames 56) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00057_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 57 3
      (fragments 57) (frames 57) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00058_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 58 3
      (fragments 58) (frames 58) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00059_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 59 3
      (fragments 59) (frames 59) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00060_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 60 3
      (fragments 60) (frames 60) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00061_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 61 3
      (fragments 61) (frames 61) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00062_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 62 3
      (fragments 62) (frames 62) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00063_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 63 3
      (fragments 63) (frames 63) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00064_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 64 3
      (fragments 64) (frames 64) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00065_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 65 3
      (fragments 65) (frames 65) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00066_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 66 3
      (fragments 66) (frames 66) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00067_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 67 3
      (fragments 67) (frames 67) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00068_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 68 3
      (fragments 68) (frames 68) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00069_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 69 3
      (fragments 69) (frames 69) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00070_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 70 3
      (fragments 70) (frames 70) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00071_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 71 3
      (fragments 71) (frames 71) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00072_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 72 3
      (fragments 72) (frames 72) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00073_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 73 3
      (fragments 73) (frames 73) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00074_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 74 3
      (fragments 74) (frames 74) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00075_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 75 3
      (fragments 75) (frames 75) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00076_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 76 3
      (fragments 76) (frames 76) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00077_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 77 3
      (fragments 77) (frames 77) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00078_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 78 3
      (fragments 78) (frames 78) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00079_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 79 3
      (fragments 79) (frames 79) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00080_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 80 3
      (fragments 80) (frames 80) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00081_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 81 3
      (fragments 81) (frames 81) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00082_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 82 3
      (fragments 82) (frames 82) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00083_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 83 3
      (fragments 83) (frames 83) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00084_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 84 3
      (fragments 84) (frames 84) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00085_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 85 3
      (fragments 85) (frames 85) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00086_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 86 3
      (fragments 86) (frames 86) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00087_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 87 3
      (fragments 87) (frames 87) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00088_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 88 3
      (fragments 88) (frames 88) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00089_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 89 3
      (fragments 89) (frames 89) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00090_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 90 3
      (fragments 90) (frames 90) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00091_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 91 3
      (fragments 91) (frames 91) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00092_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 92 3
      (fragments 92) (frames 92) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00093_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 93 3
      (fragments 93) (frames 93) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00094_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 94 3
      (fragments 94) (frames 94) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00095_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 95 3
      (fragments 95) (frames 95) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00096_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 96 3
      (fragments 96) (frames 96) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00097_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 97 3
      (fragments 97) (frames 97) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00098_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 98 3
      (fragments 98) (frames 98) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00099_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 99 3
      (fragments 99) (frames 99) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00100_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 100 3
      (fragments 100) (frames 100) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00101_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 101 3
      (fragments 101) (frames 101) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00102_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 102 3
      (fragments 102) (frames 102) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00103_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 103 3
      (fragments 103) (frames 103) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00104_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 104 3
      (fragments 104) (frames 104) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00105_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 105 3
      (fragments 105) (frames 105) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00106_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 106 3
      (fragments 106) (frames 106) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00107_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 107 3
      (fragments 107) (frames 107) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00108_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 108 3
      (fragments 108) (frames 108) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00109_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 109 3
      (fragments 109) (frames 109) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00110_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 110 3
      (fragments 110) (frames 110) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00111_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 111 3
      (fragments 111) (frames 111) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00112_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 112 3
      (fragments 112) (frames 112) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00113_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 113 3
      (fragments 113) (frames 113) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00114_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 114 3
      (fragments 114) (frames 114) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00115_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 115 3
      (fragments 115) (frames 115) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00116_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 116 3
      (fragments 116) (frames 116) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00117_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 117 3
      (fragments 117) (frames 117) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00118_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 118 3
      (fragments 118) (frames 118) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00119_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 119 3
      (fragments 119) (frames 119) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00120_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 120 3
      (fragments 120) (frames 120) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00121_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 121 3
      (fragments 121) (frames 121) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00122_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 122 3
      (fragments 122) (frames 122) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00123_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 123 3
      (fragments 123) (frames 123) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00124_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 124 3
      (fragments 124) (frames 124) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00125_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 125 3
      (fragments 125) (frames 125) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00126_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 126 3
      (fragments 126) (frames 126) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem frame00127_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 127 3
      (fragments 127) (frames 127) = true := by
  apply SupportSearch.Bits.FuelCuts.boundedCheck_sound
  decide +kernel

theorem block000_checked (j : Fin 128) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 0) 3
      (fragments (j.val + 0)) (frames (j.val + 0)) = true := by
  fin_cases j
  · exact frame00000_checked
  · exact frame00001_checked
  · exact frame00002_checked
  · exact frame00003_checked
  · exact frame00004_checked
  · exact frame00005_checked
  · exact frame00006_checked
  · exact frame00007_checked
  · exact frame00008_checked
  · exact frame00009_checked
  · exact frame00010_checked
  · exact frame00011_checked
  · exact frame00012_checked
  · exact frame00013_checked
  · exact frame00014_checked
  · exact frame00015_checked
  · exact frame00016_checked
  · exact frame00017_checked
  · exact frame00018_checked
  · exact frame00019_checked
  · exact frame00020_checked
  · exact frame00021_checked
  · exact frame00022_checked
  · exact frame00023_checked
  · exact frame00024_checked
  · exact frame00025_checked
  · exact frame00026_checked
  · exact frame00027_checked
  · exact frame00028_checked
  · exact frame00029_checked
  · exact frame00030_checked
  · exact frame00031_checked
  · exact frame00032_checked
  · exact frame00033_checked
  · exact frame00034_checked
  · exact frame00035_checked
  · exact frame00036_checked
  · exact frame00037_checked
  · exact frame00038_checked
  · exact frame00039_checked
  · exact frame00040_checked
  · exact frame00041_checked
  · exact frame00042_checked
  · exact frame00043_checked
  · exact frame00044_checked
  · exact frame00045_checked
  · exact frame00046_checked
  · exact frame00047_checked
  · exact frame00048_checked
  · exact frame00049_checked
  · exact frame00050_checked
  · exact frame00051_checked
  · exact frame00052_checked
  · exact frame00053_checked
  · exact frame00054_checked
  · exact frame00055_checked
  · exact frame00056_checked
  · exact frame00057_checked
  · exact frame00058_checked
  · exact frame00059_checked
  · exact frame00060_checked
  · exact frame00061_checked
  · exact frame00062_checked
  · exact frame00063_checked
  · exact frame00064_checked
  · exact frame00065_checked
  · exact frame00066_checked
  · exact frame00067_checked
  · exact frame00068_checked
  · exact frame00069_checked
  · exact frame00070_checked
  · exact frame00071_checked
  · exact frame00072_checked
  · exact frame00073_checked
  · exact frame00074_checked
  · exact frame00075_checked
  · exact frame00076_checked
  · exact frame00077_checked
  · exact frame00078_checked
  · exact frame00079_checked
  · exact frame00080_checked
  · exact frame00081_checked
  · exact frame00082_checked
  · exact frame00083_checked
  · exact frame00084_checked
  · exact frame00085_checked
  · exact frame00086_checked
  · exact frame00087_checked
  · exact frame00088_checked
  · exact frame00089_checked
  · exact frame00090_checked
  · exact frame00091_checked
  · exact frame00092_checked
  · exact frame00093_checked
  · exact frame00094_checked
  · exact frame00095_checked
  · exact frame00096_checked
  · exact frame00097_checked
  · exact frame00098_checked
  · exact frame00099_checked
  · exact frame00100_checked
  · exact frame00101_checked
  · exact frame00102_checked
  · exact frame00103_checked
  · exact frame00104_checked
  · exact frame00105_checked
  · exact frame00106_checked
  · exact frame00107_checked
  · exact frame00108_checked
  · exact frame00109_checked
  · exact frame00110_checked
  · exact frame00111_checked
  · exact frame00112_checked
  · exact frame00113_checked
  · exact frame00114_checked
  · exact frame00115_checked
  · exact frame00116_checked
  · exact frame00117_checked
  · exact frame00118_checked
  · exact frame00119_checked
  · exact frame00120_checked
  · exact frame00121_checked
  · exact frame00122_checked
  · exact frame00123_checked
  · exact frame00124_checked
  · exact frame00125_checked
  · exact frame00126_checked
  · exact frame00127_checked

end Loneliness.Modular.FiveRunner.Prime0163.B004
