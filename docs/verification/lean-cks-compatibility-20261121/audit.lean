import Conjectures.ChenKhareSahi
import Conjectures.ChenKhareSahiBoundary
import Conjectures.ChenKhareSahiCone
import Conjectures.ChenKhareSahiCovers
import Conjectures.ChenKhareSahiEigen
import Conjectures.ChenKhareSahiGraded
import Conjectures.ChenKhareSahiHall
import Conjectures.ChenKhareSahiMixed
import Conjectures.ChenKhareSahiParameter
import Conjectures.ChenKhareSahiProducts
import Conjectures.ChenKhareSahiReal
import Conjectures.ChenKhareSahiSaturation
import Conjectures.ChenKhareSahiShiftUnique
import Conjectures.ChenKhareSahiTheorem
import Conjectures.ChenKhareSahiTranslate
import Conjectures.ChenKhareSahiUnique
import Lean.Util.CollectAxioms
import Lean.PrivateName
import Lean.Elab.Command
import Lean.Data.Json

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open Lean Elab Command in
run_cmd do
  let expectedModules : Array String := #["Conjectures.ChenKhareSahi", "Conjectures.ChenKhareSahiBoundary", "Conjectures.ChenKhareSahiCone", "Conjectures.ChenKhareSahiCovers", "Conjectures.ChenKhareSahiEigen", "Conjectures.ChenKhareSahiGraded", "Conjectures.ChenKhareSahiHall", "Conjectures.ChenKhareSahiMixed", "Conjectures.ChenKhareSahiParameter", "Conjectures.ChenKhareSahiProducts", "Conjectures.ChenKhareSahiReal", "Conjectures.ChenKhareSahiSaturation", "Conjectures.ChenKhareSahiShiftUnique", "Conjectures.ChenKhareSahiTheorem", "Conjectures.ChenKhareSahiTranslate", "Conjectures.ChenKhareSahiUnique"]
  let required : Array Name := #[`ChenKhareSahi.partitions_complete, `ChenKhareSahi.covers_exact, `ChenKhareSahi.dominance_decomposes, `ChenKhareSahi.shifted_support420, `ChenKhareSahi.shifted_support411, `ChenKhareSahi.shiftedEigen420_unique, `ChenKhareSahi.shiftedEigen411_unique, `ChenKhareSahi.shifted_source_counterexamples, `ChenKhareSahi.paramEigen420_unique, `ChenKhareSahi.paramEigen411_unique, `ChenKhareSahi.continuous_source_counterexamples, `ChenKhareSahi.paramP420_eigen, `ChenKhareSahi.paramP411_eigen, `ChenKhareSahi.param_nonmembership, `ChenKhareSahi.HL420_symmetrization, `ChenKhareSahi.HL411_symmetrization, `ChenKhareSahi.HL_nonmembership, `ChenKhareSahi.HL_continuous_transfer, `ChenKhareSahi.FullSemiring.saturated, `ChenKhareSahi.shifted_counterexamples, `ChenKhareSahi.shiftedP420_eigen, `ChenKhareSahi.shiftedP411_eigen, `ChenKhareSahi.FullSemiring.leading_factor, `ChenKhareSahi.FullSemiring.continuous, `ChenKhareSahi.realP_translate, `ChenKhareSahi.realD_translate, `ChenKhareSahi.translate_eigenfunction, `ChenKhareSahi.conjecture_counterexample, `ChenKhareSahi.FullSemiring.homogeneous_component, `ChenKhareSahi.FullSemiring.excludes_counterexample, `ChenKhareSahi.monicEigen420_unique, `ChenKhareSahi.monicEigen411_unique, `ChenKhareSahi.dominance_support_420, `ChenKhareSahi.dominance_support_411, `ChenKhareSahi.HomSemiring.degree_six_reduces, `ChenKhareSahi.HomSemiring.excludes_counterexample, `ChenKhareSahi.product_decomposition, `ChenKhareSahi.realCoeff_nonnegative, `ChenKhareSahi.ReducedCone.separator_nonnegative, `ChenKhareSahi.reduced_cone_excludes_counterexample, `ChenKhareSahi.realGeneratorValues_nonnegative, `ChenKhareSahi.real_separation_negative, `ChenKhareSahi.generatorValues_exact, `ChenKhareSahi.generatorValues_nonnegative, `ChenKhareSahi.separator_basis_values, `ChenKhareSahi.normalized_basis_values, `ChenKhareSahi.separation_negative, `ChenKhareSahi.P420_eigen, `ChenKhareSahi.P411_eigen]
  let legacyPrefixes : Array String := #["ChenKhareSahi."]
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
