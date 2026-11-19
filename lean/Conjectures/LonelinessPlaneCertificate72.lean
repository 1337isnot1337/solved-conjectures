import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(7,2)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid72 : staticCaseCheck 7 2 = true := by decide +kernel

theorem checked72 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 7) (tableCandidate 2 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 7 2 valid72

end Loneliness.PlaneCertificate
