# Erdős–Fajtlowicz–Staton conjecture: source audit and structural route

Research date: 20 November 2026. No resolution claimed. No Lean work.

## Target

For a finite simple undirected graph G, let r(G) be the maximum order of an induced regular subgraph. The named Erdős–Fajtlowicz–Staton conjecture asks whether min_{|V(G)|=n} r(G) / log n tends to infinity. This is Erdős Problem 82, the full asymptotic conjecture, not a fixed-order Ramsey computation.

## Sources read

- Historical statement: https://mathweb.ucsd.edu/~erdosproblems/erdos/newproblems/RegularInducedSubgraphs.html ; cites Erdős (1995) and Fajtlowicz–McColgan–Reid–Staton (1995).
- Dyson–McKay, https://arxiv.org/abs/2604.08215 : newer regular-induced Ramsey upper-bound construction. Its existence does not resolve the superlogarithmic lower-bound question.
- Levy, https://arxiv.org/abs/2608.08169 , version 2 (14 August 2026). **Version matters:** the earlier unconditional-looking title/summary is obsolete. V2 makes the lower-bound claim conditional on a local-limit lower bound and an overlap-correlation hypothesis. The abstract expressly says its lower bound is a conjecture and conditional partial result.
- Ramos–Hulak–de Queiroz, https://arxiv.org/html/2604.23882v1 , especially Sections 4, 7, 8. The paper explicitly does not solve the conjecture or improve its general lower bound. It gives a fixed-core correction certificate. Synchronizing the retained core alone does not synchronize the surviving tail. Exact output size is also a separate requirement.
- Ferber–Hardiman–Krivelevich, https://arxiv.org/abs/2107.06977 and https://www.math.tau.ac.il/~krivelev/residues-subgraphs.pdf . Linear-size prescribed-residue results concern random graphs, not arbitrary graphs.

## A concrete structural direction: make the self-layer equations explicit

The absorption paper reduces core correction to linear algebra but leaves surviving tail residues to check. An exact formula below separates the linear core conditions from the genuinely nonlinear survival conditions. This is a derived diagnostic, not a new theorem about the full conjecture and not an asserted novel result.

Let q be a positive even integer, and suppose G is q-modular: all degrees have a common residue d modulo q. Partition its vertices into a core U and pairwise disjoint blocks P_1,...,P_t, each of size q. Assume each block is a module (every outside vertex is adjacent to all or none of it), and G[P_i] is regular. Between two distinct blocks adjacency is therefore complete or empty; write e_ij in {0,1}, with e_ii=0. Let a_ui indicate adjacency from u in U to P_i. Choose a lift d modulo 2q of the common degree residue modulo q, and define b_v in F_2 by deg_G(v)=d+q b_v mod 2q. The module assumption makes b_v constant on P_i; denote it b_i.

Let x_i=1 mean delete the entire block P_i. Retain the whole core. For a desired common top bit c in F_2, the retained graph is 2q-modular with degree residue d+qc if and only if

    b_u + sum_i a_ui x_i = c                          (u in U),
    (1+x_i) (b_i + sum_j e_ij x_j + c) = 0            (1<=i<=t).

All sums and products in this display are over F_2. Proof: deleting a complete q-block changes each adjacent surviving degree by exactly q. The first line imposes the residue on every core vertex. In the second line x_i=1 makes the condition vacuous because block i is absent; x_i=0 imposes the same residue on all of block i. Regularity inside each block ensures their internal degrees agree. This proves both directions.

Consequences:
1. Gaussian elimination on the first line alone is insufficient; the second line consists of quadratic constraints and is not automatically satisfied.
2. Exact cardinality is an additional integer constraint |U|+q*(t-sum_i x_i)=m. In particular, deleting whole blocks can reach only one residue class of sizes modulo q.
3. A successful use of this route must either solve the coupled quadratic system with a size guarantee, or replace blocks/cores during the process. A linear correction certificate is not such a guarantee.
4. This formula assumes full modules, stronger than equal traces on U. With equal core traces only, individual tail vertices can acquire different degree changes and require separate survival equations.

## Explicit all-parameter counterexample to a tempting shortcut

For every positive even q and integer k>=1, let

    G_(q,k) = K_(q+1) disjoint-union k K_(q,q) disjoint-union K_1.

Every vertex degree is 0 modulo q. Let U consist of one vertex v of K_(q+1) and the isolated vertex z. Let P_0 be the other q clique vertices, and let P_(j,0),P_(j,1) be the two bipartition classes of copy j of K_(q,q). These are regular q-vertex modules. Their traces on U are {v} for P_0 and empty for every other block, so available traces span the full one-dimensional quotient F_2^U/<1>. With d=0, the core top bits are b_v=1, b_z=0.

The core equations force deletion of P_0 and common top bit c=0. This costs q=q(|U|-1), exactly the core-correction bound. It synchronizes U at degree zero. But each wholly retained K_(q,q) has degree q, incompatible with zero modulo 2q. For each of the k bipartite components at least one entire side must additionally be deleted, even if arbitrary individual-vertex deletions are permitted. Indeed, if both sides survive, each surviving vertex has degree between 1 and q, none congruent to zero modulo 2q. Conversely deleting P_0 and one side of each component leaves an independent graph and succeeds. The exact minimum deletion cost for full synchronization while retaining U is therefore (k+1)q.

Thus the ratio between global and local correction cost is unbounded even with a fixed two-vertex core and full trace rank. In particular there is no global deletion bound depending only on q and |U| under the local rank-rich assumption.

Connectedness does not repair this statement. Take the complement of G_(q,k), which is connected. The modules and core are unchanged. Complementation preserves q-modularity and 2q-modularity on every retained vertex set: each degree d is replaced by |W|-1-d. Trace classes modulo the constant vector are unchanged by complementing traces. Therefore the same exact (k+1)q versus q gap holds for this connected family.

This is an explicit structural obstruction to promoting local rank-rich reservoir absorption to global absorption with a core-controlled deletion budget, even for arbitrary (not necessarily blockwise) tail deletions. It is NOT a counterexample to the original conjecture, and is consistent with the absorption paper's explicitly stated self-layer caveat. No novelty priority is claimed.

## Stronger obstruction with a connected heavy pair-trace reservoir

The preceding obstruction is not limited to a one-dimensional trace space. Fix any odd m>=3, positive even q, and k>=1. Let the core U={u_1,...,u_m} be independent. For each edge u_i u_(i+1) of the path on U, add a disjoint block P_i of q vertices, adjacent to exactly those two core vertices. Inside each P_i put K_q minus a perfect matching, a (q-2)-regular graph. Put no edges between different blocks. Finally add k vertex-disjoint copies of K_(q,q), and join every vertex in these copies to every vertex of P_1. No other edges are added. The resulting graph is connected.

Every core endpoint has degree q and every internal core vertex degree 2q. Vertices of P_1 have degree (2k+1)q; all other P_i vertices have degree q. Vertices in the extra bipartite components have degree 2q. Thus the graph is q-modular. Its q-heavy pair-trace graph on U is the connected path. Since m is odd, its trace vectors span F_2^U/<1> exactly as in the pair-trace absorption theorem.

Nevertheless any induced 2q-modular subgraph that retains all of U must delete every P_i. To prove this even for arbitrary individual deletions, write t_i=|P_i intersect W|, so 0<=t_i<=q. If r is the common degree residue modulo 2q, the first endpoint gives t_1=r with 0<=r<=q. At each internal vertex,

    t_(i-1)+t_i = r (mod 2q).

The bounds force the alternating sequence r,0,r,0,... . Since m is odd, t_(m-1)=0, while the last endpoint requires t_(m-1)=r. Hence r=0 and every t_i=0. Once the P_i are deleted, each added K_(q,q) has no remaining external neighbors and needs at least q additional deletions. The exact minimum is therefore

    q(m-1+k),

attained by deleting every P_i and one side of each added bipartite component. The local full-rank correction bound is only q(m-1). For fixed m,q, their ratio is unbounded as k grows.

This connected family already retains the literal connected heavy pair-trace reservoir; no complementation is necessary. It is a counterexample family to the proposed strengthening “connected full-rank reservoirs suffice for globally bounded-cost correction,” not to any theorem as stated in the source. It supports a precise research decision: global lifting cannot be established by freezing an arbitrary rank-rich core; core exchange or a genuinely global residue condition is indispensable.

## General embedding reduction: the tail retains the full zero-residue problem

The construction gives a more general exact reduction. Let q>=2 be even, m>=3 odd, and H any finite graph such that q divides |V(H)| and q divides every degree in H. Construct the path-core graph with q-vertex blocks as above, add H, and join every vertex of H to every vertex of P_1. Write z_(2q)(H) for the largest order of an induced subgraph of H with every degree divisible by 2q (allowing the empty subgraph).

**Proposition.** The resulting connected q-modular graph G has a connected q-heavy pair-trace graph on U and

    max {|W| : U subset W subset V(G), G[W] is 2q-modular}
      = m + z_(2q)(H).

Moreover the feasible sets W are exactly U union S, where S subset V(H) and H[S] has all degrees divisible by 2q.

**Proof.** The core degrees are q or 2q. Block P_1 has degree q+|V(H)|, other blocks degree q, and every vertex h of H has degree deg_H(h)+q; all are divisible by q. Connectivity follows because H is completely joined to P_1 and the core/block path is connected. The traces of the P_i are precisely the path edges, so the rank-rich criterion holds for odd m. For any feasible W, the endpoint recurrence on the retained block sizes is exactly the preceding argument and forces every P_i to be absent and the common residue to be zero. The core U is then isolated inside W. The vertices retained from H therefore must have degrees zero modulo 2q inside H[S]. Conversely any such S gives a feasible W=U union S. Taking maxima proves the formula.

This reduction has only m+q(m-1) added vertices, independent of H. It shows why a local full-rank certificate cannot itself resolve the self-layer problem: zero-residue induced-subgraph selection for graphs H in the specified q-divisible-degree and q-divisible-order class can be hidden in the remaining tail while all advertised core-rank and connectedness hypotheses hold. This is a structural reduction, not a claimed complexity lower bound or a disproof of polynomial dyadic lifting.

