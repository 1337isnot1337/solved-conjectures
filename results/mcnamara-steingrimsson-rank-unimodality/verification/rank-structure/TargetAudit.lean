import Conjectures.McNamaraSteingrimssonBlockAssembly
import Conjectures.McNamaraSteingrimssonBlockCuts
import Conjectures.McNamaraSteingrimssonBlockEmbeddings
import Conjectures.McNamaraSteingrimssonBlockFibers
import Conjectures.McNamaraSteingrimssonBlockNormalize
import Conjectures.McNamaraSteingrimssonBlockOffsets
import Conjectures.McNamaraSteingrimssonBlockUncons
import Conjectures.McNamaraSteingrimssonCanonicalComponents
import Conjectures.McNamaraSteingrimssonCanonicalCuts
import Conjectures.McNamaraSteingrimssonContainment
import Conjectures.McNamaraSteingrimssonCuts
import Conjectures.McNamaraSteingrimssonDirectSum
import Conjectures.McNamaraSteingrimssonDistinct
import Conjectures.McNamaraSteingrimssonFamilyCounts
import Conjectures.McNamaraSteingrimssonFiberProduct
import Conjectures.McNamaraSteingrimssonFirstOmission
import Conjectures.McNamaraSteingrimssonIntrinsicOmission
import Conjectures.McNamaraSteingrimssonLaterOffsets
import Conjectures.McNamaraSteingrimssonLaterOmission
import Conjectures.McNamaraSteingrimssonLayerDownsetCount
import Conjectures.McNamaraSteingrimssonLayerEmbedding
import Conjectures.McNamaraSteingrimssonLayerFirstMax
import Conjectures.McNamaraSteingrimssonLayerRestriction
import Conjectures.McNamaraSteingrimssonMiddleBlockCoverage
import Conjectures.McNamaraSteingrimssonMiddleLayers
import Conjectures.McNamaraSteingrimssonNormalize
import Conjectures.McNamaraSteingrimssonOmittedBlock
import Conjectures.McNamaraSteingrimssonPatternSize
import Conjectures.McNamaraSteingrimssonPatternSplit
import Conjectures.McNamaraSteingrimssonPointed
import Conjectures.McNamaraSteingrimssonPointedCount
import Conjectures.McNamaraSteingrimssonPointedDownset
import Conjectures.McNamaraSteingrimssonPointedDownsetCount
import Conjectures.McNamaraSteingrimssonPointedInterval
import Conjectures.McNamaraSteingrimssonPolynomial
import Conjectures.McNamaraSteingrimssonPrefixFamilies
import Conjectures.McNamaraSteingrimssonRankStructure
import Conjectures.McNamaraSteingrimssonRepeatedActualFactors
import Conjectures.McNamaraSteingrimssonRepeatedPatternShape
import Conjectures.McNamaraSteingrimssonRepeatedRankWidths
import Conjectures.McNamaraSteingrimssonShortBlockPlacement
import Conjectures.McNamaraSteingrimssonShortFactor
import Conjectures.McNamaraSteingrimssonSplitSound
import Conjectures.McNamaraSteingrimssonSubwords
import Conjectures.McNamaraSteingrimssonSumAssembly
import Conjectures.McNamaraSteingrimssonSumAssoc
import Conjectures.McNamaraSteingrimssonTwoSummandInterval
import Conjectures.McNamaraSteingrimssonUnpoint
import Lean.Util.CollectAxioms
import Lean.PrivateName
import Lean.Elab.Command
import Lean.Data.Json

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open Lean Elab Command in
run_cmd do
  let expectedModules : Array String := #["Conjectures.McNamaraSteingrimssonBlockAssembly", "Conjectures.McNamaraSteingrimssonBlockCuts", "Conjectures.McNamaraSteingrimssonBlockEmbeddings", "Conjectures.McNamaraSteingrimssonBlockFibers", "Conjectures.McNamaraSteingrimssonBlockNormalize", "Conjectures.McNamaraSteingrimssonBlockOffsets", "Conjectures.McNamaraSteingrimssonBlockUncons", "Conjectures.McNamaraSteingrimssonCanonicalComponents", "Conjectures.McNamaraSteingrimssonCanonicalCuts", "Conjectures.McNamaraSteingrimssonContainment", "Conjectures.McNamaraSteingrimssonCuts", "Conjectures.McNamaraSteingrimssonDirectSum", "Conjectures.McNamaraSteingrimssonDistinct", "Conjectures.McNamaraSteingrimssonFamilyCounts", "Conjectures.McNamaraSteingrimssonFiberProduct", "Conjectures.McNamaraSteingrimssonFirstOmission", "Conjectures.McNamaraSteingrimssonIntrinsicOmission", "Conjectures.McNamaraSteingrimssonLaterOffsets", "Conjectures.McNamaraSteingrimssonLaterOmission", "Conjectures.McNamaraSteingrimssonLayerDownsetCount", "Conjectures.McNamaraSteingrimssonLayerEmbedding", "Conjectures.McNamaraSteingrimssonLayerFirstMax", "Conjectures.McNamaraSteingrimssonLayerRestriction", "Conjectures.McNamaraSteingrimssonMiddleBlockCoverage", "Conjectures.McNamaraSteingrimssonMiddleLayers", "Conjectures.McNamaraSteingrimssonNormalize", "Conjectures.McNamaraSteingrimssonOmittedBlock", "Conjectures.McNamaraSteingrimssonPatternSize", "Conjectures.McNamaraSteingrimssonPatternSplit", "Conjectures.McNamaraSteingrimssonPointed", "Conjectures.McNamaraSteingrimssonPointedCount", "Conjectures.McNamaraSteingrimssonPointedDownset", "Conjectures.McNamaraSteingrimssonPointedDownsetCount", "Conjectures.McNamaraSteingrimssonPointedInterval", "Conjectures.McNamaraSteingrimssonPolynomial", "Conjectures.McNamaraSteingrimssonPrefixFamilies", "Conjectures.McNamaraSteingrimssonRankStructure", "Conjectures.McNamaraSteingrimssonRepeatedActualFactors", "Conjectures.McNamaraSteingrimssonRepeatedPatternShape", "Conjectures.McNamaraSteingrimssonRepeatedRankWidths", "Conjectures.McNamaraSteingrimssonShortBlockPlacement", "Conjectures.McNamaraSteingrimssonShortFactor", "Conjectures.McNamaraSteingrimssonSplitSound", "Conjectures.McNamaraSteingrimssonSubwords", "Conjectures.McNamaraSteingrimssonSumAssembly", "Conjectures.McNamaraSteingrimssonSumAssoc", "Conjectures.McNamaraSteingrimssonTwoSummandInterval", "Conjectures.McNamaraSteingrimssonUnpoint"]
  let required : Array Name := #[`McNamaraSteingrimsson.repeatedMiddle_first_vs_later, `McNamaraSteingrimsson.later_omission_indices_unique, `McNamaraSteingrimsson.canonicalComponent_width_max, `McNamaraSteingrimsson.first_omission_no_component_at_short_width, `McNamaraSteingrimsson.earlier_aligned_slot_present, `McNamaraSteingrimsson.blockPermutation_at_offset, `McNamaraSteingrimsson.blockPermutation_uncons, `McNamaraSteingrimsson.blockPermutation_orders_injective, `McNamaraSteingrimsson.classicalPattern_of_block_matches, `McNamaraSteingrimsson.repeatedSource_short_in_initial_two, `McNamaraSteingrimsson.literalLayerDownset_count, `McNamaraSteingrimsson.literalPointedDownset_count_middle, `McNamaraSteingrimsson.directSumPermutation_assoc]
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
