"""Test Lemma B: for n=2m+1 and |F|=t<=m+1, a perfect sequencing of K_n-F exists only if F is a matching.
Enumerates all F up to isomorphism (graphs with t edges, no isolated vertices) and runs ./seqsearch."""
import itertools, subprocess, sys
import networkx as nx

def iso_classes(n, tmax):
    classes = {0: [nx.Graph()]}
    for t in range(1, tmax + 1):
        reps = []
        for G in classes[t - 1]:
            for a, b in itertools.combinations(range(n), 2):
                if G.has_edge(a, b): continue
                H = G.copy(); H.add_edge(a, b)
                # relabel to 0..k-1 compactly
                H = nx.convert_node_labels_to_integers(H)
                if H.number_of_nodes() > n: continue
                if not any(nx.is_isomorphic(H, R) for R in reps if sorted(d for _, d in R.degree()) == sorted(d for _, d in H.degree())):
                    reps.append(H)
        classes[t] = reps
    return classes

def run(n, F):
    args = ["./seqsearch", str(n), "-", "1"] + [str(x) for e in F for x in e]
    out = subprocess.run(["nice", "-n", "15"] + args, capture_output=True, text=True).stdout
    return int(out.split("sequencings(e0 fixed)=")[1].split()[0])

for n in map(int, sys.argv[1:]):
    m = (n - 1) // 2
    cl = iso_classes(n, m + 1)
    for t in range(1, m + 2):
        for G in cl[t]:
            F = list(G.edges())
            is_matching = max(d for _, d in G.degree()) <= 1
            found = run(n, F)
            flag = "" if (not found or is_matching) else "   <-- COUNTEREXAMPLE to Lemma B"
            print("n=%d t=%d F=%s matching=%s sequencing_exists=%s%s" % (n, t, F, is_matching, bool(found), flag), flush=True)
