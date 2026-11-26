import Conjectures.PomeranceSarkozyActualCountEvents
import Conjectures.PomeranceSarkozyActualCountLaw
import Conjectures.PomeranceSarkozyActualCountMeasure
import Conjectures.PomeranceSarkozyArithmeticTV
import Conjectures.PomeranceSarkozyArithmeticTruncation
import Conjectures.PomeranceSarkozyAtomKernel
import Conjectures.PomeranceSarkozyAtomLaw
import Conjectures.PomeranceSarkozyAtomicEvent
import Conjectures.PomeranceSarkozyAtomicPush
import Conjectures.PomeranceSarkozyBernoulliCharacteristic
import Conjectures.PomeranceSarkozyBernoulliCountEncoding
import Conjectures.PomeranceSarkozyBernoulliMatrix
import Conjectures.PomeranceSarkozyBernoulliProduct
import Conjectures.PomeranceSarkozyBonferroniKernel
import Conjectures.PomeranceSarkozyBoundedArray
import Conjectures.PomeranceSarkozyBoundedCharacteristic
import Conjectures.PomeranceSarkozyBoundedGaussianError
import Conjectures.PomeranceSarkozyCoordinateLaws
import Conjectures.PomeranceSarkozyCountableProduct
import Conjectures.PomeranceSarkozyCountableVariation
import Conjectures.PomeranceSarkozyDiscardedOffsets
import Conjectures.PomeranceSarkozyFactorialTail
import Conjectures.PomeranceSarkozyFiniteAtomic
import Conjectures.PomeranceSarkozyFiniteSieve
import Conjectures.PomeranceSarkozyFiniteTotalVariation
import Conjectures.PomeranceSarkozyFullFiniteComparison
import Conjectures.PomeranceSarkozyGaussianAbsolute
import Conjectures.PomeranceSarkozyGrowingCRT
import Conjectures.PomeranceSarkozyGrowingCutoffs
import Conjectures.PomeranceSarkozyGrowingDiscardedOffsets
import Conjectures.PomeranceSarkozyGrowingEvent
import Conjectures.PomeranceSarkozyGrowingEventBounds
import Conjectures.PomeranceSarkozyGrowingFactorial
import Conjectures.PomeranceSarkozyGrowingGeometry
import Conjectures.PomeranceSarkozyGrowingModelGaussian
import Conjectures.PomeranceSarkozyGrowingPrimeMass
import Conjectures.PomeranceSarkozyIncidenceProbabilities
import Conjectures.PomeranceSarkozyIndependentArrayLaw
import Conjectures.PomeranceSarkozyIndependentResidues
import Conjectures.PomeranceSarkozyJointCountComparison
import Conjectures.PomeranceSarkozyLiteralPrimeTuples
import Conjectures.PomeranceSarkozyLogKernels
import Conjectures.PomeranceSarkozyMangoldtFloor
import Conjectures.PomeranceSarkozyMangoldtReciprocal
import Conjectures.PomeranceSarkozyManyProduct
import Conjectures.PomeranceSarkozyMatrixComparison
import Conjectures.PomeranceSarkozyMeasureEvent
import Conjectures.PomeranceSarkozyMeasurePush
import Conjectures.PomeranceSarkozyMertensAbel
import Conjectures.PomeranceSarkozyMertensRemainder
import Conjectures.PomeranceSarkozyModelBandProbability
import Conjectures.PomeranceSarkozyModelCountMass
import Conjectures.PomeranceSarkozyModelIncidence
import Conjectures.PomeranceSarkozyModelThresholdLaw
import Conjectures.PomeranceSarkozyModelThresholdMoment
import Conjectures.PomeranceSarkozyModelThresholdTails
import Conjectures.PomeranceSarkozyModelThresholdVariance
import Conjectures.PomeranceSarkozyNearThresholdBand
import Conjectures.PomeranceSarkozyObservationLaws
import Conjectures.PomeranceSarkozyOffsets
import Conjectures.PomeranceSarkozyOmittedPrimeDecay
import Conjectures.PomeranceSarkozyOmittedPrimeEvent
import Conjectures.PomeranceSarkozyOmittedPrimeMass
import Conjectures.PomeranceSarkozyPoissonAtom
import Conjectures.PomeranceSarkozyPoissonColumns
import Conjectures.PomeranceSarkozyPoissonCountLaw
import Conjectures.PomeranceSarkozyPoissonDifferenceChar
import Conjectures.PomeranceSarkozyPoissonDifferenceMoment
import Conjectures.PomeranceSarkozyPoissonMoments
import Conjectures.PomeranceSarkozyPoissonSums
import Conjectures.PomeranceSarkozyPoissonTuple
import Conjectures.PomeranceSarkozyPoissonVariance
import Conjectures.PomeranceSarkozyPrimeCRT
import Conjectures.PomeranceSarkozyPrimeCategorical
import Conjectures.PomeranceSarkozyPrimeObservation
import Conjectures.PomeranceSarkozyPrimeProduct
import Conjectures.PomeranceSarkozyProductVariation
import Conjectures.PomeranceSarkozyReciprocalTail
import Conjectures.PomeranceSarkozyResidueCountEncoding
import Conjectures.PomeranceSarkozyResidueWindow
import Conjectures.PomeranceSarkozyRestoreSample
import Conjectures.PomeranceSarkozySourceFluctuations
import Conjectures.PomeranceSarkozySourceNormalization
import Conjectures.PomeranceSarkozySourceProbability
import Conjectures.PomeranceSarkozySourceSample
import Conjectures.PomeranceSarkozySqrtWeightedPrefix
import Conjectures.PomeranceSarkozyStatisticBridge
import Conjectures.PomeranceSarkozySubsetPairs
import Conjectures.PomeranceSarkozySupportedPush
import Conjectures.PomeranceSarkozyTailCross
import Conjectures.PomeranceSarkozyTailProbability
import Conjectures.PomeranceSarkozyThresholdTransfer
import Conjectures.PomeranceSarkozyTruncationSums
import Conjectures.PomeranceSarkozyUniformPush
import Conjectures.PomeranceSarkozyWeakAbsoluteMoment
import Conjectures.PomeranceSarkozyWeightedPrime
import Conjectures.PomeranceSarkozyWindowCombinatorics
import Conjectures.PomeranceSarkozyWindowCounts
import Conjectures.PomeranceSarkozyWindowWeakTransfer
import Lean.Util.CollectAxioms
import Lean.PrivateName
import Lean.Elab.Command
import Lean.Data.Json

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open Lean Elab Command in
run_cmd do
  let expectedModules : Array String := #["Conjectures.PomeranceSarkozyActualCountEvents", "Conjectures.PomeranceSarkozyActualCountLaw", "Conjectures.PomeranceSarkozyActualCountMeasure", "Conjectures.PomeranceSarkozyArithmeticTV", "Conjectures.PomeranceSarkozyArithmeticTruncation", "Conjectures.PomeranceSarkozyAtomKernel", "Conjectures.PomeranceSarkozyAtomLaw", "Conjectures.PomeranceSarkozyAtomicEvent", "Conjectures.PomeranceSarkozyAtomicPush", "Conjectures.PomeranceSarkozyBernoulliCharacteristic", "Conjectures.PomeranceSarkozyBernoulliCountEncoding", "Conjectures.PomeranceSarkozyBernoulliMatrix", "Conjectures.PomeranceSarkozyBernoulliProduct", "Conjectures.PomeranceSarkozyBonferroniKernel", "Conjectures.PomeranceSarkozyBoundedArray", "Conjectures.PomeranceSarkozyBoundedCharacteristic", "Conjectures.PomeranceSarkozyBoundedGaussianError", "Conjectures.PomeranceSarkozyCoordinateLaws", "Conjectures.PomeranceSarkozyCountableProduct", "Conjectures.PomeranceSarkozyCountableVariation", "Conjectures.PomeranceSarkozyDiscardedOffsets", "Conjectures.PomeranceSarkozyFactorialTail", "Conjectures.PomeranceSarkozyFiniteAtomic", "Conjectures.PomeranceSarkozyFiniteSieve", "Conjectures.PomeranceSarkozyFiniteTotalVariation", "Conjectures.PomeranceSarkozyFullFiniteComparison", "Conjectures.PomeranceSarkozyGaussianAbsolute", "Conjectures.PomeranceSarkozyGrowingCRT", "Conjectures.PomeranceSarkozyGrowingCutoffs", "Conjectures.PomeranceSarkozyGrowingDiscardedOffsets", "Conjectures.PomeranceSarkozyGrowingEvent", "Conjectures.PomeranceSarkozyGrowingEventBounds", "Conjectures.PomeranceSarkozyGrowingFactorial", "Conjectures.PomeranceSarkozyGrowingGeometry", "Conjectures.PomeranceSarkozyGrowingModelGaussian", "Conjectures.PomeranceSarkozyGrowingPrimeMass", "Conjectures.PomeranceSarkozyIncidenceProbabilities", "Conjectures.PomeranceSarkozyIndependentArrayLaw", "Conjectures.PomeranceSarkozyIndependentResidues", "Conjectures.PomeranceSarkozyJointCountComparison", "Conjectures.PomeranceSarkozyLiteralPrimeTuples", "Conjectures.PomeranceSarkozyLogKernels", "Conjectures.PomeranceSarkozyMangoldtFloor", "Conjectures.PomeranceSarkozyMangoldtReciprocal", "Conjectures.PomeranceSarkozyManyProduct", "Conjectures.PomeranceSarkozyMatrixComparison", "Conjectures.PomeranceSarkozyMeasureEvent", "Conjectures.PomeranceSarkozyMeasurePush", "Conjectures.PomeranceSarkozyMertensAbel", "Conjectures.PomeranceSarkozyMertensRemainder", "Conjectures.PomeranceSarkozyModelBandProbability", "Conjectures.PomeranceSarkozyModelCountMass", "Conjectures.PomeranceSarkozyModelIncidence", "Conjectures.PomeranceSarkozyModelThresholdLaw", "Conjectures.PomeranceSarkozyModelThresholdMoment", "Conjectures.PomeranceSarkozyModelThresholdTails", "Conjectures.PomeranceSarkozyModelThresholdVariance", "Conjectures.PomeranceSarkozyNearThresholdBand", "Conjectures.PomeranceSarkozyObservationLaws", "Conjectures.PomeranceSarkozyOffsets", "Conjectures.PomeranceSarkozyOmittedPrimeDecay", "Conjectures.PomeranceSarkozyOmittedPrimeEvent", "Conjectures.PomeranceSarkozyOmittedPrimeMass", "Conjectures.PomeranceSarkozyPoissonAtom", "Conjectures.PomeranceSarkozyPoissonColumns", "Conjectures.PomeranceSarkozyPoissonCountLaw", "Conjectures.PomeranceSarkozyPoissonDifferenceChar", "Conjectures.PomeranceSarkozyPoissonDifferenceMoment", "Conjectures.PomeranceSarkozyPoissonMoments", "Conjectures.PomeranceSarkozyPoissonSums", "Conjectures.PomeranceSarkozyPoissonTuple", "Conjectures.PomeranceSarkozyPoissonVariance", "Conjectures.PomeranceSarkozyPrimeCRT", "Conjectures.PomeranceSarkozyPrimeCategorical", "Conjectures.PomeranceSarkozyPrimeObservation", "Conjectures.PomeranceSarkozyPrimeProduct", "Conjectures.PomeranceSarkozyProductVariation", "Conjectures.PomeranceSarkozyReciprocalTail", "Conjectures.PomeranceSarkozyResidueCountEncoding", "Conjectures.PomeranceSarkozyResidueWindow", "Conjectures.PomeranceSarkozyRestoreSample", "Conjectures.PomeranceSarkozySourceFluctuations", "Conjectures.PomeranceSarkozySourceNormalization", "Conjectures.PomeranceSarkozySourceProbability", "Conjectures.PomeranceSarkozySourceSample", "Conjectures.PomeranceSarkozySqrtWeightedPrefix", "Conjectures.PomeranceSarkozyStatisticBridge", "Conjectures.PomeranceSarkozySubsetPairs", "Conjectures.PomeranceSarkozySupportedPush", "Conjectures.PomeranceSarkozyTailCross", "Conjectures.PomeranceSarkozyTailProbability", "Conjectures.PomeranceSarkozyThresholdTransfer", "Conjectures.PomeranceSarkozyTruncationSums", "Conjectures.PomeranceSarkozyUniformPush", "Conjectures.PomeranceSarkozyWeakAbsoluteMoment", "Conjectures.PomeranceSarkozyWeightedPrime", "Conjectures.PomeranceSarkozyWindowCombinatorics", "Conjectures.PomeranceSarkozyWindowCounts", "Conjectures.PomeranceSarkozyWindowWeakTransfer"]
  let required : Array Name := #[`PomeranceSarkozy.source_arithmetic_quarter_gaussian, `PomeranceSarkozy.source_sqrt_converges_in_probability]
  let legacyPrefixes : Array String := #[]
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let env ← getEnv
  if env.header.isModule then
    throwError "All-owned audit must use legacy private-import mode"
  unless env.header.modules.size == env.header.moduleData.size do
    throwError "Imported module/data inventory size mismatch"
  let mut rawNames : NameSet := {}
  let mut seenModules : Array String := #[]
  for h : idx in [0:env.header.modules.size] do
    let mod := env.header.modules[idx]
    let moduleName := mod.module.toString
    let isProject := moduleName == "Solitaire" || moduleName.startsWith "Solitaire." ||
      moduleName == "Conjectures" || moduleName.startsWith "Conjectures."
    unless !isProject || expectedModules.contains moduleName do
      throwError "Unregistered project module in audit: {moduleName}"
    if expectedModules.contains moduleName then
      unless mod.hasData && mod.importAll do
        throwError "Project module lacks complete private data: {moduleName}"
      let data := env.header.moduleData[idx]!
      unless data.constNames == data.constants.map (·.name) do
        throwError "Serialized declaration names differ from their constants: {moduleName}"
      seenModules := seenModules.push moduleName
      let mut privateCount := 0
      for name in data.constNames do
        unless (env.find? name).isSome do
          throwError "Serialized project declaration is invisible: {moduleName}: {name}"
        rawNames := rawNames.insert name
        if (privateToUserName? name).isSome then
          privateCount := privateCount + 1
      let record := Json.mkObj [
        ("tag", toJson "module"), ("module", toJson moduleName),
        ("modern", toJson data.isModule), ("import_all", toJson mod.importAll),
        ("has_data", toJson mod.hasData),
        ("names", toJson (data.constNames.map (·.toString))),
        ("private_count", toJson privateCount)]
      logInfo m!"ALL-OWNED-JSON {record.compress}"
  unless seenModules.size == expectedModules.size &&
      expectedModules.all seenModules.contains do
    throwError "Incomplete exact project module inventory"
  let mut audited : NameSet := {}
  let mut declarations := 0
  let mut theorems := 0
  let mut privateDeclarations := 0
  for (name, info) in env.constants.toList do
    let owner := match env.getModuleIdxFor? name |>.bind (env.header.modules[·]?) with
      | some mod => mod.module.toString
      | none => ""
    let userName := privateToUserName name
    let byModule := expectedModules.contains owner
    let bySerialized := rawNames.contains name
    let byLegacy := legacyPrefixes.any (fun p => userName.toString.startsWith p)
    if byModule || bySerialized || byLegacy then
      declarations := declarations + 1
      audited := audited.insert name
      let kind := match info with
        | .axiomInfo _ => "axiom"
        | .defnInfo _ => "definition"
        | .thmInfo _ => "theorem"
        | .opaqueInfo _ => "opaque"
        | .quotInfo _ => "quotient"
        | .ctorInfo _ => "constructor"
        | .recInfo _ => "recursor"
        | .inductInfo _ => "inductive"
      if info.isTheorem then
        theorems := theorems + 1
      let privateName := privateToUserName? name
      if privateName.isSome then
        privateDeclarations := privateDeclarations + 1
      if let .axiomInfo _ := info then
        unless allowed.contains name do
          throwError "Unapproved project axiom {name}"
      let axioms ← collectAxioms name
      for axiomName in axioms do
        unless allowed.contains axiomName do
          throwError "Unapproved axiom {axiomName} in {name}"
      let record := Json.mkObj [
        ("tag", toJson "declaration"), ("name", toJson name.toString),
        ("owner", toJson owner), ("kind", toJson kind),
        ("private_user_name", toJson (privateName.map (·.toString))),
        ("by_module", toJson byModule), ("by_serialized", toJson bySerialized),
        ("by_legacy_prefix", toJson byLegacy),
        ("axioms", toJson (axioms.map (·.toString)))]
      logInfo m!"ALL-OWNED-JSON {record.compress}"
  for name in rawNames.toArray do
    unless audited.contains name do
      throwError "Serialized project declaration escaped the audit: {name}"
  for name in required do
    let _ ← getConstInfo name
    unless audited.contains name do
      throwError "Required declaration is outside audited ownership: {name}"
    let record := Json.mkObj [("tag", toJson "required"), ("name", toJson name.toString)]
    logInfo m!"ALL-OWNED-JSON {record.compress}"
  let record := Json.mkObj [
    ("tag", toJson "passed"), ("modules", toJson seenModules.size),
    ("declarations", toJson declarations), ("theorems", toJson theorems),
    ("private_declarations", toJson privateDeclarations),
    ("raw_declarations", toJson rawNames.toArray.size),
    ("required", toJson required.size), ("allowed_axioms", toJson (allowed.map (·.toString)))]
  logInfo m!"ALL-OWNED-JSON {record.compress}"
