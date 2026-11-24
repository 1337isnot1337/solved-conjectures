# Schur-complement gluing for acyclic unitary block circuits

24 November 2026. Written proof and internal audit; not a resolution of the unrestricted Marcus–de Oliveira conjecture. No priority claim. This strengthens the forest-composition theorem in [PROOF.md](PROOF.md) by replacing simultaneous compound coupling with the weaker determinant convexity property itself. A search for Marcus–de Oliveira together with overlapping unitary blocks, tree factorization, articulation and Schur complements found the known block/spectral special cases and no exact prior statement of this gluing lemma. This bounded search is not proof of novelty. The full conjecture remains open; see the 2025 survey, DOI 10.3390/math13050711, and Mulero-Martínez, DOI 10.1016/j.laa.2026.03.019, July 2026.

## Statement

For a fixed d-by-d unitary V, say that V has property M if for all complex vectors a,b of length d,

~~~math
\det(D_a+V D_b V^*)\in\operatorname{conv}\left\{\prod_{i=1}^d(a_i+b_{\sigma(i)}):\sigma\in S_d\right\}.
~~~

This definition permits the convex weights to depend on a,b. It does not demand the simultaneous squared-minor coupling of all exterior powers.

Let an n-by-n unitary U be an ordered product U_m ... U_1. Factor U_t is the identity off a coordinate subset C_t, and acts unitarily on C_t. Construct the bipartite incidence graph with coordinate vertices 1,...,n, indexed factor vertices 1,...,m, and an edge (i,t) precisely when i belongs to C_t. Empty factors can be discarded.

**Theorem.** If this incidence graph is a forest and every local block U_t|_{C_t} has property M, then U has property M.

Consequently any counterexample whose relative unitary admits such a factorization must have a counterexample among its constituent blocks, at order at most max_t |C_t|. This is a reduction for all n and all complex spectra, not a solution in a fixed dimension. It requires only local determinant convexity, not spectrum-independent weights. If the full conjecture were known through size k, the theorem would certify every incidence-forest product of blocks of size at most k at arbitrary order.

## Proof

Induct on the number m of factors. With no factors U=I, so the identity pairing gives equality. In any nonempty incidence forest, there is a factor vertex f with at most one coordinate in C_f incident to any other factor. To see this, remove all degree-one coordinate vertices. In any remaining nontrivial tree every coordinate vertex has degree at least two, so a leaf must be a factor vertex. An isolated factor vertex also works. If C_f has no shared coordinate, choose any v in C_f; otherwise let v be its unique shared coordinate. Write C_f={v} union Z. All coordinates of Z are private to this factor. Let V=U_f.

Remove the factor vertex f and its private coordinates, and then remove the coordinate vertex v. Each component of the remaining incidence graph has at most one factor formerly adjacent to v: two such factors connected by a path avoiding v would have created a cycle. Group components whose unique v-adjacent factor occurs before V in the original temporal order into a pre group, and those whose unique v-adjacent factor occurs after V into a post group. Components with no factor adjacent to v can be assigned arbitrarily. Denote the unions of their coordinate sets by X and Y, respectively; assign any remaining isolated coordinates arbitrarily so X,Y partition the complement of C_f.

Every factor in the pre group is supported on X union {v}, and every factor in the post group on Y union {v}. Factors across groups commute unless both act on v. The latter pairs were already ordered pre-before-post by construction, and V commutes with all factors not acting on v. Thus a stable reordering, preserving the order of every pair of potentially noncommuting factors, writes

~~~math
U=R V L,
~~~

where L is the product of the pre factors and R is the product of the post factors, in their original relative orders. L acts as identity off X union {v}; R acts as identity off Y union {v}. This argument does not reorder gates that share v.

Fix arbitrary complex spectra a,b and write A=D_a, B=D_b. Conjugate A+U B U^* by R^*. Set A_0=R^* A R and B_0=L B L^*. The determinant becomes

~~~math
\det(A_0+V B_0 V^*).
~~~

A_0 has an arbitrary block on Y union {v} and is diagonal with original entries elsewhere; B_0 has an arbitrary block on X union {v} and is diagonal with original entries elsewhere.

Partition rows and columns into X,Y,C_f. The X,Y diagonal blocks are

~~~math
K_X=(B_0)_{XX}+D_{a_X},\qquad K_Y=(A_0)_{YY}+D_{b_Y}.
~~~

Their off-diagonal mutual blocks are zero. Both K_X,K_Y are independent of the choice of V acting on C_f. Assume they are invertible for the moment, taking empty blocks to have determinant one and zero Schur correction. Let e_v be the coordinate vector of v in C_f and define

~~~math
\alpha=(A_0)_{vv}-(A_0)_{vY}K_Y^{-1}(A_0)_{Yv},
\qquad
\beta=(B_0)_{vv}-(B_0)_{vX}K_X^{-1}(B_0)_{Xv}.
~~~

Define a' on C_f by a'_v=alpha and a'_z=a_z for z in Z, and b' similarly by b'_v=beta and b'_z=b_z.

Eliminating the X and Y blocks by a block Schur complement gives the exact identity

~~~math
\det(A+R V L B L^* V^* R^*)=
\det K_X\det K_Y\;\det(D_{a'}+V|_{C_f}D_{b'}V|_{C_f}^*).
~~~

Indeed the Y-to-C_f block is (A_0)_{Yv} e_v^*, and its opposite block is e_v (A_0)_{vY}; their Schur correction changes only the v-th entry of the A-side diagonal block. The X-to-C_f block is (B_0)_{Xv} e_v^* V|_{C_f}^*, and its opposite block is V|_{C_f} e_v (B_0)_{vX}; their correction is the conjugation by V|_{C_f} of a scalar times e_v e_v^*. This gives the stated beta. There is no cross X-Y correction because those blocks do not couple. No Hermiticity is needed; opposite row and column blocks are used as written rather than being assumed to be adjoints.

By property M of V|_{C_f}, the small determinant belongs to the convex hull of its values when V is replaced by permutation matrices P acting on C_f and fixing all other coordinates. The same identity holds for each P, with the *same* alpha, beta, K_X and K_Y. Multiplication by the possibly complex scalar det K_X det K_Y preserves convex combinations. Hence

~~~math
\det(A+U B U^*)\in\operatorname{conv}\{\det(A+R P L B L^*P^*R^*):P\in S_{C_f}\}.
~~~

If either pivot block is singular, replace A by A+tI with real t tending to zero. Both pivot blocks then shift by tI, so their determinants are monic polynomials in t (or identically 1 for empty blocks). They vanish at only finitely many t. For all other t the inclusion holds. The determinants and finitely many vertices are continuous in t, and the space of convex weights is a compact simplex; passage along a convergent subsequence of weights proves the same inclusion at t=0.

For each P write R P L=P(P^* R P)L. Conjugating the resulting determinant by P^* replaces A by the diagonal matrix P^* A P. There are now m-1 local unitary factors. Conjugation of R's factors by P^* relabels their coordinate supports. If w=P^{-1}(v), then their only possible change is v -> w, because none of those factors uses a coordinate in Z. The pre factors are unchanged. The reduced incidence graph is a forest: deleting f leaves a forest; when w is private, it was isolated after the deletion, and moving a subset of the edges incident at v to a fresh vertex w just splits a vertex of a forest. If w=v nothing changes. Every remaining local block still has property M, since coordinate relabeling only permutes spectra and pairings.

Apply the induction hypothesis to (P^* R P)L, with spectra of P^* A P and B. The full n-coordinate permutation-product hull is unchanged by reordering a. Every vertex in the preceding convex hull therefore lies in the original global pairing hull, and convexity proves the theorem.

## Audit and limitations

- The decomposition of factors into components relies on acyclicity of the indexed incidence graph, not merely a tree-shaped sparsity pattern of the final unitary. Repeated overlapping supports can violate the hypothesis.
- The Schur complement uses actual complex scalars alpha and beta, which are allowed by the all-spectra local assumption. It does not assume local normality of a Schur complement, because the local matrices inside the reduced determinant are expressly diagonal and unitarily conjugated diagonal.
- The scalar multiplier may vanish or be non-real; the argument only uses preservation of convex combinations by scalar multiplication. Singular pivots are handled by the explicit common shift and compactness argument.
- For a factor with no shared coordinate, the same proof works with v chosen arbitrarily; alternatively that factor can be removed directly by block determinant factorization.
- The induction changes the factor supports, but preserves their local property M and forestness. Its stopping parameter is number of factors, not dimension.
- The one-cycle common-coupling obstruction in CYCLE_OBSTRUCTION.md does not refute this theorem. Nor does this theorem settle that four-coordinate unitary: it lacks a decomposition into already certified property-M blocks with incidence forest.
- The theorem does not show that every unitary has a decomposition into small M-certified blocks with an incidence forest. Ordinary Givens factorizations have cycles in general. Thus it is not a full resolution of Marcus–de Oliveira. No count as a solved named conjecture, no Lean verification, and no independent external review.

The key new structural reduction is that articulation-compatible local replacement works even when local convex weights depend on the spectra. A possible next step is to identify minimal connected factor networks not covered by such articulation reductions and establish their property M directly. This does not assume the stronger, false universal compound-coupling statement.
