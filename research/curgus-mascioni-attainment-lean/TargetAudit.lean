import Conjectures.CurgusMascioniCluster
import Conjectures.CurgusMascioniMatchingCut
import Conjectures.CurgusMascioniLocalPolynomial
import Lean.Util.CollectAxioms
import Lean.Elab.Command

open Lean Elab Command in
run_cmd do
  let required : Array Name := #[
    `CurgusMascioniCluster.distance_subseq,
    `CurgusMascioniCluster.centered_subseq,
    `CurgusMascioniCluster.cluster_subseq,
    `CurgusMascioniMatchingCut.compatible_iff,
    `CurgusMascioniMatchingCut.feasible_iff_separated,
    `CurgusMascioniLocalPolynomial.normalize_product,
    `CurgusMascioniLocalPolynomial.recenter_product,
    `CurgusMascioniLocalPolynomial.coeffTendsto_local_factors,
    `CurgusMascioniLocalPolynomial.coeffTendsto_constantOperator]
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
    if #[some `Conjectures.CurgusMascioniCluster, some `Conjectures.CurgusMascioniMatchingCut,
      some `Conjectures.CurgusMascioniLocalPolynomial].contains owner then
      count := count + 1
      if ci.isTheorem then thms := thms + 1
      if n.toString.startsWith "_private." then priv := priv + 1
      if let .axiomInfo _ := ci then throwError "Unexpected owned axiom {n}"
      for ax in ← collectAxioms n do
        unless allowed.contains ax do throwError "Unapproved axiom {ax} in {n}"
  if count < required.size ∨ thms < required.size then throwError "Incomplete owner coverage"
  logInfo m!"PASS owned {count}, theorems {thms}, private {priv}, endpoints {required.size}"
