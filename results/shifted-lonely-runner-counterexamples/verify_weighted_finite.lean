import Conjectures.ShiftedLonelyRunnerWeightedWindow

open ShiftedLonelyRunner.WeightedResidual

#eval show IO Unit from do
  let mut failures : Array Nat := #[]
  for speed in [1:59941] do
    if !checkFiniteSpeed speed then
      failures := failures.push speed
  if failures.isEmpty then
    IO.println "Every speed 1 through 59940 passed the exact executable Lean checker."
  else
    throw (IO.userError s!"Failing speeds {failures}")
