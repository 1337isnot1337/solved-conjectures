# Heuristic search tools (not needed to check the result)

These are the scripts that found the certificates in [`../certificates.json`](../certificates.json). They are kept as a record and as a starting point for anyone who wants to attack `55 <= n <= 94`. **They play no part in the correctness of the result**: [`../verify.py`](../verify.py) checks every certificate exactly and needs none of these files.

They are copied as they were run, so expect to edit them before use:

- Several scripts hard-code the original working folders (for example a line `HERE = ...` or `sys.path.insert(0, ...)`) and the path of the original `certificates.json`, and some write their output there. Edit those lines to point at your own working folder. `collect.py`, `merge.py`, `chain.py` and `padchain.py` rewrite a certificates file; point them at a copy, not at `../certificates.json`.
- They need NumPy and SciPy (HiGHS linear programming); `lat1.py`, `enumsol.py`, `lns.py` and the rule searches need `python-sat`. The C annealers build with `gcc -O2 -o <name> <name>.c -lm` (`anneal.c`, `anneal3f.c`, `a3s.c`, `lanneal.c`).
- Random seeds and run lengths were tuned by hand during the search; rerunning them will not necessarily reproduce the same certificates.

Main entry points, in the order they were used (details in [`../PROOF.md`](../PROOF.md)):

| Range | Tools |
| --- | --- |
| speeds `1..n`, n = 18..27 | `slr.py`, `slr3.py`, `slr_auto.py` (grid annealing, sequential-LP polish, rounding, exact check) |
| n = 28..36 | `long.py`; `anneal.c` with `drive.py`; `anneal3f.c` with `drive5.py` |
| n = 37..40 | `cont2.py` (warm continuation and padding), `padchain.py` (warm chain) |
| other speeds, n = 41..45 | `a3s.c` (heat bath with speed-change moves), `a3drv.py`, `harvest.py`, `hyb.py`, `gam.py` |
| n = 46..54 | `a3chain.py`, `a3chain2.py`, `a3chain3.py`, `beam.py`, `addone.py`, `boost.py` |
| negative experiments | `ilp.py`, `gen_ilp.py`, `grid_ilp.py`, `smooth_ilp.py`, `struct_ilp.py`, `rule3.py`, `rule4.py`, `rule_anneal.py`, `poli.py`, `poli2.py`, `trunc.py`, `lat1.py`, `lanneal.c`, `lrun.py`, `lns.py` |

[`NOTES.md`](NOTES.md) records observations made during the search: the pair obstruction that pins many runs at exactly `1/gamma = n+1`, exact lattice covers for small `n`, and the SAT search over rules of Poliakova's type. The `*.log` files are raw logs of some runs.
