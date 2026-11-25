import Conjectures.HajduSarkozy
import Conjectures.HajduSarkozyArithmetic
import Conjectures.HajduSarkozyAsymptotics
import Conjectures.HajduSarkozyBins
import Conjectures.HajduSarkozyCommon
import Conjectures.HajduSarkozyCounts
import Conjectures.HajduSarkozyDensity
import Conjectures.HajduSarkozyFactors
import Conjectures.HajduSarkozyIncidence
import Conjectures.HajduSarkozyMatrix
import Conjectures.HajduSarkozyProduct
import Conjectures.HajduSarkozyProducts
import Conjectures.HajduSarkozyProductsArithmetic
import Conjectures.HajduSarkozyProductsBins
import Conjectures.HajduSarkozyProductsCommon
import Conjectures.HajduSarkozyProductsCounts
import Conjectures.HajduSarkozyProductsFactors
import Conjectures.HajduSarkozyProductsFamily
import Conjectures.HajduSarkozyProductsGrowth
import Conjectures.HajduSarkozyProductsLimits
import Conjectures.HajduSarkozyProductsPowers
import Conjectures.HajduSarkozyProductsProduct
import Conjectures.HajduSarkozyProductsSeries
import Conjectures.HajduSarkozyProductsTails
import Lean.Util.CollectAxioms
import Lean.PrivateName
import Lean.Elab.Command
import Lean.Data.Json

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open Lean Elab Command in
run_cmd do
  let expectedModules : Array String := #["Conjectures.HajduSarkozy", "Conjectures.HajduSarkozyArithmetic", "Conjectures.HajduSarkozyAsymptotics", "Conjectures.HajduSarkozyBins", "Conjectures.HajduSarkozyCommon", "Conjectures.HajduSarkozyCounts", "Conjectures.HajduSarkozyDensity", "Conjectures.HajduSarkozyFactors", "Conjectures.HajduSarkozyIncidence", "Conjectures.HajduSarkozyMatrix", "Conjectures.HajduSarkozyProduct", "Conjectures.HajduSarkozyProducts", "Conjectures.HajduSarkozyProductsArithmetic", "Conjectures.HajduSarkozyProductsBins", "Conjectures.HajduSarkozyProductsCommon", "Conjectures.HajduSarkozyProductsCounts", "Conjectures.HajduSarkozyProductsFactors", "Conjectures.HajduSarkozyProductsFamily", "Conjectures.HajduSarkozyProductsGrowth", "Conjectures.HajduSarkozyProductsLimits", "Conjectures.HajduSarkozyProductsPowers", "Conjectures.HajduSarkozyProductsProduct", "Conjectures.HajduSarkozyProductsSeries", "Conjectures.HajduSarkozyProductsTails"]
  let required : Array Name := #[`Conjectures.HajduSarkozy.no_thin_four_cycle, `Conjectures.HajduSarkozy.edge_card_le, `Conjectures.HajduSarkozy.filter_product_card_le, `Conjectures.HajduSarkozy.doublePrefix_isLittleO, `Conjectures.HajduSarkozy.half_square_isLittleO, `Conjectures.HajduSarkozy.mem_realPrefix, `Conjectures.HajduSarkozy.sparse_finite, `Conjectures.HajduSarkozy.product_bin_indices, `Conjectures.HajduSarkozy.thin_bin_edge_card_le, `Conjectures.HajduSarkozy.triangleSum_isLittleO, `Conjectures.HajduSarkozy.large_product_count_le_triangle, `Conjectures.HajduSarkozy.product_grid_isLittleO, `Conjectures.HajduSarkozy.commonPowers_grid_bound, `Conjectures.HajduSarkozy.factor_count_bound, `Conjectures.HajduSarkozy.factor_binMass_isLittleO, `Conjectures.HajduSarkozy.shiftedPowers_not_grid_isLittleO, `Conjectures.HajduSarkozy.no_product_of_sparse_error, `Conjectures.HajduSarkozy.shiftedPowerPerturbations, `Conjectures.HajduSarkozy.original_shifted_finite_difference, `Conjectures.HajduSarkozy.hajdu_sarkozy_conjecture, `Conjectures.HajduSarkozy.Products.no_thin_mixed_four_cycle, `Conjectures.HajduSarkozy.Products.scaled_count_le, `Conjectures.HajduSarkozy.Products.sum_le_tailMass, `Conjectures.HajduSarkozy.Products.uniform_tail_isLittleO, `Conjectures.HajduSarkozy.Products.coefficient_tail_count_le, `Conjectures.HajduSarkozy.Products.sparse_of_grid, `Conjectures.HajduSarkozy.Products.not_sparse_of_positive_limsup, `Conjectures.HajduSarkozy.Products.finite_change_conditions, `Conjectures.HajduSarkozy.Products.mixedCommon_grid_bound, `Conjectures.HajduSarkozy.Products.head_common_grid_bound, `Conjectures.HajduSarkozy.Products.coefficient_tail_grid_le, `Conjectures.HajduSarkozy.Products.factor_grid_isLittleO, `Conjectures.HajduSarkozy.Products.factor_binMass_isLittleO, `Conjectures.HajduSarkozy.Products.thin_bin_edge_card_le, `Conjectures.HajduSarkozy.Products.large_product_count_le_triangle, `Conjectures.HajduSarkozy.Products.product_grid_isLittleO, `Conjectures.HajduSarkozy.Products.family_product_grid_isLittleO, `Conjectures.HajduSarkozy.Products.retained_product_sparse, `Conjectures.HajduSarkozy.Products.no_product_summable_family, `Conjectures.HajduSarkozy.Products.summable_family_total_of_not_sparse, `Conjectures.HajduSarkozy.Products.indexed_summable_family, `Conjectures.HajduSarkozy.Products.setCoefficients_summable, `Conjectures.HajduSarkozy.Products.indexed_set_family_eq, `Conjectures.HajduSarkozy.Products.summable_family, `Conjectures.HajduSarkozy.Products.power_coefficients_summable, `Conjectures.HajduSarkozy.Products.power_family_eq_products, `Conjectures.HajduSarkozy.Products.shiftedProducts_equal, `Conjectures.HajduSarkozy.Products.shiftedPowers_not_sparse, `Conjectures.HajduSarkozy.Products.ordered_shifted_product_perturbations, `Conjectures.HajduSarkozy.Products.shifted_product_perturbations, `Conjectures.HajduSarkozy.Products.originalProducts_eq, `Conjectures.HajduSarkozy.Products.hajdu_sarkozy_shifted_products_conjecture, `Conjectures.HajduSarkozy.Products.original_finite_modification_not_product]
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
