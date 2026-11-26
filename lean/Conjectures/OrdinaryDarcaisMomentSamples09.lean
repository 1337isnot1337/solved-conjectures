import Conjectures.OrdinaryDarcaisMomentCells

/-! Exact homogeneous-integer tests for the ordinary third-moment bound. -/

namespace OrdinaryDarcais
set_option Elab.async false
set_option maxHeartbeats 12000000
set_option maxRecDepth 100000

theorem momentSample828To849 : MomentCell 828 849 250 := by decide +kernel
theorem momentSample849To866 : MomentCell 849 866 250 := by decide +kernel
theorem momentSample866To879 : MomentCell 866 879 250 := by decide +kernel

end OrdinaryDarcais
