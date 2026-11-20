from itertools import permutations
labels=range(6)
N={a:set(labels)-{a,a^1} for a in labels}

def patterns(L):
    edges=[];a=b=0
    for i in range(L):
        if i:
            if i%2:b+=1
            else:a+=1
        edges.append((a,b))
    return edges,a+1,b+1
for L in range(3,12):
    edges,na,nb=patterns(L)
    count=0; witness=None
    for aa in permutations(labels,na):
        if aa[0]!=0:continue
        if any(aa[i+1] not in N[aa[i]] for i in range(na-1) if i>0 or i+1<na-1):continue
        for bb in permutations(labels,nb):
            if any(bb[i+1] not in N[bb[i]] for i in range(nb-1) if i>0 or i+1<nb-1):continue
            if any(bb[j] not in N[aa[i]] for i,j in edges):continue
            if any(set([aa[i-1],aa[i+1]]+[bb[j] for r,j in edges if r==i])!=N[aa[i]] for i in range(1,na-1)):continue
            if any(set([bb[j-1],bb[j+1]]+[aa[i] for i,c in edges if c==j])!=N[bb[j]] for j in range(1,nb-1)):continue
            count+=1
            if witness is None:witness=(aa,bb,edges)
    print(L,count,witness,flush=True)
