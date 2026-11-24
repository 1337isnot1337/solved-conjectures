#!/usr/bin/env python3
"""Materialize a candidate-only, source-pinned tower dependency.

This is an adaptation of the earlier Kohlmeyer--Kruer Lean proof, not
an original proof of the irrational-ratio Erdős 354 case. No upstream
source is vendored by this script; downloads are verified against the
authors' published verification manifest before any transformation.
The generated modules are NOT registered as accepted repository results.

Run only in an isolated review checkout. The original dependency was
checked with Lean 4.33.1; the generated source still requires a fresh
strict build and all-owned/kernel verification on the repository pin.
"""
from __future__ import annotations

import hashlib
from pathlib import Path
import sys
from urllib.request import urlopen

REVISION = "af9feb6c310f5cea035e4ec34400c43fec01817e"
BASE = f"https://raw.githubusercontent.com/JENW1N/complete-math-solutions/{REVISION}/proofs/erdos354/"
SOURCES = {
    "Erdos354Definitions.lean": "06688c81a615002efce89853393c3569f85dbcc18d7db2c03a37fa290e1796e2",
    "KohlmeyerKruerPartI.lean": "fe2c14abf46d81586a1e2f79ad51708851908a75dfef859fa1e563a64e0ab19a",
}

def read(name: str) -> str:
    with urlopen(BASE + name, timeout=60) as response:
        raw = response.read(2_000_000)
    if hashlib.sha256(raw).hexdigest() != SOURCES[name]:
        raise ValueError(f"Upstream source hash mismatch: {name}")
    return raw.decode("utf-8")

def replace_checked(text: str, old: str, new: str, count: int) -> str:
    if text.count(old) != count:
        raise ValueError(f"Unexpected source shape for {old!r}")
    return text.replace(old, new)

PATCHES = [
  [
    "(hc : Irrational c)",
    "(hc : ¬ Dyadic c)",
    10
  ],
  [
    "(hc : Irrational (β / α))",
    "(hc : ¬ Dyadic (β / α))",
    8
  ],
  [
    "(hc : Irrational (α / β))",
    "(hc : ¬ Dyadic (β / α))",
    2
  ],
  [
    "  have hirr : Irrational ((2 : ℝ) ^ b * c) := by\n    simpa only [Nat.cast_pow, Nat.cast_ofNat] using\n      hc.natCast_mul (m := 2 ^ b) (by positivity)\n  apply eventually_floor_eq_of_tendsto (tendsto_const_nhds.mul hu)\n  exact hirr.ne_int _",
    "  apply eventually_floor_eq_of_tendsto (tendsto_const_nhds.mul hu)\n  intro h\n  apply hc\n  refine ⟨b, ⌊(2 : ℝ) ^ b * c⌋, ?_⟩\n  apply (eq_div_iff (by positivity : (2 : ℝ) ^ b ≠ 0)).mpr\n  calc\n    c * (2 : ℝ) ^ b = (2 : ℝ) ^ b * c := mul_comm _ _\n    _ = _ := h",
    1
  ],
  [
    "unboundedTransitions (not_dyadic_of_irrational hc)",
    "unboundedTransitions hc",
    1
  ],
  [
    "  have hi : Irrational (β / α) := by simpa only [inv_div] using hc.inv\n",
    "",
    2
  ],
  [
    "hμ.boundedZeros_height_mixing hα hβ hzero hi f hf g",
    "hμ.boundedZeros_height_mixing hα hβ hzero hc f hf g",
    1
  ],
  [
    "unboundedTransitions (not_dyadic_of_irrational hi) 1",
    "unboundedTransitions hc 1",
    1
  ],
  [
    "hμ.cross_marked_rigidity_exclusion hα hβ hi b",
    "hμ.cross_marked_rigidity_exclusion hα hβ hc b",
    1
  ],
  [
    "eventually_carry_pairs_of_irrational_limit",
    "eventually_carry_pairs_of_nondyadic_limit",
    2
  ],
  [
    "Stability of every fixed binary prefix at an irrational limiting ratio.",
    "Stability of every fixed binary prefix at a non-dyadic limiting ratio.",
    1
  ],
  [
    "Irrational limiting query ratios provide arbitrarily many marked blocks.",
    "Non-dyadic limiting query ratios provide arbitrarily many marked blocks.",
    1
  ]
]

BODY_PATCHES = [
  [
    "  have hmarked := eventually_marked_cross_queries hα hβ hc b hb hbtrans a n hn hnrel ha\n",
    "",
    1
  ],
  [
    "    let k := n r - m - b - 2",
    "    let k := κ r",
    1
  ]
]

COMMON_HEADER = "/-- Generalized common-mark rigidity estimate: the mark index may be\nabove or below the binary point. No irrationality premise is needed. -/\ntheorem IsTowerNameLimit.cross_common_mark_rigid_fixed {α β : ℝ}\n    (hα : 1 ≤ α) (hβ : 1 ≤ β)\n    {μ : ProbabilityMeasure (TowerShiftSpace α)} (hμ : IsTowerNameLimit α μ)\n    (n κ : ℕ → ℕ) (hn : Tendsto n atTop atTop)\n    (hmarked : ∀ᶠ r in atTop,\n      let m := n r / 2\n      let q := returnBlock α m (height β (n r))\n      let k := κ r\n      digit α (m + k + 1) = 1 ∧ q.testBit k ≠ q.testBit (k + 1) ∧\n        (q + 1).testBit k ≠ (q + 1).testBit (k + 1) ∧\n          ∀ j < 3, q.testBit (k + j) = (q + 1).testBit (k + j))\n    (f : TowerL2 α μ)\n    (hreg : Tendsto (fun r => towerKoopman hμ (height β (n r)) f) atTop (𝓝 f)) :\n    towerKoopman hμ (-1) f = f := by\n"
WRAPPER = "  exact hμ.cross_common_mark_rigid_fixed hα hβ n\n    (fun r => n r - n r / 2 - b - 2) hn\n    (eventually_marked_cross_queries hα hβ hc b hb hbtrans a n hn hnrel ha) f hreg\n\n"

def adapt(source: str) -> str:
    source = replace_checked(
        source, "import Erdos354Definitions",
        "import Conjectures.HegyvariUpstreamDefinitions", 1)
    index = source.index("/- Source: PrefixStability.lean -/")
    prefix, tail = source[:index], source[index:]
    for old, new, count in PATCHES:
        tail = replace_checked(tail, old, new, count)
    a = tail.index("theorem IsTowerNameLimit.cross_marked_rigid_fixed ")
    b = tail.index("theorem IsTowerNameLimit.cross_marked_rigidity_exclusion ", a + 1)
    block = tail[a:b]
    separator = "    towerKoopman hμ (-1) f = f := by\n"
    i = block.index(separator) + len(separator)
    header, body = block[:i], block[i:]
    for old, new, count in BODY_PATCHES:
        body = replace_checked(body, old, new, count)
    tail = tail[:a] + COMMON_HEADER + body + header + WRAPPER + tail[b:]
    # The earlier irrational-only final endpoint is not used by this
    # dependency. Leave its original published source untouched.
    end = tail.index("/- Source: FullTarget.lean -/")
    if tail[end:].count("end Bounty") != 1:
        raise ValueError("Unexpected end of upstream module")
    tail = tail[:end] + "end Bounty\n"
    return (
        "/- Adapted from Jensen Kohlmeyer and Liam Kruer, pinned source "
        + REVISION + ". Original mathematical credit retained.\n"
        + "   Changes: non-dyadic prefix/transport hypotheses and arbitrary common-mark index.\n"
        + "   See the candidate scope note and the original authors' NOTICE. -/\n"
        + prefix + tail)

def main() -> None:
    if len(sys.argv) != 2:
        raise SystemExit("usage: prepare_hegyvari_tower_dependency.py REVIEW_LEAN_DIRECTORY")
    target = Path(sys.argv[1]).resolve() / "Conjectures"
    if not target.is_dir():
        raise ValueError("Expected a review checkout with a Conjectures directory")
    definitions = read("Erdos354Definitions.lean")
    source = adapt(read("KohlmeyerKruerPartI.lean"))
    outputs = {
        "HegyvariUpstreamDefinitions.lean": definitions,
        "HegyvariUpstream.lean": source,
    }
    for name, content in outputs.items():
        path = target / name
        data = content.encode("utf-8")
        if path.exists() and path.read_bytes() != data:
            raise FileExistsError(f"Refusing to overwrite {path}")
        path.write_bytes(data)
        print(hashlib.sha256(data).hexdigest(), path)
    print("Prepared source-pinned dependency; Lean verification has not been run.")

if __name__ == "__main__":
    main()
