#!/usr/bin/env python3
"""Complete raw ConstantInfo occurrence coverage beside the frozen auditors.

Run the generated audit under lean -t0. Its legacy root requests private data
throughout both modern and legacy imports. Every reachable raw proof variant
contributes to a closed dependency graph. Every body in a differing theorem
family is checked by the kernel under a fresh name; only that name changes.
"""
from __future__ import annotations
from collections import Counter
import json
import re

MARKER = "RAW-OCCURRENCE-JSON "
ALLOWED = ("propext", "Classical.choice", "Quot.sound")
KINDS = {"axiom", "definition", "theorem", "opaque", "quotient",
         "constructor", "recursor", "inductive"}
MODULE = re.compile(r"[A-Za-z_][A-Za-z0-9_]*(?:\.[A-Za-z_][A-Za-z0-9_]*)*")
FLAVORS = {"extension", "all_owned"}


def require(condition, message):
    if not condition:
        raise ValueError(message)


def _configuration(modules, modern, flavor, legacy_prefixes):
    require(flavor in FLAVORS, "Unknown base audit flavor")
    require(modules and len(modules) == len(set(modules)), "Duplicate or empty module inventory")
    require(all(isinstance(m, str) and MODULE.fullmatch(m) for m in modules),
            "Unsupported module name")
    require(set(modern) == set(modules) and all(type(v) is bool for v in modern.values()),
            "Incomplete exact modern-module map")
    require(all(isinstance(p, str) and MODULE.fullmatch(p[:-1] if p.endswith(".") else p)
                for p in legacy_prefixes),
            "Invalid legacy ownership prefix")
    if flavor == "extension":
        require(all(modern.values()) and not legacy_prefixes,
                "The modern extension auditor has no legacy ownership fallback")


def augment_source(base_source, modules, modern, *, flavor, legacy_prefixes=()):
    """Append the raw audit without changing the caller's resource options.

    The extension mode replaces its old name-only duplicate/owner rejection
    with occurrence checks and later canonical-view validation. Its audit root
    uses legacy import semantics so foreign private data is complete. The
    project module-format checks and all other base audit checks are retained.
    """
    _configuration(modules, modern, flavor, legacy_prefixes)
    source = base_source
    if flavor == "extension":
        require(source.lstrip().startswith("module\n"), "Expected modern extension audit")
        guards = '''        unless ownerOf name == moduleName do
          throwError "Serialized declaration has another owner: {moduleName}: {name}"
        if rawNames.contains name then
          throwError "Repeated serialized owned declaration: {name}"
'''
        require(source.count(guards) == 1, "Frozen extension raw-name template changed")
        source = source.replace(guards, "")
        require(source.startswith("module\n"), "Frozen extension module header changed")
        source = source[len("module\n"):]
        for module in sorted(modules):
            old_import = "import all " + module + "\n"
            require(source.count(old_import) == 1, "Frozen extension project import changed")
            source = source.replace(old_import, "import " + module + "\n")
        mode_guard = '''  unless env.header.isModule do
    throwError "Owned-extension audit must use modern module mode"
'''
        require(source.count(mode_guard) == 1, "Frozen extension root-mode guard changed")
        source = source.replace(mode_guard, '''  if env.header.isModule then
    throwError "Complete raw audit requires legacy root import semantics"
''')
        anchor = "import Lean.Data.Json\n"
        require(source.count(anchor) == 1, "Frozen extension JSON import changed")
        source = source.replace(anchor, anchor + "import Lean.Util.FoldConsts\n")
    else:
        require(not source.lstrip().startswith("module\n"), "Expected legacy all-owned audit")
        anchor = "import Lean.Data.Json\n"
        require(source.count(anchor) == 1, "Frozen all-owned import template changed")
        source = source.replace(anchor, anchor + "import Lean.Util.FoldConsts\n")
    strings = lambda items: ", ".join(json.dumps(item) for item in items)
    suffix = LEAN_SUFFIX.replace("__OWNED__", strings(sorted(modules)))
    suffix = suffix.replace("__MODERN__", ", ".join(
        "(" + json.dumps(module) + ", " + str(modern[module]).lower() + ")"
        for module in sorted(modules)))
    suffix = suffix.replace("__PREFIXES__", strings(legacy_prefixes))
    suffix = suffix.replace("__STRICT__", str(flavor == "extension").lower())
    return source + "\n" + suffix


def records(text, marker):
    return [json.loads(line.split(marker, 1)[1]) for line in text.splitlines() if marker in line]


def _integer(value, label):
    require(type(value) is int and value >= 0, "Invalid nonnegative integer: " + label)
    return value


def _unique_rows(rows, key, label):
    result = {row[key]: row for row in rows}
    require(len(result) == len(rows), "Repeated " + label)
    return result


def _dependencies(row, ids, label):
    values = row["dependencies"]
    require(isinstance(values, list), "Invalid dependency list: " + label)
    for value in values:
        _integer(value, label)
        require(value in ids, "Unresolved dependency: " + label)
    require(len(values) == len(set(values)) and
            _integer(row["dependency_count"], label) == len(values),
            "Dependency inventory differs: " + label)
    return values


def validate_graph(text, modules, modern, base_records, *, flavor, legacy_prefixes=()):
    """Validate exact raw occurrences and the closed union-of-variants graph."""
    _configuration(modules, modern, flavor, legacy_prefixes)
    rows = records(text, MARKER)
    tags = {tag: [] for tag in ("kernel_negative_control", "scanned_module",
            "variant_index", "occurrence", "roots", "node", "passed")}
    for row in rows:
        require(isinstance(row, dict) and row.get("tag") in tags,
                "Unexpected raw occurrence audit record")
        tags[row["tag"]].append(row)
    require(len(tags["kernel_negative_control"]) == len(tags["roots"]) ==
            len(tags["passed"]) == 1, "Missing unique complete raw audit result")
    require(tags["kernel_negative_control"][0] == {
        "tag": "kernel_negative_control", "rejected": True, "trust_level": 0},
        "Checked-kernel negative control was not rejected at zero trust")
    require(tags["kernel_negative_control"][0]["rejected"] is True
            and type(tags["kernel_negative_control"][0]["trust_level"]) is int,
            "Invalid checked-kernel negative-control types")
    base_modules = _unique_rows([r for r in base_records if r["tag"] == "module"],
                                "module", "base module")
    declarations = _unique_rows([r for r in base_records if r["tag"] == "declaration"],
                                "name", "base declaration")
    require(set(base_modules) == set(modules), "Base module scope differs")
    scanned = _unique_rows(tags["scanned_module"], "module", "scanned module")
    require(set(modules) <= set(scanned), "Owned module omitted from raw scan")
    for module, row in scanned.items():
        require(isinstance(module, str) and MODULE.fullmatch(module)
                and set(row) == {"tag", "module", "modern", "has_data", "import_all", "raw_count"}
                and type(row["modern"]) is bool and row["has_data"] is True
                and row["import_all"] is True, "Incomplete raw private scan: " + module)
        _integer(row["raw_count"], module)
        require(not (module == "Conjectures" or module.startswith("Conjectures.")
                     or module == "Solitaire" or module.startswith("Solitaire."))
                or module in base_modules, "Unregistered project module in raw scan")
        if module in base_modules:
            base = base_modules[module]
            require(row["modern"] is modern[module] and base["modern"] is modern[module]
                    and row["raw_count"] == len(base["names"]),
                    "Owned raw scan differs from base census: " + module)
    indexed = _unique_rows(tags["variant_index"], "id", "raw variant index")
    require(set(indexed) == set(range(len(indexed))), "Variant IDs are not exact contiguous integers")
    for index, row in indexed.items():
        _integer(index, "variant ID")
        require(set(row) == {"tag", "id", "module", "ordinal", "name", "header_equal", "kind"}
                and row["header_equal"] is True and row["kind"] == "theorem"
                and row["module"] in scanned and isinstance(row["name"], str),
                "Invalid raw variant header/index")
        require(_integer(row["ordinal"], "raw ordinal") < scanned[row["module"]]["raw_count"],
                "Raw variant ordinal is outside its module")
    require(len({(r["module"], r["ordinal"]) for r in indexed.values()}) == len(indexed),
            "Multiple variants claim one raw occurrence")
    indexed_by_name = {}
    for index in sorted(indexed):
        indexed_by_name.setdefault(indexed[index]["name"], []).append(index)
    expected_occurrences = {(module, ordinal): name
        for module, row in base_modules.items() for ordinal, name in enumerate(row["names"])}
    occurrences = _unique_rows(
        [{**row, "_key": (row["module"], row["ordinal"])} for row in tags["occurrence"]],
        "_key", "owned raw occurrence")
    require(set(occurrences) == set(expected_occurrences),
            "Missing, extra or repeated owned raw occurrence")
    visible_represented = set()
    owned_variant_ids = set()
    for key, enriched in occurrences.items():
        row = {k: v for k, v in enriched.items() if k != "_key"}
        module, ordinal = key
        _integer(ordinal, "owned occurrence ordinal")
        name = expected_occurrences[key]
        require(set(row) == {"tag", "module", "ordinal", "name", "owner", "kind",
                "private_user_name", "constant_info_equal", "header_equal", "variant"}
                and row["name"] == name and name in declarations,
                "Owned occurrence identity differs")
        declaration = declarations[name]
        require(row["owner"] == declaration["owner"] and row["kind"] == declaration["kind"]
                and row["private_user_name"] == declaration["private_user_name"]
                and row["header_equal"] is True and type(row["constant_info_equal"]) is bool,
                "Raw occurrence header/kind/owner differs")
        if flavor == "extension":
            require(row["owner"] in base_modules
                    and name in base_modules[row["owner"]]["names"],
                    "Canonical raw owner is outside the exact owned census")
            require(row["private_user_name"] is None or row["owner"] == module,
                    "Private project occurrence has another owner")
        if row["constant_info_equal"]:
            require(row["variant"] is None, "Identical raw copy has a conflicting variant")
            visible_represented.add(name)
        else:
            variant_id = _integer(row["variant"], "occurrence variant")
            require(variant_id in indexed and row["kind"] == "theorem",
                    "Differing occurrence has no theorem variant")
            variant = indexed[variant_id]
            require((variant["module"], variant["ordinal"], variant["name"]) ==
                    (module, ordinal, name), "Raw occurrence maps to another body")
            owned_variant_ids.add(variant_id)
    require(visible_represented == set(expected_occurrences.values()),
            "A selected owned body has no identical authenticated raw copy")
    require(owned_variant_ids == {i for i, row in indexed.items()
                                  if row["module"] in base_modules},
            "Owned variant index differs from exact raw occurrences")
    nodes = _unique_rows(tags["node"], "id", "graph node")
    require(set(nodes) == set(range(len(nodes))), "Node IDs are not exact contiguous integers")
    names = _unique_rows(tags["node"], "name", "canonical name node")
    root_row = tags["roots"][0]
    require(set(root_row) == {"tag", "names"} and isinstance(root_row["names"], list)
            and len(root_row["names"]) == len(set(root_row["names"]))
            and set(root_row["names"]) == set(declarations),
            "Raw graph roots differ from the complete owned declaration census")
    require([nodes[i]["name"] for i in range(len(root_row["names"]))] == root_row["names"],
            "Root/name IDs disagree")
    reached_variant_ids = set()
    kernel_aliases = set()
    selected_kernel_checks = 0
    selected_locations = set()
    variant_locations = {(row["module"], row["ordinal"]) for row in indexed.values()}
    edges = 0
    axiom_names = set()
    adjacency = {}
    for index, row in nodes.items():
        _integer(index, "node ID")
        require(set(row) == {"tag", "id", "name", "kind", "owner", "dependencies",
                "dependency_count", "expected_variants", "variants",
                "checked_raw_module", "checked_raw_ordinal", "selected_kernel_check"}
                and isinstance(row["name"], str) and isinstance(row["owner"], str)
                and row["kind"] in KINDS,
                "Invalid canonical raw graph node")
        checked_module = row["checked_raw_module"]
        checked_ordinal = _integer(row["checked_raw_ordinal"], "selected raw ordinal")
        require(checked_module in scanned and
                checked_ordinal < scanned[checked_module]["raw_count"],
                "Selected body lacks authenticated raw-copy provenance")
        selected_location = (checked_module, checked_ordinal)
        require(selected_location not in variant_locations
                and selected_location not in selected_locations,
                "Selected raw-copy location is non-identical or reused by another name")
        selected_locations.add(selected_location)
        if checked_module in base_modules:
            occurrence = occurrences[(checked_module, checked_ordinal)]
            require(occurrence["name"] == row["name"]
                    and occurrence["constant_info_equal"] is True,
                    "Selected owned body maps to another raw occurrence")
        if row["name"] in declarations:
            require((row["kind"], row["owner"]) ==
                    (declarations[row["name"]]["kind"], declarations[row["name"]]["owner"]),
                    "Canonical graph node differs from the owned declaration")
        dependencies = _dependencies(row, nodes, row["name"])
        edges += len(dependencies)
        combined = list(dependencies)
        expected = indexed_by_name.get(row["name"], [])
        require(isinstance(row["expected_variants"], list), "Invalid expected variant list")
        for variant_id in row["expected_variants"]:
            _integer(variant_id, "expected variant")
        require(row["expected_variants"] == expected
                and isinstance(row["variants"], list)
                and [v["id"] for v in row["variants"]] == expected,
                "A reachable raw variant is missing or repeated")
        if expected:
            require(row["kind"] == "theorem", "A differing non-theorem body was admitted")
            selected = row["selected_kernel_check"]
            require(isinstance(selected, dict) and set(selected) == {
                    "module", "ordinal", "kernel_alias", "kernel_passed", "alias_exact",
                    "original_environment_unchanged", "trust_level"}
                    and selected["module"] == checked_module
                    and _integer(selected["ordinal"], "selected kernel ordinal") == checked_ordinal
                    and selected["kernel_passed"] is True and selected["alias_exact"] is True
                    and selected["original_environment_unchanged"] is True
                    and type(selected["trust_level"]) is int and selected["trust_level"] == 0,
                    "Selected mixed-family body lacks an exact zero-trust kernel check")
            alias = "RawOccurrenceSelectedKernelCheck." + str(index)
            require(selected["kernel_alias"] == alias and alias not in kernel_aliases
                    and alias not in names and alias not in declarations,
                    "Selected kernel alias is not fresh or uniquely bound")
            kernel_aliases.add(alias)
            selected_kernel_checks += 1
        else:
            require(row["selected_kernel_check"] is None,
                    "A body without differing variants has an unexpected selected check")
        for variant in row["variants"]:
            variant_id = _integer(variant["id"], "reachable variant")
            _integer(variant["ordinal"], "reachable variant ordinal")
            expected_row = indexed[variant_id]
            require(set(variant) == {"id", "module", "ordinal", "dependencies",
                    "dependency_count", "kernel_alias", "kernel_passed", "alias_exact",
                    "original_environment_unchanged", "trust_level"}
                    and variant["module"] == expected_row["module"]
                    and variant["ordinal"] == expected_row["ordinal"]
                    and variant["kernel_passed"] is True and variant["alias_exact"] is True
                    and variant["original_environment_unchanged"] is True
                    and type(variant["trust_level"]) is int and variant["trust_level"] == 0,
                    "Raw body lacks an exact zero-trust kernel check")
            alias = "RawOccurrenceKernelCheck." + str(variant_id)
            require(variant["kernel_alias"] == alias and alias not in kernel_aliases
                    and alias not in names and alias not in declarations,
                    "Raw kernel alias is not fresh or uniquely bound")
            kernel_aliases.add(alias)
            reached_variant_ids.add(variant_id)
            variant_dependencies = _dependencies(variant, nodes, alias)
            combined.extend(variant_dependencies)
            edges += len(variant_dependencies)
        adjacency[index] = combined
        if row["kind"] == "axiom":
            require(row["name"] in ALLOWED, "Unapproved direct raw-graph axiom: " + row["name"])
            axiom_names.add(row["name"])
    expected_reached = {i for i, row in indexed.items() if row["name"] in names}
    require(reached_variant_ids == expected_reached, "Incomplete reachable raw-body coverage")
    visited, pending = set(), list(range(len(root_row["names"])))
    while pending:
        index = pending.pop()
        if index in visited:
            continue
        visited.add(index)
        pending.extend(adjacency[index])
    require(visited == set(nodes), "Raw graph contains unreachable or unexpanded nodes")
    summary = tags["passed"][0]
    for key in ("scanned_modules", "serialized_constants", "indexed_variants",
                "owned_occurrences", "roots", "nodes", "edges", "kernel_checks",
                "selected_kernel_checks", "pending",
                "trust_level"):
        _integer(summary.get(key), "summary " + key)
    require(type(summary.get("strict_project_private_ownership")) is bool,
            "Invalid private ownership policy flag")
    require(summary.get("audit_root_modern") is False,
            "Complete private scan did not use legacy root import semantics")
    require(isinstance(summary.get("axioms"), list)
            and len(summary["axioms"]) == len(set(summary["axioms"]))
            and set(summary["axioms"]) == axiom_names, "Raw graph axiom inventory differs")
    expected_summary = {"tag": "passed", "scanned_modules": len(scanned),
        "serialized_constants": sum(row["raw_count"] for row in scanned.values()),
        "indexed_variants": len(indexed), "owned_occurrences": len(occurrences),
        "roots": len(root_row["names"]), "nodes": len(nodes), "edges": edges,
        "kernel_checks": len(reached_variant_ids) + selected_kernel_checks,
        "selected_kernel_checks": selected_kernel_checks, "pending": 0,
        "strict_project_private_ownership": flavor == "extension",
        "audit_root_modern": False,
        "axioms": summary["axioms"], "trust_level": 0}
    require(summary == expected_summary and type(summary["trust_level"]) is int,
            "Raw graph completion summary differs")
    return {"summary": summary, "scanned_modules": scanned,
        "variant_index": indexed, "serialized_occurrences": [
            {k: v for k, v in row.items() if k != "_key"}
            for _, row in sorted(occurrences.items())],
        "roots": root_row["names"], "nodes": nodes,
        "all_serialized_occurrences_audited": True,
        "all_reachable_raw_variants_audited": True,
        "all_nonidentical_raw_theorems_kernel_checked": True,
        "all_mixed_family_selected_theorems_kernel_checked": True,
        "foreign_raw_variants_included": True, "axiom_cache_bypassed": True,
        "checked_kernel_negative_control_rejected": True}


def validate_extension_log(text, imported_modules, owned_modules, required_by_module):
    import audit_lean_owned_extension as base
    require(set(imported_modules) == set(owned_modules),
            "The raw-graph adapter requires complete project ownership")
    base_rows = records(text, base.MARKER)
    modern = {module: True for module in owned_modules}
    graph = validate_graph(text, owned_modules, modern, base_rows, flavor="extension")
    declarations = {row["name"]: row for row in base_rows if row["tag"] == "declaration"}
    normalized = []
    original_modules = {}
    for row in base_rows:
        if row["tag"] == "module":
            original_modules[row["module"]] = row
            row = {**row, "names": [name for name in row["names"]
                if declarations[name]["owner"] == row["module"]]}
        normalized.append(base.MARKER + json.dumps(row, sort_keys=True))
    result = base.validate_log("\n".join(normalized), imported_modules, owned_modules,
                               required_by_module)
    result["owned_modules"] = original_modules
    result["raw_occurrence_graph"] = graph
    result["all_serialized_occurrences_audited"] = True
    result["serialized_occurrence_count"] = graph["summary"]["owned_occurrences"]
    result["duplicate_serialized_occurrence_count"] = (
        graph["summary"]["owned_occurrences"] - len({
            row["name"] for row in graph["serialized_occurrences"]}))
    return result


def validate_all_owned_log(text, spec, modern):
    import audit_lean_all_owned as base
    result = base.validate_log(text, spec, modern)
    graph = validate_graph(text, spec["modules"], modern, records(text, base.MARKER),
                           flavor="all_owned", legacy_prefixes=spec["legacy_prefixes"])
    result["raw_occurrence_graph"] = graph
    result["all_serialized_occurrences_audited"] = True
    result["serialized_occurrence_count"] = graph["summary"]["owned_occurrences"]
    return result


LEAN_SUFFIX = r'''
private structure RawOccurrenceVariant where
  id : Nat
  moduleName : String
  ordinal : Nat
  info : Lean.ConstantInfo

open Lean Elab Command in
run_cmd do
  let ownedModules : Array String := #[__OWNED__]
  let modernModules : Array (String × Bool) := #[__MODERN__]
  let legacyPrefixes : Array String := #[__PREFIXES__]
  let strictOwnership := __STRICT__
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
'''

