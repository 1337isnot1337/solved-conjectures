import Conjectures.HaralambisCounting
import Conjectures.HaralambisDefects
import Conjectures.HaralambisDensity
import Conjectures.HaralambisFaces
import Conjectures.HaralambisIntervals
import Conjectures.HaralambisOrientation
import Conjectures.HaralambisPairSum
import Conjectures.HaralambisPeriods
import Conjectures.HaralambisTheorem
import Conjectures.Loneliness
import Conjectures.LonelinessCoalescence
import Conjectures.LonelinessCoalescenceValue
import Conjectures.LonelinessContinuity
import Conjectures.LonelinessCoordinateClasses
import Conjectures.LonelinessCoordinateSubspace
import Conjectures.LonelinessCriticalBase
import Conjectures.LonelinessCriticalFamilies
import Conjectures.LonelinessCriticalSecond
import Conjectures.LonelinessFiveFamily
import Conjectures.LonelinessHyperplaneArithmetic
import Conjectures.LonelinessIntegerDirection
import Conjectures.LonelinessKZBasisGram
import Conjectures.LonelinessKZBasisInteger
import Conjectures.LonelinessKZBasisOperations
import Conjectures.LonelinessKZBasisReduction
import Conjectures.LonelinessKZBasisStep
import Conjectures.LonelinessKZBasisVectors
import Conjectures.LonelinessKZGeneral
import Conjectures.LonelinessKZProductAssembly
import Conjectures.LonelinessKZProductCertificate
import Conjectures.LonelinessKZProductOrder
import Conjectures.LonelinessKZSmallData
import Conjectures.LonelinessLatticeCovolume
import Conjectures.LonelinessNearestPlane
import Conjectures.LonelinessNearestPlanePrefix
import Conjectures.LonelinessNearestPlaneRelative
import Conjectures.LonelinessNearestPlaneValue
import Conjectures.LonelinessNormGeometry
import Conjectures.LonelinessNormalization
import Conjectures.LonelinessPacking
import Conjectures.LonelinessPackingLower
import Conjectures.LonelinessPrefixProduct
import Conjectures.LonelinessPrefixProductTables
import Conjectures.LonelinessPrimitiveBasis
import Conjectures.LonelinessPrimitiveSpeeds
import Conjectures.LonelinessRational
import Conjectures.LonelinessRationalLattice
import Conjectures.LonelinessRationalLatticeCore
import Conjectures.LonelinessRationalLatticeIndex
import Conjectures.LonelinessRationalSubspace
import Conjectures.LonelinessRectangularGram
import Conjectures.LonelinessRectangularGramLowerBound
import Conjectures.LonelinessRectangularLattice
import Conjectures.LonelinessSixSpectrumLatticeNorm
import Conjectures.LonelinessSixSpectrumNormGeometry
import Conjectures.LonelinessSmallRunner
import Conjectures.LonelinessSubspaceDensity
import Conjectures.NonmixedGapDensity
import Conjectures.NonmixedGapPeriodic
import Conjectures.NonmixedGapResidues
import Lean.Util.CollectAxioms
import Lean.PrivateName
import Lean.Elab.Command
import Lean.Data.Json

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open Lean Elab Command in
run_cmd do
  let expectedModules : Array String := #["Conjectures.HaralambisCounting", "Conjectures.HaralambisDefects", "Conjectures.HaralambisDensity", "Conjectures.HaralambisFaces", "Conjectures.HaralambisIntervals", "Conjectures.HaralambisOrientation", "Conjectures.HaralambisPairSum", "Conjectures.HaralambisPeriods", "Conjectures.HaralambisTheorem", "Conjectures.Loneliness", "Conjectures.LonelinessCoalescence", "Conjectures.LonelinessCoalescenceValue", "Conjectures.LonelinessContinuity", "Conjectures.LonelinessCoordinateClasses", "Conjectures.LonelinessCoordinateSubspace", "Conjectures.LonelinessCriticalBase", "Conjectures.LonelinessCriticalFamilies", "Conjectures.LonelinessCriticalSecond", "Conjectures.LonelinessFiveFamily", "Conjectures.LonelinessHyperplaneArithmetic", "Conjectures.LonelinessIntegerDirection", "Conjectures.LonelinessKZBasisGram", "Conjectures.LonelinessKZBasisInteger", "Conjectures.LonelinessKZBasisOperations", "Conjectures.LonelinessKZBasisReduction", "Conjectures.LonelinessKZBasisStep", "Conjectures.LonelinessKZBasisVectors", "Conjectures.LonelinessKZGeneral", "Conjectures.LonelinessKZProductAssembly", "Conjectures.LonelinessKZProductCertificate", "Conjectures.LonelinessKZProductOrder", "Conjectures.LonelinessKZSmallData", "Conjectures.LonelinessLatticeCovolume", "Conjectures.LonelinessNearestPlane", "Conjectures.LonelinessNearestPlanePrefix", "Conjectures.LonelinessNearestPlaneRelative", "Conjectures.LonelinessNearestPlaneValue", "Conjectures.LonelinessNormGeometry", "Conjectures.LonelinessNormalization", "Conjectures.LonelinessPacking", "Conjectures.LonelinessPackingLower", "Conjectures.LonelinessPrefixProduct", "Conjectures.LonelinessPrefixProductTables", "Conjectures.LonelinessPrimitiveBasis", "Conjectures.LonelinessPrimitiveSpeeds", "Conjectures.LonelinessRational", "Conjectures.LonelinessRationalLattice", "Conjectures.LonelinessRationalLatticeCore", "Conjectures.LonelinessRationalLatticeIndex", "Conjectures.LonelinessRationalSubspace", "Conjectures.LonelinessRectangularGram", "Conjectures.LonelinessRectangularGramLowerBound", "Conjectures.LonelinessRectangularLattice", "Conjectures.LonelinessSixSpectrumLatticeNorm", "Conjectures.LonelinessSixSpectrumNormGeometry", "Conjectures.LonelinessSmallRunner", "Conjectures.LonelinessSubspaceDensity", "Conjectures.NonmixedGapDensity", "Conjectures.NonmixedGapPeriodic", "Conjectures.NonmixedGapResidues"]
  let required : Array Name := #[`Loneliness.RectangularLattice.left_inverse_mulVec, `Loneliness.RectangularLattice.mulVec_injective, `Loneliness.RectangularLattice.real_left_inverse, `Loneliness.RectangularLattice.parameters_integral, `Loneliness.RectangularLattice.integral_points_iff, `Loneliness.RectangularLattice.isUnimodular_image_iff, `Loneliness.RectangularLattice.imageBasis_apply, `Loneliness.RectangularLattice.exists_basis_first_image, `Loneliness.RectangularLattice.exists_image_basis_first, `Loneliness.RectangularLattice.gram_cast, `Loneliness.RectangularLattice.gram_det_cast, `Loneliness.RectangularLattice.basis_det_sq, `Loneliness.RectangularLattice.gram_det_image_basis, `Loneliness.RectangularLattice.SixSpectrumMaps.triangle_left_inverse, `Loneliness.RectangularLattice.SixSpectrumMaps.triangle_apply, `Loneliness.RectangularLattice.SixSpectrumMaps.triangle_gram_det, `Loneliness.RectangularLattice.SixSpectrumMaps.triangle_integral_points, `Loneliness.RectangularLattice.SixSpectrumMaps.shape0_left_inverse, `Loneliness.RectangularLattice.SixSpectrumMaps.shape0_apply, `Loneliness.RectangularLattice.SixSpectrumMaps.shape0_gram_det, `Loneliness.RectangularLattice.SixSpectrumMaps.shape0_integral_points, `Loneliness.RectangularLattice.SixSpectrumMaps.shape1_left_inverse, `Loneliness.RectangularLattice.SixSpectrumMaps.shape1_apply, `Loneliness.RectangularLattice.SixSpectrumMaps.shape1_gram_det, `Loneliness.RectangularLattice.SixSpectrumMaps.shape1_integral_points, `Loneliness.RectangularGram.det_mul_eq_sum_minors, `Loneliness.RectangularGram.gram_det_eq_sum_minors_sq, `Loneliness.RectangularGram.int_gram_det_nonneg, `Loneliness.RectangularGram.int_minor_sq_le_gram_det, `Loneliness.LatticeCovolume.orthonormal_fundamentalDomain_volume, `Loneliness.LatticeCovolume.gram_det_eq_basis_det_sq, `Loneliness.LatticeCovolume.covolume_sq_eq_gram_det, `Loneliness.LatticeCovolume.covolume_sq_eq_int_gram_det, `Loneliness.LatticeCovolume.one_le_covolume_sq_of_integral_gram, `Loneliness.RectangularGramLowerBound.normalized_gram_det, `Loneliness.RectangularGramLowerBound.normalized_gram_det_ge_six_of_rows, `Loneliness.RectangularGramLowerBound.picked_det_sq_eq_one_of_gram_lt_six, `Loneliness.RectangularGramLowerBound.gram_det_ge_six, `Loneliness.RationalLattice.space_eq_span, `Loneliness.RationalLattice.integerPoints_span_top, `Loneliness.RationalLattice.integerPoints_finrank, `Loneliness.RationalLattice.covolume_sq_eq_basisMatrix_gram_det, `Loneliness.RationalLattice.one_le_covolume_sq, `Loneliness.RationalLattice.six_le_covolume_sq, `Loneliness.SixSpectrumLatticeNorm.norm_lt_rank_four, `Loneliness.SixSpectrumLatticeNorm.norm_lt_five_constant, `Loneliness.SixSpectrumLatticeNorm.norm_lt_six_constant, `Loneliness.RationalLatticeIndex.exists_integer_gram_factor, `Loneliness.RationalLatticeIndex.covolume_sq_le_gram_det, `Loneliness.RationalLatticeIndex.covolume_sq_le_gram_det_of_independent]
  let legacyPrefixes : Array String := #["Haralambis.", "Loneliness.", "NonmixedGap."]
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
