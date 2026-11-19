"""Finite proof for arbitrary placements within four consecutive cyclic sites."""
from itertools import combinations
from pathlib import Path
import subprocess
import tempfile
import numpy as np
from scipy.sparse import coo_matrix
from scipy.sparse.csgraph import connected_components

ROOT=Path(__file__).resolve().parent
TILES=(7,11,13,15)
# Three triples with the same origin have a common point. Two in a four-set generate it.
LETTERS=[a for a in range(16) if (a&7).bit_count()<=2 and not (a&8 and (a&7).bit_count()>=2)]


def generators(word):
    return [g<<p for p,a in enumerate(word) for j,g in enumerate(TILES) if a>>j&1]


def possible(word):
    rows=generators(word)
    triples=[s for s in rows if s.bit_count()==3]
    once=twice=0
    for s in triples:
        if twice&s:
            return False
        twice|=once&s
        once|=s
    return all(sum(h&s==h for h in triples)<2 for s in rows if s.bit_count()==4)


def pair_survives(word):
    rows=generators(word)
    for j,g in enumerate(TILES):
        if not word[3]>>j&1:
            continue
        s=g<<3
        points=[1<<i for i in range(3,7) if s>>i&1]
        neighbors=[h for h in rows if h&s]
        if any(all(h&(a|b) for h in neighbors) for a,b in combinations(points,2)):
            return False
    return True


def recurrent(words):
    vertices={v:i for i,v in enumerate(sorted({v for w in words for v in (w[:-1],w[1:])}))}
    edges=[(vertices[w[:-1]],vertices[w[1:]]) for w in words]
    a,b=zip(*edges)
    adj=coo_matrix((np.ones(len(edges),dtype=bool),(a,b)),shape=(len(vertices),)*2).tocsr()
    _,label=connected_components(adj,directed=True,connection='strong')
    return [w for w,(i,j) in zip(words,edges) if label[i]==label[j]]


def extend(words):
    after={}
    for w in words:
        after.setdefault(w[:-1],[]).append(w[-1])
    return [w+(a,) for w in words for a in after.get(w[1:],[])]


def filter_windows(words,width,finder,replay):
    source=''.join(' '.join(map(str,w))+'\n' for w in words)
    run=subprocess.run([finder,str(width)],input=source,text=True,capture_output=True,check=True)
    lines=run.stdout.splitlines()
    assert len(lines)==len(words)
    certificates=[]
    remaining=[]
    for word,line in zip(words,lines):
        key,sep,_=line.partition(':')
        assert tuple(map(int,key.split()))==word
        if sep:
            certificates.append(line)
        else:
            remaining.append(word)
    result=subprocess.run([replay,str(width)],input='\n'.join(certificates)+'\n' if certificates else '',
                          text=True,capture_output=True,check=True)
    assert int(result.stdout)==len(certificates)
    return remaining


def main():
    words=[()]
    for _ in range(6):
        words=[w+(a,) for w in words for a in LETTERS if possible(w+(a,))]
    print('six-letter states',len(words),flush=True)
    state_set=set(words)
    edges=[w+(a,) for w in words for a in LETTERS if w[1:]+(a,) in state_set and pair_survives(w+(a,))]
    words=recurrent(edges)
    print('pair test edges',len(edges),'recurrent',len(words),flush=True)
    with tempfile.TemporaryDirectory(prefix='frankl-span-four-') as temp:
        finder=Path(temp)/'finder'
        replay=Path(temp)/'replay'
        for source,target in [('window_filter.cpp',finder),('window_replay.cpp',replay)]:
            subprocess.run(['c++','-O3','-std=c++20',str(ROOT/source),'-o',target],check=True)
        for width in (4,5):
            left=filter_windows(words,width,finder,replay)
            cycles=recurrent(left)
            print('window',width,'examined',len(words),'replayed',len(words)-len(left),
                  'remaining',len(left),'recurrent',len(cycles),flush=True)
            words=extend(cycles)
        assert cycles==[(0,)*8]
    print('only the empty schedule survives')


if __name__=='__main__':
    main()
