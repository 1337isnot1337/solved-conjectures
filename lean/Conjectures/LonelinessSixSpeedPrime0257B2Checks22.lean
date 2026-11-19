import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 704 through 735. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0704_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 704 3
      (fragments 704) (frames 704) = true := by
  decide +kernel

private theorem frame0705_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 705 3
      (fragments 705) (frames 705) = true := by
  decide +kernel

private theorem frame0706_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 706 3
      (fragments 706) (frames 706) = true := by
  decide +kernel

private theorem frame0707_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 707 3
      (fragments 707) (frames 707) = true := by
  decide +kernel

private theorem frame0708_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 708 3
      (fragments 708) (frames 708) = true := by
  decide +kernel

private theorem frame0709_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 709 3
      (fragments 709) (frames 709) = true := by
  decide +kernel

private theorem frame0710_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 710 3
      (fragments 710) (frames 710) = true := by
  decide +kernel

private theorem frame0711_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 711 3
      (fragments 711) (frames 711) = true := by
  decide +kernel

private theorem frame0712_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 712 3
      (fragments 712) (frames 712) = true := by
  decide +kernel

private theorem frame0713_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 713 3
      (fragments 713) (frames 713) = true := by
  decide +kernel

private theorem frame0714_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 714 3
      (fragments 714) (frames 714) = true := by
  decide +kernel

private theorem frame0715_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 715 3
      (fragments 715) (frames 715) = true := by
  decide +kernel

private theorem frame0716_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 716 3
      (fragments 716) (frames 716) = true := by
  decide +kernel

private theorem frame0717_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 717 3
      (fragments 717) (frames 717) = true := by
  decide +kernel

private theorem frame0718_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 718 3
      (fragments 718) (frames 718) = true := by
  decide +kernel

private theorem frame0719_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 719 3
      (fragments 719) (frames 719) = true := by
  decide +kernel

private theorem frame0720_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 720 3
      (fragments 720) (frames 720) = true := by
  decide +kernel

private theorem frame0721_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 721 3
      (fragments 721) (frames 721) = true := by
  decide +kernel

private theorem frame0722_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 722 3
      (fragments 722) (frames 722) = true := by
  decide +kernel

private theorem frame0723_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 723 3
      (fragments 723) (frames 723) = true := by
  decide +kernel

private theorem frame0724_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 724 3
      (fragments 724) (frames 724) = true := by
  decide +kernel

private theorem frame0725_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 725 3
      (fragments 725) (frames 725) = true := by
  decide +kernel

private theorem frame0726_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 726 3
      (fragments 726) (frames 726) = true := by
  decide +kernel

private theorem frame0727_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 727 3
      (fragments 727) (frames 727) = true := by
  decide +kernel

private theorem frame0728_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 728 3
      (fragments 728) (frames 728) = true := by
  decide +kernel

private theorem frame0729_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 729 3
      (fragments 729) (frames 729) = true := by
  decide +kernel

private theorem frame0730_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 730 3
      (fragments 730) (frames 730) = true := by
  decide +kernel

private theorem frame0731_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 731 3
      (fragments 731) (frames 731) = true := by
  decide +kernel

private theorem frame0732_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 732 3
      (fragments 732) (frames 732) = true := by
  decide +kernel

private theorem frame0733_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 733 3
      (fragments 733) (frames 733) = true := by
  decide +kernel

private theorem frame0734_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 734 3
      (fragments 734) (frames 734) = true := by
  decide +kernel

private theorem frame0735_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 735 3
      (fragments 735) (frames 735) = true := by
  decide +kernel

theorem block22_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 704) 3
      (fragments (j.val + 704)) (frames (j.val + 704)) = true := by
  fin_cases j
  · exact frame0704_checked
  · exact frame0705_checked
  · exact frame0706_checked
  · exact frame0707_checked
  · exact frame0708_checked
  · exact frame0709_checked
  · exact frame0710_checked
  · exact frame0711_checked
  · exact frame0712_checked
  · exact frame0713_checked
  · exact frame0714_checked
  · exact frame0715_checked
  · exact frame0716_checked
  · exact frame0717_checked
  · exact frame0718_checked
  · exact frame0719_checked
  · exact frame0720_checked
  · exact frame0721_checked
  · exact frame0722_checked
  · exact frame0723_checked
  · exact frame0724_checked
  · exact frame0725_checked
  · exact frame0726_checked
  · exact frame0727_checked
  · exact frame0728_checked
  · exact frame0729_checked
  · exact frame0730_checked
  · exact frame0731_checked
  · exact frame0732_checked
  · exact frame0733_checked
  · exact frame0734_checked
  · exact frame0735_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
