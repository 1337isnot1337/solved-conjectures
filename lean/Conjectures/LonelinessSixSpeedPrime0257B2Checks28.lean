import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 896 through 904. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0896_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 896 3
      (fragments 896) (frames 896) = true := by
  decide +kernel

private theorem frame0897_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 897 3
      (fragments 897) (frames 897) = true := by
  decide +kernel

private theorem frame0898_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 898 3
      (fragments 898) (frames 898) = true := by
  decide +kernel

private theorem frame0899_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 899 3
      (fragments 899) (frames 899) = true := by
  decide +kernel

private theorem frame0900_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 900 3
      (fragments 900) (frames 900) = true := by
  decide +kernel

private theorem frame0901_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 901 3
      (fragments 901) (frames 901) = true := by
  decide +kernel

private theorem frame0902_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 902 3
      (fragments 902) (frames 902) = true := by
  decide +kernel

private theorem frame0903_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 903 3
      (fragments 903) (frames 903) = true := by
  decide +kernel

private theorem frame0904_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 904 3
      (fragments 904) (frames 904) = true := by
  decide +kernel

theorem block28_checked (j : Fin 9) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 896) 3
      (fragments (j.val + 896)) (frames (j.val + 896)) = true := by
  fin_cases j
  · exact frame0896_checked
  · exact frame0897_checked
  · exact frame0898_checked
  · exact frame0899_checked
  · exact frame0900_checked
  · exact frame0901_checked
  · exact frame0902_checked
  · exact frame0903_checked
  · exact frame0904_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
