# Heinig’s Andrásfai bipartification conjecture

**Theorem.** If a graph G on n vertices admits a homomorphism to any Andrásfai graph, then deleting at most n²/25 edges makes G bipartite. The conclusion also holds with arbitrary nonnegative vertex weights: if the total weight is N and uv costs p_u p_v, the number n²/25 is replaced by total cost N²/25.

This proves the mathematical assertion of [Heinig’s Conjecture 6, p. 7 (2009)](https://arxiv.org/pdf/0907.3928#page=7). The proof uses three rotated circular interval cuts and a short quadratic inequality. It does not assume that the particular bipartifications from Heinig’s Theorem 3 are minimum (his separate Conjecture 5). The balanced pentagon blow-up shows sharpness.

## A six-mass inequality

Let x=(x₀,x₁,x₂) and y=(y₀,y₁,y₂) be nonnegative triples each summing to one. If

    x_i x_j + y_i y_j ≥ 4/25    for all distinct i,j,

then R=∑x_i y_i≥4/25.

Put s_i=x_i+y_i and d_i=x_i−y_i. Summing the three pair inequalities gives ∑(x_i²+y_i²)≤2−6(4/25)=26/25. If ∑s_i²≥34/25, then 2R=∑s_i²−∑(x_i²+y_i²)≥8/25.

Otherwise ∑(s_i−2/3)²<2/75. Since the deviations sum to zero, their squared sum is at least 3/2 times the square of any one deviation; hence |s_i−2/3|<2/15. In particular all s_i>8/15 and s_i s_j≤((2−s_k)/2)²≤121/225 for distinct i,j,k. The hypothesis is equivalent to s_i s_j+d_i d_j≥8/25. Since ∑d_i=0, there is a pair with d_i d_j≤−∑d_i²/3: up to permutation and changing all signs write d=(a,b,−a−b) with a≥b≥0, and 3a(a+b)≥a²+b²+(a+b)². Using that pair gives ∑d_i²≤3(121/225−8/25)=49/75. Therefore

    4R=∑s_i²−∑d_i² ≥ 4/3−49/75 = 17/25,

which is even stronger than needed.

## The circle and the three cuts

The kth Andrásfai graph is isomorphic to the cyclic graph on 3k−1 equally spaced points of a unit circle in which two vertices are adjacent exactly at clockwise displacement in (1/3,2/3). For example, starting with Heinig’s labeling, multiply the indices by k modulo 3k−1; an ordered index difference congruent to 1 modulo 3 maps to residue k plus an integer in [0,k−1], and the set of these residues is symmetric under negation. A graph homomorphic to this template is a subgraph of the complete graph of allowed pairs on its assigned circle points. We may add all allowed pairs, since an upper bound on deletion cost only gets stronger when edges are added. This completion is triangle-free: the three cyclic gaps of a triangle would all exceed 1/3.

First consider an unweighted graph with even n. Perturb the n assigned points to be distinct, away from sector boundaries, and to have distinct remainders modulo 1/3. There is a positive margin before any pair displacement can cross 1/3 or 2/3 since 3k−1 is coprime to 3, so a sufficiently small perturbation preserves every adjacency and nonadjacency. Write each phase as i/3+t, where the sector i belongs to ℤ/3ℤ and 0<t<1/3. In a fixed sector there are no edges. Between sectors i and i+1 there is an edge exactly when the t-coordinate in sector i is smaller than that in sector i+1.

Split at a threshold in t so n/2 points are early and n/2 late. Write X_i for early points of sector i, Y_i for late points of sector i+1 (indices modulo 3). Then between early and late points the only edges are the complete pairs X_i–Y_i. Put x_i=2|X_i|/n and y_i=2|Y_i|/n so that the cross-edge count is n²R/4.

For each h∈{0,1,2}, give X_h sign + and the other two X's sign −; give each Y_i the opposite sign to X_i. Each of the three cuts crosses every early–late edge. Each edge within the early half or within the late half is missed by exactly one of the cuts. In cut h, the missed edges are confined to the two pairs X_i–X_j and Y_i–Y_j where {i,j} is the complement of {h}, so their count is at most n²(x_i x_j+y_i y_j)/4. In geometric terms the three cuts each put one contiguous arc on one side, with a common length and origins rotated by one third of the circle.

If all cuts of the completed graph miss more than n²/25 edges, then these three cuts force every x_i x_j+y_i y_j>4/25. The lemma shows at least n²/25 edges cross between the early and late halves. The three disjoint sets of missed edges show more than 3n²/25 additional edges within the halves. Thus the completed graph has more than 4n²/25 edges.

## Contradiction via the known dense tail

[Balogh, Clemen and Lidický, Theorem 1.2(b)](https://arxiv.org/html/2103.14179) prove Erdős’s bipartization bound for sufficiently large triangle-free graphs with at least 0.3197 times the number of possible edges. Here 2e/n²>8/25=0.32>0.3197. The large-order hypothesis causes no issue: a uniform t-fold independent blow-up preserves 2e/n² and multiplies the minimum bipartization cost by t². For the nontrivial inequality in that identity, independently sample one copy of each vertex from any cut of the blow-up. The expected cost of the induced original cut is the blown-up cost divided by t². The converse uses the original cut on whole classes. This both transfers the dense theorem down to all orders in the needed range and lets the argument begin with even n by doubling. Thus a counterexample in this family cannot exist.

For rational vertex weights, replace each vertex by an independent class of size proportional to its weight and run the same argument. In any cut of the expanded graph, independently sampling one representative per nonempty class gives an original cut with expected cost proportional to the expanded cost, using the product weights. Continuity of a minimum of finitely many quadratic cut costs gives the assertion for real weights, including zero.

## Scope and prior art

Heinig proved the bound for the unweighted templates and separately conjectured the bound for arbitrary homomorphic preimages. That distinction matters: taking uniform blow-ups cannot treat unequal class sizes. [Bedenknecht, Mota, Reiher and Schacht](https://www.math.uni-hamburg.de/home/schacht/2019/Andrasfai.pdf) prove the related sparse-half conjecture for these homomorphic preimages; that gives one sparse half, not a bound on the combined edge count in a half and its complement for nonregular graphs. Heinig proposed using multiple copies of his cuts and quadratic inequalities; this argument uses a related family of circular interval cuts and does not need them to be exactly his unweighted F_k. It uses no numerical search or verification of fixed graph orders.

The proof excludes all Andrásfai-homomorphic graphs as counterexamples to [Erdős #23](https://www.erdosproblems.com/23). It does not settle Erdős #23 outside this class. Also, the separate exact-size conjecture for the smallest possible bipartification of the unweighted templates is not addressed by this proof.

[Proof discussion #1099](https://github.com/1337isnot1337/solved-conjectures/issues/1099) · [Erdős #23 research #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097)
