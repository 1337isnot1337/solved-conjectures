# Erdős's triangle-free bipartization conjecture

## Four-colour switching certificate

This is a sufficient condition, not a resolution of [Erdős #23](https://www.erdosproblems.com/23). It applies to arbitrary orders and arbitrary nonnegative product weights normalized to total vertex mass 1. Triangle-freeness is not needed for the switching inequality. In its intended application triangle-freeness and the density bounds of [Balogh–Clemen–Lidický](https://arxiv.org/abs/2103.14179) put the remaining edge mass e in [1243/10000,3197/20000]. This is unordered edge mass. We use B for the minimum missed mass.

Fix a proper four-colouring with independent classes C1, C2, C3, C4, allowing empty classes. Write d_j(v) for its degree into Cj, weighted by vertex mass, and d(v) for total degree. For each pair {i,j}, assign a nonnegative vertex capacity on C_i ∪ C_j:

    a(v) = w(v) [2 d_j(v) − d(v)]_+    for v in C_i,
    a(v) = w(v) [2 d_i(v) − d(v)]_+    for v in C_j.

Let F_ij be the value of the following ordinary max-flow network: source to C_i with capacities a(v); C_i to C_j along graph edges with capacities 2 w(u)w(v); C_j to sink with capacities a(v). Define A_ij = sum a(v) on the pair, and H_ij=A_ij−F_ij. Then

    3 B <= e − sum_{i<j} H_ij.                            (1)

In particular, sum H_ij >= e−3/25 certifies the sharp bound. The fixed sufficient value 797/20000 works throughout the middle band. A cheaper, generally weaker certificate replaces H_ij by the larger of the two individual colour sums of a(v). This follows from F_ij <= min of those two sums.

### Proof

Start with any of the three cuts that pair the four colours into groups of two. On the shore C_i ∪ C_j, the signed gain from flipping v on its own is w(v)(2d_j(v)−d(v)) for v in C_i, with the symmetric formula on C_j. If a set R on that shore flips, sum its one-vertex gains. For each edge with both ends flipped the sum overcounts the gain by twice its edge mass. All such edges are originally missed and lie between C_i and C_j. It never helps to include a vertex with nonpositive signed gain in this one-shore objective: removing it weakly raises the objective and weakly lowers the penalty. Thus its optimum equals

    max_R [sum_{v in R} a(v) − 2 mass(edges internal to R)].

The positive-part formulation over all vertices has the same optimum, since zero-capacity vertices can be removed. Let R be the set of vertices **on that shore** that flip. In the auxiliary network put R ∩ C_i on the source side and R ∩ C_j on the sink side; put the other C_i and C_j vertices on their opposite sides. The cut capacity is exactly the total a(v) on vertices not flipped plus twice the internal edge mass of R. Every auxiliary cut has this form. Max-flow/min-cut gives H_ij as the exact one-shore optimum.

Now take both individually optimal shore flips simultaneously. Extra interactions can occur only on formerly crossing edges for which both ends flip; the sum of one-shore gains charges two losses on each such edge, although it remains crossing. The joint gain is therefore **at least** H_ij + H_kl. The initial missed mass of that cut is e_ij+e_kl. Sum the resulting three upper bounds on B. Each of the six colour pairs occurs exactly once. This proves (1).

### Relationship to the previous three-cover certificate

Let T be any independent set such that the remaining graph has a proper three-colouring S1,S2,S3; do not require a proper three-colouring of the whole graph. For v in T define its colour concentration as [2 max_j d_j(v)−d(v)]_+. At most one of the three terms [2d_j(v)−d(v)]_+ is positive. Take T as the fourth colour in (1) and use the cheaper one-colour bound only on pairs containing T. This gives

    3B <= e − sum_{v in T} w(v) [2 max_j d_j(v)−d(v)]_+.

Thus even vertices with neighbors in every core colour can contribute, provided a majority of their incident mass goes to a single core colour. The earlier overlapping-cover case is recovered by choosing T as the duplicated vertices and using the three singleton labels on the core: every v in T with positive degree has its neighbors in a single core colour. The gain for such a vertex is its full incident mass. This recovers the stationary threshold 797/3200 via d(v) >= 4B in a stationary extremizer, but the new inequality does not require stationarity or an overlapping three-cover.

The full conjecture still needs a structural argument. In particular, no theorem here forces an unrestricted extremizer to admit a four-colouring, or guarantees that (1) reaches the required threshold whenever a four-colouring exists. For literature context, [Bylka–Idzik–Tuza](https://doi.org/10.1016/S0012-365X(98)00115-0) study local switching for Max-Cut. This note uses that general operation with a specific six-network certificate; it does not claim priority on local switching.

### A four-chromatic control that needs the network improvement

Take the Mycielskian of the 5-cycle. Number the cycle vertices 0 through 4, their twins 5 through 9, and the apex 10. Use the colour sequence

    0,1,0,1,2, 0,1,0,1,2, 3

and mass numerators

    13, 1, 2, 16, 8, 9, 17, 10, 5, 9, 7   (denominator 97).

The graph is triangle-free because a twin's original neighbors cannot form an edge, the twins are independent, and the apex has only twins as neighbors. It is not 3-colourable: if the apex has the third colour, one could change each original vertex of that colour to the colour of its twin, giving a proper 2-colouring of the odd cycle. There are no edges between the original vertices being recoloured. The prescribed four-colouring is proper.

In integer numerator units (denominator 9409), the unordered edge mass is 1446. The six pair gains in lexicographic order are 256,8,0,80,0,0; the cheaper one-colour gains are 191,8,0,80,0,0. So the network gives 3B <= 1102/9409, which is below 3/25. The cheaper certificate only gives 3B <= 1167/9409, which is not enough. This example distinguishes the two certificates for a single colouring; it does not rule out using some other colouring or other proofs. The control is not a finite-order claim about the conjecture.

### Approximate colourings and graphons

More generally let the four sets be an arbitrary measurable partition, with total intraclass edge mass r. Delete those edges and compute H_ij for the interclass graph using its degrees, denoted by H^0_ij. An optimum cut of the interclass graph misses at most r extra when used on the original. This yields

    3B <= e + 2r − sum H^0_ij.                         (2)

In particular at a counterexample every four-way partition has sum H^0_ij < e+2r−3/25. This is an inequality for every proposed partition, not an assumption that an exact proper colouring exists.

In graphons use the same measurable-shore gain, with d_j given by integration and pair internal edge mass given by half the ordered integral. The flip identity holds by direct integration; take successively near-optimal measurable flips on each shore and let the optimization errors tend to zero. This proves both inequalities without requiring attainment of an infinite max-flow. The finite max-flow formula only evaluates the same expression when the input is a finite weighted graph.
