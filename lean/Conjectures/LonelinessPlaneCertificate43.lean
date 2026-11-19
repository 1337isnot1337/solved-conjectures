import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(4,3)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid43 : staticCaseCheck 4 3 = true := by decide +kernel

theorem checked43 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 4) (tableCandidate 3 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 4 3 valid43

end Loneliness.PlaneCertificate
