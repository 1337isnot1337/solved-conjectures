# Complete p179 root candidate

The new candidate proves the original `GlobalRootCover 179` statement if
its complete Lean source, axiom, and stock-kernel gates pass. It has no
mathematical coverage hypothesis. Those complete gates are pending.

The generator emits 2,731 finite kernel checks, checked literal caches,
and balanced composition proofs for every base and C interval. Ten part
modules cover all 40 nontrivial bases, four bases per module. The complete
candidate adds 14 modules, including the packed scalar table and two small
composition lemmas. Python's choices are not proof assumptions.

The packed table, cache module, composition helper, and first part module
passed local source checks with warnings treated as errors. The first part
covers bases 2, 3, 4, and 5. This partial source evidence does not establish
the final root theorem. The ordinary candidate registry now includes the
complete `root-quick179` task with 50 required theorem names.

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

No candidate has been added to accepted roots. The full root-prime list,
remaining scalar/plane groups, bounded-map groups, and their final
aggregation remain unfinished. Li remains last.
