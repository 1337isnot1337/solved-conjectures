#!/usr/bin/env python3
"""Check the graph-to-packet adapter from its original verified dependencies.

This checks only six GraphPacket endpoints. The full cyclic theorem remains
a separate gate that also requires the complete transport Results closure.
"""
from __future__ import annotations

import argparse
import json
import os
from pathlib import Path
import shutil
import subprocess

import verify_frankl_span_four_final as final

ROOT = final.ROOT
common = final.common
orbit = final.orbit
evidence = final.evidence
sha = final.sha
require = final.require
encoded = final.encoded
ALLOWED = final.ALLOWED
source_path = final.source_path
stage_provider = final.stage_provider
assert_sources_and_helpers = final.assert_sources_and_helpers
kernel_profile = final.kernel_profile
replay_names = final.replay_names
PACKET = "Conjectures.FranklSpanFourGraphPacket"
CONTROLLER_SHA256 = "7676ef9ca925a15446844b86b8c2043a7c5d6d8a25d4162d17edfb414a96947b"
OWN_INPUTS = (*final.OWN_INPUTS,
    "scripts/verify_frankl_graph_packet_composed.py",
    ".github/workflows/lean-frankl-graph-packet-composed.yml")


def packet_plan():
    require(sha((ROOT / "scripts/verify_frankl_span_four_final.py").read_bytes())
            == CONTROLLER_SHA256, "The reviewed archive validator differs")
    full_model = json.loads((ROOT / final.MODEL_PATH).read_text())
    full_modules, full_fresh = final.preflight(full_model)
    require(PACKET in full_fresh, "Graph packet is not a fresh theorem source")
    modules = final.dependency_order(PACKET)
    require(modules[-1] == PACKET and set(modules) <= set(full_modules),
            "Packet import closure escaped the frozen full theorem")
    require(set(modules) & set(full_fresh) == {PACKET},
            "Packet closure unexpectedly imports another unchecked assembly")
    required = {PACKET: full_model["required_by_module"][PACKET]}
    require(len(required[PACKET]) == 6, "Packet theorem inventory differs")
    model = json.loads(json.dumps(full_model))
    model["root"] = PACKET
    model["scope"] = (
        "Six graph-to-packet adapter theorems from the complete checked graph; "
        "not the complete cyclic span-four theorem")
    model["source_sha256"] = {m: full_model["source_sha256"][m] for m in modules}
    model["required_by_module"] = required
    model["providers"] = {
        k: model["providers"][k] for k in ("full-graph", "literal-weights")}
    covered = set()
    for profile in model["providers"].values():
        require(final.binding_complete(profile["binding"]),
                "Packet dependency lacks immutable artifact bindings")
        final.validate_binding(profile["binding"])
        profile["excluded_modules"] = sorted(set(profile["source_sha256"]) - set(modules))
        included = set(profile["source_sha256"]) - set(profile["excluded_modules"])
        require(PACKET not in included, "Fresh packet supplied by an old archive")
        for module in included:
            require(profile["source_sha256"][module] == model["source_sha256"][module],
                    "Packet dependency source identity differs")
        covered.update(included)
    require(covered == set(modules) - {PACKET},
            "Both original artifacts do not cover the exact packet closure")
    common.exact_selector(modules, PACKET)
    return model, modules


def verify(model, modules, fresh, stage):
    import audit_lean_owned_extension as owned_audit
    require(final.readiness(model)["ready"], "Both bound graph-packet dependency runs must pass")
    require(not stage.exists() or not any(stage.iterdir()), "Choose a fresh evidence directory")
    for path in ("src", "lib/lean", "logs", "progress", "dependencies"):
        (stage / path).mkdir(parents=True, exist_ok=True)
    compiler, external, toolchain = orbit.resolve_runtime(None)
    common.validate_toolchain(toolchain)
    own_hashes = {path: sha((ROOT / path).read_bytes()) for path in OWN_INPUTS}
    frozen, identities = {}, {}
    receipt = {
        "schema": "frankl-span-four-graph-packet-composed-v1", "status": "running",
        "scope": model["scope"], "root": model["root"],
        "git_commit": subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip(),
        "project_modules": modules, "source_sha256": model["source_sha256"],
        "configuration_sha256": model["configuration_sha256"],
        "gate_sha256": own_hashes, "helper_sha256": model["helper_sha256"],
        "required_by_module": model["required_by_module"], "toolchain": toolchain,
        "fresh_source_modules": fresh, "fresh_replay_modules": fresh,
        "dependency_replays": [], "source_checks": {}, "kernel_checks": {},
        "axiom_whitelist": ALLOWED, "source_workers": 1, "kernel_threads": 1,
        "accepted_package_replay": False, "frozen_evidence_sha256": frozen,
    }
    def save():
        (stage / "receipt.json").write_bytes(encoded(receipt))
    try:
        for name, profile in model["providers"].items():
            binding = profile["binding"]
            artifact = evidence.api("/actions/artifacts/" + str(binding["artifact_id"]))
            require(artifact["archive_download_url"] == evidence.API + "/actions/artifacts/" +
                    str(binding["artifact_id"]) + "/zip", "Unexpected dependency download URL")
            payload = evidence.request(artifact["archive_download_url"], limit=profile["compressed_limit"])
            reference = stage_provider(stage, name, artifact, payload, profile, model, identities, frozen)
            receipt["dependency_replays"].append(reference)
            print(json.dumps({"validated_provider": name, "staged_modules": len(identities),
                              "receipt_sha256": binding["receipt_sha256"]}), flush=True)
            del payload
        dependencies = set(modules) - set(fresh)
        require(set(identities) == dependencies, "Dependency stage does not cover exact theorem closure")
        objects = orbit.artifact_hashes(stage, sorted(dependencies))
        require(objects == {m: row["identity"]["facets"] for m, row in identities.items()},
                "Reused complete object inventory differs")
        common.freeze_bytes(stage, "dependency-identities.json", encoded(identities), frozen)
        receipt["dependency_identity_sha256"] = frozen["dependency-identities.json"]
        common.assert_frozen(stage, frozen)
        environment = {
            **os.environ,
            "PATH": str(compiler / "bin") + os.pathsep + os.environ.get("PATH", ""),
            "LEAN_PATH": os.pathsep.join([str(stage / "lib/lean"), *external]),
            "LEAN_SYSROOT": str(compiler),
            "LEAN_NUM_THREADS": "1",
            "UV_USE_IO_URING": "0",
        }
        for module in fresh:
            stem = module.replace(".", "/")
            common.freeze_bytes(stage, "src/" + stem + ".lean",
                                (ROOT / source_path(module)).read_bytes(), frozen)
            output = stage / "lib/lean" / (stem + ".olean")
            output.parent.mkdir(parents=True, exist_ok=True)
            command = [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true",
                       "-o", str(output), stem + ".lean"]
            check = orbit.profile(command, stage / "src", environment,
                stage / "logs" / (module + ".source.log"),
                stage / "progress" / (module + ".source.json"), 1800)
            receipt["source_checks"][module] = check
            save()
            common.strict_profile(check, toolchain, stem + ".lean")
            frozen["logs/" + module + ".source.log"] = check["log_sha256"]
        final_objects = orbit.artifact_hashes(stage, modules)
        require({m: row for m, row in final_objects.items() if m in dependencies} == objects,
                "A reused proof object changed during compilation")
        receipt["artifact_sha256"] = final_objects
        for module in fresh:
            stem = module.replace(".", "/")
            for suffix, digest in final_objects[module].items():
                frozen["lib/lean/" + stem + suffix] = digest
        audit_name = "GraphPacketAudit.lean"
        audit_raw = owned_audit.audit_source(modules, fresh, model["required_by_module"]).encode()
        common.freeze_bytes(stage, "src/" + audit_name, audit_raw, frozen)
        command = [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true", audit_name]
        audit = orbit.profile(command, stage / "src", environment,
            stage / "logs/final-owned-audit.log", stage / "progress/final-owned-audit.json", 1800)
        receipt["axiom_audit"] = audit
        save()
        common.strict_profile(audit, toolchain, audit_name)
        log_text = Path(audit["log"]).read_text()
        details = owned_audit.validate_log(log_text, modules, fresh, model["required_by_module"])
        audit.update({"source_sha256": sha(audit_raw), "all_owned_declarations_audited": True,
                      "owned_modules": fresh, "imported_project_modules": modules,
                      "explicit_import_all_owned_roots": True, "inventory": details})
        frozen["logs/final-owned-audit.log"] = audit["log_sha256"]
        common.assert_frozen(stage, frozen)
        replayed = []
        for module in fresh:
            selected = common.exact_selector(modules, module)
            command = [str(compiler / "bin/leanchecker"), "-v", module]
            if buffer := shutil.which("stdbuf"):
                command = [buffer, "-oL", "-eL", *command]
            check = orbit.profile(command, stage / "src", environment,
                stage / "logs" / (module + ".kernel.log"),
                stage / "progress" / (module + ".kernel.json"), 1800)
            receipt["kernel_checks"][module] = check
            save()
            kernel_profile(check, toolchain, module)
            require(replay_names(Path(check["log"]).read_bytes()) == selected,
                    "Fresh stock replay did not target exactly its module")
            check.update({"replayed_modules": selected, "exact_singleton_target": True})
            frozen["logs/" + module + ".kernel.log"] = check["log_sha256"]
            replayed.extend(selected)
        require(replayed == fresh, "Fresh replay order/set differs")
        receipt["kernel_replay"] = {
            "replayed_modules": replayed, "exact_singleton_selection": True,
            "fresh_process_per_module": True, "dependency_replays_recorded_separately": True,
            "seconds": round(sum(c["seconds"] for c in receipt["kernel_checks"].values()), 3),
            "peak_rss_kib": max(c["peak_rss_kib"] for c in receipt["kernel_checks"].values()),
        }
        require(final_objects == orbit.artifact_hashes(stage, modules),
                "A proof object changed during final audit/replay")
        assert_sources_and_helpers(model, stage)
        require(own_hashes == {p: sha((ROOT / p).read_bytes()) for p in OWN_INPUTS},
                "The final controller/model/workflow changed")
        require(sha((compiler / "bin/lean").read_bytes()) == evidence.LEAN_SHA256
                and sha((compiler / "bin/leanchecker").read_bytes()) == evidence.CHECKER_SHA256,
                "Compiler or stock checker changed")
        common.assert_frozen(stage, frozen)
        receipt.update({
            "status": "passed", "all_frozen_hashes_unchanged": True,
            "graph_packet_checked": True,
            "complete_span_four_theorem_checked": False,
        })
    except BaseException as error:
        receipt.update({"status": "failed", "error": str(error)})
        raise
    finally:
        save()
    print(json.dumps({"status": "passed", "root": model["root"],
        "imported_modules": len(modules), "fresh_modules": fresh,
        "required_endpoints": sum(map(len, model["required_by_module"].values())),
        "receipt_sha256": sha((stage / "receipt.json").read_bytes())}), flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--plan", action="store_true")
    parser.add_argument("--artifact-dir", type=Path,
        default=ROOT / ".candidate-artifacts/frankl-graph-packet-composed")
    args = parser.parse_args()
    model, modules = packet_plan()
    if args.plan:
        print(json.dumps({
            "root": PACKET, "project_modules": modules,
            "fresh_modules": [PACKET], "required_endpoints": model["required_by_module"][PACKET],
            "providers": {name: {
                "binding": profile["binding"],
                "included_modules": sorted(set(profile["source_sha256"]) -
                                           set(profile["excluded_modules"])),
            } for name, profile in model["providers"].items()},
            "complete_span_four_theorem_checked": False,
        }, indent=2))
        return
    verify(model, modules, [PACKET], args.artifact_dir.resolve())


if __name__ == "__main__":
    main()
