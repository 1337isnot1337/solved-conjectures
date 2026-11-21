import Conjectures.CircularIndexAtoms
import Conjectures.CircularIndexBase
import Conjectures.CircularIndexCirculant
import Conjectures.CircularIndexClassArithmetic
import Conjectures.CircularIndexColoring
import Conjectures.CircularIndexConnected
import Conjectures.CircularIndexConnectivity
import Conjectures.CircularIndexConstruction
import Conjectures.CircularIndexCounting
import Conjectures.CircularIndexDegree
import Conjectures.CircularIndexFinite25
import Conjectures.CircularIndexFinite31
import Conjectures.CircularIndexFinite33
import Conjectures.CircularIndexFurther
import Conjectures.CircularIndexFurtherConnected
import Conjectures.CircularIndexOptimality
import Conjectures.CircularIndexReal
import Conjectures.CircularIndexSubgroups
import Conjectures.CircularIndexTheorems
import Lean.Util.CollectAxioms
import Lean.PrivateName
import Lean.Elab.Command
import Lean.Data.Json

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open Lean Elab Command in
run_cmd do
  let expectedModules : Array String := #["Conjectures.CircularIndexAtoms", "Conjectures.CircularIndexBase", "Conjectures.CircularIndexCirculant", "Conjectures.CircularIndexClassArithmetic", "Conjectures.CircularIndexColoring", "Conjectures.CircularIndexConnected", "Conjectures.CircularIndexConnectivity", "Conjectures.CircularIndexConstruction", "Conjectures.CircularIndexCounting", "Conjectures.CircularIndexDegree", "Conjectures.CircularIndexFinite25", "Conjectures.CircularIndexFinite31", "Conjectures.CircularIndexFinite33", "Conjectures.CircularIndexFurther", "Conjectures.CircularIndexFurtherConnected", "Conjectures.CircularIndexOptimality", "Conjectures.CircularIndexReal", "Conjectures.CircularIndexSubgroups", "Conjectures.CircularIndexTheorems"]
  let required : Array Name := #[`CircularIndex.baseLeft_mem, `CircularIndex.baseRight_mem, `CircularIndex.baseVertex_lt_order, `CircularIndex.baseLeft_injective, `CircularIndex.baseRight_injective, `CircularIndex.baseLeft_ne_baseRight, `CircularIndex.base_endpoints_distinct, `CircularIndex.baseEndpoint_injective, `CircularIndex.baseLength_bounds, `CircularIndex.baseLength_allowed, `CircularIndex.baseLength_injective, `CircularIndex.baseLength_surjective, `CircularIndex.base_oriented_difference, `CircularIndex.baseVertex_shift_two_g, `CircularIndex.baseVertex_shift_two_g_succ, `CircularIndex.inverse_three_identity, `CircularIndex.inverse_three, `CircularIndex.order_odd, `CircularIndex.order_not_dvd_three, `CircularIndex.allowedLength_bounds, `CircularIndex.natCast_injective_below, `CircularIndex.length_cast_ne_zero, `CircularIndex.lengthEdge_mem, `CircularIndex.lengthEdge_injective, `CircularIndex.edge_exists_length, `CircularIndex.baseStart_length_pair, `CircularIndex.translatedBaseEdge_eq_lengthEdge, `CircularIndex.translatedBaseEdge_mem, `CircularIndex.translatedBaseEdge_injective, `CircularIndex.translatedBaseEdge_surjective, `CircularIndex.edgeParamMap_bijective, `CircularIndex.card_edges, `CircularIndex.mod_eq_alternatives, `CircularIndex.mod_eq_of_alternatives, `CircularIndex.classIndex_lt, `CircularIndex.classIndex_injective, `CircularIndex.class_shift_one, `CircularIndex.class_shift_two, `CircularIndex.inverse_three_zmod, `CircularIndex.classColor_injective, `CircularIndex.classColor_add_one_shift, `CircularIndex.classColor_add_two_shift, `CircularIndex.baseVertex_cast_shift_two_g, `CircularIndex.baseVertex_cast_shift_two_g_succ, `CircularIndex.common_vertex_not_next_color, `CircularIndex.common_vertex_not_second_color, `CircularIndex.baseEndpoint_mem, `CircularIndex.mem_translatedBaseEdge_iff, `CircularIndex.common_vertex_same_color_params, `CircularIndex.paramColor_separated, `CircularIndex.circulant_has_integerCircularEdgeColoring, `CircularIndex.circulant_regular_and_exact_index, `CircularIndex.graph25_regular_and_exact_index, `CircularIndex.edgeEndpoint_mem, `CircularIndex.edgeEndpoint_injective, `CircularIndex.matching_card_bound, `CircularIndex.same_window_close, `CircularIndex.IntegerCircularEdgeColoring.window_matching, `CircularIndex.IntegerCircularEdgeColoring.window_card_bound, `CircularIndex.IntegerCircularEdgeColoring.counting_bound, `CircularIndex.circulant_integerColoring_lower_bound, `CircularIndex.translate_adj_iff, `CircularIndex.degree_eq_degree_zero, `CircularIndex.circulant_regular, `CircularIndex.circulant_degree, `CircularIndex.translatedEdge25_mem, `CircularIndex.base25_shift_injective, `CircularIndex.translatedEdge25_injective, `CircularIndex.edgeParamMap25_injective, `CircularIndex.card_edges25, `CircularIndex.base25_shift_color_separation, `CircularIndex.tripleVal25_add, `CircularIndex.classColor25_difference, `CircularIndex.translated_common_vertex25, `CircularIndex.paramColor25_separated, `CircularIndex.graph25_regular, `CircularIndex.graph25_circularChromaticIndex, `CircularIndex.translatedEdge31_mem, `CircularIndex.base31_shift_injective, `CircularIndex.translatedEdge31_injective, `CircularIndex.edgeParamMap31_injective, `CircularIndex.card_edges31, `CircularIndex.base31_shift_color_separation, `CircularIndex.tripleVal31_add, `CircularIndex.classColor31_difference, `CircularIndex.translated_common_vertex31, `CircularIndex.paramColor31_separated, `CircularIndex.graph31_regular, `CircularIndex.graph31_circularChromaticIndex, `CircularIndex.translatedEdge33_mem, `CircularIndex.base33_shift_injective, `CircularIndex.translatedEdge33_injective, `CircularIndex.edgeParamMap33_injective, `CircularIndex.card_edges33, `CircularIndex.base33_shift_color_separation, `CircularIndex.tripleVal33_add, `CircularIndex.classColor33_difference, `CircularIndex.translated_common_vertex33, `CircularIndex.paramColor33_separated, `CircularIndex.graph33_regular, `CircularIndex.graph33_circularChromaticIndex, `CircularIndex.graph31_regular_and_exact_index, `CircularIndex.graph33_regular_and_exact_index, `CircularIndex.floor_gap_bounds, `CircularIndex.quantized_ordered_separation, `CircularIndex.ceil_scaled_radius_ge, `CircularIndex.RealCircularEdgeColoring.counting_bound, `CircularIndex.circulant_realColoring_lower_bound, `CircularIndex.circulant_circularChromaticIndex, `CircularIndex.circulant_circularChromaticIndex_closed_form, `CircularIndex.zmod_val_sub_wrap, `CircularIndex.integer_gap_bounds, `CircularIndex.real_gap_bounds, `CircularIndex.zmod_real_gap_bounds, `CircularIndex.circularChromaticIndex_le_of_coloring, `CircularIndex.circulant_circularChromaticIndex_upper_bound, `CircularIndex.Connectivity.disjoint_boundary, `CircularIndex.Connectivity.disjoint_exterior, `CircularIndex.Connectivity.boundary_disjoint_exterior, `CircularIndex.Connectivity.exterior_antitone, `CircularIndex.Connectivity.subset_exterior_exterior, `CircularIndex.Connectivity.boundary_exterior_subset, `CircularIndex.Connectivity.card_partition, `CircularIndex.Connectivity.boundary_inter_subset, `CircularIndex.Connectivity.card_boundary_inter_le, `CircularIndex.Connectivity.fragment_of_boundary_le, `CircularIndex.Connectivity.fragment_exterior, `CircularIndex.Connectivity.fragment_boundary_exterior, `CircularIndex.Connectivity.atom_card_le_exterior, `CircularIndex.Connectivity.atoms_eq_of_inter_nonempty, `CircularIndex.Connectivity.atoms_disjoint_or_eq, `CircularIndex.Connectivity.exists_atom_of_fragment, `CircularIndex.Connectivity.exists_minimal_fragment, `CircularIndex.Connectivity.translate_nonempty, `CircularIndex.Connectivity.boundary_translate, `CircularIndex.Connectivity.exterior_translate, `CircularIndex.Connectivity.fragment_translate, `CircularIndex.Connectivity.atom_translate, `CircularIndex.Connectivity.atom_translate_eq, `CircularIndex.Connectivity.exists_subgroup_atom, `CircularIndex.Connectivity.boundary_lower_of_subgroup_dominates, `CircularIndex.Connectivity.induced_preconnected_of_boundary_lower, `CircularIndex.Connectivity.induced_connected_of_boundary_lower, `CircularIndex.Connectivity.cyclic_subgroup_card_product, `CircularIndex.Connectivity.cyclic_subgroup_index_pos, `CircularIndex.Connectivity.cyclic_subgroup_card_ge_five, `CircularIndex.Connectivity.cyclic_subgroup_index_cast_mem, `CircularIndex.Connectivity.cyclic_subgroup_remainder_mem, `CircularIndex.Connectivity.subgroup_dominates_of_coset_steps, `CircularIndex.graph_translationInvariant, `CircularIndex.circulant_subgroup_dominates, `CircularIndex.boundary_singleton_card, `CircularIndex.circulant_boundary_lower, `CircularIndex.circulant_vertex_connected, `CircularIndex.graph25_translationInvariant, `CircularIndex.graph25_subgroup_dominates, `CircularIndex.graph25_boundary_lower, `CircularIndex.graph25_vertex_connected, `CircularIndex.theorem_one, `CircularIndex.theorem_two, `CircularIndex.graph31_translationInvariant, `CircularIndex.graph31_subgroup_dominates, `CircularIndex.graph31_boundary_lower, `CircularIndex.graph31_vertex_connected, `CircularIndex.graph33_translationInvariant, `CircularIndex.factor_thirty_three, `CircularIndex.graph33_subgroup_dominates, `CircularIndex.graph33_boundary_lower, `CircularIndex.graph33_vertex_connected, `CircularIndex.graph31_complete, `CircularIndex.graph33_complete]
  let legacyPrefixes : Array String := #["CircularIndex."]
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
