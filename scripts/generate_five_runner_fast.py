#!/usr/bin/env python3
"""Render complete five-runner prime proofs in bounded numerical chunks.

Large roots use the original arithmetic, data, numerical-check, and assembly
sources before proof transport. Small roots share a module only while both
the frame and root-count budgets hold. Every numerical theorem retains the
original finite-set checker proposition after the checked transport.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import generate_five_runner_arithmetic as arithmetic
import generate_five_runner_assembly as assembly
import generate_five_runner_certificates as certificates
import generate_six_speed_prime_fast as transport
from generate_six_speed_late_prime_batches import require, sha, split_imports


ROOT = Path(__file__).resolve().parents[1]
PRODUCERS = (
    "scripts/generate_five_runner_certificates.py",
    "scripts/generate_five_runner_arithmetic.py",
    "scripts/generate_five_runner_assembly.py",
    "scripts/generate_six_speed_late_prime_batches.py",
)


def original_parts(data: dict, root: dict, block_size: int) -> dict[str, str]:
    base = f"Conjectures.LonelinessFiveRunnerPrime{data['p']:04d}"
    name = base + f"B{root['b']:03d}"
    parts = {name + "Arithmetic": arithmetic.root_arithmetic(data, root)}
    parts.update(certificates.lean_files({**data, "roots": [root]}, block_size))
    parts[name] = assembly.root_assembly(data, root, block_size)
    return parts


def render_baseline(data: dict, frame_budget: int = 128, block_size: int = 128,
           root_budget: int = 8, pilot_b2: bool = False) -> tuple[dict[str, str], dict]:
    require(data.get("schema") == "five-runner-prime-support-v1", "Unexpected input schema")
    require(1 <= frame_budget <= 128 and 1 <= block_size <= 128,
            "Numerical frame budgets must lie between one and 128")
    require(1 <= root_budget <= 8, "At most eight whole roots may share a module")
    arithmetic.validate(data)
    p, half = data["p"], data["half"]
    require(data.get("width") == half + 1, "Incorrect support-mask width")
    expected = list(range(2, half + 1))
    require([root["b"] for root in data["roots"]] == expected,
            "Input must contain every minimum pair exactly once, in order")
    for root in data["roots"]:
        certificates.validate_root(data, root)

    base = f"Conjectures.LonelinessFiveRunnerPrime{p:04d}"
    combined = dict(certificates.combined_files(data, block_size))
    original_roots = [base + f"B{b:03d}" for b in expected]
    require(set(combined) == {base, base + "Arithmetic", base + "Rows", *original_roots},
            "Original producer module inventory differs")
    emitted = {name: combined[name] for name in (base + "Arithmetic", base + "Rows")}
    batches = []
    heavy = []
    aggregate_imports = []
    selected_roots = data["roots"][:1] if pilot_b2 else data["roots"]
    pending: list[dict] = []
    pending_frames = 0
    covered = []

    def flush_small() -> None:
        nonlocal pending, pending_frames
        if not pending:
            return
        name = base + f"ChunkBatch{len(batches):03d}"
        imports: list[str] = []
        bodies: list[str] = []
        roots = []
        for root in pending:
            original_name = base + f"B{root['b']:03d}"
            original = combined[original_name]
            root_imports, body = split_imports(original)
            require(not any(dep in original_roots for dep in root_imports),
                    "Unexpected cross-root dependency")
            for dep in root_imports:
                if dep not in imports:
                    imports.append(dep)
            bodies.append(body)
            roots.append({"minimum_pair": root["b"], "frames": len(root["frames"]),
                          "original_module": original_name,
                          "original_source_sha256": sha(original),
                          "namespace_body_sha256": sha(body)})
        content = "\n".join("import " + dep for dep in imports) + "\n\n" + "\n".join(bodies)
        emitted[name] = content
        require(pending_frames <= frame_budget and len(roots) <= root_budget,
                "Whole-root batch exceeds its budget")
        batches.append({"module": name, "frames": pending_frames, "roots": roots,
                        "source_sha256": sha(content)})
        aggregate_imports.append(name)
        covered.extend(root["minimum_pair"] for root in roots)
        pending, pending_frames = [], 0

    for root in selected_roots:
        count = len(root["frames"])
        require(count > 0, "Empty support root")
        if count > frame_budget or pilot_b2:
            flush_small()
            name = base + f"B{root['b']:03d}"
            parts = original_parts(data, root, block_size)
            if pilot_b2:
                selected = [name + "Arithmetic", name + "Data", name + "Checks000"]
                parts = {module: parts[module] for module in selected}
            emitted.update(parts)
            _, original_body = split_imports(combined[name])
            heavy.append({
                "minimum_pair": root["b"], "frames": count,
                "original_module": name,
                "original_combined_source_sha256": sha(combined[name]),
                "original_combined_namespace_body_sha256": sha(original_body),
                "part_source_sha256": {module: sha(content) for module, content in parts.items()},
                "all_original_parts_emitted": not pilot_b2,
            })
            covered.append(root["b"])
            if not pilot_b2:
                aggregate_imports.append(name)
        else:
            if pending and (pending_frames + count > frame_budget or len(pending) >= root_budget):
                flush_small()
            pending.append(root)
            pending_frames += count
    flush_small()
    require(covered == ([2] if pilot_b2 else expected), "Lost, repeated, or reordered support root")

    aggregate = None
    if not pilot_b2:
        original_imports, body = split_imports(combined[base])
        require(original_imports[:len(original_roots)] == original_roots,
                "Original aggregate omitted or reordered a minimum pair")
        remaining = original_imports[len(original_roots):]
        require(not any(module in original_roots for module in remaining),
                "Original aggregate repeated a root")
        emitted[base] = "\n".join("import " + module for module in aggregate_imports + remaining)
        emitted[base] += "\n\n" + body
        _, actual_body = split_imports(emitted[base])
        require(actual_body == body, "Aggregate theorem body changed")
        aggregate = {"module": base, "original_source_sha256": sha(combined[base]),
                     "namespace_body_sha256": sha(body), "source_sha256": sha(emitted[base])}

    inventory = {
        "schema": "five-runner-prime-numerical-chunks-v1", "prime": p,
        "scope": "minimum-pair-two-first-check-block" if pilot_b2 else "complete-prime",
        "complete_prime_rendered": not pilot_b2,
        "frame_budget": frame_budget, "block_size": block_size, "root_budget": root_budget,
        "minimum_pairs": covered, "root_count": len(covered),
        "support_frames": sum(len(root["frames"]) for root in selected_roots),
        "numerical_check_frames_emitted": min(block_size, len(selected_roots[0]["frames"]))
            if pilot_b2 else sum(len(root["frames"]) for root in selected_roots),
        "generated_module_count": len(emitted),
        "source_sha256": {name: sha(content) for name, content in sorted(emitted.items())},
        "heavy_roots": heavy, "batches": batches, "aggregate": aggregate,
        "producer_sha256": {name: sha((ROOT / name).read_bytes()) for name in PRODUCERS},
        "wrapper_sha256": sha(Path(__file__).read_bytes()),
        "acceptance": "untrusted generated sources; strict source, axiom, and kernel gates pending",
        "earlier_batch_sources_modified": False,
    }
    return emitted, inventory



FROZEN_FAST_SOURCES = {
    "lean/Conjectures/LonelinessModularCoverFastCounts.lean":
        "bbc76f17ce5e115461d40d6ac0b75af9da2edb6dc1de1229bebd0dfd2e067361",
    "lean/Conjectures/LonelinessModularCoverFastCuts.lean":
        "64bce1f120297b1aa66b219c1f53a31c211b8741884442ea92c28b7a3a420a9d",
    "scripts/generate_six_speed_prime_fast.py":
        "9aaebac57c4f9e32839a21daa4c3a393322997c6db9c75b0de50aae9371ff59f",
}


def render(data: dict, frame_budget: int = 128, block_size: int = 128,
           root_budget: int = 8, pilot_b2: bool = False) -> tuple[dict[str, str], dict]:
    for name, digest in FROZEN_FAST_SOURCES.items():
        require(sha((ROOT / name).read_bytes()) == digest,
                "Reviewed fast-checker source differs: " + name)
    baseline, original_inventory = render_baseline(
        data, frame_budget, block_size, root_budget, pilot_b2)
    emitted = {}
    transports = []
    total = 0
    for module, original in baseline.items():
        source, count = transport.transform(original)
        expected = sum(transport.FRAME.fullmatch(line) is not None
                       for line in original.splitlines())
        require(count == expected, "An original frame proof escaped transport")
        if count == 0:
            require(source == original, "A nonnumerical source was modified")
        emitted[module] = source
        total += count
        transports.append({"module": module, "frames": count,
                           "original_source_sha256": sha(original),
                           "source_sha256": sha(source)})
    require(total == original_inventory["numerical_check_frames_emitted"],
            "Missing numerical proof transports")
    inventory = {key: original_inventory[key] for key in (
        "prime", "scope", "complete_prime_rendered", "frame_budget", "block_size",
        "root_budget", "minimum_pairs", "root_count", "support_frames",
        "numerical_check_frames_emitted", "generated_module_count")}
    inventory.update({
        "schema": "five-runner-prime-fast-chunks-v1",
        "source_sha256": {name: sha(content) for name, content in sorted(emitted.items())},
        "proof_transports": transports, "transported_frame_proofs": total,
        "baseline_chunks": original_inventory,
        "frozen_fast_sources_sha256": FROZEN_FAST_SOURCES,
        "wrapper_sha256": sha(Path(__file__).read_bytes()),
        "original_numerical_statements_preserved": True,
        "nonnumerical_source_bytes_preserved": True,
        "acceptance": "untrusted sources; strict source, axiom and stock kernel gates pending",
    })
    return emitted, inventory

def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    inputs = parser.add_mutually_exclusive_group(required=True)
    inputs.add_argument("--prime", type=int)
    inputs.add_argument("--load-json", type=Path)
    parser.add_argument("--lean-dir", type=Path, default=ROOT / "lean")
    parser.add_argument("--frame-budget", type=int, default=128)
    parser.add_argument("--block-size", type=int, default=128)
    parser.add_argument("--root-budget", type=int, default=8)
    parser.add_argument("--inventory-out", type=Path)
    parser.add_argument("--pilot-b2", action="store_true")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    if args.load_json is not None:
        data = json.loads(args.load_json.read_text())
    else:
        data = certificates.prime_data(args.prime)
        data["roots"] = [certificates.search_root(data, b) for b in range(2, data["half"] + 1)]
    emitted, inventory = render(data, args.frame_budget, args.block_size, args.root_budget,
                                args.pilot_b2)
    suffix = "-pilot-b2" if args.pilot_b2 else ""
    default = f"five-runner-prime{data['p']:04d}-fast-chunks{suffix}.json"
    inventory_path = args.inventory_out or (args.load_json.with_name(default)
        if args.load_json is not None else ROOT / ".candidate-artifacts" / default)
    for name, content in emitted.items():
        path = args.lean_dir / (name.replace(".", "/") + ".lean")
        if args.check:
            require(path.is_file() and path.read_text() == content,
                    "Generated chunk source differs: " + str(path))
        else:
            path.parent.mkdir(parents=True, exist_ok=True)
            if not path.is_file() or path.read_text() != content:
                path.write_text(content)
    encoded = json.dumps(inventory, indent=2, sort_keys=True) + "\n"
    if args.check:
        require(inventory_path.is_file() and inventory_path.read_text() == encoded,
                "Generated chunk inventory differs: " + str(inventory_path))
    else:
        inventory_path.parent.mkdir(parents=True, exist_ok=True)
        inventory_path.write_text(encoded)
    print(json.dumps({"prime": data["p"], "scope": inventory["scope"],
                      "minimum_pairs": len(inventory["minimum_pairs"]),
                      "modules": len(emitted), "heavy_roots": len(inventory["baseline_chunks"]["heavy_roots"]),
                      "small_batches": len(inventory["baseline_chunks"]["batches"]),
                      "check_frames": inventory["numerical_check_frames_emitted"],
                      "inventory": str(inventory_path), "check_only": args.check}, sort_keys=True))


if __name__ == "__main__":
    main()
