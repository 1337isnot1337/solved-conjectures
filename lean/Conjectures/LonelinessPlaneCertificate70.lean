import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(7,0)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid70 : staticCaseCheck 7 0 = true := by decide +kernel

theorem checked70 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 7) (tableCandidate 0 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 7 0 valid70

end Loneliness.PlaneCertificate
