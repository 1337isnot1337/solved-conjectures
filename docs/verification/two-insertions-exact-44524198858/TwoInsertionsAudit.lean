import Conjectures.Loneliness
import Conjectures.LonelinessContinuity
import Conjectures.LonelinessCriticalBase
import Conjectures.LonelinessCriticalFamilies
import Conjectures.LonelinessCriticalSecond
import Conjectures.LonelinessFiveFamily
import Conjectures.LonelinessModularWitness
import Conjectures.LonelinessNormalization
import Conjectures.LonelinessRational
import Conjectures.LonelinessTwoInsertions
import Conjectures.LonelinessTwoInsertionsAccelerationArithmetic
import Conjectures.LonelinessTwoInsertionsAccelerations
import Conjectures.LonelinessTwoInsertionsDivisibility
import Conjectures.LonelinessTwoInsertionsInterval
import Conjectures.LonelinessTwoInsertionsMeasure
import Conjectures.LonelinessTwoInsertionsObstruction
import Conjectures.LonelinessTwoInsertionsRows
import Conjectures.LonelinessTwoInsertionsShift
import Conjectures.LonelinessTwoInsertionsSmall
import Conjectures.LonelinessTwoInsertionsSmall10
import Conjectures.LonelinessTwoInsertionsSmall3
import Conjectures.LonelinessTwoInsertionsSmall4
import Conjectures.LonelinessTwoInsertionsSmall5
import Conjectures.LonelinessTwoInsertionsSmall6
import Conjectures.LonelinessTwoInsertionsSmall7
import Conjectures.LonelinessTwoInsertionsSmall8
import Conjectures.LonelinessTwoInsertionsSmall9
import Lean.Util.CollectAxioms
import Lean.PrivateName
import Lean.Elab.Command
import Lean.Data.Json

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open Lean Elab Command in
run_cmd do
  let expectedModules : Array String := #["Conjectures.Loneliness", "Conjectures.LonelinessContinuity", "Conjectures.LonelinessCriticalBase", "Conjectures.LonelinessCriticalFamilies", "Conjectures.LonelinessCriticalSecond", "Conjectures.LonelinessFiveFamily", "Conjectures.LonelinessModularWitness", "Conjectures.LonelinessNormalization", "Conjectures.LonelinessRational", "Conjectures.LonelinessTwoInsertions", "Conjectures.LonelinessTwoInsertionsAccelerationArithmetic", "Conjectures.LonelinessTwoInsertionsAccelerations", "Conjectures.LonelinessTwoInsertionsDivisibility", "Conjectures.LonelinessTwoInsertionsInterval", "Conjectures.LonelinessTwoInsertionsMeasure", "Conjectures.LonelinessTwoInsertionsObstruction", "Conjectures.LonelinessTwoInsertionsRows", "Conjectures.LonelinessTwoInsertionsShift", "Conjectures.LonelinessTwoInsertionsSmall", "Conjectures.LonelinessTwoInsertionsSmall10", "Conjectures.LonelinessTwoInsertionsSmall3", "Conjectures.LonelinessTwoInsertionsSmall4", "Conjectures.LonelinessTwoInsertionsSmall5", "Conjectures.LonelinessTwoInsertionsSmall6", "Conjectures.LonelinessTwoInsertionsSmall7", "Conjectures.LonelinessTwoInsertionsSmall8", "Conjectures.LonelinessTwoInsertionsSmall9"]
  let required : Array Name := #[`Loneliness.TwoInsertions.exists_good_on_interval, `Loneliness.TwoInsertions.IntervalCertificate.good, `Loneliness.TwoInsertions.IntervalCertificate.unbounded_second, `Loneliness.TwoInsertions.PairCertificate.sound, `Loneliness.TwoInsertions.BaseRow.sound, `Loneliness.TwoInsertions.checked_rows_sound, `Loneliness.TwoInsertions.small_bounded_window, `Loneliness.TwoInsertions.Small3.rows_checked, `Loneliness.TwoInsertions.Small4.rows_checked, `Loneliness.TwoInsertions.Small5.rows_checked, `Loneliness.TwoInsertions.Small6.rows_checked, `Loneliness.TwoInsertions.Small7.rows_checked, `Loneliness.TwoInsertions.Small8.rows_checked, `Loneliness.TwoInsertions.Small9.rows_checked, `Loneliness.TwoInsertions.Small10.rows_checked, `Loneliness.TwoInsertions.periodic_integral_upper, `Loneliness.TwoInsertions.badIndicator_integral_one, `Loneliness.TwoInsertions.speed_bad_integral_bound, `Loneliness.TwoInsertions.two_speed_interval_of_length, `Loneliness.TwoInsertions.window_of_measure, `Loneliness.TwoInsertions.reciprocal_residue_lower, `Loneliness.TwoInsertions.failed_endpoints_divisibility, `Loneliness.TwoInsertions.common_divisors_product_bound, `Loneliness.TwoInsertions.failed_endpoints_large_second, `Loneliness.TwoInsertions.divisor_eq_below_twice, `Loneliness.TwoInsertions.large_first_measure_bound, `Loneliness.TwoInsertions.window_above_small_bound, `Loneliness.TwoInsertions.central_speed_window, `Loneliness.TwoInsertions.shifted_left_window, `Loneliness.TwoInsertions.noncentral_divisibility_bound, `Loneliness.TwoInsertions.large_parameter_window, `Loneliness.TwoInsertions.two_speed_window_sorted, `Loneliness.TwoInsertions.two_speed_window, `Loneliness.TwoInsertions.insertion_for_interval_base, `Loneliness.TwoInsertions.insertion_value_lower, `Loneliness.TwoInsertions.exists_coprime_in_block, `Loneliness.TwoInsertions.exists_coprime_near_half, `Loneliness.TwoInsertions.AccelerationGap.sandwich, `Loneliness.TwoInsertions.AccelerationGap.twice_mul_le, `Loneliness.TwoInsertions.AccelerationGap.accelerated_cell, `Loneliness.TwoInsertions.acceleration_cell_bounds, `Loneliness.TwoInsertions.accelerated_speed_good, `Loneliness.TwoInsertions.acceleratedBase_good, `Loneliness.TwoInsertions.goddyn_wong_two_insertions, `Loneliness.TwoInsertions.goddyn_wong_insertion_value, `Loneliness.TwoInsertions.dilated_goddyn_wong_insertion_value, `Loneliness.TwoInsertions.three_speed_interval_upper, `Loneliness.TwoInsertions.three_speed_interval_obstruction, `Loneliness.TwoInsertions.five_speed_outside_witness]
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
