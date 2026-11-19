import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(4,5)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid45 : staticCaseCheck 4 5 = true := by decide +kernel

theorem checked45 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 4) (tableCandidate 5 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 4 5 valid45

end Loneliness.PlaneCertificate
