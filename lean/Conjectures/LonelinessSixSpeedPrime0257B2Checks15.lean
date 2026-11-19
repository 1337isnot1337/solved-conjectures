import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 480 through 511. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0480_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 480 3
      (fragments 480) (frames 480) = true := by
  decide +kernel

private theorem frame0481_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 481 3
      (fragments 481) (frames 481) = true := by
  decide +kernel

private theorem frame0482_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 482 3
      (fragments 482) (frames 482) = true := by
  decide +kernel

private theorem frame0483_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 483 3
      (fragments 483) (frames 483) = true := by
  decide +kernel

private theorem frame0484_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 484 3
      (fragments 484) (frames 484) = true := by
  decide +kernel

private theorem frame0485_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 485 3
      (fragments 485) (frames 485) = true := by
  decide +kernel

private theorem frame0486_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 486 3
      (fragments 486) (frames 486) = true := by
  decide +kernel

private theorem frame0487_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 487 3
      (fragments 487) (frames 487) = true := by
  decide +kernel

private theorem frame0488_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 488 3
      (fragments 488) (frames 488) = true := by
  decide +kernel

private theorem frame0489_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 489 3
      (fragments 489) (frames 489) = true := by
  decide +kernel

private theorem frame0490_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 490 3
      (fragments 490) (frames 490) = true := by
  decide +kernel

private theorem frame0491_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 491 3
      (fragments 491) (frames 491) = true := by
  decide +kernel

private theorem frame0492_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 492 3
      (fragments 492) (frames 492) = true := by
  decide +kernel

private theorem frame0493_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 493 3
      (fragments 493) (frames 493) = true := by
  decide +kernel

private theorem frame0494_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 494 3
      (fragments 494) (frames 494) = true := by
  decide +kernel

private theorem frame0495_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 495 3
      (fragments 495) (frames 495) = true := by
  decide +kernel

private theorem frame0496_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 496 3
      (fragments 496) (frames 496) = true := by
  decide +kernel

private theorem frame0497_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 497 3
      (fragments 497) (frames 497) = true := by
  decide +kernel

private theorem frame0498_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 498 3
      (fragments 498) (frames 498) = true := by
  decide +kernel

private theorem frame0499_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 499 3
      (fragments 499) (frames 499) = true := by
  decide +kernel

private theorem frame0500_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 500 3
      (fragments 500) (frames 500) = true := by
  decide +kernel

private theorem frame0501_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 501 3
      (fragments 501) (frames 501) = true := by
  decide +kernel

private theorem frame0502_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 502 3
      (fragments 502) (frames 502) = true := by
  decide +kernel

private theorem frame0503_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 503 3
      (fragments 503) (frames 503) = true := by
  decide +kernel

private theorem frame0504_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 504 3
      (fragments 504) (frames 504) = true := by
  decide +kernel

private theorem frame0505_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 505 3
      (fragments 505) (frames 505) = true := by
  decide +kernel

private theorem frame0506_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 506 3
      (fragments 506) (frames 506) = true := by
  decide +kernel

private theorem frame0507_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 507 3
      (fragments 507) (frames 507) = true := by
  decide +kernel

private theorem frame0508_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 508 3
      (fragments 508) (frames 508) = true := by
  decide +kernel

private theorem frame0509_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 509 3
      (fragments 509) (frames 509) = true := by
  decide +kernel

private theorem frame0510_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 510 3
      (fragments 510) (frames 510) = true := by
  decide +kernel

private theorem frame0511_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 511 3
      (fragments 511) (frames 511) = true := by
  decide +kernel

theorem block15_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 480) 3
      (fragments (j.val + 480)) (frames (j.val + 480)) = true := by
  fin_cases j
  · exact frame0480_checked
  · exact frame0481_checked
  · exact frame0482_checked
  · exact frame0483_checked
  · exact frame0484_checked
  · exact frame0485_checked
  · exact frame0486_checked
  · exact frame0487_checked
  · exact frame0488_checked
  · exact frame0489_checked
  · exact frame0490_checked
  · exact frame0491_checked
  · exact frame0492_checked
  · exact frame0493_checked
  · exact frame0494_checked
  · exact frame0495_checked
  · exact frame0496_checked
  · exact frame0497_checked
  · exact frame0498_checked
  · exact frame0499_checked
  · exact frame0500_checked
  · exact frame0501_checked
  · exact frame0502_checked
  · exact frame0503_checked
  · exact frame0504_checked
  · exact frame0505_checked
  · exact frame0506_checked
  · exact frame0507_checked
  · exact frame0508_checked
  · exact frame0509_checked
  · exact frame0510_checked
  · exact frame0511_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
