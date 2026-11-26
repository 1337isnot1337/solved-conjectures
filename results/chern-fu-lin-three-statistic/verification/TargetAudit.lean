import Conjectures.BursteinA218225Defs
import Conjectures.BursteinA218225TreeX
import Conjectures.ChernFuLinThreeStatistic
import Conjectures.ChernFuLinThreeStatisticBands
import Conjectures.ChernFuLinThreeStatisticBoundary
import Conjectures.ChernFuLinThreeStatisticCopies
import Conjectures.ChernFuLinThreeStatisticCoreSums
import Conjectures.ChernFuLinThreeStatisticCrossing
import Conjectures.ChernFuLinThreeStatisticCutMass
import Conjectures.ChernFuLinThreeStatisticCutWeights
import Conjectures.ChernFuLinThreeStatisticDecode
import Conjectures.ChernFuLinThreeStatisticDecomposition
import Conjectures.ChernFuLinThreeStatisticDefs
import Conjectures.ChernFuLinThreeStatisticEdgeWeights
import Conjectures.ChernFuLinThreeStatisticEdges
import Conjectures.ChernFuLinThreeStatisticEnumerator
import Conjectures.ChernFuLinThreeStatisticExcess
import Conjectures.ChernFuLinThreeStatisticExpansion
import Conjectures.ChernFuLinThreeStatisticFactor
import Conjectures.ChernFuLinThreeStatisticFibre
import Conjectures.ChernFuLinThreeStatisticFlagMoment
import Conjectures.ChernFuLinThreeStatisticFlagTree
import Conjectures.ChernFuLinThreeStatisticFlagWord
import Conjectures.ChernFuLinThreeStatisticFlagsLiteral
import Conjectures.ChernFuLinThreeStatisticIDes
import Conjectures.ChernFuLinThreeStatisticKernel
import Conjectures.ChernFuLinThreeStatisticLiteralMoment
import Conjectures.ChernFuLinThreeStatisticMarked
import Conjectures.ChernFuLinThreeStatisticMass
import Conjectures.ChernFuLinThreeStatisticMinimum
import Conjectures.ChernFuLinThreeStatisticMoment
import Conjectures.ChernFuLinThreeStatisticProduct
import Conjectures.ChernFuLinThreeStatisticReduction
import Conjectures.ChernFuLinThreeStatisticRoot
import Conjectures.ChernFuLinThreeStatisticSplitStats
import Conjectures.ChernFuLinThreeStatisticSubword
import Conjectures.ChernFuLinThreeStatisticWeights
import Conjectures.ChernFuLinThreeStatisticWords
import Conjectures.ChernFuLinThreeStatisticXCut
import Conjectures.ChernFuLinThreeStatisticXMarkedTail
import Conjectures.ChernFuLinThreeStatisticXTail
import Conjectures.ChernFuLinThreeStatisticZTail
import Lean.Util.CollectAxioms
import Lean.PrivateName
import Lean.Elab.Command
import Lean.Data.Json

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open Lean Elab Command in
run_cmd do
  let expectedModules : Array String := #["Conjectures.BursteinA218225Defs", "Conjectures.BursteinA218225TreeX", "Conjectures.ChernFuLinThreeStatistic", "Conjectures.ChernFuLinThreeStatisticBands", "Conjectures.ChernFuLinThreeStatisticBoundary", "Conjectures.ChernFuLinThreeStatisticCopies", "Conjectures.ChernFuLinThreeStatisticCoreSums", "Conjectures.ChernFuLinThreeStatisticCrossing", "Conjectures.ChernFuLinThreeStatisticCutMass", "Conjectures.ChernFuLinThreeStatisticCutWeights", "Conjectures.ChernFuLinThreeStatisticDecode", "Conjectures.ChernFuLinThreeStatisticDecomposition", "Conjectures.ChernFuLinThreeStatisticDefs", "Conjectures.ChernFuLinThreeStatisticEdgeWeights", "Conjectures.ChernFuLinThreeStatisticEdges", "Conjectures.ChernFuLinThreeStatisticEnumerator", "Conjectures.ChernFuLinThreeStatisticExcess", "Conjectures.ChernFuLinThreeStatisticExpansion", "Conjectures.ChernFuLinThreeStatisticFactor", "Conjectures.ChernFuLinThreeStatisticFibre", "Conjectures.ChernFuLinThreeStatisticFlagMoment", "Conjectures.ChernFuLinThreeStatisticFlagTree", "Conjectures.ChernFuLinThreeStatisticFlagWord", "Conjectures.ChernFuLinThreeStatisticFlagsLiteral", "Conjectures.ChernFuLinThreeStatisticIDes", "Conjectures.ChernFuLinThreeStatisticKernel", "Conjectures.ChernFuLinThreeStatisticLiteralMoment", "Conjectures.ChernFuLinThreeStatisticMarked", "Conjectures.ChernFuLinThreeStatisticMass", "Conjectures.ChernFuLinThreeStatisticMinimum", "Conjectures.ChernFuLinThreeStatisticMoment", "Conjectures.ChernFuLinThreeStatisticProduct", "Conjectures.ChernFuLinThreeStatisticReduction", "Conjectures.ChernFuLinThreeStatisticRoot", "Conjectures.ChernFuLinThreeStatisticSplitStats", "Conjectures.ChernFuLinThreeStatisticSubword", "Conjectures.ChernFuLinThreeStatisticWeights", "Conjectures.ChernFuLinThreeStatisticWords", "Conjectures.ChernFuLinThreeStatisticXCut", "Conjectures.ChernFuLinThreeStatisticXMarkedTail", "Conjectures.ChernFuLinThreeStatisticXTail", "Conjectures.ChernFuLinThreeStatisticZTail"]
  let required : Array Name := #[`Conjectures.ChernFuLinThreeStatistic.equidistribution, `Conjectures.ChernFuLinThreeStatistic.Expansion.weighted_minimum_split, `Conjectures.ChernFuLinThreeStatistic.Expansion.Z_tail_identity, `Conjectures.ChernFuLinThreeStatistic.Growth.X_tail_identity]
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
