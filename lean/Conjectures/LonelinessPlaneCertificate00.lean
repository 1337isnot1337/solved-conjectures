import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(0,0)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid00 : staticCaseCheck 0 0 = true := by decide +kernel

theorem checked00 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 0) (tableCandidate 0 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 0 0 valid00

end Loneliness.PlaneCertificate
