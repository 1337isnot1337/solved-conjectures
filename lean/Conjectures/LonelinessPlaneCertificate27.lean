import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(2,7)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid27 : staticCaseCheck 2 7 = true := by decide +kernel

theorem checked27 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 2) (tableCandidate 7 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 2 7 valid27

end Loneliness.PlaneCertificate
