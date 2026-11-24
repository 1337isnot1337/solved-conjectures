# Holroyd–Talbot conjecture: private-clique compression

Research note, 2026-11-24. See [issue #348](https://github.com/1337isnot1337/solved-conjectures/issues/348). Written proof using an external theorem; not Lean-verified or externally refereed. This proves a broad class, not the original conjecture in full generality.

## Statement and scope

For a graph H, write I_r(H) for its independent r-sets, I_r(H;v) for those containing v, and μ(H) for the minimum size of a maximal independent set. A graph is r-EKR if every pairwise intersecting F ⊆ I_r(H) satisfies |F| ≤ max_v |I_r(H;v)|. It is strictly r-EKR if every maximizer is a full star. Holroyd–Talbot (2005) conjecture the first property for 1 ≤ r ≤ μ(H)/2 and the strict property for 1 < r < μ(H)/2.

Call a vertex in a clique of a fixed clique partition private if it has no neighbors outside that clique.

**Theorem A.** Suppose H admits a partition of its vertices into n nonempty cliques C_1,...,C_n, with at least two private vertices in each C_i. Then H is r-EKR for every 1 ≤ r ≤ n, and a largest star can be centered at a private vertex. If |C_i| ≥ 3 for every i, H is strictly r-EKR for every 1 ≤ r ≤ n.

In particular, attach to every vertex v_i of an arbitrary n-vertex base graph a pendant clique of s_i ≥ 2 new vertices, each adjacent to v_i and no other base or pendant clique. The resulting graph satisfies the strict conclusion for all ranks 1,...,n. Cross-edges among nonprivate vertices can in fact be arbitrary. This includes nonchordal and dense bases. Every maximal independent set of H meets each clique (otherwise a private vertex can be added), so μ(H) = α(H) = n. The theorem covers and exceeds the conjectured rank range on this graph class.

**Theorem B.** Suppose each C_i has at least one private vertex p_i. Put P={p_1,...,p_n} and R=H-P. If μ(R) ≥ 2r−2 and 1 ≤ r ≤ n, then H is r-EKR, with a maximum star centered at a representative p_i. If μ(R) ≥ 2r−1 and n ≥ 2r, then H is strictly r-EKR. For r=1 the conclusions are immediate, even if R is empty (take μ(empty)=0).

Consequently the ordinary pendant graph of an arbitrary base G is r-EKR whenever μ(G) ≥ 2r−2; this is a linear-in-order range for bounded-degree bases since μ(G) ≥ |V(G)|/(Δ(G)+1). This does not prove the entire HT range for ordinary pendant graphs.

## Imported result

We use the weighted form of Chvátal's conjecture, as proved by Chang, Liu and Liu, *A proof of Chvátal's conjecture via a sharp correlation inequality*, arXiv:2609.19123v1 (16 Sep 2026), Proposition 5.3 (Kleitman's weighted bound). For every nonnegative inclusion-decreasing weight w on the power set of a finite ground set and any intersecting family B of its subsets,

```math
\sum_{L\in B}w(L)\le\max_i\sum_{L\ni i}w(L).
```

This is the only external theorem used. The reduction below is unconditional given that published preprint theorem; its proof is not reproduced or independently formalized here.

## 1. Compression and exact projected optimization

Choose one private representative p_i in every C_i. For u∈C_i−{p_i}, compress a family of independent r-sets by replacing u by p_i in each member A containing u for which the replacement A' is not already in the family. Leave all other members unchanged. The replacement is independent because A contains no other vertex of C_i and p_i has no external neighbors. Cardinality is preserved: a changed member goes to a previously absent set and different changed members have different images.

Here is the intersection audit for a single compression. Two changed sets both contain p_i. Two unchanged sets already intersect. If a changed A'=A−{u}+{p_i} and unchanged B are disjoint, then A∩B={u} and p_i∉B. B was unchanged despite containing u, hence B'=B−{u}+{p_i} belonged to the original family. But A∩B'=∅, contradicting original intersection. Thus all compressions preserve intersection.

Repeat any effective compression until none exists. Each effective step strictly increases the integer sum, over members, of the number of representatives; it is bounded by r|F|. Let F* be the final intersecting family.

For A∈F*, put L(A)={i:p_i∈A}. The family B={L(A):A∈F*} is intersecting. Indeed, if L(A)∩L(D)=∅ for A,D∈F*, every shared vertex is a nonrepresentative. Replace all those shared vertices of A by their own representatives, one at a time. Each replacement stays in F* by stability. None creates a new intersection with D, since D contains the shared nonrepresentative in that clique and thus cannot contain its representative. This gives a member disjoint from D, a contradiction. The argument includes A=D, so B contains no empty set. The empty F is trivial.

For L⊆[n] of size at most r, define w(L) as the number of independent (r−|L|)-sets in the induced subgraph of R on the cliques with indices outside L. Set w(L)=0 for |L|>r, with the unique empty completion giving w(L)=1 at |L|=r. This is exactly the number of independent r-sets whose representative set is L, because selected representatives preclude their own cliques and have no other edges. Thus

```math
|F|=|F^*|\le \sum_{L\in B}w(L),\qquad |I_r(H;p_i)|=\sum_{L\ni i}w(L).
```

Conversely for any intersecting family B of nonempty representative sets, the union of all complete fibers over B is intersecting, and its size is exactly the sum on the right. Hence this weighted intersection problem is an exact reformulation for the maximum, not only an upper bound.

It suffices to prove w decreasing for inclusions of nonempty sets; increase w(∅) to the maximum of its old value and all singleton weights if necessary. Neither the objective nor any star weight changes when doing this. The imported weighted theorem then implies the desired EKR bound.

## 2. Proof of Theorem A (weak)

For each i fix a second private vertex q_i distinct from p_i. Given L and x∉L with |L|<r, every completion counted by w(L∪{x}) avoids C_x. Insert q_x. The result is a completion counted by w(L), since q_x has no external neighbors. The insertion map is injective by deletion of q_x. This gives w(L) ≥ w(L∪{x}). The remaining inclusion steps (|L|≥r) are immediate. Consequently w is decreasing, and the reduction proves Theorem A's weak statement without any n≥2r hypothesis.

## 3. Strictness criterion and Theorem A (strict)

Assume r≥2 (r=1 is trivial). Suppose w({i})>w({i,x}) whenever i≠x, and w({i})>0 for all i. After making w decreasing at the empty set, choose ε>0 no greater than all singleton weights and all positive singleton-to-pair gaps. The modified weight

```math
\widetilde w(L)=w(L)-\varepsilon\,1_{|L|\le1}
```

is nonnegative and decreasing: only the singleton-to-pair comparisons lose ε, and the empty-to-singleton comparisons are unchanged. If an intersecting B has no singleton it gains no weight from the subtracted term, but each full star loses exactly ε. The weighted theorem therefore gives

```math
\sum_{L\in B} w(L)\le\max_i |I_r(H;p_i)|-\varepsilon.
```

A maximizing F* must consequently have a singleton in B. Intersection then forces all its sets to contain that representative, and equality of sizes makes F* the full corresponding maximum star.

For Theorem A with |C_i|≥3, singleton-to-pair strictness is immediate from the insertion map in Section 2. If L={i}, x≠i and s=r−1, choose a vertex t_x∈C_x−{p_x,q_x} and choose s−1 distinct other cliques outside L∪{x}, using q_j in each. This is possible since r≤n. They form a completion counted by w(L), not in the image of insertion of q_x. The q_j are private, so there is no edge between them and t_x. Singleton weights are positive because the second private vertices in the other n−1 cliques provide enough choices.

It remains to undo the shifts; the fact that a compressed maximizer is a star alone is insufficient for strictness.

**Reverse-compression lemma.** Suppose an intersecting family A compresses under u→p_i to a full maximum star centered at z. If z≠p_i, the shift cannot introduce z, so every member of A already contains z, and preservation of size makes A the full star. If z=p_i, every original member contains either u or p_i. For each independent k-set T in H−C_i, k=r−1, exactly one of T+u and T+p_i belongs to A. At least one must be present because the compressed family contains T+p_i. Both cannot be present, because then T+u would not shift and the output would not be a p_i-star. If a possible T+u is not independent it simply cannot be present. Thus the T's partition into the two types. Intersection implies there are no disjoint T,T' of opposite types. If the graph on I_k(H−C_i), with edges between distinct disjoint sets, is connected, one type is empty and A is a full maximum star (at p_i or u).

For Theorem A's hypotheses with |C_i|≥3, this disjointness graph is connected for every 0≤k≤n−1. The k=0 graph has one vertex. For k>0, any independent k-set has a disjoint all-private k-set: choose any k cliques and in each take one of p_j,q_j absent from the original set. The collection of k-sets using only the designated p_j,q_j is connected under one-element substitutions (first adjust the support, then the choice in each clique). For consecutive such sets D,E, a common disjoint independent k-set exists. If the substitution changes the support, their union occupies at most one vertex in each clique; choose k other private choices. If it switches p_j to q_j within one clique, choose private vertices disjoint from D∪E outside that clique; if that clique is needed, use a third vertex there, independent of all the other chosen private vertices. This common disjoint set connects D to E by a walk of length two. Therefore all all-private sets lie in one disjointness component, and every independent set joins that component. Applying the reverse-compression lemma through the finite shift sequence proves strictness.

## 4. Proof of Theorem B

Suppose μ(R)≥2r−2, r≥2. Let L≠∅, |L|<r, x∉L and s=r−|L|. For each completion T counted by w(L∪{x}), choose a maximal independent extension M of T in R. It has at least μ(R) vertices. Deleting the cliques indexed by L removes at most |L| members, because they are cliques. Thus at least

```math
\mu(R)-|L|-(s-1)=\mu(R)-r+1\ge r-1\ge s
```

distinct vertices extend T to an independent s-set counted by w(L). Count pairs (T,y) with such an extension y. Every independent s-set counted by w(L) can occur at most s times, since T is determined by deleting y. Hence

```math
s\,w(L)\ge(\mu(R)-r+1)\,w(L\cup\{x\})\ge s\,w(L\cup\{x\}).
```

All inclusion steps beyond rank r are immediate. Adjust w(∅) as in Section 1, and apply the weighted theorem.

If μ(R)≥2r−1, then the displayed factor is at least r>s for singleton L. The pair weights are positive: take any maximal independent set of R and delete the two excluded cliques; at least μ(R)−2≥r−2 elements remain for a completion. Therefore the singleton gaps are strictly positive, and the strictness criterion in Section 3 applies to F*. Singleton weights are positive by the same maximal-extension count.

For the reversal when n≥2r, consider H−C_i with m=n−1 cliques, k=r−1. Every independent k-set can reach an all-representative k-set by one-element substitutions replacing each vertex by its clique's representative; such representative sets themselves are connected under substitutions. If two independent k-sets differ by one element, their union uses at most k+1 cliques. At least m−(k+1)≥k cliques remain unused since n≥2r. Choose k representatives there to obtain a common disjoint independent set. Thus the exchange path becomes a disjointness path. The reverse-compression lemma now proves strictness for the original family as well.

## 5. Obstruction to dropping the second private vertex

For an ordinary pendant graph H=G* with only one leaf per base vertex, R=G and w(L)=|I_{r−|L|}(G−L)|. This weight need not decrease even among nonempty subsets, including in the HT rank range. Example: let G=K_6 and r=3. For distinct i,x, w({i})=0 because K_5 has no independent pair, while w({i,x})=4. Here μ(H)=6=2r. The known EKR property of this pendant complete graph is not in doubt; this example only refutes the stronger monotonicity step for ordinary pendant graphs. Raising w(∅) cannot fix a singleton-to-pair violation. Nor can one simply assume the weighted Chvátal theorem applies to an increasing or arbitrary layer weight.

A possible next direction is a simultaneous uniform weighted bound for the intersecting representative family on all complements of core independent sets, or a different certificate for these nonmonotone completion weights. No such bound is proved here.

## 6. Sources, novelty and verification

- F. Holroyd and J. Talbot, *Graphs with the Erdős–Ko–Rado property*, Discrete Mathematics 293 (2005), 165–176, [DOI](https://doi.org/10.1016/j.disc.2004.08.028), [preprint](https://arxiv.org/abs/math/0307073). Original conjecture and lexicographic clique-product result.
- G. Hurlbert, *A Survey of the Holroyd-Talbot Conjecture*, [arXiv:2501.16144](https://arxiv.org/abs/2501.16144), 2025 preprint, published in 2026. Survey and context for well-covered graph classes.
- M. Carrion, M. M. Fuentes, Z. Joseph and A. Nappo, *EKR-Type Theorems for Pendant Graph Constructions*, [arXiv:2510.22103v1](https://arxiv.org/html/2510.22103v1), 2025. Credits the earlier pendant-complete graph work and uses pendant-directed shifting; its stated generalized pendant-complete result has n≥2r and complete base. The shifting method is prior work. The present application of the new weighted inequality and the second-private insertion is distinct from that argument.
- F. Chang, H. Liu and M. Liu, *A proof of Chvátal's conjecture via a sharp correlation inequality*, [arXiv:2609.19123v1](https://arxiv.org/html/2609.19123v1), Proposition 5.3. Imported weighted inequality, not a claim of this project.
- *An EKR theorem for a class of generalized Hamming graphs*, [October 2026 publication](https://www.sciencedirect.com/science/article/abs/pii/S0166218X26003070), still states the unrestricted HT conjecture.

Literature screening on 2026-11-24: searched the conjecture name, the original title, recent proofs/counterexamples, generalized pendant graph EKR, clique-whiskered EKR, and weighted Chvátal applications. No earlier resolution of general HT or source stating the full private-clique theorem was located. The literature search is not exhaustive; priority remains uncertain. The result is a theorem-combination using a recent unrefereed preprint, rather than an independent proof of that preprint. The full argument above was checked by the author for compression preservation, representative projection, weight monotonicity, equality, disjointness connectivity, and residual extension counts. No Lean check, independent mathematical review, or numerical validation has been performed. Keep in research pending external dependency and scope review; do not count as a solved named conjecture.
