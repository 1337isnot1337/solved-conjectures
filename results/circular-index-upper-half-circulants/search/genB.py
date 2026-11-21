# generate base certificates for the (b) family, one g per call; append to JSON-lines file
import json, os, sys, time
from baseb import base
g = int(sys.argv[1])
t = time.time(); r = base(g)
if r:
    with open(os.path.join(os.path.dirname(os.path.abspath(__file__)), "baseB.jsonl"), "a") as f:
        f.write(json.dumps({"g": g, "W": [[[a, b] for a, b, l in W] for W in r]}) + "\n")
print(g, "SAT" if r else "UNSAT", "%.1fs" % (time.time() - t), flush=True)
