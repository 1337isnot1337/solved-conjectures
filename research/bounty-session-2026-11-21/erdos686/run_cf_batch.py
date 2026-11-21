"""Run the exploratory exact candidate search; preserve every result."""
import argparse
from hashlib import sha256
import json
from pathlib import Path

from cf_witness_search import run

parser = argparse.ArgumentParser()
parser.add_argument("--ratio", type=int, default=25)
parser.add_argument("--digits", type=int, default=200)
parser.add_argument("--lengths", type=int, nargs="+", required=True)
parser.add_argument("--output", type=Path, required=True)
args = parser.parse_args()

source = Path(__file__).with_name("cf_witness_search.py")
results = {
    "status": "research search; no all-length proof",
    "source_sha256": sha256(source.read_bytes()).hexdigest(),
    "results": [],
}
for k in args.lengths:
    r = run(args.ratio, k, args.digits, None)
    results["results"].append(r)
    args.output.write_text(json.dumps(results, indent=2) + "\n")
    print(json.dumps({key:r[key] for key in [
        "N", "k", "certified_cf_terms", "coefficient_b_abs_max",
        "primitive_pairs", "witnesses", "seconds"
    ]}), flush=True)
