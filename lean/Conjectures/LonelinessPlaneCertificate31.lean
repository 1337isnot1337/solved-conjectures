import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(3,1)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid31 : staticCaseCheck 3 1 = true := by decide +kernel

theorem checked31 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 3) (tableCandidate 1 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 3 1 valid31

end Loneliness.PlaneCertificate
