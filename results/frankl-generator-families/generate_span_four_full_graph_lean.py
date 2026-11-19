#!/usr/bin/env python3
"""Render bounded initial span-four rank and partition certificates.

This companion imports the frozen prefix/edge-pilot producer. It preserves
the original candidate snapshot and canonical row order, and does not alter
the pilot sources. Python tables remain untrusted witnesses: every emitted
numeric proof must pass strict Lean source, all-declaration axiom and stock
kernel gates before any theorem is registered.
"""

from __future__ import annotations

import argparse
import gzip
import hashlib
import json
from pathlib import Path

import generate_span_four_graph_certificate as base


ROOT = Path(__file__).resolve().parent
CANONICAL_WORD_MODULE = "FranklSmallCyclicCanonicalWords"
CANONICAL_INPUT_SHA256 = "5594610818abd7f41c76121924259bd1a9a1f86417da91dce2c0f8171bcceb6a"
SNAPSHOT_SHA256 = "59de019740b6317c6976e41444c647369bf67099f0238641d47d21aba3b9750f"


def bounded_edge_seed_groups(data, edge_limit, extension_limit):
    """Bound intermediate generation as well as the surviving edge count."""
    public_masks = base.local_masks()
    rows = public_masks["pair_rows"]
    table = set(data["levels"][4])

    def pair_pruned(code):
        return any((code >> (12 + row["shape"])) & 1
                   and code & row["forbidden"] == 0 for row in rows)

    groups, seeds, selected, extensions = [], [], [], 0
    flat = []
    for seed in sorted(table):
        five = [seed + 16**4 * digit for digit in range(16)
                if (seed + 16**4 * digit) // 16 in table]
        six = [word + 16**5 * digit for word in five for digit in range(16)
               if (word + 16**5 * digit) // 256 in table]
        edges = [word + 16**6 * digit for word in six for digit in range(16)
                 if (word + 16**6 * digit) // 4096 in table
                 and not pair_pruned(word + 16**6 * digit)]
        cost = 16 * (1 + len(five) + len(six))
        if seeds and (len(selected) + len(edges) > edge_limit
                      or extensions + cost > extension_limit):
            groups.append({"seeds": seeds, "edges": selected,
                           "extension_candidates": extensions})
            seeds, selected, extensions = [], [], 0
        assert len(edges) <= edge_limit and cost <= extension_limit
        seeds.append(seed)
        selected.extend(edges)
        extensions += cost
        flat.extend(edges)
    if seeds:
        groups.append({"seeds": seeds, "edges": selected,
                       "extension_candidates": extensions})
    assert sorted(flat) == sorted(data["edges"])
    assert len(flat) == len(set(flat))
    assert [seed for group in groups for seed in group["seeds"]] == sorted(table)
    return groups


def emit_full_graph(data, output, edge_limit, checks_per_module,
                    table_leaf_size, table_module_nodes, extension_limit):
    assert edge_limit > 0 and checks_per_module > 0 and table_leaf_size > 0
    assert table_module_nodes >= table_leaf_size
    original_path = ROOT / "width_four_weight_candidates.json"
    assert base.digest(original_path) == CANONICAL_INPUT_SHA256
    original = json.loads(original_path.read_text())
    row_by_code = {base.word_code(row[0]): i for i, row in enumerate(original)}
    assert len(row_by_code) == len(original)
    left_set = set(data["left4"])
    assert not left_set.intersection(row_by_code)
    assert left_set.union(row_by_code) == set(data["recurrent"])
    output.mkdir(parents=True, exist_ok=True)
    files, parts = {}, []
    ns_data = "FranklSpanFour.Graph.InitialData"
    ns_check = "FranklSpanFour.Graph.Certificate"

    def split_table(rows, prefix, serial):
        if not rows:
            return ".empty", None
        if len(rows) <= table_leaf_size:
            name = f"{prefix}Part{serial[0]:03d}"
            serial[0] += 1
            literal, count = base.tree_literal(rows)
            parts.append({"prefix": prefix, "name": name,
                          "literal": literal, "count": count})
            return name, ("leaf", name)
        middle = len(rows) // 2
        key, value = rows[middle]
        left, left_shape = split_table(rows[:middle], prefix, serial)
        right, right_shape = split_table(rows[middle+1:], prefix, serial)
        return (f"(.node {key} {value} {left} {right})",
                ("node", key, value, left_shape, right_shape))

    table_rows = [
        ("pairRanks", data["pair_ranks"]),
        ("pairKept", [[a, row_by_code.get(a, 0)] for a in sorted(data["recurrent"])]),
        ("leftTable", [[a, 0] for a in sorted(data["left4"])]),
        ("residualRanks", data["residual_ranks"]),
        ("residualKept", [[a, 0] for a in sorted(data["residual"])]),
    ]
    roots = {name: split_table(rows, name, [0]) for name, rows in table_rows}
    part_groups, current, count = [], [], 0
    for part in parts:
        if current and count + part["count"] > table_module_nodes:
            part_groups.append(current)
            current, count = [], 0
        current.append(part)
        count += part["count"]
    if current:
        part_groups.append(current)
    table_modules = []
    for i, group in enumerate(part_groups):
        module = f"FranklSpanFourGraphTableData{i:03d}"
        table_modules.append(module)
        text = base.header(["FranklSpanFourGraphRank"], ns_data)
        for part in group:
            text += f'def {part["name"]} : Table :=\n  {part["literal"]}\n\n'
        files[module + ".lean"] = text + "end " + ns_data + "\n"
    text = base.header(table_modules, ns_data)
    for name, (literal, _) in roots.items():
        text += f"def {name} : Table :=\n  {literal}\n\n"
    files["FranklSpanFourGraphTables.lean"] = text + "end " + ns_data + "\n"

    def checked_tree(shape, suffix):
        if shape is None:
            return "(Table.entriesCheck_empty _)"
        if shape[0] == "leaf":
            return shape[1] + suffix
        return ("(Table.entriesCheck_node (by decide +kernel) " +
                checked_tree(shape[3], suffix) + " " +
                checked_tree(shape[4], suffix) + ")")

    partition_parts = [part for part in parts if part["prefix"] == "pairKept"]
    partition_modules = []
    for i in range(0, len(partition_parts), checks_per_module):
        group = partition_parts[i:i+checks_per_module]
        module = f"FranklSpanFourGraphPartitionCheck{i // checks_per_module:03d}"
        partition_modules.append(module)
        text = base.header(["FranklSpanFourGraphTables",
            "FranklSpanFourGraphPartition", CANONICAL_WORD_MODULE], ns_check)
        text += "open InitialData\n\n"
        for part in group:
            name = part["name"]
            text += (f"theorem {name}_partition_checked :\n"
                f"    retainedPartitionCheck {name} leftTable\n"
                "      FranklSmallCyclic.CanonicalWords.count\n"
                "      FranklSmallCyclic.CanonicalWords.codeAt = true := by\n"
                "  decide +kernel\n\n")
        files[module + ".lean"] = text + "end " + ns_check + "\n"
    text = base.header(partition_modules, ns_check) + "open InitialData\n\n"
    text += ("theorem retained_partition_checked :\n"
        "    retainedPartitionCheck pairKept leftTable\n"
        "      FranklSmallCyclic.CanonicalWords.count\n"
        "      FranklSmallCyclic.CanonicalWords.codeAt = true := by\n"
        "  exact " + checked_tree(roots["pairKept"][1], "_partition_checked") + "\n\n")
    files["FranklSpanFourGraphRetained.lean"] = text + "end " + ns_check + "\n"

    text = base.header(["FranklSpanFourGraphTables", "FranklSpanFourGraphWordRows",
                        CANONICAL_WORD_MODULE], ns_check) + "open InitialData\n\n"
    text += """def canonicalRows : List FranklSmallCyclic.Weights.Entry :=
  (List.range FranklSmallCyclic.CanonicalWords.count).map
    (fun i => ⟨FranklSmallCyclic.CanonicalWords.wordAt i, []⟩)

def left4 : List (Assembly.Word 7) := decodeWords 7 leftTable.keys

def recurrent : List (Assembly.Word 7) :=
  left4 ++ canonicalRows.map FranklSmallCyclic.Weights.shapeWord

theorem canonicalRows_decoded :
    (List.range FranklSmallCyclic.CanonicalWords.count).map
      (fun i => wordOfCode 7 (FranklSmallCyclic.CanonicalWords.codeAt i)) =
    canonicalRows.map FranklSmallCyclic.Weights.shapeWord := by
  simpa only [canonicalRows, FranklSmallCyclic.CanonicalWords.wordAt_eq, naturalWord] using
    decoded_codeRows_eq_shapeRows FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt

theorem recurrent_partition :
    recurrent = left4 ++ canonicalRows.map FranklSmallCyclic.Weights.shapeWord := rfl

end """ + ns_check + "\n"
    files["FranklSpanFourGraphWordLists.lean"] = text

    seed_groups = bounded_edge_seed_groups(data, edge_limit, extension_limit)
    seed_batches = [list(range(i, min(i + checks_per_module, len(seed_groups))))
                    for i in range(0, len(seed_groups), checks_per_module)]
    text = base.header(["FranklSpanFourGraphPrefixCertificate"], ns_data)
    for i, group in enumerate(seed_groups):
        text += f"def seedChunk{i:03d} : List ℕ := " + str(group["seeds"]) + "\n\n"
    for i, group in enumerate(seed_batches):
        names = ", ".join(f"seedChunk{j:03d}" for j in group)
        text += f"def seedBatch{i:03d} : List (List ℕ) := [{names}]\n\n"
    text += ("def seedChunks : List (List ℕ) :=\n  " +
             " ++ ".join(f"seedBatch{i:03d}" for i in range(len(seed_batches))) + " ++ []\n\n")
    text += """theorem seedChunks_exact :
    seedChunks.flatten = PrefixCertificate.level4.keys := by
  decide +kernel

end """ + ns_data + "\n"
    files["FranklSpanFourGraphSeedData.lean"] = text

    pair_modules, pair_endpoints = [], []
    for i, group in enumerate(seed_batches):
        module = f"FranklSpanFourGraphPairCheck{i:03d}"
        pair_modules.append(module)
        text = base.header(["FranklSpanFourGraphTables", "FranklSpanFourGraphSeedData"], ns_check)
        text += "open InitialData\n\n"
        for j in group:
            text += (f"private theorem checked{j:03d} :\n"
                "    rankCodeCheck 6\n"
                f"      (edgeCodesFrom PrefixCertificate.level4 seedChunk{j:03d} (pairMaskCheck LocalData.pairRows))\n"
                "      pairKept pairRanks = true := by\n  decide +kernel\n\n")
        endpoint = f"pairBatch{i:03d}_checked"
        pair_endpoints.append(endpoint)
        checks = ", ".join(f"checked{j:03d}" for j in group)
        text += (f"theorem {endpoint} :\n"
            f"    seedBatch{i:03d}.all (fun seeds => rankCodeCheck 6\n"
            "      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))\n"
            "      pairKept pairRanks) = true := by\n"
            f"  simp only [seedBatch{i:03d}, List.all_cons, List.all_nil, {checks}, Bool.true_and]\n\n")
        files[module + ".lean"] = text + "end " + ns_check + "\n"

    text = base.header(pair_modules + ["FranklSpanFourGraphRetained",
        "FranklSpanFourGraphWordLists"], ns_check) + "open InitialData\n\n"
    text += """def states : List (Assembly.Word 6) :=
  decodeWords 6 (sixCodes PrefixCertificate.level4)

def edges : List (Assembly.Word 7) :=
  decodeWords 7 (edgeCodes PrefixCertificate.level4 (pairMaskCheck LocalData.pairRows))

def rankPair (v : Assembly.Word 6) : ℕ := pairRanks.get (wordCode v)

theorem states_cover (v : Assembly.Word 6) (hv : windowAdmissibleCheck 3 v = true) :
    v ∈ states :=
  PrefixCertificate.states_cover v hv

theorem edges_cover (v : Assembly.Word 7)
    (hp : FranklCyclic.wordPrefix v ∈ states) (hs : FranklCyclic.wordSuffix v ∈ states)
    (hn : FranklCyclic.windowPairCheck v = false) : v ∈ edges :=
  PrefixCertificate.edges_cover v hp hs hn

theorem pair_rank_codes_checked :
    rankCodeCheck 6
      (edgeCodes PrefixCertificate.level4 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  change rankCodeCheck 6
    (edgeCodesFrom PrefixCertificate.level4 PrefixCertificate.level4.keys
      (pairMaskCheck LocalData.pairRows)) pairKept pairRanks = true
  rw [← seedChunks_exact, rankCodeCheck_edgeChunks]
  simp only [seedChunks, List.all_append, List.all_nil, """
    text += ", ".join(pair_endpoints) + """, Bool.true_and]

theorem pair_rank_checked :
    FranklCyclic.rankListCheck (edges.map Assembly.edge)
      (fun e => decide (Assembly.sevenOfEdge e ∈ recurrent)) rankPair = true := by
  simpa only [edges, recurrent, left4, rankPair, ← canonicalRows_decoded] using
    rankCodeCheck_seven_partition pair_rank_codes_checked retained_partition_checked

end """ + ns_check + "\n"
    files["FranklSpanFourGraphPairRank.lean"] = text

    residual_parts = [part for part in parts if part["prefix"] == "leftTable"]
    residual_modules = []
    for i in range(0, len(residual_parts), checks_per_module):
        group = residual_parts[i:i+checks_per_module]
        module = f"FranklSpanFourGraphResidualCheck{i // checks_per_module:03d}"
        residual_modules.append(module)
        text = base.header(["FranklSpanFourGraphTables",
                            "FranklSpanFourGraphPartition"], ns_check)
        text += "open InitialData\n\n"
        for part in group:
            name = part["name"]
            text += (f"theorem {name}_rank_checked :\n"
                f"    rankTableCheck 6 {name} residualKept residualRanks = true := by\n"
                "  decide +kernel\n\n")
        files[module + ".lean"] = text + "end " + ns_check + "\n"

    text = base.header(residual_modules + ["FranklSpanFourGraphWordLists",
        "FranklSmallCyclicResidual"], ns_check) + "open InitialData\n\n"
    text += ("theorem residual_rank_table_checked :\n"
        "    rankTableCheck 6 leftTable residualKept residualRanks = true := by\n"
        "  exact " + checked_tree(roots["leftTable"][1], "_rank_checked") + "\n\n")
    text += """def rank4 (v : Assembly.Word 6) : ℕ := residualRanks.get (wordCode v)

theorem residual_rank_codes_checked :
    rankCodeCheck 6 leftTable.keys residualKept residualRanks = true :=
  rankTableCheck_sound residual_rank_table_checked

theorem residual_kept_checked :
    residualKept.keys.all (fun a => decide
      (List.ofFn (fun j : Fin 7 => letterCode (wordOfCode 7 a j)) ∈
        FranklSmallCyclic.residualEdges)) = true := by
  decide +kernel

theorem residual_rank_checked :
    FranklCyclic.rankListCheck (left4.map Assembly.edge)
      (fun e => decide
        (List.ofFn (fun j : Fin 7 => letterCode (Assembly.sevenOfEdge e j)) ∈
          FranklSmallCyclic.residualEdges)) rank4 = true := by
  apply rankCodeCheck_sound residual_rank_codes_checked
  intro a _ hkeep
  have h := List.all_eq_true.mp residual_kept_checked a (Table.contains_mem hkeep)
  simpa only [Assembly.sevenOfEdge_edge] using h

end """ + ns_check + "\n"
    files["FranklSpanFourGraphResidualRank.lean"] = text
    files["FranklSpanFourGraphCertificate.lean"] = (
        "module\n\npublic import Conjectures.FranklSpanFourGraphPairRank\n" +
        "public import Conjectures.FranklSpanFourGraphResidualRank\n")
    for name, text in files.items():
        (output / name).write_text(text)
    return {
        "source_sha256": {name: base.digest(output / name) for name in files},
        "table_modules": table_modules, "table_parts": len(parts),
        "table_nodes": sum(len(rows) for _, rows in table_rows),
        "pair_modules": pair_modules, "pair_private_checks": len(seed_groups),
        "pair_edge_limit": edge_limit, "pair_extension_limit": extension_limit,
        "maximum_extensions_per_chunk": max(row["extension_candidates"] for row in seed_groups),
        "partition_modules": partition_modules, "partition_leaf_checks": len(partition_parts),
        "residual_modules": residual_modules, "residual_leaf_checks": len(residual_parts),
        "checks_per_module": checks_per_module,
        "canonical_word_module": "Conjectures." + CANONICAL_WORD_MODULE,
        "canonical_input_sha256": CANONICAL_INPUT_SHA256,
        "left_word_order": "sorted scalar code; original snapshot order is unchanged",
        "root": "Conjectures.FranklSpanFourGraphCertificate",
        "required_endpoints": ["FranklSpanFour.Graph.Certificate." + name for name in [
            "retained_partition_checked", "canonicalRows_decoded", "recurrent_partition",
            "states_cover", "edges_cover", "pair_rank_codes_checked", "pair_rank_checked",
            "residual_rank_table_checked", "residual_rank_codes_checked",
            "residual_kept_checked", "residual_rank_checked"]],
        "formal_status": "Unchecked candidate sources. Fresh exact source, all-declaration and stock-kernel gates are required.",
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True, help="Original candidate snapshot gzip")
    parser.add_argument("--report", type=Path, required=True)
    parser.add_argument("--full-dir", type=Path, required=True)
    parser.add_argument("--checks-per-module", type=int, default=8)
    parser.add_argument("--extension-limit", type=int, default=12000)
    parser.add_argument("--table-leaf-size", type=int, default=255)
    parser.add_argument("--table-module-nodes", type=int, default=4096)
    parser.add_argument("--edge-limit", type=int, default=1024)
    args = parser.parse_args()
    data, report = base.reproduce()
    raw = base.canonical_bytes(data)
    assert hashlib.sha256(raw).hexdigest() == SNAPSHOT_SHA256
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_bytes(gzip.compress(raw, mtime=0))
    report.update({
        "companion_producer_sha256": base.digest(Path(__file__)),
        "frozen_pilot_producer_sha256": base.digest(Path(base.__file__)),
        "canonical_json_sha256": hashlib.sha256(raw).hexdigest(),
        "gzip_sha256": base.digest(args.output),
        "full_graph": emit_full_graph(data, args.full_dir, args.edge_limit,
            args.checks_per_module, args.table_leaf_size,
            args.table_module_nodes, args.extension_limit),
    })
    args.report.parent.mkdir(parents=True, exist_ok=True)
    args.report.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(json.dumps(report["counts"], sort_keys=True), flush=True)


if __name__ == "__main__":
    main()
