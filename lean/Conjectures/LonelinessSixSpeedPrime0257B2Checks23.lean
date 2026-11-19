import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 736 through 767. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0736_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 736 3
      (fragments 736) (frames 736) = true := by
  decide +kernel

private theorem frame0737_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 737 3
      (fragments 737) (frames 737) = true := by
  decide +kernel

private theorem frame0738_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 738 3
      (fragments 738) (frames 738) = true := by
  decide +kernel

private theorem frame0739_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 739 3
      (fragments 739) (frames 739) = true := by
  decide +kernel

private theorem frame0740_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 740 3
      (fragments 740) (frames 740) = true := by
  decide +kernel

private theorem frame0741_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 741 3
      (fragments 741) (frames 741) = true := by
  decide +kernel

private theorem frame0742_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 742 3
      (fragments 742) (frames 742) = true := by
  decide +kernel

private theorem frame0743_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 743 3
      (fragments 743) (frames 743) = true := by
  decide +kernel

private theorem frame0744_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 744 3
      (fragments 744) (frames 744) = true := by
  decide +kernel

private theorem frame0745_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 745 3
      (fragments 745) (frames 745) = true := by
  decide +kernel

private theorem frame0746_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 746 3
      (fragments 746) (frames 746) = true := by
  decide +kernel

private theorem frame0747_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 747 3
      (fragments 747) (frames 747) = true := by
  decide +kernel

private theorem frame0748_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 748 3
      (fragments 748) (frames 748) = true := by
  decide +kernel

private theorem frame0749_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 749 3
      (fragments 749) (frames 749) = true := by
  decide +kernel

private theorem frame0750_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 750 3
      (fragments 750) (frames 750) = true := by
  decide +kernel

private theorem frame0751_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 751 3
      (fragments 751) (frames 751) = true := by
  decide +kernel

private theorem frame0752_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 752 3
      (fragments 752) (frames 752) = true := by
  decide +kernel

private theorem frame0753_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 753 3
      (fragments 753) (frames 753) = true := by
  decide +kernel

private theorem frame0754_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 754 3
      (fragments 754) (frames 754) = true := by
  decide +kernel

private theorem frame0755_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 755 3
      (fragments 755) (frames 755) = true := by
  decide +kernel

private theorem frame0756_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 756 3
      (fragments 756) (frames 756) = true := by
  decide +kernel

private theorem frame0757_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 757 3
      (fragments 757) (frames 757) = true := by
  decide +kernel

private theorem frame0758_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 758 3
      (fragments 758) (frames 758) = true := by
  decide +kernel

private theorem frame0759_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 759 3
      (fragments 759) (frames 759) = true := by
  decide +kernel

private theorem frame0760_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 760 3
      (fragments 760) (frames 760) = true := by
  decide +kernel

private theorem frame0761_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 761 3
      (fragments 761) (frames 761) = true := by
  decide +kernel

private theorem frame0762_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 762 3
      (fragments 762) (frames 762) = true := by
  decide +kernel

private theorem frame0763_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 763 3
      (fragments 763) (frames 763) = true := by
  decide +kernel

private theorem frame0764_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 764 3
      (fragments 764) (frames 764) = true := by
  decide +kernel

private theorem frame0765_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 765 3
      (fragments 765) (frames 765) = true := by
  decide +kernel

private theorem frame0766_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 766 3
      (fragments 766) (frames 766) = true := by
  decide +kernel

private theorem frame0767_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 767 3
      (fragments 767) (frames 767) = true := by
  decide +kernel

theorem block23_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 736) 3
      (fragments (j.val + 736)) (frames (j.val + 736)) = true := by
  fin_cases j
  · exact frame0736_checked
  · exact frame0737_checked
  · exact frame0738_checked
  · exact frame0739_checked
  · exact frame0740_checked
  · exact frame0741_checked
  · exact frame0742_checked
  · exact frame0743_checked
  · exact frame0744_checked
  · exact frame0745_checked
  · exact frame0746_checked
  · exact frame0747_checked
  · exact frame0748_checked
  · exact frame0749_checked
  · exact frame0750_checked
  · exact frame0751_checked
  · exact frame0752_checked
  · exact frame0753_checked
  · exact frame0754_checked
  · exact frame0755_checked
  · exact frame0756_checked
  · exact frame0757_checked
  · exact frame0758_checked
  · exact frame0759_checked
  · exact frame0760_checked
  · exact frame0761_checked
  · exact frame0762_checked
  · exact frame0763_checked
  · exact frame0764_checked
  · exact frame0765_checked
  · exact frame0766_checked
  · exact frame0767_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
