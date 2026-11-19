#!/usr/bin/env python3
"""Package complete support tapes into bounded, exactly checked cut fragments.

The original initial-support packet and every tape instruction are preserved.
Only the table of frames is coarsened. Every reuse names a strictly earlier
cut and checks all six original state fields through Cuts.fragmentCheck.
The emitted theorem is the original SupportSearch.check proposition.

This is an untrusted producer. Python validation and source generation make
no Lean verification claim. A selected subset of roots has no global theorem.
"""
from __future__ import annotations

import argparse
from collections import Counter
import copy
import hashlib
import json
from pathlib import Path

import generate_modular_initial_support as initial


SCHEMA = "modular-support-cut-fragments-v1"
CUTS = initial.CUTS


def encoded(value) -> bytes:
    return (json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode()


def digest(value) -> str:
    return hashlib.sha256(encoded(value)).hexdigest()


def names(data: dict, limit: int) -> tuple[str, str]:
    module, namespace = initial.names(data)
    return module + f"Cut{limit:03d}", namespace + f".Cut{limit:03d}"


def fragment_size(fragment: dict) -> int:
    if fragment["kind"] in ("reuse", "leaf"):
        return 1
    if fragment["kind"] == "split":
        return 1 + fragment_size(fragment["left"]) + fragment_size(fragment["right"])
    raise ValueError("Unknown fragment kind")


def compress_root(root: dict, limit: int) -> dict:
    """Postorder coarsening; no search instruction or original frame changes."""
    cuts, pending, sizes, cut_for = [], {}, {}, {}

    def cut(index: int) -> dict:
        if index not in cut_for:
            cut_for[index] = len(cuts)
            cuts.append({"frame": {key: root["frames"][index][key]
                                    for key in initial.FRAME_KEYS},
                         "fragment": pending[index], "size": sizes[index]})
        pending[index] = {"kind": "reuse", "index": cut_for[index]}
        sizes[index] = 1
        return pending[index]

    for index, node in enumerate(root["nodes"]):
        if node["kind"] != "split":
            pending[index], sizes[index] = {"kind": "leaf"}, 1
            continue
        left, right = node["left"], node["right"]
        if not (0 <= left < index and 0 <= right < index):
            raise ValueError("The original tape is not in postorder")
        while 1 + sizes[left] + sizes[right] > limit:
            chosen = left if sizes[left] >= sizes[right] else right
            if sizes[chosen] == 1:
                raise ValueError("The fragment limit cannot hold a split")
            cut(chosen)
        pending[index] = {"kind": "split", "left": pending[left], "right": pending[right]}
        sizes[index] = 1 + sizes[left] + sizes[right]
    cut(root["root_index"])
    result = {"b": root["b"], "original_frames": len(root["frames"]),
              "root_cut": cut_for[root["root_index"]], "cuts": cuts}
    validate_root(root, result, limit)
    return result


def validate_root(root: dict, compressed: dict, limit: int) -> None:
    """Independently walk fragments against the original exact state table."""
    if set(compressed) != {"b", "original_frames", "root_cut", "cuts"}:
        raise ValueError("Unexpected compressed-root fields")
    if compressed["b"] != root["b"] or compressed["original_frames"] != len(root["frames"]):
        raise ValueError("Compressed root does not identify its original tape")
    cuts = compressed["cuts"]
    if not cuts or compressed["root_cut"] != len(cuts) - 1:
        raise ValueError("The root cut must be the final checked entry")
    instructions, references = Counter(), []

    def same_state(left: dict, right: dict) -> bool:
        return all(left[key] == right[key] for key in initial.FRAME_KEYS)

    def walk(fragment: dict, frame: dict, bound: int) -> int:
        index = frame["index"]
        if type(index) is not int or not 0 <= index < len(root["frames"]):
            raise ValueError("Invalid original instruction index")
        if not same_state(frame, root["frames"][index]):
            raise ValueError("A fragment changed an original state")
        kind = fragment.get("kind")
        if kind == "reuse":
            if set(fragment) != {"kind", "index"}:
                raise ValueError("Unexpected reuse fields")
            previous = fragment["index"]
            if type(previous) is not int or not 0 <= previous < bound:
                raise ValueError("A cut reference is not strictly earlier")
            if not same_state(frame, cuts[previous]["frame"]):
                raise ValueError("A reused frame differs in an exact state field")
            references[bound].append(previous)
            return 1
        node = root["nodes"][index]
        instructions[index] += 1
        if kind == "leaf":
            if set(fragment) != {"kind"} or node["kind"] == "split":
                raise ValueError("A fragment leaf skipped an original split")
            return 1
        if kind != "split" or set(fragment) != {"kind", "left", "right"} or node["kind"] != "split":
            raise ValueError("A fragment split does not follow the original tape")
        # The independent initial-packet replay has already checked both exact
        # state transitions, including fuel and every bit-mask operation.
        left = walk(fragment["left"], root["frames"][node["left"]], bound)
        right = walk(fragment["right"], root["frames"][node["right"]], bound)
        return 1 + left + right

    for index, cut in enumerate(cuts):
        if set(cut) != {"frame", "fragment", "size"} or set(cut["frame"]) != set(initial.FRAME_KEYS):
            raise ValueError("Unexpected cut fields")
        references.append([])
        size = walk(cut["fragment"], cut["frame"], index)
        if type(cut["size"]) is not int or cut["size"] != size or not 1 <= size <= limit:
            raise ValueError("Incorrect bounded fragment size")
    if not same_state(cuts[-1]["frame"], root["initial"]):
        raise ValueError("The final cut does not prove the original root")
    reachable = {len(cuts) - 1}
    for index in range(len(cuts) - 1, -1, -1):
        if index in reachable:
            reachable.update(references[index])
    if reachable != set(range(len(cuts))):
        raise ValueError("The cut table contains unreachable obligations")
    if set(instructions) != set(range(len(root["nodes"]))):
        raise ValueError("A tape instruction is missing from the bounded fragments")


def produce(data: dict, limit: int = 31, cuts_per_module: int = 4) -> dict:
    initial.validate(data)
    if type(limit) is not int or not 3 <= limit <= 127 or limit % 2 != 1:
        raise ValueError("The fragment limit must be an odd integer between3 and127")
    if type(cuts_per_module) is not int or not 1 <= cuts_per_module <= 32:
        raise ValueError("A source block must have between1 and32 cut obligations")
    packet = {"schema": SCHEMA, "initial_data_sha256": digest(data),
              "fragment_limit": limit, "cuts_per_module": cuts_per_module,
              "roots": [compress_root(root, limit) for root in data["roots"]]}
    validate(data, packet, initial_validated=True)
    return packet


def validate(data: dict, packet: dict, *, initial_validated: bool = False) -> None:
    if not initial_validated:
        initial.validate(data)
    if set(packet) != {"schema", "initial_data_sha256", "fragment_limit", "cuts_per_module", "roots"}:
        raise ValueError("Unexpected cut-packet fields")
    if packet["schema"] != SCHEMA or packet["initial_data_sha256"] != digest(data):
        raise ValueError("The cut packet is not bound to the exact initial data")
    limit, block = packet["fragment_limit"], packet["cuts_per_module"]
    if type(limit) is not int or not 3 <= limit <= 127 or limit % 2 != 1:
        raise ValueError("Invalid fragment limit")
    if type(block) is not int or not 1 <= block <= 32:
        raise ValueError("Invalid cut-block size")
    if len(packet["roots"]) != len(data["roots"]):
        raise ValueError("A minimum-pair root is missing")
    for root, compressed in zip(data["roots"], packet["roots"], strict=True):
        validate_root(root, compressed, limit)


def fragment_literal(fragment: dict) -> str:
    if fragment["kind"] == "leaf":
        return ".leaf"
    if fragment["kind"] == "reuse":
        return f"(.reuse {fragment['index']})"
    return "(.split " + fragment_literal(fragment["left"]) + " " + fragment_literal(fragment["right"]) + ")"


def rewrite(source: str, data: dict, limit: int) -> str:
    old_base, old_ns = initial.names(data)
    base, ns = names(data, limit)
    return source.replace(old_base, base).replace(old_ns, ns).replace(
        "Generated by scripts/generate_modular_initial_support.py.",
        "Generated by scripts/generate_modular_support_cut_fragments.py; the original support tape is unchanged.")


def finish(lines: list[str], namespace: str) -> str:
    return initial.finish(lines, namespace).replace(
        "Generated by scripts/generate_modular_initial_support.py.",
        "Generated by scripts/generate_modular_support_cut_fragments.py.")


def root_sources(data: dict, root: dict, compressed: dict, limit: int, block: int):
    base, parent = names(data, limit)
    p, den, width, b = data["prime"], data["denominator"], data["width"], root["b"]
    module, ns = base + f"B{b:04d}", parent + f".B{b:04d}"
    old_module, arithmetic = next(initial.root_sources(data, root, 1))
    yield old_module.replace(initial.names(data)[0], base), rewrite(arithmetic, data, limit)
    node_literals = []
    for node in root["nodes"]:
        if node["kind"] == "split":
            node_literals.append(f"(.split {node['candidate']} {node['left']} {node['right']})")
        elif node["kind"] == "incompatible":
            node_literals.append(f"(.leaf (.incompatible {node['first']} {node['second']}))")
        else:
            node_literals.append(f"(.leaf (.{node['kind']} {node['value']}))")
    cuts, state, root_cut = compressed["cuts"], root["initial"], compressed["root_cut"]
    lines = initial.header([module + "Arithmetic", base + "RowsData", "Conjectures.LonelinessModularCoverCuts"], ns,
                           f"Unchanged original tape and exact cut frames for minimum pair {b}.")
    lines += ["noncomputable section", "", "def nodeData : Lean.RArray SupportSearch.Tape.Node :=",
              initial.rarray(node_literals), "", "def lookup (index : ℕ) : SupportSearch.Tape.Node := nodeData.get index", "",
              "def tree : SupportSearch.Tree :=",
              f"  SupportSearch.Tape.toTree lookup {state['fuel']} {root['root_index']}", "",
              f"def frameData : Lean.RArray {CUTS}.Frame :=",
              initial.rarray([initial.frame_literal(cut["frame"]) for cut in cuts]), "",
              f"def frames (index : ℕ) : {CUTS}.Frame := frameData.get index", "",
              f"def fragmentData : Lean.RArray {CUTS}.Fragment :=",
              initial.rarray([fragment_literal(cut["fragment"]) for cut in cuts]), "",
              f"def fragments (index : ℕ) : {CUTS}.Fragment := fragmentData.get index", "",
              f"def rootFrame : {CUTS}.Frame := {initial.frame_literal(state)}", "", "end"]
    yield module + "Data", finish(lines, ns)
    count = len(cuts)
    for number, start in enumerate(range(0, count, block)):
        length = min(block, count - start)
        lines = initial.header([module + "Data", "Conjectures.LonelinessModularCoverFastCuts", "Mathlib.Tactic.FinCases"], ns,
                               f"Exact bounded cut obligations {start} through{start+length-1}; limit{limit}.", numeric=True)
        for i in range(start, start + length):
            lines += [f"theorem cut{i:06d}_checked :",
                      f"    {CUTS}.boundedCheck coverMask compatibleMask terminal lookup frames {i} {limit}",
                      f"      (fragments {i}) (frames {i}) = true := by",
                      "  apply SupportSearch.Bits.FastCuts.boundedCheck_sound", "  decide +kernel", ""]
        lines += [f"theorem block{number:04d}_checked (i : Fin {length}) :",
                  f"    {CUTS}.boundedCheck coverMask compatibleMask terminal lookup frames (i.val+{start}) {limit}",
                  f"      (fragments (i.val+{start})) (frames (i.val+{start})) = true := by", "  fin_cases i"]
        lines += [f"  · exact cut{i:06d}_checked" for i in range(start, start + length)]
        yield module + f"Checks{number:04d}", finish(lines, ns)
    blocks = (count + block - 1) // block
    lines = initial.header([module + f"Checks{i:04d}" for i in range(blocks)], ns,
                           f"Assemble every exact cut for minimum pair{b}; all original instructions remain checked.")
    lines += [f"theorem table_checks (index : ℕ) (hi : index < {count}) :",
              f"    {CUTS}.boundedCheck coverMask compatibleMask terminal lookup frames index {limit}",
              "      (fragments index) (frames index) = true := by"]
    lines += initial.block_join(count, block, "index", "hi", "block", "_checked")
    lines += ["", f"theorem all_frames_checked (index : ℕ) (hi : index < {count}) :",
              f"    {CUTS}.Frame.Checked coverMask compatibleMask terminal lookup (frames index) :=",
              f"  {CUTS}.table_sound coverMask compatibleMask terminal lookup frames fragments",
              f"    {count} {limit} table_checks index hi", "",
              f"theorem root_frame_eq : frames {root_cut} = rootFrame := by", "  decide +kernel", "",
              "theorem root_tape_checked :",
              f"    SupportSearch.Bits.tapeCheck coverMask compatibleMask terminal lookup {state['fuel']} {state['index']}",
              f"      {state['selected']} {state['available']} {state['uncovered']} {state['slots']} = true := by",
              f"  have h := all_frames_checked {root_cut} (by decide)", "  rw [root_frame_eq] at h", "  exact h", "",
              "theorem tape_checked :",
              f"    SupportSearch.Bits.tapeCheck (InitialMemo.cover {den} {p} coverTable)",
              f"      (InitialMemo.compatible {p} inverse {width} compatibleTable {b})",
              f"      terminal lookup {state['fuel']} {state['index']}",
              f"      (InitialBits.encode (InitialSupport.selected {b}))",
              f"      (InitialBits.encode (InitialSupport.available {p} inverse {b}))",
              f"      (InitialBits.encode (InitialSupport.uncovered {den} {p} {b})) {state['slots']} = true := by",
              "  rw [selected_mask_checked, available_mask_checked, uncovered_mask_checked]", "  exact root_tape_checked", "",
              "theorem root_checked :",
              f"    SupportSearch.check (InitialSupport.badTimes {den} {p})",
              f"      (InitialSupport.pairCompatible {p} inverse {b}) terminal tree",
              f"      (InitialSupport.selected {b}) (InitialSupport.available {p} inverse {b})",
              f"      (InitialSupport.uncovered {den} {p} {b}) {state['slots']} = true := by",
              f"  exact InitialMemo.checked_tree {den} {p} inverse {width} (by decide)",
              f"    coverTable compatibleTable cover_checked compatible_checked {b}",
              f"    terminal lookup {state['fuel']} {state['index']} {state['slots']} tape_checked"]
    yield module, finish(lines, ns)


def lean_sources(data: dict, packet: dict, pairs: list[int] | None = None) -> dict[str, str]:
    validate(data, packet)
    limit, block = packet["fragment_limit"], packet["cuts_per_module"]
    original_base, _ = initial.names(data)
    base, _ = names(data, limit)
    available = [root["b"] for root in data["roots"]]
    requested = available if pairs is None else pairs
    if requested != sorted(set(requested)) or not set(requested) <= set(available):
        raise ValueError("Requested roots are not an ordered subset of the complete packet")
    sources = {base + "Arithmetic": rewrite(initial.arithmetic_source(data), data, limit)}
    for module, source in initial.rows_sources(data, 16):
        sources[module.replace(original_base, base)] = rewrite(source, data, limit)
    for root, compressed in zip(data["roots"], packet["roots"], strict=True):
        if root["b"] in requested:
            sources.update(root_sources(data, root, compressed, limit, block))
    if data["status"] == "complete" and requested == available:
        sources[base] = rewrite(initial.aggregate_source(data), data, limit)
    return sources


def summary(data: dict, packet: dict) -> dict:
    cuts = [cut for root in packet["roots"] for cut in root["cuts"]]
    return {"schema": SCHEMA, "status": data["status"], "speeds": data["speeds"],
            "denominator": data["denominator"], "prime": data["prime"],
            "minimum_pairs": [root["b"] for root in data["roots"]],
            "original_frames": sum(len(root["frames"]) for root in data["roots"]),
            "cut_frames": len(cuts), "fragment_limit": packet["fragment_limit"],
            "maximum_fragment_size": max((cut["size"] for cut in cuts), default=0),
            "cuts_per_module": packet["cuts_per_module"],
            "initial_data_sha256": packet["initial_data_sha256"], "cut_packet_sha256": digest(packet),
            "lean_verified": False, "binary_lifting_verified": False,
            "integer_classification_verified": False}


def self_test() -> dict:
    reports = []
    for n, den, p in [(2, 3, 2), (3, 4, 7), (5, 6, 11), (9, 10, 17)]:
        data = initial.produce(n, den, p, max_nodes=0, max_seconds=0, max_rows=0)
        for limit in (3, 7, 31):
            packet = produce(data, limit, 2)
            sources = lean_sources(data, packet)
            if names(data, limit)[0] not in sources:
                raise AssertionError("A complete cut packet lacks its aggregate")
            expected_roots = {names(data, limit)[0] + f"B{r['b']:04d}" for r in data["roots"]}
            if not expected_roots <= set(sources):
                raise AssertionError("A minimum-pair theorem is missing")
            if any(f"Cut{limit:03d}Cut{limit:03d}" in source or
                   f".Cut{limit:03d}.Cut{limit:03d}" in source for source in sources.values()):
                raise AssertionError("A source namespace was rewritten twice")
            reports.append({**summary(data, packet), "generated_modules": len(sources)})
    data = initial.produce(5, 6, 11, max_nodes=0, max_seconds=0, max_rows=0)
    packet = produce(data, 3, 2)
    corruptions = []
    bad = copy.deepcopy(packet); bad["initial_data_sha256"] = "0" * 64; corruptions.append(bad)
    bad = copy.deepcopy(packet); bad["roots"].pop(); corruptions.append(bad)
    bad = copy.deepcopy(packet); bad["roots"][0]["cuts"][-1]["frame"]["fuel"] += 1; corruptions.append(bad)
    bad = copy.deepcopy(packet); bad["roots"][0]["cuts"][-1]["size"] += 2; corruptions.append(bad)
    split_root = next(i for i, root in enumerate(packet["roots"])
                      if any(cut["fragment"]["kind"] == "split" for cut in root["cuts"]))
    split_cut = next(i for i, cut in enumerate(packet["roots"][split_root]["cuts"])
                     if cut["fragment"]["kind"] == "split")
    bad = copy.deepcopy(packet)
    bad["roots"][split_root]["cuts"][split_cut]["fragment"] = {"kind": "leaf"}
    corruptions.append(bad)
    bad = copy.deepcopy(packet)
    bad["roots"][split_root]["cuts"][split_cut]["fragment"] = {"kind": "reuse", "index": split_cut}
    corruptions.append(bad)
    for bad in corruptions:
        try:
            validate(data, bad)
        except (ValueError, IndexError, KeyError):
            pass
        else:
            raise AssertionError("A corrupted cut certificate was accepted")
    first_pair = [data["roots"][0]["b"]]
    partial = lean_sources(data, packet, first_pair)
    if len(data["roots"]) > 1 and names(data, 3)[0] in partial:
        raise AssertionError("A selected-root packet emitted a complete theorem")
    return {"small_layout_checks": reports, "rejected_corruptions": len(corruptions),
            "selected_root_scope_checked": True, "lean_verified": False}


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--initial-json", type=Path)
    parser.add_argument("--load-cuts", type=Path)
    parser.add_argument("--fragment-limit", type=int, default=31)
    parser.add_argument("--cuts-per-module", type=int, default=4)
    parser.add_argument("--only-b", action="append", type=int)
    parser.add_argument("--json-out", type=Path)
    parser.add_argument("--lean-dir", type=Path)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--self-test", action="store_true")
    args = parser.parse_args()
    if args.self_test:
        print(json.dumps(self_test(), sort_keys=True))
        return
    if args.initial_json is None:
        parser.error("--initial-json is required unless --self-test is used")
    data = json.loads(args.initial_json.read_bytes())
    packet = json.loads(args.load_cuts.read_bytes()) if args.load_cuts else produce(
        data, args.fragment_limit, args.cuts_per_module)
    validate(data, packet)
    if args.json_out:
        payload = encoded(packet)
        if args.check:
            if not args.json_out.is_file() or args.json_out.read_bytes() != payload:
                raise ValueError("Generated cut packet differs: " + str(args.json_out))
        else:
            args.json_out.parent.mkdir(parents=True, exist_ok=True)
            temporary = args.json_out.with_name(args.json_out.name + ".tmp")
            temporary.write_bytes(payload)
            temporary.replace(args.json_out)
    output = summary(data, packet)
    if args.lean_dir:
        sources = lean_sources(data, packet, sorted(args.only_b) if args.only_b else None)
        for module, source in sources.items():
            path = args.lean_dir / (module.replace(".", "/") + ".lean")
            if args.check:
                if not path.is_file() or path.read_bytes() != source.encode():
                    raise ValueError("Generated source differs: " + str(path))
            else:
                if path.exists() and path.read_bytes() != source.encode():
                    raise ValueError("Refusing to overwrite different generated source: " + str(path))
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_bytes(source.encode())
        output["generated_modules"] = len(sources)
        output["generated_source_bytes"] = sum(len(s.encode()) for s in sources.values())
        output["generated_source_sha256"] = {name: hashlib.sha256(s.encode()).hexdigest()
                                              for name, s in sources.items()}
        output["global_theorem_emitted"] = names(data, packet["fragment_limit"])[0] in sources
    print(json.dumps(output, sort_keys=True))


if __name__ == "__main__":
    main()
