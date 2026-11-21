"""Exact counterexample screen for Cavey--Lee; finite passes prove no conjecture."""
import argparse
import json
import subprocess
import time
from pathlib import Path

HERE = Path(__file__).resolve().parent

def partitions(n, maximum=None):
    if n == 0:
        yield ()
    else:
        for k in range(min(n, maximum or n), 0, -1):
            for rest in partitions(n-k, k):
                yield (k,) + rest

def divide_linear(poly, i, j):
    work = dict(poly)
    quotient = {}
    for d in range(max(k[2] for k in work), 0, -1):
        layer = [(a,b,c) for (a,b,e),c in work.items() if e == d and c]
        for a,b,c in layer:
            quotient[a,b,d-1] = c
            del work[a,b,d]
            key = a+i,b+j,d-1
            work[key] = work.get(key,0) - c
    return {k:c for k,c in quotient.items() if c}, {k:c for k,c in work.items() if c}

def analyze(lam, timeout):
    start=time.monotonic()
    proc=subprocess.run([str(HERE/'cavey_lee_enumerate'),*map(str,lam)],
                        capture_output=True,text=True,check=True,timeout=timeout)
    terms=[tuple(map(int,l.split())) for l in proc.stdout.splitlines()]
    poly={(a,b,d):c for a,b,d,c in terms}
    assert poly == {(b,a,d):c for (a,b,d),c in poly.items()}, ('symmetry',lam)
    rank=sum(x>=i+1 for i,x in enumerate(lam))
    quotient=poly
    for i in range(rank):
        for j in range(rank-i):
            quotient,remainder=divide_linear(quotient,i,j)
            if remainder:
                return dict(partition=lam,status='nondivisibility',factor=[i,j],
                            remainder=[[*k,c] for k,c in remainder.items()],
                            polynomial=[[*k,c] for k,c in poly.items()])
    negative=[[*k,c] for k,c in quotient.items() if c<0]
    result=dict(partition=lam,status='negative' if negative else 'pass',
                rank=rank,tilings=sum(poly.values()),monomials=len(poly),
                quotient_monomials=len(quotient),seconds=time.monotonic()-start)
    if negative:
        result.update(negative=negative,polynomial=[[*k,c] for k,c in poly.items()],
                      quotient=[[*k,c] for k,c in quotient.items()])
    return result

if __name__ == '__main__':
    ap=argparse.ArgumentParser()
    ap.add_argument('--min-n',type=int,default=10)
    ap.add_argument('--max-n',type=int,default=14)
    ap.add_argument('--min-rank',type=int,default=2)
    ap.add_argument('--timeout',type=float,default=10)
    ap.add_argument('--output',default=str(HERE/'cavey_lee_screen.json'))
    args=ap.parse_args()
    out=[]
    for n in range(args.min_n,args.max_n+1):
        for lam in partitions(n):
            rank=sum(x>=i+1 for i,x in enumerate(lam))
            if rank<args.min_rank: continue
            try:
                result=analyze(lam,args.timeout)
            except subprocess.TimeoutExpired:
                result=dict(partition=lam,status='timeout')
            out.append(result)
            print(json.dumps(result if result['status'] in ('pass','timeout')
                             else {k:v for k,v in result.items() if k not in ('polynomial','quotient')}),flush=True)
            Path(args.output).write_text(json.dumps(out,indent=2)+'\n')
            if result['status'] not in ('pass','timeout'): raise SystemExit(1)
