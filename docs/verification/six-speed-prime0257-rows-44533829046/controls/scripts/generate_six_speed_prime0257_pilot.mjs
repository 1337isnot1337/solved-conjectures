#!/usr/bin/env node
// Deterministic data producer for the prime-257 minimum-pair-two pilot.
// Output is untrusted until its ordinary Lean source/audit/kernel gate passes.
import { readFileSync, writeFileSync, mkdirSync } from "node:fs";
import { resolve, dirname } from "node:path";
import { fileURLToPath } from "node:url";
import { createHash } from "node:crypto";

const root = resolve(dirname(fileURLToPath(import.meta.url)), "..");
const args = process.argv.slice(2);
if (args.length !== 1 || !["--check", "--write"].includes(args[0]))
  throw new Error("Usage: node scripts/generate_six_speed_prime0257_pilot.mjs --check|--write");
const rows = [
  {root: [1, 2, 3, 4, 5, 6], time: 1},
  {root: [1, 2, 3, 126, 127, 128], time: 2},
  {root: [1, 2, 84, 85, 86, 87], time: 3},
];
const prefix = "import Conjectures.LonelinessSixSpeedFiniteSound\nimport Mathlib.Data.Fin.VecNotation\nimport Mathlib.Tactic.FinCases\n\n/-!\n# Actual retained rows for the prime-257 minimum-pair-two pilot\n\nThese are the three six-element folded dilations of the consecutive speeds\nwhich the pilot retains. The facts below verify the complete existing\n`Row.Valid 257` predicate, including the short-direction inequality.\nNo initial-support coverage or complete-prime assertion is made here.\n-/\n\nnamespace Loneliness.Modular.SixSpeed.Prime0257\n\n";
const suffix = "\ntheorem row0_valid : (rows 0).Valid 257 := by\n  decide +kernel\n\ntheorem row1_valid : (rows 1).Valid 257 := by\n  decide +kernel\n\ntheorem row2_valid : (rows 2).Valid 257 := by\n  decide +kernel\n\ntheorem rows_valid (i : Fin 3) : (rows i).Valid 257 := by\n  fin_cases i\n  · exact row0_valid\n  · exact row1_valid\n  · exact row2_valid\n\ntheorem terminal_sound :\n    ∀ s index, SixSpeed.terminal rows s index = true → Retained rows s :=\n  SixSpeed.terminal_sound rows\n\nend Loneliness.Modular.SixSpeed.Prime0257\n";
const entries = rows.map(row => "⟨![" + row.root.join(", ") + "], " + row.time + "⟩");
const content = prefix + "def rows : Fin " + rows.length + " → Row :=\n  ![" +
  entries.join(",\n    ") + "]\n" + suffix;
const path = "lean/Conjectures/LonelinessSixSpeedPrime0257Rows.lean";
if (args[0] === "--write") {
  mkdirSync(dirname(resolve(root, path)), {recursive: true});
  writeFileSync(resolve(root, path), content);
} else if (readFileSync(resolve(root, path), "utf8") !== content) {
  throw new Error("Generated terminal-row source differs: " + path);
}
const sha = value => createHash("sha256").update(value).digest("hex");
console.log(JSON.stringify({
  schema: "six-speed-prime0257-pilot-generation-v1",
  phase: "rows", prime: 257, minimum_pair: 2, row_count: rows.length,
  generated_sha256: {"Conjectures.LonelinessSixSpeedPrime0257Rows": sha(content)},
  generator_sha256: sha(readFileSync(fileURLToPath(import.meta.url))),
  complete_prime_checked: false
}, null, 2));
