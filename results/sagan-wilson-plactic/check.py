"""Diagnostic checks: independent row insertion and state-path implementation."""
from bisect import bisect_right
from itertools import combinations
from random import Random

def insertion(w):
    rows=[]
    for a in w:
        for row in rows:
            i=bisect_right(row,a)
            if i==len(row):
                row.append(a);break
            row[i],a=a,row[i]
        else: rows.append([a])
    return rows

def build(n,d):
    states=list(combinations(range(1,n+1),d))
    le=lambda a,b: all(x<=y for x,y in zip(a,b))
    intervals={(i,j):tuple(k for k,h in enumerate(states) if le(s,h) and le(h,t))
        for i,s in enumerate(states) for j,t in enumerate(states) if le(s,t)}
    letters={key:set().union(*(states[k] for k in H)) for key,H in intervals.items()}
    return states,intervals,letters

def product(A,B,intervals):
    return {(i,j):max(A[i,k]+B[k,j] for k in H) for (i,j),H in intervals.items()}

def wordmat(w,intervals,letters):
    A=dict.fromkeys(intervals,0)
    for x in w:A=product(A,{k:int(x in a) for k,a in letters.items()},intervals)
    return A

def run():
    rng=Random(43471)
    cases=0
    for n in range(2,6):
        blocks=[build(n,d) for d in range(1,n)]
        for _ in range(70):
            m=rng.randrange(1,n+1)
            u=[rng.randint(1,m) for _ in range(rng.randint(1,9))]
            w=[rng.randint(1,n) for _ in range(rng.randint(0,9))]
            m=max(u);K=m*(m+1)//2+2
            kk=range(1,K+4)
            direct={k:insertion(u*k+w)==insertion(w+u*k) for k in kk}
            tropical=dict.fromkeys(kk,True)
            for states,H,letters in blocks:
                X=wordmat(u,H,letters);Y=wordmat(w,H,letters)
                A=dict.fromkeys(H,0); prior=None
                for k in kk:
                    A=product(A,X,H)
                    tropical[k]&=product(A,Y,H)==product(Y,A,H)
                    if k>K:
                        assert all(A[i,j]==prior[i,j]+max(X[h,h] for h in mid)
                            for (i,j),mid in H.items())
                    prior=A
            assert tropical==direct,(u,w,direct,tropical)
            assert all(direct[k]==direct[K] for k in kk if k>=K)
            if any(direct.values()):assert direct[K]
            cases+=1
    print(f'PASS: {cases} word pairs, with independent algorithms and affine-power checks')

if __name__=='__main__':run()
