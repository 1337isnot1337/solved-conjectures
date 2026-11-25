import Conjectures.MaTangLimsup
import Lean.Util.CollectAxioms
import Lean.Elab.Command

open Lean Elab Command in
run_cmd do
  let exactModules : Array String := #["Conjectures.MaTangCoreBalance", "Conjectures.MaTangCoreIndexed", "Conjectures.MaTangCoreMatrix", "Conjectures.MaTangCoreOccupancy", "Conjectures.MaTangCoreSubspace", "Conjectures.MaTangCoreRank", "Conjectures.MaTangCoreGenerator", "Conjectures.MaTangCoreDecay", "Conjectures.MaTangCoreQuotient", "Conjectures.MaTangCoreLinear", "Conjectures.MaTangCoreEncoding", "Conjectures.MaTangCoreFactor", "Conjectures.MaTangCoreMultiplicity", "Conjectures.MaTangCoreCoupling", "Conjectures.MaTangCoreLowerBound", "Conjectures.MaTangCoreBirthday", "Conjectures.MaTangCoreUpperDyadic", "Conjectures.MaTangCoreUpperDistinct", "Conjectures.MaTangCoreUpperPrefixes", "Conjectures.MaTangCoreUpperShift", "Conjectures.MaTangCoreUpperMoment", "Conjectures.MaTangCoreUpperCollision", "Conjectures.MaTangCoreTranspose", "Conjectures.MaTangCoreDistinct", "Conjectures.MaTangCoreSetCoverage", "Conjectures.MaTangCoreUniformSubset", "Conjectures.MaTangCoreUpperUniform", "Conjectures.MaTangCoreThreshold", "Conjectures.MaTangCoreLeast", "Conjectures.MaTangCoreAllDimensions", "Conjectures.MaTangCoreMixedThreshold", "Conjectures.MaTangLimsup"]
  let required : Array Name := #[
    `MaTangCoreUpperDyadic.initial_bad,
    `MaTangCoreUpperDyadic.child_bad,
    `MaTangCoreUpperDyadic.failure_fraction,
    `MaTangCoreUpperDyadic.good_terminal_is_zero,
    `MaTangCoreUpperDyadic.upper_birthday_budget,
    `MaTangCoreUpperDistinct.distinctWords_seven_eighths,
    `MaTangCoreUpperDistinct.upper_distinct_success_gt_half,
    `MaTangCoreUpperPrefixes.iid_missing_le,
    `MaTangCoreUpperPrefixes.distinct_missing_success,
    `MaTangCoreUpperShift.shift_second_moment,
    `MaTangCoreUpperShift.missingCount_zero_iff,
    `MaTangCoreUpperShift.conditioned_cover_from_initial,
    `MaTangCoreUpperMoment.initial_bound_from_collisions,
    `MaTangCoreUpperCollision.energy_step_sum,
    `MaTangCoreUpperCollision.totalEnergy_bound,
    `MaTangCoreUpperCollision.initial_occupancy_bound,
    `MaTangCoreUpperCollision.conditioned_cover,
    `MaTangCoreUpperUniform.filtered_subset_count,
    `MaTangCoreUpperUniform.coveredB_spec,
    `MaTangCoreUpperUniform.uniform_coverage_gt_half,
    `MaTangCoreThreshold.count_after_prepend,
    `MaTangCoreThreshold.halfCoverage_mono,
    `MaTangCoreLeast.threshold_spec,
    `MaTangCoreLeast.threshold_upper,
    `MaTangCoreLeast.threshold_lower_of_witness,
    `MaTangCoreAllDimensions.all_large_dimensions_below_half,
    `MaTangCoreMixedThreshold.mixed_half_fails,
    `MaTangCoreMixedThreshold.threshold_mixed_lower,
    `MaTangLimsup.maTang_limsup,
    `MaTangLimsup.mixed_normalized_tendsto,
    `MaTangLimsup.mixed_refined_lower]
  for name in required do
    unless (← getConstInfo name).isTheorem do
      throwError "Missing theorem endpoint {name}"
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let env ← getEnv
  let mut total : Nat := 0
  let mut newFound : Nat := 0
  let mut thms : Nat := 0
  let mut priv : Nat := 0
  for (name, info) in env.constants.toList do
    let owner := (env.getModuleIdxFor? name |>.bind (env.header.modules[·]?)).map
      (fun mod => mod.module.toString)
    if (owner.map exactModules.contains).getD false then
      total := total + 1
      if (owner.map (·.startsWith "Conjectures.MaTangCoreUpper")).getD false then
        newFound := newFound + 1
      if info.isTheorem then thms := thms + 1
      if name.toString.startsWith "_private." then priv := priv + 1
      if let .axiomInfo _ := info then throwError "Unexpected project axiom {name}"
      for ax in ← collectAxioms name do
        unless allowed.contains ax do
          throwError "Unapproved axiom {ax} in {name}"
  if total = 0 ∨ newFound < 20 ∨ priv = 0 then throwError "Incomplete audit scope"
  logInfo m!"PASS owned declarations {total}, theorems {thms}, private {priv}, new {newFound}; endpoints {required.size}"

