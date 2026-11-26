import Conjectures.OrdinaryDarcaisMomentCells

/-! Exact homogeneous-integer tests for the ordinary third-moment bound. -/

namespace OrdinaryDarcais
set_option Elab.async false
set_option maxHeartbeats 12000000
set_option maxRecDepth 100000

theorem momentSample0To173 : MomentCell 0 173 250 := by decide +kernel
theorem momentSample173To342 : MomentCell 173 342 250 := by decide +kernel
theorem momentSample342To479 : MomentCell 342 479 250 := by decide +kernel

end OrdinaryDarcais
