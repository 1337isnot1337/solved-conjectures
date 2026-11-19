import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(4,4)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid44 : staticCaseCheck 4 4 = true := by decide +kernel

theorem checked44 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 4) (tableCandidate 4 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 4 4 valid44

end Loneliness.PlaneCertificate
