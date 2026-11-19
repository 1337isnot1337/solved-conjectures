import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(3,5)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid35 : staticCaseCheck 3 5 = true := by decide +kernel

theorem checked35 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 3) (tableCandidate 5 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 3 5 valid35

end Loneliness.PlaneCertificate
