"""Merge newly found certificates into the deliverable certificates.json (format of verify.py) and report the certified set."""
import json, glob, sys
from fractions import Fraction as F
OUT = 'certificates.work.json'  # never point this at ../certificates.json, the verified file
certs = {c["n"]: c for c in json.load(open(OUT))}
new = []
for f in glob.glob('./slr_cert_*.json') + glob.glob('./slr_cert_*.json'):
    d = json.load(open(f)); n = d["n"]
    if n in certs: continue
    certs[n] = {"n": n, "speeds": d["speeds"], "shift_den": d["Q"], "shift_num": d["shifts_num"], "gamma": d["gamma"]}
    new.append(n)
lst = [certs[n] for n in sorted(certs)]
json.dump(lst, open(OUT, 'w'), indent=0)
ns = sorted(certs)
print("new:", sorted(new)); print("certified n:", ns)
print("missing in 18..94:", [n for n in range(18, 95) if n not in certs])
for n in sorted(new): print("  n=%d gamma=%s E=%.4f" % (n, certs[n]["gamma"], float(1 / F(certs[n]["gamma"])) - n - 1))
