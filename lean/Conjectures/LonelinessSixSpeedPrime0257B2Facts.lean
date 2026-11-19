import Conjectures.LonelinessSixSpeedPrime0257B2Data

/-! Exact arithmetic maps and the literal initial b=2 state. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

theorem inverse_checked : ∀ a : Fin 129, 0 < a.val → (a.val * inverse a.val) % 257 = 1 := by
  decide +kernel

theorem cover_checked : Memo.check (InitialBits.cover 7 257) coverTable = true := by
  decide +kernel

theorem compatible_checked :
    Memo.check (InitialMemo.compatibleBase 257 inverse 256) compatibleTable = true := by
  decide +kernel

theorem selected_mask_checked : InitialBits.encode (InitialSupport.selected 2) = 6 := by
  decide +kernel

theorem available_mask_checked :
    InitialBits.encode (InitialSupport.available 257 inverse 2) = 680564733841876926926749214863536422904 := by
  decide +kernel

theorem uncovered_mask_checked :
    InitialBits.encode (InitialSupport.uncovered 7 257 2) = 2596148429267413814265110725656576 := by
  decide +kernel

end Loneliness.Modular.SixSpeed.Prime0257.B2
