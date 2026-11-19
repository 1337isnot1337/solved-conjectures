import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 128 through 159. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0128_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 128 3
      (fragments 128) (frames 128) = true := by
  decide +kernel

private theorem frame0129_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 129 3
      (fragments 129) (frames 129) = true := by
  decide +kernel

private theorem frame0130_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 130 3
      (fragments 130) (frames 130) = true := by
  decide +kernel

private theorem frame0131_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 131 3
      (fragments 131) (frames 131) = true := by
  decide +kernel

private theorem frame0132_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 132 3
      (fragments 132) (frames 132) = true := by
  decide +kernel

private theorem frame0133_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 133 3
      (fragments 133) (frames 133) = true := by
  decide +kernel

private theorem frame0134_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 134 3
      (fragments 134) (frames 134) = true := by
  decide +kernel

private theorem frame0135_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 135 3
      (fragments 135) (frames 135) = true := by
  decide +kernel

private theorem frame0136_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 136 3
      (fragments 136) (frames 136) = true := by
  decide +kernel

private theorem frame0137_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 137 3
      (fragments 137) (frames 137) = true := by
  decide +kernel

private theorem frame0138_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 138 3
      (fragments 138) (frames 138) = true := by
  decide +kernel

private theorem frame0139_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 139 3
      (fragments 139) (frames 139) = true := by
  decide +kernel

private theorem frame0140_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 140 3
      (fragments 140) (frames 140) = true := by
  decide +kernel

private theorem frame0141_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 141 3
      (fragments 141) (frames 141) = true := by
  decide +kernel

private theorem frame0142_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 142 3
      (fragments 142) (frames 142) = true := by
  decide +kernel

private theorem frame0143_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 143 3
      (fragments 143) (frames 143) = true := by
  decide +kernel

private theorem frame0144_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 144 3
      (fragments 144) (frames 144) = true := by
  decide +kernel

private theorem frame0145_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 145 3
      (fragments 145) (frames 145) = true := by
  decide +kernel

private theorem frame0146_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 146 3
      (fragments 146) (frames 146) = true := by
  decide +kernel

private theorem frame0147_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 147 3
      (fragments 147) (frames 147) = true := by
  decide +kernel

private theorem frame0148_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 148 3
      (fragments 148) (frames 148) = true := by
  decide +kernel

private theorem frame0149_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 149 3
      (fragments 149) (frames 149) = true := by
  decide +kernel

private theorem frame0150_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 150 3
      (fragments 150) (frames 150) = true := by
  decide +kernel

private theorem frame0151_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 151 3
      (fragments 151) (frames 151) = true := by
  decide +kernel

private theorem frame0152_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 152 3
      (fragments 152) (frames 152) = true := by
  decide +kernel

private theorem frame0153_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 153 3
      (fragments 153) (frames 153) = true := by
  decide +kernel

private theorem frame0154_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 154 3
      (fragments 154) (frames 154) = true := by
  decide +kernel

private theorem frame0155_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 155 3
      (fragments 155) (frames 155) = true := by
  decide +kernel

private theorem frame0156_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 156 3
      (fragments 156) (frames 156) = true := by
  decide +kernel

private theorem frame0157_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 157 3
      (fragments 157) (frames 157) = true := by
  decide +kernel

private theorem frame0158_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 158 3
      (fragments 158) (frames 158) = true := by
  decide +kernel

private theorem frame0159_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 159 3
      (fragments 159) (frames 159) = true := by
  decide +kernel

theorem block04_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 128) 3
      (fragments (j.val + 128)) (frames (j.val + 128)) = true := by
  fin_cases j
  · exact frame0128_checked
  · exact frame0129_checked
  · exact frame0130_checked
  · exact frame0131_checked
  · exact frame0132_checked
  · exact frame0133_checked
  · exact frame0134_checked
  · exact frame0135_checked
  · exact frame0136_checked
  · exact frame0137_checked
  · exact frame0138_checked
  · exact frame0139_checked
  · exact frame0140_checked
  · exact frame0141_checked
  · exact frame0142_checked
  · exact frame0143_checked
  · exact frame0144_checked
  · exact frame0145_checked
  · exact frame0146_checked
  · exact frame0147_checked
  · exact frame0148_checked
  · exact frame0149_checked
  · exact frame0150_checked
  · exact frame0151_checked
  · exact frame0152_checked
  · exact frame0153_checked
  · exact frame0154_checked
  · exact frame0155_checked
  · exact frame0156_checked
  · exact frame0157_checked
  · exact frame0158_checked
  · exact frame0159_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
