"""Build the verify_sat.py part-2 CNF for K_9 - F at (25,3), solve with glucose4 (pysat, with_proof),
write DIMACS + DRUP proof, then the caller runs drat-trim."""
import sys, re, os
src = open(os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'verify_sat.py')).read()
src = src.split("parts = sys.argv")[0]
src = src.replace("    with Solver(name='kissat404', bootstrap_with=cnf.clauses) as s: return s.solve()\nparts", "parts")
src = src.replace("with Solver(name='kissat404', bootstrap_with=cnf.clauses) as s: return s.solve()", "return cnf")
exec(src)
from pysat.solvers import Solver
name = sys.argv[1]; F = eval(sys.argv[2]); SOLVER = sys.argv[3] if len(sys.argv)>3 else 'glucose4'
redundant_cnf = redundant
cnf = redundant_cnf(9, F, 25, 3)
cnf.to_file(name + '.cnf')
with Solver(name=SOLVER, bootstrap_with=cnf.clauses, with_proof=True) as s:
    r = s.solve(); print(name, SOLVER+":", "SAT" if r else "UNSAT", flush=True)
    if not r:
        with open(name + '.drup', 'w') as f:
            for line in s.get_proof(): f.write(line + '\n')
