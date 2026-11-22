# Independent checker: verifies each (p,q)-edge-colouring of K_n - F from colourings.json
import json, sys, itertools
from fractions import Fraction
import networkx as nx
d = json.load(open(sys.argv[1]))
types = {'K3':nx.complete_graph(3),'P4':nx.path_graph(4),'K13':nx.star_graph(3),
         'P3+K2':nx.disjoint_union(nx.path_graph(3),nx.path_graph(2)),'3K2':nx.disjoint_union_all([nx.path_graph(2)]*3),
         'P3':nx.path_graph(3),'2K2':nx.disjoint_union(nx.path_graph(2),nx.path_graph(2)),'K2':nx.path_graph(2)}
for c in d:
    n,F,p,q=c['n'],c['F'],c['p'],c['q']
    G=nx.complete_graph(n); G.remove_edges_from([tuple(e) for e in F])
    Fg=nx.Graph([tuple(e) for e in F])
    assert Fg.number_of_edges()==len(F)
    tname=[k for k,H in types.items() if nx.is_isomorphic(Fg,H)]
    if not tname: tname=['other(%d edges, %s)'%(len(F),sorted(dict(Fg.degree()).values()))]
    col={}
    for e,x in zip(c['edges'],c['colour']):
        k=frozenset(e); assert len(k)==2 and k not in col; col[k]=x
    assert set(col)=={frozenset(e) for e in G.edges()}, 'edge set mismatch'
    assert all(isinstance(x,int) and 0<=x<p for x in col.values())
    ok=True
    for v in G.nodes():
        cs=sorted(col[frozenset((v,w))] for w in G[v])
        for a,b in itertools.combinations(cs,2):
            dd=(a-b)%p
            if min(dd,p-dd)<q: ok=False
    alpha=len(nx.max_weight_matching(G,maxcardinality=True))
    Delta=max(dict(G.degree()).values())
    lb=Fraction(G.number_of_edges(),alpha)
    print("n=%d F=%s (%s,%s) valid=%s |E|=%d alpha'=%d Delta=%d |E|/alpha'=%s p/q=%s"%(n,tname[0],p,q,ok,G.number_of_edges(),alpha,Delta,lb,Fraction(p,q)))
