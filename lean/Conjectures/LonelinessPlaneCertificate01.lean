import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(0,1)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid01 : staticCaseCheck 0 1 = true := by decide +kernel

theorem checked01 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 0) (tableCandidate 1 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 0 1 valid01

end Loneliness.PlaneCertificate
