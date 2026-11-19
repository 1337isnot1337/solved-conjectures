import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(5,7)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid57 : staticCaseCheck 5 7 = true := by decide +kernel

theorem checked57 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 5) (tableCandidate 7 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 5 7 valid57

end Loneliness.PlaneCertificate
