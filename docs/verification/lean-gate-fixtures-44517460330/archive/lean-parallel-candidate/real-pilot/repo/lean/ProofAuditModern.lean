module
import all Conjectures.FranklBasic
import all Conjectures.FranklCyclicCertificates
import all Conjectures.FranklCyclicGenerators
import all Conjectures.FranklCyclicRank
import all Conjectures.FranklCyclicWords
import all Conjectures.FranklFCBitCode
import all Conjectures.FranklFamily
import all Conjectures.FranklLocalCertificate
import all Conjectures.FranklLocalEnumeration
import all Conjectures.FranklLocalEnumerationCore
import all Conjectures.FranklLocalEnumerationMap
import all Conjectures.FranklLocalFibers
import all Conjectures.FranklLocalFiniteSupport
import all Conjectures.FranklLocalMaskCertificate
import all Conjectures.FranklLocalMaskDomains
import all Conjectures.FranklLocalMaximalCover
import all Conjectures.FranklLocalWeights
import all Conjectures.FranklSmallCyclicMaskWindows
import all Conjectures.FranklSmallCyclicMasks
import all Conjectures.FranklSmallCyclicWeights
import all Conjectures.FranklSmallCyclicWeights7Pilot
import all Conjectures.FranklSmallCyclicWeights8Pilot
import all Conjectures.FranklSmallCyclicWeights9Pilot
import all Conjectures.FranklSmallCyclicWeightsPilot
import all Conjectures.FranklSmallCyclicWeightsPilotData
public meta import Lean.Util.CollectAxioms
public meta import Lean.PrivateName
public meta import Lean.Elab.Command

open Lean Elab Command in
run_cmd do
  let required : Array Name := #[`FranklSmallCyclic.Weights.Period7Pilot.checked, `FranklSmallCyclic.Weights.Period7Pilot.each_checked, `FranklSmallCyclic.Weights.Period8Pilot.checked, `FranklSmallCyclic.Weights.Period8Pilot.each_checked, `FranklSmallCyclic.Weights.Period9Pilot.checked, `FranklSmallCyclic.Weights.Period9Pilot.each_checked]
  let expectedPrivate : Array Name := #[`FranklSmallCyclic.Weights.Period7Pilot.checked0, `FranklSmallCyclic.Weights.Period7Pilot.checked1, `FranklSmallCyclic.Weights.Period7Pilot.checked2, `FranklSmallCyclic.Weights.Period7Pilot.checked3, `FranklSmallCyclic.Weights.Period7Pilot.checked4, `FranklSmallCyclic.Weights.Period7Pilot.checked5, `FranklSmallCyclic.Weights.Period7Pilot.checked6, `FranklSmallCyclic.Weights.Period7Pilot.checked7, `FranklSmallCyclic.Weights.Period8Pilot.checked0, `FranklSmallCyclic.Weights.Period8Pilot.checked1, `FranklSmallCyclic.Weights.Period8Pilot.checked2, `FranklSmallCyclic.Weights.Period8Pilot.checked3, `FranklSmallCyclic.Weights.Period8Pilot.checked4, `FranklSmallCyclic.Weights.Period8Pilot.checked5, `FranklSmallCyclic.Weights.Period8Pilot.checked6, `FranklSmallCyclic.Weights.Period8Pilot.checked7, `FranklSmallCyclic.Weights.Period9Pilot.checked0, `FranklSmallCyclic.Weights.Period9Pilot.checked1, `FranklSmallCyclic.Weights.Period9Pilot.checked2, `FranklSmallCyclic.Weights.Period9Pilot.checked3, `FranklSmallCyclic.Weights.Period9Pilot.checked4, `FranklSmallCyclic.Weights.Period9Pilot.checked5, `FranklSmallCyclic.Weights.Period9Pilot.checked6, `FranklSmallCyclic.Weights.Period9Pilot.checked7]
  let modules : Array String := #["Conjectures.FranklBasic", "Conjectures.FranklCyclicCertificates", "Conjectures.FranklCyclicGenerators", "Conjectures.FranklCyclicRank", "Conjectures.FranklCyclicWords", "Conjectures.FranklFCBitCode", "Conjectures.FranklFamily", "Conjectures.FranklLocalCertificate", "Conjectures.FranklLocalEnumeration", "Conjectures.FranklLocalEnumerationCore", "Conjectures.FranklLocalEnumerationMap", "Conjectures.FranklLocalFibers", "Conjectures.FranklLocalFiniteSupport", "Conjectures.FranklLocalMaskCertificate", "Conjectures.FranklLocalMaskDomains", "Conjectures.FranklLocalMaximalCover", "Conjectures.FranklLocalWeights", "Conjectures.FranklSmallCyclicMaskWindows", "Conjectures.FranklSmallCyclicMasks", "Conjectures.FranklSmallCyclicWeights", "Conjectures.FranklSmallCyclicWeights7Pilot", "Conjectures.FranklSmallCyclicWeights8Pilot", "Conjectures.FranklSmallCyclicWeights9Pilot", "Conjectures.FranklSmallCyclicWeightsPilot", "Conjectures.FranklSmallCyclicWeightsPilotData"]
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let env ← getEnv
  let mut declarations : Nat := 0
  let mut theorems : Nat := 0
  let mut seenPrivate : Array Name := #[]
  let mut seenRequired : Array Name := #[]
  for (name, info) in env.constants.toList do
    let owned := match env.getModuleIdxFor? name |>.bind (env.header.modules[·]?) with
      | some mod => modules.contains mod.module.toString
      | none => false
    if owned then
      declarations := declarations + 1
      if required.contains name then
        unless info.isTheorem do
          throwError "Required endpoint is not a theorem: {name}"
        seenRequired := seenRequired.push name
        logInfo m!"PARALLEL-AUDIT-ENDPOINT {name}"
      if let .axiomInfo _ := info then
        unless allowed.contains name do
          throwError "Unapproved project axiom {name}"
      if let .thmInfo _ := info then
        theorems := theorems + 1
        if let some userName := privateToUserName? name then
          if expectedPrivate.contains userName then
            seenPrivate := seenPrivate.push userName
      for axiomName in ← collectAxioms name do
        unless allowed.contains axiomName do
          throwError "Unapproved axiom {axiomName} in {name}"
  for name in expectedPrivate do
    unless seenPrivate.contains name do
      throwError "Missing private theorem {name}"
  unless seenPrivate.size == expectedPrivate.size do
    throwError "Private theorem count mismatch"
  logInfo m!"PARALLEL-AUDIT PASS: {declarations} owned declarations; {theorems} theorems; {expectedPrivate.size} private proofs; {seenRequired.size} endpoints"
