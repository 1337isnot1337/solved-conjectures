import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(1,0)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid10 : staticCaseCheck 1 0 = true := by decide +kernel

theorem checked10 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 1) (tableCandidate 0 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 1 0 valid10

end Loneliness.PlaneCertificate
