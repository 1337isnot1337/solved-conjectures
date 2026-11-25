import Conjectures.CardonZeroSectorSmallDamping
import Lean.Util.CollectAxioms
import Lean.Elab.Command

open Lean Elab Command in
run_cmd do
  let required : Array Name := #[
    `CardonZeroSector.diagonal_add,
    `CardonZeroSector.diagonal_coeff,
    `CardonZeroSector.alpha_pos,
    `CardonZeroSector.exists_nonreal_root,
    `CardonZeroSector.cardon_question_6_1_false,
    `CardonZeroSector.discriminant_limit,
    `CardonZeroSector.discriminant_neg_for_small,
    `CardonZeroSector.fails_to_preserve_sector_for_small,
    `CardonZeroSector.not_reduces_for_small]
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let env ← getEnv
  for n in required do
    unless (← getConstInfo n).isTheorem do
      throwError "Missing theorem endpoint {n}"
  let mut count : Nat := 0
  let mut thms : Nat := 0
  let mut priv : Nat := 0
  for (n, ci) in env.constants.toList do
    let owner := (env.getModuleIdxFor? n |>.bind (env.header.modules[·]?)).map
      (fun mod => mod.module)
    if #[some `Conjectures.CardonZeroSector, some `Conjectures.CardonZeroSectorAnalysis,
      some `Conjectures.CardonZeroSectorSmallDamping].contains owner then
      count := count + 1
      if ci.isTheorem then thms := thms + 1
      if n.toString.startsWith "_private." then priv := priv + 1
      if let .axiomInfo _ := ci then throwError "Unexpected owned axiom {n}"
      for ax in ← collectAxioms n do
        unless allowed.contains ax do throwError "Unapproved axiom {ax} in {n}"
  if count < required.size ∨ thms < required.size then throwError "Incomplete owner coverage"
  logInfo m!"PASS owned {count}, theorems {thms}, private {priv}, endpoints {required.size}"
