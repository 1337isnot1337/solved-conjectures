#!/usr/bin/env python3
"""Test one exact candidate index tuple, rather than enlarge a bounded scan."""
import json
import sys
import time
from pathlib import Path

import numpy as np
from scipy.optimize import Bounds, LinearConstraint, milp
from scipy.sparse import csc_array

from search_cosets import independent_check, permutation_group

folder=Path(__file__).resolve().parent
data=json.loads((folder/'a6-search.json').read_text())
elements,table=permutation_group(6)
assert elements==[tuple(p) for p in data['group_elements']]
subgroups=data['subgroups']
cosets=data['cosets']
indices={s:len(table)//len(H) for s,(H,gens) in enumerate(subgroups)}
lookup={tuple(H):s for s,(H,gens) in enumerate(subgroups)}
inverses=[int(np.flatnonzero(table[g]==0)[0]) for g in range(len(table))]
remaining={s for s,n in indices.items() if n==20}
reps=[]
while remaining:
    s=min(remaining)
    reps.append(s)
    H=subgroups[s][0]
    conjugates={lookup[tuple(sorted(int(table[table[g,h],inverses[g]]) for h in H))]
                for g in range(len(table))}
    remaining.difference_update(conjugates)
print(json.dumps({'index20_subgroups':sum(n==20 for n in indices.values()),
                  'conjugacy_class_representatives':reps}),flush=True)
output=[]
for si in reps:
    seed=next(i for i,c in enumerate(cosets) if c['subgroup']==si and c['representative']==0)
    seedset=set(cosets[seed]['elements'])
    required={15:13,30:1,45:1}
    selected_indices=[i for i,c in enumerate(cosets)
                      if c['index'] in required and not seedset.intersection(c['elements'])]
    rows=[[] for _ in table]
    lower=[-np.inf]*len(table)
    upper=[1.0]*len(table)
    for j,i in enumerate(selected_indices):
        for g in cosets[i]['elements']:
            rows[g].append(j)
    for n,count in required.items():
        rows.append([j for j,i in enumerate(selected_indices) if cosets[i]['index']==n])
        lower.append(float(count));upper.append(float(count))
    ri=[];ci=[]
    for r,row in enumerate(rows):
        ri.extend([r]*len(row));ci.extend(row)
    mat=csc_array((np.ones(len(ri)),(np.array(ri,dtype=np.int32),np.array(ci,dtype=np.int32))),
                  shape=(len(rows),len(selected_indices)))
    print(json.dumps({'seed_subgroup':si,'candidate_cosets':len(selected_indices),
                      'index_counts':{n:sum(cosets[i]['index']==n for i in selected_indices)
                                      for n in required}}),flush=True)
    start=time.time()
    result=milp(np.zeros(len(selected_indices)),integrality=np.ones(len(selected_indices)),
                bounds=Bounds(np.zeros(len(selected_indices)),np.ones(len(selected_indices))),
                constraints=LinearConstraint(mat,np.array(lower),np.array(upper)),
                options={'time_limit':25.0,'presolve':True,'threads':1})
    chosen=[] if result.x is None else [seed]+[selected_indices[j] for j,x in enumerate(result.x) if x>.5]
    check=None if not chosen else independent_check(table,subgroups,cosets,chosen,15)
    row={'seed_subgroup':si,'status':int(result.status),'message':result.message,
         'elapsed':time.time()-start,'selected':chosen,'check':check}
    output.append(row)
    print(json.dumps(row),flush=True)
    (folder/'a6-target-tuple.json').write_text(json.dumps({'tuple':[15]*13+[20,30,45],'runs':output},indent=2))
