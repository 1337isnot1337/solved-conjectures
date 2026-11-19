import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 256 through 287. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0256_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 256 3
      (fragments 256) (frames 256) = true := by
  decide +kernel

private theorem frame0257_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 257 3
      (fragments 257) (frames 257) = true := by
  decide +kernel

private theorem frame0258_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 258 3
      (fragments 258) (frames 258) = true := by
  decide +kernel

private theorem frame0259_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 259 3
      (fragments 259) (frames 259) = true := by
  decide +kernel

private theorem frame0260_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 260 3
      (fragments 260) (frames 260) = true := by
  decide +kernel

private theorem frame0261_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 261 3
      (fragments 261) (frames 261) = true := by
  decide +kernel

private theorem frame0262_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 262 3
      (fragments 262) (frames 262) = true := by
  decide +kernel

private theorem frame0263_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 263 3
      (fragments 263) (frames 263) = true := by
  decide +kernel

private theorem frame0264_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 264 3
      (fragments 264) (frames 264) = true := by
  decide +kernel

private theorem frame0265_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 265 3
      (fragments 265) (frames 265) = true := by
  decide +kernel

private theorem frame0266_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 266 3
      (fragments 266) (frames 266) = true := by
  decide +kernel

private theorem frame0267_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 267 3
      (fragments 267) (frames 267) = true := by
  decide +kernel

private theorem frame0268_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 268 3
      (fragments 268) (frames 268) = true := by
  decide +kernel

private theorem frame0269_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 269 3
      (fragments 269) (frames 269) = true := by
  decide +kernel

private theorem frame0270_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 270 3
      (fragments 270) (frames 270) = true := by
  decide +kernel

private theorem frame0271_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 271 3
      (fragments 271) (frames 271) = true := by
  decide +kernel

private theorem frame0272_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 272 3
      (fragments 272) (frames 272) = true := by
  decide +kernel

private theorem frame0273_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 273 3
      (fragments 273) (frames 273) = true := by
  decide +kernel

private theorem frame0274_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 274 3
      (fragments 274) (frames 274) = true := by
  decide +kernel

private theorem frame0275_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 275 3
      (fragments 275) (frames 275) = true := by
  decide +kernel

private theorem frame0276_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 276 3
      (fragments 276) (frames 276) = true := by
  decide +kernel

private theorem frame0277_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 277 3
      (fragments 277) (frames 277) = true := by
  decide +kernel

private theorem frame0278_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 278 3
      (fragments 278) (frames 278) = true := by
  decide +kernel

private theorem frame0279_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 279 3
      (fragments 279) (frames 279) = true := by
  decide +kernel

private theorem frame0280_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 280 3
      (fragments 280) (frames 280) = true := by
  decide +kernel

private theorem frame0281_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 281 3
      (fragments 281) (frames 281) = true := by
  decide +kernel

private theorem frame0282_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 282 3
      (fragments 282) (frames 282) = true := by
  decide +kernel

private theorem frame0283_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 283 3
      (fragments 283) (frames 283) = true := by
  decide +kernel

private theorem frame0284_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 284 3
      (fragments 284) (frames 284) = true := by
  decide +kernel

private theorem frame0285_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 285 3
      (fragments 285) (frames 285) = true := by
  decide +kernel

private theorem frame0286_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 286 3
      (fragments 286) (frames 286) = true := by
  decide +kernel

private theorem frame0287_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 287 3
      (fragments 287) (frames 287) = true := by
  decide +kernel

theorem block08_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 256) 3
      (fragments (j.val + 256)) (frames (j.val + 256)) = true := by
  fin_cases j
  · exact frame0256_checked
  · exact frame0257_checked
  · exact frame0258_checked
  · exact frame0259_checked
  · exact frame0260_checked
  · exact frame0261_checked
  · exact frame0262_checked
  · exact frame0263_checked
  · exact frame0264_checked
  · exact frame0265_checked
  · exact frame0266_checked
  · exact frame0267_checked
  · exact frame0268_checked
  · exact frame0269_checked
  · exact frame0270_checked
  · exact frame0271_checked
  · exact frame0272_checked
  · exact frame0273_checked
  · exact frame0274_checked
  · exact frame0275_checked
  · exact frame0276_checked
  · exact frame0277_checked
  · exact frame0278_checked
  · exact frame0279_checked
  · exact frame0280_checked
  · exact frame0281_checked
  · exact frame0282_checked
  · exact frame0283_checked
  · exact frame0284_checked
  · exact frame0285_checked
  · exact frame0286_checked
  · exact frame0287_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
