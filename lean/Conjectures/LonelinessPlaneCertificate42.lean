import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(4,2)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid42 : staticCaseCheck 4 2 = true := by decide +kernel

theorem checked42 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 4) (tableCandidate 2 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 4 2 valid42

end Loneliness.PlaneCertificate
