import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 672 through 703. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0672_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 672 3
      (fragments 672) (frames 672) = true := by
  decide +kernel

private theorem frame0673_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 673 3
      (fragments 673) (frames 673) = true := by
  decide +kernel

private theorem frame0674_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 674 3
      (fragments 674) (frames 674) = true := by
  decide +kernel

private theorem frame0675_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 675 3
      (fragments 675) (frames 675) = true := by
  decide +kernel

private theorem frame0676_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 676 3
      (fragments 676) (frames 676) = true := by
  decide +kernel

private theorem frame0677_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 677 3
      (fragments 677) (frames 677) = true := by
  decide +kernel

private theorem frame0678_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 678 3
      (fragments 678) (frames 678) = true := by
  decide +kernel

private theorem frame0679_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 679 3
      (fragments 679) (frames 679) = true := by
  decide +kernel

private theorem frame0680_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 680 3
      (fragments 680) (frames 680) = true := by
  decide +kernel

private theorem frame0681_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 681 3
      (fragments 681) (frames 681) = true := by
  decide +kernel

private theorem frame0682_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 682 3
      (fragments 682) (frames 682) = true := by
  decide +kernel

private theorem frame0683_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 683 3
      (fragments 683) (frames 683) = true := by
  decide +kernel

private theorem frame0684_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 684 3
      (fragments 684) (frames 684) = true := by
  decide +kernel

private theorem frame0685_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 685 3
      (fragments 685) (frames 685) = true := by
  decide +kernel

private theorem frame0686_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 686 3
      (fragments 686) (frames 686) = true := by
  decide +kernel

private theorem frame0687_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 687 3
      (fragments 687) (frames 687) = true := by
  decide +kernel

private theorem frame0688_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 688 3
      (fragments 688) (frames 688) = true := by
  decide +kernel

private theorem frame0689_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 689 3
      (fragments 689) (frames 689) = true := by
  decide +kernel

private theorem frame0690_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 690 3
      (fragments 690) (frames 690) = true := by
  decide +kernel

private theorem frame0691_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 691 3
      (fragments 691) (frames 691) = true := by
  decide +kernel

private theorem frame0692_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 692 3
      (fragments 692) (frames 692) = true := by
  decide +kernel

private theorem frame0693_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 693 3
      (fragments 693) (frames 693) = true := by
  decide +kernel

private theorem frame0694_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 694 3
      (fragments 694) (frames 694) = true := by
  decide +kernel

private theorem frame0695_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 695 3
      (fragments 695) (frames 695) = true := by
  decide +kernel

private theorem frame0696_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 696 3
      (fragments 696) (frames 696) = true := by
  decide +kernel

private theorem frame0697_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 697 3
      (fragments 697) (frames 697) = true := by
  decide +kernel

private theorem frame0698_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 698 3
      (fragments 698) (frames 698) = true := by
  decide +kernel

private theorem frame0699_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 699 3
      (fragments 699) (frames 699) = true := by
  decide +kernel

private theorem frame0700_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 700 3
      (fragments 700) (frames 700) = true := by
  decide +kernel

private theorem frame0701_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 701 3
      (fragments 701) (frames 701) = true := by
  decide +kernel

private theorem frame0702_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 702 3
      (fragments 702) (frames 702) = true := by
  decide +kernel

private theorem frame0703_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 703 3
      (fragments 703) (frames 703) = true := by
  decide +kernel

theorem block21_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 672) 3
      (fragments (j.val + 672)) (frames (j.val + 672)) = true := by
  fin_cases j
  · exact frame0672_checked
  · exact frame0673_checked
  · exact frame0674_checked
  · exact frame0675_checked
  · exact frame0676_checked
  · exact frame0677_checked
  · exact frame0678_checked
  · exact frame0679_checked
  · exact frame0680_checked
  · exact frame0681_checked
  · exact frame0682_checked
  · exact frame0683_checked
  · exact frame0684_checked
  · exact frame0685_checked
  · exact frame0686_checked
  · exact frame0687_checked
  · exact frame0688_checked
  · exact frame0689_checked
  · exact frame0690_checked
  · exact frame0691_checked
  · exact frame0692_checked
  · exact frame0693_checked
  · exact frame0694_checked
  · exact frame0695_checked
  · exact frame0696_checked
  · exact frame0697_checked
  · exact frame0698_checked
  · exact frame0699_checked
  · exact frame0700_checked
  · exact frame0701_checked
  · exact frame0702_checked
  · exact frame0703_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
