import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(6,3)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid63 : staticCaseCheck 6 3 = true := by decide +kernel

theorem checked63 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 6) (tableCandidate 3 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 6 3 valid63

end Loneliness.PlaneCertificate
