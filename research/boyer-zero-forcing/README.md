# Boyer et al.'s path-extremal zero-forcing conjecture

**Status: partial theorem, not a full resolution.** The original conjecture (Question 2 of Boyer, Brimkov, English, Ferrero, Keller, Kirsch, Phillips and Reinhart, *The zero forcing polynomial of a graph*, Discrete Applied Mathematics 258 (2019), DOI [10.1016/j.dam.2018.11.033](https://doi.org/10.1016/j.dam.2018.11.033)) asserts that, for every finite simple graph G with n vertices and each k, z(G;k) ≤ z(P_n;k), where z counts zero forcing sets. Menon–Singh [DOI 10.1016/j.disc.2025.114516](https://doi.org/10.1016/j.disc.2025.114516) establish outerplanar and threshold cases. German [arXiv:2605.10836v2](https://arxiv.org/abs/2605.10836v2), revised November 12, 2026, establishes the distance-hereditary case and discusses the remaining conjecture. The path-extremal question differs from the recently refuted unimodality question. Searches on November 24 for path-extremality with spanning 2-factors, even cycle factors and bipartite regular graphs found no prior statement of the exact theorem below; priority is uncertain.

## Theorem

The path-extremal conjecture holds for every graph admitting any one of these spanning subgraphs (extra edges of the graph are allowed):

1. A disjoint union of cycles, at most one of which has odd order.
2. A path of odd order together with any number of disjoint even cycles.
3. A path of order L≥1 together with disjoint even cycles of orders m_1,...,m_r, admitting an ordering with L + sum_{j<i} m_j ≥ m_i for every i.

In particular it holds for every d-regular bipartite graph with d≥2, and for every d-regular graph with d≥2 that has a proper d-edge-coloring. These are infinite classes, not finite-order checks. They include graphs lacking a Hamiltonian path. No connectivity assumption is needed.

## Proof

Write f≽g for coefficientwise polynomial inequality. Define F_0=0, F_1=1, F_{n+2}=F_{n+1}+t F_n. For n≥1, F_n counts non-forcing subsets of P_n by cardinality: such subsets contain neither endpoint nor a consecutive pair; for n=1 only the empty set is non-forcing. For n≥2 the polynomial is the independence polynomial of the interior path on n−2 vertices. Its kth coefficient is binom(n−k−1,k) for k≤floor((n−1)/2), and zero otherwise. This is Boyer et al.'s path formula.

Put C_n=F_n+2tF_{n−1} for n≥1. For n≥3 this is the independence polynomial of the n-cycle: excluding a fixed vertex yields F_{n+1}, including it yields tF_{n−1}. We also define C_0=2 and use C_1=1, C_2=1+2t as algebraic auxiliaries only.

Choose independently an independent subset in every cycle of a spanning factor and a non-forcing subset in its path component, if present. Every blue vertex then has at least two distinct white neighbors along its component. Thus no initial blue vertex can force in G, even after adding arbitrary edges. At least one vertex is white, so every such subset is non-forcing. The number of these certified non-forcing subsets by cardinality is the product of the corresponding C_n and F_n polynomials. It suffices to lower-bound that product by F_N, where N=|V(G)|.

The following identities are useful. In the quadratic extension of Q(t), let a,b satisfy a+b=1 and ab=−t. The recurrence gives F_n=(a^n−b^n)/(a−b), C_n=a^n+b^n. Consequently for u≥v≥0,

    C_u C_v = C_{u+v} + (−t)^v C_{u−v}.

For L≥m≥0,

    F_L C_m = F_{L+m} + (−t)^m F_{L−m}.

For 0≤L<m,

    F_L C_m = F_{L+m} − (−t)^L F_{m−L}.

All nonnegative-index F and C have nonnegative coefficients. In particular, a product of even cycle polynomials dominates C_M, with M the sum of their lengths; induction follows from the first identity. Moreover C_M≽F_M.

If an odd cycle of order u is present, first combine all even cycles into C_v, where v is even. The empty collection is treated separately (C_u≽F_u). If u≥v, the first identity gives C_u C_v≽C_{u+v}≽F_{u+v}. Otherwise, put d=v−u≥1. Then

    C_u C_v = F_{u+v} + 2tF_{u+v−1} − t^u C_d.

Repeatedly applying F_{j+2}≽tF_j gives F_{u+v−1}≽t^{u−1}F_{d+1}. The defining recurrence gives 2F_{d+1}−C_d=F_d≽0. Hence the two correction terms together are coefficientwise nonnegative. This proves case 1.

For case 2, combine the even cycles into C_M (if none, the result is immediate). If L≥M, the second identity gives F_L C_M≽F_{L+M}. If L<M and L is odd, the third identity gives the same inequality. This includes a singleton path, whose only permitted subset is empty. For case 3, absorb each even cycle sequentially into the path polynomial using the second identity and the hypothesized ordering. This proves all three cases. Comparing the certified number of non-forcing k-subsets to the exact path count proves z(G;k)≤z(P_N;k).

For the bipartite regular corollary, Hall's theorem yields a perfect matching in each nonempty d-regular bipartite graph; removing it leaves a (d−1)-regular bipartite graph, so there are two edge-disjoint perfect matchings when d≥2. Their union is a spanning even-cycle factor. For a proper d-edge-coloring of a d-regular graph, each color class is a perfect matching; choose two. This finishes the proof.

## Scope and obstruction

The natural strengthening using only independent sets of the cycle factor cannot remove the parity hypothesis. For example, the factor C_3 ⊔ C_3 ⊔ C_40 has 46 vertices. Its independence polynomial has coefficient 18 in degree 22 (3 choices from each triangle, 2 alternating choices in the even cycle), whereas [t^22]F_46=binom(23,22)=23. Extra non-forcing sets, not just independent subsets of this factor, are needed. This is **not** a counterexample to the original conjecture. The general graph case remains open.

## Audit

- Every selected blue vertex has two distinct white neighbors; each actual cycle has at least three vertices and only interior path vertices may be selected. Adding edges cannot create a unique white neighbor at such a vertex.
- The path formula includes k=0 and the singleton path, and the comparison uses the same vertex count, not an asymptotic estimate.
- The polynomial identities hold formally over Q(t), and are identities of integer polynomials. For even m the sign in the L≥m identity is positive; for L odd the sign of the correction in the L<m identity is positive.
- The odd-cycle correction uses d≥1 only; the equal-length situation falls in the u≥v case.
- The parity obstruction checks the exact maximum-degree coefficient and only refutes the strengthened counting method.
- The included elementary coefficient computations can be replayed as a regression check; the argument does not depend on finite computation.

Original conjecture attribution belongs to Boyer et al. The partial theorem and proof were developed during the 2026-11-24 ChatGPT research session at the repository owner's request. External review and comprehensive priority verification have not been completed.
