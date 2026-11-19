import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 512 through 543. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0512_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 512 3
      (fragments 512) (frames 512) = true := by
  decide +kernel

private theorem frame0513_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 513 3
      (fragments 513) (frames 513) = true := by
  decide +kernel

private theorem frame0514_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 514 3
      (fragments 514) (frames 514) = true := by
  decide +kernel

private theorem frame0515_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 515 3
      (fragments 515) (frames 515) = true := by
  decide +kernel

private theorem frame0516_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 516 3
      (fragments 516) (frames 516) = true := by
  decide +kernel

private theorem frame0517_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 517 3
      (fragments 517) (frames 517) = true := by
  decide +kernel

private theorem frame0518_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 518 3
      (fragments 518) (frames 518) = true := by
  decide +kernel

private theorem frame0519_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 519 3
      (fragments 519) (frames 519) = true := by
  decide +kernel

private theorem frame0520_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 520 3
      (fragments 520) (frames 520) = true := by
  decide +kernel

private theorem frame0521_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 521 3
      (fragments 521) (frames 521) = true := by
  decide +kernel

private theorem frame0522_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 522 3
      (fragments 522) (frames 522) = true := by
  decide +kernel

private theorem frame0523_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 523 3
      (fragments 523) (frames 523) = true := by
  decide +kernel

private theorem frame0524_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 524 3
      (fragments 524) (frames 524) = true := by
  decide +kernel

private theorem frame0525_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 525 3
      (fragments 525) (frames 525) = true := by
  decide +kernel

private theorem frame0526_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 526 3
      (fragments 526) (frames 526) = true := by
  decide +kernel

private theorem frame0527_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 527 3
      (fragments 527) (frames 527) = true := by
  decide +kernel

private theorem frame0528_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 528 3
      (fragments 528) (frames 528) = true := by
  decide +kernel

private theorem frame0529_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 529 3
      (fragments 529) (frames 529) = true := by
  decide +kernel

private theorem frame0530_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 530 3
      (fragments 530) (frames 530) = true := by
  decide +kernel

private theorem frame0531_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 531 3
      (fragments 531) (frames 531) = true := by
  decide +kernel

private theorem frame0532_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 532 3
      (fragments 532) (frames 532) = true := by
  decide +kernel

private theorem frame0533_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 533 3
      (fragments 533) (frames 533) = true := by
  decide +kernel

private theorem frame0534_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 534 3
      (fragments 534) (frames 534) = true := by
  decide +kernel

private theorem frame0535_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 535 3
      (fragments 535) (frames 535) = true := by
  decide +kernel

private theorem frame0536_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 536 3
      (fragments 536) (frames 536) = true := by
  decide +kernel

private theorem frame0537_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 537 3
      (fragments 537) (frames 537) = true := by
  decide +kernel

private theorem frame0538_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 538 3
      (fragments 538) (frames 538) = true := by
  decide +kernel

private theorem frame0539_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 539 3
      (fragments 539) (frames 539) = true := by
  decide +kernel

private theorem frame0540_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 540 3
      (fragments 540) (frames 540) = true := by
  decide +kernel

private theorem frame0541_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 541 3
      (fragments 541) (frames 541) = true := by
  decide +kernel

private theorem frame0542_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 542 3
      (fragments 542) (frames 542) = true := by
  decide +kernel

private theorem frame0543_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 543 3
      (fragments 543) (frames 543) = true := by
  decide +kernel

theorem block16_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 512) 3
      (fragments (j.val + 512)) (frames (j.val + 512)) = true := by
  fin_cases j
  · exact frame0512_checked
  · exact frame0513_checked
  · exact frame0514_checked
  · exact frame0515_checked
  · exact frame0516_checked
  · exact frame0517_checked
  · exact frame0518_checked
  · exact frame0519_checked
  · exact frame0520_checked
  · exact frame0521_checked
  · exact frame0522_checked
  · exact frame0523_checked
  · exact frame0524_checked
  · exact frame0525_checked
  · exact frame0526_checked
  · exact frame0527_checked
  · exact frame0528_checked
  · exact frame0529_checked
  · exact frame0530_checked
  · exact frame0531_checked
  · exact frame0532_checked
  · exact frame0533_checked
  · exact frame0534_checked
  · exact frame0535_checked
  · exact frame0536_checked
  · exact frame0537_checked
  · exact frame0538_checked
  · exact frame0539_checked
  · exact frame0540_checked
  · exact frame0541_checked
  · exact frame0542_checked
  · exact frame0543_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
