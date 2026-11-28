# A uniform dictionary for almost-half independent sets

A necessary structure theorem for [Erdős Problem 23](https://www.erdosproblems.com/23), valid at every order and for graphons. The test is about actual optimum cuts, not a hypothesis that the graph has a finite template.

Normalize the vertex measure to one. Suppose a triangle-free weighted graph or graphon has optimum unordered monochromatic mass B≥1/25 and admits a law on optimum sign cuts whose expected monochromatic degree is the constant d=2B. This holds at the [global graphon extremizer](SATURATED-GRAPHON-EXTREMIZER.md), and at any interior maximum of the weight simplex of a fixed finite support. For every ε in [0,1/10000], there is a single measurable partition consisting of at most five pairs (P_i,Q_i) and a remainder Z, with the following properties.

* The remainder has mass at most 24ε. Each surviving shore has mass at least d−12ε.
* Every independent set I of mass at least (1−ε)/2 differs in mass by at most 28ε from one of the sets formed by choosing one whole shore from each pair and taking their union. The same dictionary works for all such I. The dictionary needs at most **eight** entries; its entries need not themselves be independent.
* For ε=0 the conclusion is exact modulo null sets: every half independent set is one dictionary entry. If there is no qualifying I, the dictionary assertion is vacuous and no paired partition is asserted.

These statements do not reduce all maximizing graphons to a finite adjacency template. They reduce one potentially infinite family of witnesses to a uniformly finite list.

## The stationary monochromatic kernel

Define M(x,y) as the original edge kernel multiplied by the probability that x and y have equal signs. Thus 0≤M≤1, M is symmetric, and its degree is d almost everywhere. For an independent set I of mass a, the total *unordered* M mass inside I is zero. Summing the constant M-degrees over I gives crossing mass d a. As the total unordered M mass is d/2, the unordered M mass inside the complement is exactly d(1−2a)/2. In particular a≤1/2.

Fix k qualifying independent sets I_1,...,I_k with k≥1. Partition the vertex space by their binary membership signatures. For a signature s let P_s be its cell, and write bar(s) for coordinatewise complementation. Let E be the total ordered M mass between cells whose signatures are not complementary. Up to M-null pairs, each such pair lies in the complement of some I_j on both ends: an edge of M cannot have both endpoints in I_j. Hence

    E ≤ d Σ_j (1−2 mass(I_j)) ≤ d k ε.                 (1)

Retain a complementary pair (P_s,P_bar(s)) if both shore masses are greater than d/2. To bound the discarded mass, for each discarded pair choose its larger shore, with mass p; the opposite shore has mass q≤d/2. The ordered M mass from the larger shore headed anywhere other than its complementary cell is at least d p−p q≥d p/2. These charges do not overlap, because they use disjoint source cells. Since p+q≤2p, the total discarded mass is at most 4 E/d≤4kε.

On a retained pair of masses p,q we have d p−p q≤E. Since p>d/2, this yields q≥d−2kε. By symmetry p≥d−2kε. For k≤7 the total size of each retained pair is therefore at least 2d−14ε≥0.1586>1/7. In particular there can be at most six retained pairs, even when seven tests are used. We strengthen this by one below.

There is an extra restriction from the *original* graph. Its minimum degree is at least 2d: in every optimum sign cut, a vertex incurs at most half its original degree, since otherwise flipping that vertex, or flipping an improving subset of an independent set, improves the cut. The finite graph statement follows from single-vertex optimality; for graphons one uses the countable independent-neighborhood cover in the [graphon reduction](SATURATED-GRAPHON-EXTREMIZER.md) or the first variation of the relaxed cut. Taking the expected monochromatic degree yields the minimum-degree bound.

Consider the retained signatures as subsets of the k coordinates. If s is maximal by inclusion among retained signatures, any original edge from its cell to a retained signature t must have t contained in bar(s), since independent test sets cannot contain both ends of an edge. Complement closure and maximality force t=bar(s). Thus the complementary shore has mass at least 2d−4kε, by the original minimum degree and the bound on discarded mass. The imbalance between two paired shores is at most kε, because the difference of their ordered M masses going outside the pair is d times their mass difference. Therefore every pair containing a maximal signature has total mass at least 4d−9kε. If there were six retained pairs, their total mass would be at least 14d−29kε>1 for d≥.08, k≤7, ε≤.0001. There are at most five.

When there are five retained pairs, there cannot be two distinct pairs containing maximal signatures: the corresponding mass lower bound would be 14d−30kε>1. Nor can both signatures of their one pair be maximal. In that event both signatures are nonempty (the empty set cannot be maximal in the presence of its complement), so the union A of these shores is bipartite and has original neighbors outside A only in the discarded set Z. In every global optimum, the missed edge mass inside A is at most e_W(A,Z): otherwise recoloring A properly would improve the optimum regardless of its boundary. Taking expectations and summing M-degrees on A then gives d mass(A)≤3e_W(A,Z)≤3 mass(A) mass(Z), impossible since d≥.08>3(4kε). Hence in the five-pair case the maximal signature is unique and contains all k coordinates. Indeed every retained signature lies below it, and each coordinate occurs in a retained signature by complement closure.

## Choose a bounded list of tests that works for all sets

If there is a qualifying independent set, start with it as the first test. It has one retained pair. At a current partition from k≤6 tests, form a dictionary by choosing one retained shore per pair and excluding the discarded mass. If any qualifying I is farther than 28ε from every entry, append it as a test and refine the cells.

Every old retained pair has at least one retained child pair. Indeed neither old shore can be wholly discarded after refinement, because each has mass greater than d/2≥.04, while the entire new discarded mass is at most 4(k+1)ε≤.0028. Thus some child is retained, and its complementary child belongs to the opposite old shore. An old discarded pair creates no retained child pair: its smaller old shore had mass at most d/2.

If there were exactly one retained child pair for every old retained pair, the new test would agree on the retained children with one of the old dictionary entries. To see this, its last membership coordinate selects exactly one child shore of each pair. Choose the corresponding parent shore. Its error is confined to the discarded mass of the new partition, which is at most 28ε. This contradicts the choice of the new test. Each refinement must therefore strictly increase the number of retained pairs. Since that number is at most five even after an attempted sixth test, the process ends with at most five selected tests. The theorem keeps the slightly looser constants valid for six selected tests. This construction uses no compactness of the set of independent sets.

## At most eight entries are needed

Let I,J be two qualifying independent sets. Put O=I∩J and R=the complement of I∪J, of mass r. Give I minus J and J minus I opposite signs, give R one common fair sign, and give O the opposite sign to R. The expected loss is

    (1/2) integral_R d_W(y) dy − e_W(O,R)/2,

because all possible edges incident to O go to R and are cut. All edges internal to R are missed, while R-to-(I symmetric difference J) edges are missed with probability one half. The original degrees d_W are at most one half, by independence of neighborhoods and the regular-kernel identity above. For a fractional graphon use the independent positive-support neighborhood, which is at least as large as its weighted degree. By the same exceptional-pair argument as (1), restricted to sources in R, M mass from R to outside O is at most 2dε. Thus e_W(O,R)≥d(r−2ε), and

    d/2 = B ≤ (1/4−d/2) r + d ε.

Since d≥.08 and ε≤.0001 this implies r≥.08(.5−.0001)/.21>.1904. This is a separation bound on the complements of unions of near-half independent sets, not just a claim that the sets intersect.

In the final paired partition, let out(P) be the ordered M mass from P to outside its complementary shore Q. The formulas out(P)=d mass(P)−e_M(P,Q) and out(Q)=d mass(Q)−e_M(P,Q), summed over retained pairs, give

    Σ_pairs |mass(P)−mass(Q)| ≤ E/d ≤ 6ε.

Since discarded mass is at most 24ε, every dictionary entry has mass at least .5−15ε. Also mass(Q)≥d−2 out(P)/d on a retained pair, since mass(P)>d/2. Consequently the sum of any four selected shores of distinct retained pairs is at least 4d−12ε, using their disjoint complementary source cells and (1).

For each qualifying set choose one dictionary entry within 28ε, and keep only the entries so used. If two used entries differ on at least four pair choices, their union has mass at least .5−15ε+4d−12ε. For corresponding independent sets I,J, the approximation loses at most 56ε from this union. Their complement R then has mass at most .5−4d+83ε≤.1883, contrary to the lower bound above. Thus the retained binary choices have Hamming diameter at most three.

For completeness a family of binary strings of length at most four and diameter at most three has at most eight members. For length at most three there are at most eight strings in total. For length four, every complementary pair is at distance four, so at most one of each of the eight complementary pairs may appear.

It remains to handle five retained pairs. The unique maximal signature is the all-one signature, with all-zero complementary cell. Every used dictionary entry must select the all-one shore of this pair. Indeed, suppose a qualifying I were within 28ε of an entry selecting the all-zero shore. Append I to the final list as one extra test even if it was there already. There are again five retained pairs: each old pair has at least one retained child and there can be at most five overall. The old all-zero pair can have only one retained child pair. Its child inside the all-zero parent lies in I, since otherwise that whole child, of mass greater than d/2, lies in the error of size at most 28ε. Its complementary child, inside the all-one parent, therefore avoids I. But then no retained child has the new all-one signature, a contradiction to the uniqueness conclusion for five pairs. Thus this one bit is fixed, leaving a family on four bits still of diameter at most three. This proves the eight-entry bound, including at most eight exact half independent sets modulo null sets for ε=0.

## A common core for high-degree neighborhoods

Here assume the original graphon is zero-one, so the neighborhood mass of almost every x equals its original degree. If B≥1/25 as above, the original degree is at most one half: its neighborhood is independent and we have shown that every independent set has mass at most one half. Let H be the vertices with original degree at least (1−ε)/2. For any qualifying independent I, almost no x in H belongs to I. Indeed for almost every x of an independent I, its neighborhood and I are disjoint independent sets. If x is in H their union has mass at least 1−ε. Give those two sets opposite signs and give the remainder one common fair sign. The expected loss is half the sum of original degrees on the remainder, at most ε/4. This contradicts B≥1/25.

Consequently H is confined, up to null sets, to the all-zero signature cell of the finite selected tests. If mass(H)>28ε, this cell belongs to a retained pair because the discarded mass is at most 24ε. Its complementary cell Q is the intersection of the selected independent sets, has mass at least d−12ε, and obeys

    mass(Q minus I) ≤ 28ε       for every qualifying independent set I.

For if a nearest dictionary entry chose the all-zero shore instead, it would contain all of H. Because I avoids H, this is impossible when mass(H)>28ε. In addition (1) gives ordered M mass from H to outside Q at most 6dε. For ε=0, if the degree-one-half locus has positive mass, Q is a common core of mass at least d contained modulo null sets in every half independent set, including almost every degree-one-half neighborhood.

The finite list represents independent sets, not unrestricted rows of the original adjacency kernel. The cross-cell constraint is on M rather than on all original edges: a dense original link with zero M mass is allowed, but then it must be cut almost surely by the stationary law. No general closure of the middle-density case follows from this alone.
