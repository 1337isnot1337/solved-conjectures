import Conjectures.Loneliness
import Conjectures.LonelinessContinuity
import Conjectures.LonelinessCriticalBase
import Conjectures.LonelinessFiveFamily
import Conjectures.LonelinessModularWitness
import Conjectures.LonelinessPrimeFiltering
import Conjectures.LonelinessPrimeFilteringArithmetic
import Conjectures.LonelinessPrimeFilteringCases
import Conjectures.LonelinessPrimeFilteringChoice
import Conjectures.LonelinessPrimeFilteringCorollaryThree
import Conjectures.LonelinessPrimeFilteringDigitBound
import Conjectures.LonelinessPrimeFilteringPartial
import Conjectures.LonelinessPrimeFilteringResidues
import Conjectures.LonelinessPrimeFilteringTwoForbidden
import Conjectures.LonelinessPrimeFilteringUnits
import Conjectures.LonelinessPrimeFilteringValuation
import Conjectures.LonelinessPrimeFilteringWitness
import Conjectures.LonelinessRational
import Lean.Util.CollectAxioms
import Lean.PrivateName
import Lean.Elab.Command
import Lean.Data.Json

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open Lean Elab Command in
run_cmd do
  let expectedModules : Array String := #["Conjectures.Loneliness", "Conjectures.LonelinessContinuity", "Conjectures.LonelinessCriticalBase", "Conjectures.LonelinessFiveFamily", "Conjectures.LonelinessModularWitness", "Conjectures.LonelinessPrimeFiltering", "Conjectures.LonelinessPrimeFilteringArithmetic", "Conjectures.LonelinessPrimeFilteringCases", "Conjectures.LonelinessPrimeFilteringChoice", "Conjectures.LonelinessPrimeFilteringCorollaryThree", "Conjectures.LonelinessPrimeFilteringDigitBound", "Conjectures.LonelinessPrimeFilteringPartial", "Conjectures.LonelinessPrimeFilteringResidues", "Conjectures.LonelinessPrimeFilteringTwoForbidden", "Conjectures.LonelinessPrimeFilteringUnits", "Conjectures.LonelinessPrimeFilteringValuation", "Conjectures.LonelinessPrimeFilteringWitness", "Conjectures.LonelinessRational"]
  let required : Array Name := #[`Loneliness.CriticalFamilies.le_value_any, `Loneliness.Modular.distance_nat_div, `Loneliness.Modular.hasWitness_value_lower, `Loneliness.Modular.witness_clearance_lower, `Loneliness.Modular.witness_value_lower, `Loneliness.PrimeFiltering.avoid_two_per_level, `Loneliness.PrimeFiltering.corollary_three_distance, `Loneliness.PrimeFiltering.corollary_three_distance_of_coprime_seed, `Loneliness.PrimeFiltering.corollary_three_value_of_coprime_seed, `Loneliness.PrimeFiltering.corollary_three_value_padic_of_coprime_seed, `Loneliness.PrimeFiltering.corollary_three_witness_of_coprime_seed, `Loneliness.PrimeFiltering.corollary_three_witness_padic_of_coprime_seed, `Loneliness.PrimeFiltering.exists_affine_avoiding, `Loneliness.PrimeFiltering.exists_avoiding_permutations, `Loneliness.PrimeFiltering.exists_nat_affine_avoiding, `Loneliness.PrimeFiltering.folded_lower_of_exact_power, `Loneliness.PrimeFiltering.hasWitness_of_level_budgets, `Loneliness.PrimeFiltering.hasWitness_of_lower_valuation_counts, `Loneliness.PrimeFiltering.hasWitness_seven_of_three_per_level, `Loneliness.PrimeFiltering.hasWitness_seven_of_three_per_valuation, `Loneliness.PrimeFiltering.maxPadicVal_le_iff, `Loneliness.PrimeFiltering.not_dvd_pow_maxPadicVal_succ, `Loneliness.PrimeFiltering.one_seventh_of_three_below_max_valuation, `Loneliness.PrimeFiltering.one_seventh_of_three_per_level, `Loneliness.PrimeFiltering.one_seventh_of_three_per_valuation, `Loneliness.PrimeFiltering.padicValNat_le_maxPadicVal, `Loneliness.PrimeFiltering.padic_level_exact, `Loneliness.PrimeFiltering.partial_prime_filtering, `Loneliness.PrimeFiltering.prime_filtering, `Loneliness.PrimeFiltering.prime_filtering_coprime, `Loneliness.PrimeFiltering.prime_filtering_of_card_bounds, `Loneliness.PrimeFiltering.prime_filtering_padic, `Loneliness.PrimeFiltering.prime_filtering_padic_of_le, `Loneliness.PrimeFiltering.prime_filtering_unit, `Loneliness.PrimeFiltering.seven_avoid_two_of_three_per_level, `Loneliness.PrimeFiltering.uniform_level_value, `Loneliness.PrimeFiltering.uniform_level_witness, `Loneliness.PrimeFiltering.uniform_padic_value, `Loneliness.PrimeFiltering.value_lower_of_level_budgets, `Loneliness.PrimeFiltering.value_lower_of_lower_valuation_counts, `Loneliness.PrimeFiltering.witness_of_digit_avoiding, `Loneliness.PrimeFiltering.witness_of_prime_power_folded_lower, `Loneliness.PrimeFilteringArithmetic.digit_eq_zero_iff, `Loneliness.PrimeFilteringArithmetic.digit_mul_of_dvd, `Loneliness.PrimeFilteringArithmetic.digit_step, `Loneliness.PrimeFilteringArithmetic.digit_step_of_next_pow_dvd, `Loneliness.PrimeFilteringArithmetic.leading_digit_ne_zero, `Loneliness.PrimeFilteringArithmetic.multiplier_cast_at_top, `Loneliness.PrimeFilteringArithmetic.multiplier_cast_of_lt, `Loneliness.PrimeFilteringArithmetic.multiplier_ne_zero, `Loneliness.PrimeFilteringArithmetic.multiplier_ne_zero_at_top, `Loneliness.PrimeFilteringArithmetic.multiplier_ne_zero_of_lt, `Loneliness.PrimeFilteringArithmetic.quotient_step, `Loneliness.PrimeFilteringDigitBound.folded_lower_of_digit_avoiding, `Loneliness.PrimeFilteringDigitBound.residue_bounds_of_digit_avoiding, `Loneliness.PrimeFilteringResidues.coprime_prime_power_of_nonzero, `Loneliness.PrimeFilteringResidues.digit_eq_of_mod_eq, `Loneliness.PrimeFilteringResidues.digit_mod_prime_power, `Loneliness.PrimeFilteringResidues.exists_unit_lift, `Loneliness.PrimeFilteringResidues.exists_unit_val_lift, `Loneliness.PrimeFilteringResidues.isUnit_prime_power_of_nonzero, `Loneliness.PrimeFilteringResidues.residue_step_of_next_pow_dvd, `Loneliness.PrimeFilteringResidues.step_expansion_of_next_pow_dvd, `Loneliness.PrimeFilteringResidues.val_coprime_prime_power_of_nonzero, `Loneliness.continuous_clearance, `Loneliness.distance_int_div, `Loneliness.distance_nonneg, `Loneliness.le_clearance]
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
