import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 544 through 575. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0544_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 544 3
      (fragments 544) (frames 544) = true := by
  decide +kernel

private theorem frame0545_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 545 3
      (fragments 545) (frames 545) = true := by
  decide +kernel

private theorem frame0546_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 546 3
      (fragments 546) (frames 546) = true := by
  decide +kernel

private theorem frame0547_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 547 3
      (fragments 547) (frames 547) = true := by
  decide +kernel

private theorem frame0548_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 548 3
      (fragments 548) (frames 548) = true := by
  decide +kernel

private theorem frame0549_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 549 3
      (fragments 549) (frames 549) = true := by
  decide +kernel

private theorem frame0550_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 550 3
      (fragments 550) (frames 550) = true := by
  decide +kernel

private theorem frame0551_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 551 3
      (fragments 551) (frames 551) = true := by
  decide +kernel

private theorem frame0552_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 552 3
      (fragments 552) (frames 552) = true := by
  decide +kernel

private theorem frame0553_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 553 3
      (fragments 553) (frames 553) = true := by
  decide +kernel

private theorem frame0554_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 554 3
      (fragments 554) (frames 554) = true := by
  decide +kernel

private theorem frame0555_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 555 3
      (fragments 555) (frames 555) = true := by
  decide +kernel

private theorem frame0556_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 556 3
      (fragments 556) (frames 556) = true := by
  decide +kernel

private theorem frame0557_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 557 3
      (fragments 557) (frames 557) = true := by
  decide +kernel

private theorem frame0558_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 558 3
      (fragments 558) (frames 558) = true := by
  decide +kernel

private theorem frame0559_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 559 3
      (fragments 559) (frames 559) = true := by
  decide +kernel

private theorem frame0560_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 560 3
      (fragments 560) (frames 560) = true := by
  decide +kernel

private theorem frame0561_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 561 3
      (fragments 561) (frames 561) = true := by
  decide +kernel

private theorem frame0562_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 562 3
      (fragments 562) (frames 562) = true := by
  decide +kernel

private theorem frame0563_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 563 3
      (fragments 563) (frames 563) = true := by
  decide +kernel

private theorem frame0564_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 564 3
      (fragments 564) (frames 564) = true := by
  decide +kernel

private theorem frame0565_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 565 3
      (fragments 565) (frames 565) = true := by
  decide +kernel

private theorem frame0566_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 566 3
      (fragments 566) (frames 566) = true := by
  decide +kernel

private theorem frame0567_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 567 3
      (fragments 567) (frames 567) = true := by
  decide +kernel

private theorem frame0568_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 568 3
      (fragments 568) (frames 568) = true := by
  decide +kernel

private theorem frame0569_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 569 3
      (fragments 569) (frames 569) = true := by
  decide +kernel

private theorem frame0570_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 570 3
      (fragments 570) (frames 570) = true := by
  decide +kernel

private theorem frame0571_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 571 3
      (fragments 571) (frames 571) = true := by
  decide +kernel

private theorem frame0572_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 572 3
      (fragments 572) (frames 572) = true := by
  decide +kernel

private theorem frame0573_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 573 3
      (fragments 573) (frames 573) = true := by
  decide +kernel

private theorem frame0574_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 574 3
      (fragments 574) (frames 574) = true := by
  decide +kernel

private theorem frame0575_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 575 3
      (fragments 575) (frames 575) = true := by
  decide +kernel

theorem block17_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 544) 3
      (fragments (j.val + 544)) (frames (j.val + 544)) = true := by
  fin_cases j
  · exact frame0544_checked
  · exact frame0545_checked
  · exact frame0546_checked
  · exact frame0547_checked
  · exact frame0548_checked
  · exact frame0549_checked
  · exact frame0550_checked
  · exact frame0551_checked
  · exact frame0552_checked
  · exact frame0553_checked
  · exact frame0554_checked
  · exact frame0555_checked
  · exact frame0556_checked
  · exact frame0557_checked
  · exact frame0558_checked
  · exact frame0559_checked
  · exact frame0560_checked
  · exact frame0561_checked
  · exact frame0562_checked
  · exact frame0563_checked
  · exact frame0564_checked
  · exact frame0565_checked
  · exact frame0566_checked
  · exact frame0567_checked
  · exact frame0568_checked
  · exact frame0569_checked
  · exact frame0570_checked
  · exact frame0571_checked
  · exact frame0572_checked
  · exact frame0573_checked
  · exact frame0574_checked
  · exact frame0575_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
