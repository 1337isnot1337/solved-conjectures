import Conjectures.BraunBrueggeBicyclicCentralMass
import Conjectures.BraunBrueggeBicyclicCycleCount
import Conjectures.BraunBrueggeBicyclicCycleGeometry
import Conjectures.BraunBrueggeBicyclicCycleSteps
import Conjectures.BraunBrueggeBicyclicFiniteArithmetic
import Conjectures.BraunBrueggeBicyclicFiniteCorrect
import Conjectures.BraunBrueggeBicyclicFiniteRows
import Conjectures.BraunBrueggeBicyclicFiniteRows005To024
import Conjectures.BraunBrueggeBicyclicFiniteRows025To044
import Conjectures.BraunBrueggeBicyclicFiniteRows045To059
import Conjectures.BraunBrueggeBicyclicFiniteRows060To074
import Conjectures.BraunBrueggeBicyclicFiniteRows075To087
import Conjectures.BraunBrueggeBicyclicFiniteRows088To098
import Conjectures.BraunBrueggeBicyclicFiniteRows099To108
import Conjectures.BraunBrueggeBicyclicFiniteRows109To117
import Conjectures.BraunBrueggeBicyclicFiniteRows118To125
import Conjectures.BraunBrueggeBicyclicFiniteRows126To132
import Conjectures.BraunBrueggeBicyclicFiniteRows133To138
import Conjectures.BraunBrueggeBicyclicFiniteRows139To143
import Conjectures.BraunBrueggeBicyclicMixedBounds
import Conjectures.BraunBrueggeBicyclicMixedLarge
import Conjectures.BraunBrueggeBicyclicNormalizedCounts
import Conjectures.BraunBrueggeBicyclicPathWords
import Conjectures.BraunBrueggeBicyclicSameParity
import Conjectures.BraunBrueggeBicyclicSigns
import Conjectures.BraunBrueggeBicyclicThetaBound
import Conjectures.BraunBrueggeBicyclicThetaCount
import Conjectures.BraunBrueggeBicyclicThetaFibers
import Conjectures.BraunBrueggeBicyclicThetaGeometry
import Conjectures.BraunBrueggeBicyclicThetaGraph
import Conjectures.BraunBrueggeBicyclicThetaReindex
import Conjectures.BraunBrueggeBicyclicThetaSize
import Conjectures.BraunBrueggeBicyclicThetaSteps
import Conjectures.BraunBrueggeBicyclicUnitPath
import Conjectures.BraunBrueggeBicyclicWedge
import Conjectures.BraunBrueggeBicyclicWedgeAttainment
import Conjectures.BraunBrueggeBicyclicWedgeBenchmark
import Conjectures.BraunBrueggeBicyclicWedgeSize
import Conjectures.BraunBrueggeMinimum
import Conjectures.BraunBrueggeMinimumAlmostPerfectFaces
import Conjectures.BraunBrueggeMinimumAugmenting
import Conjectures.BraunBrueggeMinimumBipartite
import Conjectures.BraunBrueggeMinimumBipartiteComparison
import Conjectures.BraunBrueggeMinimumBipartiteFacets
import Conjectures.BraunBrueggeMinimumCompact
import Conjectures.BraunBrueggeMinimumCompleteBipartite
import Conjectures.BraunBrueggeMinimumCrossing
import Conjectures.BraunBrueggeMinimumFacets
import Conjectures.BraunBrueggeMinimumGeometry
import Conjectures.BraunBrueggeMinimumMatchingFaces
import Conjectures.BraunBrueggeMinimumMatchingModel
import Conjectures.BraunBrueggeMinimumNonbipartite
import Conjectures.BraunBrueggeMinimumPolar
import Conjectures.BraunBrueggeMinimumRecovery
import Conjectures.BraunBrueggeMinimumRecoveryCount
import Conjectures.BraunBrueggeMinimumUncoveredCount
import Conjectures.BraunBrueggeMinimumUncoveredFaces
import Lean.Util.CollectAxioms
import Lean.PrivateName
import Lean.Elab.Command
import Lean.Data.Json

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open Lean Elab Command in
run_cmd do
  let expectedModules : Array String := #["Conjectures.BraunBrueggeBicyclicCentralMass", "Conjectures.BraunBrueggeBicyclicCycleCount", "Conjectures.BraunBrueggeBicyclicCycleGeometry", "Conjectures.BraunBrueggeBicyclicCycleSteps", "Conjectures.BraunBrueggeBicyclicFiniteArithmetic", "Conjectures.BraunBrueggeBicyclicFiniteCorrect", "Conjectures.BraunBrueggeBicyclicFiniteRows", "Conjectures.BraunBrueggeBicyclicFiniteRows005To024", "Conjectures.BraunBrueggeBicyclicFiniteRows025To044", "Conjectures.BraunBrueggeBicyclicFiniteRows045To059", "Conjectures.BraunBrueggeBicyclicFiniteRows060To074", "Conjectures.BraunBrueggeBicyclicFiniteRows075To087", "Conjectures.BraunBrueggeBicyclicFiniteRows088To098", "Conjectures.BraunBrueggeBicyclicFiniteRows099To108", "Conjectures.BraunBrueggeBicyclicFiniteRows109To117", "Conjectures.BraunBrueggeBicyclicFiniteRows118To125", "Conjectures.BraunBrueggeBicyclicFiniteRows126To132", "Conjectures.BraunBrueggeBicyclicFiniteRows133To138", "Conjectures.BraunBrueggeBicyclicFiniteRows139To143", "Conjectures.BraunBrueggeBicyclicMixedBounds", "Conjectures.BraunBrueggeBicyclicMixedLarge", "Conjectures.BraunBrueggeBicyclicNormalizedCounts", "Conjectures.BraunBrueggeBicyclicPathWords", "Conjectures.BraunBrueggeBicyclicSameParity", "Conjectures.BraunBrueggeBicyclicSigns", "Conjectures.BraunBrueggeBicyclicThetaBound", "Conjectures.BraunBrueggeBicyclicThetaCount", "Conjectures.BraunBrueggeBicyclicThetaFibers", "Conjectures.BraunBrueggeBicyclicThetaGeometry", "Conjectures.BraunBrueggeBicyclicThetaGraph", "Conjectures.BraunBrueggeBicyclicThetaReindex", "Conjectures.BraunBrueggeBicyclicThetaSize", "Conjectures.BraunBrueggeBicyclicThetaSteps", "Conjectures.BraunBrueggeBicyclicUnitPath", "Conjectures.BraunBrueggeBicyclicWedge", "Conjectures.BraunBrueggeBicyclicWedgeAttainment", "Conjectures.BraunBrueggeBicyclicWedgeBenchmark", "Conjectures.BraunBrueggeBicyclicWedgeSize", "Conjectures.BraunBrueggeMinimum", "Conjectures.BraunBrueggeMinimumAlmostPerfectFaces", "Conjectures.BraunBrueggeMinimumAugmenting", "Conjectures.BraunBrueggeMinimumBipartite", "Conjectures.BraunBrueggeMinimumBipartiteComparison", "Conjectures.BraunBrueggeMinimumBipartiteFacets", "Conjectures.BraunBrueggeMinimumCompact", "Conjectures.BraunBrueggeMinimumCompleteBipartite", "Conjectures.BraunBrueggeMinimumCrossing", "Conjectures.BraunBrueggeMinimumFacets", "Conjectures.BraunBrueggeMinimumGeometry", "Conjectures.BraunBrueggeMinimumMatchingFaces", "Conjectures.BraunBrueggeMinimumMatchingModel", "Conjectures.BraunBrueggeMinimumNonbipartite", "Conjectures.BraunBrueggeMinimumPolar", "Conjectures.BraunBrueggeMinimumRecovery", "Conjectures.BraunBrueggeMinimumRecoveryCount", "Conjectures.BraunBrueggeMinimumUncoveredCount", "Conjectures.BraunBrueggeMinimumUncoveredFaces"]
  let required : Array Name := #[`BraunBruegge.theta_facet_card_mixed_parity, `BraunBruegge.computedSignProduct_eq, `BraunBruegge.computedMixedFacetCount_eq, `BraunBruegge.checkMixedAtTotal_sound, `BraunBruegge.mixedRows_checked, `BraunBruegge.mixed_theta_facets_le_wedge, `BraunBruegge.same_parity_theta_facets_lt_wedge, `BraunBruegge.thetaGraphPathReindex, `BraunBruegge.theta_facets_le_wedge, `BraunBruegge.theta_edge_card, `BraunBruegge.wedge_edge_card, `BraunBruegge.wedgeBenchmark_attained_all, `BraunBruegge.theta_diamond_facet_card]
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
