import sys, time
from gen_ilp import attempt, report
def smooth(x, P):
    for p in P:
        while x % p == 0: x //= p
    return x == 1
def cand_sets(N, P=(2, 3), top=4, odd_extra=()):
    U = set(k for k in range(1, N+1) if smooth(k, P))
    for a in range(0, 8):
        for num, den in ((1, 1), (3, 2), (3, 4), (1, 3), (2, 3)):
            x = N * num
            if x % (den * 2**a) == 0 and x // (den * 2**a) <= N: U.add(x // (den * 2**a))
    U |= set(range(max(1, N - top + 1), N + 1))
    Se = sorted(2*k for k in U)
    So = set(k for k in range(1, 2*N, 2) if smooth(k, P) and k <= 81)
    for d in range(1, 2*N+1):
        if (2*N) % d == 0 and d % 2 == 1: So.add(d); So.add(3*d)
    So |= set(odd_extra)
    return Se, sorted(So)
if __name__ == "__main__":
    Ns = [int(x) for x in sys.argv[1].split(",")]; tl = float(sys.argv[2]); rich = sys.argv[3] == "rich"
    eps_list = [float(x) for x in sys.argv[4].split(",")]; top = int(sys.argv[5])
    for N in Ns:
        Se, So = cand_sets(N, top=top)
        print("N=%d |Se|=%d |So|=%d" % (N, len(Se), len(So)), flush=True)
        for eps in eps_list:
            d = 1/(N+eps)
            r, st, tt = attempt(N, d, Se, So, tl=tl, rich=rich)
            report(N, eps, r, st, tt)
            if r: break
