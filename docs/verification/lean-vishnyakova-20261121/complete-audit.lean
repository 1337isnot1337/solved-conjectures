module

import all Conjectures.VishnyakovaBinomial
import all Conjectures.VishnyakovaDisk
import all Conjectures.VishnyakovaExtremal
import all Conjectures.VishnyakovaJacobi
import all Conjectures.VishnyakovaOriginal
import all Conjectures.VishnyakovaPolarization
import all Conjectures.VishnyakovaReflection
import all Conjectures.VishnyakovaRootRadius
import all Conjectures.VishnyakovaTotalPositivity
import all Conjectures.VishnyakovaTotalPositivityExtremal
import all Conjectures.VishnyakovaTotalPositivityMinors
import all Conjectures.VishnyakovaTotalPositivityRational
import all Conjectures.VishnyakovaTotalPositivityRatios
import all Conjectures.VishnyakovaTotalPositivityReciprocal
import all Conjectures.VishnyakovaTotalPositivityToeplitz
import all Conjectures.VishnyakovaTotalPositivityTransform
import all Conjectures.VishnyakovaTransform
import Lean.Util.CollectAxioms
import Lean.PrivateName
import Lean.Elab.Command
import Lean.Data.Json

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open Lean Elab Command in
run_cmd do
  let expectedImports : Array String := #["Conjectures.VishnyakovaBinomial", "Conjectures.VishnyakovaDisk", "Conjectures.VishnyakovaExtremal", "Conjectures.VishnyakovaJacobi", "Conjectures.VishnyakovaOriginal", "Conjectures.VishnyakovaPolarization", "Conjectures.VishnyakovaReflection", "Conjectures.VishnyakovaRootRadius", "Conjectures.VishnyakovaTotalPositivity", "Conjectures.VishnyakovaTotalPositivityExtremal", "Conjectures.VishnyakovaTotalPositivityMinors", "Conjectures.VishnyakovaTotalPositivityRational", "Conjectures.VishnyakovaTotalPositivityRatios", "Conjectures.VishnyakovaTotalPositivityReciprocal", "Conjectures.VishnyakovaTotalPositivityToeplitz", "Conjectures.VishnyakovaTotalPositivityTransform", "Conjectures.VishnyakovaTransform"]
  let ownedModules : Array String := #["Conjectures.VishnyakovaBinomial", "Conjectures.VishnyakovaDisk", "Conjectures.VishnyakovaExtremal", "Conjectures.VishnyakovaJacobi", "Conjectures.VishnyakovaOriginal", "Conjectures.VishnyakovaPolarization", "Conjectures.VishnyakovaReflection", "Conjectures.VishnyakovaRootRadius", "Conjectures.VishnyakovaTotalPositivity", "Conjectures.VishnyakovaTotalPositivityExtremal", "Conjectures.VishnyakovaTotalPositivityMinors", "Conjectures.VishnyakovaTotalPositivityRational", "Conjectures.VishnyakovaTotalPositivityRatios", "Conjectures.VishnyakovaTotalPositivityReciprocal", "Conjectures.VishnyakovaTotalPositivityToeplitz", "Conjectures.VishnyakovaTotalPositivityTransform", "Conjectures.VishnyakovaTransform"]
  let requiredByModule : Array (String × Array Name) := #[("Conjectures.VishnyakovaBinomial", #[`VishnyakovaRootRadius.binomial_three_term, `VishnyakovaRootRadius.coefficientPairing_product_ne_zero, `VishnyakovaRootRadius.risingProduct_one, `VishnyakovaRootRadius.sourceCoefficient_step, `VishnyakovaRootRadius.monicDiagonalValue_recurrence]), ("Conjectures.VishnyakovaDisk", #[`VishnyakovaRootRadius.source_diagonal_root_disk, `VishnyakovaRootRadius.source_root_disk, `VishnyakovaRootRadius.source_root_modulus]), ("Conjectures.VishnyakovaExtremal", #[`VishnyakovaRootRadius.weightedExtremal_complex_eval, `VishnyakovaRootRadius.unitExtremal_natDegree, `VishnyakovaRootRadius.unitExtremal_eval_nat, `VishnyakovaRootRadius.unitExtremal_root_neg]), ("Conjectures.VishnyakovaJacobi", #[`VishnyakovaRootRadius.jacobi_rayleigh_identity, `VishnyakovaRootRadius.jacobi_disk_bound]), ("Conjectures.VishnyakovaOriginal", #[`VishnyakovaRootRadius.SampledClass.weighted, `VishnyakovaRootRadius.original_root_disk, `VishnyakovaRootRadius.original_root_modulus, `VishnyakovaRootRadius.original_extremal_polynomial, `VishnyakovaRootRadius.original_radius_isGreatest, `VishnyakovaRootRadius.original_radius_sup]), ("Conjectures.VishnyakovaPolarization", #[`VishnyakovaRootRadius.ClosedUpperStable.polar_derivative, `VishnyakovaRootRadius.realPolarValue_ne_zero]), ("Conjectures.VishnyakovaReflection", #[`VishnyakovaRootRadius.source_reflection, `VishnyakovaRootRadius.source_real_root_interval, `VishnyakovaRootRadius.source_extremal_zero]), ("Conjectures.VishnyakovaRootRadius", #[`VishnyakovaRootRadius.reciprocal_segment, `VishnyakovaRootRadius.reciprocal_segment_sqrt, `VishnyakovaRootRadius.rayleigh_disk_bound]), ("Conjectures.VishnyakovaTotalPositivity", #[`VishnyakovaTotalPositivity.polynomial_numerator_roots_nonpositive, `VishnyakovaTotalPositivity.sampled_totallyNonneg_rootsInUnitInterval]), ("Conjectures.VishnyakovaTotalPositivityExtremal", #[`VishnyakovaTotalPositivity.cumulativeColumns_totallyNonneg, `VishnyakovaTotalPositivity.binomialToeplitz_totallyNonneg, `VishnyakovaTotalPositivity.unitExtremal_sampled_totallyNonneg]), ("Conjectures.VishnyakovaTotalPositivityMinors", #[`VishnyakovaTotalPositivity.ConsecutiveColumnMinorsNonneg.logConcave, `VishnyakovaTotalPositivity.ConsecutiveColumnMinorsNonneg.positive_or_finite_support, `VishnyakovaTotalPositivity.totallyNonneg_shift_of_initial_zeros, `VishnyakovaTotalPositivity.geometric_border_det, `VishnyakovaTotalPositivity.ConsecutiveColumnMinorsNonneg.removePole]), ("Conjectures.VishnyakovaTotalPositivityRational", #[`VishnyakovaTotalPositivity.rational_forward_recurrence, `VishnyakovaTotalPositivity.denominator_root_of_characteristic, `VishnyakovaTotalPositivity.rational_positive_poles]), ("Conjectures.VishnyakovaTotalPositivityRatios", #[`VishnyakovaTotalPositivity.ratio_antitone, `VishnyakovaTotalPositivity.shifted_ratio_limit, `VishnyakovaTotalPositivity.positive_ratio_limit_of_recurrence]), ("Conjectures.VishnyakovaTotalPositivityReciprocal", #[`VishnyakovaTotalPositivity.signedUnitExtension_det_nonneg, `VishnyakovaTotalPositivity.signed_inverse_suffix_minor_nonneg, `VishnyakovaTotalPositivity.signed_reciprocal_inverse, `VishnyakovaTotalPositivity.signed_reciprocal_constant_pos, `VishnyakovaTotalPositivity.signed_reciprocal_consecutiveMinors]), ("Conjectures.VishnyakovaTotalPositivityToeplitz", #[`VishnyakovaTotalPositivity.finiteToeplitz_totallyNonneg, `VishnyakovaTotalPositivity.finiteToeplitz_mul, `VishnyakovaTotalPositivity.finiteToeplitz_one, `VishnyakovaTotalPositivity.finiteToeplitz_det, `VishnyakovaTotalPositivity.finiteToeplitz_checkerboard]), ("Conjectures.VishnyakovaTotalPositivityTransform", #[`VishnyakovaTotalPositivity.source_numerator_series, `VishnyakovaTotalPositivity.sourceNumerator_eval_one, `VishnyakovaTotalPositivity.sourceNumerator_eval_mobius, `VishnyakovaTotalPositivity.rootsInUnitInterval_of_numerator]), ("Conjectures.VishnyakovaTransform", #[`VishnyakovaRootRadius.sourceTransform_normalizedFalling, `VishnyakovaRootRadius.sourceTransform_inverse_eval, `VishnyakovaRootRadius.sourceTransform_natDegree, `VishnyakovaRootRadius.weighted_root_disk, `VishnyakovaRootRadius.weighted_root_modulus, `VishnyakovaRootRadius.weighted_radius_isGreatest, `VishnyakovaRootRadius.weighted_radius_sup, `VishnyakovaRootRadius.unit_weight_radius_sup])]
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
