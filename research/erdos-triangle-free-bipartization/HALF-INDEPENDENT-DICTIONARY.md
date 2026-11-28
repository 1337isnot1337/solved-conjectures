# A uniform dictionary for almost-half independent sets

A necessary structure theorem for [Erdős Problem 23](https://www.erdosproblems.com/23), valid at every order and for graphons. The test is about actual optimum cuts, not a hypothesis that the graph has a finite template.

Normalize the vertex measure to one. Suppose a triangle-free weighted graph or graphon has optimum unordered monochromatic mass B≥1/25 and admits a law on optimum sign cuts whose expected monochromatic degree is the constant d=2B. This holds at the [global graphon extremizer](SATURATED-GRAPHON-EXTREMIZER.md), and at any interior maximum of the weight simplex of a fixed finite support. For every ε in [0,1/10000], there is a single measurable partition consisting of at most six pairs (P_i,Q_i) and a remainder Z, with the following properties.

* The remainder has mass at most 24ε. Each surviving shore has mass at least d−12ε.
* Every independent set I of mass at least (1−ε)/2 differs in mass by at most 28ε from one of the sets formed by choosing one whole shore from each pair and taking their union. The same dictionary works for all such I. The dictionary has at most 64 entries; its entries need not themselves be independent.
* For ε=0 the conclusion is exact modulo null sets: every half independent set is one dictionary entry. If there is no qualifying I, the dictionary assertion is vacuous and no paired partition is asserted.

These statements do not reduce all maximizing graphons to a finite adjacency template. They reduce one potentially infinite family of witnesses to a uniformly finite list.

## The stationary monochromatic kernel

Define M(x,y) as the original edge kernel multiplied by the probability that x and y have equal signs. Thus 0≤M≤1, M is symmetric, and its degree is d almost everywhere. For an independent set I of mass a, the total *unordered* M mass inside I is zero. Summing the constant M-degrees over I gives crossing mass d a. As the total unordered M mass is d/2, the unordered M mass inside the complement is exactly d(1−2a)/2. In particular a≤1/2.

Fix k qualifying independent sets I_1,...,I_k with k≥1. Partition the vertex space by their binary membership signatures. For a signature s let P_s be its cell, and write bar(s) for coordinatewise complementation. Let E be the total ordered M mass between cells whose signatures are not complementary. Up to M-null pairs, each such pair lies in the complement of some I_j on both ends: an edge of M cannot have both endpoints in I_j. Hence

    E ≤ d Σ_j (1−2 mass(I_j)) ≤ d k ε.                 (1)

Retain a complementary pair (P_s,P_bar(s)) if both shore masses are greater than d/2. To bound the discarded mass, for each discarded pair choose its larger shore, with mass p; the opposite shore has mass q≤d/2. The ordered M mass from the larger shore headed anywhere other than its complementary cell is at least d p−p q≥d p/2. These charges do not overlap, because they use disjoint source cells. Since p+q≤2p, the total discarded mass is at most 4 E/d≤4kε.

On a retained pair of masses p,q we have d p−p q≤E. Since p>d/2, this yields q≥d−2kε. By symmetry p≥d−2kε. For k≤7 the total size of each retained pair is therefore at least 2d−14ε≥0.1586>1/7. In particular there can be at most six retained pairs, even when seven tests are used.

## Choose a bounded list of tests that works for all sets

If there is a qualifying independent set, start with it as the first test. It has one retained pair. At a current partition from k≤6 tests, form a dictionary by choosing one retained shore per pair and excluding the discarded mass. If any qualifying I is farther than 28ε from every entry, append it as a test and refine the cells.

Every old retained pair has at least one retained child pair. Indeed neither old shore can be wholly discarded after refinement, because each has mass greater than d/2≥.04, while the entire new discarded mass is at most 4(k+1)ε≤.0028. Thus some child is retained, and its complementary child belongs to the opposite old shore. An old discarded pair creates no retained child pair: its smaller old shore had mass at most d/2.

If there were exactly one retained child pair for every old retained pair, the new test would agree on the retained children with one of the old dictionary entries. To see this, its last membership coordinate selects exactly one child shore of each pair. Choose the corresponding parent shore. Its error is confined to the discarded mass of the new partition, which is at most 28ε. This contradicts the choice of the new test. Each refinement must therefore strictly increase the number of retained pairs. Since that number is at most six even after an attempted seventh test, the process ends with at most six selected tests. Formula (1) and the discarded mass and shore estimates for k≤6 give the stated constants. This construction uses no compactness of the set of independent sets.

## A common core for high-degree neighborhoods

Here assume the original graphon is zero-one, so the neighborhood mass of almost every x equals its original degree. If B≥1/25 as above, the original degree is at most one half: its neighborhood is independent and we have shown that every independent set has mass at most one half. Let H be the vertices with original degree at least (1−ε)/2. For any qualifying independent I, almost no x in H belongs to I. Indeed for almost every x of an independent I, its neighborhood and I are disjoint independent sets. If x is in H their union has mass at least 1−ε. Give those two sets opposite signs and give the remainder one common fair sign. The expected loss is half the sum of original degrees on the remainder, at most ε/4. This contradicts B≥1/25.

Consequently H is confined, up to null sets, to the all-zero signature cell of the finite selected tests. If mass(H)>24ε, this cell belongs to a retained pair. Its complementary cell Q is the intersection of the selected independent sets, has mass at least d−12ε, and obeys

    mass(Q minus I) ≤ 28ε       for every qualifying independent set I.

For if a nearest dictionary entry chose the all-zero shore instead, it would contain all of H. Because I avoids H, this is impossible when mass(H)>28ε. The stronger hypothesis mass(H)>28ε is therefore sufficient for the displayed conclusion; mass(H)>24ε alone only guarantees retention of the pair. In addition (1) gives ordered M mass from H to outside Q at most 6dε under either retention hypothesis. For ε=0, if the degree-one-half locus has positive mass, Q is a common core of mass at least d contained modulo null sets in every half independent set, including almost every degree-one-half neighborhood.

The finite list represents independent sets, not unrestricted rows of the original adjacency kernel. The cross-cell constraint is on M rather than on all original edges: a dense original link with zero M mass is allowed, but then it must be cut almost surely by the stationary law. No general closure of the middle-density case follows from this alone.
