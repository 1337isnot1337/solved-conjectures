import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 192 through 223. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0192_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 192 3
      (fragments 192) (frames 192) = true := by
  decide +kernel

private theorem frame0193_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 193 3
      (fragments 193) (frames 193) = true := by
  decide +kernel

private theorem frame0194_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 194 3
      (fragments 194) (frames 194) = true := by
  decide +kernel

private theorem frame0195_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 195 3
      (fragments 195) (frames 195) = true := by
  decide +kernel

private theorem frame0196_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 196 3
      (fragments 196) (frames 196) = true := by
  decide +kernel

private theorem frame0197_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 197 3
      (fragments 197) (frames 197) = true := by
  decide +kernel

private theorem frame0198_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 198 3
      (fragments 198) (frames 198) = true := by
  decide +kernel

private theorem frame0199_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 199 3
      (fragments 199) (frames 199) = true := by
  decide +kernel

private theorem frame0200_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 200 3
      (fragments 200) (frames 200) = true := by
  decide +kernel

private theorem frame0201_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 201 3
      (fragments 201) (frames 201) = true := by
  decide +kernel

private theorem frame0202_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 202 3
      (fragments 202) (frames 202) = true := by
  decide +kernel

private theorem frame0203_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 203 3
      (fragments 203) (frames 203) = true := by
  decide +kernel

private theorem frame0204_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 204 3
      (fragments 204) (frames 204) = true := by
  decide +kernel

private theorem frame0205_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 205 3
      (fragments 205) (frames 205) = true := by
  decide +kernel

private theorem frame0206_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 206 3
      (fragments 206) (frames 206) = true := by
  decide +kernel

private theorem frame0207_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 207 3
      (fragments 207) (frames 207) = true := by
  decide +kernel

private theorem frame0208_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 208 3
      (fragments 208) (frames 208) = true := by
  decide +kernel

private theorem frame0209_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 209 3
      (fragments 209) (frames 209) = true := by
  decide +kernel

private theorem frame0210_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 210 3
      (fragments 210) (frames 210) = true := by
  decide +kernel

private theorem frame0211_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 211 3
      (fragments 211) (frames 211) = true := by
  decide +kernel

private theorem frame0212_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 212 3
      (fragments 212) (frames 212) = true := by
  decide +kernel

private theorem frame0213_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 213 3
      (fragments 213) (frames 213) = true := by
  decide +kernel

private theorem frame0214_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 214 3
      (fragments 214) (frames 214) = true := by
  decide +kernel

private theorem frame0215_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 215 3
      (fragments 215) (frames 215) = true := by
  decide +kernel

private theorem frame0216_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 216 3
      (fragments 216) (frames 216) = true := by
  decide +kernel

private theorem frame0217_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 217 3
      (fragments 217) (frames 217) = true := by
  decide +kernel

private theorem frame0218_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 218 3
      (fragments 218) (frames 218) = true := by
  decide +kernel

private theorem frame0219_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 219 3
      (fragments 219) (frames 219) = true := by
  decide +kernel

private theorem frame0220_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 220 3
      (fragments 220) (frames 220) = true := by
  decide +kernel

private theorem frame0221_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 221 3
      (fragments 221) (frames 221) = true := by
  decide +kernel

private theorem frame0222_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 222 3
      (fragments 222) (frames 222) = true := by
  decide +kernel

private theorem frame0223_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 223 3
      (fragments 223) (frames 223) = true := by
  decide +kernel

theorem block06_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 192) 3
      (fragments (j.val + 192)) (frames (j.val + 192)) = true := by
  fin_cases j
  · exact frame0192_checked
  · exact frame0193_checked
  · exact frame0194_checked
  · exact frame0195_checked
  · exact frame0196_checked
  · exact frame0197_checked
  · exact frame0198_checked
  · exact frame0199_checked
  · exact frame0200_checked
  · exact frame0201_checked
  · exact frame0202_checked
  · exact frame0203_checked
  · exact frame0204_checked
  · exact frame0205_checked
  · exact frame0206_checked
  · exact frame0207_checked
  · exact frame0208_checked
  · exact frame0209_checked
  · exact frame0210_checked
  · exact frame0211_checked
  · exact frame0212_checked
  · exact frame0213_checked
  · exact frame0214_checked
  · exact frame0215_checked
  · exact frame0216_checked
  · exact frame0217_checked
  · exact frame0218_checked
  · exact frame0219_checked
  · exact frame0220_checked
  · exact frame0221_checked
  · exact frame0222_checked
  · exact frame0223_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
