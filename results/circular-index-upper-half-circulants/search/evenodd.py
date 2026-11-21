# W_odd: forced nested odd lengths, leftovers middle. Enumerate W_even matchings (lengths 2,4,..,L-2 once) and check long edges.
import sys
def even_matchings(L):
    # place lengths in decreasing order L-2, L-4, ..., 2 ; positions 0..L-1, two leftovers
    res = []
    def rec(lens, used, pairs):
        if not lens:
            res.append((pairs[:], sorted(set(range(L)) - used))); return
        d = lens[0]
        for a in range(L - d):
            b = a + d
            if a in used or b in used: continue
            used.add(a); used.add(b); pairs.append((a, b))
            rec(lens[1:], used, pairs)
            used.discard(a); used.discard(b); pairs.pop()
    rec(list(range(L - 2, 1, -2)), set(), [])
    return res
for g in range(int(sys.argv[1]), int(sys.argv[2]) + 1):
    n = 6*g+1; L = 2*g-2; A = 2*g+3
    ln = lambda v, w: min((w-v) % n, (v-w) % n)
    oddleft = [A + g - 2, A + g - 1]
    found = []
    for evenpairs, left in even_matchings(L):
        lv = [A + x for x in left]
        for evenW, oddW in ((0, 1), (1, 0)):
            sing = {0: (0, 1), 1: (1, 2)}
            so, se = sing[oddW], sing[evenW]
            for po in ((oddleft[0], oddleft[1]), (oddleft[1], oddleft[0])):
                lo = [ln(so[0], po[0]), ln(so[1], po[1])]
                for pe in ((lv[0], lv[1]), (lv[1], lv[0])):
                    le = [ln(se[0], pe[0]), ln(se[1], pe[1])]
                    allL = lo + le
                    if len(set(allL)) == 4 and 1 not in allL:
                        found.append((evenW, left, evenpairs, po, pe, lo, le))
    print(g, len(found), found[:2])
