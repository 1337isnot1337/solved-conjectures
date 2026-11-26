module

import all Conjectures.WachsCompleteGraphStrictLogConcavity
import all Conjectures.WachsMomentConvolution
import all Conjectures.WachsMomentFactorLogConcavity
import all Conjectures.WachsMomentLogConcavity
import Lean.Util.CollectAxioms
import Lean.PrivateName
import Lean.Elab.Command
import Lean.Data.Json

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open Lean Elab Command in
run_cmd do
  let expectedImports : Array String := #["Conjectures.WachsCompleteGraphActualEGF", "Conjectures.WachsCompleteGraphActualLaguerre", "Conjectures.WachsCompleteGraphBlockEquiv", "Conjectures.WachsCompleteGraphBlockGluing", "Conjectures.WachsCompleteGraphBlockIntervals", "Conjectures.WachsCompleteGraphBlockMoebius", "Conjectures.WachsCompleteGraphBlockOrder", "Conjectures.WachsCompleteGraphBlockRestriction", "Conjectures.WachsCompleteGraphCanonicalBlock", "Conjectures.WachsCompleteGraphCanonicalCut", "Conjectures.WachsCompleteGraphCanonicalUnit", "Conjectures.WachsCompleteGraphCharacteristic", "Conjectures.WachsCompleteGraphCoefficientFormula", "Conjectures.WachsCompleteGraphCoordinateCut", "Conjectures.WachsCompleteGraphCutCancellation", "Conjectures.WachsCompleteGraphDistinguishedBlock", "Conjectures.WachsCompleteGraphEGFComposition", "Conjectures.WachsCompleteGraphEGFTally", "Conjectures.WachsCompleteGraphExponentialFormula", "Conjectures.WachsCompleteGraphFibreProduct", "Conjectures.WachsCompleteGraphFibreWeights", "Conjectures.WachsCompleteGraphForcing", "Conjectures.WachsCompleteGraphGammaFactors", "Conjectures.WachsCompleteGraphGammaProduct", "Conjectures.WachsCompleteGraphHomogeneous", "Conjectures.WachsCompleteGraphIntervalMoebius", "Conjectures.WachsCompleteGraphLabelEmbedding", "Conjectures.WachsCompleteGraphLabelEquiv", "Conjectures.WachsCompleteGraphLaguerreNormalization", "Conjectures.WachsCompleteGraphMarkedCount", "Conjectures.WachsCompleteGraphMoebiusLaw", "Conjectures.WachsCompleteGraphMomentExpansion", "Conjectures.WachsCompleteGraphOrdinaryFibres", "Conjectures.WachsCompleteGraphPartitionCountRecurrence", "Conjectures.WachsCompleteGraphPartitionSum", "Conjectures.WachsCompleteGraphPartitionSupport", "Conjectures.WachsCompleteGraphProductCancellation", "Conjectures.WachsCompleteGraphRankTally", "Conjectures.WachsCompleteGraphSeededRecurrence", "Conjectures.WachsCompleteGraphSizeRecurrence", "Conjectures.WachsCompleteGraphStrictLogConcavity", "Conjectures.WachsCompleteGraphStrictRank", "Conjectures.WachsCompleteGraphTopCancellation", "Conjectures.WachsCompleteGraphTopCut", "Conjectures.WachsCompleteGraphTopExtensions", "Conjectures.WachsCompleteGraphTopScope", "Conjectures.WachsCompleteGraphVandermonde", "Conjectures.WachsCompleteGraphWeightCompletions", "Conjectures.WachsCompleteGraphWeightEquiv", "Conjectures.WachsCompleteGraphWeightRelabel", "Conjectures.WachsCompleteGraphWeightedOrder", "Conjectures.WachsCompleteGraphWeightedPartition", "Conjectures.WachsLagrangeDerivative", "Conjectures.WachsLagrangeInversion", "Conjectures.WachsLagrangeSubstitution", "Conjectures.WachsLagrangeWeight", "Conjectures.WachsLaguerreInterlaceAssemble", "Conjectures.WachsLaguerreInterlaceSigns", "Conjectures.WachsLaguerreMonic", "Conjectures.WachsLaguerrePositiveFactors", "Conjectures.WachsLaguerrePositiveRoots", "Conjectures.WachsLaguerreRecurrence", "Conjectures.WachsLaguerreSignIntervals", "Conjectures.WachsLaguerreSuccessorIntervals", "Conjectures.WachsMomentConvolution", "Conjectures.WachsMomentFactorLogConcavity", "Conjectures.WachsMomentLogConcavity"]
  let ownedModules : Array String := #["Conjectures.WachsCompleteGraphStrictLogConcavity", "Conjectures.WachsMomentConvolution", "Conjectures.WachsMomentFactorLogConcavity", "Conjectures.WachsMomentLogConcavity"]
  let requiredByModule : Array (String × Array Name) := #[("Conjectures.WachsCompleteGraphStrictLogConcavity", #[`WachsCompleteGraph.signedRankCoeff_eq_factorial, `WachsCompleteGraph.signedRankCoeff_positive, `WachsCompleteGraph.signedRankCoeff_strict_logConcave, `WachsCompleteGraph.weighted_complete_graph_positive_formal_moments]), ("Conjectures.WachsMomentConvolution", #[`WachsCompleteGraph.positive_logConcave_conv]), ("Conjectures.WachsMomentFactorLogConcavity", #[`WachsCompleteGraph.gammaSumSeries_positive_logConcave]), ("Conjectures.WachsMomentLogConcavity", #[`WachsCompleteGraph.finite_minor_expansion])]
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let env ← getEnv
  unless env.header.isModule do
    throwError "Owned-extension audit must use modern module mode"
  unless env.header.modules.size == env.header.moduleData.size do
    throwError "Imported module/data inventory size mismatch"
  let ownerOf := fun name => match env.getModuleIdxFor? name |>.bind (env.header.modules[·]?) with
    | some mod => mod.module.toString
    | none => ""
  let mut rawNames : NameSet := {}
  let mut seenImports : Array String := #[]
  let mut seenOwned : Array String := #[]
  for h : idx in [0:env.header.modules.size] do
    let mod := env.header.modules[idx]
    let moduleName := mod.module.toString
    let isProject := moduleName == "Solitaire" || moduleName.startsWith "Solitaire." ||
      moduleName == "Conjectures" || moduleName.startsWith "Conjectures."
    if isProject then
      unless expectedImports.contains moduleName do
        throwError "Unexpected project import: {moduleName}"
      seenImports := seenImports.push moduleName
      let record := Json.mkObj [
        ("tag", toJson "import"), ("module", toJson moduleName),
        ("owned", toJson (ownedModules.contains moduleName))]
      logInfo m!"OWNED-EXTENSION-JSON {record.compress}"
    if ownedModules.contains moduleName then
      unless mod.hasData && mod.importAll do
        throwError "Owned module lacks complete private data: {moduleName}"
      let data := env.header.moduleData[idx]!
      unless data.isModule do
        throwError "Owned-extension audit expects modern owned modules: {moduleName}"
      unless data.constNames == data.constants.map (·.name) do
        throwError "Serialized names differ from owned constants: {moduleName}"
      seenOwned := seenOwned.push moduleName
      let mut privateCount := 0
      for name in data.constNames do
        unless (env.find? name).isSome do
          throwError "Serialized owned declaration is invisible: {moduleName}: {name}"
        unless ownerOf name == moduleName do
          throwError "Serialized declaration has another owner: {moduleName}: {name}"
        if rawNames.contains name then
          throwError "Repeated serialized owned declaration: {name}"
        rawNames := rawNames.insert name
        if (privateToUserName? name).isSome then
          privateCount := privateCount + 1
      let record := Json.mkObj [
        ("tag", toJson "module"), ("module", toJson moduleName),
        ("modern", toJson data.isModule), ("import_all", toJson mod.importAll),
        ("has_data", toJson mod.hasData),
        ("names", toJson (data.constNames.map (·.toString))),
        ("private_count", toJson privateCount)]
      logInfo m!"OWNED-EXTENSION-JSON {record.compress}"
  unless seenImports.size == expectedImports.size &&
      expectedImports.all seenImports.contains do
    throwError "Incomplete exact imported project closure"
  unless seenOwned.size == ownedModules.size &&
      ownedModules.all seenOwned.contains do
    throwError "Incomplete owned module inventory"
  let mut audited : NameSet := {}
  let mut declarations := 0
  let mut theorems := 0
  let mut privateDeclarations := 0
  for (name, info) in env.constants.toList do
    let owner := ownerOf name
    let byModule := ownedModules.contains owner
    let bySerialized := rawNames.contains name
    if byModule || bySerialized then
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
          throwError "Unapproved owned axiom {name}"
      let axioms ← collectAxioms name
      for axiomName in axioms do
        unless allowed.contains axiomName do
          throwError "Unapproved axiom {axiomName} in {name}"
      let record := Json.mkObj [
        ("tag", toJson "declaration"), ("name", toJson name.toString),
        ("owner", toJson owner), ("kind", toJson kind),
        ("private_user_name", toJson (privateName.map (·.toString))),
        ("by_module", toJson byModule), ("by_serialized", toJson bySerialized),
        ("axioms", toJson (axioms.map (·.toString)))]
      logInfo m!"OWNED-EXTENSION-JSON {record.compress}"
  for name in rawNames.toArray do
    unless audited.contains name do
      throwError "Serialized owned declaration escaped the audit: {name}"
  let mut requiredCount := 0
  for (expectedOwner, names) in requiredByModule do
    for name in names do
      let info ← getConstInfo name
      unless info.isTheorem do
        throwError "Required endpoint is not a theorem: {name}"
      unless ownerOf name == expectedOwner && audited.contains name && rawNames.contains name do
        throwError "Required theorem has wrong ownership: {expectedOwner}: {name}"
      requiredCount := requiredCount + 1
      let record := Json.mkObj [
        ("tag", toJson "required"), ("name", toJson name.toString),
        ("owner", toJson expectedOwner)]
      logInfo m!"OWNED-EXTENSION-JSON {record.compress}"
  let record := Json.mkObj [
    ("tag", toJson "passed"), ("imported_modules", toJson seenImports.size),
    ("owned_modules", toJson seenOwned.size),
    ("declarations", toJson declarations), ("theorems", toJson theorems),
    ("private_declarations", toJson privateDeclarations),
    ("raw_declarations", toJson rawNames.toArray.size),
    ("required_theorems", toJson requiredCount),
    ("allowed_axioms", toJson (allowed.map (·.toString)))]
  logInfo m!"OWNED-EXTENSION-JSON {record.compress}"
