import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(6,2)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid62 : staticCaseCheck 6 2 = true := by decide +kernel

theorem checked62 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 6) (tableCandidate 2 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 6 2 valid62

end Loneliness.PlaneCertificate
