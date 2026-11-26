import Conjectures.PomeranceSarkozyActualCountEvents
import Conjectures.PomeranceSarkozyActualCountLaw
import Conjectures.PomeranceSarkozyActualCountMeasure
import Conjectures.PomeranceSarkozyArithmeticTV
import Conjectures.PomeranceSarkozyAtomKernel
import Conjectures.PomeranceSarkozyAtomLaw
import Conjectures.PomeranceSarkozyAtomicEvent
import Conjectures.PomeranceSarkozyAtomicPush
import Conjectures.PomeranceSarkozyBernoulliCountEncoding
import Conjectures.PomeranceSarkozyBernoulliMatrix
import Conjectures.PomeranceSarkozyBonferroniKernel
import Conjectures.PomeranceSarkozyCoordinateLaws
import Conjectures.PomeranceSarkozyCountableProduct
import Conjectures.PomeranceSarkozyCountableVariation
import Conjectures.PomeranceSarkozyFactorialTail
import Conjectures.PomeranceSarkozyFiniteAtomic
import Conjectures.PomeranceSarkozyFiniteSieve
import Conjectures.PomeranceSarkozyFiniteTotalVariation
import Conjectures.PomeranceSarkozyFullFiniteComparison
import Conjectures.PomeranceSarkozyIncidenceProbabilities
import Conjectures.PomeranceSarkozyIndependentResidues
import Conjectures.PomeranceSarkozyJointCountComparison
import Conjectures.PomeranceSarkozyLiteralPrimeTuples
import Conjectures.PomeranceSarkozyManyProduct
import Conjectures.PomeranceSarkozyMatrixComparison
import Conjectures.PomeranceSarkozyMeasureEvent
import Conjectures.PomeranceSarkozyMeasurePush
import Conjectures.PomeranceSarkozyModelCountMass
import Conjectures.PomeranceSarkozyModelIncidence
import Conjectures.PomeranceSarkozyObservationLaws
import Conjectures.PomeranceSarkozyOffsets
import Conjectures.PomeranceSarkozyPoissonAtom
import Conjectures.PomeranceSarkozyPoissonColumns
import Conjectures.PomeranceSarkozyPoissonCountLaw
import Conjectures.PomeranceSarkozyPoissonSums
import Conjectures.PomeranceSarkozyPoissonTuple
import Conjectures.PomeranceSarkozyPrimeCRT
import Conjectures.PomeranceSarkozyPrimeCategorical
import Conjectures.PomeranceSarkozyPrimeObservation
import Conjectures.PomeranceSarkozyPrimeProduct
import Conjectures.PomeranceSarkozyProductVariation
import Conjectures.PomeranceSarkozyReciprocalTail
import Conjectures.PomeranceSarkozyResidueCountEncoding
import Conjectures.PomeranceSarkozyResidueWindow
import Conjectures.PomeranceSarkozySubsetPairs
import Conjectures.PomeranceSarkozySupportedPush
import Conjectures.PomeranceSarkozyTailProbability
import Conjectures.PomeranceSarkozyTruncationSums
import Conjectures.PomeranceSarkozyUniformPush
import Conjectures.PomeranceSarkozyWindowCombinatorics
import Conjectures.PomeranceSarkozyWindowCounts
import Lean.Util.CollectAxioms
import Lean.PrivateName
import Lean.Elab.Command
import Lean.Data.Json

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open Lean Elab Command in
run_cmd do
  let expectedModules : Array String := #["Conjectures.PomeranceSarkozyActualCountEvents", "Conjectures.PomeranceSarkozyActualCountLaw", "Conjectures.PomeranceSarkozyActualCountMeasure", "Conjectures.PomeranceSarkozyArithmeticTV", "Conjectures.PomeranceSarkozyAtomKernel", "Conjectures.PomeranceSarkozyAtomLaw", "Conjectures.PomeranceSarkozyAtomicEvent", "Conjectures.PomeranceSarkozyAtomicPush", "Conjectures.PomeranceSarkozyBernoulliCountEncoding", "Conjectures.PomeranceSarkozyBernoulliMatrix", "Conjectures.PomeranceSarkozyBonferroniKernel", "Conjectures.PomeranceSarkozyCoordinateLaws", "Conjectures.PomeranceSarkozyCountableProduct", "Conjectures.PomeranceSarkozyCountableVariation", "Conjectures.PomeranceSarkozyFactorialTail", "Conjectures.PomeranceSarkozyFiniteAtomic", "Conjectures.PomeranceSarkozyFiniteSieve", "Conjectures.PomeranceSarkozyFiniteTotalVariation", "Conjectures.PomeranceSarkozyFullFiniteComparison", "Conjectures.PomeranceSarkozyIncidenceProbabilities", "Conjectures.PomeranceSarkozyIndependentResidues", "Conjectures.PomeranceSarkozyJointCountComparison", "Conjectures.PomeranceSarkozyLiteralPrimeTuples", "Conjectures.PomeranceSarkozyManyProduct", "Conjectures.PomeranceSarkozyMatrixComparison", "Conjectures.PomeranceSarkozyMeasureEvent", "Conjectures.PomeranceSarkozyMeasurePush", "Conjectures.PomeranceSarkozyModelCountMass", "Conjectures.PomeranceSarkozyModelIncidence", "Conjectures.PomeranceSarkozyObservationLaws", "Conjectures.PomeranceSarkozyOffsets", "Conjectures.PomeranceSarkozyPoissonAtom", "Conjectures.PomeranceSarkozyPoissonColumns", "Conjectures.PomeranceSarkozyPoissonCountLaw", "Conjectures.PomeranceSarkozyPoissonSums", "Conjectures.PomeranceSarkozyPoissonTuple", "Conjectures.PomeranceSarkozyPrimeCRT", "Conjectures.PomeranceSarkozyPrimeCategorical", "Conjectures.PomeranceSarkozyPrimeObservation", "Conjectures.PomeranceSarkozyPrimeProduct", "Conjectures.PomeranceSarkozyProductVariation", "Conjectures.PomeranceSarkozyReciprocalTail", "Conjectures.PomeranceSarkozyResidueCountEncoding", "Conjectures.PomeranceSarkozyResidueWindow", "Conjectures.PomeranceSarkozySubsetPairs", "Conjectures.PomeranceSarkozySupportedPush", "Conjectures.PomeranceSarkozyTailProbability", "Conjectures.PomeranceSarkozyTruncationSums", "Conjectures.PomeranceSarkozyUniformPush", "Conjectures.PomeranceSarkozyWindowCombinatorics", "Conjectures.PomeranceSarkozyWindowCounts"]
  let required : Array Name := #[`PomeranceSarkozy.offsetCounts_arithmetic, `PomeranceSarkozy.arithmetic_residue_offset_counts_l1, `PomeranceSarkozy.residue_offset_count_eq_matrix, `PomeranceSarkozy.model_count_mass_eq_residue_tuple_push, `PomeranceSarkozy.bernoulli_count_push_eq_subset_encoding, `PomeranceSarkozy.arith_model_offset_atomic_le, `PomeranceSarkozy.model_bern_offset_atomic_le, `PomeranceSarkozy.bern_poisson_offset_atomic_le, `PomeranceSarkozy.arithmetic_poisson_offset_atomic_le, `PomeranceSarkozy.distribution_replacement_error_le, `PomeranceSarkozy.arithOffsetMass_eq_count_ratio, `PomeranceSarkozy.arithmeticOffsetCountMeasure_real_singleton, `PomeranceSarkozy.arithmetic_measure_poisson_count_l1, `PomeranceSarkozy.arithmeticOffsetCountMeasure_isProbabilityMeasure, `PomeranceSarkozy.arithmetic_poisson_event_error_le]
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
