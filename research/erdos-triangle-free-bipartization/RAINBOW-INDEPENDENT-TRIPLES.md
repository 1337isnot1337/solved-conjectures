# Independent colour transversals and the Erdős cut

Partial research for [Erdős Problem 23](https://www.erdosproblems.com/23). Total vertex mass is one, edge mass is the product of the endpoint weights, and A,B,C are the classes of a given proper three-colouring. An independent transversal is a triple with one vertex from each class and no edges among the three. Its density here means the unnormalized product mass on A by B by C, with the order of the classes fixed.

## A density obstruction and its finite structural source

If there is no independent transversal, the cyclic orientation A to B to C to A is acyclic. In fact a shortest directed cycle would be chordless, because any chord together with the returning directed arc makes a shorter directed cycle. Its length is a multiple of three and is at least six, because the graph is triangle-free. The vertices at positions 0,2,4 are independent in an induced cycle of any such length, and have all three colours, a contradiction. Thus the weighted median in a topological order gives the [circular-three cut bound](CIRCULAR-THREE.md), without using saturation. In a template saturated only on inter-colour pairs the converse holds: for every independent transversal the three pairs have common neighbors of the third colours, which together with the transversal form a directed six-cycle.

There is an absolute positive lower bound on independent transversal density in **every** proper three-colouring of any middle-band weighted counterexample. Suppose otherwise and pass to a cut-convergent subsequence of the three-coloured graphons. This is the finite-colour version of graphon compactness (weak regularity partitions can be refined by the three mark classes). The limit remains triangle-free; the coloured induced transversal density is zero; the minimum monochromatic cost remains at least 1/25 by cut-norm continuity. Its edge mass is at most 3197/20000. Every finite random sample from the limit is almost surely triangle-free, properly three-coloured, and free of independent transversals. It therefore has minimum monochromatic mass at most 1/44+e/11, by the preceding order argument. Sampling convergence of cut cost and density gives the same bound for the limit, strictly below 1/25. This contradiction gives the positive lower bound, without claiming an explicit numerical value.

## A directly measurable rooted interface

Fix x in C. Let A_1=N(x) intersect A and B_1=N(x) intersect B; put A_0=A minus A_1 and B_0=B minus B_1. Make A_0 and B_1 the first block, and A_1 and B_0 the second. Any backwards A-to-B cross edge would join A_1 to B_1 and is therefore absent by triangle-freeness.

For a vertex z in C, joining the first block incurs backwards attachment degree d_(B_0)(z), while joining the second incurs d_(A_0)(z). Let Q_x be the missing pair mass in A_0 by B_0, precisely the weighted transversal count rooted at x. The product of these two attachment degrees is at most Q_x, since their neighbor sets form a missing rectangle. Consequently assigning each z to its cheaper block gives a total wrong-way mass at most mass(C) sqrt(Q_x). For nonzero C, at some x this is at most sqrt(mass(C) times the total transversal density).

If an exact total first-block mass is desired, specify the mass of C that has to go in the first block and take that mass in increasing order of d_(B_0)(z)-d_(A_0)(z). This minimizes wrong-way mass for the prescribed balance; split one false-twin atom if needed. For any such root and choice, insert the first-block mass and the measured wrong-way mass in [the one-way inequality](ONE-WAY-SEPARATORS.md). The cheaper individually chosen blocks may be unbalanced, so the rooted estimate alone does not yield an explicit unconditional transversal density threshold.

## Quantitative sampling consequence

The positive lower bound can be made explicit using [Bender–Krauthgamer, Theorem 2.1](https://arxiv.org/html/2611.03205v1#S2), the November 2026 Max-Cut sampling result. Let T denote the independent transversal density (classes in fixed order) and p=2e. For every integer k>=1, independent product-weighted sampling with k slots gives

    beta <= 1/44 + e/11 + e/k + 48 sqrt(p)/sqrt(k) + k² T/2.

To verify the normalization, let w_v be the positive vertex masses, W_uv the zero-one adjacency matrix, and n the support order. Use A_uv=n² w_u w_v W_uv and p_v=w_v in that theorem. Its scaled kernel K is exactly W, and its moment parameter H is the weighted mean of sqrt(d(v)), at most sqrt(p). The normalized sample has edge weight W_(X_i,X_j)/k² and keeps repeated draws as separate false twins. Its expected total edge mass is (1-1/k)e. Hence the expected sample deletion cost is at least beta-e/k-48 sqrt(p)/sqrt(k).

For each sample, choose one vertex from each independent transversal and discard their union. If the sample has m transversals, this removes at most m vertices. The smaller graph is triangle-free, three-coloured and transversal-free. By the homogeneous acyclic median bound its minimum cost is at most N_remaining²/44 + e_remaining/11, which is at most 1/44+e_sample/11 in the original sample units. Restore the discarded vertices with independent fair signs: each incident edge is missed with probability 1/2, and their total edge mass is at most m/k. The expected sample deletion cost is therefore at most 1/44+e/11 + E[m]/(2k). Counting transversals by the three ordered slots in their required colours gives E[m]<=k³ T. This proves the claim without requiring a sample entirely free of transversals.

For example every middle-band counterexample with a proper three-colouring must have T>4*10^(-20) in that colouring. Take k=12500², use sqrt(p)<17/30, and compare

    e/k + 48(17/30)/12500 + (12500²)² * (4*10^(-20))/2
        < 603/220000 = 1/25 - (1/44 + (3197/20000)/11).

More generally optimizing k gives beta <= 1/44+e/11+O(T^(1/5)), with an absolute implied constant. These are all-order sampling estimates, not enumeration or finite-order instances of the conjecture.


## Direct deletion to an acyclic cyclic orientation

There is also an elementary robust form of the first observation. Let D be the cyclic orientation of the given proper three-colouring, let Delta be its maximum weighted degree (in-degree plus out-degree), and let f(D) be the least unordered product edge mass that needs deletion to make D acyclic. For any 0 < eta < 1 and q > 0,

    f(D) <= eta + sqrt(q)/eta + 3 Delta T/(2q).                     (1)

This holds without saturation, for an arbitrary finite weighted triangle-free support.

**Bad roots.** The rooted independent-transversal mass at x counts the pairs in the other two colours that form a transversal with x. Its vertex-weighted sum over all three colours is 3T. Set aside the vertices with rooted mass >q; they have total mass at most 3T/q. After ordering the remaining vertices, independently put each set-aside vertex before or after all of them by a fair coin, and order the new vertices within each end uniformly. Every edge incident with a set-aside vertex is backward with probability 1/2, including edges within the set-aside group. Some extension of the order thus has additional backward mass at most 3 Delta T/(2q).

**Recursive splits.** In a current block S, use the inherited triangle-free graph, weights and orientation. If a vertex x has both its incoming and outgoing degree within S greater than eta, apply the rooted interface above, with the cyclic names chosen so x is in C. Its incoming neighbours are the vertices of B_1 and its outgoing neighbours are those of A_1, so both child blocks have mass >eta regardless of how the C vertices are assigned. The backwards cost at the split is at most mass(S) sqrt(q): the restricted rooted Q_x is no larger than the original rooted mass at x, and there are no backwards A-to-B cross edges. Place the first child before the second and recurse on each. Each child has mass less than its parent's mass minus eta. Along any branch there are at most 1/eta splitting levels, and at any one level the total mass of split blocks is at most one. This gives a total backwards mass at splitting levels of at most sqrt(q)/eta. Each arc first separated at a split is counted there only.

**Terminal blocks.** If no such vertex exists, list the vertices of incoming degree at most eta first, and list the remaining vertices, which have outgoing degree at most eta, last. Any backward arc either enters the first group or leaves the second. Charge it to its head in the first case and to its tail otherwise; the charged degree at each vertex is at most eta. Summing over all terminal blocks costs at most eta. Deleting every backward arc leaves an acyclic orientation, so the three terms give (1).

Use a weighted median prefix of this order, splitting one false-twin atom if necessary. Every arc directed from the suffix back to the prefix belongs to the backwards set that was priced in (1). The balanced [one-way separator inequality](ONE-WAY-SEPARATORS.md) therefore suffices for the sharp bound whenever the right side of (1) is at most 201/40000, with no need to charge every deleted edge at full price as a loss of Max-Cut.

For a concrete consequence take eta=1/500 and q=eta^4. The first two terms in (1) sum to .004. If Delta<=1 and T<=10^(-14), the last term is at most (3/2)*10^(-14)/eta^4 = 3/3200. Their sum .0049375 is smaller than 201/40000. Thus every middle-band counterexample of any proper three-colouring has T>10^(-14). At a [weighted least-support extremizer](INDUCED-OPTIMUM-BALANCE.md) within the three-colourable class, Delta<=1/2, so the corresponding floor is T>2*10^(-14). The maximum-degree hypothesis is not needed for the first floor.

These are bounds on all three-colourable weighted counterexamples, not a proof that none exist. The recursive estimate charges split edges once and uses only an absolute bound on the number of levels; it does not assume that transversal mass disintegrates in the same way.


## An independent-transversal root as an ordered three-block separator

There is a different, local criterion when a proper three-colouring has an independent transversal that dominates nearly all vertices. Work modulo 3 and root in vertices r_i of colour i, one in each colour, with no pair adjacent. Partition any vertex v of colour i by its root neighbours:

- O_i if it sees only r_(i+1), the root in its outgoing colour;
- I_i if it sees only r_(i-1), the root in its incoming colour;
- H_i if it sees both;
- L_i if it sees neither.

Write O,I,H,L for the corresponding unions, o,i,h,l for their masses, and Delta for the maximum weighted degree. The notation i for the mass of I is used only after dropping type subscripts.

In the cyclic orientation, every arc between the first three blocks follows the order O, H, I; H itself is independent. Indeed distinct H-types share a root. H_j can have an edge to O_k only for k=j-1, in which case the arc enters H_j; it can have an edge to I_k only for k=j+1, when the arc leaves H_j. For O_j and I_k, the same colour k=j is prohibited, and k=j-1 would mean both see r_(j+1). The only remaining possibility k=j+1 gives an arc from O to I. These exclusions use only the third-vertex triangle obstruction, not maximality.

Choose a prefix in the three-block order, not splitting either O or I. Splitting H is allowed because it is independent; split a false-twin atom if needed. Take the prefix as close as possible to half the mass of O+H+I. Its distance from that half is max(0, max(o,i)-(1-l)/2). There are no backwards cross arcs on these three blocks. Now assign each vertex v of L to the side that contributes less wrong-way mass to the three blocks. The cost of all such arcs is at most half the L-to-rest edge mass. Arcs internal to L cost at most their entire edge mass, so the total wrong-way mass is at most half the degree sum on L, at most Delta*l/2. The imbalance after adding L is bounded by

    s_0 = max(l/2, max(o,i)-1/2+l).

The [one-way separator inequality](ONE-WAY-SEPARATORS.md) proves the sharp Erdős bound whenever

    s_0²/2 + (3/2) Delta*l <= 603/40000.                         (3)

Thus at a proper-three-colour least-support extremizer, where Delta<=1/2, every independent transversal with undominated mass l<=1/100 must have a one-way block O or I of mass greater than .61. For l=0, a one-way block must have mass greater than 1/2+sqrt(603/20000), about .67364. In the first example even the largest allowed imbalance .12 gives .12²/2+.0075=.0147. Every directed six-cycle supplies two independent transversals (alternating positions), so (3) can be read as two separate constraints per directed-six-cycle root. A single highly unbalanced root does not suffice to certify the conjecture.
