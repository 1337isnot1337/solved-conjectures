import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(5,5)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid55 : staticCaseCheck 5 5 = true := by decide +kernel

theorem checked55 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 5) (tableCandidate 5 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 5 5 valid55

end Loneliness.PlaneCertificate
