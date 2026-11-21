#!/usr/bin/env python3
"""Exact coset construction; MILP only proposes candidates, independently checked.

A negative bounded computation is not a proof of Sun's full conjecture.
"""
import argparse
import itertools
import json
import math
import time
from pathlib import Path

import numpy as np
from scipy.optimize import Bounds, LinearConstraint, milp
from scipy.sparse import csc_array


def permutation_group(degree, alternating=True):
    elements = [p for p in itertools.permutations(range(degree))
                if not alternating or sum(p[i] > p[j] for i in range(degree)
                                           for j in range(i+1, degree)) % 2 == 0]
    lookup = {p:i for i,p in enumerate(elements)}
    table = np.array([[lookup[tuple(p[q[j]] for j in range(degree))]
                       for q in elements] for p in elements], dtype=np.int32)
    return elements, table


def all_subgroups(table):
    order = len(table)
    multiplication = table.tolist()
    known = {frozenset([0]): ()}
    pending = [frozenset([0])]
    for H in pending:
        generators = known[H]
        # <H,hg>=<H,g> for h in H, so one right-coset representative suffices.
        extension_seen = set(H)
        for g in range(order):
            if g in extension_seen:
                continue
            extension_seen.update(multiplication[h][g] for h in H)
            gs = generators + (g,)
            subgroup = {0}
            queue = [0]
            for h in queue:
                for x in gs:
                    y = multiplication[h][x]
                    if y not in subgroup:
                        subgroup.add(y)
                        queue.append(y)
            K = frozenset(subgroup)
            if K not in known:
                known[K] = gs
                pending.append(K)
    return [(tuple(sorted(H)), known[H]) for H in pending]


def all_cosets(table, subgroups):
    order = len(table)
    cosets = []
    for si, (H, generators) in enumerate(subgroups):
        if len(H) == order:
            continue
        used = set()
        for g in range(order):
            if g in used:
                continue
            C = tuple(sorted(int(table[g,h]) for h in H))
            used.update(C)
            cosets.append(dict(subgroup=si, representative=g,
                               index=order//len(H), elements=C))
    return cosets


def independent_check(table, subgroups, cosets, chosen, D):
    seen = set()
    indices = []
    for i in chosen:
        row = cosets[i]
        H = subgroups[row['subgroup']][0]
        assert 0 in H
        Hset = set(H)
        assert all(int(table[x,y]) in Hset for x in H for y in H)
        C = {int(table[row['representative'],h]) for h in H}
        assert C == set(row['elements'])
        assert not seen.intersection(C)
        seen.update(C)
        assert len(table) == row['index']*len(H)
        indices.append(row['index'])
    assert all(math.gcd(a,b) <= D for a,b in itertools.combinations(indices,2))
    return dict(cosets=len(chosen), covered=len(seen), indices=indices,
                max_pair_gcd=max((math.gcd(a,b) for a,b in itertools.combinations(indices,2)),
                                 default=0), full_counterexample=len(chosen)>D)


def solve(table, subgroups, cosets, D, seconds, presolve=False, threads=1):
    nv = len(cosets)
    by_index = {}
    rows = [[] for _ in table]
    bounds = [1.0]*len(table)
    for i,row in enumerate(cosets):
        by_index.setdefault(row['index'], []).append(i)
        for g in row['elements']:
            rows[g].append(i)
    large = [d for d in by_index if d>D]
    for d in large:
        rows.append(by_index[d])
        bounds.append(1.0)
    for a,b in itertools.combinations(large,2):
        if math.gcd(a,b)>D:
            rows.append(by_index[a]+by_index[b])
            bounds.append(1.0)
    ris = []
    cis = []
    for ri,row in enumerate(rows):
        ris.extend([ri]*len(row))
        cis.extend(row)
    matrix = csc_array((np.ones(len(ris)), (np.array(ris,dtype=np.int32),
                                           np.array(cis,dtype=np.int32))),
                        shape=(len(rows),nv))
    t0=time.time()
    options={'time_limit':seconds,'mip_rel_gap':0.0,'presolve':presolve}
    if threads:
        options['threads']=threads
    result=milp(-np.ones(nv), integrality=np.ones(nv),
                bounds=Bounds(np.zeros(nv),np.ones(nv)),
                constraints=LinearConstraint(matrix, -np.inf, np.array(bounds)),
                options=options)
    chosen=[] if result.x is None else [i for i,x in enumerate(result.x) if x>0.5]
    checked=independent_check(table,subgroups,cosets,chosen,D)
    return dict(threshold=D, target=D+1, elapsed=time.time()-t0,
                solver_options=options,
                solver_status=int(result.status), solver_message=result.message,
                solver_dual_bound=None if getattr(result,'mip_dual_bound',None) is None
                else -float(result.mip_dual_bound), selected=chosen, check=checked)


def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('--degree',type=int,default=5)
    ap.add_argument('--symmetric',action='store_true')
    ap.add_argument('--thresholds',default='6')
    ap.add_argument('--seconds',type=float,default=30)
    ap.add_argument('--presolve',action='store_true')
    ap.add_argument('--threads',type=int,default=1)
    ap.add_argument('--output',required=True)
    args=ap.parse_args()
    elements,table=permutation_group(args.degree, not args.symmetric)
    subgroups=all_subgroups(table)
    cosets=all_cosets(table,subgroups)
    data=dict(group=('S' if args.symmetric else 'A')+str(args.degree),
              order=len(table), subgroup_count=len(subgroups), coset_count=len(cosets),
              index_counts={str(d):sum(c['index']==d for c in cosets)
                            for d in sorted(set(c['index'] for c in cosets))},
              group_elements=elements, subgroups=subgroups, cosets=cosets, runs=[])
    print(json.dumps({k:data[k] for k in ['group','order','subgroup_count','coset_count','index_counts']}),flush=True)
    Path(args.output).write_text(json.dumps(data,indent=2))
    for D in map(int,args.thresholds.split(',')):
        print(json.dumps({'starting_threshold':D,'seconds':args.seconds}),flush=True)
        run=solve(table,subgroups,cosets,D,args.seconds,args.presolve,args.threads)
        data['runs'].append(run)
        Path(args.output).write_text(json.dumps(data,indent=2))
        print(json.dumps(run),flush=True)
        if run['check']['full_counterexample']:
            break


if __name__=='__main__':
    main()
