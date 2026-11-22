import json, glob
out = []
for f in sorted(glob.glob('slr_cert_*.json'), key=lambda x: int(x.split('_')[-1][:-5])):
    d = json.load(open(f))
    out.append({"n": d["n"], "speeds": d.get("speeds", list(range(1, d["n"] + 1))), "shift_den": d["Q"],
                "shift_num": d["shifts_num"], "gamma": d["gamma"]})
json.dump(out, open('/mnt/user-data/outputs/shifted-lonely-runner/certificates.json', 'w'), indent=1)
print([c["n"] for c in out])
