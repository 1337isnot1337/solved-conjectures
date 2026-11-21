module

import all Conjectures.Grochenig
import all Conjectures.GrochenigBlocks
import all Conjectures.GrochenigBlocksAlgebra
import all Conjectures.GrochenigDensity
import all Conjectures.GrochenigDensityDefinitions
import all Conjectures.GrochenigDensityLocalFiniteness
import all Conjectures.GrochenigGaussian
import all Conjectures.GrochenigGaussianBasic
import all Conjectures.GrochenigSeparation
import all Conjectures.GrochenigSeries
import all Conjectures.GrochenigSeriesAnalytic
import all Conjectures.GrochenigSeriesCoefficients
import all Conjectures.GrochenigSignPreservation
import all Conjectures.GrochenigWitness
import all Conjectures.KVZGammaDensity
import all Conjectures.KVZGammaDensityBasic
import all Conjectures.KVZGammaPowerAlgebra
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
  let expectedImports : Array String := #["Conjectures.Grochenig", "Conjectures.GrochenigBlocks", "Conjectures.GrochenigBlocksAlgebra", "Conjectures.GrochenigDensity", "Conjectures.GrochenigDensityDefinitions", "Conjectures.GrochenigDensityLocalFiniteness", "Conjectures.GrochenigGaussian", "Conjectures.GrochenigGaussianBasic", "Conjectures.GrochenigSeparation", "Conjectures.GrochenigSeries", "Conjectures.GrochenigSeriesAnalytic", "Conjectures.GrochenigSeriesCoefficients", "Conjectures.GrochenigSignPreservation", "Conjectures.GrochenigWitness", "Conjectures.KVZGammaDensity", "Conjectures.KVZGammaDensityBasic", "Conjectures.KVZGammaPowerAlgebra", "Conjectures.KVZGammaWronskian", "Conjectures.KVZGammaWronskianDeterminants", "Conjectures.KVZGammaWronskianJets"]
  let ownedModules : Array String := #["Conjectures.Grochenig", "Conjectures.GrochenigBlocks", "Conjectures.GrochenigBlocksAlgebra", "Conjectures.GrochenigDensity", "Conjectures.GrochenigDensityDefinitions", "Conjectures.GrochenigDensityLocalFiniteness", "Conjectures.GrochenigGaussian", "Conjectures.GrochenigGaussianBasic", "Conjectures.GrochenigSeparation", "Conjectures.GrochenigSeries", "Conjectures.GrochenigSeriesAnalytic", "Conjectures.GrochenigSeriesCoefficients", "Conjectures.GrochenigSignPreservation", "Conjectures.GrochenigWitness", "Conjectures.KVZGammaDensity", "Conjectures.KVZGammaDensityBasic", "Conjectures.KVZGammaPowerAlgebra", "Conjectures.KVZGammaWronskian", "Conjectures.KVZGammaWronskianDeterminants", "Conjectures.KVZGammaWronskianJets"]
  let requiredByModule : Array (String × Array Name) := #[("Conjectures.Grochenig", #[`Grochenig.constructed_zeros_locallyFinite, `Grochenig.constructed_density_violation, `Grochenig.upper_density_counterexample, `Grochenig.source_upper_density_disproof]), ("Conjectures.GrochenigBlocks", #[`Grochenig.blockPolynomial_eq, `Grochenig.rawBlockCoeff_eq, `Grochenig.blockMass_eq, `Grochenig.blockCoeff_eq, `Grochenig.block_eq, `Grochenig.testPoint_eq, `Grochenig.blockMargin_eq, `Grochenig.blockPolynomial_natDegree, `Grochenig.blockPolynomial_coeff_signed_pos, `Grochenig.rawBlockCoeff_signed_pos, `Grochenig.blockMass_pos, `Grochenig.blockCoeff_signed_pos, `Grochenig.blockCoeff_ne_zero, `Grochenig.blockCoeff_mul_succ_neg, `Grochenig.blockCoeff_eq_zero_of_lt, `Grochenig.sum_abs_blockCoeff, `Grochenig.weighted_gaussian_translate, `Grochenig.block_factorization, `Grochenig.blockPolynomial_test_signed_pos, `Grochenig.block_test_signed_pos, `Grochenig.block_test_ne_zero, `Grochenig.block_test_mul_succ_neg, `Grochenig.blockMargin_pos, `Grochenig.blockMargin_le_test, `Grochenig.block_bound, `Grochenig.block_continuous, `Grochenig.block_tendsto_atTop, `Grochenig.block_tendsto_atBot]), ("Conjectures.GrochenigBlocksAlgebra", #[`Grochenig.coeff_prod_X_sub_C_signed_pos, `Grochenig.signed_product_range_pos, `Grochenig.adjacent_mul_neg_of_signed_pos]), ("Conjectures.GrochenigDensity", #[`Grochenig.coefficientSignChanges_nonzero, `Grochenig.mem_coefficientSignChanges_of_step_two, `Grochenig.card_le_intervalCount, `Grochenig.card_le_intIntervalCount, `Grochenig.intIntervalCount_le_of_even, `Grochenig.upperIntegerDensity_le_half_of_even, `Grochenig.upperCoefficientDensity_le_half, `Grochenig.half_le_upperCoefficientDensity, `Grochenig.one_le_upperBeurlingDensity_of_windows]), ("Conjectures.GrochenigDensityDefinitions", #[`Grochenig.mem_coefficientSignChanges, `Grochenig.intervalCount_eq, `Grochenig.intIntervalCount_eq, `Grochenig.upperBeurlingDensity_eq, `Grochenig.upperIntegerDensity_eq, `Grochenig.upperCoefficientDensity_eq, `Grochenig.mem_zeroSet, `Grochenig.locallyFiniteSet_iff, `Grochenig.isBoundedShiftSum_iff, `Grochenig.inVInfinity_iff]), ("Conjectures.GrochenigDensityLocalFiniteness", #[`Grochenig.zeroSet_locallyFinite_of_entire]), ("Conjectures.GrochenigGaussian", #[`Grochenig.isPolyaFrequency_iff, `Grochenig.gaussian_difference_factorization, `Grochenig.gaussian_det_factorization, `Grochenig.gaussian_det_pos, `Grochenig.gaussian_isPolyaFrequency]), ("Conjectures.GrochenigGaussianBasic", #[`Grochenig.gaussian_eq, `Grochenig.gaussianComplex_eq, `Grochenig.gaussian_pos, `Grochenig.gaussian_le_one, `Grochenig.gaussian_neg, `Grochenig.abs_gaussian, `Grochenig.gaussian_continuous, `Grochenig.gaussian_tendsto_atTop, `Grochenig.gaussian_tendsto_atBot, `Grochenig.gaussian_integrable, `Grochenig.gaussianComplex_ofReal, `Grochenig.differentiable_gaussianComplex, `Grochenig.norm_gaussianComplex, `Grochenig.norm_gaussianComplex_sub_int_le]), ("Conjectures.GrochenigSeparation", #[`Grochenig.center_zero, `Grochenig.center_even, `Grochenig.center_separated, `Grochenig.earlier_blocks_small, `Grochenig.later_block_small, `Grochenig.slotPosition_injective]), ("Conjectures.GrochenigSeries", #[`Grochenig.seriesValue_eq, `Grochenig.entireValue_eq, `Grochenig.seriesValue_hasSum, `Grochenig.entireValue_hasSum, `Grochenig.block_eq_slot_sum, `Grochenig.grouped_blocks_hasSum, `Grochenig.grouped_blocks_summable, `Grochenig.seriesValue_eq_grouped_blocks, `Grochenig.seriesValue_eq_prefix_add_block_add_tail, `Grochenig.seriesValue_abs_le_one, `Grochenig.continuous_seriesValue, `Grochenig.differentiable_entireValue, `Grochenig.entireValue_ofReal, `Grochenig.isBoundedShiftSum_seriesValue, `Grochenig.inVInfinity_seriesValue]), ("Conjectures.GrochenigSeriesAnalytic", #[`Grochenig.gaussian_shift_summable, `Grochenig.gaussian_shift_tsum_bound, `Grochenig.gaussian_complex_shift_summable, `Grochenig.differentiable_gaussian_shift_tsum, `Grochenig.gaussian_shift_tsum_ofReal, `Grochenig.continuous_gaussian_shift_tsum]), ("Conjectures.GrochenigSeriesCoefficients", #[`Grochenig.slotPosition_eq, `Grochenig.coefficient_eq, `Grochenig.coefficient_at_slot, `Grochenig.coefficient_off_range, `Grochenig.coefficient_even_support, `Grochenig.geometric_block_mass_hasSum, `Grochenig.sigma_block_abs_hasSum, `Grochenig.hasSum_abs_coefficient, `Grochenig.coefficient_abs_summable, `Grochenig.sum_abs_coefficient, `Grochenig.coefficient_summable, `Grochenig.abs_coefficient_le_one, `Grochenig.coefficient_bounded]), ("Conjectures.GrochenigSignPreservation", #[`Grochenig.later_series_bound, `Grochenig.series_error_lt, `Grochenig.mul_pos_of_abs_sub_lt, `Grochenig.exists_zero_between, `Grochenig.ordered_zero_witnesses]), ("Conjectures.GrochenigWitness", #[`Grochenig.constructed_slot_injective, `Grochenig.constructed_test_error, `Grochenig.constructed_test_same_sign, `Grochenig.constructed_test_adjacent_neg, `Grochenig.constructed_nonzero, `Grochenig.constructed_zero_window, `Grochenig.constructed_zero_density, `Grochenig.coefficient_center_slot, `Grochenig.coefficient_center_odd_zero, `Grochenig.coefficient_slot_sign_change, `Grochenig.constructed_coefficient_density]), ("Conjectures.KVZGammaDensity", #[`KVZGamma.exponential_wronskian_eq, `KVZGamma.exponential_det_pos, `KVZGamma.gammaDensity_det_factorization, `KVZGamma.gammaDensity_det_pos, `KVZGamma.gammaDensity_transpose_det_pos]), ("Conjectures.KVZGammaDensityBasic", #[`KVZGamma.gammaDensity_pos, `KVZGamma.gammaDensity_continuousOn, `KVZGamma.gammaDensity_eq_exp]), ("Conjectures.KVZGammaPowerAlgebra", #[`KVZGamma.powerSignature_eq, `KVZGamma.powerKernel_eq, `KVZGamma.falling_eq_prod, `KVZGamma.falling_nat_pos, `KVZGamma.falling_ne_zero, `KVZGamma.powerSignature_nat_mul_sign_pos, `KVZGamma.powerSignature_nat_eq_zero, `KVZGamma.powerSignature_three, `KVZGamma.power_nat_matrix_factorization, `KVZGamma.powerKernel_nat_det_eq_zero]), ("Conjectures.KVZGammaWronskian", #[`KVZGamma.evaluationDet_mul_wronskian_pos, `KVZGamma.evaluationDet_ne_zero, `KVZGamma.evaluationDet_sign_eq]), ("Conjectures.KVZGammaWronskianDeterminants", #[`KVZGamma.det_interval_differences_mvt, `KVZGamma.det_of_first_column_one, `KVZGamma.evaluationDet_normalize]), ("Conjectures.KVZGammaWronskianJets", #[`KVZGamma.jetMatrix_mul, `KVZGamma.wronskian_mul, `KVZGamma.wronskian_normalizedDerivatives])]
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
