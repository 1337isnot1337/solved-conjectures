import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(4,6)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid46 : staticCaseCheck 4 6 = true := by decide +kernel

theorem checked46 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 4) (tableCandidate 6 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 4 6 valid46

end Loneliness.PlaneCertificate
