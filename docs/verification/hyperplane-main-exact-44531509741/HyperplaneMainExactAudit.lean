import Conjectures.Loneliness
import Conjectures.LonelinessConsecutive
import Conjectures.LonelinessContinuity
import Conjectures.LonelinessCriticalBase
import Conjectures.LonelinessFiveFamily
import Conjectures.LonelinessHyperplane
import Conjectures.LonelinessHyperplaneAdmissibility
import Conjectures.LonelinessHyperplaneApproximation
import Conjectures.LonelinessHyperplaneArithmetic
import Conjectures.LonelinessHyperplaneBasic
import Conjectures.LonelinessHyperplaneBoundary
import Conjectures.LonelinessHyperplaneBoundedPartitions
import Conjectures.LonelinessHyperplaneBoxQuasipolynomial
import Conjectures.LonelinessHyperplaneCollisionPartitions
import Conjectures.LonelinessHyperplaneCoordinateCompression
import Conjectures.LonelinessHyperplaneCounting
import Conjectures.LonelinessHyperplaneDenominator
import Conjectures.LonelinessHyperplaneDenominatorQuasipolynomial
import Conjectures.LonelinessHyperplaneEndpointArithmetic
import Conjectures.LonelinessHyperplaneEndpointDensity
import Conjectures.LonelinessHyperplaneEndpointGeometry
import Conjectures.LonelinessHyperplaneExceptionalQuasipolynomial
import Conjectures.LonelinessHyperplaneFiniteExceptions
import Conjectures.LonelinessHyperplaneFixedShift
import Conjectures.LonelinessHyperplaneFourier
import Conjectures.LonelinessHyperplaneFourierAverage
import Conjectures.LonelinessHyperplaneFourierDensity
import Conjectures.LonelinessHyperplaneFourierKernel
import Conjectures.LonelinessHyperplaneFundamentalRemainder
import Conjectures.LonelinessHyperplaneFundamentalRemainderCounting
import Conjectures.LonelinessHyperplaneGenericCost
import Conjectures.LonelinessHyperplaneHaar
import Conjectures.LonelinessHyperplaneHaarValue
import Conjectures.LonelinessHyperplaneHitDensity
import Conjectures.LonelinessHyperplaneHomogeneousBox
import Conjectures.LonelinessHyperplaneInjectiveBoxCounting
import Conjectures.LonelinessHyperplaneLattice
import Conjectures.LonelinessHyperplaneMain
import Conjectures.LonelinessHyperplaneMaximizers
import Conjectures.LonelinessHyperplaneOneRelation
import Conjectures.LonelinessHyperplaneOptimalSupports
import Conjectures.LonelinessHyperplaneProbability
import Conjectures.LonelinessHyperplaneQuasipolynomialArithmetic
import Conjectures.LonelinessHyperplaneQuasipolynomialClosure
import Conjectures.LonelinessHyperplaneQuasipolynomialDegree
import Conjectures.LonelinessHyperplaneRateSharpness
import Conjectures.LonelinessHyperplaneRationalConeFan
import Conjectures.LonelinessHyperplaneRationalConeOptimalExistence
import Conjectures.LonelinessHyperplaneResidueDensity
import Conjectures.LonelinessHyperplaneResidueKernel
import Conjectures.LonelinessHyperplaneResiduePartition
import Conjectures.LonelinessHyperplaneResidueTranslation
import Conjectures.LonelinessHyperplaneScaledResidues
import Conjectures.LonelinessHyperplaneShiftLaw
import Conjectures.LonelinessHyperplaneSignedBoxCounting
import Conjectures.LonelinessHyperplaneSimplicialArithmetic
import Conjectures.LonelinessHyperplaneSmoothDensity
import Conjectures.LonelinessHyperplaneSmoothFactorization
import Conjectures.LonelinessHyperplaneSmoothSeries
import Conjectures.LonelinessHyperplaneSubgroupFourier
import Conjectures.LonelinessHyperplaneSubspaceClassification
import Conjectures.LonelinessHyperplaneSubspaceExceptions
import Conjectures.LonelinessHyperplaneSubspaceTorus
import Conjectures.LonelinessHyperplaneSystemCone
import Conjectures.LonelinessHyperplaneSystemCounting
import Conjectures.LonelinessHyperplaneSystemSampling
import Conjectures.LonelinessHyperplaneSystemUnions
import Conjectures.LonelinessHyperplaneTorusValue
import Conjectures.LonelinessHyperplaneUnshifted
import Conjectures.LonelinessHyperplaneWeightedPartitionOffsets
import Conjectures.LonelinessHyperplaneWeightedPartitions
import Conjectures.LonelinessSubspaceDensity
import Lean.Util.CollectAxioms
import Lean.PrivateName
import Lean.Elab.Command
import Lean.Data.Json

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open Lean Elab Command in
run_cmd do
  let expectedModules : Array String := #["Conjectures.Loneliness", "Conjectures.LonelinessConsecutive", "Conjectures.LonelinessContinuity", "Conjectures.LonelinessCriticalBase", "Conjectures.LonelinessFiveFamily", "Conjectures.LonelinessHyperplane", "Conjectures.LonelinessHyperplaneAdmissibility", "Conjectures.LonelinessHyperplaneApproximation", "Conjectures.LonelinessHyperplaneArithmetic", "Conjectures.LonelinessHyperplaneBasic", "Conjectures.LonelinessHyperplaneBoundary", "Conjectures.LonelinessHyperplaneBoundedPartitions", "Conjectures.LonelinessHyperplaneBoxQuasipolynomial", "Conjectures.LonelinessHyperplaneCollisionPartitions", "Conjectures.LonelinessHyperplaneCoordinateCompression", "Conjectures.LonelinessHyperplaneCounting", "Conjectures.LonelinessHyperplaneDenominator", "Conjectures.LonelinessHyperplaneDenominatorQuasipolynomial", "Conjectures.LonelinessHyperplaneEndpointArithmetic", "Conjectures.LonelinessHyperplaneEndpointDensity", "Conjectures.LonelinessHyperplaneEndpointGeometry", "Conjectures.LonelinessHyperplaneExceptionalQuasipolynomial", "Conjectures.LonelinessHyperplaneFiniteExceptions", "Conjectures.LonelinessHyperplaneFixedShift", "Conjectures.LonelinessHyperplaneFourier", "Conjectures.LonelinessHyperplaneFourierAverage", "Conjectures.LonelinessHyperplaneFourierDensity", "Conjectures.LonelinessHyperplaneFourierKernel", "Conjectures.LonelinessHyperplaneFundamentalRemainder", "Conjectures.LonelinessHyperplaneFundamentalRemainderCounting", "Conjectures.LonelinessHyperplaneGenericCost", "Conjectures.LonelinessHyperplaneHaar", "Conjectures.LonelinessHyperplaneHaarValue", "Conjectures.LonelinessHyperplaneHitDensity", "Conjectures.LonelinessHyperplaneHomogeneousBox", "Conjectures.LonelinessHyperplaneInjectiveBoxCounting", "Conjectures.LonelinessHyperplaneLattice", "Conjectures.LonelinessHyperplaneMain", "Conjectures.LonelinessHyperplaneMaximizers", "Conjectures.LonelinessHyperplaneOneRelation", "Conjectures.LonelinessHyperplaneOptimalSupports", "Conjectures.LonelinessHyperplaneProbability", "Conjectures.LonelinessHyperplaneQuasipolynomialArithmetic", "Conjectures.LonelinessHyperplaneQuasipolynomialClosure", "Conjectures.LonelinessHyperplaneQuasipolynomialDegree", "Conjectures.LonelinessHyperplaneRateSharpness", "Conjectures.LonelinessHyperplaneRationalConeFan", "Conjectures.LonelinessHyperplaneRationalConeOptimalExistence", "Conjectures.LonelinessHyperplaneResidueDensity", "Conjectures.LonelinessHyperplaneResidueKernel", "Conjectures.LonelinessHyperplaneResiduePartition", "Conjectures.LonelinessHyperplaneResidueTranslation", "Conjectures.LonelinessHyperplaneScaledResidues", "Conjectures.LonelinessHyperplaneShiftLaw", "Conjectures.LonelinessHyperplaneSignedBoxCounting", "Conjectures.LonelinessHyperplaneSimplicialArithmetic", "Conjectures.LonelinessHyperplaneSmoothDensity", "Conjectures.LonelinessHyperplaneSmoothFactorization", "Conjectures.LonelinessHyperplaneSmoothSeries", "Conjectures.LonelinessHyperplaneSubgroupFourier", "Conjectures.LonelinessHyperplaneSubspaceClassification", "Conjectures.LonelinessHyperplaneSubspaceExceptions", "Conjectures.LonelinessHyperplaneSubspaceTorus", "Conjectures.LonelinessHyperplaneSystemCone", "Conjectures.LonelinessHyperplaneSystemCounting", "Conjectures.LonelinessHyperplaneSystemSampling", "Conjectures.LonelinessHyperplaneSystemUnions", "Conjectures.LonelinessHyperplaneTorusValue", "Conjectures.LonelinessHyperplaneUnshifted", "Conjectures.LonelinessHyperplaneWeightedPartitionOffsets", "Conjectures.LonelinessHyperplaneWeightedPartitions", "Conjectures.LonelinessSubspaceDensity"]
  let required : Array Name := #[`Loneliness.Hyperplane.integral_mFourier_velocity, `Loneliness.Hyperplane.integer_annihilator_iff, `Loneliness.Hyperplane.torusRelation_character_trivial_iff, `Loneliness.Hyperplane.exists_finite_frequency_average_control, `Loneliness.Hyperplane.exists_finite_frequency_dense_velocity, `Loneliness.Hyperplane.positiveBoxExceptional_card_le, `Loneliness.Hyperplane.exists_positiveBoxAdmissible_card_lower, `Loneliness.Hyperplane.exists_positive_distinct_integer_kernel, `Loneliness.Hyperplane.exists_admissible_box_denominator, `Loneliness.Hyperplane.exists_finite_frequency_uniform_gap_cover, `Loneliness.Hyperplane.torusVelocityValue_coe, `Loneliness.Hyperplane.torusUniformShiftGap_eq_real, `Loneliness.Hyperplane.exists_uniform_bad_count_bound, `Loneliness.Hyperplane.exceptional_count_mul_box_le, `Loneliness.Hyperplane.exists_uniform_probability_rate, `Loneliness.Hyperplane.exists_torus_uniform_probability_rate, `Loneliness.Hyperplane.uniformFailureProbability_tendsto_zero, `Loneliness.Hyperplane.uniformSuccessProbability_tendsto_one, `Loneliness.Hyperplane.exists_subthreshold_count_bound, `Loneliness.Hyperplane.haar_predictedValue_distribution, `Loneliness.Hyperplane.haar_predictedValue_isUniform, `Loneliness.Hyperplane.continuous_torusVelocityValue, `Loneliness.Hyperplane.independentShiftLaw_isProbability, `Loneliness.Hyperplane.independentShiftLaw_cdf, `Loneliness.Hyperplane.independentShiftCDF_lower, `Loneliness.Hyperplane.independentShiftCDF_upper, `Loneliness.Hyperplane.independentShiftCDF_tendsto, `Loneliness.Hyperplane.independentShiftLaw_cdf_tendsto_uniform, `Loneliness.Hyperplane.positiveBoxEndpoint_eq_hitsResidue, `Loneliness.Hyperplane.endpointFrequency_tendsto, `Loneliness.Hyperplane.unshifted_endpoint_iff_sign_point, `Loneliness.Hyperplane.velocity_hits_unit_multiple_iff, `Loneliness.Hyperplane.unshiftedSignPoint_unit_multiple, `Loneliness.Hyperplane.unshifted_endpoint_iff_canonical, `Loneliness.Hyperplane.unshifted_cdf_tendsto, `Loneliness.Hyperplane.predictedValue_zero, `Loneliness.Hyperplane.canonicalEndpointResidue_mem_kernel, `Loneliness.Hyperplane.scaledUnitResidueLine_frequency_tendsto, `Loneliness.Hyperplane.exists_scaledUnitResidue_uniform_bound, `Loneliness.Hyperplane.exists_smooth_coprime_factorization, `Loneliness.Hyperplane.smooth_coprime_factor_unique, `Loneliness.Hyperplane.scaledUnitResidueLine_unique_smooth, `Loneliness.Hyperplane.positive_velocity_hits_residue_iff_unique_smooth, `Loneliness.Hyperplane.smoothResidueFrequency_tendsto, `Loneliness.Hyperplane.positiveBoxHitsResidue_card, `Loneliness.Hyperplane.residueHitFrequency_eq_smoothResidueFrequency, `Loneliness.Hyperplane.residueHitFrequency_tendsto, `Loneliness.Hyperplane.full_support_maximizer, `Loneliness.Hyperplane.full_support_endpoint_velocity_points, `Loneliness.Hyperplane.primitive_velocity_hits_residue_iff, `Loneliness.Hyperplane.primitive_velocity_hits_unit_line_iff, `Loneliness.Hyperplane.unitResidueLine_card, `Loneliness.Hyperplane.unitResidueLine_mem_kernel, `Loneliness.Hyperplane.hasSum_smooth_reciprocal_power, `Loneliness.Hyperplane.summable_smooth_reciprocal_power, `Loneliness.Hyperplane.tsum_smooth_reciprocal_power, `Loneliness.Hyperplane.residue_kernel_card, `Loneliness.Hyperplane.exists_integer_kernel_residue_translation, `Loneliness.Hyperplane.positiveBoxAffineStrip_card_le, `Loneliness.Hyperplane.exists_residue_count_difference_bound, `Loneliness.Hyperplane.exists_residue_frequency_rate, `Loneliness.Hyperplane.residueFrequency_tendsto, `Loneliness.Hyperplane.residueSetFrequency_tendsto, `Loneliness.Hyperplane.one_relation_fiber_card_le, `Loneliness.Hyperplane.positiveBoxAdmissible_card_upper, `Loneliness.Hyperplane.positiveBoxDivisible_card_le, `Loneliness.Hyperplane.sharpNormal_primitive, `Loneliness.Hyperplane.sharpNormal_realAdmissible, `Loneliness.Hyperplane.sharpVelocity_attaining_time, `Loneliness.Hyperplane.sharpVelocity_value, `Loneliness.Hyperplane.sharp_uniform_bad_count_lower, `Loneliness.Hyperplane.sharp_uniform_failure_probability_two_sided, `Loneliness.Hyperplane.QuasipolynomialArithmetic.HasProgressionPolynomials.refine, `Loneliness.Hyperplane.QuasipolynomialArithmetic.IsQuasipolynomial.finite_linear_combination, `Loneliness.Hyperplane.QuasipolynomialArithmetic.coarsenedRelationBox_isQuasipolynomial_of_noninjective, `Loneliness.Hyperplane.QuasipolynomialArithmetic.collisionBox_isQuasipolynomial, `Loneliness.Hyperplane.QuasipolynomialArithmetic.injectiveRelationBox_card_inclusion_exclusion, `Loneliness.Hyperplane.QuasipolynomialArithmetic.injectiveRelationBox_isQuasipolynomial, `Loneliness.Hyperplane.positiveBoxAdmissible_isQuasipolynomial_of_nonzero, `Loneliness.Hyperplane.positiveBoxAdmissible_quasipolynomial, `Loneliness.Hyperplane.RationalCone.closedSystemBox_card_inclusion_exclusion, `Loneliness.Hyperplane.RationalCone.closedSystemBox_quasipolynomial_on_positive, `Loneliness.Hyperplane.RationalCone.positiveSystemBox_card_eq, `Loneliness.Hyperplane.RationalCone.positiveSystemBox_quasipolynomial_on_positive, `Loneliness.Hyperplane.RationalCone.positiveSystemUnion_card_inclusion_exclusion, `Loneliness.Hyperplane.RationalCone.positiveSystemUnion_quasipolynomial_on_positive, `Loneliness.Hyperplane.RealSubspace.trivialFrequency_iff, `Loneliness.Hyperplane.RealSubspace.nontrivialFrequency_finrank_lt, `Loneliness.Hyperplane.RealSubspace.exists_finite_frequency_bad_cover, `Loneliness.Hyperplane.RealSubspace.exists_finite_slice_classification, `Loneliness.Hyperplane.RealSubspace.exists_finite_proper_slice_classification, `Loneliness.Hyperplane.RealSubspace.hyperplane_closed_sublevel_finite_union, `Loneliness.Hyperplane.positiveBoxBelow_eq_finite_system_union, `Loneliness.Hyperplane.positiveBoxBelow_quasipolynomial_on_positive, `Loneliness.Hyperplane.positiveBoxBelow_progression_polynomials, `Loneliness.Hyperplane.fixedShiftCDF_tendsto, `Loneliness.Hyperplane.fixedShift_torus_cdf_tendsto, `Loneliness.Hyperplane.hyperplane_point_upper, `Loneliness.Hyperplane.shifted_hyperplane_attainment, `Loneliness.Hyperplane.shifted_hyperplane_value, `Loneliness.Hyperplane.shifted_hyperplane_maximum, `Loneliness.Hyperplane.orthogonal_velocity_bound, `Loneliness.Hyperplane.orthogonal_velocity_value_le, `Loneliness.Hyperplane.predictedValue_zero_even, `Loneliness.Hyperplane.predictedValue_zero_odd, `Loneliness.Hyperplane.shiftedVelocityValue_max]
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
