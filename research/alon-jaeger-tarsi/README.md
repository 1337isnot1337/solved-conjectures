# Alon–Jaeger–Tarsi conjecture

**Status: unresolved.** The results below are a structural reduction, not a proof of the conjecture, a newly solved named conjecture, or a record finite-dimensional bound. Written proof; no Lean verification claimed. Research checkpoint, 2026-11-23 CST.

## Exact target and source audit

The original conjecture says that for every field F of cardinality at least four and every nonsingular square matrix A over F, there exists a vector x with all coordinates of both x and Ax nonzero.

* F. Jaeger, problem presented at the 6th Hungarian Combinatorial Colloquium, Eger, 1981; N. Alon and M. Tarsi, [A nowhere-zero point in linear mappings](https://www.math.tau.ac.il/~nogaa/PDFS/Publications/A%20nowhere-zero%20point%20in%20linear%20mappings.pdf), Combinatorica 9 (1989), 393–395. Infinite fields are immediate from avoidance of finitely many proper hyperplanes, and the 1989 paper settles proper finite prime powers of order at least four.
* J. Nagy and P. P. Pach, [The Alon–Jaeger–Tarsi conjecture via group ring identities](https://doi.org/10.4171/JEMS/1640), JEMS, published online April 2025, settles the prime fields of order p > 61 except p = 79, in fact with arbitrary forbidden singletons in the input and output coordinates.
* The same authors' April 29, 2026 primary preprint [On a group ring identity related to the Alon-Jaeger-Tarsi conjecture](https://arxiv.org/abs/2604.26320), Conjecture 1 and Theorem 1, still identifies the small primes 5 through 61 and 79 as unresolved and shows that a group-ring lifting conjecture implies AJT there.
* Z. Zeng, H. Liu, K. Ratnavelu, [Closing the Permanent-Rank Boundary for the Alon–Jaeger–Tarsi Conjecture](https://www.preprints.org/manuscript/202608.1194), August 18, 2026, reports the dimension range n ≤ 2^(p−2). This is a preprint, not a full resolution.
* **External theorem used below:** H. Akrami, S. Liu, R. Raj, L. A. Végh, [Matroids are Equitable](https://doi.org/10.1007/s00493-026-00217-y), Combinatorica 46 (2026), article 22, Theorem 1.1; [arXiv:2507.12100](https://arxiv.org/abs/2507.12100). This solves the earlier matroid equitability conjecture; that resolution is theirs, not ours.

A bounded search of current sources found no full resolution and no exact occurrence of the support-reduction statement below. Priority of the deduction is unconfirmed; it should not be represented as a priority claim. AJT remains a substantial problem about two bases, linear mappings, and finite-field hyperplane avoidance, rather than a numerical extremum.

## 1. Formulation and theorem

Let F be a finite field of order q ≥ 4, V = F^n, and let B and C be two **labelled disjoint** bases of V*, with equal underlying linear forms allowed between the two bases. For every label f in E = B ⊔ C assign one forbidden scalar a_f. Seek w in V with

    f(w) ≠ a_f for every f in E.

The homogeneous version (all a_f = 0) is precisely AJT. The affine version is the stronger forbidden-singleton problem.

For a nonzero direction v in V, put

    H = {h in V* : h(v) = 0},
    S = {f in E : f(v) ≠ 0},
    b = |B ∩ S|, c = |C ∩ S|, t = b+c.

Each of b and c is positive because its corresponding basis spans V*.

**Support-reduction theorem.** If max(b,c) ≤ q−2, then there is an explicit reduction to an instance of the same two-basis avoidance problem in dimension

    m = n−min(b,c).

Any solution of the reduced instance lifts to a solution of the original instance. The reduction preserves homogeneous forbidden values in the homogeneous case. The reduced bases may include freely chosen completion forms, with forbidden zero on those completion forms.

Using Theorem 1.1 of Akrami–Liu–Raj–Végh, if t ≤ 2q−4 then the labels can be repartitioned into two bases with b = floor(t/2) and c = ceil(t/2), so this gives the same reduction with m = n−floor(t/2).

**Corollary (necessary distance of a minimal counterexample).** If n is the smallest dimension of any counterexample over F, separately in either the homogeneous or the affine problem, then every nonzero v satisfies

    |{f in E : f(v) ≠ 0}| ≥ 2q−3.

For the standard coordinate basis and the rows of A this says that the linear [2n,n] code

    C_A = {(x, Ax) : x in F^n}

has minimum Hamming distance at least 2q−3. In particular each column of A and each column of A^(-1) has weight at least 2q−4. The same distance conclusion is independent of basis partition, changes of ambient coordinates, and nonzero rescalings of labels.

This is a reduction in arbitrary dimensions. It does **not** say that an arbitrary matrix of low minimum distance is a solution without a smaller-dimensional hypothesis or a successful recursive reduction.

## 2. Collision selection lemma

Let U = span(B ∖ S) and T = span(C ∖ S), subspaces of H of dimensions n−b and n−c. For each f in S put z_f = f/f(v), so z_f(v)=1. Thus every difference z_f−z_g is in H.

Claim: the differences of the z_f with f in B ∩ S span H modulo U, and the analogous differences for C span H modulo T.

Proof: choose f_0 in B ∩ S. After rescaling the outside basis forms to z_f, B is still a basis. Any h in H has a unique decomposition in this basis, and evaluating at v shows that the sum of its outside coefficients is zero. Hence h is in U plus the span of z_f−z_(f_0), as asserted. The argument for C is the same.

We use the following elementary observation, valid over any field:

> If every difference between members of a nonempty finite family of points lies in L_1 ∪ L_2, where L_1 and L_2 are vector subspaces, then all differences lie in L_1, or all differences lie in L_2.

Indeed, fix a point p_0 and translate all points by −p_0. Every translated point is in L_1 ∪ L_2. If one is in L_1 ∖ L_2 and another in L_2 ∖ L_1, their difference is in neither subspace (by closure under addition and subtraction). Otherwise all translated points lie in one subspace, and therefore all differences do.

Set k = min(b,c)−1. We construct k differences d_i = z_(f_i)−z_(g_i) such that their span W has dimension k and

    W ∩ U = W ∩ T = {0}.

Start with W_0 = {0}. Suppose j < k and W_j has dimension j and trivial intersection with U and T. Then

    dim(U+W_j) = n−b+j < n−1 = dim H,
    dim(T+W_j) = n−c+j < n−1.

Since the outside differences span H modulo U and modulo T, they are not all in U+W_j and not all in T+W_j. The observation applied to the points z_f in their common affine hyperplane gives a difference outside both U+W_j and T+W_j. Adjoin that difference. It is outside W_j and its addition preserves both trivial intersections: if u = w+λd is in U and λ ≠ 0 then d is in U+W_j, a contradiction; for λ = 0 use the preceding invariant. Similarly for T.

This proves the claim by induction.

The k chosen unordered pairs form a forest on the t labels of S. A cycle of pairs would give a signed sum of their differences equal to zero, contradicting independence. In particular the pairs connect exactly t−k components, counting isolated labels. This remains true if some normalized forms from different labels coincide.

## 3. Proof of the support-reduction theorem

Write α_f = a_f/f(v) for f in S. Impose the k equations

    (z_(f_i)−z_(g_i))(w) = α_(f_i)−α_(g_i).

These equations are consistent: their k coefficient forms are linearly independent, so the map V → F^k given by evaluation on them is surjective. Choose any particular solution w_0. In the homogeneous case choose w_0=0.

Their common solution set is w_0+W^⊥. Because W ⊆ H, the direction v belongs to W^⊥. Choose a linear complement K to Fv in W^⊥, so

    W^⊥ = K ⊕ Fv,   dim K = n−k−1 = n−min(b,c).

For the labels outside S, all forms vanish on v. The restriction H → K* has kernel exactly W: an element of H annihilating K also annihilates Fv, so it annihilates W^⊥, and the double-annihilator identity gives W; the converse is immediate.

Consequently the restrictions of the independent forms B ∖ S to K are independent because W ∩ U = {0}. Likewise the restrictions of C ∖ S are independent because W ∩ T = {0}. Complete each of these two independent sets to a basis of K*, keeping labels separate even when forms coincide. Assign the existing labels the forbidden scalars a_f−f(w_0), and assign any forbidden scalar (say zero) to each new completion label. In the homogeneous case these forbidden scalars are all zero.

This is the smaller instance. If its dimension is zero, the inherited sets are empty and the zero-dimensional vector automatically satisfies the empty family. Otherwise, suppose u in K satisfies all its constraints. Then w = w_0+u satisfies the original constraints for f outside S and all collision equations. The same constraints outside S remain satisfied at w+λv, for every λ in F.

For an outside label f in S, exactly one λ is forbidden:

    λ_f = α_f − z_f(w).

Each chosen pair has equal forbidden λ_f by its collision equation. Thus λ_f takes at most t−k distinct values, by the forest component count. Since

    t−k = max(b,c)+1 ≤ q−1,

at least one scalar λ in F is not forbidden. The corresponding w+λv is a solution of the original instance.

The construction reduces the dimension by min(b,c) ≥ 1. It uses no assertion that a general smaller instance is automatically solvable; it is a one-way lifting of any actual solution.

## 4. Balanced partitions and the distance corollary

The labelled columns of the representation of E define a matroid of rank n whose ground set is partitionable into two bases (parallel elements are allowed). Apply Theorem 1.1 of Akrami–Liu–Raj–Végh to the distinguished subset S and k=2 bases. It produces a new partition B', C' into two bases with the counts floor(t/2), ceil(t/2), in either order. The labels, forbidden values, direction v and S are unchanged, so the avoidance problem is unchanged.

If t ≤ 2q−4, both counts are at most q−2. The preceding theorem constructs a strictly smaller problem, of dimension n−floor(t/2). A smallest-dimensional counterexample in the homogeneous version or in the affine version therefore cannot have such a direction.

For the code C_A, the weight of (v,Av) is precisely t for the two bases of coordinate forms and rows of A. Taking v=e_j gives 1+wt(Ae_j) ≥ 2q−3. Taking v=A^(-1)e_j gives 1+wt(A^(-1)e_j) ≥ 2q−3. This yields the claimed column bounds. No transpose invariance of AJT is asserted.

## 5. Independent audit and limitations

* The argument applies to any finite field, not only a prime field. It uses division only by f(v) for f in S, which is nonzero by definition.
* The two bases are labelled, so repartitioning does not require different underlying linear forms across bases. Repartitioning must move the forbidden values together with their labels.
* The pair selection is justified by the union-of-two-subspaces observation, not an assertion about a generic point avoiding arbitrary many subspaces.
* Pair differences are selected to be independent, and the collision equations are solved simultaneously. No inconsistent affine cycles can arise.
* The completion bases really exist after restriction, since the selected subspace avoids each of U and T. Their extra constraints are sufficient, not necessary, for the original problem.
* The homogeneous induction uses only homogeneous smaller instances. The affine induction uses all forbidden-singleton smaller instances; these are not inferred from the homogeneous conjecture.
* The imported matroid theorem is proved in Combinatorica, Theorem 1.1. No claim of a new proof of equitability is made. The unbalanced support-reduction theorem does not require it.
* The distance bound is a necessary condition on a **smallest** counterexample, not an existence theorem for high-distance codes or an assertion that the stronger affine conjecture has been resolved.
* The remaining obstruction is substantial: rate-one-half codes can have minimum distance much larger than 2q−3. No argument here rules out those cases, and the known exponential-in-p dimensional range is not improved by the distance corollary alone.

Further attack: for larger supports, look for systems of simultaneous collisions in which multiple labels become equivalent per independent equation, or exploit the absence of low-weight directions in the group-ring lifting reduction of Nagy–Pach. The present proof supplies no such general construction.

Research issue: [#303](https://github.com/1337isnot1337/solved-conjectures/issues/303).
