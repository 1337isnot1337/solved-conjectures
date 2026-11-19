#!/usr/bin/env python3
"""Bounded, exact p251/b4/cut391 comparison of two verified population counts.

Both numerical modules retain the same imports, options, proposition and
decide +kernel proof. Only the named counter lemma and endpoint name differ.
A timeout or failed source is recorded separately and never yields a ratio.
This benchmark proves no initial cover or runner classification.
"""
from __future__ import annotations

import argparse
from collections import Counter
import gzip
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import time

import audit_lean_all_owned as audit
import generate_modular_initial_support as initial
import generate_modular_support_cut_fragments as cuts
from replay_lean import header_tokens, imports_of
import verify_frankl_orbit_batches as runtime

ROOT = Path(__file__).resolve().parents[1]
CONTROLLER = "scripts/verify_modular_cut_counter_benchmark.py"
MODEL = "docs/modular-cut-counter-benchmark-sources.json"
WORKFLOW = ".github/workflows/lean-modular-cut-counter-benchmark.yml"
SCHEMA = "modular-cut-counter-benchmark-sources-v1"
RECEIPT_SCHEMA = "modular-cut-counter-benchmark-receipt-v1"
PREFIX = "Conjectures.LonelinessModularCoverByteBenchmark"
NAMESPACE = "Loneliness.Modular.SupportSearch.Bits.ByteBenchmark"
VARIANTS = ("Fast", "Byte")
BASE_ORDER = [
    "Conjectures.LonelinessModularCoverFastCounts",
    "Conjectures.LonelinessModularCoverSearch",
    "Conjectures.LonelinessModularCoverByteCounts",
    "Conjectures.LonelinessModularCoverChunks",
    "Conjectures.LonelinessModularCoverTape",
    "Conjectures.LonelinessModularCoverBits",
    "Conjectures.LonelinessModularCoverCuts",
    "Conjectures.LonelinessModularCoverByteCuts",
    "Conjectures.LonelinessModularCoverFastCuts",
]
BASE_SHA256 = {
    "Conjectures.LonelinessModularCoverFastCounts": "bbc76f17ce5e115461d40d6ac0b75af9da2edb6dc1de1229bebd0dfd2e067361",
    "Conjectures.LonelinessModularCoverSearch": "128cfce4db3e077a8d3d0649a742ad62bb8ce3ac7e5c53b0e34ba2af8811fa41",
    "Conjectures.LonelinessModularCoverByteCounts": "97bc6cda6a52ba87bfa9d66b7558b8ac7290b050424a2a05ea51e901fc67d039",
    "Conjectures.LonelinessModularCoverChunks": "3d57c482b84bc7c88243c7a8debbda70d9be4f92000a2bd9565285c4e94d0e77",
    "Conjectures.LonelinessModularCoverTape": "fe8af243c28a2dceb66c0ea0d1489dce398da9f36cc4dd943a2eed732b5a41d6",
    "Conjectures.LonelinessModularCoverBits": "21194212c97ca35288a87db2ab6842b15187b21e46fa76d910e284c2a34bb742",
    "Conjectures.LonelinessModularCoverCuts": "98532e4b0324cc66011b5a57f99edf76cbae3f5064be9356db9d1c1ac8865de1",
    "Conjectures.LonelinessModularCoverByteCuts": "56e560ab9747e5588d7d593b63ae010d9e46e54d6b95a42a5b50326fa7851ff1",
    "Conjectures.LonelinessModularCoverFastCuts": "64bce1f120297b1aa66b219c1f53a31c211b8741884442ea92c28b7a3a420a9d",
}
ORIGINAL_GENERATED_SHA256 = {
    PREFIX + "Data": "304d8f9816a6fb222391b048dfdc0b1b2a0501b683a1d0f7818fa4d7d5ba712b",
    PREFIX + "Fast": "e12510c69cc6171d1a5e33c5e0ea6191f4df6c285a7cc854f9cf84edd5b628b0",
    PREFIX + "Byte": "fb46a624de9c217703252a985dc0ed90517e918f5ad9d795ab08838aceb1a027",
}
PACKET_SHA256 = {
    "initial": "d5f4069445252029c7b36831a000c0a0d56ac83b34510a5f270e963a26b2e72b",
    "cuts": "5e9e5acac127607697b0508a74f5429a2bf6053655408ebadb45530a6c8583d0",
}
PAYLOAD_SHA256 = "d88a866b589c9641e54b3a5a18f3d74a477c1393261159183b4fd8d5dbb51e14"
STATISTICS = {
    "prime": 251, "minimum_pair": 4, "cut": 391, "fragment_size": 31,
    "capacity_leaves": 15, "reuse_leaves": 1, "count_calls": 1472,
    "visited_nodes": list(range(10658, 10688)), "referenced_cut_frames": [390],
    "original_root_instructions": 11335, "original_root_cuts": 419,
}
LEAN_SHA256 = "bf8d54e4714cc4b03d3f6bb34c83b7202b87e49c8bfcbff6895c085bb90ceb38"
CHECKER_SHA256 = "12c38901cdbfab178f1bf6145dd30012e9a3b2c11ca695292a5884fa3cbaddb6"
CONTROLS = (
    CONTROLLER, WORKFLOW, "scripts/generate_modular_initial_support.py",
    "scripts/generate_modular_support_cut_fragments.py",
    "scripts/audit_lean_all_owned.py", "scripts/build_lean_parallel.py",
    "scripts/plan_accepted_lean.py", "scripts/plan_lean_candidates.py",
    "scripts/replay_lean.py", "scripts/verify_lean_candidate.py",
    "scripts/verify_frankl_orbit_batches.py",
    "lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json",
)
FACETS = (".olean", ".olean.private", ".olean.server", ".ir", ".ir.sig")
ALLOWED = ("propext", "Classical.choice", "Quot.sound")
POLICY = {"warning_as_error": True, "linter_override": False,
          "fresh_project_objects": True, "ordinary_kernel_decide": True}
RESOURCES = {"source_workers": 1, "kernel_threads": 1, "lean_memory_mib": 4500,
             "source_timeout_seconds": 1800, "kernel_timeout_seconds": 1800,
             "audit_timeout_seconds": 900, "producer_timeout_seconds": 300,
             "controller_timeout_seconds": 8400}
SCOPE = {"prime": 251, "speeds": 7, "denominator": 8, "minimum_pair": 4,
         "cut_index": 391, "fragment_limit": 31, "cuts_per_module": 4,
         "sparse_lookup_agrees_on_every_visited_instruction": True,
         "original_six_field_frames_preserved": True,
         "same_imports_options_proposition_and_kernel_decide": True,
         "initial_support_coverage_verified": False,
         "all_cut_obligations_verified": False, "integer_classification_verified": False,
         "general_performance_speedup_verified": False, "accepted_registry_changed": False}
COMMON_REQUIRED = sorted("Loneliness.Modular.SupportSearch.Bits." + name for name in (
    "Fast.count_eq", "Byte.count_eq", "Byte.count_eq_fast",
    "FastCuts.boundedCheck_eq", "FastCuts.boundedCheck_sound",
    "ByteCuts.boundedCheck_eq", "ByteCuts.boundedCheck_sound"))
REQUIRED = sorted(COMMON_REQUIRED + [NAMESPACE + "." + v.lower() + "_checked" for v in VARIANTS])
MODULES = BASE_ORDER + [PREFIX + "Data"] + [PREFIX + v for v in VARIANTS]


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def sha_bytes(data):
    return hashlib.sha256(data).hexdigest()


def sha(path):
    return sha_bytes(Path(path).read_bytes())


def encoded(value):
    return (json.dumps(value, sort_keys=True, indent=2) + "\n").encode()


def source(directory, module):
    return directory / (module.replace(".", "/") + ".lean")


def state(frame):
    return {key: int(frame[key]) for key in initial.FRAME_KEYS}


def fixture(initial_path=None, cuts_path=None):
    require((initial_path is None) == (cuts_path is None), "Both saved packets are required")
    if initial_path is None:
        data = initial.produce(7, 8, 251, max_nodes=0, max_seconds=0, max_rows=0)
        compressed = cuts.produce(data, 31, 4)
    else:
        data = json.loads(initial_path.read_bytes())
        compressed = json.loads(cuts_path.read_bytes())
        initial.validate(data)
        cuts.validate(data, compressed, initial_validated=True)
    require(sha_bytes(cuts.encoded(data)) == PACKET_SHA256["initial"], "Original initial packet differs")
    require(sha_bytes(cuts.encoded(compressed)) == PACKET_SHA256["cuts"], "Original coarse packet differs")
    require(data["status"] == "complete" and data["requested_pairs"] == list(range(2, 126)),
            "Numerical parent packet is incomplete")
    root = next(row for row in data["roots"] if row["b"] == 4)
    coarse = next(row for row in compressed["roots"] if row["b"] == 4)
    chosen = coarse["cuts"][391]
    visited, refs, leaves = {}, {}, []
    count_calls = 0

    def walk(fragment, frame):
        nonlocal count_calls
        actual = state(frame)
        require(actual == state(root["frames"][actual["index"]]), "Changed original frame")
        if fragment["kind"] == "reuse":
            index = fragment["index"]
            require(index < 391 and actual == state(coarse["cuts"][index]["frame"]),
                    "Changed full reuse frame")
            refs[index] = actual
            return
        index = actual["index"]
        node = root["nodes"][index]
        visited[index] = node
        if fragment["kind"] == "leaf":
            require(node["kind"] == "capacity", "Unexpected non-capacity leaf")
            threshold = int(node["value"])
            available = list(initial.bits(actual["available"]))
            capacity = actual["slots"] * threshold + sum(
                max((actual["uncovered"] & int(data["cover"][a])).bit_count() - threshold, 0)
                for a in available)
            require(capacity < actual["uncovered"].bit_count(), "Invalid original capacity leaf")
            count_calls += len(available) + 1
            leaves.append({"index": index, "threshold": threshold,
                           "available_card": len(available), "frame": actual})
            return
        require(fragment["kind"] == "split" and node["kind"] == "split", "Changed original split")
        walk(fragment["left"], root["frames"][node["left"]])
        walk(fragment["right"], root["frames"][node["right"]])

    walk(chosen["fragment"], chosen["frame"])
    statistics = {
        "prime": 251, "minimum_pair": 4, "cut": 391,
        "fragment_size": cuts.fragment_size(chosen["fragment"]),
        "capacity_leaves": len(leaves), "reuse_leaves": len(refs), "count_calls": count_calls,
        "visited_nodes": sorted(visited), "referenced_cut_frames": sorted(refs),
        "original_root_instructions": len(root["nodes"]), "original_root_cuts": len(coarse["cuts"]),
    }
    require(statistics["fragment_size"] == 31 and len(leaves) == 15 and len(refs) == 1
            and count_calls == 1472 and sorted(visited) == list(range(10658, 10688))
            and sorted(refs) == [390] and len(root["nodes"]) == 11335
            and len(coarse["cuts"]) == 419, "Selected cut census differs")
    payload = {
        "cover": data["cover"],
        "compatible": [str(root["compatible"].get(str(a), root["compatible"].get(a, 0)))
                       for a in range(data["width"])],
        "nodes": [[index, visited[index]] for index in sorted(visited)],
        "referenced_frames": [[index, refs[index]] for index in sorted(refs)],
        "fragment": chosen["fragment"], "initial": state(chosen["frame"]),
        "capacity_leaves": leaves, "statistics": statistics,
    }
    require(statistics == STATISTICS and sha_bytes(encoded(payload)) == PAYLOAD_SHA256,
            "Exact extracted benchmark packet differs")
    return data, compressed, payload


def node_literal(node):
    if node["kind"] == "split":
        return f".split {node['candidate']} {node['left']} {node['right']}"
    require(node["kind"] == "capacity", "Unsupported benchmark leaf")
    return f".leaf (.capacity {node['value']})"


def lookup_literal(entries, indent=2):
    pad = " " * indent
    if len(entries) == 1:
        return pad + node_literal(entries[0][1])
    mid = len(entries) // 2
    return (pad + f"if i < {entries[mid][0]} then\n" + lookup_literal(entries[:mid], indent + 2)
            + "\n" + pad + "else\n" + lookup_literal(entries[mid:], indent + 2))


def fragment_literal(fragment):
    if fragment["kind"] == "leaf":
        return ".leaf"
    if fragment["kind"] == "reuse":
        return f".reuse {fragment['index']}"
    return ".split (" + fragment_literal(fragment["left"]) + ") (" + fragment_literal(fragment["right"]) + ")"


def render(payload):
    lines = [
        "import Conjectures.LonelinessModularCoverByteCuts",
        "import Conjectures.LonelinessModularCoverFastCuts", "import Init.Data.RArray", "",
        "/-! Development benchmark extracted from the actual p251, b4, cut391 obligation.",
        "Every visited original tape instruction, frame, cover mask and compatibility",
        "mask is preserved. Unvisited lookup entries are omitted equally for both",
        "counter implementations. This is a local performance probe, not an initial",
        "support coverage or complete classification theorem. -/", "",
        "namespace " + NAMESPACE, "",
        "def coverData : Lean.RArray ℕ :=", initial.rarray(payload["cover"]), "",
        "def cover (a : ℕ) : ℕ := coverData.get a", "",
        "def compatibleData : Lean.RArray ℕ :=", initial.rarray(payload["compatible"]), "",
        "def compatible (a : ℕ) : ℕ := compatibleData.get a", "",
        "def lookup (i : ℕ) : Tape.Node :=", lookup_literal(payload["nodes"]), "",
        "def frames (i : ℕ) : Cuts.Frame :=",
    ]
    refs = payload["referenced_frames"]
    require(len(refs) == 1 and refs[0][0] == 390, "Unexpected reuse table")
    lines += [
        "  if i = 390 then " + initial.frame_literal(refs[0][1]),
        "  else " + initial.frame_literal(payload["initial"]), "",
        "def fragment : Cuts.Fragment := " + fragment_literal(payload["fragment"]), "",
        "def initial : Cuts.Frame := " + initial.frame_literal(payload["initial"]), "",
        "def terminal : Finset ℕ → ℕ → Bool := fun _ _ => false", "",
        "end " + NAMESPACE, "",
    ]
    result = {PREFIX + "Data": "\n".join(lines)}
    for variant in VARIANTS:
        result[PREFIX + variant] = "\n".join([
            "import " + PREFIX + "Data", "", "namespace " + NAMESPACE, "",
            "set_option maxRecDepth 20000", "set_option maxHeartbeats 4000000", "",
            "theorem " + variant.lower() + "_checked :",
            "    Cuts.boundedCheck cover compatible terminal lookup frames 391 31 fragment initial = true := by",
            "  apply " + variant + "Cuts.boundedCheck_sound", "  decide +kernel", "",
            "end " + NAMESPACE, "",
        ])
    require({m: sha_bytes(s.encode()) for m, s in result.items()} == ORIGINAL_GENERATED_SHA256,
            "Reconstructed benchmark differs from original paired sources")
    normalized = [result[PREFIX + v].replace(v + "Cuts", "CounterCuts").replace(
        v.lower() + "_checked", "counter_checked") for v in VARIANTS]
    require(normalized[0] == normalized[1], "Numerical modules differ beyond counter and theorem names")
    return result


def emit(destination, packet_dir, check=False):
    data, compressed, payload = fixture()
    generated = render(payload)
    outputs = {source(destination, m): s.encode() for m, s in generated.items()}
    outputs.update({
        packet_dir / "initial.json.gz": gzip.compress(cuts.encoded(data), mtime=0),
        packet_dir / "cuts.json.gz": gzip.compress(cuts.encoded(compressed), mtime=0),
        packet_dir / "cut391.json": encoded(payload),
    })
    for path, raw in outputs.items():
        if check:
            require(path.is_file() and path.read_bytes() == raw, "Reproduction differs: " + str(path))
        else:
            require(not path.exists(), "Refuse to overwrite a benchmark payload: " + str(path))
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(raw)
    return {"generated_sha256": ORIGINAL_GENERATED_SHA256,
            "packet_sha256": PACKET_SHA256, "payload_sha256": sha_bytes(encoded(payload)),
            "statistics": payload["statistics"], "lean_verified": False}


def model_recipe(initial_path=None, cuts_path=None):
    _, _, payload = fixture(initial_path, cuts_path)
    generated = render(payload)
    return {"schema": SCHEMA, "proof_scope": SCOPE, "source_policy": POLICY,
            "resources": RESOURCES, "variant_order": list(VARIANTS),
            "project_modules": MODULES, "base_source_sha256": BASE_SHA256,
            "generated_source_sha256": {m: sha_bytes(s.encode()) for m, s in generated.items()},
            "packet_sha256": PACKET_SHA256, "payload_sha256": sha_bytes(encoded(payload)),
            "statistics": payload["statistics"], "required_theorems": REQUIRED,
            "control_sha256": {p: sha(ROOT / p) for p in sorted(CONTROLS)},
            "runtime_sha256": {"lean": LEAN_SHA256, "leanchecker": CHECKER_SHA256}}


def validate_model(model):
    fixed = {"schema": SCHEMA, "proof_scope": SCOPE, "source_policy": POLICY,
             "resources": RESOURCES, "variant_order": list(VARIANTS), "project_modules": MODULES,
             "base_source_sha256": BASE_SHA256, "generated_source_sha256": ORIGINAL_GENERATED_SHA256,
             "packet_sha256": PACKET_SHA256, "required_theorems": REQUIRED,
             "payload_sha256": PAYLOAD_SHA256, "statistics": STATISTICS,
             "runtime_sha256": {"lean": LEAN_SHA256, "leanchecker": CHECKER_SHA256}}
    require(set(model) == set(fixed) | {"control_sha256"},
            "Unexpected source-model fields")
    for key, value in fixed.items():
        require(model[key] == value, "Frozen benchmark scope differs: " + key)
    require(set(model["control_sha256"]) == set(CONTROLS), "Control inventory differs")
    for path, digest in model["control_sha256"].items():
        require(sha(ROOT / path) == digest, "Control hash differs: " + path)
    seen = set()
    for module in BASE_ORDER:
        path = source(ROOT / "lean", module)
        require(sha(path) == BASE_SHA256[module], "Base source differs: " + module)
        deps = {m for m in imports_of(path) if m.startswith("Conjectures.")}
        require(deps <= seen, "Missing or unordered project dependency: " + module)
        seen.add(module)
    require(re.fullmatch(r"[0-9a-f]{64}", model["payload_sha256"]) is not None,
            "Invalid extracted-payload digest")


def ci_identity():
    require(os.environ.get("GITHUB_ACTIONS") == "true", "Hosted benchmark identity is required")
    names = ("GITHUB_REPOSITORY", "GITHUB_RUN_ID", "GITHUB_RUN_ATTEMPT",
             "GITHUB_SHA", "GITHUB_WORKFLOW", "GITHUB_WORKFLOW_REF")
    identity = {name: os.environ.get(name, "") for name in names}
    require(all(identity.values()) and identity["GITHUB_RUN_ID"].isdigit()
            and identity["GITHUB_RUN_ATTEMPT"].isdigit(), "Incomplete hosted run identity")
    require(identity["GITHUB_REPOSITORY"] == "1337isnot1337/solved-conjectures",
            "Unexpected repository")
    require(identity["GITHUB_WORKFLOW_REF"].startswith(
        identity["GITHUB_REPOSITORY"] + "/" + WORKFLOW + "@"), "Unexpected workflow")
    return identity


def object_hashes(stage, modules, modern):
    result, expected = {}, set()
    for module in modules:
        stem = stage / "lib/lean" / module.replace(".", "/")
        facets = {}
        for suffix in FACETS:
            path = Path(str(stem) + suffix)
            require(not path.is_symlink(), "Linked object facet")
            if path.is_file():
                facets[suffix] = sha(path)
                expected.add(path.relative_to(stage / "lib/lean").as_posix())
        necessary = set(FACETS[:3]) if modern[module] else {".olean"}
        require(necessary <= set(facets), "Missing object facets: " + module)
        require((".olean.private" in facets) == (".olean.server" in facets), "Incomplete object companions")
        result[module] = facets
    found = set()
    for path in (stage / "lib/lean").rglob("*"):
        require(not path.is_symlink(), "Linked object tree entry")
        if path.is_file():
            found.add(path.relative_to(stage / "lib/lean").as_posix())
    require(found == expected, "Unexpected or omitted project object")
    return result


def file_inventory(stage):
    result = {}
    for path in sorted(stage.rglob("*")):
        require(not path.is_symlink(), "Linked artifact evidence")
        if path.is_file() and path.relative_to(stage).as_posix() not in {"receipt.json", "receipt.sha256"}:
            result[path.relative_to(stage).as_posix()] = sha(path)
    return result


def save(stage, receipt, seal=False):
    if seal:
        receipt["evidence_sha256"] = file_inventory(stage)
    (stage / "receipt.json").write_bytes(encoded(receipt))
    if seal:
        (stage / "receipt.sha256").write_text(sha(stage / "receipt.json") + "\n")


def verify(model, model_digest, stage, runtime_path):
    require(not stage.is_symlink() and (not stage.exists() or not any(stage.iterdir())),
            "Use a fresh empty benchmark directory")
    for name in ("controls", "generated", "producer-data", "src", "lib/lean", "logs", "progress"):
        (stage / name).mkdir(parents=True, exist_ok=True)
    receipt = {"schema": RECEIPT_SCHEMA, "status": "running", "proof_scope": SCOPE,
               "source_policy": POLICY, "resources": RESOURCES, "variant_order": list(VARIANTS),
               "project_modules": MODULES, "required_theorems": REQUIRED,
               "source_checks": {}, "kernel_checks": {}, "reproduction_checks": {},
               "variants": {v: {"status": "not_started"} for v in VARIANTS},
               "comparison": None, "both_variants_formally_verified": False,
               "accepted_registry_changed": False}
    deadline = time.monotonic() + RESOURCES["controller_timeout_seconds"]
    profiles = []

    def checked_profile(command, label, timeout):
        remaining = deadline - time.monotonic()
        require(remaining > 0, "Bounded controller deadline reached")
        log, progress = stage / "logs" / (label + ".log"), stage / "progress" / (label + ".json")
        result = runtime.profile(command, stage / "src", environment, log, progress, min(timeout, remaining))
        result.update({"log_relative": log.relative_to(stage).as_posix(),
                       "progress_relative": progress.relative_to(stage).as_posix(),
                       "progress_sha256": sha(progress)})
        profiles.append(result)
        return result

    def passed(result):
        return result["exit_code"] == 0 and result["timed_out"] is False

    def compile_one(module):
        output = stage / "lib/lean" / (module.replace(".", "/") + ".olean")
        output.parent.mkdir(parents=True, exist_ok=True)
        result = checked_profile(
            [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true",
             "-Dprofiler=true", "-o", str(output), module.replace(".", "/") + ".lean"],
            module + ".source", RESOURCES["source_timeout_seconds"])
        receipt["source_checks"][module] = result
        save(stage, receipt)
        return result

    def replay(target, expected, label):
        command = [str(compiler / "bin/leanchecker"), "-v", target]
        if buffer := shutil.which("stdbuf"):
            command = [buffer, "-oL", "-eL", *command]
        result = checked_profile(command, label, RESOURCES["kernel_timeout_seconds"])
        actual = re.findall(r"^replaying (Conjectures\.[A-Za-z0-9_.]+)$",
                            (stage / result["log_relative"]).read_text(), re.M)
        result["replayed_modules"] = actual
        result["exact_target_multiset"] = Counter(actual) == Counter(expected) and len(actual) == len(set(actual))
        receipt["kernel_checks"][label] = result
        save(stage, receipt)
        return passed(result) and result["exact_target_multiset"]

    save(stage, receipt)
    try:
        validate_model(model)
        require(sha(ROOT / MODEL) == model_digest, "Model changed after preflight")
        identity = ci_identity()
        commit = subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip()
        require(identity["GITHUB_SHA"] == commit, "Hosted SHA differs from checkout")
        controls = {**model["control_sha256"], MODEL: model_digest}
        inputs = {**controls, **{"lean/" + m.replace(".", "/") + ".lean": h
                                for m, h in BASE_SHA256.items()}}
        for path, digest in inputs.items():
            require(sha(ROOT / path) == digest, "Frozen input differs: " + path)
            raw = subprocess.check_output(["git", "show", commit + ":" + path], cwd=ROOT)
            require(sha_bytes(raw) == digest, "Frozen input differs from commit: " + path)
        for path, digest in controls.items():
            destination = stage / "controls" / path
            destination.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(ROOT / path, destination)
            require(sha(destination) == digest, "Copied control differs")
        compiler, external, toolchain = runtime.resolve_runtime(runtime_path)
        require(toolchain["lean_sha256"] == LEAN_SHA256 and toolchain["checker_sha256"] == CHECKER_SHA256,
                "Compiler or unchanged stock checker differs")
        environment = {**os.environ, "PATH": str(compiler / "bin") + os.pathsep + os.environ.get("PATH", ""),
                       "LEAN_PATH": os.pathsep.join([str(stage / "lib/lean"), *external]),
                       "LEAN_SYSROOT": str(compiler), "LEAN_NUM_THREADS": "1", "UV_USE_IO_URING": "0"}
        receipt.update({"ci_identity": identity, "git_commit": commit, "gate_sha256": controls,
                        "commit_input_sha256": inputs, "toolchain": toolchain, "external_lean_path": external,
                        "packet_sha256": PACKET_SHA256, "payload_sha256": model["payload_sha256"],
                        "statistics": model["statistics"]})
        save(stage, receipt)
        command = [sys.executable, str(ROOT / CONTROLLER), "--emit", str(stage / "generated"),
                   "--packet-dir", str(stage / "producer-data")]
        for label, extra in (("producer-generate", []), ("producer-check", ["--check"])):
            result = checked_profile(command + extra, label, RESOURCES["producer_timeout_seconds"])
            receipt["reproduction_checks"][label] = result
            save(stage, receipt)
            require(passed(result), "Pinned producer reproduction failed: " + label)
        payload = json.loads((stage / "producer-data/cut391.json").read_bytes())
        require(sha_bytes(encoded(payload)) == model["payload_sha256"]
                and payload["statistics"] == model["statistics"], "Extracted cut differs from model")
        for name in ("initial", "cuts"):
            require(sha_bytes(gzip.decompress((stage / "producer-data" / (name + ".json.gz")).read_bytes()))
                    == PACKET_SHA256[name], "Parent packet differs")
        produced_evidence = {p.name: sha(p) for p in (stage / "producer-data").iterdir()}
        require(set(produced_evidence) == {"initial.json.gz", "cuts.json.gz", "cut391.json"},
                "Unexpected producer evidence")
        receipt["producer_evidence_sha256"] = produced_evidence
        generated = render(payload)
        sources = {**BASE_SHA256, **ORIGINAL_GENERATED_SHA256}
        modern = {}
        for module in MODULES:
            origin = source(stage / "generated", module) if module in generated else source(ROOT / "lean", module)
            destination = source(stage / "src", module)
            require(sha(origin) == sources[module], "Original source differs: " + module)
            destination.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(origin, destination)
            require(sha(destination) == sources[module], "Copied source differs")
            modern[module] = next(header_tokens(destination.read_text()), None) == "module"
        receipt.update({"source_sha256": sources, "modern_modules": modern})
        common = BASE_ORDER + [PREFIX + "Data"]
        for module in common:
            require(passed(compile_one(module)), "Common source failed: " + module)
        frozen_objects = object_hashes(stage, common, modern)
        require(replay("Conjectures", common, "common.kernel"), "Common stock replay failed")
        require(object_hashes(stage, common, modern) == frozen_objects,
                "Common objects changed during stock replay")
        compiled = list(common)
        for variant in VARIANTS:
            module = PREFIX + variant
            result = compile_one(module)
            if not passed(result):
                receipt["variants"][variant] = {
                    "status": "source_timed_out" if result["timed_out"] else "source_failed",
                    "exit_code": result["exit_code"]}
                for suffix in FACETS:
                    Path(str(stage / "lib/lean" / module.replace(".", "/")) + suffix).unlink(missing_ok=True)
                require(object_hashes(stage, compiled, modern) == frozen_objects,
                        "Prior objects changed during failed variant compilation")
                save(stage, receipt)
                continue
            new_objects = object_hashes(stage, compiled + [module], modern)
            require({m: new_objects[m] for m in compiled} == frozen_objects,
                    "Prior objects changed during variant compilation")
            frozen_objects = new_objects
            compiled.append(module)
            if replay(module, [module], variant + ".kernel"):
                receipt["variants"][variant] = {"status": "source_and_kernel_passed"}
            else:
                kernel = receipt["kernel_checks"][variant + ".kernel"]
                receipt["variants"][variant] = {
                    "status": "kernel_timed_out" if kernel["timed_out"] else "kernel_failed",
                    "exit_code": kernel["exit_code"]}
            require(object_hashes(stage, compiled, modern) == frozen_objects,
                    "Object bytes changed during variant stock replay")
            save(stage, receipt)
        actual_required = COMMON_REQUIRED + [NAMESPACE + "." + v.lower() + "_checked"
                                            for v in VARIANTS if PREFIX + v in compiled]
        audit_text = audit.audit_source(compiled, sorted(actual_required), ["Loneliness."])
        audit_path = stage / "src/CutCounterBenchmarkAudit.lean"
        audit_path.write_text(audit_text)
        result = checked_profile(
            [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true", audit_path.name],
            "all-owned-audit", RESOURCES["audit_timeout_seconds"])
        receipt["axiom_audit"] = result
        save(stage, receipt)
        require(passed(result), "All-owned raw/private audit failed or timed out")
        spec = {"modules": compiled, "required": sorted(actual_required), "legacy_prefixes": ["Loneliness."]}
        inventory = audit.validate_log((stage / result["log_relative"]).read_text(), spec, modern)
        require(all(inventory["declarations"][n]["kind"] == "theorem" for n in actual_required),
                "Requested endpoint is not a theorem")
        inventory_path = stage / "declaration-inventory.json"
        inventory_path.write_bytes(encoded(inventory))
        result.update({"audit_source_sha256": sha(audit_path),
                       "declaration_inventory_sha256": sha(inventory_path),
                       "all_owned_declarations_audited": True, "exact_raw_private_visibility": True,
                       "audited_modules": compiled, "audited_required": sorted(actual_required),
                       "summary": inventory["summary"]})
        require(object_hashes(stage, compiled, modern) == frozen_objects, "Object bytes changed")
        receipt["artifact_sha256"] = frozen_objects
        for path, digest in inputs.items():
            require(sha(ROOT / path) == digest, "Frozen input changed during benchmark")
        for path, digest in controls.items():
            require(sha(stage / "controls" / path) == digest, "Copied control changed")
        require(ci_identity() == identity, "Hosted identity changed")
        require(subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip() == commit,
                "Checkout changed")
        require(sha(compiler / "bin/lean") == LEAN_SHA256
                and sha(compiler / "bin/leanchecker") == CHECKER_SHA256, "Runtime changed")
        require({".".join(p.relative_to(stage / "src").with_suffix("").parts)
                 for p in (stage / "src/Conjectures").rglob("*.lean")} == set(MODULES),
                "Staged source inventory changed")
        for module, digest in sources.items():
            require(sha(source(stage / "src", module)) == digest, "Staged source changed")
            if module in generated:
                require(sha(source(stage / "generated", module)) == digest, "Generated source changed")
        require({".".join(p.relative_to(stage / "generated").with_suffix("").parts)
                 for p in (stage / "generated/Conjectures").rglob("*.lean")} == set(generated),
                "Generated source inventory changed")
        require({p.name: sha(p) for p in (stage / "producer-data").iterdir()} == produced_evidence,
                "Pinned producer evidence changed")
        for result in profiles:
            require(sha(stage / result["log_relative"]) == result["log_sha256"]
                    and sha(stage / result["progress_relative"]) == result["progress_sha256"],
                    "Verification log or profile changed")
        require(audit_path.read_text() == audit_text
                and sha(inventory_path) == receipt["axiom_audit"]["declaration_inventory_sha256"],
                "Audit evidence changed")
        both = all(receipt["variants"][v]["status"] == "source_and_kernel_passed" for v in VARIANTS)
        if both:
            require(compiled == MODULES and sorted(actual_required) == REQUIRED, "Incomplete paired closure")
            fast, byte = (receipt["source_checks"][PREFIX + v] for v in VARIANTS)
            receipt["comparison"] = {
                "single_fixed_cut_only": True, "sequential_order": list(VARIANTS),
                "source_wall_seconds": {v: receipt["source_checks"][PREFIX + v]["seconds"] for v in VARIANTS},
                "source_user_seconds": {v: receipt["source_checks"][PREFIX + v]["user_seconds"] for v in VARIANTS},
                "source_peak_rss_kib": {v: receipt["source_checks"][PREFIX + v]["peak_rss_kib"] for v in VARIANTS},
                "observed_fast_to_byte_wall_ratio": fast["seconds"] / byte["seconds"] if byte["seconds"] else None,
                "general_speedup_inferred": False}
        receipt.update({"status": "passed" if both else "incomplete",
                        "both_variants_formally_verified": both,
                        "failure_kind": None if both else (
                            "variant_timeout" if any(r["timed_out"] for r in profiles) else "variant_failure"),
                        "compiled_project_modules": compiled, "all_frozen_hashes_unchanged": True})
    except BaseException as error:
        timed_out = any(r["timed_out"] for r in profiles) or time.monotonic() >= deadline
        receipt.update({"status": "incomplete" if timed_out else "failed", "error": str(error),
                        "failure_kind": "timeout" if timed_out else "verification_error"})
        raise
    finally:
        save(stage, receipt, seal=True)
        print(json.dumps({"status": receipt["status"],
                          "both_variants_formally_verified": receipt["both_variants_formally_verified"],
                          "variants": receipt["variants"], "receipt_sha256": sha(stage / "receipt.json")}),
              flush=True)
    return receipt["status"] == "passed"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write-model", action="store_true")
    parser.add_argument("--preflight", action="store_true")
    parser.add_argument("--initial-json", type=Path)
    parser.add_argument("--cuts-json", type=Path)
    parser.add_argument("--emit", type=Path)
    parser.add_argument("--packet-dir", type=Path)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--stage", type=Path)
    parser.add_argument("--runtime", type=Path)
    args = parser.parse_args()
    require(sum([args.write_model, args.preflight, args.emit is not None, args.stage is not None]) == 1,
            "Choose exactly one mode")
    if args.emit is not None:
        require(args.packet_dir is not None and args.initial_json is None and args.cuts_json is None,
                "Emission always regenerates the pinned complete numerical parents")
        print(json.dumps(emit(args.emit.resolve(), args.packet_dir.resolve(), args.check)), flush=True)
        return
    require(not args.check and args.packet_dir is None, "Check/packet flags require emission mode")
    if args.write_model:
        (ROOT / MODEL).write_bytes(encoded(model_recipe(args.initial_json, args.cuts_json)))
        print(json.dumps({"status": "model_written", "lean_verified": False, "modules": len(MODULES)}))
        return
    require(args.initial_json is None and args.cuts_json is None,
            "Verification cannot substitute saved producer packets")
    model = json.loads((ROOT / MODEL).read_bytes())
    validate_model(model)
    if args.preflight:
        print(json.dumps({"status": "preflight_passed", "modules": len(MODULES),
                          "required": len(REQUIRED), "lean_verified": False}))
        return
    if not verify(model, sha(ROOT / MODEL), args.stage.resolve(), args.runtime):
        raise SystemExit(2)


if __name__ == "__main__":
    main()
