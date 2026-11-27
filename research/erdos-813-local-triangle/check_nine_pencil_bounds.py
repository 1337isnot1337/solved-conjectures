#!/usr/bin/env python3
"""Exact label-subset bound for the two concurrent-core diamonds."""
from functools import cache
from itertools import combinations

u,v,w,a,b,c,d = range(7)
required = {(u,a),(u,b),(v,a),(v,b),(a,b),
            (u,c),(u,d),(w,c),(w,d),(c,d),(v,w)}
incident = required | {(u,v),(u,w)}
neighbor = [{j for j in range(7) if (i,j) in incident or (j,i) in incident}
            for i in range(7)]


@cache
def completions(s):
    if len(s)==7:
        return 0
    moves = [4-min(2,len(s&neighbor[i]))+completions(s|{i})
             for i in range(7) if i not in s]
    for x,y,z,t in ((u,v,a,b),(u,w,c,d)):
        if {x,y}<=s:
            missing = {z,t}-s
            if missing:
                moves.append((1 if len(missing)==1 else 3)+completions(s|missing))
        if {z,t}<=s and x not in s and y not in s:
            moves.append(3+completions(s|{x,y}))
        missing = {x,y,z}-s
        if len(missing)==1:
            moves.append((1 if t in s else 2)+completions(s|missing))
    return min(moves)


if __name__ == "__main__":
    c = [max(completions(frozenset(s)) for s in combinations(range(7),r))
         for r in range(1,8)]
    assert c == [11,8,6,5,3,1,0]
    assert [c[r-1]+2*r-12 for r in range(3,8)] == [0,1,1,1,2]
    assert all(c[r-1]-15+2*r<0 for r in range(1,8))
    print("completion exponents",c)
