# Continuation material for the open range 13 ≤ n ≤ 154

[Result landing page](../README.md)

**Nothing in this folder proves a new value of `n`.** The open range is still `13 <= n <= 154`. The folder keeps two later attempts so that others can continue from them. Each note labels its claims: **[proved]** for a complete written proof, **[computer]** for a solver run or exhaustive check, and **[heuristic]** for numerical evidence only. None of this material has been through a referee pass.

## [`attempt3/`](attempt3/) — peeling potential and the reduction of n = 13, 14

Main note: [`attempt3/REPORT.md`](attempt3/REPORT.md); work log: [`attempt3/LOG.md`](attempt3/LOG.md).

| Item | Status |
| --- | --- |
| Lemma 1: a triple partition is seal-free iff peeling its triples one at a time makes only legal moves | proved |
| Theorem P: exact potential identity for peeling, with a never-stuck test and a first-moment finishing test | proved |
| Decrease lemma for the potential along some legal path, which would give a deterministic proof for all large `n` | missing |
| Potential trajectories for `n = 21, 45, 63` (`phi.py`, `phi63.out`) | heuristic |
| SAT search with counterexample-guided refinement (`cegar.py`); encoding validated by `encval.py` | computer |
| `n = 9` and `n = 11` re-proved by CaDiCaL via PySAT; no proof certificate checked | computer |
| Lemmas 13.0–13.2: every near-1-factorization of `K_13` has a suitable rainbow 4-set, and the bad triples of the remaining 9-point end-game are listed explicitly (13.2 also validated by `val13.py`) | proved |
| Theorem 13: A13(0) and A13(1) imply the conjecture for `n = 13` and `n = 14` | proved (conditional on A13) |
| A13(0), A13(1): DIMACS encodings [`abs13_k0.cnf`](attempt3/abs13_k0.cnf) and [`abs13_k1.cnf`](attempt3/abs13_k1.cnf), written by `abs13.py` | open; undecided after about 10 minutes per solver |
| Every rainbow 4-set with `k <= 1` leaves at least 49 good splits in 6 factorizations (`good13.py`) | heuristic |
| Routes 2 (delete and repair) and 4 (induction) and a superblock model: why each stalls | analysis, no claim |

## [`attempt4/`](attempt4/) — cube-and-conquer for A13 and the weighted potential

Main note: [`attempt4/NOTES.md`](attempt4/NOTES.md); work log: [`attempt4/LOG.md`](attempt4/LOG.md).

| Item | Status |
| --- | --- |
| Re-implementation of A13 (`gen13.py`), validated against attempt 3 on 1480 rainbow 4-sets (`val4.py`) | computer |
| Symmetry group of A13 and soundness of the isomorph-free cubes and of lex-leader symmetry breaking inside a cube | proved |
| Cube enumeration (`orbits.py`) and symmetry-breaking clauses, checked by brute force (`orbcheck.py`, `orbtest2.py`, `lextest.py`) | computer |
| A13(0): cubes 0–363 of 773 UNSAT by Kissat 4.0.4 ([`cubes/res_k0_N.txt`](attempt4/cubes/res_k0_N.txt), [`cubes/STATUS.txt`](attempt4/cubes/STATUS.txt)) | computer; DRAT proofs unchecked and not included |
| A13(0): cubes 364–772 | not run |
| A13(1): 1153 + 1400 cubes | not started (8 sample cubes UNSAT in `k1test.py`) |
| Whole-instance runs with Kissat and CP-SAT; a relaxed colouring with only 44 good splits ([`best_k0.json`](attempt4/best_k0.json)) | computer, undecided |
| Lemma X: a per-vertex decrease bound for a weighted potential `L`, and a conditional contraction theorem | proved |
| Invariant bounding the number of illegal triples through a vertex along a path, which Lemma X needs | missing |
| Why this route would not move the threshold much below 155 even with that invariant (`phiW.py`, `phiW2.py`, `phiX.py`, `start_eff.py`) | heuristic |

## Resuming the cube-and-conquer

[`attempt4/cubes/README_RESUME.txt`](attempt4/cubes/README_RESUME.txt) records the exact solver command and the CNF variant used for each range of cubes; [`attempt4/resume.sh`](attempt4/resume.sh) runs [`attempt4/cuberun.py`](attempt4/cuberun.py) for the remaining cubes of A13(0) and then for A13(1), skipping cubes already listed as UNSAT. The note estimates about 1 hour of CPU for the rest of A13(0) and 4–5 hours for A13(1). Settling `n = 13` and `n = 14` this way also requires checking the UNSAT proofs with an independent DRAT checker, which was not done for any cube.

## Running these scripts

- The SAT encodings and their checks need `python-sat` (PySAT), directly or through `abs13.py`, `cegar.py` or `gen13.py`; `cpsat13.py` and `cpmin13.py` need OR-Tools; the potential scripts use only the standard library. The cube driver expects a Kissat binary at `attempt4/bin/kissat`, which is not included (the note used Kissat 4.0.4 from the PyPI wheel `passagemath-kissat` 10.8.14).
- The scripts were written in separate working folders. Their imports of sibling modules were changed to paths relative to this folder: attempt 3 scripts import `n1f.py` from [`../theorem-a/`](../theorem-a/), and attempt 4 scripts import `fac.py` and `lib13.py` from [`attempt3/`](attempt3/). The notes still mention the original working-folder names `wild3` and `wild4`; these are `attempt3/` and `attempt4/` here.
- Run the cube driver from inside `attempt4/`, since it reads and writes `cubes/` relative to the working directory; `resume.sh` changes to its own folder first.
- Not included: the gzipped DRAT proofs for cubes 0–244 (about 1.9 GB), the solver binary, intermediate cube CNFs, and two empty log files.
