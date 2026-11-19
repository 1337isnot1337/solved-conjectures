import Conjectures.LiBasic
import Conjectures.LiBridge
import Conjectures.LiChromatic
import Conjectures.LiCoefficientExtraction
import Conjectures.LiCoefficientInterpolation
import Conjectures.LiCompute
import Conjectures.LiConnectedPartitions
import Conjectures.LiCounterexample
import Conjectures.LiDualFull
import Conjectures.LiDualTrunc
import Conjectures.LiEliminate
import Conjectures.LiEmapFinal
import Conjectures.LiEvaluationData
import Conjectures.LiFullCoeff
import Conjectures.LiFullCoeffTrunc
import Conjectures.LiMain
import Conjectures.LiMonomial
import Conjectures.LiNegativeCoefficient
import Conjectures.LiPartitionsCount
import Conjectures.LiPartitionsFinal
import Conjectures.LiPartitionsFinalCore
import Conjectures.LiPartitionsFinalData00
import Conjectures.LiPartitionsFinalData01
import Conjectures.LiPartitionsFinalData02
import Conjectures.LiPartitionsFinalData03
import Conjectures.LiPartitionsFinalData04
import Conjectures.LiPartitionsFinalData05
import Conjectures.LiPartitionsFinalData06
import Conjectures.LiPartitionsFinalData07
import Conjectures.LiPartitionsFinalData08
import Conjectures.LiPartitionsFinalData09
import Conjectures.LiPartitionsFinalData10
import Conjectures.LiPartitionsFinalData11
import Conjectures.LiPartitionsFinalData12
import Conjectures.LiPartitionsFinalData13
import Conjectures.LiPartitionsFinalEnum
import Conjectures.LiPartitionsGraph
import Conjectures.LiSpecFinal
import Conjectures.LiTriples2
import Conjectures.LiTriplesBridge
import Conjectures.LiTriplesFinal
import Conjectures.LiTrunc
import Conjectures.LiWeighted
import Conjectures.LiWeighted2
import Lean.Util.CollectAxioms
import Lean.PrivateName
import Lean.Elab.Command
import Lean.Data.Json

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open Lean Elab Command in
run_cmd do
  let expectedModules : Array String := #["Conjectures.LiBasic", "Conjectures.LiBridge", "Conjectures.LiChromatic", "Conjectures.LiCoefficientExtraction", "Conjectures.LiCoefficientInterpolation", "Conjectures.LiCompute", "Conjectures.LiConnectedPartitions", "Conjectures.LiCounterexample", "Conjectures.LiDualFull", "Conjectures.LiDualTrunc", "Conjectures.LiEliminate", "Conjectures.LiEmapFinal", "Conjectures.LiEvaluationData", "Conjectures.LiFullCoeff", "Conjectures.LiFullCoeffTrunc", "Conjectures.LiMain", "Conjectures.LiMonomial", "Conjectures.LiNegativeCoefficient", "Conjectures.LiPartitionsCount", "Conjectures.LiPartitionsFinal", "Conjectures.LiPartitionsFinalCore", "Conjectures.LiPartitionsFinalData00", "Conjectures.LiPartitionsFinalData01", "Conjectures.LiPartitionsFinalData02", "Conjectures.LiPartitionsFinalData03", "Conjectures.LiPartitionsFinalData04", "Conjectures.LiPartitionsFinalData05", "Conjectures.LiPartitionsFinalData06", "Conjectures.LiPartitionsFinalData07", "Conjectures.LiPartitionsFinalData08", "Conjectures.LiPartitionsFinalData09", "Conjectures.LiPartitionsFinalData10", "Conjectures.LiPartitionsFinalData11", "Conjectures.LiPartitionsFinalData12", "Conjectures.LiPartitionsFinalData13", "Conjectures.LiPartitionsFinalEnum", "Conjectures.LiPartitionsGraph", "Conjectures.LiSpecFinal", "Conjectures.LiTriples2", "Conjectures.LiTriplesBridge", "Conjectures.LiTriplesFinal", "Conjectures.LiTrunc", "Conjectures.LiWeighted", "Conjectures.LiWeighted2"]
  let required : Array Name := #[`Li.LiFinal325.IsMatchingOf.unique, `Li.LiFinal325.b_triple_pairs, `Li.LiFinal325.card_goodTripleData, `Li.LiFinal325.goodTripleData_iff, `Li.LiFinal325.hasPM_iff, `Li.T_isTree, `Li.coeff_eq_29, `Li.full_e2e3_coefficients, `Li.full_e2e3_coefficients_fin, `Li.full_e2e3_coefficients_of_card, `Li.full_li_coefficient, `Li.full_li_coefficient_fin, `Li.full_li_coefficient_of_card, `Li.full_negative_coefficient, `Li.full_negative_coefficient_fin, `Li.full_negative_coefficient_of_card, `Li.leaf_neighbors_zero, `Li.li_coefficient, `Li.not_caterpillar, `Li.not_elementary_positive, `Li.not_elementary_positive_of_card, `Li.not_spider, `Li.specialization_coeff, `LiCoefficientExtraction.aeval_eq_five_terms, `LiCompute.coeff_29, `LiConnectedPartitions.adj_of_reachable_subgraph, `LiConnectedPartitions.connected_partitions_card, `LiConnectedPartitions.cutPartitionEquiv_blocks, `LiCounterexample.all_partition_types, `LiCounterexample.card_connected_partition_types, `LiCounterexample.coefficient_eq, `LiCounterexample.coefficient_positive, `LiCounterexample.component_supports_partition, `LiCounterexample.connectedPartitionType_blocks, `LiCounterexample.counterexample, `LiCounterexample.degree_four_leaf_neighbors, `LiCounterexample.edge_cut_choices_card, `LiCounterexample.no_degree_four_two_leaf_neighbors, `LiCounterexample.suppFinset_connIn, `LiCounterexample.suppFinset_injective, `LiElim.partFunOn_erase, `LiEmap.aeval_esymm_vec, `LiEvaluation.eval_chromPoly, `LiEvaluation.partFun_values, `LiEvaluation.table_correct, `LiFinal.T_hasAllPartitionTypes, `LiFinal.all_partition_types, `LiFinal.card_partitions_31, `LiFinal.certificate_ok, `LiFinal.certificate_parts, `LiFinal.cutGraph_adj_T, `LiFinal.partsAux_31_exact, `LiFinal.partsAux_31_nodup, `LiFinal.sizes_eq_components, `LiFull.aeval_restrict3_fullChromPoly_T, `LiFull.fullChromPolyOn_T_isHomogeneous_31, `LiFull.full_coeff_eq_three_variable_coeff, `LiFull.kill31_fullECoords, `LiFull.killMN_fullECoords, `LiInterpolation.denominators_pos, `LiInterpolation.elementary_eval, `LiInterpolation.eval_elementary_coordinates, `LiInterpolation.matrix_identity, `LiInterpolation.scaled_chromatic_coefficient, `LiInterpolation.scaled_coefficient, `LiMonomial.snd_aeval_of_weighted, `LiNegativeCoefficient.coefficient_eq, `LiNegativeCoefficient.five_coefficients, `LiNegativeCoefficient.three_variable_negative_coefficient, `LiWeighted.weightedHomogeneous_of_aeval, `LiWeighted.weightedHomogeneous_symm]
  let legacyPrefixes : Array String := #["Li.", "LiBridge.", "LiCoefficientExtraction.", "LiCompute.", "LiConnectedPartitions.", "LiCounterexample.", "LiElim.", "LiEmap.", "LiEvaluation.", "LiFinal.", "LiFull.", "LiInterpolation.", "LiMonomial.", "LiNegativeCoefficient.", "LiTrunc.", "LiWeighted."]
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
