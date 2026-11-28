"""Cross-check interlacement, typed savings, and Hall tallies on small fixtures."""
from itertools import product
from random import Random

def rank(columns):
    base={}
    for x in columns:
        while x and x.bit_length() in base:
            x ^= base[x.bit_length()]
        if x:
            base[x.bit_length()]=x
    return len(base)

def interlace(word,k):
    pos=[[i for i,x in enumerate(word) if x==a] for a in range(k)]
    return [sum(1<<b for b,(p,q) in enumerate(pos) if
                b!=a and ((lo<p<hi) != (lo<q<hi))) for a,(lo,hi) in enumerate(pos)]

def num_components(word,bits):
    W=[x for x in word if bits[x]>=0]
    if not W:
        return 1
    p=list(range(len(W)))
    def root(i):
        while i!=p[i]:
            i=p[i]
        return i
    def union(a,b):
        p[root(a)]=root(b)
    for x in set(W):
        i,j=[z for z,y in enumerate(W) if y==x]
        if bits[x]:
            union(i-1,j-1)
            union(i,j)
        else:
            union(i-1,j)
            union(i,j-1)
    return len({root(i) for i in range(len(W))})

def check_shortcuts(rng):
    checked=0
    for k in range(1,7):
        for case in range(40):
            word=list(range(k))*2
            rng.shuffle(word)
            mat=interlace(word,k)
            allowed=[rng.choice([(0,), (1,), (0,1)]) for _ in range(k)]
            weight=[(rng.randrange(12),rng.randrange(12)) for _ in range(k)]
            best_independent=best_cycle=0
            for bits in product(*(tuple([-1])+a for a in allowed)):
                S=[i for i,b in enumerate(bits) if b>=0]
                mask=sum(1<<i for i in S)
                cols=[mat[i]+(bits[i]<<i) for i in S]
                components=num_components(word,bits)
                assert components==1+len(S)-rank([c&mask for c in cols])
                score=sum(weight[i][bits[i]] for i in S)
                if rank(cols)==len(S):
                    best_independent=max(best_independent,score)
                if components==1:
                    best_cycle=max(best_cycle,score)
                checked+=1
            assert best_independent==best_cycle
    return checked

def subsets(S):
    S=list(S)
    for bits in product((0,1),repeat=len(S)):
        yield [i for b,i in zip(bits,S) if b]

def check_hall(rng):
    for _ in range(200):
        k=rng.randrange(1,7)
        neighbors=[{j for j in range(k) if rng.randrange(3)==0} for i in range(k)]
        w=[rng.randrange(1,8) for i in range(k)]
        def best(i,used):
            if i==k:
                return 0
            return max([best(i+1,used)]+[w[i]+best(i+1,used|{x})
                       for x in neighbors[i]-used])
        deficit=0
        for j in range(1,max(w)+1):
            I=[i for i in range(k) if w[i]>=j]
            deficit+=max(len(F)-len(set().union(*(neighbors[i] for i in F)))
                         for F in subsets(I))
        assert sum(w)-best(0,set())==deficit

if __name__=='__main__':
    rng=Random(642)
    n=check_shortcuts(rng)
    check_hall(rng)
    print(f'{n} typed shortcut states and 200 midpoint incidence systems checked')
