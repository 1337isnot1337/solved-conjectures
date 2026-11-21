"""Mutation tests: each mutated copy of indep_check.py must FAIL (g range kept small)."""
import subprocess, sys, os
_HERE = os.path.dirname(os.path.abspath(__file__))
src = open(os.path.join(_HERE, 'indep_check.py')).read()
muts = {
 "block2 colour +1": ("cols.append(9 + (js[0]-6))", "cols.append(10 + (js[0]-6))"),
 "no second shift": ("(3 if (nb == 2 and c >= 6) else 0)", "0"),
 "second block after colour 5 copies E5..E7": ("for j in (6, 7, 8)", "for j in (5, 6, 7)"),
 "q=4 instead of 3": ("assert d.min() >= 3", "assert d.min() >= 4"),
 "block 2 = block 1 (X2:=X1)": ("X2 = [1] + list(range(4, 6*g+1, 2))", "X2 = [0] + list(range(3, 6*g, 2))"),
 "colour 3a replaced by 5a": ("c = (3*a) % N2", "c = (5*a) % N2"),
 "M0 nest offset changed": ("(3*g+1-j, 3*g+2+j) for j in range(1, g-1)", "(3*g+1-j, 3*g+3+j) for j in range(1, g-1)"),
}
for name, (a, b) in muts.items():
    assert a in src, name
    s = src.replace(a, b)
    open(os.path.join(_HERE, '_mut_tmp.py'), 'w').write(s)
    r = subprocess.run([sys.executable, '-I', os.path.join(_HERE, '_mut_tmp.py'), '12', '9', '7'], capture_output=True, text=True)
    ok = r.returncode != 0 and 'PASSED' not in r.stdout
    print("%-45s %s" % (name, "rejected" if ok else "NOT REJECTED"))

os.remove(os.path.join(_HERE, '_mut_tmp.py'))
