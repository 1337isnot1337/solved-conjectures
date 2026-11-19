import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(2,3)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid23 : staticCaseCheck 2 3 = true := by decide +kernel

theorem checked23 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 2) (tableCandidate 3 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 2 3 valid23

end Loneliness.PlaneCertificate
