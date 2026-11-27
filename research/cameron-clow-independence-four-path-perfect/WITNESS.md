# Sharpness witness colorings

For the earlier [13-vertex witness](https://erdosproblemaday.com/report/640#explicit-13-vertex-path-witness),
use the column order below. An asterisk marks the vertex
deleted in that row.

| Deleted | a | b | c | z | xa | xb | xc | yab | yac | yba | ybc | yca | ycb |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| a | * | 0 | 0 | 1 | 0 | 2 | 1 | 2 | 1 | 2 | 1 | 2 | 1 |
| z | 1 | 2 | 0 | * | 2 | 0 | 1 | 0 | 2 | 0 | 1 | 2 | 1 |
| xa | 0 | 0 | 0 | 1 | * | 2 | 1 | 2 | 1 | 2 | 1 | 2 | 1 |
| yab | 2 | 0 | 0 | 1 | 0 | 2 | 1 | * | 1 | 1 | 2 | 1 | 2 |

Permuting the three hubs and their attached indices gives
automorphisms, so these four rows cover all deletion cases.
The graph and [exact verifier](verify.py) are independent of
any graph catalogue or search assumptions.
