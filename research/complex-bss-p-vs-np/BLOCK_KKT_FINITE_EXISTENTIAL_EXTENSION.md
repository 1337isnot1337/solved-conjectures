# A block critical-point argument for finite universal challenges with local existential witnesses

Status: independently reviewed argument, with the two wording corrections identified in that review incorporated. It uses the reviewed [real critical-point proof](REAL_KKT_RADICAL_EXTENSION.md) and its analytic transfer inputs. It excludes the verification format below under the permanent border lower bound, conditional on those reviewed transfer lemmas. It does not prove P_C differs from NP_C. No novelty or formal-verification claim is made.

The [independent block review](BLOCK_KKT_REVIEW.md) records the adversarial checks. The root reviewer also read the full argument and found no gap.

## 1. Statement to be checked

Let f in R[x_1,...,x_n] have degree d. Let B be any finite challenge set. For each beta in B, let z_beta be a tuple of at most q complex local witness variables and let

```math
E_{\beta,j}(x,y,c,z_\beta)
```

be a finite family of complex polynomials, each with circuit size at most L. The shared tuple c has p complex coordinates. Residuals from a block beta do not depend on any other block's local witness variables. Suppose

```math
y=f(x)
\quad\Longleftrightarrow\quad
\exists c\ \forall\beta\in B\ \exists z_\beta\
\bigwedge_j E_{\beta,j}(x,y,c,z_\beta)=0.             \tag{1}
```

The proposed conclusion is

```math
\underline L(f)\le\mathop{\mathrm{poly}}(n,p,q,L,d),       \tag{2}
```

independently of the number of challenge blocks and the number of residuals in a block.

The key issue is that expanding (1) creates exponentially many local witnesses. The argument below does not apply the small-witness jet lemma to that expanded system. It uses a full system only to obtain compact maximizers, then selects a polynomial number of whole witness blocks by linear algebra in the shared-variable space.

## 2. Compact approximation of the expanded system

Because B is finite, (1) is equivalent to an existential presentation with the shared c and all the z_beta simultaneously. Restrict x,y to real values. Split every complex witness coordinate into real and imaginary parts and every residual into its real and imaginary parts. Replace a residual E=P+iQ by the nonnegative real polynomial F=P squared plus Q squared. Its circuit size is O(L).

Write the shared real optimization coordinates as

```math
v=(y,\mathop{\mathrm{Re}}c,\mathop{\mathrm{Im}}c),
\qquad N=2p+1,
```

and the local real coordinates of a block as w_beta, of dimension at most

```math
Q=2q.
```

The full dimension N+sum_beta dim(w_beta) can be enormous. It is finite at each input length.

The Baire argument from the reviewed real proof gives a real input box on which true instances have uniformly bounded full witness arrays. Thus choose a ball in the shared variables and a separate ball in every local block, with true witnesses strictly inside all balls. Separate balls are essential: they preserve block support. The radii can be chosen in nonempty open intervals above the initial bounds.

For t>0 impose

```math
F_{\beta,j}(x,v,w_\beta)\le t a_{\beta,j},
\qquad
B_\beta(w_\beta)\le R_\beta^2+t a_{\beta,0},
\qquad
B_*(v)\le R_*^2+t a_* .                            \tag{3}
```

Here B_beta and B_* are squared Euclidean norms, or squared distances from fixed centers in the local form below. All offsets are positive. A local ball is included in its own block; the shared ball is a separate block with no local variables.

These feasible sets are nonempty and compact. Let h_t(x) be their largest y-coordinate. The same compactness argument as in the reviewed real proof gives h_t converging uniformly to f on a smaller fixed real input box. The product of the finitely many balls is compact even though the number of factors is enormous. Any limiting feasible full witness array satisfies every original residual, so (1) forces its output to be f(x).

## 3. Generic LICQ in the full, large space

Apply the generic-offset argument to the full finite family (3), with all full witness coordinates treated as optimization variables. For every subset of constraints, consider the polynomial map from (x,full witnesses) to (x,selected constraint values). A nonzero bad-value polynomial exists by the same characteristic-zero rank argument used in the reviewed real proof. Generic positive offsets and generic radii avoid every such polynomial identically along the perturbation ray. Their finite product, after removal of its largest t-power, has a nonzero leading coefficient in x.

After shrinking the real input box and the positive t-interval, every active set has independent gradients in the full optimization space. No useful bound on the total number of active constraints is claimed at this step.

A useful bound does hold within each block. Every gradient of an active constraint from beta is supported only on its N shared coordinates and at most Q local coordinates. If the gradients within that block were dependent in this support, they would also be dependent in the full space. Therefore

```math
|I_\beta|\le N+Q                                   \tag{4}
```

for each block's active set I_beta. There is at most one active shared-ball constraint.

The very large family of offsets, radii, and bad-value polynomials is used only for existence. The final incidence will retain the constants of a polynomial number of blocks.

## 4. Compress whole multiplier blocks in the shared space

At a maximizer, LICQ gives real multipliers lambda for all active constraints. The objective is the shared coordinate y. The stationarity equations in a local block are

```math
\sum_{i\in I_\beta}\lambda_{\beta,i}
       \nabla_{w_\beta}F_{\beta,i}=0.                 \tag{5}
```

Here F_(beta,i) also denotes the local ball polynomial when that constraint is active. Define its net shared gradient vector

```math
g_\beta=
\sum_{i\in I_\beta}\lambda_{\beta,i}
       \nabla_vF_{\beta,i}\in\mathbb R^N.
```

If the shared ball is active, set g_*=lambda_* gradient_v B_*; otherwise put g_*=0. Shared stationarity reads

```math
e_y=g_*+\sum_\beta g_\beta.                           \tag{6}
```

Linear algebra in R^N selects at most N of these whole block vectors which span e_y. There are real coefficients mu for which their linear combination equals e_y. Rescale every multiplier in one selected block by that block's single coefficient mu_beta, and discard all other blocks. If the shared-ball vector is selected, rescale its multiplier similarly.

This preserves all local equations (5), because every multiplier in one block is rescaled by the same factor. It also preserves the normalized shared stationarity (6) by construction. No sign condition on the new multipliers is required. Every retained active equality continues to hold at the same maximizing point.

By (4), the selected certificate now uses at most N blocks and at most

```math
N(N+Q)+1
```

active constraints. It retains at most NQ local witness coordinates. Both bounds are polynomial in p+q.

## 5. The resulting small complex incidences

Let J be the selected local block set. Write iota_* as one or zero according to whether the shared ball is selected, so that |J|+iota_*<=N. In a local block, put rho_(beta,i)=0 for a residual constraint and rho_(beta,i)=R_beta squared for its local ball constraint. The selected active index sets I_beta satisfy |I_beta|<=N+Q.

For each possible choice of J, iota_*, and the I_beta, form the following complex algebraic incidence. All multipliers are independent complex variables. Write v_1=y, and put lambda_*=0 if the shared ball is not selected, without introducing that variable or its active equation in that case.

```math
\begin{aligned}
F_{\beta,i}(x,v,w_\beta)-\rho_{\beta,i}-t a_{\beta,i}&=0
&& (\beta\in J,\ i\in I_\beta),\\
B_*(v)-R_*^2-t a_*&=0
&& (\iota_*=1),\\
\sum_{\beta\in J}\sum_{i\in I_\beta}
\lambda_{\beta,i}\frac{\partial F_{\beta,i}}{\partial v_a}
+\lambda_*\frac{\partial B_*}{\partial v_a}
&=\delta_{a1}
&& (1\le a\le N),\\
\sum_{i\in I_\beta}
\lambda_{\beta,i}\frac{\partial F_{\beta,i}}
                         {\partial (w_\beta)_a}
&=0
&& (\beta\in J,\ 1\le a\le\dim w_\beta).
\end{aligned}                                                     \tag{7}
```

These are the retained active equalities, the normalized shared stationarity, and the separate local stationarity equations. They contain no variables from an unselected local block.

Put p_R=2p=N-1 for the number of shared real witness coordinates excluding the output y. The number of multiplier coordinates is

```math
K=\sum_{\beta\in J}|I_\beta|+\iota_*
\le N(N+Q)+1.
```

Thus the total number of witnesses, excluding the input coordinates x,t and the output y, is at most

```math
p_R+NQ+N(N+Q)+1.                                    \tag{8}
```

The number of equations is at most K+N+NQ. Each norm-square residual has a circuit of size O(L), and each ball polynomial has size O(N+Q). Gatewise differentiation computes all required first derivatives of one selected constraint in its own shared and local coordinates with O((N+Q+1)(L+N+Q+1)) gates. A safe shared circuit bound for the entire incidence is therefore

```math
O\left((N(N+Q)+1)(N+Q+1)(L+N+Q+1)\right).            \tag{9}
```

This includes the multiplier-weighted sums and active equations. Differentiating with respect to the full exponential witness array is unnecessary. The selected centers, radii, offsets, and all other scalar constants also have polynomial total count.

There are finitely many candidate incidences, although their count can be enormous. Every maximizing point projects into at least one of them, by Section 4.

On every reduced irreducible component of any candidate incidence, take the multiplier-weighted sum of the differentials of its active equalities. Local stationarity cancels every retained dw_beta term, and shared stationarity leaves precisely dy. Thus

```math
dy+\sum_{j=1}^n A_j\,dx_j-C\,dt=0.                  \tag{10}
```

Characteristic zero gives projected dimension at most n+1 in (x,t,y)-space. The discarded blocks do not appear in this identity or the incidence. No residual from a retained block depends on a discarded local variable.

## 6. Select a degeneration and apply the jet lemma

The remaining proof is the same finite-family argument as in Sections 6–7 of the reviewed real KKT note.

Discard components whose base projection to (x,t) is not dominant, shrinking the real input box and the positive t-interval to avoid their base images. Each remaining projected closure is an irreducible hypersurface H_Z(t,x,y)=0. The product of these finitely many equations vanishes at every h_t(x). Uniform convergence to f makes the t=0 product vanish on the graph of f over a real open input box, hence identically. At least one nonzero H_Z(0,x,y) contains y-f(x) as a factor.

Its source Z is an actual component of one of the small incidences in Section 5. For generic nonzero t, fiber components remain actual components of the small specialized system, and every component of the projected hypersurface fiber is dominated by a source fiber component. The dimension arguments proving these two assertions are unchanged from the reviewed real proof.

The fixed complex root-cluster lemma gives local holomorphic sheets converging to f. Their generic lifts and the [finite-branch Taylor-jet lemma](SINGULAR_WITNESS.md) provide polynomial border bounds for order-d jets. Moving centers and passing to the coefficientwise limit give (2).

## 7. Local component form

The proof only needs an actual irreducible component of the expanded equation variety whose projected closure is the graph. Other components can be removed near a generic smooth point of that component, where projection to x is a submersion and x is real. A local holomorphic witness section exists there.

Choose a product of a shared witness-output ball and one local witness ball per block, with its closure contained in an isolating neighborhood. This is possible because there are finitely many blocks. Shrink the real input box so that the true local section lies strictly inside smaller concentric balls in every block. There are nonempty intervals of allowed radii. For sufficiently small t, the product of expanded balls remains inside the isolating neighborhood.

All approximate-maximizer limits then lie on the selected component and have output f(x). The block support and multiplier compression are unchanged. This proves the same bound from the local actual-component hypothesis.

## 8. BSS-verifier form of the proposed extension

Suppose instead that

```math
(x,y)\in G_f
\quad\Longleftrightarrow\quad
\exists c\in\mathbb C^p\ \forall b\in\{0,1\}^m\
\exists z\in\mathbb C^q\ V(x,y,c,b,z)=1,             \tag{11}
```

where V is a deterministic complex BSS predicate of worst-case cost T, with arithmetic, defined division, and equality branches.

For each fixed b, choose an accepting computation path and convert its conditions to polynomial equalities and inequations using gatewise numerator-denominator pairs. Their individual circuit sizes are O(T), and they depend only on the shared (x,y,c) and that challenge's local witness z_b. A full assignment of paths for all finitely many b gives one basic constructible set in the full witness array. The finitely many such sets cover the feasible witnesses, and their projected images cover the graph while lying inside it.

Choose a full path assignment with dense graph image. Its closure is a union of actual components of its block-separated equation variety. A retained component has projected closure equal to the graph. All inequations are nonzero on a dense open subset of it and can be maintained in the local isolating neighborhood. Thus Section 7 applies without introducing an inverse witness for every inequality.

The preceding proof gives

```math
\underline L(f)\le\mathop{\mathrm{poly}}(n,p,q,m,T,d),
```

with arbitrary nonuniform constants. The parameter m is included for explicit accounting of the Boolean challenge input. For the permanent, the imported lower bound excludes polynomial p,q,m,T in this format even without assuming P_C=NP_C.

The additional complex existential block is not eliminated by selecting its witnesses efficiently. It is handled by separate compact balls, block-local stationarity, and selection of whole multiplier blocks in the small shared-variable space. An arbitrary complex universal block is not covered: the finite full witness array and its compactness argument are essential here.
