import Conjectures.BinaryAutomata
import Conjectures.FiniteCertificate
import Conjectures.Loneliness
import Conjectures.LonelinessContinuity
import Conjectures.LonelinessCriticalBase
import Conjectures.LonelinessFiveFamily
import Conjectures.LonelinessFiveSpeedBitIndexProposal
import Conjectures.LonelinessFiveSpeedGeometricMask
import Conjectures.LonelinessFiveSpeedMaskArithmetic
import Conjectures.LonelinessFiveSpeedMasks
import Conjectures.LonelinessFiveSpeedPackedScalar
import Conjectures.LonelinessFiveSpeedPackedScalar199
import Conjectures.LonelinessFiveSpeedRootFoldedList
import Conjectures.LonelinessFiveSpeedRootMaskScan
import Conjectures.LonelinessFiveSpeedRootQuickBaseBlocks
import Conjectures.LonelinessFiveSpeedRootQuickChunkAssembly
import Conjectures.LonelinessFiveSpeedRootQuickDataP0199
import Conjectures.LonelinessFiveSpeedRootQuickP0199
import Conjectures.LonelinessFiveSpeedRootQuickP0199Part00
import Conjectures.LonelinessFiveSpeedRootQuickP0199Part01
import Conjectures.LonelinessFiveSpeedRootQuickP0199Part02
import Conjectures.LonelinessFiveSpeedRootQuickP0199Part03
import Conjectures.LonelinessFiveSpeedRootQuickP0199Part04
import Conjectures.LonelinessFiveSpeedRootQuickP0199Part05
import Conjectures.LonelinessFiveSpeedRootQuickP0199Part06
import Conjectures.LonelinessFiveSpeedRootQuickP0199Part07
import Conjectures.LonelinessFiveSpeedRootQuickP0199Part08
import Conjectures.LonelinessFiveSpeedRootQuickP0199Part09
import Conjectures.LonelinessFiveSpeedRootQuickP0199Part10
import Conjectures.LonelinessFiveSpeedRootQuickP0199Part11
import Conjectures.LonelinessFiveSpeedRootSemantics
import Conjectures.LonelinessFiveSpeedRootSemanticsDefs
import Conjectures.LonelinessFiveSpeedRootSemanticsForms
import Conjectures.LonelinessFiveSpeedRootSemanticsNormalize
import Conjectures.LonelinessFiveSpeedRootSemanticsTransport
import Conjectures.LonelinessFiveSpeedRootStar
import Conjectures.LonelinessFiveSpeedRootStarBlocks
import Conjectures.LonelinessFiveSpeedRootStarCachedBlocks
import Conjectures.LonelinessFiveSpeedRootStarQuickBlocks
import Conjectures.LonelinessFiveSpeedScalarInverse
import Conjectures.LonelinessFiveSpeedScalarTable
import Conjectures.LonelinessFiveSpeedScalarTree
import Conjectures.LonelinessFiveSpeedScalarTreeMask0199
import Conjectures.LonelinessModularNormalize
import Conjectures.LonelinessModularWitness
import Conjectures.LonelinessRational
import Lean.Util.CollectAxioms
import Lean.PrivateName
import Lean.Elab.Command
import Lean.Data.Json

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open Lean Elab Command in
run_cmd do
  let expectedModules : Array String := #["Conjectures.BinaryAutomata", "Conjectures.FiniteCertificate", "Conjectures.Loneliness", "Conjectures.LonelinessContinuity", "Conjectures.LonelinessCriticalBase", "Conjectures.LonelinessFiveFamily", "Conjectures.LonelinessFiveSpeedBitIndexProposal", "Conjectures.LonelinessFiveSpeedGeometricMask", "Conjectures.LonelinessFiveSpeedMaskArithmetic", "Conjectures.LonelinessFiveSpeedMasks", "Conjectures.LonelinessFiveSpeedPackedScalar", "Conjectures.LonelinessFiveSpeedPackedScalar199", "Conjectures.LonelinessFiveSpeedRootFoldedList", "Conjectures.LonelinessFiveSpeedRootMaskScan", "Conjectures.LonelinessFiveSpeedRootQuickBaseBlocks", "Conjectures.LonelinessFiveSpeedRootQuickChunkAssembly", "Conjectures.LonelinessFiveSpeedRootQuickDataP0199", "Conjectures.LonelinessFiveSpeedRootQuickP0199", "Conjectures.LonelinessFiveSpeedRootQuickP0199Part00", "Conjectures.LonelinessFiveSpeedRootQuickP0199Part01", "Conjectures.LonelinessFiveSpeedRootQuickP0199Part02", "Conjectures.LonelinessFiveSpeedRootQuickP0199Part03", "Conjectures.LonelinessFiveSpeedRootQuickP0199Part04", "Conjectures.LonelinessFiveSpeedRootQuickP0199Part05", "Conjectures.LonelinessFiveSpeedRootQuickP0199Part06", "Conjectures.LonelinessFiveSpeedRootQuickP0199Part07", "Conjectures.LonelinessFiveSpeedRootQuickP0199Part08", "Conjectures.LonelinessFiveSpeedRootQuickP0199Part09", "Conjectures.LonelinessFiveSpeedRootQuickP0199Part10", "Conjectures.LonelinessFiveSpeedRootQuickP0199Part11", "Conjectures.LonelinessFiveSpeedRootSemantics", "Conjectures.LonelinessFiveSpeedRootSemanticsDefs", "Conjectures.LonelinessFiveSpeedRootSemanticsForms", "Conjectures.LonelinessFiveSpeedRootSemanticsNormalize", "Conjectures.LonelinessFiveSpeedRootSemanticsTransport", "Conjectures.LonelinessFiveSpeedRootStar", "Conjectures.LonelinessFiveSpeedRootStarBlocks", "Conjectures.LonelinessFiveSpeedRootStarCachedBlocks", "Conjectures.LonelinessFiveSpeedRootStarQuickBlocks", "Conjectures.LonelinessFiveSpeedScalarInverse", "Conjectures.LonelinessFiveSpeedScalarTable", "Conjectures.LonelinessFiveSpeedScalarTree", "Conjectures.LonelinessFiveSpeedScalarTreeMask0199", "Conjectures.LonelinessModularNormalize", "Conjectures.LonelinessModularWitness", "Conjectures.LonelinessRational"]
  let required : Array Name := #[`Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.Data.values_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.Data.eligible_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0002.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0003.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0004.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0005.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0006.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0007.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0008.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0009.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0010.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0011.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0012.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0013.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0014.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0015.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0016.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0017.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0019.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0023.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0024.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0027.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0028.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0029.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0030.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0031.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0032.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0034.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0035.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0036.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0037.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0038.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0039.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0042.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0044.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0045.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0047.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0049.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0052.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0054.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0055.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0060.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0061.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0067.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0068.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0074.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.B0080.base_checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.checked, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.normalized, `Loneliness.FiveSpeedCertificate.RootQuickCertificates.P199.sound, `Loneliness.FiveSpeedCertificate.PackedScalars.P199.checked, `Loneliness.FiveSpeedCertificate.PackedScalars.P199.mask_eq_treeMask, `Loneliness.FiveSpeedCertificate.PackedScalars.P199.sound]
  let legacyPrefixes : Array String := #["Loneliness.", "FiniteCertificate.", "BinaryAutomata."]
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
