import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(0,5)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid05 : staticCaseCheck 0 5 = true := by decide +kernel

theorem checked05 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 0) (tableCandidate 5 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 0 5 valid05

end Loneliness.PlaneCertificate
