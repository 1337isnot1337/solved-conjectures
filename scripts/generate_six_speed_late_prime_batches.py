#!/usr/bin/env python3
"""Batch complete six-speed support certificates without changing their proofs.

The three original producers remain authoritative for the rendered statements
and namespace bodies. This wrapper changes only module boundaries and aggregate
imports. It records every original root, its complete body hash, its batch, and
all emitted source hashes. Generated sources still require strict compilation,
the all-owned axiom audit, and stock kernel replay before acceptance.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import re

import generate_six_speed_prime_arithmetic as arithmetic
import generate_six_speed_prime_certificates as certificates


ROOT = Path(__file__).resolve().parents[1]
IMPORT = re.compile(r"import ([A-Za-z0-9_]+(?:\.[A-Za-z0-9_]+)*)")
PRODUCERS = (
    "scripts/generate_six_speed_prime_certificates.py",
    "scripts/generate_six_speed_prime_arithmetic.py",
    "scripts/generate_six_speed_prime_assembly.py",
)


def require(condition: bool, message: str) -> None:
    if not condition:
        raise ValueError(message)


def sha(content: str | bytes) -> str:
    return hashlib.sha256(content.encode() if isinstance(content, str) else content).hexdigest()


def split_imports(content: str) -> tuple[list[str], str]:
    """Return the original namespace body unchanged, including its last newline."""
    header, separator, body = content.partition("\n\n")
    require(bool(separator), "Missing generated import/body separator")
    imports = []
    for line in header.splitlines():
        match = IMPORT.fullmatch(line)
        require(match is not None, "Unexpected generated header line: " + line)
        imports.append(match.group(1))
    require(bool(imports), "Empty generated import header")
    require(not re.search(r"^import\s", body, re.MULTILINE),
            "Unexpected import inside a generated namespace body")
    require(content == "\n".join("import " + name for name in imports) + "\n\n" + body,
            "Import splitting failed exact reconstruction")
    return imports, body


def render(data: dict, frame_budget: int, block_size: int) -> tuple[dict[str, str], dict]:
    require(data.get("schema") == "six-speed-prime-support-v1", "Unexpected input schema")
    require(frame_budget > 0 and block_size > 0, "Budgets must be positive")
    arithmetic.validate(data)
    p, half = data["p"], data["half"]
    require(data.get("width") == half + 1, "Incorrect support-mask width")
    expected = list(range(2, half + 1))
    require([root["b"] for root in data["roots"]] == expected,
            "Batch rendering requires every minimum pair exactly once, in order")
    for root in data["roots"]:
        certificates.validate_root(data, root)

    base = f"Conjectures.LonelinessSixSpeedPrime{p:04d}"
    originals = dict(certificates.combined_files(data, block_size))
    root_modules = [base + f"B{b:03d}" for b in expected]
    require(set(originals) == {base, base + "Arithmetic", base + "Rows", *root_modules},
            "Original renderer emitted an unexpected module set")

    groups: list[list[dict]] = []
    group: list[dict] = []
    count = 0
    for root in data["roots"]:
        frames = len(root["frames"])
        require(frames > 0, "Empty support root")
        if group and count + frames > frame_budget:
            groups.append(group)
            group, count = [], 0
        group.append(root)
        count += frames
    if group:
        groups.append(group)
    require([root["b"] for group in groups for root in group] == expected,
            "Batch grouping lost or repeated a minimum pair")

    emitted = {name: originals[name] for name in (base + "Arithmetic", base + "Rows")}
    batches = []
    for index, group in enumerate(groups):
        name = base + f"Batch{index:03d}"
        imports: list[str] = []
        bodies: list[str] = []
        roots = []
        for root in group:
            original_name = base + f"B{root['b']:03d}"
            original = originals[original_name]
            root_imports, body = split_imports(original)
            require(not any(imported in root_modules for imported in root_imports),
                    "Cross-root imports need an explicit dependency-aware batch design")
            for imported in root_imports:
                if imported not in imports:
                    imports.append(imported)
            bodies.append(body)
            roots.append({
                "minimum_pair": root["b"],
                "frames": len(root["frames"]),
                "original_module": original_name,
                "original_source_sha256": sha(original),
                "namespace_body_sha256": sha(body),
            })
        content = "\n".join("import " + imported for imported in imports) + "\n\n"
        content += "\n".join(bodies)
        emitted[name] = content
        frames = sum(root["frames"] for root in roots)
        require(frames <= frame_budget or len(roots) == 1,
                "An oversized batch contains more than one complete root")
        batches.append({"module": name, "frames": frames, "roots": roots,
                        "source_sha256": sha(content)})

    aggregate_imports, aggregate_body = split_imports(originals[base])
    require(aggregate_imports[:len(root_modules)] == root_modules,
            "Original aggregate root imports are incomplete or reordered")
    other_imports = aggregate_imports[len(root_modules):]
    require(not any(name in root_modules for name in other_imports),
            "Repeated original root import")
    new_imports = [batch["module"] for batch in batches] + other_imports
    emitted[base] = "\n".join("import " + name for name in new_imports) + "\n\n" + aggregate_body
    _, emitted_body = split_imports(emitted[base])
    require(emitted_body == aggregate_body, "Aggregate theorem body changed")

    inventory = {
        "schema": "six-speed-complete-prime-batches-v1",
        "prime": p,
        "frame_budget": frame_budget,
        "block_size": block_size,
        "minimum_pairs": expected,
        "root_count": len(expected),
        "support_frames": sum(len(root["frames"]) for root in data["roots"]),
        "generated_module_count": len(emitted),
        "source_sha256": {name: sha(content) for name, content in sorted(emitted.items())},
        "batches": batches,
        "aggregate": {
            "module": base,
            "original_source_sha256": sha(originals[base]),
            "namespace_body_sha256": sha(aggregate_body),
            "source_sha256": sha(emitted[base]),
        },
        "producer_sha256": {name: sha((ROOT / name).read_bytes()) for name in PRODUCERS},
        "wrapper_sha256": sha(Path(__file__).read_bytes()),
        "acceptance": "untrusted generated sources; strict source, axiom, and kernel gates pending",
        "unbatched_root_files_modified": False,
    }
    return emitted, inventory


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    source = parser.add_mutually_exclusive_group(required=True)
    source.add_argument("--load-json", type=Path)
    source.add_argument("--prime", type=int)
    parser.add_argument("--lean-dir", type=Path, default=ROOT / "lean")
    parser.add_argument("--frame-budget", type=int, default=2000)
    parser.add_argument("--block-size", type=int, default=128)
    parser.add_argument("--inventory-out", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    if args.load_json is not None:
        data = json.loads(args.load_json.read_text())
    else:
        data = certificates.prime_data(args.prime)
        data["roots"] = [certificates.search_root(data, b)
                         for b in range(2, data["half"] + 1)]
    emitted, inventory = render(data, args.frame_budget, args.block_size)
    default_inventory = (args.load_json.with_name(f"prime{data['p']:04d}-batches.json")
                         if args.load_json is not None else
                         ROOT / ".candidate-artifacts" / f"prime{data['p']:04d}-batches.json")
    inventory_path = args.inventory_out or default_inventory
    for name, content in emitted.items():
        path = args.lean_dir / (name.replace(".", "/") + ".lean")
        if args.check:
            require(path.is_file() and path.read_text() == content,
                    "Generated batch source differs: " + str(path))
        else:
            path.parent.mkdir(parents=True, exist_ok=True)
            if not path.is_file() or path.read_text() != content:
                path.write_text(content)
    encoded = json.dumps(inventory, indent=2, sort_keys=True) + "\n"
    if args.check:
        require(inventory_path.is_file() and inventory_path.read_text() == encoded,
                "Generated batch inventory differs: " + str(inventory_path))
    else:
        inventory_path.parent.mkdir(parents=True, exist_ok=True)
        inventory_path.write_text(encoded)
    print(json.dumps({"prime": data["p"], "minimum_pairs": inventory["root_count"],
                      "support_frames": inventory["support_frames"],
                      "batches": len(inventory["batches"]), "modules": len(emitted),
                      "inventory": str(inventory_path), "check_only": args.check}, sort_keys=True))


if __name__ == "__main__":
    main()
