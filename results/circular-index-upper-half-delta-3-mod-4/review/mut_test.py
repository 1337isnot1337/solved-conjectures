#!/usr/bin/env python3
"""Mutation tests for ref_verify.py: every mutation must be rejected."""
import sys, json, copy, os
_HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, _HERE)
import ref_verify as R


def mk(base=None, blocks=None, inserts=None, coloured=None, q=None, skip=False):
    def hook(stage, g, data):
        if stage == "skipclaims":
            return skip
        if stage == "skipstruct":
            return skip
        f = {"base": base, "blocks": blocks, "inserts": inserts, "coloured": coloured, "q": q}[stage]
        return f(g, data) if f else data
    return hook


def m_swap_cross(g, d):           # swap the targets of cross edges a=1 and a=2 in M1
    M0, M1, Mi, Mc = d
    Mc = list(Mc); (a1, t1), (a2, t2) = Mc[0], Mc[1]
    Mc[0], Mc[1] = R.norm((a1, t2), 6 * g + 1), R.norm((a2, t1), 6 * g + 1)
    return M0, Mi + Mc, Mi, Mc


def m_swap_M0(g, d):              # rewire two nested edges of M0 (swap two lengths' endpoints)
    M0, M1, Mi, Mc = d
    M0 = list(M0); (a, b), (c, e) = M0[0], M0[1]
    M0[0], M0[1] = R.norm((a, e), 6 * g + 1), R.norm((c, b), 6 * g + 1)
    return M0, M1, Mi, Mc


def m_swap_M0_cross(g, d):        # exchange partners of cross edge a=0 and a=5 in M0
    M0, M1, Mi, Mc = d
    M0 = list(M0); n = 6 * g + 1
    i0 = M0.index(R.norm((0, 3 * g + 6), n)); i5 = M0.index(R.norm((5, 3 * g + 1), n))
    M0[i0], M0[i5] = R.norm((0, 3 * g + 1), n), R.norm((5, 3 * g + 6), n)
    return M0, M1, Mi, Mc


def m_M1_is_M0_plus1(g, d):
    M0, M1, Mi, Mc = d
    return M0, R.translate(M0, 1, 6 * g + 1), Mi, Mc


def m_shift_block3(g, d):         # translate block 3 by +1
    B1, B2, B3 = d
    return B1, B2, [R.translate(F, 1, 6 * g + 1) for F in B3]


def m_block3_len1(g, d):          # block 3 := block 1 + 2 (length-1 edges)
    B1, B2, B3 = d
    return B1, B2, [R.translate(F, 2, 6 * g + 1) for F in B1]


def m_block2_eq_block1(g, d):
    B1, B2, B3 = d
    return B1, B1, B3


def m_block3_swap_lengths(g, d):  # in block 3 class 1, use length 5 on the 6-interval part (1st 3 edges -> rewired)
    B1, B2, B3 = d
    F = list(B3[0]); n = 6 * g + 1
    # {y,y+3},{y+1,y+4},{y+2,y+5} -> {y,y+5},{y+1,y+4},{y+2,y+3}: lengths 5,3,1
    y = 2
    F[0], F[2] = R.norm((y, y + 5), n), R.norm((y + 2, y + 3), n)
    return B1, B2, [F, B3[1], B3[2]]


def i_shift_point(g, ins):        # insert block 3 before colour 13 instead of 12
    ins = dict(ins); ins[13] = ins.pop(12); return ins


def i_swap_block3_classes(g, ins):  # F3_1 <-> F3_2 (structure checks already passed)
    ins = dict(ins); B = ins[12]; ins[12] = [B[1], B[0], B[2]]; return ins


def i_block_at_3(g, ins):         # block 2 moved from colour 6 to colour 3 (wrong vertex sets)
    ins = dict(ins); ins[3] = ins.pop(6); return ins


def c_swap_two_base_classes(g, d):  # swap colours of the classes in positions 7 and 8 (E_3 <-> E_4)
    col, p = d
    out = [(e, 8 if c == 7 else 7 if c == 8 else c) for e, c in col]
    return out, p


def c_drop_edge(g, d):            # drop one edge (count / bound must fail)
    col, p = d
    return col[:-1], p


def c_recolour_one(g, d):         # move one edge of colour 20 to colour 21
    col, p = d
    col = list(col)
    for i, (e, c) in enumerate(col):
        if c == 20:
            col[i] = (e, 21); break
    return col, p


def q4(g, q):
    return 4


MUTS = [
    ("M1 cross targets a=1,a=2 swapped", mk(base=m_swap_cross)),
    ("M1 cross targets a=1,a=2 swapped (claims check off)", mk(base=m_swap_cross, skip=True)),
    ("M0 two nested edges rewired", mk(base=m_swap_M0)),
    ("M0 two nested edges rewired (claims off)", mk(base=m_swap_M0, skip=True)),
    ("M0 cross partners of a=0,a=5 exchanged (claims off)", mk(base=m_swap_M0_cross, skip=True)),
    ("M1 := M0 + 1 (claims off)", mk(base=m_M1_is_M0_plus1, skip=True)),
    ("block 3 translated by +1", mk(blocks=m_shift_block3)),
    ("block 3 := block 1 + 2", mk(blocks=m_block3_len1)),
    ("block 2 := block 1", mk(blocks=m_block2_eq_block1)),
    ("block 3 class 1 rewired to lengths 5,3,1", mk(blocks=m_block3_swap_lengths)),
    ("block 3 translated by +1 (struct+claims off)", mk(blocks=m_shift_block3, skip=True)),
    ("block 3 := block 1 + 2 (struct+claims off)", mk(blocks=m_block3_len1, skip=True)),
    ("block 2 := block 1 (struct+claims off)", mk(blocks=m_block2_eq_block1, skip=True)),
    ("block 3 class 1 -> lengths 5,3,1 (struct+claims off)", mk(blocks=m_block3_swap_lengths, skip=True)),
    ("block 3 inserted before colour 13", mk(inserts=i_shift_point)),
    ("block 3 classes 1,2 swapped (after structure check)", mk(inserts=i_swap_block3_classes)),
    ("block 2 inserted before colour 3", mk(inserts=i_block_at_3)),
    ("two base classes swapped in final sequence", mk(coloured=c_swap_two_base_classes)),
    ("one edge dropped", mk(coloured=c_drop_edge)),
    ("one edge recoloured c -> c+1", mk(coloured=c_recolour_one)),
    ("(p,4)-check instead of (p,3)", mk(q=q4)),
]


def main():
    gs = list(range(15, 31))
    allok = True
    for name, hook in MUTS:
        msgs = set()
        for g in gs:
            try:
                R.check_theorem_A(g, allpairs=False, reps=R.all_reps(g)[:1], mutate=hook)
                msgs.add("ACCEPTED g=%d" % g); allok = False
            except R.Reject as ex:
                msgs.add(str(ex).split(":")[0].split(" =")[0][:50])
            except Exception as ex:   # crash also counts as a failure of the test harness
                msgs.add("CRASH %r" % ex); allok = False
        print("%-55s g=15..30: %s" % (name, "; ".join(sorted(msgs))))
    # certificate mutations
    certs = json.load(open(os.path.join(_HERE, "..", "certificates.json")))
    def cert_mut(name, f):
        nonlocal allok
        res = []
        for C in certs:
            D = copy.deepcopy(C); f(D)
            try:
                R.check_certificate(D, allpairs=False); res.append("ACCEPTED g=%d" % C["g"]); allok = False
            except R.Reject as ex:
                res.append(str(ex)[:40])
        print("%-55s g=6..14: %s" % (name, "; ".join(sorted(set(res)))))
    def f1(D):   # move one edge of block 1 class 1 into class 2
        e = D["blocks"][0][0].pop(); D["blocks"][0][1].append(e)
    def f2(D):   # swap two vertices between two M0 edges
        (a, b), (c, d) = D["M0"][0], D["M0"][1]; D["M0"][0], D["M0"][1] = [a, d], [c, b]
    def f3(D):   # shift second insertion colour by one
        D["block_colours"][1] += 1
    def f4(D):   # duplicate block 1 as block 2
        D["blocks"][1] = copy.deepcopy(D["blocks"][0])
    def f5(D):   # translate block 3 by +1
        n = D["n"]; D["blocks"][2] = [[[(x + 1) % n, (y + 1) % n] for x, y in F] for F in D["blocks"][2]]
    cert_mut("cert: edge moved block1 class1 -> class2", f1)
    cert_mut("cert: two M0 edges rewired", f2)
    cert_mut("cert: 2nd insertion colour +1", f3)
    cert_mut("cert: block 2 := block 1", f4)
    cert_mut("cert: block 3 translated by +1", f5)
    # sanity: unmutated still accepted
    for g in gs:
        R.check_theorem_A(g, reps=R.all_reps(g)[:1])
    print("ALL MUTATIONS REJECTED" if allok else "SOME MUTATION ACCEPTED")


if __name__ == "__main__":
    main()
