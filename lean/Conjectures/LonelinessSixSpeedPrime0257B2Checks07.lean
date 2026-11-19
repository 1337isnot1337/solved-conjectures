import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 224 through 255. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0224_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 224 3
      (fragments 224) (frames 224) = true := by
  decide +kernel

private theorem frame0225_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 225 3
      (fragments 225) (frames 225) = true := by
  decide +kernel

private theorem frame0226_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 226 3
      (fragments 226) (frames 226) = true := by
  decide +kernel

private theorem frame0227_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 227 3
      (fragments 227) (frames 227) = true := by
  decide +kernel

private theorem frame0228_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 228 3
      (fragments 228) (frames 228) = true := by
  decide +kernel

private theorem frame0229_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 229 3
      (fragments 229) (frames 229) = true := by
  decide +kernel

private theorem frame0230_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 230 3
      (fragments 230) (frames 230) = true := by
  decide +kernel

private theorem frame0231_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 231 3
      (fragments 231) (frames 231) = true := by
  decide +kernel

private theorem frame0232_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 232 3
      (fragments 232) (frames 232) = true := by
  decide +kernel

private theorem frame0233_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 233 3
      (fragments 233) (frames 233) = true := by
  decide +kernel

private theorem frame0234_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 234 3
      (fragments 234) (frames 234) = true := by
  decide +kernel

private theorem frame0235_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 235 3
      (fragments 235) (frames 235) = true := by
  decide +kernel

private theorem frame0236_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 236 3
      (fragments 236) (frames 236) = true := by
  decide +kernel

private theorem frame0237_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 237 3
      (fragments 237) (frames 237) = true := by
  decide +kernel

private theorem frame0238_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 238 3
      (fragments 238) (frames 238) = true := by
  decide +kernel

private theorem frame0239_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 239 3
      (fragments 239) (frames 239) = true := by
  decide +kernel

private theorem frame0240_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 240 3
      (fragments 240) (frames 240) = true := by
  decide +kernel

private theorem frame0241_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 241 3
      (fragments 241) (frames 241) = true := by
  decide +kernel

private theorem frame0242_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 242 3
      (fragments 242) (frames 242) = true := by
  decide +kernel

private theorem frame0243_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 243 3
      (fragments 243) (frames 243) = true := by
  decide +kernel

private theorem frame0244_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 244 3
      (fragments 244) (frames 244) = true := by
  decide +kernel

private theorem frame0245_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 245 3
      (fragments 245) (frames 245) = true := by
  decide +kernel

private theorem frame0246_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 246 3
      (fragments 246) (frames 246) = true := by
  decide +kernel

private theorem frame0247_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 247 3
      (fragments 247) (frames 247) = true := by
  decide +kernel

private theorem frame0248_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 248 3
      (fragments 248) (frames 248) = true := by
  decide +kernel

private theorem frame0249_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 249 3
      (fragments 249) (frames 249) = true := by
  decide +kernel

private theorem frame0250_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 250 3
      (fragments 250) (frames 250) = true := by
  decide +kernel

private theorem frame0251_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 251 3
      (fragments 251) (frames 251) = true := by
  decide +kernel

private theorem frame0252_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 252 3
      (fragments 252) (frames 252) = true := by
  decide +kernel

private theorem frame0253_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 253 3
      (fragments 253) (frames 253) = true := by
  decide +kernel

private theorem frame0254_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 254 3
      (fragments 254) (frames 254) = true := by
  decide +kernel

private theorem frame0255_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 255 3
      (fragments 255) (frames 255) = true := by
  decide +kernel

theorem block07_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 224) 3
      (fragments (j.val + 224)) (frames (j.val + 224)) = true := by
  fin_cases j
  · exact frame0224_checked
  · exact frame0225_checked
  · exact frame0226_checked
  · exact frame0227_checked
  · exact frame0228_checked
  · exact frame0229_checked
  · exact frame0230_checked
  · exact frame0231_checked
  · exact frame0232_checked
  · exact frame0233_checked
  · exact frame0234_checked
  · exact frame0235_checked
  · exact frame0236_checked
  · exact frame0237_checked
  · exact frame0238_checked
  · exact frame0239_checked
  · exact frame0240_checked
  · exact frame0241_checked
  · exact frame0242_checked
  · exact frame0243_checked
  · exact frame0244_checked
  · exact frame0245_checked
  · exact frame0246_checked
  · exact frame0247_checked
  · exact frame0248_checked
  · exact frame0249_checked
  · exact frame0250_checked
  · exact frame0251_checked
  · exact frame0252_checked
  · exact frame0253_checked
  · exact frame0254_checked
  · exact frame0255_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
