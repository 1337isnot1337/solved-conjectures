import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(4,7)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid47 : staticCaseCheck 4 7 = true := by decide +kernel

theorem checked47 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 4) (tableCandidate 7 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 4 7 valid47

end Loneliness.PlaneCertificate
