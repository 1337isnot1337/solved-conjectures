import Conjectures.LonelinessSixSpeedSupport257CutData

/-!
# Exact arithmetic inputs for the split prime-257 support certificate

The inverse, memo tables, and encoded initial masks are checked independently
of the support tape. These are the original probe's six finite assertions.
Every check uses ordinary kernel reduction.
-/

namespace Loneliness.Modular.SixSpeed.Support257Cuts

theorem inverse_checked : ∀ a : Fin 129, 0<a.val → (a.val*inverse a.val)%257=1 := by
  decide +kernel

theorem cover_checked : Memo.check (InitialBits.cover 7 257) coverTable=true := by
  decide +kernel

theorem compatible_checked :
    Memo.check (InitialMemo.compatibleBase 257 inverse 256) compatibleTable=true := by
  decide +kernel

theorem selected_mask_checked : InitialBits.encode (InitialSupport.selected 20) = 1048578 := by
  decide +kernel

theorem available_mask_checked : InitialBits.encode (InitialSupport.available 257 inverse 20) = 240365526570467516971528776803692838912 := by
  decide +kernel

theorem uncovered_mask_checked : InitialBits.encode (InitialSupport.uncovered 7 257 20) = 169829607615105816046181045422176337920 := by
  decide +kernel

end Loneliness.Modular.SixSpeed.Support257Cuts
