# structured base search: internal edges of W0 and W1 go from Lf=[A, A+g-3] to the rest of I; same leftover pair in both
import sys
from baseb import base
def extra(cnf, Y, g, n):
    A = 2*g+3; Lf = set(range(A, A+g-2))
    for (k, a, b), y in Y.items():
        if a >= A and b >= A and not ((a in Lf) != (b in Lf)): cnf.append([-y])   # internal edges must cross Lf | rest
    # leftover (matched to singletons) positions equal in W0 and W1
    for v in range(A, 4*g+1):
        l0 = [y for (k, a, b), y in Y.items() if k == 0 and a < A and b == v]
        l1 = [y for (k, a, b), y in Y.items() if k == 1 and a < A and b == v]
        # sum(l0) == sum(l1) (each at most 1)
        for x in l0: cnf.append([-x] + l1)
        for x in l1: cnf.append([-x] + l0)
for g in range(int(sys.argv[1]), int(sys.argv[2]) + 1):
    r = base(g, extra)
    if not r: print(g, "UNSAT"); continue
    A = 2*g+3
    W0, W1 = r
    left0 = sorted(b - A for a, b, l in W0 if a < A); 
    print(g, "leftover positions", left0, "long", sorted(l for a, b, l in W0 + W1 if a < A))
    print("   W0", sorted((a-A, b-A, l) for a, b, l in W0 if a >= A)); print("   W1", sorted((a-A, b-A, l) for a, b, l in W1 if a >= A))
