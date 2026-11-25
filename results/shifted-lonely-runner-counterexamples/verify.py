#!/usr/bin/env python3
"""Exact verifier for shifted Lonely Runner counterexample certificates (standard library only).

For each certificate (n, speeds v_1..v_n, shifts s_i = shift_num[i]/shift_den) it checks:
  (0) the speeds are n distinct positive integers and the shifts are rationals;
  (1) gamma = max_t min_i ||s_i + v_i t|| computed EXACTLY: f(t) = min_i ||s_i + v_i t|| is piecewise
      linear; at a local maximum some runner i is moving away from the nearest integer and some runner
      j != i towards it (or i = j at a half-integer turning point), with equal distances, so
      (v_i + v_j) t + s_i + s_j is an integer for some pair i <= j.  Enumerating all such t (all pairs
      i <= j, all residues) and taking the max of f gives gamma exactly; must be < 1/(n+1)
      and equal to the recorded value;
  (2) independently: with delta = (gamma + 1/(n+1))/2 < 1/(n+1), the closed arcs
      {t in R/Z : ||s_i + v_i t|| <= delta} (v_i arcs per runner) cover R/Z (interval-union sweep).
      (2) alone proves gamma <= delta < 1/(n+1).

Modes (run from the repository root or from this folder):
  python3 verify.py            full check: (0), (1) and (2) for every certificate (about 4 minutes)
  python3 verify.py --quick    (0) and (2) for every certificate, with delta formed from the recorded
                               gamma after checking that it is below 1/(n+1); (1) only for n <= 24
                               and n = 41 (about 10 seconds).  Check (2) is a proof on its own, so the
                               quick mode still proves gamma < 1/(n+1) for every certificate; it skips
                               the exact recomputation of the recorded gamma for the other n.

The data file defaults to certificates.json next to this script.
Exit status is non-zero if any check fails or if the certified n are not exactly 18, ..., 57."""
import argparse
import json
import sys
from fractions import Fraction as F
from pathlib import Path

HERE = Path(__file__).resolve().parent
CLAIMED = list(range(18, 58))      # the package claims one counterexample for each of these n
QUICK_EXACT = set(range(18, 25)) | {41}


def dist(x):                      # ||x|| for a Fraction x
    r = x - (x.numerator // x.denominator)
    return min(r, 1 - r)


def gamma_exact(v, s):
    n = len(v); best = F(0)
    for i in range(n):
        for j in range(i, n):
            w = v[i] + v[j]; c = s[i] + s[j]
            for m in range(w):
                t = (m - c) / w
                f = min(dist(s[k] + v[k] * t) for k in range(n))
                if f > best: best = f
    return best


def covers(v, s, delta):
    arcs = []
    for vi, si in zip(v, s):
        for m in range(vi):
            lo = (m - si - delta) / vi; hi = (m - si + delta) / vi
            k = lo.numerator // lo.denominator; lo -= k; hi -= k     # lo in [0,1)
            arcs.append((lo, hi))
            if hi > 1: arcs.append((lo - 1, hi - 1))
    arcs.sort()
    reach = F(0)
    for lo, hi in arcs:
        if lo > reach: return False          # uncovered gap (reach, lo)
        reach = max(reach, hi)
        if reach >= 1: return True
    return False


def check(c, exact):
    n, v, Q = c["n"], c["speeds"], c["shift_den"]
    ok0 = (isinstance(Q, int) and Q > 0 and all(isinstance(x, int) for x in c["shift_num"])
           and len(v) == n == len(c["shift_num"]) and len(set(v)) == n
           and all(isinstance(x, int) and x > 0 for x in v))
    if not ok0:
        return False, "malformed certificate"
    s = [F(x, Q) for x in c["shift_num"]]
    recorded = F(c["gamma"])
    bound = F(1, n + 1)
    if exact:
        g = gamma_exact(v, s)
        ok1 = g < bound and g == recorded
        delta = (g + bound) / 2
    else:
        g = recorded
        ok1 = recorded < bound           # exact recomputation skipped in quick mode
        delta = (recorded + bound) / 2
    ok2 = ok1 and covers(v, s, delta)
    ok = ok1 and ok2
    line = "n=%2d  speeds=%s  gamma=%s%s  1/gamma-(n+1)=%.4f  gamma<1/(n+1):%s  cover@delta:%s  %s" % (
        n, "1..%d" % n if v == list(range(1, n + 1)) else "other(max %d)" % max(v), g,
        "" if exact else " (recorded)", float(1 / g) - (n + 1), ok1, ok2, "OK" if ok else "FAIL")
    return ok, line


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("certificates", nargs="?", default=str(HERE / "certificates.json"))
    mode = ap.add_mutually_exclusive_group()
    mode.add_argument("--quick", action="store_true", help="cover check for all n, exact gamma for n <= 24 and n = 41")
    mode.add_argument("--full", action="store_true", help="exact gamma and cover check for all n (default)")
    args = ap.parse_args()

    with open(args.certificates) as fh:
        certs = json.load(fh)
    bad = 0
    for c in certs:
        exact = not args.quick or c["n"] in QUICK_EXACT
        ok, line = check(c, exact)
        bad += not ok
        print(line, flush=True)
    ns = sorted(c["n"] for c in certs)
    print("SUMMARY (%s): %d certificates, %d passed, %d failed; certified n = %s"
          % ("quick" if args.quick else "full", len(certs), len(certs) - bad, bad, ns))
    if ns != CLAIMED:
        print("FAIL: expected exactly one certificate for each n in 18..57", file=sys.stderr)
        bad += 1
    sys.exit(1 if bad else 0)


if __name__ == "__main__":
    main()
