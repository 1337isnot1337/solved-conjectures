import Conjectures.Loneliness
import Conjectures.LonelinessCoalescence
import Conjectures.LonelinessCoalescenceValue
import Conjectures.LonelinessContinuity
import Conjectures.LonelinessCoordinateClasses
import Conjectures.LonelinessCoordinateSubspace
import Conjectures.LonelinessCriticalBase
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
import Conjectures.LonelinessKZProduct
import Conjectures.LonelinessKZProductAssembly
import Conjectures.LonelinessKZProductCertificate
import Conjectures.LonelinessKZProductDataEleven
import Conjectures.LonelinessKZProductDataNine
import Conjectures.LonelinessKZProductDataTen
import Conjectures.LonelinessKZProductDataThirteen
import Conjectures.LonelinessKZProductDataThirteenBase
import Conjectures.LonelinessKZProductDataThirteenBlock00
import Conjectures.LonelinessKZProductDataThirteenBlock01
import Conjectures.LonelinessKZProductDataThirteenBlock02
import Conjectures.LonelinessKZProductDataThirteenBlock03
import Conjectures.LonelinessKZProductDataThirteenBlock04
import Conjectures.LonelinessKZProductDataThirteenBlock05
import Conjectures.LonelinessKZProductDataThirteenBlock06
import Conjectures.LonelinessKZProductDataThirteenBlock07
import Conjectures.LonelinessKZProductDataThirteenBlock08
import Conjectures.LonelinessKZProductDataThirteenBlock09
import Conjectures.LonelinessKZProductDataThirteenBlock10
import Conjectures.LonelinessKZProductDataThirteenBlock11
import Conjectures.LonelinessKZProductDataThirteenBlock12
import Conjectures.LonelinessKZProductDataThirteenBlock13
import Conjectures.LonelinessKZProductDataThirteenBlock14
import Conjectures.LonelinessKZProductDataThirteenBlock15
import Conjectures.LonelinessKZProductDataTwelve
import Conjectures.LonelinessKZProductDataTwelveBase
import Conjectures.LonelinessKZProductDataTwelveBlock00
import Conjectures.LonelinessKZProductDataTwelveBlock01
import Conjectures.LonelinessKZProductDataTwelveBlock02
import Conjectures.LonelinessKZProductDataTwelveBlock03
import Conjectures.LonelinessKZProductDataTwelveBlock04
import Conjectures.LonelinessKZProductDataTwelveBlock05
import Conjectures.LonelinessKZProductDataTwelveBlock06
import Conjectures.LonelinessKZProductDataTwelveBlock07
import Conjectures.LonelinessKZProductFast
import Conjectures.LonelinessKZProductOrder
import Conjectures.LonelinessModularForcedDivisor
import Conjectures.LonelinessModularPrimes
import Conjectures.LonelinessModularTightPrimeBounds
import Conjectures.LonelinessModularTightPrimeDataEight
import Conjectures.LonelinessModularTightPrimeDataEleven
import Conjectures.LonelinessModularTightPrimeDataNine
import Conjectures.LonelinessModularTightPrimeDataSeven
import Conjectures.LonelinessModularTightPrimeDataSix
import Conjectures.LonelinessModularTightPrimeDataTen
import Conjectures.LonelinessModularTightPrimeDataThirteen
import Conjectures.LonelinessModularTightPrimeDataTwelve
import Conjectures.LonelinessModularTightPrimeDefs
import Conjectures.LonelinessModularTightPrimeProducts
import Conjectures.LonelinessModularWitness
import Conjectures.LonelinessNearestPlane
import Conjectures.LonelinessNearestPlanePrefix
import Conjectures.LonelinessNearestPlaneRelative
import Conjectures.LonelinessNearestPlaneValue
import Conjectures.LonelinessNormGeometry
import Conjectures.LonelinessPrefixProduct
import Conjectures.LonelinessPrefixProductTables
import Conjectures.LonelinessPrimitiveBasis
import Conjectures.LonelinessPrimitiveSpeeds
import Conjectures.LonelinessRational
import Conjectures.LonelinessRationalSubspace
import Conjectures.LonelinessSubspaceDensity
import Conjectures.LonelinessTightNormBounds
import Conjectures.LonelinessTightNormCommon
import Lean.Util.CollectAxioms
import Lean.PrivateName
import Lean.Elab.Command
import Lean.Data.Json

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open Lean Elab Command in
run_cmd do
  let expectedModules : Array String := #["Conjectures.Loneliness", "Conjectures.LonelinessCoalescence", "Conjectures.LonelinessCoalescenceValue", "Conjectures.LonelinessContinuity", "Conjectures.LonelinessCoordinateClasses", "Conjectures.LonelinessCoordinateSubspace", "Conjectures.LonelinessCriticalBase", "Conjectures.LonelinessFiveFamily", "Conjectures.LonelinessHyperplaneArithmetic", "Conjectures.LonelinessIntegerDirection", "Conjectures.LonelinessKZBasisGram", "Conjectures.LonelinessKZBasisInteger", "Conjectures.LonelinessKZBasisOperations", "Conjectures.LonelinessKZBasisReduction", "Conjectures.LonelinessKZBasisStep", "Conjectures.LonelinessKZBasisVectors", "Conjectures.LonelinessKZGeneral", "Conjectures.LonelinessKZProduct", "Conjectures.LonelinessKZProductAssembly", "Conjectures.LonelinessKZProductCertificate", "Conjectures.LonelinessKZProductDataEleven", "Conjectures.LonelinessKZProductDataNine", "Conjectures.LonelinessKZProductDataTen", "Conjectures.LonelinessKZProductDataThirteen", "Conjectures.LonelinessKZProductDataThirteenBase", "Conjectures.LonelinessKZProductDataThirteenBlock00", "Conjectures.LonelinessKZProductDataThirteenBlock01", "Conjectures.LonelinessKZProductDataThirteenBlock02", "Conjectures.LonelinessKZProductDataThirteenBlock03", "Conjectures.LonelinessKZProductDataThirteenBlock04", "Conjectures.LonelinessKZProductDataThirteenBlock05", "Conjectures.LonelinessKZProductDataThirteenBlock06", "Conjectures.LonelinessKZProductDataThirteenBlock07", "Conjectures.LonelinessKZProductDataThirteenBlock08", "Conjectures.LonelinessKZProductDataThirteenBlock09", "Conjectures.LonelinessKZProductDataThirteenBlock10", "Conjectures.LonelinessKZProductDataThirteenBlock11", "Conjectures.LonelinessKZProductDataThirteenBlock12", "Conjectures.LonelinessKZProductDataThirteenBlock13", "Conjectures.LonelinessKZProductDataThirteenBlock14", "Conjectures.LonelinessKZProductDataThirteenBlock15", "Conjectures.LonelinessKZProductDataTwelve", "Conjectures.LonelinessKZProductDataTwelveBase", "Conjectures.LonelinessKZProductDataTwelveBlock00", "Conjectures.LonelinessKZProductDataTwelveBlock01", "Conjectures.LonelinessKZProductDataTwelveBlock02", "Conjectures.LonelinessKZProductDataTwelveBlock03", "Conjectures.LonelinessKZProductDataTwelveBlock04", "Conjectures.LonelinessKZProductDataTwelveBlock05", "Conjectures.LonelinessKZProductDataTwelveBlock06", "Conjectures.LonelinessKZProductDataTwelveBlock07", "Conjectures.LonelinessKZProductFast", "Conjectures.LonelinessKZProductOrder", "Conjectures.LonelinessModularForcedDivisor", "Conjectures.LonelinessModularPrimes", "Conjectures.LonelinessModularTightPrimeBounds", "Conjectures.LonelinessModularTightPrimeDataEight", "Conjectures.LonelinessModularTightPrimeDataEleven", "Conjectures.LonelinessModularTightPrimeDataNine", "Conjectures.LonelinessModularTightPrimeDataSeven", "Conjectures.LonelinessModularTightPrimeDataSix", "Conjectures.LonelinessModularTightPrimeDataTen", "Conjectures.LonelinessModularTightPrimeDataThirteen", "Conjectures.LonelinessModularTightPrimeDataTwelve", "Conjectures.LonelinessModularTightPrimeDefs", "Conjectures.LonelinessModularTightPrimeProducts", "Conjectures.LonelinessModularWitness", "Conjectures.LonelinessNearestPlane", "Conjectures.LonelinessNearestPlanePrefix", "Conjectures.LonelinessNearestPlaneRelative", "Conjectures.LonelinessNearestPlaneValue", "Conjectures.LonelinessNormGeometry", "Conjectures.LonelinessPrefixProduct", "Conjectures.LonelinessPrefixProductTables", "Conjectures.LonelinessPrimitiveBasis", "Conjectures.LonelinessPrimitiveSpeeds", "Conjectures.LonelinessRational", "Conjectures.LonelinessRationalSubspace", "Conjectures.LonelinessSubspaceDensity", "Conjectures.LonelinessTightNormBounds", "Conjectures.LonelinessTightNormCommon"]
  let required : Array Name := #[`Loneliness.NormGeometry.tight_natural_squaredNorm_le, `Loneliness.NormGeometry.exists_original_prime_of_tight, `Loneliness.NormGeometry.natural_squaredNorm_le_of_product, `Loneliness.NormGeometry.exists_tight_gram_data, `Loneliness.NormGeometry.tight_norm_cutoff, `Loneliness.PrimitiveBasis.primitive_speed_basis_extension, `Loneliness.KZBasis.exists_ratio_basis, `Loneliness.KZGeneral.norm_square_cutoff, `Loneliness.KZGeneral.product_of_certificate, `Loneliness.KZProduct.Nine.rows_valid, `Loneliness.KZProduct.Ten.rows_valid, `Loneliness.KZProduct.Eleven.rows_valid, `Loneliness.KZProduct.Twelve.rows_valid, `Loneliness.KZProduct.Thirteen.rows_valid, `Loneliness.KZProduct.product_nine, `Loneliness.KZProduct.product_ten, `Loneliness.KZProduct.product_eleven, `Loneliness.KZProduct.product_twelve, `Loneliness.KZProduct.product_thirteen, `Loneliness.KZProduct.product_lower_bound, `Loneliness.KZProduct.product_minimizer, `Loneliness.KZProduct.increments_feasible, `Loneliness.Modular.TightPrimeBounds.prefix_margin, `Loneliness.Modular.TightPrimeBounds.prime_data_valid, `Loneliness.Modular.TightPrimeBounds.exists_prime_of_tight_bound]
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
