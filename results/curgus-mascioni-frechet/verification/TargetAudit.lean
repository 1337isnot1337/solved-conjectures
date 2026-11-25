import Conjectures.CurgusMascioniQuadratic
import Lean.Util.CollectAxioms
import Lean.Elab.Command

open Lean Elab Command in
run_cmd do
  let required : Array Name := #[
    `CurgusMascioniQuadratic.centeredMatch_exact,
    `CurgusMascioniQuadratic.centeredMatch_le,
    `CurgusMascioniQuadratic.operator_linear_unchanged,
    `CurgusMascioniQuadratic.arbitrary_quadratic_root_bound,
    `CurgusMascioniQuadratic.interval_root_extremizers,
    `CurgusMascioniQuadratic.degree_centered,
    `CurgusMascioniQuadratic.squared_diameter,
    `CurgusMascioniQuadratic.no_isometric_relabelling]
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
    if owner == some `Conjectures.CurgusMascioniQuadratic then
      count := count + 1
      if ci.isTheorem then thms := thms + 1
      if n.toString.startsWith "_private." then priv := priv + 1
      if let .axiomInfo _ := ci then throwError "Unexpected owned axiom {n}"
      for ax in ← collectAxioms n do
        unless allowed.contains ax do throwError "Unapproved axiom {ax} in {n}"
  if count < required.size ∨ thms < required.size then throwError "Incomplete owner coverage"
  logInfo m!"PASS owned {count}, theorems {thms}, private {priv}, endpoints {required.size}"
