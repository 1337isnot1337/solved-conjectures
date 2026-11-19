import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(5,4)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid54 : staticCaseCheck 5 4 = true := by decide +kernel

theorem checked54 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 5) (tableCandidate 4 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 5 4 valid54

end Loneliness.PlaneCertificate
