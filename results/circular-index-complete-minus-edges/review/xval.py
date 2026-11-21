import subprocess, sys, random, itertools, os
sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), '..'))
from verify_seq import perfect_sequencings
random.seed(1)
allE = list(itertools.combinations(range(7), 2))
tests = [[(i, (i+1) % 7) for i in range(7)], [(i, (i+2) % 7) for i in range(7)]]
for _ in range(25):
    tests.append(random.sample(allE, random.choice([5, 6, 7, 8, 9])))
agree = 0; pos = 0
for F in tests:
    F = [tuple(sorted(e)) for e in F]
    out = subprocess.run(["./seqsearch", "7", "-", "0"] + [str(x) for e in F for x in e], capture_output=True, text=True).stdout
    mine = int(out.split("sequencings(e0 fixed)=")[1].split()[0])
    theirs = len(perfect_sequencings(7, F))
    assert mine == theirs, (F, mine, theirs)
    agree += 1; pos += mine > 0
print("agree on", agree, "graphs;", pos, "with sequencings")
