# Stone's conjecture: a nonproper-locus obstruction

**Status: partial research.** The unrestricted conjecture remains open. The results below are elementary consequences of the complementary-cone representation and topological degree; priority for these specific formulations is not established. No claim of resolving Stone's conjecture is made.

## Statement and literature screen

Stone (1981) conjectured that every fully semimonotone Q0 matrix is P0, with no restriction on real square matrix order. Semimonotonicity (E0) means that for every nonzero x >= 0 there is an index i with x_i > 0 and (Ax)_i >= 0. Full semimonotonicity (E0^f) requires this for A and all valid principal pivot transforms. Q0 means that every feasible LCP has a complementary solution; P0 means all principal minors are nonnegative.

Sources:
- R. E. Stone, *Geometric aspects of the linear complementarity problem*, PhD thesis, Stanford, 1981.
- G. S. R. Murthy and T. Parthasarathy, *Some Properties of Fully Semimonotone, Q0-Matrices*, SIAM J. Matrix Anal. Appl. 16 (1995), 1268–1286, https://doi.org/10.1137/S0895479893253604. They prove order <=4 and several arbitrary-order subclasses.
- Murthy, Parthasarathy and Sridhar, *On Fully Semimonotone Matrices*, 2013, https://doi.org/10.1142/S0219198913400367. The no-partial-incidence case is proved there.
- S. Ghosh, *Sign Propagation of Principal Minors in Fully Semimonotone Matrices and Stone's Conjecture*, https://arxiv.org/abs/2608.22829v3, October 2026. The corrected version leaves the general conjecture open and rules out negative principal minors of orders two and three. The positive-determinant claim of the earlier version must not be used.
- M. S. Gowda, *Applications of Degree Theory to Linear Complementarity Problems*, Math. Oper. Res. 18 (1993), 868–879, https://www.jstor.org/stable/3690127. Degree methods and indices for fully semimonotone matrices have substantial prior literature.

Searches on November 24, 2026 found no full resolution. This is a literature screen, not a comprehensive priority certificate. The specific sufficient condition below may overlap with existing incidence and degree results.

## 1. Generic uniqueness and nonproper values

For x in R^n write w=x^+=max(x,0), z=x^-=max(-x,0), componentwise, and define F(x)=w-Az. Then F(x)=q is exactly the LCP with w=Az+q, w,z>=0 and w_i z_i=0. For I subset [n], define the complementary generator matrix B_I by choosing column -A_j for j in I and e_j otherwise, and write C_I=B_I R_+^n. Thus the range K of F is the union of the C_I. On the orthant with x_j<=0 exactly for j in I, the derivative in x coordinates is the matrix obtained by choosing A_j for j in I and e_j otherwise; its determinant is det A[I,I]. The sign change between nonnegative cone coefficients and x coordinates is important.

The feasible RHS cone is H=cone(e_1,...,e_n,-A_1,...,-A_n). It is convex, full-dimensional and closed, and Q0 is equivalent to K=H.

**Lemma 1.** If A is fully semimonotone, any q in the interior of a nonsingular complementary cone has exactly one complementary solution.

Proof. Its strictly complementary solution has positive z_I and w_{I^c}. Pivot on I, which is valid because det A[I,I] is nonzero. The new RHS is the vector of these positive values. Swapping the pivoted variables gives a bijection of LCP solutions with the pivoted problem. Semimonotonicity gives uniqueness of the zero z solution for a strictly positive RHS: if a nonzero z>=0 solves it, (Az)_i=-q_i<0 on its support, a contradiction. Undo the pivot. QED.

Define
    U(A) = union of C_I for which there is nonzero h>=0 with B_I h=0.
This is a finite union of closed polyhedral cones, each contained in a proper linear subspace. The following are equivalent for a fixed q:
1. q is in U(A);
2. F^{-1}(q) is unbounded;
3. There are x_k with ||x_k|| going to infinity and F(x_k) going to q.

(1) implies (2) by adding arbitrary nonnegative multiples of h to any nonnegative representation of q in that cone. (2) implies (3). For (3) choose a fixed orthant along a subsequence. Its cone is closed, so q belongs to it. Normalize the nonnegative coefficients by their norm and pass to a convergent subsequence on the unit sphere to obtain h. This proves (1). In particular, F has compact preimages of compact sets disjoint from U(A).

## 2. Degree criterion

**Theorem 2.** Let A be fully semimonotone and Q0. If int(H) minus U(A) is connected, A is P0. In particular, it suffices that U(A) intersect int(H) only in a finite union of sets of dimension <=n-2.

Proof. Choose any nonsingular principal minor indexed by I. The interior of C_I is open in R^n, is contained in int(H), and by Lemma 1 is disjoint from U(A). For q there the Brouwer degree of F on a sufficiently large ball, at q, is sign(det A[I,I]), because its only preimage is inside the open orthant on which F is linear and invertible. For q strictly positive, the unique preimage is x=q and the degree is +1.

Both points lie in int(H) minus U(A). This set is open, and if connected is path connected. Along any continuous path between the two points, the preimage is bounded by the equivalence in Section 1 and compactness of the path. Choose a ball containing the preimage of the whole path in its interior. The degree on that fixed ball is constant along the path (homotopy invariance, with no RHS value hitting its boundary image). Hence sign(det A[I,I])=+1. Singular principal minors are zero. This proves P0.

For the dimensional criterion, the complement in an open convex set of finitely many polyhedral sets of codimension at least two is path connected. Explicitly, for two points outside those sets, choose an intermediate point in the open convex set avoiding the cones of lines from either endpoint through each forbidden set. These excluded loci have dimension at most n-1 and cannot cover an open set. Both line segments then avoid the forbidden sets. QED.

**Necessary obstruction.** Any counterexample must have a codimension-one cone of unbounded fibers meeting the interior of H, and their union must separate the positive orthant from some negative-determinant complementary cone. More precisely, some I has rank(B_I)=n-1, a nonzero nonnegative kernel vector, and C_I meeting int(H). Since C_I spans the range of B_I, its relative interior must also meet int(H). In that rank case the kernel is one-dimensional. Every generator with positive coefficient in that nonnegative dependence lies in the lineality space H intersect (-H): its negative is a nonnegative combination of the other generators. This is a constraint on the geometric form of any hypothetical counterexample, not a proof that the obstruction cannot occur.

The rank criterion is not merely a condition on which principal minors are zero: a singular complementary basis with no nonnegative kernel is harmless for the degree argument. Bounded singular fibers do not need to be excluded.

## 3. A constrained-augmentation class ruled out in all orders

Let B be any real m-by-m matrix, and G a nonnegative r-by-m matrix with at least one strictly positive entry in each column. Consider
    A = [[ B, G^T ],
         [-G,  0  ]].

**Theorem 3.** A is always Q0. If it is fully semimonotone, it is P0.

Proof. Write q=(c,b), z=(u,v) where u and c have length m and v and b have length r. Feasibility requires b-G u>=0 and u>=0, hence b>=0. Conversely b>=0 implies feasibility by taking u=0 and v=t 1 for sufficiently large t, because every column of G has positive sum. Thus H=R^m times R_+^r.

For b>=0, the polytope P_b={u>=0:G u<=b} is nonempty and compact. Boundedness follows by bounding each u_i through any positive G_{ji}. The Euclidean projection onto P_b is continuous, so Brouwer's fixed point theorem applied to u -> projection_{P_b}(u-(B u+c)) gives a point u* satisfying
    (B u*+c)^T(u-u*) >= 0 for every u in P_b.
Equivalently u* minimizes the linear objective (B u*+c)^T u on P_b. Linear programming duality gives a nonnegative multiplier v for G u<=b with B u*+c+G^T v>=0, u*_i(B u*+c+G^T v)_i=0, and v_j(b-G u*)_j=0. This is precisely an LCP solution. Duality applies also when b has zero components; no strict feasibility assumption is needed. Hence A is Q0.

For the second assertion, we show U(A) does not meet int(H). Let (c,b) range over an arbitrary compact subset of int(H); all b_j are strictly positive. Every LCP solution has u>=0 and G u<=b, so u is uniformly bounded. If v_j>0, complementary slackness gives (G u)_j=b_j>0. There is some i with G_{ji}>0 and u_i>0. At that i,
    sum_l G_{li} v_l=-(B u+c)_i.
All summands are nonnegative and the right-hand side is uniformly bounded in absolute value. Thus v_j is bounded by that bound divided by the least strictly positive entry of G. This applies to every nonzero v_j (a zero row cannot have positive v_j because b_j>0). Therefore z and w=Az+q are uniformly bounded on such compact RHS sets. In particular all fibers over the interior are bounded, so U(A) is disjoint from int(H). Theorem 2 now proves the assertion. QED.

The theorem excludes arbitrary nonnegative multi-constraint compactification, including the single-simplex border [[B,b],[-b^T,0]] with b>0. In particular a non-P0 matrix B cannot be extended by this construction to a fully semimonotone Q0 matrix. The proof does not assert that every Q0 matrix admits such a form.

## 4. Remaining gap and audit

- Q0 is used to identify the actual complementary range with the convex feasible cone; generic uniqueness alone does not imply this.
- Degree is applied only over compact RHS paths avoiding the unbounded-fiber locus, not to a globally proper map without justification.
- Full semimonotonicity gives uniqueness at a strictly complementary nonsingular solution, not at every degenerate RHS.
- The derivative determinant is the principal minor itself, not the determinant of the nonnegative-coefficient generator matrix, which differs by (-1)^|I|.
- The constrained construction bounds the multipliers, not just the primal variables. This is needed for properness of the full LCP map.
- It remains possible that a general fully semimonotone Q0 matrix has a separating rank-(n-1) nonproper locus. The present analysis does not exclude such matrices, and no full resolution is claimed.

Research record: 2026-11-24. External review and comprehensive novelty verification remain outstanding.
