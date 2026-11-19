import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 576 through 607. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0576_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 576 3
      (fragments 576) (frames 576) = true := by
  decide +kernel

private theorem frame0577_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 577 3
      (fragments 577) (frames 577) = true := by
  decide +kernel

private theorem frame0578_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 578 3
      (fragments 578) (frames 578) = true := by
  decide +kernel

private theorem frame0579_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 579 3
      (fragments 579) (frames 579) = true := by
  decide +kernel

private theorem frame0580_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 580 3
      (fragments 580) (frames 580) = true := by
  decide +kernel

private theorem frame0581_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 581 3
      (fragments 581) (frames 581) = true := by
  decide +kernel

private theorem frame0582_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 582 3
      (fragments 582) (frames 582) = true := by
  decide +kernel

private theorem frame0583_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 583 3
      (fragments 583) (frames 583) = true := by
  decide +kernel

private theorem frame0584_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 584 3
      (fragments 584) (frames 584) = true := by
  decide +kernel

private theorem frame0585_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 585 3
      (fragments 585) (frames 585) = true := by
  decide +kernel

private theorem frame0586_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 586 3
      (fragments 586) (frames 586) = true := by
  decide +kernel

private theorem frame0587_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 587 3
      (fragments 587) (frames 587) = true := by
  decide +kernel

private theorem frame0588_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 588 3
      (fragments 588) (frames 588) = true := by
  decide +kernel

private theorem frame0589_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 589 3
      (fragments 589) (frames 589) = true := by
  decide +kernel

private theorem frame0590_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 590 3
      (fragments 590) (frames 590) = true := by
  decide +kernel

private theorem frame0591_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 591 3
      (fragments 591) (frames 591) = true := by
  decide +kernel

private theorem frame0592_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 592 3
      (fragments 592) (frames 592) = true := by
  decide +kernel

private theorem frame0593_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 593 3
      (fragments 593) (frames 593) = true := by
  decide +kernel

private theorem frame0594_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 594 3
      (fragments 594) (frames 594) = true := by
  decide +kernel

private theorem frame0595_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 595 3
      (fragments 595) (frames 595) = true := by
  decide +kernel

private theorem frame0596_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 596 3
      (fragments 596) (frames 596) = true := by
  decide +kernel

private theorem frame0597_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 597 3
      (fragments 597) (frames 597) = true := by
  decide +kernel

private theorem frame0598_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 598 3
      (fragments 598) (frames 598) = true := by
  decide +kernel

private theorem frame0599_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 599 3
      (fragments 599) (frames 599) = true := by
  decide +kernel

private theorem frame0600_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 600 3
      (fragments 600) (frames 600) = true := by
  decide +kernel

private theorem frame0601_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 601 3
      (fragments 601) (frames 601) = true := by
  decide +kernel

private theorem frame0602_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 602 3
      (fragments 602) (frames 602) = true := by
  decide +kernel

private theorem frame0603_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 603 3
      (fragments 603) (frames 603) = true := by
  decide +kernel

private theorem frame0604_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 604 3
      (fragments 604) (frames 604) = true := by
  decide +kernel

private theorem frame0605_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 605 3
      (fragments 605) (frames 605) = true := by
  decide +kernel

private theorem frame0606_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 606 3
      (fragments 606) (frames 606) = true := by
  decide +kernel

private theorem frame0607_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 607 3
      (fragments 607) (frames 607) = true := by
  decide +kernel

theorem block18_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 576) 3
      (fragments (j.val + 576)) (frames (j.val + 576)) = true := by
  fin_cases j
  · exact frame0576_checked
  · exact frame0577_checked
  · exact frame0578_checked
  · exact frame0579_checked
  · exact frame0580_checked
  · exact frame0581_checked
  · exact frame0582_checked
  · exact frame0583_checked
  · exact frame0584_checked
  · exact frame0585_checked
  · exact frame0586_checked
  · exact frame0587_checked
  · exact frame0588_checked
  · exact frame0589_checked
  · exact frame0590_checked
  · exact frame0591_checked
  · exact frame0592_checked
  · exact frame0593_checked
  · exact frame0594_checked
  · exact frame0595_checked
  · exact frame0596_checked
  · exact frame0597_checked
  · exact frame0598_checked
  · exact frame0599_checked
  · exact frame0600_checked
  · exact frame0601_checked
  · exact frame0602_checked
  · exact frame0603_checked
  · exact frame0604_checked
  · exact frame0605_checked
  · exact frame0606_checked
  · exact frame0607_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
