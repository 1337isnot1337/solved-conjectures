# A real critical-point extension for finite residual families

Status: written research lemma, independently reviewed in full by the weighted-protocol and all-multiple agents and the integrator. Sections 9–10 received a separate review after the base argument. This is an obstruction to a certificate presentation, not a proof that P_C differs from NP_C. No novelty, Lean verification, or external peer-review claim is made.

## 1. Statement

Let f in R[x_1,...,x_n] have degree d. Let E_beta(x,y,c), beta in a finite set B, be complex polynomials, with c in C^p. Each E_beta has a division-free circuit of size at most L. The number of residuals is arbitrary and is not charged to the bound below. Suppose

```math
\{(x,y):\exists c\ \forall\beta\in B\ E_\beta(x,y,c)=0\}
=\{(x,y):y=f(x)\}.
```

Then, using the [singular-witness Taylor-jet lemma](SINGULAR_WITNESS.md) and the [graph-factor degeneration argument](HYPERSURFACE_DEGENERATION.md),

```math
\underline L(f)\le\mathop{\mathrm{poly}}(n,p,L,d).
```

In particular, no ideal-membership expression for y-f is required. Set-theoretic correctness of the common-zero presentation suffices. This covers arbitrary finite residual families; it does not by itself handle arbitrary alternating predicates or universal quantification over a complex continuum.

All choices in the proof are nonuniform. In particular the full list of generic perturbation offsets can be enormous. Only the polynomially many offsets of one selected active set appear in the final incidence, and only those constants count toward its circuit size.

## 2. Real residuals and a bounded region with true witnesses

Write c=u+iv, with u,v in R^p, and restrict x,y to real values. Split E_beta into its real and imaginary parts P_beta(x,y,u,v) and Q_beta(x,y,u,v). Arithmetic on pairs of real polynomials constructs each pair with O(L) gates, with real and imaginary parts of the original constants allowed as constants. Define

```math
F_\beta=P_\beta^2+Q_\beta^2.
```

These are nonnegative on real inputs and have O(L) circuits. Their common real zeros have output y=f(x).

There is a nonempty real open box U and a uniform bound on the witness norms for true instances over U. An elementary proof avoids a selection theorem. Start with a closed real box K with nonempty interior. For each positive integer r let K_r be the set of x in K for which the true pair (x,f(x)) has a witness c of norm at most r. The set K_r is closed: along a convergent sequence of such x, compactness of the witness ball supplies a convergent witness subsequence, and continuity preserves all finitely many equations. The union of the K_r is K. Baire's theorem gives some K_r with nonempty relative interior. The needed instance has a short nested-ball proof: if every K_r had empty relative interior, choose successive closed balls inside the interior of K, with each ball inside the preceding ball's interior, radius tending to zero, and avoiding K_r. Closedness and empty interior make each choice possible. The common limit point would belong to none of the K_r, contradicting their union. Choose an open box U inside that relative interior and inside the interior of K. Over U, true witnesses have norm at most r.

Shrink U to a bounded box with closure still in this region. Since f is bounded there, choose a sufficiently large radius R so that every x in U has a true witness with

```math
g_0(y,u,v)=y^2+\sum_a(u_a^2+v_a^2)<R^2.
```

Any radius from a sufficiently large open interval works, leaving room for the generic choice below. Put N=2p+1 for the number of real optimization variables w=(y,u,v).

## 3. A generic perturbation with linear independence of active gradients

Choose positive real offsets a_beta, and also a positive a_0. For t>0 consider the compact feasible set

```math
F_\beta(x,w)\le t a_\beta\quad(\beta\in B),
\qquad g_0(w)\le R^2+t a_0.                       \tag{1}
```

True witnesses lie strictly inside this set. Compactness follows from the last constraint. The offsets and R can be chosen so that, outside a proper real algebraic subset of (x,t)-space, every collection of active constraints has linearly independent gradients with respect to w. In particular there are at most N active constraints.

Here is the required genericity argument. For every nonempty subset I of the constraints, consider the polynomial map

```math
(x,w)\longmapsto(x,(F_i(x,w))_{i\in I}),
```

where F_0 means g_0. If this map is dominant, its critical values lie in a proper algebraic subset: on the critical locus its differential has rank smaller than the target dimension, so each irreducible component of the critical locus has image dimension smaller than that dimension in characteristic zero. If it is not dominant, its entire image lies in a proper algebraic subset. In both cases choose a nonzero real polynomial D_I(x,z_I) vanishing on the bad values. For |I|>N the map is automatically nondominant.

Specialize z_i=t a_i for i!=0 and z_0=R^2+t a_0 if 0 is in I. There are generic real choices, with all offsets positive and R in the permitted open interval, for which no resulting D_I(x,z_I(t)) is identically zero. Indeed the specialization, with t=1 and the offsets and R varying in real open sets, reaches a real open set of z-values. A nonzero polynomial cannot vanish on all such values. There are finitely many I, so all nonvanishing conditions can be imposed simultaneously.

Take the product of the specialized nonzero polynomials. Remove its largest power of t, leaving a polynomial whose coefficient at t=0 is a nonzero polynomial in x. Shrink U around a real point avoiding that coefficient's zero set. On a smaller closed box B inside U, that coefficient is bounded away from zero. Hence there is eta>0 for which all x in B and 0<t<eta avoid every bad value. Every active set then has at most N members and independent w-gradients, as asserted.

The proof does not construct or count the gigantic product or the full offset vector in a circuit. They are used only to choose the final finite incidence.

## 4. Maximal outputs converge uniformly to f

For x in B and 0<t<eta, let h_t(x) be the largest real y among points satisfying (1). A maximizer exists. True witnesses show h_t(x)>=f(x).

Moreover h_t converges uniformly to f on B as t tends to zero. If not, some sequence t_j->0, x_j in B, and maximizing witnesses w_j would have y_j-f(x_j) bounded below by a fixed positive number. The ball constraint makes all w_j bounded. Pass to a subsequence with x_j->x and w_j->w. Every residual F_beta tends to zero because F_beta(x_j,w_j)<=t_j a_beta. Thus all E_beta vanish at the limit, and y=f(x), contradicting the positive gap. Continuity of f completes the argument.

## 5. A small critical incidence for each active set

At a maximizer, write I for the active set. By Section 3 its gradients are independent. On the smooth manifold where the active constraints remain equalities, the inactive constraints remain strict in a neighborhood. The objective y therefore has zero differential in every tangent direction of that equality manifold. Linear algebra gives real multipliers lambda_i with

```math
\sum_{i\in I}\lambda_i\partial_{u_a}F_i=0,
\qquad
\sum_{i\in I}\lambda_i\partial_{v_a}F_i=0,
\qquad
\sum_{i\in I}\lambda_i\partial_yF_i=1.             \tag{2}
```

No multiplier sign condition is needed below. The active set is nonempty because the objective has nonzero gradient.

For each I with 1<=|I|<=N, form a closed complex incidence Gamma_I in variables x,t,y,u,v,lambda by the active equality equations

```math
F_i(x,w)=t a_i\ (i\ne0),\qquad
g_0(w)=R^2+t a_0\ (i=0),                          \tag{3}
```

and the stationarity equations (2). There are O(p) witnesses and equations. Gatewise differentiation gives shared circuit size polynomial in n,p,L. Only the |I| offsets occurring in (3), and R, are used.

Every reduced irreducible component Z of Gamma_I has projected image of dimension at most n+1 in (x,t,y)-space. In the function field C(Z), take the lambda-weighted sum of the differentials of (3). Stationarity cancels all du_a,dv_a terms and makes the dy coefficient one. Thus

```math
dy+\sum_{j=1}^n A_j dx_j-B\,dt=0.                \tag{4}
```

Characteristic zero implies that the span of projected coordinate differentials has dimension equal to the transcendence degree of their field; the field-theoretic derivation proof is given in [CRITICAL_INCIDENCE_BARRIER.md](CRITICAL_INCIDENCE_BARRIER.md), Section 6. Relation (4) gives the asserted bound. This applies to singular and nonreduced displayed systems by passing to each reduced component's function field.

## 6. Select a projected hypersurface with the correct central factor

There are finitely many active sets I and finitely many components Z. The graph of every h_t over B lies in the union of their projected images, by Section 5.

First discard components whose projection to (x,t) is not dominant. For each such component not supported at t=0, some nonzero polynomial B_Z(x,t), not divisible by t, vanishes on that base projection. Such a polynomial is obtained by removing the maximal t-power from any nonzero member of its prime ideal, since t itself is not in that prime. Its t=0 specialization is nonzero. Components supported at t=0 never contain a maximizer with t>0. Shrinking B around a generic real point and reducing eta excludes all other nondominant base projections, by the same constant-coefficient argument used in Section 3.

Every remaining projected closure H_Z is irreducible of dimension exactly n+1: it dominates the (n+1)-dimensional (x,t)-base, while (4) bounds its dimension by n+1. It is consequently a hypersurface in (x,t,y)-space, with an irreducible equation H_Z(t,x,y). It is not divisible by t and has positive degree in y.

For every x in the resulting real box and every sufficiently small positive t,

```math
\prod_Z H_Z(t,x,h_t(x))=0.
```

Uniform convergence gives the polynomial identity

```math
\prod_Z H_Z(0,x,f(x))=0
```

on a real open set, hence identically over C. Therefore the irreducible graph polynomial y-f(x) divides H_Z(0,x,y) for at least one remaining Z. No circuit size bound is asserted for H_Z.

## 7. A component version of the degeneration lemma

The preceding Z is an actual irreducible component of a small total-space incidence Gamma_I(t,x,y,w). It dominates the hypersurface H_Z(t,x,y), which dominates (t,x). Its central equation is nonzero and contains y-f(x).

For all but finitely many nonzero t=tau, every component of Z_tau is an actual component of (Gamma_I)_tau. To check this, intersect Z with the finitely many other components of Gamma_I. Each intersection has dimension at most dim Z-1. On an intersection component where t is nonconstant, a generic t-fiber has dimension at most dim Z-2. A component where t is constant contributes only one exceptional parameter. Each nonempty component of Z_tau has dimension dim Z-1 by the principal ideal theorem for the nonconstant regular function t-tau on the integral variety Z. Thus it cannot be contained in another total component's tau-fiber for generic tau.

The image of Z contains an open dense subset of H_Z. The omitted closed subset has dimension at most n. For generic tau its intersection with H_Z,tau has dimension at most n-1, while each hypersurface fiber component has dimension n. Thus every component of H_Z,tau is dominated by a component of Z_tau.

The root-cluster argument in [HYPERSURFACE_DEGENERATION.md](HYPERSURFACE_DEGENERATION.md), Section 2, gives, on a fixed complex polydisc, algebraic holomorphic sheets of H_Z,tau converging to f as tau->0. The preceding generic specialization argument ensures that each such sheet lifts generically to an actual component of the small specialized incidence. Affine witness slices reduce its generic witness fibers to finite fibers. The finite-branch Taylor-jet lemma in [SINGULAR_WITNESS.md](SINGULAR_WITNESS.md), Sections 1–4 and 6, then bounds its order-d Taylor polynomials by a fixed polynomial in n,p,L,d. Choose permissible centers tending to a fixed center, use the fixed-polydisc convergence and Cauchy estimates, and pass to the coefficientwise border limit. The limit is f.

This is the same final argument as the graph-factor degeneration lemma, with its exact-presentation hypothesis replaced by an actual small-incidence component dominating the chosen hypersurface. The component and dominance checks above supply the needed replacement.

## 8. Scope and remaining work

The argument proves the bound for arbitrary finite residual families, including radical-only presentations. The use of real inequalities is an existence argument selecting a small complex algebraic critical incidence. No real comparison is added to the BSS verifier or machine, and no efficient constructor for the selected constraints or constants is claimed.

This does not provide a permanent graph presentation, and it does not prove HN_C hard. It rules out this larger presentation class under the permanent border lower bound. An arbitrary PH_C formula need not be a finite conjunction of small polynomial residual equations with existential parameters; no conversion to that form is established here.

The independent reviews checked the generic regular-value argument in Section 3, the compactness selection in Sections 2 and 4, the passage from finitely many maximizers to a dominant projected component in Section 6, and the actual-component specialization in Section 7.

## 9. Local component form

The same conclusion holds under a weaker hypothesis: some actual irreducible component W of V(E_beta: beta in B) has projected closure equal to the graph of f. Other components may have arbitrary projections. This local extension was checked separately in the full written reviews.

The output coordinate equals f(x) identically on W, since the graph is closed. Choose a smooth point of W, on no other component of the full zero set, where projection to x has differential rank n. Such points form a dense open subset of W. Their image contains a nonempty Zariski-open subset of x-space by dominance and constructibility. Because real points are Zariski-dense in complex affine space, the point can be chosen over a real x=a. Its output y=f(a) is real, while its witness c may be complex.

The holomorphic submersion theorem supplies a local holomorphic section x->(x,f(x),c(x)) through that point. Equivalently, add as many fixed affine witness slices as the generic fiber dimension, transverse to the fiber at the point, and apply the complex inverse function theorem. These slices are used only to prove existence of a local section; they need not be included in the subsequent optimization equations.

There is a product neighborhood of the chosen base point and the witness-output point that meets no other irreducible component of the full zero set. To see this, the finite union of the other components is closed and does not contain the chosen point. Choose a smaller product neighborhood inside its complement. The full common-zero set in that neighborhood is contained in W and therefore has output f(x).

In real coordinates w=(y,Re c,Im c), choose a small closed Euclidean ball around the witness-output point, contained in this neighborhood. Shrink a real open x-box around a so that the local true witness section lies strictly inside a smaller concentric ball. There is now an open interval of radii for which both properties hold. Replace g_0 in Sections 2–7 by the squared distance from this fixed center, and choose R in that interval.

For sufficiently small positive t, the expanded ball g_0<=R^2+t a_0 remains inside the isolating neighborhood. Thus every limit of maximizing feasible points satisfies all the original equations inside the region where only W occurs, and has output f(x). The compactness argument in Section 4 is unchanged. The generic-offset construction, KKT incidences, projected-dimension argument, and central-factor extraction are unchanged as well. The center adds only O(p) constants and gates. This proves the local component form.

The word actual remains essential. An arbitrary subvariety lying on larger components need not have a neighborhood where the full common-zero set has the desired output. The nonlinear many-lines example in [NONLINEAR_BOOLEAN_COMPONENT.md](NONLINEAR_BOOLEAN_COMPONENT.md) is consistent with this claim: its isolated full intersection is an actual component; a small KKT incidence after perturbation, rather than a small original defining subsystem, is used to recover it.

## 10. A finite Boolean universal block

The local component form rules out a larger proposed verification format. Suppose a polynomial graph y=f(x) has a verifier

```math
(x,y)\in G_f
\quad\Longleftrightarrow\quad
\exists c\in\mathbb C^p\ \forall b\in\{0,1\}^m\ V(x,y,c,b)=1,
```

where V is a deterministic complex BSS computation of worst-case cost T, with defined division and equality tests, and f has real coefficients and degree d. Then

```math
\underline L(f)\le\mathop{\mathrm{poly}}(n,p,T,d).
```

Here there is no dependence on the number 2^m of Boolean challenges except through the input length and verifier cost. This is a statement about a finite Boolean universal block. It does not replace that block by arbitrary complex universal quantifiers.

For each Boolean b and each accepting length-T computation path, clear register divisions by storing numerator-denominator pairs. Every path condition becomes a polynomial equality or inequation with circuit size O(T), including the nonzero conditions needed for defined divisions. At fixed input length there are finitely many paths. A full path assignment chooses one accepting path for every Boolean b. The parameter set satisfying one full path assignment is a basic constructible set

```math
S=V(E_\beta:\beta\in B)\cap\bigcap_\gamma D(g_\gamma),
```

where each displayed polynomial has a circuit of size O(T), although there may be exponentially many or more of them. No inverse witnesses are introduced for the inequations.

The union of the finitely many such S is precisely the set of witnesses c that pass every Boolean challenge. Each S projects inside the graph, and their projections cover the graph. Irreducibility of the graph selects one S whose projected closure is the entire graph.

The set S is open in V(E_beta). Its closure is therefore a union of actual irreducible components of that equation variety. Some such component W has projected closure equal to the graph. Indeed, each retained component has a dense open subset inside S; since the graph is closed, its full projection remains in the graph. The finite union of their projected closures equals the graph, so one dominates it. Section 9 now supplies the claimed circuit bound.

Under the imported permanent border lower bound, this excludes polynomial p,T for the permanent graph in the displayed verification format, even with arbitrary complex constants and arbitrary deterministic branching. The conservation identity used by the original critical-incidence proof is unnecessary for this finite-Boolean extension. It still gives no general PH_C separation and no HN_C lower bound.


The result does not cover a verifier of the form `exists c, for every Boolean b, exists complex d`. Expanding that formula over the Boolean challenges generally introduces an independent witness d_b for each b. There can be exponentially many such witness coordinates. The bound above is polynomial in the total witness dimension, so that expansion does not produce the claimed polynomial circuit bound. No compression of those dependent witnesses is supplied.

## 11. Dependencies and review scope

- [SINGULAR_WITNESS.md](SINGULAR_WITNESS.md), Sections 2–4 and 6, proves the finite-branch Taylor-jet estimate and the moving-center limit used here. Its analytic input is Riemenschneider's Chapter 6, Theorem 6.22 and Corollary 6.29: <https://www.math.uni-hamburg.de/home/riemenschneider/bookchap06.pdf>. Those results concern finite holomorphic germs and their coverings away from the discriminant; they do not themselves state this circuit-complexity conclusion.
- [HYPERSURFACE_DEGENERATION.md](HYPERSURFACE_DEGENERATION.md), Section 2, proves the fixed-polydisc root-cluster limit for a central polynomial graph factor. Section 7 above supplies the additional actual-component specialization needed for the present application.
- [CRITICAL_INCIDENCE_BARRIER.md](CRITICAL_INCIDENCE_BARRIER.md), Section 6, proves the characteristic-zero differential-rank fact used in Sections 3 and 5. The generic-offset argument is proved here, rather than assumed as a constraint-qualification theorem.
- The Stacks Project, [tag 054K, Theorem 29.23.3, Chevalley's theorem](https://stacks.math.columbia.edu/tag/054K), gives constructibility of the images of the finite-type morphisms used in Sections 7 and 9. In an irreducible target a dense constructible image contains an open dense subset. The page and theorem number were checked on 23 November 2026. [Tag 02NV, Section 29.52](https://stacks.math.columbia.edu/tag/02NV), records the generic finiteness facts used after witness slicing.
- Bürgisser, arXiv:1812.06828v1, Theorem 2.4, supplies the coefficientwise-closure characterization of border complexity used by the linked Taylor-jet lemma: <https://arxiv.org/html/1812.06828v1>.

The compactness, nested-ball, finite-active-set, differential-dimension, and generic-specialization arguments are supplied in this note. The permanent application additionally uses the pinned lower bound adopted by the repository. This note establishes an obstruction to the displayed certificate formats. It does not prove the requested complex BSS separation, and the distinction between Bürgisser's 2026 Theorem 1.1 and Conjecture 1.1 is unchanged.

The later [block critical-point argument](BLOCK_KKT_FINITE_EXISTENTIAL_EXTENSION.md) overcomes the exponential witness-array obstacle for an additional complex existential block after a finite Boolean challenge. It uses separate compact balls and selects whole multiplier blocks in the shared-coordinate space. This extension requires that each local witness block occur only in its own challenge constraints. Arbitrary complex universal challenges remain outside both arguments. The [bounded-counterexample cutoff example](CONTINUOUS_QUANTIFIER_CUTOFF_FAILURE.md) records a failed shortcut for that remaining case.
