import Conjectures.BinaryAutomata
import Conjectures.FiniteCertificate
import Conjectures.Loneliness
import Conjectures.LonelinessContinuity
import Conjectures.LonelinessCriticalBase
import Conjectures.LonelinessFiveFamily
import Conjectures.LonelinessFiveSpeedBitIndexProposal
import Conjectures.LonelinessFiveSpeedBlockPackedScalar
import Conjectures.LonelinessFiveSpeedBlockPackedScalar1789B32
import Conjectures.LonelinessFiveSpeedGeometricMask
import Conjectures.LonelinessFiveSpeedMaskArithmetic
import Conjectures.LonelinessFiveSpeedMasks
import Conjectures.LonelinessFiveSpeedPackedScalar
import Conjectures.LonelinessFiveSpeedPackedScalar1789
import Conjectures.LonelinessFiveSpeedRootFoldedList
import Conjectures.LonelinessFiveSpeedRootMaskScan
import Conjectures.LonelinessFiveSpeedRootSemanticsDefs
import Conjectures.LonelinessFiveSpeedRootSemanticsForms
import Conjectures.LonelinessFiveSpeedRootStar
import Conjectures.LonelinessFiveSpeedRootStarBlocks
import Conjectures.LonelinessFiveSpeedRootStarCacheProbeData
import Conjectures.LonelinessFiveSpeedRootStarCachedBlocks
import Conjectures.LonelinessFiveSpeedRootStarQuickBlocks
import Conjectures.LonelinessFiveSpeedRootStarQuickLargeMiddleBlockPacked32Probe
import Conjectures.LonelinessFiveSpeedRootStarQuickLargeMiddlePackedProbe
import Conjectures.LonelinessFiveSpeedRootStarQuickLargeMiddleProbe
import Conjectures.LonelinessFiveSpeedRootStarQuickLargeOrdinaryBlockPacked32Probe
import Conjectures.LonelinessFiveSpeedRootStarQuickLargeOrdinaryPackedProbe
import Conjectures.LonelinessFiveSpeedRootStarQuickLargeOrdinaryProbe
import Conjectures.LonelinessFiveSpeedScalarInverse
import Conjectures.LonelinessFiveSpeedScalarTable
import Conjectures.LonelinessFiveSpeedScalarTree
import Conjectures.LonelinessFiveSpeedScalarTreeMask0179
import Conjectures.LonelinessFiveSpeedScalarTreeMask1789
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
  let expectedModules : Array String := #["Conjectures.BinaryAutomata", "Conjectures.FiniteCertificate", "Conjectures.Loneliness", "Conjectures.LonelinessContinuity", "Conjectures.LonelinessCriticalBase", "Conjectures.LonelinessFiveFamily", "Conjectures.LonelinessFiveSpeedBitIndexProposal", "Conjectures.LonelinessFiveSpeedBlockPackedScalar", "Conjectures.LonelinessFiveSpeedBlockPackedScalar1789B32", "Conjectures.LonelinessFiveSpeedGeometricMask", "Conjectures.LonelinessFiveSpeedMaskArithmetic", "Conjectures.LonelinessFiveSpeedMasks", "Conjectures.LonelinessFiveSpeedPackedScalar", "Conjectures.LonelinessFiveSpeedPackedScalar1789", "Conjectures.LonelinessFiveSpeedRootFoldedList", "Conjectures.LonelinessFiveSpeedRootMaskScan", "Conjectures.LonelinessFiveSpeedRootSemanticsDefs", "Conjectures.LonelinessFiveSpeedRootSemanticsForms", "Conjectures.LonelinessFiveSpeedRootStar", "Conjectures.LonelinessFiveSpeedRootStarBlocks", "Conjectures.LonelinessFiveSpeedRootStarCacheProbeData", "Conjectures.LonelinessFiveSpeedRootStarCachedBlocks", "Conjectures.LonelinessFiveSpeedRootStarQuickBlocks", "Conjectures.LonelinessFiveSpeedRootStarQuickLargeMiddleBlockPacked32Probe", "Conjectures.LonelinessFiveSpeedRootStarQuickLargeMiddlePackedProbe", "Conjectures.LonelinessFiveSpeedRootStarQuickLargeMiddleProbe", "Conjectures.LonelinessFiveSpeedRootStarQuickLargeOrdinaryBlockPacked32Probe", "Conjectures.LonelinessFiveSpeedRootStarQuickLargeOrdinaryPackedProbe", "Conjectures.LonelinessFiveSpeedRootStarQuickLargeOrdinaryProbe", "Conjectures.LonelinessFiveSpeedScalarInverse", "Conjectures.LonelinessFiveSpeedScalarTable", "Conjectures.LonelinessFiveSpeedScalarTree", "Conjectures.LonelinessFiveSpeedScalarTreeMask0179", "Conjectures.LonelinessFiveSpeedScalarTreeMask1789", "Conjectures.LonelinessModularNormalize", "Conjectures.LonelinessModularWitness", "Conjectures.LonelinessRational"]
  let required : Array Name := #[`Loneliness.FiveSpeedCertificate.blockPackedScalarTreeCheck_iff, `Loneliness.FiveSpeedCertificate.blockPackedScalarTreeCheck_lookup, `Loneliness.FiveSpeedCertificate.blockPackedScalarMask_eq_treeMask, `Loneliness.FiveSpeedCertificate.blockPackedScalarMask_eq_treeMask_function, `Loneliness.FiveSpeedCertificate.blockPackedScalarMask_eq_packedScalarMask, `Loneliness.FiveSpeedCertificate.blockPackedScalarTreeCheck_sound, `Loneliness.FiveSpeedCertificate.BlockPackedScalars.P1789B32.checked, `Loneliness.FiveSpeedCertificate.BlockPackedScalars.P1789B32.mask_eq_treeMask, `Loneliness.FiveSpeedCertificate.BlockPackedScalars.P1789B32.mask_eq_packed, `Loneliness.FiveSpeedCertificate.BlockPackedScalars.P1789B32.sound, `Loneliness.FiveSpeedCertificate.RootQuickProbes.LargeOrdinary.checked, `Loneliness.FiveSpeedCertificate.RootQuickProbes.LargeOrdinary.original_checked, `Loneliness.FiveSpeedCertificate.RootQuickProbes.LargeMiddle.checked, `Loneliness.FiveSpeedCertificate.RootQuickProbes.LargeMiddle.original_checked, `Loneliness.FiveSpeedCertificate.RootQuickProbes.LargeOrdinaryPacked.checked, `Loneliness.FiveSpeedCertificate.RootQuickProbes.LargeOrdinaryPacked.original_checked, `Loneliness.FiveSpeedCertificate.RootQuickProbes.LargeMiddlePacked.checked, `Loneliness.FiveSpeedCertificate.RootQuickProbes.LargeMiddlePacked.original_checked, `Loneliness.FiveSpeedCertificate.RootQuickProbes.LargeOrdinaryBlockPacked32.checked, `Loneliness.FiveSpeedCertificate.RootQuickProbes.LargeOrdinaryBlockPacked32.original_checked, `Loneliness.FiveSpeedCertificate.RootQuickProbes.LargeMiddleBlockPacked32.checked, `Loneliness.FiveSpeedCertificate.RootQuickProbes.LargeMiddleBlockPacked32.original_checked, `Loneliness.FiveSpeedCertificate.PackedScalars.P1789.checked, `Loneliness.FiveSpeedCertificate.PackedScalars.P1789.mask_eq_treeMask, `Loneliness.FiveSpeedCertificate.PackedScalars.P1789.sound]
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
