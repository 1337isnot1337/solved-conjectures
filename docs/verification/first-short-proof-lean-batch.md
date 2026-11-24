# First short-proof Lean batch: verification receipt

The three modules below were built with Lean 4.35.0 (`eb6cafb7290e8bd5f2937522d8d804f58f02bafc`) and the repository's exact Mathlib revision (`56a005855ea17e0b0958f73ec801ae140b0a1679`). Strict elaboration used `-DwarningAsError=true`. The all-owned audit checked serialized public and private declarations. Each module passed independent stock kernel replay.

| Module | Source SHA-256 | Scoped result |
| --- | --- | --- |
| `Conjectures.AlmironMoyanoWilf` | `a91564bbe8877ce781ec4b9009da96ad0253d646a3d9aab064b73b498967b6e7` | 61 declarations; Q4.8 and Q4.13(1)–(2), (6). |
| `Conjectures.CardonZeroSector` | `74ed03abcdfdf8e877b436aa704776831f4c008a4f0e3c02b909f5b9f77e35cd` | 32 declarations; full refutation of Question 6.1. |
| `Conjectures.ChappelonRamirezStamateLeafType` | `7f99f3ff80fb7d68d11f173e3bfcc7a749cbb59af976a7c2ed1efe1a0d654569` | 82 declarations; full refutation of Conjecture 4.4. |

The audited declarations use only `propext`, `Classical.choice`, and `Quot.sound`. The check did not use `sorry`, native-computation axioms, or assumptions standing in for a mathematical dependency.

To repeat the scoped kernel checks from the `lean` directory after installing the pinned dependencies:

```bash
for m in AlmironMoyanoWilf CardonZeroSector ChappelonRamirezStamateLeafType; do
  lake env lean -DwarningAsError=true "Conjectures/$m.lean"
  lake build "Conjectures.$m"
  lake env python3 ../scripts/replay_lean.py --root "Conjectures.$m"
done
```

The repository-wide audit and replay remain separate from this scoped receipt. See [issue #503](https://github.com/1337isnot1337/solved-conjectures/issues/503) for campaign coordination.
