module

import all Conjectures.Chow
import all Conjectures.ChowBase
import all Conjectures.ChowCone
import all Conjectures.ChowInitial
import all Conjectures.ChowRefinement
import all Conjectures.ChowRootSigns
import all Conjectures.ChowRowProperties
import all Conjectures.ChowSignedPermutations
import all Conjectures.ChowSignedPermutationsBasic
import all Conjectures.ChowSignedPermutationsParity
import all Conjectures.ChowStrictInterlacing
import Lean.Util.CollectAxioms
import Lean.PrivateName
import Lean.Elab.Command
import Lean.Data.Json

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open Lean Elab Command in
run_cmd do
  let expectedImports : Array String := #["Conjectures.Chow", "Conjectures.ChowBase", "Conjectures.ChowCone", "Conjectures.ChowInitial", "Conjectures.ChowRefinement", "Conjectures.ChowRootSigns", "Conjectures.ChowRowProperties", "Conjectures.ChowSignedPermutations", "Conjectures.ChowSignedPermutationsBasic", "Conjectures.ChowSignedPermutationsParity", "Conjectures.ChowStrictInterlacing"]
  let ownedModules : Array String := #["Conjectures.Chow", "Conjectures.ChowBase", "Conjectures.ChowCone", "Conjectures.ChowInitial", "Conjectures.ChowRefinement", "Conjectures.ChowRootSigns", "Conjectures.ChowRowProperties", "Conjectures.ChowSignedPermutations", "Conjectures.ChowSignedPermutationsBasic", "Conjectures.ChowSignedPermutationsParity", "Conjectures.ChowStrictInterlacing"]
  let requiredByModule : Array (String × Array Name) := #[("Conjectures.Chow", #[`Chow.totalRow_strict_roots, `Chow.totalRow_interlacing, `Chow.totalRow_strict_interlacing, `Chow.typeD_consecutive_interlacing, `Chow.typeD_consecutive_strict_interlacing]), ("Conjectures.ChowBase", #[`Chow.refinedRow_two, `Chow.baseValue4_orderedCone, `Chow.refinedRow_orderedCone]), ("Conjectures.ChowCone", #[`Chow.cone_step_first_identity, `Chow.cone_step_second_identity, `Chow.cone_step, `Chow.orderedCone_cutValue]), ("Conjectures.ChowInitial", #[`Chow.rankThreeRoots_strictMono, `Chow.rankThreeRoots_neg, `Chow.totalRow_zero_explicit, `Chow.totalRow_one_explicit, `Chow.rankThreeRoots_product, `Chow.totalRow_one_roots, `Chow.totalRow_zero_roots, `Chow.initial_weak_interlacing]), ("Conjectures.ChowRefinement", #[`Chow.cutoff_monotone, `Chow.cutoff_le, `Chow.cutoff_surjective, `Chow.nextRow_first, `Chow.refinedRow_first]), ("Conjectures.ChowRootSigns", #[`Chow.cone_root_sign, `Chow.refinedRow_sign_at_total_root]), ("Conjectures.ChowRowProperties", #[`Chow.refinedRow_coeff_nonneg, `Chow.totalRow_natDegree, `Chow.totalRow_leadingCoeff_pos, `Chow.totalRow_eval_zero_pos, `Chow.refinedRow_no_common_zero]), ("Conjectures.ChowSignedPermutations", #[`Chow.desD_appendSigned, `Chow.literalRefinedRow_succ, `Chow.literalRefinedRow_zero, `Chow.literalRefinedRow_eq_refinedRow, `Chow.totalRow_eq_two_typeDEulerian]), ("Conjectures.ChowSignedPermutationsBasic", #[`Chow.entry_natAbs, `Chow.entry_natAbs_injective, `Chow.negativeCount_eq_window, `Chow.letterValue_lift_lt_iff, `Chow.letterValue_lift_sum_neg_iff, `Chow.appendSigned_bijective]), ("Conjectures.ChowSignedPermutationsParity", #[`Chow.flipFirst_involutive, `Chow.allSignedEulerian_eq_two_typeDEulerian]), ("Conjectures.ChowStrictInterlacing", #[`Chow.derivative_eval_ordered_product, `Chow.derivative_ne_zero_of_ordered_product, `Chow.strict_interlacing_extension])]
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
