import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(2,5)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid25 : staticCaseCheck 2 5 = true := by decide +kernel

theorem checked25 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 2) (tableCandidate 5 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 2 5 valid25

end Loneliness.PlaneCertificate
