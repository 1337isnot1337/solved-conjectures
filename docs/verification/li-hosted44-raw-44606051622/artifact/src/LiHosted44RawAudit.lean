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
import Lean.Util.FoldConsts

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


private structure RawOccurrenceVariant where
  id : Nat
  moduleName : String
  ordinal : Nat
  info : Lean.ConstantInfo

open Lean Elab Command in
run_cmd do
  let ownedModules : Array String := #["Conjectures.LiBasic", "Conjectures.LiBridge", "Conjectures.LiChromatic", "Conjectures.LiCoefficientExtraction", "Conjectures.LiCoefficientInterpolation", "Conjectures.LiCompute", "Conjectures.LiConnectedPartitions", "Conjectures.LiCounterexample", "Conjectures.LiDualFull", "Conjectures.LiDualTrunc", "Conjectures.LiEliminate", "Conjectures.LiEmapFinal", "Conjectures.LiEvaluationData", "Conjectures.LiFullCoeff", "Conjectures.LiFullCoeffTrunc", "Conjectures.LiMain", "Conjectures.LiMonomial", "Conjectures.LiNegativeCoefficient", "Conjectures.LiPartitionsCount", "Conjectures.LiPartitionsFinal", "Conjectures.LiPartitionsFinalCore", "Conjectures.LiPartitionsFinalData00", "Conjectures.LiPartitionsFinalData01", "Conjectures.LiPartitionsFinalData02", "Conjectures.LiPartitionsFinalData03", "Conjectures.LiPartitionsFinalData04", "Conjectures.LiPartitionsFinalData05", "Conjectures.LiPartitionsFinalData06", "Conjectures.LiPartitionsFinalData07", "Conjectures.LiPartitionsFinalData08", "Conjectures.LiPartitionsFinalData09", "Conjectures.LiPartitionsFinalData10", "Conjectures.LiPartitionsFinalData11", "Conjectures.LiPartitionsFinalData12", "Conjectures.LiPartitionsFinalData13", "Conjectures.LiPartitionsFinalEnum", "Conjectures.LiPartitionsGraph", "Conjectures.LiSpecFinal", "Conjectures.LiTriples2", "Conjectures.LiTriplesBridge", "Conjectures.LiTriplesFinal", "Conjectures.LiTrunc", "Conjectures.LiWeighted", "Conjectures.LiWeighted2"]
  let modernModules : Array (String × Bool) := #[("Conjectures.LiBasic", false), ("Conjectures.LiBridge", false), ("Conjectures.LiChromatic", false), ("Conjectures.LiCoefficientExtraction", false), ("Conjectures.LiCoefficientInterpolation", false), ("Conjectures.LiCompute", false), ("Conjectures.LiConnectedPartitions", false), ("Conjectures.LiCounterexample", false), ("Conjectures.LiDualFull", false), ("Conjectures.LiDualTrunc", false), ("Conjectures.LiEliminate", false), ("Conjectures.LiEmapFinal", false), ("Conjectures.LiEvaluationData", false), ("Conjectures.LiFullCoeff", false), ("Conjectures.LiFullCoeffTrunc", false), ("Conjectures.LiMain", false), ("Conjectures.LiMonomial", false), ("Conjectures.LiNegativeCoefficient", false), ("Conjectures.LiPartitionsCount", false), ("Conjectures.LiPartitionsFinal", false), ("Conjectures.LiPartitionsFinalCore", false), ("Conjectures.LiPartitionsFinalData00", false), ("Conjectures.LiPartitionsFinalData01", false), ("Conjectures.LiPartitionsFinalData02", false), ("Conjectures.LiPartitionsFinalData03", false), ("Conjectures.LiPartitionsFinalData04", false), ("Conjectures.LiPartitionsFinalData05", false), ("Conjectures.LiPartitionsFinalData06", false), ("Conjectures.LiPartitionsFinalData07", false), ("Conjectures.LiPartitionsFinalData08", false), ("Conjectures.LiPartitionsFinalData09", false), ("Conjectures.LiPartitionsFinalData10", false), ("Conjectures.LiPartitionsFinalData11", false), ("Conjectures.LiPartitionsFinalData12", false), ("Conjectures.LiPartitionsFinalData13", false), ("Conjectures.LiPartitionsFinalEnum", false), ("Conjectures.LiPartitionsGraph", false), ("Conjectures.LiSpecFinal", false), ("Conjectures.LiTriples2", false), ("Conjectures.LiTriplesBridge", false), ("Conjectures.LiTriplesFinal", false), ("Conjectures.LiTrunc", false), ("Conjectures.LiWeighted", false), ("Conjectures.LiWeighted2", false)]
  let legacyPrefixes : Array String := #["Li.", "LiBridge.", "LiCoefficientExtraction.", "LiCompute.", "LiConnectedPartitions.", "LiCounterexample.", "LiElim.", "LiEmap.", "LiEvaluation.", "LiFinal.", "LiFull.", "LiInterpolation.", "LiMonomial.", "LiNegativeCoefficient.", "LiTrunc.", "LiWeighted."]
  let strictOwnership := false
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let env := (← getEnv).setExporting false
  if env.header.isModule then
    throwError "Complete raw occurrence audit requires a legacy root"
  let options ← getOptions
  let kernel := env.toKernelEnv
  unless kernel.header.trustLevel == 0 do
    throwError "Raw occurrence audit requires lean -t0"
  unless env.header.modules.size == env.header.moduleData.size do
    throwError "Raw occurrence import/data sizes differ"
  let emit := fun (record : Json) => liftIO <|
    IO.println s!"RAW-OCCURRENCE-JSON {record.compress}"
  let ownerOf := fun name => match env.getModuleIdxFor? name |>.bind (env.header.modules[·]?) with
    | some item => item.module.toString
    | none => ""
  let kindOf := fun (info : ConstantInfo) => match info with
    | .axiomInfo _ => "axiom"
    | .defnInfo _ => "definition"
    | .thmInfo _ => "theorem"
    | .opaqueInfo _ => "opaque"
    | .quotInfo _ => "quotient"
    | .ctorInfo _ => "constructor"
    | .recInfo _ => "recursor"
    | .inductInfo _ => "inductive"
  let sameHeader := fun (left right : ConstantInfo) =>
    left.name == right.name && left.type == right.type &&
    left.levelParams == right.levelParams &&
    match left, right with
    | .thmInfo a, .thmInfo b => a.all == b.all
    | _, _ => left == right
  let references := fun (info : ConstantInfo) => Id.run do
    let mut names := info.getUsedConstantsAsSet
    match info with
    | .defnInfo value => names := names ++ .ofList value.all
    | .thmInfo value => names := names ++ .ofList value.all
    | .opaqueInfo value => names := names ++ .ofList value.all
    | .inductInfo value => names := names ++ .ofList value.all
    | .ctorInfo value => names := names.insert value.induct
    | .recInfo value =>
        for rule in value.rules do
          names := (names ++ rule.rhs.getUsedConstantsAsSet).insert rule.ctor
    | _ => pure ()
    return names.toArray.qsort Name.lt
  let checkCopy (info : ConstantInfo) (moduleName : String) (fresh : Name) : CommandElabM String := do
    let .thmInfo raw := info
      | throwError "A differing raw declaration is not a theorem"
    unless (kernel.find? fresh).isNone do
      throwError "Raw occurrence kernel alias already exists: {fresh}"
    let renamedTheorem := { raw with name := fresh }
    let checked ← match kernel.addDeclCore (Core.getMaxHeartbeats options).toUSize
        (maxRecDepth.get options).toUSize (.thmDecl renamedTheorem) none with
      | .ok result => pure result
      | .error error =>
          throwError "Raw occurrence kernel check failed for {moduleName}: {raw.name}: {error.toMessageData options}"
    unless checked.find? fresh == some (.thmInfo renamedTheorem) do
      throwError "Raw occurrence kernel check changed the supplied theorem"
    unless (kernel.find? fresh).isNone do
      throwError "Raw occurrence kernel check changed the original environment"
    return fresh.toString
  let badName := `RawOccurrenceKernelCheck.invalid
  unless (kernel.find? badName).isNone do
    throwError "Raw occurrence negative-control name is not fresh"
  let bad : TheoremVal := {
    name := badName
    levelParams := []
    type := mkConst `False
    value := mkConst `True.intro
    all := [badName]
  }
  match kernel.addDeclCore (Core.getMaxHeartbeats options).toUSize
      (maxRecDepth.get options).toUSize (.thmDecl bad) none with
    | .ok _ => throwError "Kernel accepted the ill-typed raw-occurrence negative control"
    | .error _ => pure ()
  emit <| Json.mkObj [
    ("tag", toJson "kernel_negative_control"), ("rejected", toJson true),
    ("trust_level", toJson kernel.header.trustLevel.toNat)]
  let mut variants : NameMap (Array RawOccurrenceVariant) := {}
  let mut checkedSources : NameMap (String × Nat) := {}
  let mut variantCount := 0
  let mut scanCount := 0
  let mut serializedCount := 0
  for h : index in [0:env.header.modules.size] do
    let imported := env.header.modules[index]
    let moduleName := imported.module.toString
    unless imported.hasData && imported.importAll do
      throwError "Raw variant index lacks complete private data: {moduleName}"
    let data := env.header.moduleData[index]!
    unless data.constNames == data.constants.map (·.name) do
      throwError "Raw variant names/constants differ: {moduleName}"
    let mut localNames : NameSet := {}
    for ordinal in [:data.constants.size] do
      let raw := data.constants[ordinal]!
      if localNames.contains raw.name then
        throwError "Repeated raw declaration in one module: {moduleName}: {raw.name}"
      localNames := localNames.insert raw.name
      let some checked := kernel.find? raw.name
        | throwError "Raw variant is absent from the checked environment: {moduleName}: {raw.name}"
      unless sameHeader raw checked do
        throwError "Raw declaration header differs: {moduleName}: {raw.name}"
      if raw == checked && !(checkedSources.find? raw.name).isSome then
        checkedSources := checkedSources.insert raw.name (moduleName, ordinal)
      if raw != checked then
        unless raw.isTheorem && checked.isTheorem do
          throwError "Differing non-theorem raw declaration: {moduleName}: {raw.name}"
        let variant : RawOccurrenceVariant := {
          id := variantCount
          moduleName := moduleName
          ordinal := ordinal
          info := raw
        }
        variants := variants.insert raw.name <|
          (variants.find? raw.name |>.getD #[]).push variant
        emit <| Json.mkObj [
          ("tag", toJson "variant_index"), ("id", toJson variantCount),
          ("module", toJson moduleName), ("ordinal", toJson ordinal),
          ("name", toJson raw.name.toString), ("header_equal", toJson true),
          ("kind", toJson (kindOf raw))]
        variantCount := variantCount + 1
    serializedCount := serializedCount + data.constants.size
    scanCount := scanCount + 1
    emit <| Json.mkObj [
      ("tag", toJson "scanned_module"), ("module", toJson moduleName),
      ("modern", toJson data.isModule), ("has_data", toJson imported.hasData),
      ("import_all", toJson imported.importAll), ("raw_count", toJson data.constants.size)]
  let mut rawNames : NameSet := {}
  let mut visibleRepresented : NameSet := {}
  let mut occurrenceCount := 0
  for h : index in [0:env.header.modules.size] do
    let imported := env.header.modules[index]
    let moduleName := imported.module.toString
    if ownedModules.contains moduleName then
      let data := env.header.moduleData[index]!
      let some (_, expectedModern) := modernModules.find? (fun item => item.1 == moduleName)
        | throwError "Missing owned module format"
      unless data.isModule == expectedModern do
        throwError "Owned raw module format changed: {moduleName}"
      for ordinal in [:data.constants.size] do
        let raw := data.constants[ordinal]!
        let some checked := kernel.find? raw.name
          | throwError "Owned raw occurrence is absent"
        let owner := ownerOf raw.name
        let privateName := privateToUserName? raw.name
        if strictOwnership then
          unless ownedModules.contains owner do
            throwError "Owned raw declaration has an external owner: {raw.name}"
          if privateName.isSome && owner != moduleName then
            throwError "Private project occurrence has another owner: {moduleName}: {raw.name}"
        let equal := raw == checked
        let variantId ← if equal then pure none else do
          let some variant := (variants.find? raw.name |>.getD #[]).find?
              (fun item => item.moduleName == moduleName && item.ordinal == ordinal && item.info == raw)
            | throwError "Differing owned raw occurrence escaped the variant index"
          pure (some variant.id)
        if equal then visibleRepresented := visibleRepresented.insert raw.name
        rawNames := rawNames.insert raw.name
        occurrenceCount := occurrenceCount + 1
        emit <| Json.mkObj [
          ("tag", toJson "occurrence"), ("module", toJson moduleName),
          ("ordinal", toJson ordinal), ("name", toJson raw.name.toString),
          ("owner", toJson owner), ("kind", toJson (kindOf raw)),
          ("private_user_name", toJson (privateName.map (·.toString))),
          ("constant_info_equal", toJson equal), ("header_equal", toJson (sameHeader raw checked)),
          ("variant", toJson variantId)]
  for name in rawNames.toArray do
    unless visibleRepresented.contains name do
      throwError "Selected owned body has no identical authenticated raw occurrence: {name}"
  let mut roots : NameSet := rawNames
  for (name, _) in env.constants.toList do
    if ownedModules.contains (ownerOf name) ||
        legacyPrefixes.any (fun prefixText => (privateToUserName name).toString.startsWith prefixText) then
      roots := roots.insert name
  let mut pending := roots.toArray.qsort Name.lt
  let rootCount := pending.size
  let mut ids : NameMap Nat := {}
  for index in [:pending.size] do ids := ids.insert pending[index]! index
  emit <| Json.mkObj [
    ("tag", toJson "roots"), ("names", toJson (pending.map (·.toString)))]
  let mut cursor := 0
  let mut edgeCount := 0
  let mut kernelChecks := 0
  let mut selectedKernelChecks := 0
  let mut reachedAxioms : NameSet := {}
  while cursor < pending.size do
    let name := pending[cursor]!
    let some checked := kernel.find? name
      | throwError "Raw dependency graph has an unresolved constant: {name}"
    let some (checkedModule, checkedOrdinal) := checkedSources.find? name
      | throwError "Selected dependency body has no identical raw copy: {name}"
    if let .axiomInfo _ := checked then
      unless allowed.contains name do
        throwError "Unapproved raw dependency axiom: {name}"
      reachedAxioms := reachedAxioms.insert name
    let checkedReferences := references checked
    let rawVariants := variants.find? name |>.getD #[]
    let mut allReferences := checkedReferences
    for variant in rawVariants do allReferences := allReferences ++ references variant.info
    for dependency in allReferences do
      unless (ids.find? dependency).isSome do
        ids := ids.insert dependency pending.size
        pending := pending.push dependency
    let checkedIds := checkedReferences.map (fun dependency => (ids.find? dependency).get!)
    edgeCount := edgeCount + checkedIds.size
    let mut selectedCheck := Json.null
    unless rawVariants.isEmpty do
      let fresh ← checkCopy checked checkedModule (Name.num `RawOccurrenceSelectedKernelCheck cursor)
      kernelChecks := kernelChecks + 1
      selectedKernelChecks := selectedKernelChecks + 1
      selectedCheck := Json.mkObj [
        ("module", toJson checkedModule), ("ordinal", toJson checkedOrdinal),
        ("kernel_alias", toJson fresh), ("kernel_passed", toJson true),
        ("alias_exact", toJson true), ("original_environment_unchanged", toJson true),
        ("trust_level", toJson 0)]
    let mut bodyRecords : Array Json := #[]
    for variant in rawVariants do
      let dependencyIds := (references variant.info).map (fun dependency => (ids.find? dependency).get!)
      let fresh ← checkCopy variant.info variant.moduleName (Name.num `RawOccurrenceKernelCheck variant.id)
      kernelChecks := kernelChecks + 1
      edgeCount := edgeCount + dependencyIds.size
      bodyRecords := bodyRecords.push <| Json.mkObj [
        ("id", toJson variant.id), ("module", toJson variant.moduleName),
        ("ordinal", toJson variant.ordinal), ("dependencies", toJson dependencyIds),
        ("dependency_count", toJson dependencyIds.size), ("kernel_alias", toJson fresh),
        ("kernel_passed", toJson true), ("alias_exact", toJson true),
        ("original_environment_unchanged", toJson true), ("trust_level", toJson 0)]
    emit <| Json.mkObj [
      ("tag", toJson "node"), ("id", toJson cursor), ("name", toJson name.toString),
      ("kind", toJson (kindOf checked)), ("owner", toJson (ownerOf name)),
      ("checked_raw_module", toJson checkedModule), ("checked_raw_ordinal", toJson checkedOrdinal),
      ("selected_kernel_check", selectedCheck),
      ("dependencies", toJson checkedIds), ("dependency_count", toJson checkedIds.size),
      ("expected_variants", toJson (rawVariants.map (·.id))),
      ("variants", Json.arr bodyRecords)]
    cursor := cursor + 1
  emit <| Json.mkObj [
    ("tag", toJson "passed"), ("scanned_modules", toJson scanCount),
    ("serialized_constants", toJson serializedCount), ("indexed_variants", toJson variantCount),
    ("owned_occurrences", toJson occurrenceCount), ("roots", toJson rootCount),
    ("nodes", toJson pending.size), ("edges", toJson edgeCount),
    ("kernel_checks", toJson kernelChecks), ("selected_kernel_checks", toJson selectedKernelChecks),
    ("pending", toJson (pending.size - cursor)),
    ("strict_project_private_ownership", toJson strictOwnership),
    ("audit_root_modern", toJson env.header.isModule),
    ("axioms", toJson (reachedAxioms.toArray.qsort Name.lt |>.map (·.toString))),
    ("trust_level", toJson kernel.header.trustLevel.toNat)]
