"""Feed mutated inputs to the author's check_family_B and check_KnF; each must raise AssertionError."""
import sys, json, copy, os
_HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(_HERE, '..'))
import verify as V
cert = json.load(open(os.path.join(_HERE, '..', 'certificates.json')))
orig = V.base_matchings
def run(name, f):
    try:
        f(); print("%-40s NOT REJECTED" % name)
    except AssertionError:
        print("%-40s rejected" % name)
def bad1(g, c=None):
    M0, M1 = orig(g, c); return M0, [(a+1, b+1) for a, b in M0]
def bad2(g, c=None):
    M0, M1 = orig(g, c); M1 = list(M1); a, b = M1[0]; c2, d = M1[1]; M1[0] = (a, c2); M1[1] = (b, d); return M0, M1
V.base_matchings = bad1; run("M1 := M0+1 (repeated lengths)", lambda: V.check_family_B(7, cert['base_g6']))
V.base_matchings = bad2; run("M1 rewired (same vertex set)", lambda: V.check_family_B(9, cert['base_g6']))
V.base_matchings = orig
c = copy.deepcopy(cert['Kn_minus_F'][0]); c['colour'][5] = (c['colour'][5] + 1) % c['p']
run("K11 colour perturbed", lambda: V.check_KnF(c))
c = copy.deepcopy(cert['Kn_minus_F'][1]); c['p'] = 45
run("K15 with p=45 (bound >= Delta+1?)", lambda: V.check_KnF(c))
