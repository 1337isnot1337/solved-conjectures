import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(6,6)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid66 : staticCaseCheck 6 6 = true := by decide +kernel

theorem checked66 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 6) (tableCandidate 6 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 6 6 valid66

end Loneliness.PlaneCertificate
