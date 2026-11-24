# Recursive critical incidences for finite universal prefixes

Status: the alternate-PH worker independently checked the full written proof, including the multiplier-tree induction, support bookkeeping, circuit bounds, and BSS path extension, and reported no gap. Its pruning clarification is included below. This is a certificate-format obstruction conditional on the reviewed analytic transfer lemmas. It is not a proof of the complex BSS separation and makes no novelty or formal-verification claim.

## 1. Statement and resource bound

Let f in R[x_1,...,x_n] have degree at most d. Let B_1,...,B_k be finite sets. At depth j let c_j be a tuple of at most p_j complex coordinates. Suppose the graph of f has the presentation

```math
y=f(x)\quad\Longleftrightarrow\quad
\exists c_0\ \forall b_1\in B_1\ \exists c_1\ \cdots\
\forall b_k\in B_k\ \exists c_k\quad
E_{b_1,\ldots,b_k,\alpha}
 (x,y,c_0,c_1,\ldots,c_k)=0\quad\text{for every }\alpha.
                                                               \tag{1}
```

Every residual is a polynomial with a division-free circuit of size at most L. Its family at each leaf is finite. The existential tuple c_j may depend on x,y, the earlier existential choices, and the preceding finite challenges b_1,...,b_j. It cannot depend on a later challenge.

Put

```math
A_j=1+2\sum_{i=0}^{j}p_i,\qquad A=A_k.
```

There is an absolute constant C, depending only on the fixed polynomial bounds in the reviewed analytic transfer lemma, such that

```math
\underline L(f)\le
(n+d+L+A+2)^{C(k+2)}.                              \tag{2}
```

In particular, a fixed number k of alternating finite-universal and complex-existential blocks gives a polynomial border bound. No size or effective construction of any B_j enters this nonuniform assertion. For Boolean challenges supplied to a bounded-time BSS verifier, their total bit length is included among the verifier resources in Section 8.

This is not about unrestricted complex universal variables. Finiteness supplies a simultaneous witness tree and compactness of a finite product. Those are used before the tree is compressed.

## 2. Expand witnesses as a finite rooted tree

For each prefix v=(b_1,...,b_j), introduce an independent tuple c_v with at most p_j coordinates. The empty prefix is the root. A residual at a leaf depends only on the witness tuples on its root-to-leaf path, together with x,y. Formula (1) is equivalent to existence of the full finite witness array satisfying all leaf residuals. This uses only finiteness of the challenge sets and the original order of existential choices. It does not flatten continuous adaptive challenges.

Restrict x,y to real inputs, split every complex witness into real and imaginary parts, and replace E=P+iQ by F=P^2+Q^2. Each F has an O(L)-size real polynomial circuit. Denote the real witness tuple at v by u_v. Treat y as part of the root's optimization variables. The total real dimension can be enormous, but each root-to-leaf prefix has dimension at most A.

Choose a separate closed ball for the root variables (y,u_root) and for every nonroot tuple u_v. The Baire argument in REAL_KKT_RADICAL_EXTENSION gives a real input box on which the full true witness array is bounded. Thus the radii can be chosen from nonempty open intervals so that each true instance has a full witness tree strictly inside every ball. Alternatively, under the local actual-component hypothesis in Section 7, a holomorphic witness section and an isolating product neighborhood supply these balls.

For each leaf residual impose F<=t a with a positive offset. For each node-ball polynomial B_v impose B_v<=R_v^2+t a_v. All families are finite. The feasible sets are compact and contain true witnesses for t>0. Their maximal real output h_t(x) converges uniformly to f on a smaller closed real input box as t tends to zero: a violating sequence has a convergent full witness subsequence in the finite product of expanded balls, and its limit satisfies every residual with output different from f. This contradicts (1).

## 3. Full stationarity before compression

The generic-offset argument in REAL_KKT_RADICAL_EXTENSION applies in the entire finite witness array. For every subset of the finite constraints, use the polynomial map to their values. Its bad values have proper algebraic closure by the characteristic-zero differential-rank argument. Generic positive offsets and allowed radii avoid each bad polynomial identically along the t-ray. Remove powers of t from their finite product and shrink the real input box away from its nonzero initial coefficient.

Consequently every active family has independent gradients in the full optimization variables for all x in one fixed real box and all sufficiently small positive t. At a maximizer there are real multipliers lambda such that

```math
\sum_{a\text{ active}}\lambda_a\nabla F_a=e_y.       \tag{3}
```

Here F_a denotes either a residual norm square or a node-ball polynomial. The root coordinate y has target derivative one; every real witness coordinate has target derivative zero. No positivity of these multipliers is required. Constraint offsets and radii are constants and do not occur in the gradients in (3).

Each leaf constraint is supported on the coordinates of its ancestral path. Each node-ball constraint is supported on that node alone, except that the root ball also contains y. A nonroot coordinate u_v occurs only in constraints in the subtree rooted at v.

## 4. The tree compression lemma

For a node v let P_v be the coordinate space consisting of y and all real witness coordinates on the path from the root through v. At depth j it has dimension at most A_j. Let C_v be the active constraints in the subtree rooted at v, including its own active ball and all descendant active balls and leaf residuals. Define the full covector

```math
G_v=\sum_{a\in C_v}\lambda_a\nabla F_a.
```

Every strict descendant witness coordinate has zero coefficient in G_v. No constraint outside C_v involves that descendant coordinate, so its coefficient is its coefficient in global stationarity (3), which is zero. Thus G_v is supported on P_v. For v not the root its own-coordinate coefficient also vanishes, but its coefficients on strict ancestors need not vanish. Those ancestor coefficients must be preserved.

At an internal node v, decompose G_v as the sum of the contribution of its active ball (if any) and the covectors G_w of its children. Each child covector has zero coefficient on its own and deeper coordinates and can therefore be viewed as a vector on P_v. All terms lie in the space P_v of dimension at most A_j. Linear algebra selects at most A_j terms whose span contains G_v. Multiply the multipliers of each selected child subtree by its term's scalar coefficient, retain a selected ball term with its scalar coefficient, and discard all other child subtrees and any unselected ball term.

This operation preserves G_v exactly in every coordinate of P_v. Every strict-descendant stationarity equation remains zero because each retained child subtree is scaled as a whole. Every retained constraint remains an active equality at the same maximizing point. No new witness values are selected.

Recurse into each retained child, preserving its currently scaled covector on its entire ancestral coordinate space. Further compression cannot change the contribution already fixed at its parent. At a leaf v, select at most A_k individual active constraint gradients spanning its current G_v and replace their multipliers by the corresponding coefficients. All supports lie in P_v, so this preserves the same covector.

After processing the root and all retained descendants, the total retained covector is still e_y, and every retained witness coordinate has coefficient zero. Prune any node with no selected constraint at or below it. Retain every ancestor witness coordinate needed by a chosen constraint even if that ancestor's own ball was discarded. Dropping a ball does not remove coordinates read by descendant residuals.

This proves the compression lemma. It selects constraints that span a specified covector; it does not assert that the selected original residual equations define the full feasible variety.

## 5. Explicit bounds and the small incidence

Let K be the number of retained active constraints. From the leaves upward, a subtree at depth j needs at most

```math
K_j\le\prod_{i=j}^{k}A_i
```

constraints: a leaf needs at most A_k; an internal node retains at most A_j terms, each either one ball constraint or a child compressed system with at most K_(j+1) constraints. Since the upper bound K_(j+1) is at least one, the recurrence follows. Thus

```math
K\le\prod_{i=0}^{k}A_i\le A^{k+1}.                 \tag{4}
```

The number of retained nodes at depth j is at most the product of A_0,...,A_(j-1), hence at most A^k. The number R of retained real witness coordinates, excluding output y, obeys

```math
R\le A^k\sum_{j=0}^{k}2p_j\le A^{k+1}.             \tag{5}
```

Unused zero-dimensional nodes introduce no coordinates. If every p_j is zero, then R=0 and A=1, and these bounds remain valid.

For each possible retained subtree and constraint choice, form a closed complex incidence with input x,t, output y, retained real-coordinate variables now treated as independent complex witnesses u, and multipliers lambda_a. Its equations are

```math
F_a(x,y,u)-\rho_a-t a_a=0\quad(a\in I),
\qquad
\sum_{a\in I}\lambda_a\partial_yF_a=1,
\qquad
\sum_{a\in I}\lambda_a\partial_{u_\ell}F_a=0
\quad(1\le\ell\le R).                              \tag{6}
```

Here rho_a=0 for a leaf residual and rho_a=R_v^2 for a node ball. The selected incidence has at most R+K witness coordinates and K+R+1 equations. Only the offsets, centers, and radii of selected constraints occur.

Each retained residual has at most A optimization coordinates in its support and circuit size O(L); each ball costs O(A). Forward differentiation only in that support, followed by multiplier sums, gives shared circuit size

```math
O\bigl(K A(L+A+1)\bigr)
\le O\bigl(A^{k+2}(L+A+1)\bigr).                    \tag{7}
```

Summation costs at most O(KA+R), since a derivative outside a constraint's ancestral support is zero. After pruning, every retained coordinate lies on the ancestral path of at least one selected constraint, so R<=KA and the bound (7) includes that summation cost. Input coordinates x need not be differentiated in order to build (6).

Every maximizing point projects into one of these incidences. There are finitely many candidate incidences, irrespective of their possibly enormous count.

## 6. All components have the required projected dimension

On any reduced irreducible component of a selected incidence, take the multiplier-weighted sum of the differentials of its active equations. Stationarity cancels all retained witness differentials and leaves coefficient one on dy:

```math
dy+\sum_{i=1}^{n}U_i(x,t,y,u,\lambda)\,dx_i
-V(x,t,y,u,\lambda)\,dt=0.                          \tag{8}
```

In characteristic zero, differential independence of a transcendence basis implies that the projected coordinate field C(x,t,y) has transcendence degree at most n+1. Every component therefore projects to dimension at most n+1, including components not containing any original maximizer.

The finite-family degeneration argument in REAL_KKT_RADICAL_EXTENSION, Sections 6–7, applies without change. Remove components with nondominant (x,t)-image by excluding their nonzero initial base polynomials on a smaller real box. Remaining projected closures are irreducible hypersurfaces. Their finite product vanishes on all maximal outputs h_t. Uniform convergence implies that one nonzero central hypersurface equation contains y-f(x).

The selected source is an actual component of a small incidence (6). Generic nonzero t-fibers preserve source components; dominance supplies generic lifts of every relevant projected hypersurface fiber component. The fixed-polydisc root-cluster lemma gives algebraic branches converging to f. Generic affine witness slicing and the finite-branch Taylor-jet lemma bound their order-d Taylor polynomials by one fixed polynomial in n,d,R,K and (7). Moving Taylor centers and taking a coefficientwise border limit give (2).

This step imports the exact reviewed actual-component, fixed-neighborhood, and closure arguments. It does not replace them with pointwise convergence of arbitrary roots.

## 7. Local actual-component version

The conclusion also holds if an actual irreducible component W of the fully expanded leaf equation variety has projected closure equal to the graph of f. Choose a smooth generic point of W, on no other component, where projection to x is a submersion and x is real. A local holomorphic section supplies a full finite witness tree over a real input box.

Choose a product of a ball for each node with closure inside a full isolating neighborhood of this point. This is possible because the tree is finite. Shrink the real input box so that its section lies in strictly smaller concentric balls. Small positive perturbations of all allowed radii remain in the isolating neighborhood. Every limiting maximizing tree therefore lies on W and has output f(x).

The proof in Sections 2–6 applies. It only uses the isolated component to establish the correct compact limit; multiplier compression uses the unchanged ancestral variable support. An arbitrary subvariety of a larger component does not satisfy this hypothesis.

## 8. Bounded-time BSS leaf predicates

Suppose each B_j is a Boolean cube and the final predicate is a deterministic complex BSS computation with worst-case cost T, allowed arbitrary fixed complex constants, defined divisions, and equality branches. Let M be the total Boolean challenge length along a root-to-leaf path.

For each leaf, an accepting path gives polynomial equalities and inequations in x,y and its ancestral witness coordinates, with individual circuit sizes O(T) by numerator-denominator conversion. A full assignment of accepting paths to all leaves gives one basic constructible set in the full witness tree. There are finitely many assignments. Their projections lie inside the graph and cover it. One has dense graph image.

That basic constructible set is open in its leaf equation variety. Its closure is a union of actual irreducible components; at least one component has projected closure equal to the graph. Choose a generic point where all relevant inequations remain nonzero and use the local component version. No inverse witness is introduced for each of the exponentially many inequations, and tree support is preserved.

The resulting bound is of the form

```math
\underline L(f)\le
\left(n+d+T+M+\sum_{j=0}^{k}p_j+2\right)^{C'(k+2)}. \tag{9}
```

The degrees of the leaf polynomial conditions can be exponential in T. Bounded Taylor jets evaluate their circuits directly, so that degree is not an omitted resource.

For a permanent graph protocol whose displayed resources are polynomial in m, a number of finite-universal stages

```math
k(m)=o\bigl((\log m)^{1/3}\bigr)
```

would contradict the imported exp(Omega((log m)^(4/3))) border lower bound through (9). This excludes such a protocol; it does not construct one or separate HN_C from P_C. Fixed k is the simplest case. A universal quantifier over all complex challenge values is not a finite node set and is outside this proof.

## 9. Source and review dependencies

- REAL_KKT_RADICAL_EXTENSION.md: finite generic-offset regularity, compact maximum convergence, finite hypersurface-product selection, and actual-component specialization.
- BLOCK_KKT_FINITE_EXISTENTIAL_EXTENSION.md: the one-level whole-block multiplier compression; Section 4 above gives the recursive induction.
- SINGULAR_WITNESS.md and HYPERSURFACE_DEGENERATION.md: fixed-polydisc algebraic branches and bounded Taylor jets, including the cited finite-holomorphic-germ theorem and coefficientwise border closure.

Those files are maintained by the root in the repository. This note supplies the additional tree compression and quantitative accounting. The alternate-PH worker completed a line-by-line review of the full note and separately checked the dependence on growing depth. The integrator separately reviewed the full proof before publication.
