#!/usr/bin/env node
// Reproduce the literal prime-257 bounded-fragment packet.
// This producer is not trusted by Lean: every emitted numerical claim is checked
// by an ordinary kernel proof, and the existing Cuts theorem assembles the result.
import { readFileSync, writeFileSync, mkdirSync } from "node:fs";
import { resolve, dirname } from "node:path";
import { fileURLToPath } from "node:url";
import { createHash } from "node:crypto";

const repositoryRoot = resolve(dirname(fileURLToPath(import.meta.url)), "..");
const originalPath = "lean/Conjectures/LonelinessSixSpeedSupport257Probe.lean";
const expectedBlob = "be14bda31d1d4125f1b139c79be413ccda0e9b82";
const args = process.argv.slice(2);
if (args.length !== 1 || !["--write", "--check"].includes(args[0])) {
  throw new Error("Usage: node scripts/generate_six_support_257_cuts.mjs --write|--check");
}
const originalBytes = readFileSync(resolve(repositoryRoot, originalPath));
const actualBlob = createHash("sha1")
  .update(Buffer.from("blob " + originalBytes.length + "\0", "utf8"))
  .update(originalBytes).digest("hex");
if (actualBlob !== expectedBlob) {
  throw new Error("Frozen probe blob mismatch: expected " + expectedBlob + ", got " + actualBlob);
}

function buildSupport257Packet(source) {
  const SOURCE_BLOB = "be14bda31d1d4125f1b139c79be413ccda0e9b82";
  const NS = "Loneliness.Modular.SixSpeed.Support257Cuts";
  const MOD = "Conjectures.LonelinessSixSpeedSupport257CutData";
  const cuts = "SupportSearch.Bits.Cuts";
  const markers = [
    ["inverseData", "def inverseData ", "def inverse ("],
    ["inverse", "def inverse (", "theorem inverse_checked"],
    ["coverTable", "def coverTable ", "def compatibleTable "],
    ["compatibleTable", "def compatibleTable ", "theorem cover_checked"],
    ["nodeData", "def nodeData ", "def lookup ("],
    ["lookup", "def lookup (", "def tree :"],
    ["tree", "def tree :", "/- The initial states"]
  ];
  const definitions = {};
  for (const [name, start, end] of markers) {
    const lo = source.indexOf(start);
    if (lo < 0 || source.indexOf(start, lo + start.length) >= 0)
      throw new Error("Missing or repeated definition: " + name);
    const hi = source.indexOf(end, lo + start.length);
    if (hi < 0) throw new Error("Missing definition boundary: " + name);
    definitions[name] = source.slice(lo, hi).trimEnd() + "\n";
  }
  function parseLiteral(definition) {
    const rhs = definition.slice(definition.indexOf(":=") + 2).trim();
    const tokens = [];
    let p = 0;
    while (p < rhs.length) {
      const rest = rhs.slice(p);
      const ws = /^\s+/.exec(rest);
      if (ws) { p += ws[0].length; continue; }
      const token = /^(?:[()]|\.[A-Za-z][A-Za-z0-9_]*|[0-9]+)/.exec(rest);
      if (!token) throw new Error("Unexpected literal syntax: " + rest.slice(0, 40));
      tokens.push(token[0]);
      p += token[0].length;
    }
    p = 0;
    function expression() {
      const token = tokens[p++];
      if (token === "(") {
        const result = [];
        while (tokens[p] !== ")") {
          if (p >= tokens.length) throw new Error("Unclosed constructor");
          result.push(expression());
        }
        p++;
        return result;
      }
      if (token === undefined || token === ")") throw new Error("Malformed constructor");
      return token;
    }
    const result = expression();
    if (p !== tokens.length) throw new Error("Trailing constructor tokens");
    return result;
  }
  const inverseTree = parseLiteral(definitions.inverseData);
  const coverTree = parseLiteral(definitions.coverTable);
  const compatibleTree = parseLiteral(definitions.compatibleTable);
  const nodeTree = parseLiteral(definitions.nodeData);
  function rarrayGet(tree, index) {
    if (!Array.isArray(tree)) throw new Error("Expected RArray constructor");
    if (tree[0] === ".leaf" && tree.length === 2) return tree[1];
    if (tree[0] === ".branch" && tree.length === 4)
      return rarrayGet(tree[index < Number(tree[1]) ? 2 : 3], index);
    throw new Error("Unexpected RArray constructor");
  }
  function memoGet(tree, key) {
    if (!Array.isArray(tree)) throw new Error("Expected Memo constructor");
    if (tree[0] === ".entry" && tree.length === 3) {
      if (BigInt(tree[1]) !== key) throw new Error("Uncached Memo key: " + key);
      return BigInt(tree[2]);
    }
    if (tree[0] === ".branch" && tree.length === 4)
      return memoGet(tree[key < BigInt(tree[1]) ? 2 : 3], key);
    throw new Error("Unexpected Memo constructor");
  }
  function leafCount(tree) {
    return tree[0] === ".branch" ? leafCount(tree[2]) + leafCount(tree[3]) : 1;
  }
  if (leafCount(inverseTree) !== 129 || leafCount(coverTree) !== 129 ||
      leafCount(compatibleTree) !== 61 || leafCount(nodeTree) !== 171)
    throw new Error("Unexpected frozen-data dimensions");
  const inverse = Array.from({length: 129}, (_, i) => BigInt(rarrayGet(inverseTree, i)));
  for (let a = 1; a <= 128; a++)
    if ((BigInt(a) * inverse[a]) % 257n !== 1n)
      throw new Error("Invalid inverse at " + a);
  const covers = Array.from({length: 129}, (_, i) => memoGet(coverTree, BigInt(i)));
  const nodes = Array.from({length: 171}, (_, i) => rarrayGet(nodeTree, i));
  function compatible(a) {
    if (a < 0 || a >= 256) throw new Error("Compatibility fallback would be used");
    return memoGet(compatibleTree, 5120n + BigInt(a));
  }
  function bitIndices(mask) {
    const result = [];
    let bit = 0;
    for (let rest = mask; rest > 0n; rest >>= 1n, bit++)
      if ((rest & 1n) !== 0n) result.push(bit);
    return result;
  }
  function popcount(mask) {
    let result = 0;
    for (let rest = mask; rest > 0n; rest &= rest - 1n) result++;
    return result;
  }
  const initial = {
    fuel: 256, index: 170, selected: 1048578n,
    available: 240365526570467516971528776803692838912n,
    uncovered: 169829607615105816046181045422176337920n, slots: 4
  };
  const frames = [], known = new Map();
  let calls = 0, maximumDepth = 0, capacityLeaves = 0, witnessLeaves = 0;
  let gainTerms = 0, maximumLeafCandidates = 0;
  function frameKey(f) {
    return [f.fuel, f.index, f.selected, f.available, f.uncovered, f.slots].join("|");
  }
  function visit(f, depth) {
    if (++calls > 200000) throw new Error("Unexpectedly large literal traversal");
    maximumDepth = Math.max(maximumDepth, depth);
    const key = frameKey(f);
    if (known.has(key)) return known.get(key);
    if (f.fuel === 0) throw new Error("Exhausted fuel");
    const node = nodes[f.index];
    if (!node) throw new Error("Instruction outside frozen tape");
    let children = [];
    if (node[0] === ".split" && node.length === 4) {
      const a = Number(node[1]), bit = 1n << BigInt(a);
      if ((f.available & bit) === 0n || f.slots === 0)
        throw new Error("Invalid split at " + frameKey(f));
      if (a >= covers.length) throw new Error("Cover fallback would be used");
      children = [
        visit({...f, fuel: f.fuel - 1, index: Number(node[2]),
          available: f.available & ~bit}, depth + 1),
        visit({...f, fuel: f.fuel - 1, index: Number(node[3]),
          selected: f.selected | bit,
          available: f.available & ~bit & compatible(a),
          uncovered: f.uncovered & ~covers[a], slots: f.slots - 1}, depth + 1)
      ];
    } else if (node[0] === ".leaf" && node.length === 2) {
      const certificate = node[1], available = bitIndices(f.available);
      maximumLeafCandidates = Math.max(maximumLeafCandidates, available.length);
      if (available.some(a => a >= covers.length))
        throw new Error("Leaf cover fallback would be used");
      if (certificate[0] === ".capacity" && certificate.length === 2) {
        capacityLeaves++;
        gainTerms += available.length;
        const threshold = Number(certificate[1]);
        const capacity = f.slots * threshold + available.reduce((sum, a) =>
          sum + Math.max(popcount(f.uncovered & covers[a]) - threshold, 0), 0);
        if (capacity >= popcount(f.uncovered))
          throw new Error("False capacity leaf at " + frameKey(f));
      } else if (certificate[0] === ".witness" && certificate.length === 2) {
        witnessLeaves++;
        const bit = 1n << BigInt(certificate[1]);
        if ((f.uncovered & bit) === 0n ||
            available.some(a => (covers[a] & bit) !== 0n))
          throw new Error("False witness leaf at " + frameKey(f));
      } else throw new Error("Unsupported leaf constructor");
    } else throw new Error("Unsupported tape constructor");
    const id = frames.length;
    if (children.some(child => child >= id)) throw new Error("Non-earlier frame reference");
    frames.push({...f, children, kind: node[0]});
    known.set(key, id);
    return id;
  }
  const root = visit(initial, 0);
  if (frames.length !== 307 || root !== 306 || calls !== 307 ||
      capacityLeaves !== 137 || witnessLeaves !== 17 || maximumDepth !== 27)
    throw new Error("Unexpected frozen traversal census");
  function renderRArray(values, low = 0, high = values.length, indent = 2) {
    const pad = " ".repeat(indent);
    if (high - low === 1) return pad + "(.leaf " + values[low] + ")";
    const middle = Math.floor((low + high) / 2);
    return pad + "(.branch " + middle + "\n" +
      renderRArray(values, low, middle, indent + 2) + "\n" +
      renderRArray(values, middle, high, indent + 2) + "\n" + pad + ")";
  }
  const frameValue = f =>
    "⟨" + [f.fuel, f.index, f.selected, f.available, f.uncovered, f.slots].join(", ") + "⟩";
  const fragmentValue = f => f.children.length === 0 ? ".leaf" :
    "(.split (.reuse " + f.children[0] + ") (.reuse " + f.children[1] + "))";
  const data = [
    "import Conjectures.LonelinessModularInitialMemo",
    "import Conjectures.LonelinessModularCoverCuts",
    "import Init.Data.RArray",
    "",
    "/-!",
    "# Literal data for the prime-257 support certificate",
    "",
    "Generated by scripts/generate_six_support_257_cuts.mjs.",
    "The seven original definitions below are copied verbatim from the frozen probe.",
    "Original Git blob: " + SOURCE_BLOB + ".",
    "The 307 exact frames are in postorder; frame 306 is the original initial state.",
    "Every fragment has size at most three and refers only to earlier frames.",
    "All numerical assertions are proved in the separate Facts and Check modules.",
    "-/",
    "",
    "namespace " + NS,
    "",
    "noncomputable section",
    "",
    ...markers.map(([name]) => definitions[name].trimEnd() + "\n"),
    "def coverMask : ℕ → ℕ := InitialMemo.cover 7 257 coverTable",
    "",
    "def compatibleMask : ℕ → ℕ := InitialMemo.compatible 257 inverse 256 compatibleTable 20",
    "",
    "def terminal : Finset ℕ → ℕ → Bool := fun _ _ => false",
    "",
    "def frameData : Lean.RArray " + cuts + ".Frame :=",
    renderRArray(frames.map(frameValue)),
    "",
    "def frames (index : ℕ) : " + cuts + ".Frame := frameData.get index",
    "",
    "def fragmentData : Lean.RArray " + cuts + ".Fragment :=",
    renderRArray(frames.map(fragmentValue)),
    "",
    "def fragments (index : ℕ) : " + cuts + ".Fragment := fragmentData.get index",
    "",
    "def rootFrame : " + cuts + ".Frame :=",
    "  " + frameValue(initial),
    "",
    "end",
    "end " + NS,
    ""
  ].join("\n");
  const files = [{path: "lean/Conjectures/LonelinessSixSpeedSupport257CutData.lean", content: data}];
  for (let block = 0; block < 10; block++) {
    const start = 32 * block, count = Math.min(32, frames.length - start);
    const suffix = String(block).padStart(2, "0");
    const lines = [
      "import " + MOD,
      "import Mathlib.Tactic.FinCases",
      "",
      "/-! Exact bounded-fragment checks for frames " + start + " through " + (start + count - 1) + ".",
      "Generated by scripts/generate_six_support_257_cuts.mjs. -/",
      "",
      "namespace " + NS,
      ""
    ];
    for (let index = start; index < start + count; index++) {
      const name = "frame" + String(index).padStart(3, "0") + "_checked";
      lines.push(
        "theorem " + name + " :",
        "    " + cuts + ".boundedCheck coverMask compatibleMask terminal lookup frames " + index + " 3",
        "      (fragments " + index + ") (frames " + index + ") = true := by",
        "  decide +kernel",
        ""
      );
    }
    const index = "(j.val + " + start + ")";
    lines.push(
      "theorem block" + suffix + "_checked (j : Fin " + count + ") :",
      "    " + cuts + ".boundedCheck coverMask compatibleMask terminal lookup frames " + index + " 3",
      "      (fragments " + index + ") (frames " + index + ") = true := by",
      "  fin_cases j"
    );
    for (let index = start; index < start + count; index++)
      lines.push("  · exact frame" + String(index).padStart(3, "0") + "_checked");
    lines.push("", "end " + NS, "");
    files.push({
      path: "lean/Conjectures/LonelinessSixSpeedSupport257CutChecks" + suffix + ".lean",
      content: lines.join("\n")
    });
  }
  return {
    files,
    summary: {
      originalProbeBlob: SOURCE_BLOB, frames: frames.length, rootFrame: root,
      frameLimit: 3, blocks: 10, maximumDepth, capacityLeaves, witnessLeaves,
      maximumLeafCandidates, gainTerms,
      target: Object.fromEntries(Object.entries(initial).map(([k,v]) => [k,String(v)]))
    }
  };
}

const packet = buildSupport257Packet(originalBytes.toString("utf8"));
for (const file of packet.files) {
  const destination = resolve(repositoryRoot, file.path);
  if (args[0] === "--write") {
    mkdirSync(dirname(destination), { recursive: true });
    writeFileSync(destination, file.content, "utf8");
  } else if (!readFileSync(destination).equals(Buffer.from(file.content, "utf8"))) {
    throw new Error("Generated file differs: " + file.path);
  }
}
process.stdout.write(JSON.stringify({
  ...packet.summary,
  files: packet.files.map(file => ({
    path: file.path,
    bytes: Buffer.byteLength(file.content, "utf8"),
    sha256: createHash("sha256").update(file.content, "utf8").digest("hex")
  }))
}, null, 2) + "\n");
