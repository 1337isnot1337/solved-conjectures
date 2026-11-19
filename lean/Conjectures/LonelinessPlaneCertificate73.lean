import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(7,3)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid73 : staticCaseCheck 7 3 = true := by decide +kernel

theorem checked73 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 7) (tableCandidate 3 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 7 3 valid73

end Loneliness.PlaneCertificate
