#!/usr/bin/env python3
"""Audit fresh modern Lean modules inside an exact larger imported closure.

Only the owned roots are imported with `import all`. Dependency-private data is
not requested by this audit. Prior dependency gates remain separate evidence.
The restricted allowed-axiom parameter exists for negative fixture checks.
"""
from __future__ import annotations

from collections import Counter
import json
import re

ALLOWED = ("propext", "Classical.choice", "Quot.sound")
NAME = re.compile(r"[A-Za-z][A-Za-z0-9_]*(?:\.[A-Za-z0-9_]+)*")
KINDS = {"axiom", "definition", "theorem", "opaque", "quotient",
         "constructor", "recursor", "inductive"}
MARKER = "OWNED-EXTENSION-JSON "


def obligations(imported_modules, owned_modules, required_by_module, allowed=ALLOWED):
    imported, owned = list(imported_modules), list(owned_modules)
    if (not imported or not owned or len(imported) != len(set(imported))
            or len(owned) != len(set(owned)) or not set(owned) <= set(imported)):
        raise ValueError("Invalid imported/owned module inventory")
    if any(not NAME.fullmatch(name) or name.split(".", 1)[0] not in
           {"Conjectures", "Solitaire"} for name in imported):
        raise ValueError("Unsupported project module name")
    if set(required_by_module) != set(owned):
        raise ValueError("Required endpoints must be assigned to every exact owned module")
    required = [name for module in owned for name in required_by_module[module]]
    if (len(required) != len(set(required))
            or any(not isinstance(name, str) or not NAME.fullmatch(name)
                   for name in (*required, *allowed))
            or len(allowed) != len(set(allowed))):
        raise ValueError("Invalid or duplicate theorem/axiom obligation")
    return imported, owned, required


def audit_source(imported_modules, owned_modules, required_by_module, *, allowed=ALLOWED):
    imported, owned, required = obligations(
        imported_modules, owned_modules, required_by_module, allowed)
    names = lambda values: ", ".join(chr(96) + name for name in values)
    strings = lambda values: ", ".join(json.dumps(name) for name in values)
    imports = "\n".join("import all " + name for name in sorted(owned))
    assigned = ", ".join("(" + json.dumps(module) + ", #[" +
                         names(required_by_module[module]) + "])" for module in sorted(owned))
    return f'''module

{imports}
import Lean.Util.CollectAxioms
import Lean.PrivateName
import Lean.Elab.Command
import Lean.Data.Json

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open Lean Elab Command in
run_cmd do
  let expectedImports : Array String := #[{strings(sorted(imported))}]
  let ownedModules : Array String := #[{strings(sorted(owned))}]
  let requiredByModule : Array (String × Array Name) := #[{assigned}]
  let allowed : Array Name := #[{names(allowed)}]
  let env ← getEnv
  unless env.header.isModule do
    throwError "Owned-extension audit must use modern module mode"
  unless env.header.modules.size == env.header.moduleData.size do
    throwError "Imported module/data inventory size mismatch"
  let ownerOf := fun name => match env.getModuleIdxFor? name |>.bind (env.header.modules[·]?) with
    | some mod => mod.module.toString
    | none => ""
  let mut rawNames : NameSet := {{}}
  let mut seenImports : Array String := #[]
  let mut seenOwned : Array String := #[]
  for h : idx in [0:env.header.modules.size] do
    let mod := env.header.modules[idx]
    let moduleName := mod.module.toString
    let isProject := moduleName == "Solitaire" || moduleName.startsWith "Solitaire." ||
      moduleName == "Conjectures" || moduleName.startsWith "Conjectures."
    if isProject then
      unless expectedImports.contains moduleName do
        throwError "Unexpected project import: {{moduleName}}"
      seenImports := seenImports.push moduleName
      let record := Json.mkObj [
        ("tag", toJson "import"), ("module", toJson moduleName),
        ("owned", toJson (ownedModules.contains moduleName))]
      logInfo m!"OWNED-EXTENSION-JSON {{record.compress}}"
    if ownedModules.contains moduleName then
      unless mod.hasData && mod.importAll do
        throwError "Owned module lacks complete private data: {{moduleName}}"
      let data := env.header.moduleData[idx]!
      unless data.isModule do
        throwError "Owned-extension audit expects modern owned modules: {{moduleName}}"
      unless data.constNames == data.constants.map (·.name) do
        throwError "Serialized names differ from owned constants: {{moduleName}}"
      seenOwned := seenOwned.push moduleName
      let mut privateCount := 0
      for name in data.constNames do
        unless (env.find? name).isSome do
          throwError "Serialized owned declaration is invisible: {{moduleName}}: {{name}}"
        unless ownerOf name == moduleName do
          throwError "Serialized declaration has another owner: {{moduleName}}: {{name}}"
        if rawNames.contains name then
          throwError "Repeated serialized owned declaration: {{name}}"
        rawNames := rawNames.insert name
        if (privateToUserName? name).isSome then
          privateCount := privateCount + 1
      let record := Json.mkObj [
        ("tag", toJson "module"), ("module", toJson moduleName),
        ("modern", toJson data.isModule), ("import_all", toJson mod.importAll),
        ("has_data", toJson mod.hasData),
        ("names", toJson (data.constNames.map (·.toString))),
        ("private_count", toJson privateCount)]
      logInfo m!"OWNED-EXTENSION-JSON {{record.compress}}"
  unless seenImports.size == expectedImports.size &&
      expectedImports.all seenImports.contains do
    throwError "Incomplete exact imported project closure"
  unless seenOwned.size == ownedModules.size &&
      ownedModules.all seenOwned.contains do
    throwError "Incomplete owned module inventory"
  let mut audited : NameSet := {{}}
  let mut declarations := 0
  let mut theorems := 0
  let mut privateDeclarations := 0
  for (name, info) in env.constants.toList do
    let owner := ownerOf name
    let byModule := ownedModules.contains owner
    let bySerialized := rawNames.contains name
    if byModule || bySerialized then
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
          throwError "Unapproved owned axiom {{name}}"
      let axioms ← collectAxioms name
      for axiomName in axioms do
        unless allowed.contains axiomName do
          throwError "Unapproved axiom {{axiomName}} in {{name}}"
      let record := Json.mkObj [
        ("tag", toJson "declaration"), ("name", toJson name.toString),
        ("owner", toJson owner), ("kind", toJson kind),
        ("private_user_name", toJson (privateName.map (·.toString))),
        ("by_module", toJson byModule), ("by_serialized", toJson bySerialized),
        ("axioms", toJson (axioms.map (·.toString)))]
      logInfo m!"OWNED-EXTENSION-JSON {{record.compress}}"
  for name in rawNames.toArray do
    unless audited.contains name do
      throwError "Serialized owned declaration escaped the audit: {{name}}"
  let mut requiredCount := 0
  for (expectedOwner, names) in requiredByModule do
    for name in names do
      let info ← getConstInfo name
      unless info.isTheorem do
        throwError "Required endpoint is not a theorem: {{name}}"
      unless ownerOf name == expectedOwner && audited.contains name && rawNames.contains name do
        throwError "Required theorem has wrong ownership: {{expectedOwner}}: {{name}}"
      requiredCount := requiredCount + 1
      let record := Json.mkObj [
        ("tag", toJson "required"), ("name", toJson name.toString),
        ("owner", toJson expectedOwner)]
      logInfo m!"OWNED-EXTENSION-JSON {{record.compress}}"
  let record := Json.mkObj [
    ("tag", toJson "passed"), ("imported_modules", toJson seenImports.size),
    ("owned_modules", toJson seenOwned.size),
    ("declarations", toJson declarations), ("theorems", toJson theorems),
    ("private_declarations", toJson privateDeclarations),
    ("raw_declarations", toJson rawNames.toArray.size),
    ("required_theorems", toJson requiredCount),
    ("allowed_axioms", toJson (allowed.map (·.toString)))]
  logInfo m!"OWNED-EXTENSION-JSON {{record.compress}}"
'''


def validate_log(text, imported_modules, owned_modules, required_by_module, *, allowed=ALLOWED):
    imported, owned, required = obligations(
        imported_modules, owned_modules, required_by_module, allowed)
    tagged = {tag: [] for tag in ("import", "module", "declaration", "required", "passed")}
    for line in text.splitlines():
        if MARKER in line:
            record = json.loads(line.split(MARKER, 1)[1])
            if record.get("tag") not in tagged:
                raise ValueError("Unexpected owned-extension record")
            tagged[record["tag"]].append(record)
    if len(tagged["passed"]) != 1:
        raise ValueError("Missing unique complete owned-extension result")
    imports = {row["module"]: row for row in tagged["import"]}
    if (len(imports) != len(tagged["import"]) or set(imports) != set(imported)
            or any(row["owned"] is not (name in owned) for name, row in imports.items())):
        raise ValueError("Imported closure or owned-subset flags differ")
    modules = {row["module"]: row for row in tagged["module"]}
    if len(modules) != len(tagged["module"]) or set(modules) != set(owned):
        raise ValueError("Missing, extra or repeated owned module")
    raw_owners = {}
    for module, row in modules.items():
        if (row["modern"] is not True or row["import_all"] is not True
                or row["has_data"] is not True or len(row["names"]) != len(set(row["names"]))):
            raise ValueError("Incomplete owned raw-private module data")
        for name in row["names"]:
            if name in raw_owners:
                raise ValueError("Repeated raw declaration across owned modules")
            raw_owners[name] = module
    declarations = {row["name"]: row for row in tagged["declaration"]}
    if len(declarations) != len(tagged["declaration"]) or not set(raw_owners) <= set(declarations):
        raise ValueError("Repeated declaration or omitted raw owned declaration")
    for name, row in declarations.items():
        flags = (row["owner"] in modules, name in raw_owners)
        if (not any(flags)
                or (row["by_module"], row["by_serialized"]) != flags
                or (name in raw_owners and row["owner"] != raw_owners[name])
                or row["kind"] not in KINDS or not set(row["axioms"]) <= set(allowed)):
            raise ValueError("Invalid owned declaration, kind, or axioms")
        if row["kind"] == "axiom" and name not in allowed:
            raise ValueError("Unapproved direct owned axiom")
    private = {name: row["private_user_name"] for name, row in declarations.items()
               if row["private_user_name"] is not None}
    for module, row in modules.items():
        if row["private_count"] != sum(name in private for name in row["names"]):
            raise ValueError("Private owned raw inventory disagrees")
    seen_required = {}
    for row in tagged["required"]:
        name, module = row["name"], row["owner"]
        if name in seen_required:
            raise ValueError("Duplicate required theorem")
        if (module not in required_by_module or name not in required_by_module[module]
                or name not in declarations or declarations[name]["kind"] != "theorem"
                or declarations[name]["owner"] != module or raw_owners.get(name) != module):
            raise ValueError("Required endpoint is not a theorem of its assigned owned module")
        seen_required[name] = module
    if set(seen_required) != set(required):
        raise ValueError("Incomplete required theorem inventory")
    kinds = Counter(row["kind"] for row in declarations.values())
    expected = {"tag": "passed", "imported_modules": len(imports), "owned_modules": len(modules),
                "declarations": len(declarations), "theorems": kinds["theorem"],
                "private_declarations": len(private), "raw_declarations": len(raw_owners),
                "required_theorems": len(required), "allowed_axioms": list(allowed)}
    if tagged["passed"][0] != expected:
        raise ValueError("Scoped audit summary disagrees with exact inventories")
    return {"summary": expected, "imports": imports, "owned_modules": modules,
            "declarations": declarations, "private_declarations": private,
            "required_theorems": seen_required, "kind_counts": dict(kinds),
            "all_owned_declarations_audited": True, "exact_owned_raw_private_visibility": True,
            "exact_imported_project_closure": True, "dependency_audit_claimed": False}
