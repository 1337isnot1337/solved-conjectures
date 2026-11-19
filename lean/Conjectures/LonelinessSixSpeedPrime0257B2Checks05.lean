import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 160 through 191. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0160_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 160 3
      (fragments 160) (frames 160) = true := by
  decide +kernel

private theorem frame0161_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 161 3
      (fragments 161) (frames 161) = true := by
  decide +kernel

private theorem frame0162_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 162 3
      (fragments 162) (frames 162) = true := by
  decide +kernel

private theorem frame0163_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 163 3
      (fragments 163) (frames 163) = true := by
  decide +kernel

private theorem frame0164_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 164 3
      (fragments 164) (frames 164) = true := by
  decide +kernel

private theorem frame0165_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 165 3
      (fragments 165) (frames 165) = true := by
  decide +kernel

private theorem frame0166_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 166 3
      (fragments 166) (frames 166) = true := by
  decide +kernel

private theorem frame0167_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 167 3
      (fragments 167) (frames 167) = true := by
  decide +kernel

private theorem frame0168_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 168 3
      (fragments 168) (frames 168) = true := by
  decide +kernel

private theorem frame0169_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 169 3
      (fragments 169) (frames 169) = true := by
  decide +kernel

private theorem frame0170_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 170 3
      (fragments 170) (frames 170) = true := by
  decide +kernel

private theorem frame0171_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 171 3
      (fragments 171) (frames 171) = true := by
  decide +kernel

private theorem frame0172_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 172 3
      (fragments 172) (frames 172) = true := by
  decide +kernel

private theorem frame0173_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 173 3
      (fragments 173) (frames 173) = true := by
  decide +kernel

private theorem frame0174_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 174 3
      (fragments 174) (frames 174) = true := by
  decide +kernel

private theorem frame0175_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 175 3
      (fragments 175) (frames 175) = true := by
  decide +kernel

private theorem frame0176_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 176 3
      (fragments 176) (frames 176) = true := by
  decide +kernel

private theorem frame0177_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 177 3
      (fragments 177) (frames 177) = true := by
  decide +kernel

private theorem frame0178_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 178 3
      (fragments 178) (frames 178) = true := by
  decide +kernel

private theorem frame0179_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 179 3
      (fragments 179) (frames 179) = true := by
  decide +kernel

private theorem frame0180_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 180 3
      (fragments 180) (frames 180) = true := by
  decide +kernel

private theorem frame0181_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 181 3
      (fragments 181) (frames 181) = true := by
  decide +kernel

private theorem frame0182_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 182 3
      (fragments 182) (frames 182) = true := by
  decide +kernel

private theorem frame0183_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 183 3
      (fragments 183) (frames 183) = true := by
  decide +kernel

private theorem frame0184_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 184 3
      (fragments 184) (frames 184) = true := by
  decide +kernel

private theorem frame0185_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 185 3
      (fragments 185) (frames 185) = true := by
  decide +kernel

private theorem frame0186_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 186 3
      (fragments 186) (frames 186) = true := by
  decide +kernel

private theorem frame0187_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 187 3
      (fragments 187) (frames 187) = true := by
  decide +kernel

private theorem frame0188_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 188 3
      (fragments 188) (frames 188) = true := by
  decide +kernel

private theorem frame0189_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 189 3
      (fragments 189) (frames 189) = true := by
  decide +kernel

private theorem frame0190_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 190 3
      (fragments 190) (frames 190) = true := by
  decide +kernel

private theorem frame0191_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 191 3
      (fragments 191) (frames 191) = true := by
  decide +kernel

theorem block05_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 160) 3
      (fragments (j.val + 160)) (frames (j.val + 160)) = true := by
  fin_cases j
  · exact frame0160_checked
  · exact frame0161_checked
  · exact frame0162_checked
  · exact frame0163_checked
  · exact frame0164_checked
  · exact frame0165_checked
  · exact frame0166_checked
  · exact frame0167_checked
  · exact frame0168_checked
  · exact frame0169_checked
  · exact frame0170_checked
  · exact frame0171_checked
  · exact frame0172_checked
  · exact frame0173_checked
  · exact frame0174_checked
  · exact frame0175_checked
  · exact frame0176_checked
  · exact frame0177_checked
  · exact frame0178_checked
  · exact frame0179_checked
  · exact frame0180_checked
  · exact frame0181_checked
  · exact frame0182_checked
  · exact frame0183_checked
  · exact frame0184_checked
  · exact frame0185_checked
  · exact frame0186_checked
  · exact frame0187_checked
  · exact frame0188_checked
  · exact frame0189_checked
  · exact frame0190_checked
  · exact frame0191_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
