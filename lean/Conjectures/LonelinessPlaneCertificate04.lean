import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(0,4)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid04 : staticCaseCheck 0 4 = true := by decide +kernel

theorem checked04 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 0) (tableCandidate 4 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 0 4 valid04

end Loneliness.PlaneCertificate
