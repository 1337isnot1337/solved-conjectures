import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 800 through 831. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0800_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 800 3
      (fragments 800) (frames 800) = true := by
  decide +kernel

private theorem frame0801_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 801 3
      (fragments 801) (frames 801) = true := by
  decide +kernel

private theorem frame0802_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 802 3
      (fragments 802) (frames 802) = true := by
  decide +kernel

private theorem frame0803_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 803 3
      (fragments 803) (frames 803) = true := by
  decide +kernel

private theorem frame0804_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 804 3
      (fragments 804) (frames 804) = true := by
  decide +kernel

private theorem frame0805_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 805 3
      (fragments 805) (frames 805) = true := by
  decide +kernel

private theorem frame0806_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 806 3
      (fragments 806) (frames 806) = true := by
  decide +kernel

private theorem frame0807_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 807 3
      (fragments 807) (frames 807) = true := by
  decide +kernel

private theorem frame0808_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 808 3
      (fragments 808) (frames 808) = true := by
  decide +kernel

private theorem frame0809_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 809 3
      (fragments 809) (frames 809) = true := by
  decide +kernel

private theorem frame0810_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 810 3
      (fragments 810) (frames 810) = true := by
  decide +kernel

private theorem frame0811_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 811 3
      (fragments 811) (frames 811) = true := by
  decide +kernel

private theorem frame0812_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 812 3
      (fragments 812) (frames 812) = true := by
  decide +kernel

private theorem frame0813_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 813 3
      (fragments 813) (frames 813) = true := by
  decide +kernel

private theorem frame0814_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 814 3
      (fragments 814) (frames 814) = true := by
  decide +kernel

private theorem frame0815_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 815 3
      (fragments 815) (frames 815) = true := by
  decide +kernel

private theorem frame0816_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 816 3
      (fragments 816) (frames 816) = true := by
  decide +kernel

private theorem frame0817_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 817 3
      (fragments 817) (frames 817) = true := by
  decide +kernel

private theorem frame0818_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 818 3
      (fragments 818) (frames 818) = true := by
  decide +kernel

private theorem frame0819_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 819 3
      (fragments 819) (frames 819) = true := by
  decide +kernel

private theorem frame0820_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 820 3
      (fragments 820) (frames 820) = true := by
  decide +kernel

private theorem frame0821_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 821 3
      (fragments 821) (frames 821) = true := by
  decide +kernel

private theorem frame0822_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 822 3
      (fragments 822) (frames 822) = true := by
  decide +kernel

private theorem frame0823_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 823 3
      (fragments 823) (frames 823) = true := by
  decide +kernel

private theorem frame0824_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 824 3
      (fragments 824) (frames 824) = true := by
  decide +kernel

private theorem frame0825_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 825 3
      (fragments 825) (frames 825) = true := by
  decide +kernel

private theorem frame0826_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 826 3
      (fragments 826) (frames 826) = true := by
  decide +kernel

private theorem frame0827_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 827 3
      (fragments 827) (frames 827) = true := by
  decide +kernel

private theorem frame0828_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 828 3
      (fragments 828) (frames 828) = true := by
  decide +kernel

private theorem frame0829_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 829 3
      (fragments 829) (frames 829) = true := by
  decide +kernel

private theorem frame0830_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 830 3
      (fragments 830) (frames 830) = true := by
  decide +kernel

private theorem frame0831_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 831 3
      (fragments 831) (frames 831) = true := by
  decide +kernel

theorem block25_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 800) 3
      (fragments (j.val + 800)) (frames (j.val + 800)) = true := by
  fin_cases j
  · exact frame0800_checked
  · exact frame0801_checked
  · exact frame0802_checked
  · exact frame0803_checked
  · exact frame0804_checked
  · exact frame0805_checked
  · exact frame0806_checked
  · exact frame0807_checked
  · exact frame0808_checked
  · exact frame0809_checked
  · exact frame0810_checked
  · exact frame0811_checked
  · exact frame0812_checked
  · exact frame0813_checked
  · exact frame0814_checked
  · exact frame0815_checked
  · exact frame0816_checked
  · exact frame0817_checked
  · exact frame0818_checked
  · exact frame0819_checked
  · exact frame0820_checked
  · exact frame0821_checked
  · exact frame0822_checked
  · exact frame0823_checked
  · exact frame0824_checked
  · exact frame0825_checked
  · exact frame0826_checked
  · exact frame0827_checked
  · exact frame0828_checked
  · exact frame0829_checked
  · exact frame0830_checked
  · exact frame0831_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
