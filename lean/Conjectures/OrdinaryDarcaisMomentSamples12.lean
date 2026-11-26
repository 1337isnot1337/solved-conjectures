import Conjectures.OrdinaryDarcaisMomentCells

/-! Exact homogeneous-integer tests for the ordinary third-moment bound. -/

namespace OrdinaryDarcais
set_option Elab.async false
set_option maxHeartbeats 12000000
set_option maxRecDepth 100000

theorem momentSample879To890 : MomentCell 879 890 250 := by decide +kernel
theorem momentSample890To899 : MomentCell 890 899 250 := by decide +kernel
theorem momentSample899To900 : MomentCell 899 900 250 := by decide +kernel

end OrdinaryDarcais
