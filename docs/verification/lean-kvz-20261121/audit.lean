module

import all Conjectures.KVZGamma
import all Conjectures.KVZGammaCompositionGamma
import all Conjectures.KVZGammaCompositionIntegral
import all Conjectures.KVZGammaCompositionSign
import all Conjectures.KVZGammaConvolution
import all Conjectures.KVZGammaConvolutionBeta
import all Conjectures.KVZGammaConvolutionWeights
import all Conjectures.KVZGammaDensity
import all Conjectures.KVZGammaDensityBasic
import all Conjectures.KVZGammaPower
import all Conjectures.KVZGammaPowerAlgebra
import all Conjectures.KVZGammaPowerDerivatives
import all Conjectures.KVZGammaWronskian
import all Conjectures.KVZGammaWronskianDeterminants
import all Conjectures.KVZGammaWronskianJets
import Lean.Util.CollectAxioms
import Lean.PrivateName
import Lean.Elab.Command
import Lean.Data.Json

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open Lean Elab Command in
run_cmd do
  let expectedImports : Array String := #["Conjectures.KVZGamma", "Conjectures.KVZGammaCompositionGamma", "Conjectures.KVZGammaCompositionIntegral", "Conjectures.KVZGammaCompositionSign", "Conjectures.KVZGammaConvolution", "Conjectures.KVZGammaConvolutionBeta", "Conjectures.KVZGammaConvolutionWeights", "Conjectures.KVZGammaDensity", "Conjectures.KVZGammaDensityBasic", "Conjectures.KVZGammaPower", "Conjectures.KVZGammaPowerAlgebra", "Conjectures.KVZGammaPowerDerivatives", "Conjectures.KVZGammaWronskian", "Conjectures.KVZGammaWronskianDeterminants", "Conjectures.KVZGammaWronskianJets"]
  let ownedModules : Array String := #["Conjectures.KVZGamma", "Conjectures.KVZGammaCompositionGamma", "Conjectures.KVZGammaCompositionIntegral", "Conjectures.KVZGammaCompositionSign", "Conjectures.KVZGammaConvolution", "Conjectures.KVZGammaConvolutionBeta", "Conjectures.KVZGammaConvolutionWeights", "Conjectures.KVZGammaDensity", "Conjectures.KVZGammaDensityBasic", "Conjectures.KVZGammaPower", "Conjectures.KVZGammaPowerAlgebra", "Conjectures.KVZGammaPowerDerivatives", "Conjectures.KVZGammaWronskian", "Conjectures.KVZGammaWronskianDeterminants", "Conjectures.KVZGammaWronskianJets"]
  let requiredByModule : Array (String × Array Name) := #[("Conjectures.KVZGamma", #[`KVZGamma.positive_translation, `KVZGamma.source_noninteger_all_orders, `KVZGamma.source_integer_strict, `KVZGamma.source_integer_rank_cutoff, `KVZGamma.source_sign_regularity, `KVZGamma.source_exact_signature, `KVZGamma.source_third_order_signature]), ("Conjectures.KVZGammaCompositionGamma", #[`KVZGamma.halfKernel_det_mul_signature_pos, `KVZGamma.gammaQuotient_det_mul_signature_pos, `KVZGamma.halfKernel_nat_det_eq_zero, `KVZGamma.gammaQuotient_nat_det_eq_zero]), ("Conjectures.KVZGammaCompositionIntegral", #[`KVZGamma.integral_prod_functionDet, `KVZGamma.integrable_functionDet_mul, `KVZGamma.integral_functionDet_mul]), ("Conjectures.KVZGammaCompositionSign", #[`KVZGamma.signed_det_product_nonneg, `KVZGamma.integral_composition_strict_sign, `KVZGamma.integral_composition_det_eq_zero]), ("Conjectures.KVZGammaConvolution", #[`KVZGamma.gamma_double_integral]), ("Conjectures.KVZGammaConvolutionBeta", #[`KVZGamma.scaled_beta_integral, `KVZGamma.gamma_density_convolution]), ("Conjectures.KVZGammaConvolutionWeights", #[`KVZGamma.gamma_moment_integrable, `KVZGamma.gamma_moment_integral, `KVZGamma.gamma_product_integrable, `KVZGamma.gamma_power_integrable, `KVZGamma.gamma_half_integrable]), ("Conjectures.KVZGammaDensity", #[`KVZGamma.exponential_wronskian_eq, `KVZGamma.exponential_det_pos, `KVZGamma.gammaDensity_det_factorization, `KVZGamma.gammaDensity_det_pos, `KVZGamma.gammaDensity_transpose_det_pos]), ("Conjectures.KVZGammaDensityBasic", #[`KVZGamma.gammaDensity_pos, `KVZGamma.gammaDensity_continuousOn, `KVZGamma.gammaDensity_eq_exp]), ("Conjectures.KVZGammaPower", #[`KVZGamma.powerKernel_det_mul_signature_pos, `KVZGamma.powerKernel_det_mul_signature_pos_of_not_nat, `KVZGamma.powerKernel_det_ne_zero_of_not_nat, `KVZGamma.powerKernel_nat_det_mul_sign_pos]), ("Conjectures.KVZGammaPowerAlgebra", #[`KVZGamma.powerSignature_eq, `KVZGamma.powerKernel_eq, `KVZGamma.falling_eq_prod, `KVZGamma.falling_nat_pos, `KVZGamma.falling_ne_zero, `KVZGamma.powerSignature_nat_mul_sign_pos, `KVZGamma.powerSignature_nat_eq_zero, `KVZGamma.powerSignature_three, `KVZGamma.power_nat_matrix_factorization, `KVZGamma.powerKernel_nat_det_eq_zero]), ("Conjectures.KVZGammaPowerDerivatives", #[`KVZGamma.iteratedDeriv_rpow_of_pos, `KVZGamma.iteratedDeriv_powerKernel, `KVZGamma.powerKernel_contDiffOn, `KVZGamma.power_wronskian_eq, `KVZGamma.power_wronskian_mul_signature_pos, `KVZGamma.power_initialWronskiansNonzero]), ("Conjectures.KVZGammaWronskian", #[`KVZGamma.evaluationDet_mul_wronskian_pos, `KVZGamma.evaluationDet_ne_zero, `KVZGamma.evaluationDet_sign_eq]), ("Conjectures.KVZGammaWronskianDeterminants", #[`KVZGamma.det_interval_differences_mvt, `KVZGamma.det_of_first_column_one, `KVZGamma.evaluationDet_normalize]), ("Conjectures.KVZGammaWronskianJets", #[`KVZGamma.jetMatrix_mul, `KVZGamma.wronskian_mul, `KVZGamma.wronskian_normalizedDerivatives])]
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
