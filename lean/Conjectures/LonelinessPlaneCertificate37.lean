import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(3,7)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid37 : staticCaseCheck 3 7 = true := by decide +kernel

theorem checked37 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 3) (tableCandidate 7 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 3 7 valid37

end Loneliness.PlaneCertificate
