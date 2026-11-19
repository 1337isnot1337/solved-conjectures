import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(5,3)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid53 : staticCaseCheck 5 3 = true := by decide +kernel

theorem checked53 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 5) (tableCandidate 3 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 5 3 valid53

end Loneliness.PlaneCertificate
