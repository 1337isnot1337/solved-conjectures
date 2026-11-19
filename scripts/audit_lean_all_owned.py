#!/usr/bin/env python3
"""Generate and validate an all-declaration audit of a frozen accepted closure.

This candidate leaves accepted roots and the historical audit unchanged. It
checks the pinned importer's private module inventory, then every owned
ConstantInfo. Fresh source builds and exact stock replay are separate gates.
"""
from __future__ import annotations

from collections import Counter
import json
import re

from replay_lean import MODULE
from build_lean_parallel import scope_plan

ALLOWED = ("propext", "Classical.choice", "Quot.sound")
KINDS = {"axiom", "definition", "theorem", "opaque", "quotient",
         "constructor", "recursor", "inductive"}
MARKER = "ALL-OWNED-JSON "


def _names(body):
    pattern = chr(96) + r"([A-Za-z0-9_]+(?:\.[A-Za-z0-9_]+)*)"
    tokens = re.findall(pattern, body)
    remainder = re.sub(pattern, "", body)
    if re.sub(r"[\s,]", "", remainder) or len(tokens) != len(set(tokens)):
        raise ValueError("Unsupported or duplicate required declaration name")
    return tokens


def accepted_spec(repo):
    script = (repo / "scripts/verify_lean.sh").read_text(encoding="utf-8")
    registries = re.findall(r"^modules=\(\n([\s\S]*?)^\)$", script, re.MULTILINE)
    if len(registries) != 1:
        raise ValueError("Expected exactly one explicit accepted module registry")
    modules = registries[0].split()
    if (not modules or len(modules) != len(set(modules))
            or any(not MODULE.fullmatch(name) for name in modules)):
        raise ValueError("Unsupported or duplicate accepted module registry")
    graph, prefixes, _, _ = scope_plan(repo, modules)
    audit = (repo / "lean/ProofAudit.lean").read_text(encoding="utf-8")
    requirements = re.findall(
        r"let required : Array Name := #\[([\s\S]*?)\]\s+for name in required", audit)
    whitelists = re.findall(r"let allowed : Array Name := #\[([^\]]*)\]", audit)
    fallbacks = re.findall(r"let prefixes := #\[([^\]]*)\]", audit)
    if len(requirements) != 1 or len(whitelists) != 1 or len(fallbacks) != 1:
        raise ValueError("Historical audit schema changed; review its exact obligations")
    required = _names(requirements[0])
    if tuple(_names(whitelists[0])) != ALLOWED:
        raise ValueError("Historical standard-axiom whitelist changed")
    legacy = json.loads("[" + fallbacks[0] + "]")
    if (not required or not legacy or len(legacy) != len(set(legacy))
            or any(not isinstance(name, str) or not name.endswith(".")
                   or not MODULE.fullmatch(name[:-1]) for name in legacy)):
        raise ValueError("Unsupported legacy ownership fallback")
    return {"registered_modules": modules, "modules": sorted(graph),
            "required": required, "legacy_prefixes": legacy,
            "checker_prefixes": prefixes}


def audit_source(modules, required, legacy_prefixes, *, allowed=ALLOWED):
    """The allowed override exists only for negative hosted fixtures."""
    if len(modules) != len(set(modules)) or len(required) != len(set(required)):
        raise ValueError("Duplicate audit obligation")
    if any(not MODULE.fullmatch(name) for name in (*modules, *required, *allowed)):
        raise ValueError("Unsupported audited name")
    imports = "\n".join("import " + name for name in sorted(modules))
    names = lambda values: ", ".join(chr(96) + name for name in values)
    strings = lambda values: ", ".join(json.dumps(name) for name in values)
    return f'''{imports}
import Lean.Util.CollectAxioms
import Lean.PrivateName
import Lean.Elab.Command
import Lean.Data.Json

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open Lean Elab Command in
run_cmd do
  let expectedModules : Array String := #[{strings(sorted(modules))}]
  let required : Array Name := #[{names(required)}]
  let legacyPrefixes : Array String := #[{strings(legacy_prefixes)}]
  let allowed : Array Name := #[{names(allowed)}]
  let env ← getEnv
  if env.header.isModule then
    throwError "All-owned audit must use legacy private-import mode"
  unless env.header.modules.size == env.header.moduleData.size do
    throwError "Imported module/data inventory size mismatch"
  let mut rawNames : NameSet := {{}}
  let mut seenModules : Array String := #[]
  for h : idx in [0:env.header.modules.size] do
    let mod := env.header.modules[idx]
    let moduleName := mod.module.toString
    let isProject := moduleName == "Solitaire" || moduleName.startsWith "Solitaire." ||
      moduleName == "Conjectures" || moduleName.startsWith "Conjectures."
    unless !isProject || expectedModules.contains moduleName do
      throwError "Unregistered project module in audit: {{moduleName}}"
    if expectedModules.contains moduleName then
      unless mod.hasData && mod.importAll do
        throwError "Project module lacks complete private data: {{moduleName}}"
      let data := env.header.moduleData[idx]!
      unless data.constNames == data.constants.map (·.name) do
        throwError "Serialized declaration names differ from their constants: {{moduleName}}"
      seenModules := seenModules.push moduleName
      let mut privateCount := 0
      for name in data.constNames do
        unless (env.find? name).isSome do
          throwError "Serialized project declaration is invisible: {{moduleName}}: {{name}}"
        rawNames := rawNames.insert name
        if (privateToUserName? name).isSome then
          privateCount := privateCount + 1
      let record := Json.mkObj [
        ("tag", toJson "module"), ("module", toJson moduleName),
        ("modern", toJson data.isModule), ("import_all", toJson mod.importAll),
        ("has_data", toJson mod.hasData),
        ("names", toJson (data.constNames.map (·.toString))),
        ("private_count", toJson privateCount)]
      logInfo m!"ALL-OWNED-JSON {{record.compress}}"
  unless seenModules.size == expectedModules.size &&
      expectedModules.all seenModules.contains do
    throwError "Incomplete exact project module inventory"
  let mut audited : NameSet := {{}}
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
    let byLegacy := legacyPrefixes.any (fun prefix => userName.toString.startsWith prefix)
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
          throwError "Unapproved project axiom {{name}}"
      let axioms ← collectAxioms name
      for axiomName in axioms do
        unless allowed.contains axiomName do
          throwError "Unapproved axiom {{axiomName}} in {{name}}"
      let record := Json.mkObj [
        ("tag", toJson "declaration"), ("name", toJson name.toString),
        ("owner", toJson owner), ("kind", toJson kind),
        ("private_user_name", toJson (privateName.map (·.toString))),
        ("by_module", toJson byModule), ("by_serialized", toJson bySerialized),
        ("by_legacy_prefix", toJson byLegacy),
        ("axioms", toJson (axioms.map (·.toString)))]
      logInfo m!"ALL-OWNED-JSON {{record.compress}}"
  for name in rawNames.toArray do
    unless audited.contains name do
      throwError "Serialized project declaration escaped the audit: {{name}}"
  for name in required do
    let _ ← getConstInfo name
    unless audited.contains name do
      throwError "Required declaration is outside audited ownership: {{name}}"
    let record := Json.mkObj [("tag", toJson "required"), ("name", toJson name.toString)]
    logInfo m!"ALL-OWNED-JSON {{record.compress}}"
  let record := Json.mkObj [
    ("tag", toJson "passed"), ("modules", toJson seenModules.size),
    ("declarations", toJson declarations), ("theorems", toJson theorems),
    ("private_declarations", toJson privateDeclarations),
    ("raw_declarations", toJson rawNames.toArray.size),
    ("required", toJson required.size), ("allowed_axioms", toJson (allowed.map (·.toString)))]
  logInfo m!"ALL-OWNED-JSON {{record.compress}}"
'''


def validate_log(text, spec, modern, *, allowed=ALLOWED):
    records = []
    for line in text.splitlines():
        if MARKER in line:
            records.append(json.loads(line.split(MARKER, 1)[1]))
    tagged = {tag: [] for tag in ("module", "declaration", "required", "passed")}
    for record in records:
        if record.get("tag") not in tagged:
            raise ValueError("Unexpected all-owned audit record")
        tagged[record["tag"]].append(record)
    if len(tagged["passed"]) != 1:
        raise ValueError("Missing unique complete all-owned audit result")
    summary = tagged["passed"][0]
    modules = {row["module"]: row for row in tagged["module"]}
    if len(modules) != len(tagged["module"]) or set(modules) != set(spec["modules"]):
        raise ValueError("Missing, extra or repeated imported project module")
    raw = set()
    for name, record in modules.items():
        if (record["modern"] != modern[name] or record["import_all"] is not True
                or record["has_data"] is not True
                or len(record["names"]) != len(set(record["names"]))):
            raise ValueError("Incomplete private raw-module data: " + name)
        raw.update(record["names"])
    declarations = {row["name"]: row for row in tagged["declaration"]}
    if len(declarations) != len(tagged["declaration"]) or not raw <= set(declarations):
        raise ValueError("Repeated declaration or omitted raw project declaration")
    for name, row in declarations.items():
        user = row["private_user_name"] or name
        expected_flags = (
            row["owner"] in modules, name in raw,
            any(user.startswith(prefix) for prefix in spec["legacy_prefixes"]))
        if (not any(expected_flags) or
                tuple(row[key] for key in ("by_module", "by_serialized", "by_legacy_prefix"))
                != expected_flags or row["kind"] not in KINDS
                or not set(row["axioms"]) <= set(allowed)):
            raise ValueError("Invalid ownership/kind/axioms: " + name)
        if row["kind"] == "axiom" and name not in allowed:
            raise ValueError("Unapproved direct project axiom: " + name)
    private = {name: row["private_user_name"] for name, row in declarations.items()
               if row["private_user_name"] is not None}
    for name, row in modules.items():
        if row["private_count"] != sum(decl in private for decl in row["names"]):
            raise ValueError("Private raw inventory disagrees: " + name)
    required = [row["name"] for row in tagged["required"]]
    if (len(required) != len(set(required)) or set(required) != set(spec["required"])
            or not set(required) <= set(declarations)):
        raise ValueError("Required declaration inventory differs")
    kinds = Counter(row["kind"] for row in declarations.values())
    expected = {"tag": "passed", "modules": len(modules), "declarations": len(declarations),
                "theorems": kinds["theorem"], "private_declarations": len(private),
                "raw_declarations": len(raw), "required": len(required),
                "allowed_axioms": list(allowed)}
    if summary != expected:
        raise ValueError("Audit summary disagrees with exact declaration inventory")
    return {"summary": summary, "modules": modules, "declarations": declarations,
            "private_declarations": private, "required": required, "kind_counts": dict(kinds),
            "all_owned_declarations_audited": True, "exact_raw_private_visibility": True}
