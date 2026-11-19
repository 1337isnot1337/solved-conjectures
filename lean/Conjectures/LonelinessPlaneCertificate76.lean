import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(7,6)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid76 : staticCaseCheck 7 6 = true := by decide +kernel

theorem checked76 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 7) (tableCandidate 6 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 7 6 valid76

end Loneliness.PlaneCertificate
