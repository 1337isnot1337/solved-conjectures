from math import prod

TYPES = [
    {'A1':24}, {'A2':12}, {'A3':8}, {'A4':6}, {'A5':4,'D4':1},
    {'A6':4}, {'A7':2,'D5':2}, {'A8':3}, {'A9':2,'D6':1},
    {'A11':1,'D7':1,'E6':1}, {'A12':2}, {'A15':1,'D9':1},
    {'A17':1,'E7':1}, {'A24':1}, {'D4':6}, {'D6':4}, {'D8':3},
    {'D10':1,'E7':2}, {'D12':2}, {'D16':1,'E8':1}, {'D24':1},
    {'E6':4}, {'E8':3},
]
SCALE = 10**5

def marks(key):
    n=int(key[1:])
    if key[0]=='A': return [1]*(n+1)
    if key[0]=='D': return [1]*4+[2]*(n-3)
    return {6:[1,1,1,2,2,2,3],7:[1,1,2,2,2,3,3,4],
            8:[1,2,2,3,3,4,4,5,6]}[n]

def component_lower(key):
    a=marks(key)
    h=sum(a)
    P=prod(x**x for x in a)
    lo,hi=0,h*SCALE+1
    while hi-lo>1:
        mid=(hi+lo)//2
        if mid**h*P <= (h*SCALE)**h:
            lo=mid
        else:
            hi=mid
    return lo

def type_bounds(r):
    lo=sum(m*component_lower(t) for t,m in r.items())
    return lo,lo+sum(r.values())

def main():
    best_hi=type_bounds({'E8':3})[1]
    assert len(TYPES)==23
    for r in TYPES:
        assert sum(int(t[1:])*m for t,m in r.items())==24
        assert len({sum(marks(t)) for t in r})==1
        lo,hi=type_bounds(r)
        print(r, lo, hi)
        assert r=={'E8':3} or lo>best_hi
    assert 16*3**48 < 5**35

if __name__=='__main__':
    main()
