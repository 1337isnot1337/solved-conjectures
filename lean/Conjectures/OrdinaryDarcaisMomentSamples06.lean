import Conjectures.OrdinaryDarcaisMomentCells

/-! Exact homogeneous-integer tests for the ordinary third-moment bound. -/

namespace OrdinaryDarcais
set_option Elab.async false
set_option maxHeartbeats 12000000
set_option maxRecDepth 100000

theorem momentSample722To767 : MomentCell 722 767 250 := by decide +kernel
theorem momentSample767To801 : MomentCell 767 801 250 := by decide +kernel
theorem momentSample801To828 : MomentCell 801 828 250 := by decide +kernel

end OrdinaryDarcais
