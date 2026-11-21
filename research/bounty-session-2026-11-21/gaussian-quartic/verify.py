"""Independent arbitrary-integer checks and prior-example classification.

The canonicalization data live in the sibling Gaussian investigation.
This checks arithmetic, not novelty or sponsor acceptance.
"""
import importlib.util
import json
import sys
from pathlib import Path

checker_path = Path(__file__).resolve().parents[1] / "jsp-gaussian" / "verify_candidates.py"
spec = importlib.util.spec_from_file_location("gaussian_checker", checker_path)
checker = importlib.util.module_from_spec(spec)
spec.loader.exec_module(checker)

known = {}
for label, bases, exponents in checker.KNOWN:
    result = checker.verify(bases, exponents)
    assert result["identity"] and result["hyperbolic"]
    assert result["pairwise_gcd_norms"] == [1, 1, 1]
    known[checker.power_key(bases, exponents)] = label

for filename in sys.argv[1:]:
    for number, line in enumerate(Path(filename).read_text().splitlines(), 1):
        row = json.loads(line)
        bases = tuple(tuple(row[k]) for k in ("x", "y", "z"))
        exponents = tuple(row["exponents"])
        result = checker.verify(bases, exponents)
        assert result["identity"] and result["hyperbolic"] and result["nonunit"]
        assert result["pairwise_gcd_norms"] == [1, 1, 1]
        print(json.dumps({"file": Path(filename).name, "line": number,
                          "bases": bases, "exponents": exponents, **result,
                          "known_power_triple": known.get(checker.power_key(bases, exponents))}))
