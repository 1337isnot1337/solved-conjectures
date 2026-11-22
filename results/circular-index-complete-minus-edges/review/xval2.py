import subprocess, sys, itertools, os
sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), '..'))
from verify_seq import perfect_sequencings
def mine(n, F):
    out = subprocess.run(["./seqsearch", str(n), "-", "0"] + [str(x) for e in F for x in e], capture_output=True, text=True).stdout
    return int(out.split("sequencings(e0 fixed)=")[1].split()[0])
K = lambda S: list(itertools.combinations(S, 2))
cases = [(7, K([0,1,2]) + K([3,4,5,6])), (7, K([0,1,2,3]) + [(4,5)]), (7, K([0,1,2]) + [(3,4),(5,6)]), (7, K([0,1,2])+K([3,4,5]))]
cases += [(5, list(F)) for t in range(0, 5) for F in itertools.combinations(K(range(5)), t)]
pos = 0
for n, F in cases:
    a, b = mine(n, F), len(perfect_sequencings(n, F))
    assert a == b, (n, F, a, b); pos += a > 0
print("agree on", len(cases), "cases;", pos, "with sequencings")
for n, F in cases[:4]: print(n, F, mine(n, F))
