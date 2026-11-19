import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(1,4)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid14 : staticCaseCheck 1 4 = true := by decide +kernel

theorem checked14 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 1) (tableCandidate 4 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 1 4 valid14

end Loneliness.PlaneCertificate
