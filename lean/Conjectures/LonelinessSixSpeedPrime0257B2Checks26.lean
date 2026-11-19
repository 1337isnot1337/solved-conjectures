import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 832 through 863. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0832_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 832 3
      (fragments 832) (frames 832) = true := by
  decide +kernel

private theorem frame0833_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 833 3
      (fragments 833) (frames 833) = true := by
  decide +kernel

private theorem frame0834_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 834 3
      (fragments 834) (frames 834) = true := by
  decide +kernel

private theorem frame0835_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 835 3
      (fragments 835) (frames 835) = true := by
  decide +kernel

private theorem frame0836_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 836 3
      (fragments 836) (frames 836) = true := by
  decide +kernel

private theorem frame0837_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 837 3
      (fragments 837) (frames 837) = true := by
  decide +kernel

private theorem frame0838_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 838 3
      (fragments 838) (frames 838) = true := by
  decide +kernel

private theorem frame0839_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 839 3
      (fragments 839) (frames 839) = true := by
  decide +kernel

private theorem frame0840_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 840 3
      (fragments 840) (frames 840) = true := by
  decide +kernel

private theorem frame0841_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 841 3
      (fragments 841) (frames 841) = true := by
  decide +kernel

private theorem frame0842_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 842 3
      (fragments 842) (frames 842) = true := by
  decide +kernel

private theorem frame0843_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 843 3
      (fragments 843) (frames 843) = true := by
  decide +kernel

private theorem frame0844_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 844 3
      (fragments 844) (frames 844) = true := by
  decide +kernel

private theorem frame0845_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 845 3
      (fragments 845) (frames 845) = true := by
  decide +kernel

private theorem frame0846_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 846 3
      (fragments 846) (frames 846) = true := by
  decide +kernel

private theorem frame0847_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 847 3
      (fragments 847) (frames 847) = true := by
  decide +kernel

private theorem frame0848_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 848 3
      (fragments 848) (frames 848) = true := by
  decide +kernel

private theorem frame0849_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 849 3
      (fragments 849) (frames 849) = true := by
  decide +kernel

private theorem frame0850_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 850 3
      (fragments 850) (frames 850) = true := by
  decide +kernel

private theorem frame0851_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 851 3
      (fragments 851) (frames 851) = true := by
  decide +kernel

private theorem frame0852_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 852 3
      (fragments 852) (frames 852) = true := by
  decide +kernel

private theorem frame0853_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 853 3
      (fragments 853) (frames 853) = true := by
  decide +kernel

private theorem frame0854_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 854 3
      (fragments 854) (frames 854) = true := by
  decide +kernel

private theorem frame0855_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 855 3
      (fragments 855) (frames 855) = true := by
  decide +kernel

private theorem frame0856_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 856 3
      (fragments 856) (frames 856) = true := by
  decide +kernel

private theorem frame0857_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 857 3
      (fragments 857) (frames 857) = true := by
  decide +kernel

private theorem frame0858_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 858 3
      (fragments 858) (frames 858) = true := by
  decide +kernel

private theorem frame0859_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 859 3
      (fragments 859) (frames 859) = true := by
  decide +kernel

private theorem frame0860_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 860 3
      (fragments 860) (frames 860) = true := by
  decide +kernel

private theorem frame0861_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 861 3
      (fragments 861) (frames 861) = true := by
  decide +kernel

private theorem frame0862_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 862 3
      (fragments 862) (frames 862) = true := by
  decide +kernel

private theorem frame0863_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 863 3
      (fragments 863) (frames 863) = true := by
  decide +kernel

theorem block26_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 832) 3
      (fragments (j.val + 832)) (frames (j.val + 832)) = true := by
  fin_cases j
  · exact frame0832_checked
  · exact frame0833_checked
  · exact frame0834_checked
  · exact frame0835_checked
  · exact frame0836_checked
  · exact frame0837_checked
  · exact frame0838_checked
  · exact frame0839_checked
  · exact frame0840_checked
  · exact frame0841_checked
  · exact frame0842_checked
  · exact frame0843_checked
  · exact frame0844_checked
  · exact frame0845_checked
  · exact frame0846_checked
  · exact frame0847_checked
  · exact frame0848_checked
  · exact frame0849_checked
  · exact frame0850_checked
  · exact frame0851_checked
  · exact frame0852_checked
  · exact frame0853_checked
  · exact frame0854_checked
  · exact frame0855_checked
  · exact frame0856_checked
  · exact frame0857_checked
  · exact frame0858_checked
  · exact frame0859_checked
  · exact frame0860_checked
  · exact frame0861_checked
  · exact frame0862_checked
  · exact frame0863_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
