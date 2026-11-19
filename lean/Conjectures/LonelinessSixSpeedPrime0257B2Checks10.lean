import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 320 through 351. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0320_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 320 3
      (fragments 320) (frames 320) = true := by
  decide +kernel

private theorem frame0321_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 321 3
      (fragments 321) (frames 321) = true := by
  decide +kernel

private theorem frame0322_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 322 3
      (fragments 322) (frames 322) = true := by
  decide +kernel

private theorem frame0323_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 323 3
      (fragments 323) (frames 323) = true := by
  decide +kernel

private theorem frame0324_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 324 3
      (fragments 324) (frames 324) = true := by
  decide +kernel

private theorem frame0325_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 325 3
      (fragments 325) (frames 325) = true := by
  decide +kernel

private theorem frame0326_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 326 3
      (fragments 326) (frames 326) = true := by
  decide +kernel

private theorem frame0327_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 327 3
      (fragments 327) (frames 327) = true := by
  decide +kernel

private theorem frame0328_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 328 3
      (fragments 328) (frames 328) = true := by
  decide +kernel

private theorem frame0329_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 329 3
      (fragments 329) (frames 329) = true := by
  decide +kernel

private theorem frame0330_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 330 3
      (fragments 330) (frames 330) = true := by
  decide +kernel

private theorem frame0331_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 331 3
      (fragments 331) (frames 331) = true := by
  decide +kernel

private theorem frame0332_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 332 3
      (fragments 332) (frames 332) = true := by
  decide +kernel

private theorem frame0333_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 333 3
      (fragments 333) (frames 333) = true := by
  decide +kernel

private theorem frame0334_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 334 3
      (fragments 334) (frames 334) = true := by
  decide +kernel

private theorem frame0335_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 335 3
      (fragments 335) (frames 335) = true := by
  decide +kernel

private theorem frame0336_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 336 3
      (fragments 336) (frames 336) = true := by
  decide +kernel

private theorem frame0337_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 337 3
      (fragments 337) (frames 337) = true := by
  decide +kernel

private theorem frame0338_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 338 3
      (fragments 338) (frames 338) = true := by
  decide +kernel

private theorem frame0339_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 339 3
      (fragments 339) (frames 339) = true := by
  decide +kernel

private theorem frame0340_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 340 3
      (fragments 340) (frames 340) = true := by
  decide +kernel

private theorem frame0341_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 341 3
      (fragments 341) (frames 341) = true := by
  decide +kernel

private theorem frame0342_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 342 3
      (fragments 342) (frames 342) = true := by
  decide +kernel

private theorem frame0343_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 343 3
      (fragments 343) (frames 343) = true := by
  decide +kernel

private theorem frame0344_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 344 3
      (fragments 344) (frames 344) = true := by
  decide +kernel

private theorem frame0345_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 345 3
      (fragments 345) (frames 345) = true := by
  decide +kernel

private theorem frame0346_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 346 3
      (fragments 346) (frames 346) = true := by
  decide +kernel

private theorem frame0347_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 347 3
      (fragments 347) (frames 347) = true := by
  decide +kernel

private theorem frame0348_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 348 3
      (fragments 348) (frames 348) = true := by
  decide +kernel

private theorem frame0349_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 349 3
      (fragments 349) (frames 349) = true := by
  decide +kernel

private theorem frame0350_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 350 3
      (fragments 350) (frames 350) = true := by
  decide +kernel

private theorem frame0351_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 351 3
      (fragments 351) (frames 351) = true := by
  decide +kernel

theorem block10_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 320) 3
      (fragments (j.val + 320)) (frames (j.val + 320)) = true := by
  fin_cases j
  · exact frame0320_checked
  · exact frame0321_checked
  · exact frame0322_checked
  · exact frame0323_checked
  · exact frame0324_checked
  · exact frame0325_checked
  · exact frame0326_checked
  · exact frame0327_checked
  · exact frame0328_checked
  · exact frame0329_checked
  · exact frame0330_checked
  · exact frame0331_checked
  · exact frame0332_checked
  · exact frame0333_checked
  · exact frame0334_checked
  · exact frame0335_checked
  · exact frame0336_checked
  · exact frame0337_checked
  · exact frame0338_checked
  · exact frame0339_checked
  · exact frame0340_checked
  · exact frame0341_checked
  · exact frame0342_checked
  · exact frame0343_checked
  · exact frame0344_checked
  · exact frame0345_checked
  · exact frame0346_checked
  · exact frame0347_checked
  · exact frame0348_checked
  · exact frame0349_checked
  · exact frame0350_checked
  · exact frame0351_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
