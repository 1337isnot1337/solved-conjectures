# General position number of oriented trees

## Exact formula

Let D be any orientation of a finite tree T. Reachability, including equality, defines a partial order P_D. A chain is a set of pairwise comparable vertices; the elements of a chain need not be consecutive on their directed path. Let Π range over partitions of the vertices into chains of P_D. Then
```math
\operatorname{gp}(D)=\min_{\Pi}\sum_{C\in\Pi}\min\{2,|C|\}.
```
This answers the oriented-tree clause of [Chandran–Di Stefano–Erskine–Sreelatha–Thomas–Tuite, Problem 5.2](https://arxiv.org/html/2604.15909#S5), also listed in [Section 6 of the general-position survey](https://arxiv.org/html/2501.19385v5#S6). The other two digraph families in Problem 5.2 are not addressed.

**Proof.** In an oriented tree a directed path is the unique path in its underlying tree and hence is a directed geodesic. A set of vertices in order along one directed path is a chain. Conversely, order any chain by reachability and concatenate the directed paths between consecutive vertices. This gives a directed path through the entire chain, since a repeated vertex of the concatenation would give a directed cycle. Thus a general position set is exactly a subset of P_D with no chain of size three. The displayed identity is the 2-family case of the [Greene–Kleitman chain-partition theorem](https://doi.org/10.1016/0097-3165(76)90077-7). For every positive integer k the same argument, replacing 2 by k, gives the largest size of a vertex set that meets each directed path in at most k vertices. The same identification and min–max formula hold for acyclic digraphs in which every directed path is geodesic. This last qualification is necessary: in the transitive orientation of K₃, all vertices are in general position but form a chain of size three.

## Linear-time evaluation from the oriented edges

The min–max formula does not require a root, but explicitly constructing the reachability relation could cost quadratic time. The following finite-state formula uses only the edges of T, gives the optimum for arbitrary vertex weights w(v), and recovers an optimal set.

Fix k≥1. Give each vertex v a label (a_v,b_v) with
```math
(a_v,b_v)\in L_k:=\{(a,b):0\le a\le b\le k,\quad b-a\in\{0,1\}\}.
```
For each arc u→v require b_u≤a_v. The optimum is the maximum of the sum of w(v)(b_v−a_v). In particular for k=2 the five labels are (0,0),(0,1),(1,1),(1,2),(2,2).

To prove the finite-state formula, start from a feasible selected set S. Let b_v be the maximum number of selected vertices on a directed path ending at v, including a one-vertex path. Put a_v=b_v−1 if v∈S and a_v=b_v otherwise. Then 0≤a_v≤b_v≤k. Every directed path ending at u can be extended along u→v: a repeat would give a cycle. Consequently b_u≤a_v. The label objective is exactly the weight of S. Conversely, from a feasible labeling select v exactly when b_v−a_v=1. For any directed path v₁→…→v_t, its selected count satisfies
```math
\sum_{j=1}^t(b_{v_j}-a_{v_j})\le b_{v_t}-a_{v_1}\le k
```
by b_{v_j}≤a_{v_{j+1}}. So the selected set is feasible and has the label objective. These arguments also work for arbitrary real weights.

Root the underlying undirected tree anywhere. Write F_v(a,b) for the best score of the descendant subtree at v with v fixed to (a,b). A leaf contributes w(v)(b−a). For an internal vertex use
```math
F_v(a,b)=w(v)(b-a)
  +\sum_{u:\ u\text{ child},\ u\to v}\ \,\max_{(c,d)\in L_k:\,d\le a}F_u(c,d)
  +\sum_{u:\ u\text{ child},\ v\to u}\ \,\max_{(c,d)\in L_k:\,c\ge b}F_u(c,d).
```
For a fixed label of v, no constraints join two different child subtrees. The formula follows by induction and the answer is the largest F_r(a,b) at the root. Storing one maximizing child label per parent label lets us recover an optimal set with another traversal. For k=2 this uses O(|V|) time and space. For general k, tabulating prefix maxima by d and suffix maxima by c for each child reduces the direct O(k²|V|) recurrence to O(k|V|) time and space. Approximation and transitive closure are unnecessary.

## What was known

The source paper obtains a general lower bound from the leaves and an exact formula for in- and out-arborescences, using sources and near-sources or sinks and near-sinks. It also gives an example where the general bounds are not tight. The newer survey cites that exact scope and identifies the arbitrary-orientation formula as open. The 1976 poset min–max theorem is classical and explicitly credited. The application depends on the geodesic/reachability identification; the linear-time recurrence is separate and does not use the poset theorem. These results do not address the distinct task of minimizing over all orientations of a given tree.
