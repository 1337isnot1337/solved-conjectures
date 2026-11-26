import Conjectures.OrdinaryDarcaisMomentCells

/-! Exact homogeneous-integer tests for the ordinary third-moment bound. -/

namespace OrdinaryDarcais
set_option Elab.async false
set_option maxHeartbeats 12000000
set_option maxRecDepth 100000

theorem momentSample479To584 : MomentCell 479 584 250 := by decide +kernel
theorem momentSample584To663 : MomentCell 584 663 250 := by decide +kernel
theorem momentSample663To722 : MomentCell 663 722 250 := by decide +kernel

end OrdinaryDarcais
