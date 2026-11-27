# A universal quadratic bound for the distance-weighted invariant

For the maximum-cut crossing graph B and the monochromatic edges M, [Ferudun §7](https://arxiv.org/html/2606.28041v1) asks for the sharp estimate Γ≤N², where Γ=∑_{uv∈M}(d_B(u,v)+1)². Here is the same quadratic growth with a universal, nonsharp constant. It applies to **every** optimal cut and all positive vertex product weights; it does not give the sharp constant or settle [Erdős #23](https://www.erdosproblems.com/23).

**Theorem.** If edges have costs p_up_v and the total vertex weight is N, then

    ∑_{uv∈M} p_u p_v (d_B(u,v)+1)² ≤ 144 N².

In fact triangle-freeness is not needed for this crude upper bound.

## Sparse splits inside any diameter-D induced subgraph

Let a connected induced subgraph of B have total mass b and diameter D≥3. Put r=floor((D−1)/2). From a pair at distance D, the two radius-r balls are disjoint, so choose a root whose radius-r ball has mass at most b/2. Let a_i be the successive shell masses and S_i=∑_{j≤i} a_j. Set λ=16b/(r+1)². There exists i≤r with a_i a_{i+1}≤λ S_i.

Otherwise a₁>λ (use i=0), and for each even i from 2 through r,

    S_(i+1)−S_(i−1) = a_i+a_(i+1) > 2√(λ S_i) ≥ 2√(λ S_(i−1)).

Induction gives S_(2k+1)>λ(1+k/2)² for k≤floor(r/2): if t≥1, then t²+2t≥(t+1/2)². At the last k, 1+k/2≥(r+1)/4, so S_(2k+1)>b, a contradiction.

Split at that ball's boundary. An edge of B crosses only between adjacent layers, so the crossing edge weight is at most a_i a_{i+1}≤λ s, with s=S_i≤b/2. Thus

    (D+1)² w_B(crossing the split) ≤ 288 s(b−s),

using D+1≤3(r+1). For D≤2 and a nontrivial induced subgraph, the same bound follows from any nonempty proper split and the trivial estimate w_B≤s(b−s).

## A cut metric avoids hereditary optimality

It suffices to consider each connected component of G separately. Its crossing graph B is connected: flipping a whole B-component otherwise improves the cut because every edge to the rest was monochromatic. For each subset S of the original graph, the optimal cut gives

    w_M(δS) ≤ w_B(δS),

by flipping all vertices of S. This inequality need not hold in arbitrary induced subgraphs, and we do not use it there.

Build a binary decomposition of the vertices. For a connected induced B-subgraph use the sparse split just proved. For a disconnected induced B-subgraph divide into two nonempty unions of components, with no new crossing edge of B. The leaves are single vertices. Give the root height (D_root+1)², and any connected internal node height the minimum of its parent's height and (D_node+1)². For disconnected internal nodes keep the parent's height. Give leaves height 0.

The height of the least common ancestor of u,v is a cut metric on the original vertices: give each tree edge length half the difference of the parent and child heights. For all distinct u,v this metric is at least (d_B(u,v)+1)², since every connected ancestor containing both has induced diameter at least their original B-distance. It is a nonnegative sum of original-vertex cut metrics, so the global optimality inequality gives the M-weighted distance sum at most the B-weighted one in this metric.

At each connected split, its good-edge contribution is at most 288 s(b−s) by the split bound; each disconnected split contributes zero. Each unordered vertex pair contributes p_up_v to s(b−s) at exactly one binary split. Therefore the total B-weighted metric sum is at most 288 ∑_{u<v} p_up_v≤144 N². For disconnected G add the bounds on its components. This finishes the proof.

What is missing for the Erdős conjecture is the **sharp unit constant**; the separator argument uses slack and intentionally ignores the restriction that every bad edge has even distance at least four. The bound does show that the proposed invariant has the correct order without any diameter or degree hypothesis. On balanced odd-cycle blow-ups, the sharp constant 1 is necessary.

[Coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
