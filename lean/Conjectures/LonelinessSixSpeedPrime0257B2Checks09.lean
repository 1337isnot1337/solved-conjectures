import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 288 through 319. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0288_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 288 3
      (fragments 288) (frames 288) = true := by
  decide +kernel

private theorem frame0289_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 289 3
      (fragments 289) (frames 289) = true := by
  decide +kernel

private theorem frame0290_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 290 3
      (fragments 290) (frames 290) = true := by
  decide +kernel

private theorem frame0291_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 291 3
      (fragments 291) (frames 291) = true := by
  decide +kernel

private theorem frame0292_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 292 3
      (fragments 292) (frames 292) = true := by
  decide +kernel

private theorem frame0293_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 293 3
      (fragments 293) (frames 293) = true := by
  decide +kernel

private theorem frame0294_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 294 3
      (fragments 294) (frames 294) = true := by
  decide +kernel

private theorem frame0295_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 295 3
      (fragments 295) (frames 295) = true := by
  decide +kernel

private theorem frame0296_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 296 3
      (fragments 296) (frames 296) = true := by
  decide +kernel

private theorem frame0297_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 297 3
      (fragments 297) (frames 297) = true := by
  decide +kernel

private theorem frame0298_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 298 3
      (fragments 298) (frames 298) = true := by
  decide +kernel

private theorem frame0299_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 299 3
      (fragments 299) (frames 299) = true := by
  decide +kernel

private theorem frame0300_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 300 3
      (fragments 300) (frames 300) = true := by
  decide +kernel

private theorem frame0301_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 301 3
      (fragments 301) (frames 301) = true := by
  decide +kernel

private theorem frame0302_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 302 3
      (fragments 302) (frames 302) = true := by
  decide +kernel

private theorem frame0303_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 303 3
      (fragments 303) (frames 303) = true := by
  decide +kernel

private theorem frame0304_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 304 3
      (fragments 304) (frames 304) = true := by
  decide +kernel

private theorem frame0305_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 305 3
      (fragments 305) (frames 305) = true := by
  decide +kernel

private theorem frame0306_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 306 3
      (fragments 306) (frames 306) = true := by
  decide +kernel

private theorem frame0307_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 307 3
      (fragments 307) (frames 307) = true := by
  decide +kernel

private theorem frame0308_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 308 3
      (fragments 308) (frames 308) = true := by
  decide +kernel

private theorem frame0309_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 309 3
      (fragments 309) (frames 309) = true := by
  decide +kernel

private theorem frame0310_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 310 3
      (fragments 310) (frames 310) = true := by
  decide +kernel

private theorem frame0311_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 311 3
      (fragments 311) (frames 311) = true := by
  decide +kernel

private theorem frame0312_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 312 3
      (fragments 312) (frames 312) = true := by
  decide +kernel

private theorem frame0313_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 313 3
      (fragments 313) (frames 313) = true := by
  decide +kernel

private theorem frame0314_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 314 3
      (fragments 314) (frames 314) = true := by
  decide +kernel

private theorem frame0315_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 315 3
      (fragments 315) (frames 315) = true := by
  decide +kernel

private theorem frame0316_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 316 3
      (fragments 316) (frames 316) = true := by
  decide +kernel

private theorem frame0317_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 317 3
      (fragments 317) (frames 317) = true := by
  decide +kernel

private theorem frame0318_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 318 3
      (fragments 318) (frames 318) = true := by
  decide +kernel

private theorem frame0319_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 319 3
      (fragments 319) (frames 319) = true := by
  decide +kernel

theorem block09_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 288) 3
      (fragments (j.val + 288)) (frames (j.val + 288)) = true := by
  fin_cases j
  · exact frame0288_checked
  · exact frame0289_checked
  · exact frame0290_checked
  · exact frame0291_checked
  · exact frame0292_checked
  · exact frame0293_checked
  · exact frame0294_checked
  · exact frame0295_checked
  · exact frame0296_checked
  · exact frame0297_checked
  · exact frame0298_checked
  · exact frame0299_checked
  · exact frame0300_checked
  · exact frame0301_checked
  · exact frame0302_checked
  · exact frame0303_checked
  · exact frame0304_checked
  · exact frame0305_checked
  · exact frame0306_checked
  · exact frame0307_checked
  · exact frame0308_checked
  · exact frame0309_checked
  · exact frame0310_checked
  · exact frame0311_checked
  · exact frame0312_checked
  · exact frame0313_checked
  · exact frame0314_checked
  · exact frame0315_checked
  · exact frame0316_checked
  · exact frame0317_checked
  · exact frame0318_checked
  · exact frame0319_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
