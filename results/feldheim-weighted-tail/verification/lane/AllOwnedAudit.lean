import Conjectures.FeldheimWeightedTail
import Conjectures.FeldheimWeightedTailAnalysis
import Conjectures.FeldheimWeightedTailAverage
import Conjectures.FeldheimWeightedTailBasic
import Conjectures.FeldheimWeightedTailConvex
import Conjectures.FeldheimWeightedTailLaw
import Conjectures.FeldheimWeightedTailLimits
import Conjectures.FeldheimWeightedTailOscillation
import Conjectures.FeldheimWeightedTailProbability
import Conjectures.FeldheimWeightedTailReduction
import Conjectures.FeldheimWeightedTailStieltjes
import Conjectures.FeldheimWeightedTailStieltjesGrid
import Conjectures.FeldheimWeightedTailStieltjesLimit
import Conjectures.FeldheimWeightedTailWindows
import Conjectures.FeldheimWeightedTailWindowsConvex
import Conjectures.FeldheimWeightedTailWindowsInverse
import Conjectures.FeldheimWeightedTailWindowsSequence
import Conjectures.FeldheimWeightedTailWrightChord
import Conjectures.FeldheimWeightedTailWrightIntegral
import Conjectures.FeldheimWeightedTailWrightUnit
import Lean.Util.CollectAxioms
import Lean.PrivateName
import Lean.Elab.Command
import Lean.Data.Json

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open Lean Elab Command in
run_cmd do
  let expectedModules : Array String := #["Conjectures.FeldheimWeightedTail", "Conjectures.FeldheimWeightedTailAnalysis", "Conjectures.FeldheimWeightedTailAverage", "Conjectures.FeldheimWeightedTailBasic", "Conjectures.FeldheimWeightedTailConvex", "Conjectures.FeldheimWeightedTailLaw", "Conjectures.FeldheimWeightedTailLimits", "Conjectures.FeldheimWeightedTailOscillation", "Conjectures.FeldheimWeightedTailProbability", "Conjectures.FeldheimWeightedTailReduction", "Conjectures.FeldheimWeightedTailStieltjes", "Conjectures.FeldheimWeightedTailStieltjesGrid", "Conjectures.FeldheimWeightedTailStieltjesLimit", "Conjectures.FeldheimWeightedTailWindows", "Conjectures.FeldheimWeightedTailWindowsConvex", "Conjectures.FeldheimWeightedTailWindowsInverse", "Conjectures.FeldheimWeightedTailWindowsSequence", "Conjectures.FeldheimWeightedTailWrightChord", "Conjectures.FeldheimWeightedTailWrightIntegral", "Conjectures.FeldheimWeightedTailWrightUnit"]
  let required : Array Name := #[`Conjectures.FeldheimWeightedTail.wright_unit_integral_le, `Conjectures.FeldheimWeightedTail.wright_unit_le, `Conjectures.FeldheimWeightedTail.wright_chord_le, `Conjectures.FeldheimWeightedTail.monotone_wright_chordBoundOn, `Conjectures.FeldheimWeightedTail.exists_affine_minorant_of_chord, `Conjectures.FeldheimWeightedTail.convexMinorant_convex, `Conjectures.FeldheimWeightedTail.convexMinorant_approx, `Conjectures.FeldheimWeightedTail.convex_hazard_windows, `Conjectures.FeldheimWeightedTail.window_inverse_levels, `Conjectures.FeldheimWeightedTail.window_exists_balanced_levels, `Conjectures.FeldheimWeightedTail.window_exists_support, `Conjectures.FeldheimWeightedTail.monotone_rectangle_windows, `Conjectures.FeldheimWeightedTail.rectangle_window_oscillation, `Conjectures.FeldheimWeightedTail.weighted_window_estimates, `Conjectures.FeldheimWeightedTail.survival_right_continuous, `Conjectures.FeldheimWeightedTail.logTail_tendsto_atTop, `Conjectures.FeldheimWeightedTail.rectangleBound_of_probability_bound, `Conjectures.FeldheimWeightedTail.weightedTail_eq_integral, `Conjectures.FeldheimWeightedTail.inverse_survival_integrableOn, `Conjectures.FeldheimWeightedTail.tailRatio_lower_integral, `Conjectures.FeldheimWeightedTail.limsup_ofReal_eq_top_of_unbounded, `Conjectures.FeldheimWeightedTail.real_tail_positive_iff_not_bounded, `Conjectures.FeldheimWeightedTail.not_compactly_supported_iff_not_bounded, `Conjectures.FeldheimWeightedTail.tailRatio_map, `Conjectures.FeldheimWeightedTail.exists_large_tailRatio_of_log_integral, `Conjectures.FeldheimWeightedTail.log_tail_increment_le_inverse_tail_integral, `Conjectures.FeldheimWeightedTail.tailRatio_arbitrarily_large, `Conjectures.FeldheimWeightedTail.tailRatio_limsup_eq_top, `Conjectures.FeldheimWeightedTail.independent_tail_limsup, `Conjectures.FeldheimWeightedTail.feldheim_feldheim_conjecture]
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
