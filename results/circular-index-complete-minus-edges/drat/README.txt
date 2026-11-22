DRUP/DRAT certificates for the (25,3) exclusions of K_9 - F (Part C, n = 9, t = 3).
mkproof.py NAME F [SOLVER] builds the CNF of verify_sat.py part 2 (function `redundant`), writes NAME.cnf,
solves it with python-sat (glucose4 by default, with_proof=True) and writes the proof NAME.drup.
Check with drat-trim (https://github.com/marijnheule/drat-trim):  ./drat-trim NAME.cnf NAME.drup
Results (21 Nov 2026): K3 [(0,1),(1,2),(0,2)], K13 [(0,1),(0,2),(0,3)], P4 [(0,1),(1,2),(2,3)], P3K2 [(0,1),(1,2),(3,4)]
with glucose4; 3K2 [(0,1),(2,3),(4,5)] with cadical195 (glucose4 timed out). All five: "s VERIFIED".
Proof sizes: 8 MB, 15 MB, 26 MB, 160 MB, 561 MB (not stored).
