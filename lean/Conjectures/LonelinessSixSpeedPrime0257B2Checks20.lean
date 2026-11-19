import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 640 through 671. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0640_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 640 3
      (fragments 640) (frames 640) = true := by
  decide +kernel

private theorem frame0641_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 641 3
      (fragments 641) (frames 641) = true := by
  decide +kernel

private theorem frame0642_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 642 3
      (fragments 642) (frames 642) = true := by
  decide +kernel

private theorem frame0643_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 643 3
      (fragments 643) (frames 643) = true := by
  decide +kernel

private theorem frame0644_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 644 3
      (fragments 644) (frames 644) = true := by
  decide +kernel

private theorem frame0645_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 645 3
      (fragments 645) (frames 645) = true := by
  decide +kernel

private theorem frame0646_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 646 3
      (fragments 646) (frames 646) = true := by
  decide +kernel

private theorem frame0647_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 647 3
      (fragments 647) (frames 647) = true := by
  decide +kernel

private theorem frame0648_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 648 3
      (fragments 648) (frames 648) = true := by
  decide +kernel

private theorem frame0649_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 649 3
      (fragments 649) (frames 649) = true := by
  decide +kernel

private theorem frame0650_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 650 3
      (fragments 650) (frames 650) = true := by
  decide +kernel

private theorem frame0651_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 651 3
      (fragments 651) (frames 651) = true := by
  decide +kernel

private theorem frame0652_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 652 3
      (fragments 652) (frames 652) = true := by
  decide +kernel

private theorem frame0653_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 653 3
      (fragments 653) (frames 653) = true := by
  decide +kernel

private theorem frame0654_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 654 3
      (fragments 654) (frames 654) = true := by
  decide +kernel

private theorem frame0655_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 655 3
      (fragments 655) (frames 655) = true := by
  decide +kernel

private theorem frame0656_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 656 3
      (fragments 656) (frames 656) = true := by
  decide +kernel

private theorem frame0657_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 657 3
      (fragments 657) (frames 657) = true := by
  decide +kernel

private theorem frame0658_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 658 3
      (fragments 658) (frames 658) = true := by
  decide +kernel

private theorem frame0659_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 659 3
      (fragments 659) (frames 659) = true := by
  decide +kernel

private theorem frame0660_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 660 3
      (fragments 660) (frames 660) = true := by
  decide +kernel

private theorem frame0661_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 661 3
      (fragments 661) (frames 661) = true := by
  decide +kernel

private theorem frame0662_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 662 3
      (fragments 662) (frames 662) = true := by
  decide +kernel

private theorem frame0663_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 663 3
      (fragments 663) (frames 663) = true := by
  decide +kernel

private theorem frame0664_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 664 3
      (fragments 664) (frames 664) = true := by
  decide +kernel

private theorem frame0665_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 665 3
      (fragments 665) (frames 665) = true := by
  decide +kernel

private theorem frame0666_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 666 3
      (fragments 666) (frames 666) = true := by
  decide +kernel

private theorem frame0667_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 667 3
      (fragments 667) (frames 667) = true := by
  decide +kernel

private theorem frame0668_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 668 3
      (fragments 668) (frames 668) = true := by
  decide +kernel

private theorem frame0669_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 669 3
      (fragments 669) (frames 669) = true := by
  decide +kernel

private theorem frame0670_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 670 3
      (fragments 670) (frames 670) = true := by
  decide +kernel

private theorem frame0671_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 671 3
      (fragments 671) (frames 671) = true := by
  decide +kernel

theorem block20_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 640) 3
      (fragments (j.val + 640)) (frames (j.val + 640)) = true := by
  fin_cases j
  · exact frame0640_checked
  · exact frame0641_checked
  · exact frame0642_checked
  · exact frame0643_checked
  · exact frame0644_checked
  · exact frame0645_checked
  · exact frame0646_checked
  · exact frame0647_checked
  · exact frame0648_checked
  · exact frame0649_checked
  · exact frame0650_checked
  · exact frame0651_checked
  · exact frame0652_checked
  · exact frame0653_checked
  · exact frame0654_checked
  · exact frame0655_checked
  · exact frame0656_checked
  · exact frame0657_checked
  · exact frame0658_checked
  · exact frame0659_checked
  · exact frame0660_checked
  · exact frame0661_checked
  · exact frame0662_checked
  · exact frame0663_checked
  · exact frame0664_checked
  · exact frame0665_checked
  · exact frame0666_checked
  · exact frame0667_checked
  · exact frame0668_checked
  · exact frame0669_checked
  · exact frame0670_checked
  · exact frame0671_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
