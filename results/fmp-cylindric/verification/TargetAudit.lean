import Conjectures.FMPCylindric
import Lean.Util.CollectAxioms
import Lean.Elab.Command

open Lean Elab Command in
run_cmd do
  let required : Array Name := #[`Conjectures.FMPCylindric.edge_exact, `Conjectures.FMPCylindric.cell_injective, `Conjectures.FMPCylindric.cell_surj, `Conjectures.FMPCylindric.row_seam, `Conjectures.FMPCylindric.outer_partition, `Conjectures.FMPCylindric.inner_partition, `Conjectures.FMPCylindric.inner_le_outer, `Conjectures.FMPCylindric.sourceCpp_eq_cpp, `Conjectures.FMPCylindric.pp_negative_probe, `Conjectures.FMPCylindric.no_nonnegative_source_count_polynomial, `Conjectures.FMPCylindric.edge_full_exact, `Conjectures.FMPCylindric.sourceCppMore_eq_evalCppMore, `Conjectures.FMPCylindric.pp_negative_probeMore, `Conjectures.FMPCylindric.no_nonnegative_full_column_count_polynomial]
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
    if owner == some `Conjectures.FMPCylindric then
      count := count + 1
      if info.isTheorem then thms := thms + 1
      if name.toString.startsWith "_private." then privateCount := privateCount + 1
      if let .axiomInfo _ := info then throwError "Unexpected axiom {name}"
      for ax in ← collectAxioms name do
        unless allowed.contains ax do
          throwError "Unapproved axiom {ax} in {name}"
  if count < 15 ∨ privateCount = 0 then throwError "Incomplete source scope"
  logInfo m!"PASS owned {count}, theorems {thms}, private {privateCount}, endpoints {required.size}"
