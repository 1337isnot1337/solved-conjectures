#!/usr/bin/env python3
"""Bounded exact counterexample search; a positive run is not a proof.

Input: McKay's graph8c.g6, https://users.cecs.anu.edu.au/~bdm/data/graph8c.g6
CC BY 4.0, Brendan McKay. Expected SHA-256:
0002354f1ab3344a2706626a037ad15367bf23a2163aa68f552c3a169ca9a036
"""
from concurrent.futures import ProcessPoolExecutor
from pathlib import Path
import argparse
import hashlib
import json
import time
from screen import Bond, validate


def decode6(line):
    raw = line.strip()
    if raw.startswith('>>graph6<<'):
        raw = raw[10:]
    n = ord(raw[0])-63
    assert 0 <= n <= 62
    bits = [(ord(c)-63 >> k) & 1 for c in raw[1:] for k in range(5,-1,-1)]
    assert len(bits) >= n*(n-1)//2
    edges=[]
    p=0
    for j in range(n):
        for i in range(j):
            if bits[p]:
                edges.append((i,j))
            p += 1
    return n,edges


def work(item):
    index,line=item
    n,edges=decode6(line)
    graph=Bond(n,edges)
    assert graph.conn[-1]
    failure=graph.check()
    return {'index':index,'g6':line,'n':n,'edges':edges,'failure':failure}


def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('corpus',type=Path)
    ap.add_argument('--workers',type=int,default=2)
    ap.add_argument('--limit',type=int)
    args=ap.parse_args()
    validate()
    assert decode6('A_') == (2,[(0,1)])
    data=args.corpus.read_bytes()
    lines=data.decode().splitlines()
    assert len(lines)==len(set(lines))
    if args.limit:
        lines=lines[:args.limit]
    start=time.time()
    print(json.dumps({'source':str(args.corpus),'sha256':hashlib.sha256(data).hexdigest(),
                      'input_count':len(lines),'workers':args.workers}),flush=True)
    with ProcessPoolExecutor(max_workers=args.workers) as pool:
        for count,row in enumerate(pool.map(work,enumerate(lines),chunksize=25),1):
            if row['failure']:
                print(json.dumps({'negative':row,'checked':count,'seconds':time.time()-start}),flush=True)
                return
            if count%250==0:
                print(json.dumps({'checked':count,'seconds':round(time.time()-start,3)}),flush=True)
    print(json.dumps({'completed':len(lines),'negative':False,'seconds':round(time.time()-start,3)}),flush=True)


if __name__=='__main__':
    main()
