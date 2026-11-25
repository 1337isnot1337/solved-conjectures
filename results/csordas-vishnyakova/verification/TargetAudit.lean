import Conjectures.CsordasVishnyakova
import Lean.Util.CollectAxioms
import Lean.Elab.Command

open Lean Elab Command in
run_cmd do
  let required : Array Name := #[`CsordasVishnyakova.phi_entire, `CsordasVishnyakova.phi_real, `CsordasVishnyakova.quartic_alpha_root, `CsordasVishnyakova.test_formula, `CsordasVishnyakova.testCoefficient_nonneg, `CsordasVishnyakova.all_test_coefficients, `CsordasVishnyakova.coefficient_eq_derivative, `CsordasVishnyakova.not_LaguerrePolya, `CsordasVishnyakova.csordasVishnyakova_conj3_6_false]
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let env ← getEnv
  for name in required do
    unless (← getConstInfo name).isTheorem do
      throwError "Missing theorem endpoint {name}"
  let mut count : Nat := 0
  let mut thms : Nat := 0
  let mut privateCount : Nat := 0
  for (name, info) in env.constants.toList do
    let owner := (env.getModuleIdxFor? name |>.bind (env.header.modules[·]?)).map
      (fun mod => mod.module)
    if owner == some `Conjectures.CsordasVishnyakova then
      count := count + 1
      if info.isTheorem then thms := thms + 1
      if name.toString.startsWith "_private." then privateCount := privateCount + 1
      if let .axiomInfo _ := info then throwError "Unexpected axiom {name}"
      for ax in ← collectAxioms name do
        unless allowed.contains ax do
          throwError "Unapproved axiom {ax} in {name}"
  if count < 15 ∨ privateCount = 0 then throwError "Incomplete source scope"
  logInfo m!"PASS owned {count}, theorems {thms}, private {privateCount}, endpoints {required.size}"
