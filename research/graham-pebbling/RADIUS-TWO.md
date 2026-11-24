# Graham's pebbling conjecture: further rooted completion theorems

Status: partial research only. The conjecture is not resolved. These results use the completion terminology and conventions in [README.md](README.md). No priority claim is made for the intermediate rooted pebbling-number formula.

## Independent distance-two layer

**Theorem.** Let G be a finite connected simple graph rooted at r, with every vertex at distance at most two from r. Put A=N(r), B=V(G)\\({r}∪A), and suppose B is independent. Let m be the number of vertices a in A for which some b in B has N(b)={a}. Then

    p(G,r)=|V(G)|+m.

Moreover, G admits a tight rooted Class 0 completion: replace each of these m vertices of A by a two-vertex clique of twins and retain singleton fibers elsewhere.

**Proof.** In an r-unsolvable configuration c, c(r)=0, each a in A has at most one pebble, and each b in B has at most three (four can move twice into the same neighbor in A and thence to r). Set S={b in B:c(b)≥2}. Every neighbor in A of any b in S must initially have zero pebbles. Also the neighborhoods of distinct vertices of S must be disjoint: otherwise two of their pairs solve r via a common neighbor.

Conversely, these constraints, together with the stated pile bounds, imply unsolvability. The only vertices initially holding pairs are in S; each has at most one pair, and since B is independent, its only possible destinations are in A. Such a move reaches a previously empty vertex; no two such moves can reach the same vertex, since the neighborhoods of S are disjoint. Thus no vertex of A can ever acquire a pair and no move to r is possible.

For a fixed admissible S (pairwise disjoint neighborhoods), the maximum size of an unsolvable configuration is attained by putting three pebbles on S, zero on N(S), and one on all other nonroot vertices. Its size is

    |V(G)|−1 + Σ_{b∈S}(2−|N(b)|).

The only positive summands arise from degree-one vertices of B. Disjointness forces their neighbors to be distinct, giving an upper bound of m on the sum. Equality is attained by selecting one degree-one vertex of B for each of the m distinct neighbors. This proves the formula.

Now clone precisely those m neighbors into clique fibers of size two. The root retains a singleton fiber. The second layer remains independent, and every vertex in it now has at least two root neighbors. Applying the same formula with m'=0 proves that the completed graph has rooted pebbling number equal to its order, namely |V(G)|+m=p(G,r). Projection to G is a weak homomorphism and is root preserving. ∎

The sufficiency implication when every distance-two vertex has at least two root neighbors does not actually need independence of the distance-two layer: the necessary constraints above still imply that the size of any unsolvable configuration is at most |V(G)|−1.

## Root amalgamation

**Theorem.** Suppose G is the union of k≥1 connected rooted graphs G_i that share only their common root r, with no edges between distinct G_i−r. Then

    p(G,r)=1+Σ_i(p(G_i,r)−1).

If every G_i has a tight rooted Class 0 weak-homomorphic completion, so does G.

**Proof.** Until the first pebble reaches r, no move can cross between branches, since r starts empty in an unsolvable configuration. Hence such a configuration is unsolvable exactly when its restriction to every G_i is unsolvable. The maximum size is the sum of the branch maxima. For the completion, first note that the fiber inequality in README.md forces the root fiber of every tight rooted completion to be singleton. Identify these singleton roots, and take the union of the completions with no extra edges. The resulting graph projects onto G. Its order and rooted pebbling number are both 1+Σ_i(p(G_i,r)−1). ∎

## Scope audit

Neither theorem proves any general product inequality. The independent-layer restriction is substantive in the first theorem: if there are edges in B, pair moves within B can generate additional pairs not captured by the displayed neighborhood criterion. The root-amalgamation theorem requires amalgamation at the designated root, not an arbitrary cut vertex. The results do not establish either universal tight rooted completion or rooted Class 0 closure under Cartesian products. No theorem here relies on the finite enumeration.
