import os, subprocess, time, sys
HERE = os.path.dirname(os.path.abspath(__file__))
from math import gcd
specs = []
for q in range(4, 10):
    for r in range(q // 2 + 1, q):
        if gcd(q, r) != 1: continue
        for g in range(1, 7):
            n = 2 * q * g + 1
            if n > 90: continue
            specs.append((n, q, r, g))
specs.sort()
for n, q, r, g in specs:
    t = time.time()
    try:
        out = subprocess.run(["nice", "-n", "10", sys.executable, os.path.join(HERE, "cycsat.py"), str(q), str(r), str(g)], capture_output=True, text=True, timeout=300).stdout.strip()
    except subprocess.TimeoutExpired:
        out = "q=%d r=%d g=%d: n=%d TIMEOUT 300s" % (q, r, g, n)
    print(out, flush=True)
print("DONE", flush=True)
