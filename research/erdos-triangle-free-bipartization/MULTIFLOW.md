# A multiflow certificate for Erdős’s bound

Let G be triangle-free with vertex product weights of total vertex mass N. Fix an optimum cut, write B for the crossing graph, M for its monochromatic edges and β for their total weight. Give each B edge its edge weight as capacity, and give each M edge a demand of the same weight between its endpoints. A fractional routing of congestion at most 4/3 certifies the conjectured bound in the whole hard density band; congestion one implies the stronger β≤e(G)/5.

Consequently the conjecture holds whenever some optimum crossing graph is a forest, or is planar with all demand endpoints incident to one common face in each connected component. This includes outerplanar crossing graphs, and all weighted and edge-deleted blow-ups of a template with an optimum cut of this form at the relevant weights. These are full structural cases, not order restrictions.

## Cut domination and length

For every vertex subset S, flipping S cannot improve the optimum cut. This says exactly that the total demand crossing S is at most the supply capacity crossing S. In particular each demand pair lies in one connected component of B. If the demands admit a fractional routing of congestion ρ, decompose it into weighted simple paths. Every demand path has even length (its endpoints are on the same side of the original cut), and a length-two path would create a triangle with the demand edge. Thus every demand path has length at least four. Summing the flow over all capacities gives

    4β ≤ ∑_{uv∈M} w_uv d_B(u,v) ≤ ρ e(B) = ρ(e(G)−β).

So β≤ρe(G)/(4+ρ). On the middle band p=2e(G)/N²≤3197/10000, congestion ρ≤4/3 gives β≤e(G)/4≤3197N²/80000<N²/25. The tails follow from [Balogh–Clemen–Lidický](https://arxiv.org/html/2103.14179) and vertex-weight blow-up. With congestion one, the bound β≤e(G)/5 suffices until p=2/5, above which even the classical independent-neighborhood cut suffices.

## Where the routing comes from

For a forest every demand has a unique supply path. The cut condition for either component after deleting one supply edge is exactly that its aggregate path load is at most capacity. In the planar single-face case, apply the classical [Okamura–Seymour multiflow theorem](https://math.mit.edu/~goemans/18438S12/lec23.pdf). The real-weight fractional form follows from its integral Eulerian form after even scaling for rationals, and finite-dimensional closedness or the real LP form for general capacities.

For a different application, [the general series-parallel flow-cut bound](https://arxiv.org/abs/1203.4041) gives congestion at most two when B is series-parallel. If all demand pairs have crossing distance at least six, then replacing four by six above yields β≤e(G)/4 and thus the full Erdős bound. More generally if B is series-parallel and the weight of four-step demands is β₄, the same argument gives β≤e(G)/4+β₄/4. The cut condition alone does not guarantee congestion one for unrestricted supply graphs, so this does not solve the general case.

The topology in these applications refers to the crossing graph B, not the original graph including the demand edges M. This differs from applying an odd-minor condition to all of G.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
