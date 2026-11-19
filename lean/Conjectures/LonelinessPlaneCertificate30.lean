import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(3,0)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid30 : staticCaseCheck 3 0 = true := by decide +kernel

theorem checked30 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 3) (tableCandidate 0 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 3 0 valid30

end Loneliness.PlaneCertificate
