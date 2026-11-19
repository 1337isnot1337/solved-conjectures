# Verified p179 root component

The p179 component proves the original `GlobalRootCover 179` statement with
no mathematical coverage hypothesis. Its complete hosted source, axiom, and
stock-kernel gates passed at `c5d11dd3e2c3420aa1fca61f9634a29f7295dfba`:
44 project modules, 50 required endpoints, and 6,971 audited project theorems.
The component is registered through the final root and its complete closure.

The source commands used `-DwarningAsError=true -Dlinter.all=false`.
This is not an all-linter cleanliness receipt. See the
[verification record](five-speed-p179-verification.md) for the exact gate,
source hashes, artifact provenance, and registration scope.

The generator emits 2,731 finite kernel checks, checked literal caches,
and balanced composition proofs for every base and C interval. Ten part
modules cover all 40 nontrivial bases, four bases per module. The complete
candidate adds 14 modules, including the packed scalar table and two small
composition lemmas. Python's choices are not proof assumptions.

Before the complete hosted pass, local source evidence covered the packed
table, cache module, composition helper, and first part module (bases 2, 3,
4, and 5). That historical partial receipt remains available. The complete
`root-quick179` task checks all 14 targets and their 44-module local closure,
including all 50 required theorem names.

Reproduce the generated root modules from the repository root:

```bash
python3 results/five-speed-spectrum/generate_lean_root_quick.py \
  --prime 179 --lean-dir lean/Conjectures --d-chunk 32 \
  --c-chunk 16 --base-chunk 16 --bases-per-module 4 --write
```

Five scalar/plane groups have now passed hosted source compilation, their
transitive axiom audits, and independent stock-kernel replay of every local
module. Their exact receipts and artifact digests are recorded in the
[component index](five-speed-receipts/hosted-component-index.json).
The 227-module finite-assembly closure also passed all three checks. Its
coverage hypotheses remain explicit and must still be discharged.

The p179 root component and its local closure are registered. The full
root-prime list, remaining scalar/plane groups, bounded-map groups, and their
final aggregation remain unfinished. This component does not establish the
complete five-speed classification. Li remains last.
