"""Reproduce bounded exact diagnostics. These do not resolve AMRZ."""
from amrz import *

bridge_instances = 0
connected_graphs = 0
for n in range(2, 7):
    for g in labeled_graphs(n):
        if distances(g) is None:
            continue
        connected_graphs += 1
        bs = bridges(g)
        if not bs:
            continue
        old_lines = metric_lines(g)
        for edge in bs:
            h = subdivide(g, edge)
            new_lines = metric_lines(h)
            keep = (1 << n) - 1
            restricted = {line & keep for line in new_lines}
            assert restricted == set(old_lines)
            assert len(new_lines) == len(old_lines)
            assert len(bridges(h)) == len(bs) + 1
            bridge_instances += 1

print(json.dumps(dict(connected_labeled_graphs=connected_graphs,
                      checked_bridge_instances=bridge_instances), sort_keys=True))
main()
