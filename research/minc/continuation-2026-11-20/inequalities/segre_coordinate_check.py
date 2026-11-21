#!/usr/bin/env python3
"""Exact Segre-cubic coordinates for the six exceptional S5 sign lines."""

from collections import defaultdict
from itertools import combinations
import json
from pathlib import Path

import f20_transfer_check as f
from one_vector_transfer_check import exceptional_groups


def main():
    triples=tuple(combinations(range(6),3))
    index={I:i for i,I in enumerate(triples)}
    groups=exceptional_groups()
    vectors=[]
    for H in groups:
        S=[[0]*20 for _ in range(20)]
        for p in H:
            for i,I in enumerate(triples):
                j=index[tuple(sorted(p[t] for t in I))]
                S[j][i]+=f.sign(p)
        v=[]
        for row in S:
            assert row[0] in (-6,6)
            v.append(row[0]//6)
        assert all(S[i][j]==6*v[i]*v[j] for i in range(20) for j in range(20))
        vectors.append(v)
    for k in range(1,6):
        inner=sum(x*y for x,y in zip(vectors[0],vectors[k]))
        assert inner in (-4,4)
        vectors[k]=[x*(-inner//4) for x in vectors[k]]
    G=[[sum(x*y for x,y in zip(v,w)) for w in vectors] for v in vectors]
    assert all(G[i][j]==(20 if i==j else -4) for i in range(6) for j in range(6))
    assert all(sum(v[j] for v in vectors)==0 for j in range(20))
    # p_k(z)=sum_I vectors[k][I] prod_(i in I) z_i.
    # Verify the cubic as a literal integer polynomial identity.
    exponents=[tuple(int(i in I) for i in range(6)) for I in triples]
    cubic=defaultdict(int)
    for v in vectors:
        for i,a in enumerate(exponents):
            for j,b in enumerate(exponents):
                ab=tuple(x+y for x,y in zip(a,b))
                for k,c in enumerate(exponents):
                    abc=tuple(x+y for x,y in zip(ab,c))
                    cubic[abc]+=v[i]*v[j]*v[k]
    assert all(c==0 for c in cubic.values())
    out={"status":"auxiliary invariant identities, no full MINC resolution",
         "triples":triples,"six_coordinate_vectors":vectors,
         "coefficient_Gram":G,
         "normalization":"f_(H_i,sign)(W*W)=6|p_i(W)|^2; sum_i f_i=trace C_(3,3)",
         "identities":"sum p_i=0 and sum p_i^3=0",
         "checks":"all integer projector and polynomial identities passed"}
    Path(__file__).with_name("segre_coordinate_certificate.json").write_text(json.dumps(out,indent=2)+"\n")
    print(json.dumps({k:out[k] for k in ("normalization","identities","checks")},indent=2))


if __name__=="__main__":
    main()
