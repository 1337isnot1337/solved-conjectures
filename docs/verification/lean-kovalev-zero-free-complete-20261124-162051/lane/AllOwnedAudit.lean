import Conjectures.KovalevZeroFree
import Conjectures.KovalevZeroFreeAssembly
import Conjectures.KovalevZeroFreeBeta
import Conjectures.KovalevZeroFreeCoefficients
import Conjectures.KovalevZeroFreeComparison
import Conjectures.KovalevZeroFreeCorrection
import Conjectures.KovalevZeroFreeCoupling
import Conjectures.KovalevZeroFreeDerivative
import Conjectures.KovalevZeroFreeEuler
import Conjectures.KovalevZeroFreeFiniteAlgebra
import Conjectures.KovalevZeroFreeGeometry
import Conjectures.KovalevZeroFreeKernel
import Conjectures.KovalevZeroFreeMobius
import Conjectures.KovalevZeroFreeNormalization
import Conjectures.KovalevZeroFreeRemainder
import Conjectures.KovalevZeroFreeSectionIntegral
import Conjectures.KovalevZeroFreeTaylor
import Conjectures.KovalevZeroFreeTaylorAnalytic
import Conjectures.KovalevZeroFreeTaylorFinite
import Conjectures.KovalevZeroFreeTaylorSeries
import Conjectures.KovalevZeroFreeTransport
import Lean.Util.CollectAxioms
import Lean.PrivateName
import Lean.Elab.Command
import Lean.Data.Json

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open Lean Elab Command in
run_cmd do
  let expectedModules : Array String := #["Conjectures.KovalevZeroFree", "Conjectures.KovalevZeroFreeAssembly", "Conjectures.KovalevZeroFreeBeta", "Conjectures.KovalevZeroFreeCoefficients", "Conjectures.KovalevZeroFreeComparison", "Conjectures.KovalevZeroFreeCorrection", "Conjectures.KovalevZeroFreeCoupling", "Conjectures.KovalevZeroFreeDerivative", "Conjectures.KovalevZeroFreeEuler", "Conjectures.KovalevZeroFreeFiniteAlgebra", "Conjectures.KovalevZeroFreeGeometry", "Conjectures.KovalevZeroFreeKernel", "Conjectures.KovalevZeroFreeMobius", "Conjectures.KovalevZeroFreeNormalization", "Conjectures.KovalevZeroFreeRemainder", "Conjectures.KovalevZeroFreeSectionIntegral", "Conjectures.KovalevZeroFreeTaylor", "Conjectures.KovalevZeroFreeTaylorAnalytic", "Conjectures.KovalevZeroFreeTaylorFinite", "Conjectures.KovalevZeroFreeTaylorSeries", "Conjectures.KovalevZeroFreeTransport"]
  let required : Array Name := #[`Conjectures.KovalevZeroFree.halfCoeff_pos, `Conjectures.KovalevZeroFree.sum_correction, `Conjectures.KovalevZeroFree.sum_weighted_correction, `Conjectures.KovalevZeroFree.correction_budget_lt, `Conjectures.KovalevZeroFree.section_one_ne_zero, `Conjectures.KovalevZeroFree.sqrt_inDiameter, `Conjectures.KovalevZeroFree.inverse_sqrt_comparison, `Conjectures.KovalevZeroFree.inverse_sqrt_linear_comparison, `Conjectures.KovalevZeroFree.integral_beta_id, `Conjectures.KovalevZeroFree.integral_beta_one_sub, `Conjectures.KovalevZeroFree.remainder_norm_le_one, `Conjectures.KovalevZeroFree.remainder_norm_lt_one, `Conjectures.KovalevZeroFree.remainder_one, `Conjectures.KovalevZeroFree.lintegral_mobius_substitution, `Conjectures.KovalevZeroFree.lintegral_beta_euler, `Conjectures.KovalevZeroFree.lintegral_beta_joint_density, `Conjectures.KovalevZeroFree.map_oddsScale_beta, `Conjectures.KovalevZeroFree.integral_oddsScale_beta, `Conjectures.KovalevZeroFree.beta_resolvent_comparison, `Conjectures.KovalevZeroFree.remainder_comparison, `Conjectures.KovalevZeroFree.weighted_correction_norm_lt, `Conjectures.KovalevZeroFree.leadingPart_norm_lower, `Conjectures.KovalevZeroFree.correctionRemainder_norm_lt, `Conjectures.KovalevZeroFree.halfCoeff_beta_normalizer, `Conjectures.KovalevZeroFree.sqrt_mul_invSection_hasDerivAt, `Conjectures.KovalevZeroFree.invSection_remainder_identity, `Conjectures.KovalevZeroFree.formalCoeff_eq_iteratedDeriv, `Conjectures.KovalevZeroFree.sectionPolynomial_eq_taylor, `Conjectures.KovalevZeroFree.sectionPolynomial_ne_zero, `Conjectures.KovalevZeroFree.taylorSection_ne_zero, `Conjectures.KovalevZeroFree.kovalev_conjecture]
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
