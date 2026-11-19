import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 768 through 799. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0768_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 768 3
      (fragments 768) (frames 768) = true := by
  decide +kernel

private theorem frame0769_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 769 3
      (fragments 769) (frames 769) = true := by
  decide +kernel

private theorem frame0770_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 770 3
      (fragments 770) (frames 770) = true := by
  decide +kernel

private theorem frame0771_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 771 3
      (fragments 771) (frames 771) = true := by
  decide +kernel

private theorem frame0772_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 772 3
      (fragments 772) (frames 772) = true := by
  decide +kernel

private theorem frame0773_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 773 3
      (fragments 773) (frames 773) = true := by
  decide +kernel

private theorem frame0774_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 774 3
      (fragments 774) (frames 774) = true := by
  decide +kernel

private theorem frame0775_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 775 3
      (fragments 775) (frames 775) = true := by
  decide +kernel

private theorem frame0776_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 776 3
      (fragments 776) (frames 776) = true := by
  decide +kernel

private theorem frame0777_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 777 3
      (fragments 777) (frames 777) = true := by
  decide +kernel

private theorem frame0778_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 778 3
      (fragments 778) (frames 778) = true := by
  decide +kernel

private theorem frame0779_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 779 3
      (fragments 779) (frames 779) = true := by
  decide +kernel

private theorem frame0780_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 780 3
      (fragments 780) (frames 780) = true := by
  decide +kernel

private theorem frame0781_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 781 3
      (fragments 781) (frames 781) = true := by
  decide +kernel

private theorem frame0782_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 782 3
      (fragments 782) (frames 782) = true := by
  decide +kernel

private theorem frame0783_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 783 3
      (fragments 783) (frames 783) = true := by
  decide +kernel

private theorem frame0784_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 784 3
      (fragments 784) (frames 784) = true := by
  decide +kernel

private theorem frame0785_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 785 3
      (fragments 785) (frames 785) = true := by
  decide +kernel

private theorem frame0786_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 786 3
      (fragments 786) (frames 786) = true := by
  decide +kernel

private theorem frame0787_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 787 3
      (fragments 787) (frames 787) = true := by
  decide +kernel

private theorem frame0788_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 788 3
      (fragments 788) (frames 788) = true := by
  decide +kernel

private theorem frame0789_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 789 3
      (fragments 789) (frames 789) = true := by
  decide +kernel

private theorem frame0790_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 790 3
      (fragments 790) (frames 790) = true := by
  decide +kernel

private theorem frame0791_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 791 3
      (fragments 791) (frames 791) = true := by
  decide +kernel

private theorem frame0792_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 792 3
      (fragments 792) (frames 792) = true := by
  decide +kernel

private theorem frame0793_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 793 3
      (fragments 793) (frames 793) = true := by
  decide +kernel

private theorem frame0794_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 794 3
      (fragments 794) (frames 794) = true := by
  decide +kernel

private theorem frame0795_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 795 3
      (fragments 795) (frames 795) = true := by
  decide +kernel

private theorem frame0796_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 796 3
      (fragments 796) (frames 796) = true := by
  decide +kernel

private theorem frame0797_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 797 3
      (fragments 797) (frames 797) = true := by
  decide +kernel

private theorem frame0798_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 798 3
      (fragments 798) (frames 798) = true := by
  decide +kernel

private theorem frame0799_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 799 3
      (fragments 799) (frames 799) = true := by
  decide +kernel

theorem block24_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 768) 3
      (fragments (j.val + 768)) (frames (j.val + 768)) = true := by
  fin_cases j
  · exact frame0768_checked
  · exact frame0769_checked
  · exact frame0770_checked
  · exact frame0771_checked
  · exact frame0772_checked
  · exact frame0773_checked
  · exact frame0774_checked
  · exact frame0775_checked
  · exact frame0776_checked
  · exact frame0777_checked
  · exact frame0778_checked
  · exact frame0779_checked
  · exact frame0780_checked
  · exact frame0781_checked
  · exact frame0782_checked
  · exact frame0783_checked
  · exact frame0784_checked
  · exact frame0785_checked
  · exact frame0786_checked
  · exact frame0787_checked
  · exact frame0788_checked
  · exact frame0789_checked
  · exact frame0790_checked
  · exact frame0791_checked
  · exact frame0792_checked
  · exact frame0793_checked
  · exact frame0794_checked
  · exact frame0795_checked
  · exact frame0796_checked
  · exact frame0797_checked
  · exact frame0798_checked
  · exact frame0799_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
