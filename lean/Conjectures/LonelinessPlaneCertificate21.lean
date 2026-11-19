import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(2,1)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid21 : staticCaseCheck 2 1 = true := by decide +kernel

theorem checked21 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 2) (tableCandidate 1 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 2 1 valid21

end Loneliness.PlaneCertificate
