import Conjectures.LonelinessSixPlaneChunkSoundness
import Conjectures.LonelinessSixPlaneDataCoverage
import Conjectures.LonelinessSixPlaneDataCoverage00
import Conjectures.LonelinessSixPlaneDataCoverage01
import Conjectures.LonelinessSixPlaneDataCoverage02
import Conjectures.LonelinessSixPlaneDataCoverage03
import Conjectures.LonelinessSixPlaneDataCoverage04
import Conjectures.LonelinessSixPlaneDataCoverage05
import Conjectures.LonelinessSixPlaneDataCoverage06
import Conjectures.LonelinessSixPlaneDataCoverage07
import Conjectures.LonelinessSixPlaneDataCoverage08
import Conjectures.LonelinessSixPlaneDataCoverage09
import Conjectures.LonelinessSixPlaneDataCoverageSoundness
import Conjectures.LonelinessSixPlaneDataDefs
import Conjectures.LonelinessSixPlaneDataPilotEight
import Conjectures.LonelinessSixPlaneDataPilotForty
import Conjectures.LonelinessSixPlaneDataPilotSmall
import Conjectures.LonelinessSixPlaneDataTables
import Conjectures.LonelinessSixPlaneDefs
import Conjectures.LonelinessSixPlaneEnumeration
import Lean.Util.CollectAxioms
import Lean.PrivateName
import Lean.Elab.Command
import Lean.Data.Json

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open Lean Elab Command in
run_cmd do
  let expectedModules : Array String := #["Conjectures.LonelinessSixPlaneChunkSoundness", "Conjectures.LonelinessSixPlaneDataCoverage", "Conjectures.LonelinessSixPlaneDataCoverage00", "Conjectures.LonelinessSixPlaneDataCoverage01", "Conjectures.LonelinessSixPlaneDataCoverage02", "Conjectures.LonelinessSixPlaneDataCoverage03", "Conjectures.LonelinessSixPlaneDataCoverage04", "Conjectures.LonelinessSixPlaneDataCoverage05", "Conjectures.LonelinessSixPlaneDataCoverage06", "Conjectures.LonelinessSixPlaneDataCoverage07", "Conjectures.LonelinessSixPlaneDataCoverage08", "Conjectures.LonelinessSixPlaneDataCoverage09", "Conjectures.LonelinessSixPlaneDataCoverageSoundness", "Conjectures.LonelinessSixPlaneDataDefs", "Conjectures.LonelinessSixPlaneDataPilotEight", "Conjectures.LonelinessSixPlaneDataPilotForty", "Conjectures.LonelinessSixPlaneDataPilotSmall", "Conjectures.LonelinessSixPlaneDataTables", "Conjectures.LonelinessSixPlaneDefs", "Conjectures.LonelinessSixPlaneEnumeration"]
  let required : Array Name := #[`Loneliness.SixPlane.Data.pilotSmall, `Loneliness.SixPlane.Data.pilotEight, `Loneliness.SixPlane.Data.pilotForty, `Loneliness.SixPlane.Data.directions_complete, `Loneliness.SixPlane.Data.directionCoverageCheck_of_fixed_chunks, `Loneliness.SixPlane.Data.partialCheck_sound, `Loneliness.SixPlane.Data.enumeratedPairsChecked_of_partialChecks, `Loneliness.SixPlane.Data.enumeratedPairsChecked_of_fixed_chunks, `Loneliness.SixPlane.Data.candidatePairsChecked_of_fixed_chunks]
  let legacyPrefixes : Array String := #["Loneliness."]
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
