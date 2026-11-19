import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 864 through 895. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0864_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 864 3
      (fragments 864) (frames 864) = true := by
  decide +kernel

private theorem frame0865_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 865 3
      (fragments 865) (frames 865) = true := by
  decide +kernel

private theorem frame0866_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 866 3
      (fragments 866) (frames 866) = true := by
  decide +kernel

private theorem frame0867_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 867 3
      (fragments 867) (frames 867) = true := by
  decide +kernel

private theorem frame0868_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 868 3
      (fragments 868) (frames 868) = true := by
  decide +kernel

private theorem frame0869_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 869 3
      (fragments 869) (frames 869) = true := by
  decide +kernel

private theorem frame0870_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 870 3
      (fragments 870) (frames 870) = true := by
  decide +kernel

private theorem frame0871_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 871 3
      (fragments 871) (frames 871) = true := by
  decide +kernel

private theorem frame0872_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 872 3
      (fragments 872) (frames 872) = true := by
  decide +kernel

private theorem frame0873_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 873 3
      (fragments 873) (frames 873) = true := by
  decide +kernel

private theorem frame0874_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 874 3
      (fragments 874) (frames 874) = true := by
  decide +kernel

private theorem frame0875_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 875 3
      (fragments 875) (frames 875) = true := by
  decide +kernel

private theorem frame0876_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 876 3
      (fragments 876) (frames 876) = true := by
  decide +kernel

private theorem frame0877_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 877 3
      (fragments 877) (frames 877) = true := by
  decide +kernel

private theorem frame0878_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 878 3
      (fragments 878) (frames 878) = true := by
  decide +kernel

private theorem frame0879_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 879 3
      (fragments 879) (frames 879) = true := by
  decide +kernel

private theorem frame0880_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 880 3
      (fragments 880) (frames 880) = true := by
  decide +kernel

private theorem frame0881_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 881 3
      (fragments 881) (frames 881) = true := by
  decide +kernel

private theorem frame0882_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 882 3
      (fragments 882) (frames 882) = true := by
  decide +kernel

private theorem frame0883_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 883 3
      (fragments 883) (frames 883) = true := by
  decide +kernel

private theorem frame0884_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 884 3
      (fragments 884) (frames 884) = true := by
  decide +kernel

private theorem frame0885_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 885 3
      (fragments 885) (frames 885) = true := by
  decide +kernel

private theorem frame0886_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 886 3
      (fragments 886) (frames 886) = true := by
  decide +kernel

private theorem frame0887_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 887 3
      (fragments 887) (frames 887) = true := by
  decide +kernel

private theorem frame0888_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 888 3
      (fragments 888) (frames 888) = true := by
  decide +kernel

private theorem frame0889_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 889 3
      (fragments 889) (frames 889) = true := by
  decide +kernel

private theorem frame0890_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 890 3
      (fragments 890) (frames 890) = true := by
  decide +kernel

private theorem frame0891_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 891 3
      (fragments 891) (frames 891) = true := by
  decide +kernel

private theorem frame0892_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 892 3
      (fragments 892) (frames 892) = true := by
  decide +kernel

private theorem frame0893_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 893 3
      (fragments 893) (frames 893) = true := by
  decide +kernel

private theorem frame0894_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 894 3
      (fragments 894) (frames 894) = true := by
  decide +kernel

private theorem frame0895_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 895 3
      (fragments 895) (frames 895) = true := by
  decide +kernel

theorem block27_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 864) 3
      (fragments (j.val + 864)) (frames (j.val + 864)) = true := by
  fin_cases j
  · exact frame0864_checked
  · exact frame0865_checked
  · exact frame0866_checked
  · exact frame0867_checked
  · exact frame0868_checked
  · exact frame0869_checked
  · exact frame0870_checked
  · exact frame0871_checked
  · exact frame0872_checked
  · exact frame0873_checked
  · exact frame0874_checked
  · exact frame0875_checked
  · exact frame0876_checked
  · exact frame0877_checked
  · exact frame0878_checked
  · exact frame0879_checked
  · exact frame0880_checked
  · exact frame0881_checked
  · exact frame0882_checked
  · exact frame0883_checked
  · exact frame0884_checked
  · exact frame0885_checked
  · exact frame0886_checked
  · exact frame0887_checked
  · exact frame0888_checked
  · exact frame0889_checked
  · exact frame0890_checked
  · exact frame0891_checked
  · exact frame0892_checked
  · exact frame0893_checked
  · exact frame0894_checked
  · exact frame0895_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
