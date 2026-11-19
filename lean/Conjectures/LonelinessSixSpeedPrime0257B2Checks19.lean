import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 608 through 639. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0608_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 608 3
      (fragments 608) (frames 608) = true := by
  decide +kernel

private theorem frame0609_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 609 3
      (fragments 609) (frames 609) = true := by
  decide +kernel

private theorem frame0610_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 610 3
      (fragments 610) (frames 610) = true := by
  decide +kernel

private theorem frame0611_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 611 3
      (fragments 611) (frames 611) = true := by
  decide +kernel

private theorem frame0612_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 612 3
      (fragments 612) (frames 612) = true := by
  decide +kernel

private theorem frame0613_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 613 3
      (fragments 613) (frames 613) = true := by
  decide +kernel

private theorem frame0614_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 614 3
      (fragments 614) (frames 614) = true := by
  decide +kernel

private theorem frame0615_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 615 3
      (fragments 615) (frames 615) = true := by
  decide +kernel

private theorem frame0616_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 616 3
      (fragments 616) (frames 616) = true := by
  decide +kernel

private theorem frame0617_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 617 3
      (fragments 617) (frames 617) = true := by
  decide +kernel

private theorem frame0618_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 618 3
      (fragments 618) (frames 618) = true := by
  decide +kernel

private theorem frame0619_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 619 3
      (fragments 619) (frames 619) = true := by
  decide +kernel

private theorem frame0620_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 620 3
      (fragments 620) (frames 620) = true := by
  decide +kernel

private theorem frame0621_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 621 3
      (fragments 621) (frames 621) = true := by
  decide +kernel

private theorem frame0622_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 622 3
      (fragments 622) (frames 622) = true := by
  decide +kernel

private theorem frame0623_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 623 3
      (fragments 623) (frames 623) = true := by
  decide +kernel

private theorem frame0624_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 624 3
      (fragments 624) (frames 624) = true := by
  decide +kernel

private theorem frame0625_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 625 3
      (fragments 625) (frames 625) = true := by
  decide +kernel

private theorem frame0626_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 626 3
      (fragments 626) (frames 626) = true := by
  decide +kernel

private theorem frame0627_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 627 3
      (fragments 627) (frames 627) = true := by
  decide +kernel

private theorem frame0628_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 628 3
      (fragments 628) (frames 628) = true := by
  decide +kernel

private theorem frame0629_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 629 3
      (fragments 629) (frames 629) = true := by
  decide +kernel

private theorem frame0630_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 630 3
      (fragments 630) (frames 630) = true := by
  decide +kernel

private theorem frame0631_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 631 3
      (fragments 631) (frames 631) = true := by
  decide +kernel

private theorem frame0632_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 632 3
      (fragments 632) (frames 632) = true := by
  decide +kernel

private theorem frame0633_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 633 3
      (fragments 633) (frames 633) = true := by
  decide +kernel

private theorem frame0634_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 634 3
      (fragments 634) (frames 634) = true := by
  decide +kernel

private theorem frame0635_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 635 3
      (fragments 635) (frames 635) = true := by
  decide +kernel

private theorem frame0636_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 636 3
      (fragments 636) (frames 636) = true := by
  decide +kernel

private theorem frame0637_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 637 3
      (fragments 637) (frames 637) = true := by
  decide +kernel

private theorem frame0638_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 638 3
      (fragments 638) (frames 638) = true := by
  decide +kernel

private theorem frame0639_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 639 3
      (fragments 639) (frames 639) = true := by
  decide +kernel

theorem block19_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 608) 3
      (fragments (j.val + 608)) (frames (j.val + 608)) = true := by
  fin_cases j
  · exact frame0608_checked
  · exact frame0609_checked
  · exact frame0610_checked
  · exact frame0611_checked
  · exact frame0612_checked
  · exact frame0613_checked
  · exact frame0614_checked
  · exact frame0615_checked
  · exact frame0616_checked
  · exact frame0617_checked
  · exact frame0618_checked
  · exact frame0619_checked
  · exact frame0620_checked
  · exact frame0621_checked
  · exact frame0622_checked
  · exact frame0623_checked
  · exact frame0624_checked
  · exact frame0625_checked
  · exact frame0626_checked
  · exact frame0627_checked
  · exact frame0628_checked
  · exact frame0629_checked
  · exact frame0630_checked
  · exact frame0631_checked
  · exact frame0632_checked
  · exact frame0633_checked
  · exact frame0634_checked
  · exact frame0635_checked
  · exact frame0636_checked
  · exact frame0637_checked
  · exact frame0638_checked
  · exact frame0639_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
