import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(5,6)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid56 : staticCaseCheck 5 6 = true := by decide +kernel

theorem checked56 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 5) (tableCandidate 6 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 5 6 valid56

end Loneliness.PlaneCertificate
