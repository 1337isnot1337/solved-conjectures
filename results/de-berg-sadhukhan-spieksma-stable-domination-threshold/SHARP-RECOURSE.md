# Sharp recourse on paths

The degree-two upper scheme in [PROOF.md](PROOF.md) uses
$`O(1/\varepsilon)`$ worst-case recourse. Its dependence on the
error tolerance cannot be improved, even on streams in which
every nonempty prefix is a path.

Fix a positive integer t with $`\varepsilon t<1`$. Present the
path on vertices 1 through $`3t-1`$. In one further arrival,
extend either its left or its right endpoint. Both continuations
give a path on $`3t`$ vertices. Such a path has a unique minimum
dominating set, of size t. To see this, every one of t selections
must dominate a disjoint consecutive triple: otherwise t
closed neighborhoods cannot cover $`3t`$ vertices. The endpoint
forces the first triple, and consecutively all the rest. The
triple centers give the unique solution and show it is attainable.

Extending the left endpoint forces the precise set of old
vertices $`\{1,4,\ldots,3t-2\}`$. Extending the right endpoint
forces the disjoint set $`\{2,5,\ldots,3t-1\}`$.
In each case $`\varepsilon t<1`$ forces the algorithm to be
exact by integrality. The two sets have symmetric difference
of size $`2t`$, so from the shared pre-arrival output one of
them is at distance at least t. The argument also gives one
continuation with expected recourse at least t for a randomized
algorithm that guarantees feasibility and approximation on every
realization, by averaging the triangle inequality.

For an input bound N, take
$`t=\min(\lfloor N/3\rfloor,\lceil1/\varepsilon\rceil-1)`$.
Combined with the degree-two block scheme or, when useful,
recomputation of the entire optimal solution, this proves
$`\Theta(\min(N,1/\varepsilon))`$ worst-case recourse for
$`0<\varepsilon\le1/2`$ and $`N\ge3`$. The lower bound works for
edge insertions on a fixed vertex set as well: the last path
vertex is initially isolated and the last edge attaches it to
one of the two endpoints. Any additional permanently isolated
vertices must not be counted as slack in the approximation;
take the instance to have exactly $`3t`$ vertices, within the
budget N.

This supplementary lower bound was independently derived and
checked by the project reviewer. Priority over equivalent
formulations elsewhere is not claimed.
