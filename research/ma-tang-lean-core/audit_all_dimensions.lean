import Conjectures.MaTangCoreAllDimensions
import Lean.Util.CollectAxioms
import Lean.Elab.Command
open Lean Elab Command in
run_cmd do
  let names : Array String := #["Conjectures.MaTangCoreBalance", "Conjectures.MaTangCoreIndexed", "Conjectures.MaTangCoreMatrix", "Conjectures.MaTangCoreOccupancy", "Conjectures.MaTangCoreSubspace", "Conjectures.MaTangCoreRank", "Conjectures.MaTangCoreGenerator", "Conjectures.MaTangCoreDecay", "Conjectures.MaTangCoreQuotient", "Conjectures.MaTangCoreLinear", "Conjectures.MaTangCoreEncoding", "Conjectures.MaTangCoreFactor", "Conjectures.MaTangCoreMultiplicity", "Conjectures.MaTangCoreCoupling", "Conjectures.MaTangCoreLowerBound", "Conjectures.MaTangCoreBirthday", "Conjectures.MaTangCoreTranspose", "Conjectures.MaTangCoreDistinct", "Conjectures.MaTangCoreSetCoverage", "Conjectures.MaTangCoreUniformSubset", "Conjectures.MaTangCoreAllDimensions"]
  let required : Array Name := #[`MaTangCoreAllDimensions.all_large_dimensions_below_half,
    `MaTangCoreAllDimensions.uniform_subset_coverage_scaled_all,
    `MaTangCoreAllDimensions.dimensionParameter_bounds,
    `MaTangCoreAllDimensions.envelope_all]
  for name in required do
    unless (← getConstInfo name).isTheorem do
      throwError "Endpoint {name} is not a theorem"
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let env ← getEnv
  let mut total : Nat := 0
  let mut theorems : Nat := 0
  let mut priv : Nat := 0
  let mut newTotal : Nat := 0
  for (name, info) in env.constants.toList do
    let owner := (env.getModuleIdxFor? name |>.bind (env.header.modules[·]?)).map (fun mod => mod.module.toString)
    if (owner.map names.contains).getD false then
      total := total + 1
      if owner == some "Conjectures.MaTangCoreAllDimensions" then
        newTotal := newTotal + 1
      if info.isTheorem then theorems := theorems + 1
      if name.toString.startsWith "_private." then priv := priv + 1
      if let .axiomInfo _ := info then throwError "Project-owned axiom {name}"
      for ax in ← collectAxioms name do
        unless allowed.contains ax do throwError "Unexpected axiom {ax} in {name}"
  if total ≤ 466 ∨ newTotal < 17 ∨ priv = 0 then
    throwError "Insufficient owned scope"
  logInfo m!"PASS all {total} owned declarations, {theorems} theorems, {priv} private, {newTotal} new, four required endpoints"
