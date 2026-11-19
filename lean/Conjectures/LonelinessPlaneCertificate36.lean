import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(3,6)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid36 : staticCaseCheck 3 6 = true := by decide +kernel

theorem checked36 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 3) (tableCandidate 6 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 3 6 valid36

end Loneliness.PlaneCertificate
