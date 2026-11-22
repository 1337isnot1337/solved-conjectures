"""For a state (speeds v, shifts s) and target delta=1/(n+2+eps), find the uncovered grid set U and, for every candidate new speed w,
the best shift and fraction of U covered by one added runner w."""
import sys, json, numpy as np
def load(fn):
    d = json.load(open(fn)); d = d[0] if isinstance(d, list) else d
    Q = d.get('Q', d.get('shift_den')); m = d.get('shifts_num', d.get('shift_num'))
    return d['speeds'], [x / Q for x in m]
def fvals(v, s, t):
    f = np.full(len(t), 1.0)
    for vi, si in zip(v, s):
        x = (si + vi * t) % 1.0; f = np.minimum(f, np.minimum(x, 1 - x))
    return f
def best_shift(w, tU, delta, M=20000):
    # bins of shift; count covered U points per shift bin (difference array)
    c = (-w * tU) % 1.0
    D = np.zeros(M + 1)
    lo = np.ceil((c - delta) * M).astype(int); hi = np.floor((c + delta) * M).astype(int)
    for a, b in zip(lo, hi):
        if a < 0: D[a + M] += 1; D[M] -= 1; D[0] += 1; D[b + 1] -= 1
        elif b >= M: D[a] += 1; D[M] -= 1; D[0] += 1; D[b - M + 1] -= 1
        else: D[a] += 1; D[b + 1] -= 1
    C = np.cumsum(D[:M]); k = int(C.argmax()); return C[k] / len(tU), k / M
if __name__ == '__main__':
    fn = sys.argv[1]; eps = float(sys.argv[2]); wmax = int(sys.argv[3]); G = int(sys.argv[4]) if len(sys.argv) > 4 else 2000000
    v, s = load(fn); n = len(v); delta = 1.0 / (n + 2 + eps)
    t = (np.arange(G) + 0.5) / G; f = fvals(v, s, t); U = t[f > delta]
    print('%s n=%d max f=%.6f (1/f=%.4f) target delta=1/%.3f: |U| grid=%d meas=%.2e' % (fn, n, f.max(), 1 / f.max(), 1 / delta, len(U), len(U) / G))
    # cluster U into intervals
    idx = np.where(f > delta)[0]; br = np.where(np.diff(idx) > 1)[0]
    print('  intervals:', len(br) + 1)
    res = []
    for w in range(1, wmax + 1):
        if w in v: continue
        fr, sh = best_shift(w, U, delta); res.append((fr, w, sh))
    res.sort(reverse=True)
    print('  best single added speeds (fraction of U covered):', ' '.join('%d:%.3f' % (w, fr) for fr, w, sh in res[:12]))
