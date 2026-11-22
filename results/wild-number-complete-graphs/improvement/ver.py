"""Exact verification: for each odd n in [lo,hi], find rational a = k/2000 and check
sum_j c_j a^{3j} <= a-1 exactly (Fractions), c_j from counts.coef."""
import sys
from counts import coef, best_a, exact_check
lo, hi = int(sys.argv[1]), int(sys.argv[2]); allok = True
for n in range(lo, hi+1, 2):
    co = coef(n); a, s = best_a(n, co); ok, W = exact_check(n, a, co); allok &= ok
    print(n, "n mod 6 =", n % 6, "a =", a, "W(a) = %.6f" % float(W), "a-1 = %.6f" % float(a-1),
          "slack = %.6f" % float(a-1-W), "OK" if ok else "FAIL", flush=True)
print("ALL OK" if allok else "SOME FAIL")
