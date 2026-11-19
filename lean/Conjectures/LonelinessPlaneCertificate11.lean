import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(1,1)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid11 : staticCaseCheck 1 1 = true := by decide +kernel

theorem checked11 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 1) (tableCandidate 1 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 1 1 valid11

end Loneliness.PlaneCertificate
