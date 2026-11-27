import Conjectures.ShiftedLonelyRunnerWeightedWindow

/-!
# A kernel-checked sample for the finite speed sweep

The whole-range executable check is in
results/shifted-lonely-runner-counterexamples/verify_weighted_finite.lean.
This module records a checked proposition at speed 160.
-/

namespace ShiftedLonelyRunner.WeightedResidual

set_option maxRecDepth 30000 in
set_option maxHeartbeats 0 in
set_option cbv.maxSteps 20000000 in
theorem checkFiniteSpeed_160 : checkFiniteSpeed 160 = true := by
  cbv

end ShiftedLonelyRunner.WeightedResidual
