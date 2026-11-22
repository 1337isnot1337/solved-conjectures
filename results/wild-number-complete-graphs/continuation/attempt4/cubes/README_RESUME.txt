A13 isomorph-free cube-and-conquer: status at stop (22 Nov 2026, 04:16 CET)
k=0 (x0 = light vertex 6): 773 cubes; cubes 0..363 UNSATISFIABLE (res_k0_N.txt), 364..772 NOT RUN. No SAT, no UNKNOWN.
k=1 (x0 = w*): res_k1_Nw (1153 cubes, w* light) and res_k1_Hw (1400 cubes, w* heavy) NOT STARTED.
Resume: cd continuation/attempt4 && nohup ./resume.sh &   (skips cubes already UNSAT; one solver at a time, nice 19)
Check: python3 check_complete.py
Solver: bin/kissat = Kissat 4.0.4, binary from PyPI wheel passagemath-kissat 10.8.14 (sage_wheels/bin/kissat)
Command per cube: nice -n 19 bin/kissat -q --unsat --time=1800 cubes/c_<tag>.cnf cubes/p_<tag>_<i>.drat
Cube CNF (current driver, cuberun.py): gen13.build(k,'none',exact=True,cnt=True) + star units (+ unit -cov[w*,d0] for k=1)
  + lex-leader for <=60 residual automorphisms (cubesb.py, shuffled with random.Random(i)).
CNF variant history for k=0 (all sound): cubes 0-53 plain base (no residual SB, no card); 54-98 + residual SB;
  99-363 + residual SB + exact bad + |Bad|<=34.  Binary DRAT proofs (gzip) kept for cubes 0-244 (2 GB cap);
  they match the CNF variant of their cube; to check them, regenerate the cube CNF with the matching variant
  (or simply re-run the current driver on those cubes with proof output). No DRAT checker was available here
  (drat-trim not on pip); proofs are UNCHECKED.
