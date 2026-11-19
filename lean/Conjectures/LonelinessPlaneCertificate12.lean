import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(1,2)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid12 : staticCaseCheck 1 2 = true := by decide +kernel

theorem checked12 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 1) (tableCandidate 2 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 1 2 valid12

end Loneliness.PlaneCertificate
