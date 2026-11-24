"""Exact, offline certificates for three finite quadratic-fold constructions.

No optimality or asymptotic claim is inferred from these witnesses.
Registers 0 and 1 are the only inputs: the integer 1 and the variable x.
Every remaining register uses one of +, -, * on two earlier registers.
"""
from functools import lru_cache
from pathlib import Path
import json


WITNESSES = {
    8: [(0,7),(0,2),(0,1),(0,3)],
    16: [(0,15),(0,5),(1,6),(0,4),(0,2),(0,1)],
    32: [(0,31),(1,14),(1,4),(0,3),(7,12),(2,7),
         (2,6),(1,9),(0,2),(5,13),(1,5),(0,1)],
}

EXPECTED_SIZES = {
    8: [8,4,3,2,1],
    16: [16,8,6,4,3,2,1],
    32: [32,16,13,10,9,8,7,6,5,4,3,2,1],
}


def compile_witness(N,pairs):
    gates=[]

    def gate(op,a,b):
        idx=len(gates)+2
        assert op in ("+","-","*") and 0<=a<idx and 0<=b<idx
        gates.append([op,a,b])
        return idx

    zero=gate("-",0,0)
    constants={0:zero,1:0}

    def integer(a):
        assert 0<=a<N
        if a in constants:
            return constants[a]
        q=integer(a//2)
        q=gate("+",q,q)
        if a%2:
            q=gate("+",q,0)
        constants[a]=q
        return q

    centres=[]

    @lru_cache(None)
    def constant_value(j,a):
        if j==0:
            return integer(a)
        q=constant_value(j-1,a)
        q=gate("+",q,q)
        q=gate("-",q,centres[j-1])
        return gate("*",q,q)

    variable=gate("-",1,0)  # Shift the prescribed roots to 1,...,N.
    prefixes=[variable]
    for j,(a,b) in enumerate(pairs,1):
        centre=gate("+",constant_value(j-1,a),constant_value(j-1,b))
        centres.append(centre)
        variable=gate("+",variable,variable)
        variable=gate("-",variable,centre)
        variable=gate("*",variable,variable)
        prefixes.append(variable)
    output=gate("-",variable,constant_value(len(pairs),0))
    return dict(N=N,pairs=pairs,depth=len(pairs),degree=2**len(pairs),
                gates=gates,output=output,prefix_registers=prefixes)


def verify_certificate(cert):
    N=cert["N"]
    values=[[1]*N,list(range(1,N+1))]
    # Exact degree and leading coefficient suffice for these certificates:
    # the only variable additions are doubling or subtracting a constant.
    # Reject a cancellation which would require lower coefficient data.
    leading=[(0,1),(1,1)]
    for op,a,b in cert["gates"]:
        assert 0<=a<len(values) and 0<=b<len(values)
        da,ca=leading[a]
        db,cb=leading[b]
        if op=="+":
            result=[u+v for u,v in zip(values[a],values[b])]
        elif op=="-":
            result=[u-v for u,v in zip(values[a],values[b])]
        elif op=="*":
            result=[u*v for u,v in zip(values[a],values[b])]
        else:
            raise AssertionError("Unexpected operation")
        values.append(result)
        if op=="*":
            term=(da+db,ca*cb) if ca and cb else (0,0)
        else:
            sign=1 if op=="+" else -1
            if da>db:
                term=(da,ca)
            elif db>da:
                term=(db,sign*cb)
            else:
                term=(da,ca+sign*cb)
                assert term[1] or da==0, "Unresolved leading-term cancellation"
        leading.append(term)
    assert values[cert["output"]]==[0]*N
    assert leading[cert["output"]][0]==cert["degree"]==2**cert["depth"]
    assert leading[cert["output"]][1]!=0
    sizes=[len(set(values[i])) for i in cert["prefix_registers"]]
    assert sizes==EXPECTED_SIZES[N]
    d=cert["depth"]
    L=(N-1).bit_length()
    bound=3*d*d+4*d+4*d*L+3
    assert len(cert["gates"])<=bound
    return dict(N=N,depth=d,degree=cert["degree"],gates=len(cert["gates"]),
                compilation_bound=bound,image_sizes=sizes,
                all_prescribed_integer_roots_verified=True)


def check_all():
    certificates=json.loads(Path(__file__).with_name("fold_certificates.json").read_text())
    generated=[compile_witness(N,pairs) for N,pairs in WITNESSES.items()]
    # JSON turns tuple pairs into lists; compare their canonical serializations.
    assert json.dumps(certificates,sort_keys=True)==json.dumps(generated,sort_keys=True)
    summaries=[verify_certificate(cert) for cert in certificates]
    return summaries


if __name__=="__main__":
    summaries=check_all()
    print(json.dumps(summaries,indent=2))
