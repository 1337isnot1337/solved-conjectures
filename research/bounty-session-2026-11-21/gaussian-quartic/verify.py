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

allow_unit = "--allow-unit" in sys.argv
filenames = [arg for arg in sys.argv[1:] if arg != "--allow-unit"]
unit_prior = [
    ("Helenius-Catalan-1", ((78, 78), (0, 23), (0, 1)), (2, 3, 101)),
    ("Helenius-Catalan-2", ((1, 0), (1, -1), (1, 2)), (101, 5, 2)),
    ("Helenius-Catalan-3", ((0, 1), (11, 11), (0, 3)), (101, 2, 5)),
]
known = {}
for label, bases, exponents in checker.KNOWN + unit_prior:
    result = checker.verify(bases, exponents)
    assert result["identity"] and result["hyperbolic"]
    assert result["pairwise_gcd_norms"] == [1, 1, 1]
    known[checker.power_key(bases, exponents)] = label

for filename in filenames:
    for number, line in enumerate(Path(filename).read_text().splitlines(), 1):
        row = json.loads(line)
        bases = tuple(tuple(row[k]) for k in ("x", "y", "z"))
        exponents = tuple(row["exponents"])
        result = checker.verify(bases, exponents)
        assert result["identity"] and result["hyperbolic"]
        assert result["nonunit"] or (allow_unit and sum(checker.norm(z) > 1 for z in bases) == 2)
        assert result["pairwise_gcd_norms"] == [1, 1, 1]
        print(json.dumps({"file": Path(filename).name, "line": number,
                          "bases": bases, "exponents": exponents, **result,
                          "known_power_triple": known.get(checker.power_key(bases, exponents))}))
