# Dense existential images with an omitted polynomial graph

Status: research lemma, independently reviewed by the graph-hardness and incidence-route agents. This is not a proof of the requested BSS separation. It is an obstruction to a proposed route. The analytic Taylor-jet lemma on which it depends is written in `SINGULAR_WITNESS.md`; it has been mathematically reviewed but not formalized. No novelty claim is made.

## 1. Statement and scope

Work over the complex numbers, with arbitrary constants allowed in arithmetic circuits. Let x have n coordinates, let y be one coordinate, and let w have r coordinates. Suppose the q polynomials Q_i(x,y,w) have division-free circuits of total size s. Let W be an irreducible component of their common zero set. Assume:

1. The projection of W to the (x,y)-space is dominant.
2. There is a polynomial f(x) of degree d such that the projected image of W omits a nonempty Zariski-open subset of the graph G defined by y=f(x).

Then f has border circuit complexity bounded by a fixed polynomial in n+r+q+s+d, provided the reviewed finite-branch Taylor-jet lemma is used.

The same conclusion holds for a dense set accepted by a polynomial-size existential BSS verifier if the accepted set omits a nonempty Zariski-open subset of G. There are finitely many accepting computation paths at each input length. Their equations, including inverse witnesses for divisions and nonzero branches, give finitely many polynomial-size closed incidences. Density selects a dominant projected component of one incidence. Every point of that component projects to an accepted point, so the omission hypothesis passes to it.

This is nonuniform: the proof chooses components, scalar coefficients, roots, and Taylor centers separately for each input length. It does not compute these choices. Their number and the circuit sizes are bounded polynomially. Therefore the lemma can be used with a nonuniform border lower bound, but it does not supply a uniform decision procedure.

## 2. Compactification and the boundary divisor

Write N=n+1 and dim W=N+k, where 0<=k<=r. Let Wbar be the closure of W in the product of affine (x,y)-space with projective witness space P^r. Write homogeneous witness coordinates as [w_0:w_1:...:w_r]. The original affine incidence is the chart w_0 nonzero.

Projection from Wbar to affine (x,y)-space is proper, because it is projective. It is surjective: its image is closed and contains the dense projected image of W.

Over the generic point of G the fiber is consequently nonempty. Every point in that fiber has w_0=0. An affine point would belong to W, since W is closed in the affine chart, and would contradict the omission hypothesis.

The nonzero regular function y-f(x) cuts an effective Cartier divisor on the integral variety Wbar. Every irreducible component of its zero set has dimension N+k-1. At least one component B dominates G; every such component has generic fiber dimension k over G. Each such B lies in the witness-infinity divisor w_0=0. Since both B and every component of that divisor have codimension one, B is a component of that divisor.

These facts do not assume any small equation system for Wbar. The compactification is used only in the existence argument.

## 3. Simultaneous witness slicing

Choose k projective hyperplanes in the witness coordinates, with coefficients in the complex numbers. They can be chosen to satisfy all of the following finite sets of genericity conditions.

- On the generic projective fiber of Wbar over the full base, their intersection is a nonempty finite set disjoint from witness infinity. The fiber has dimension k and its infinity subset has dimension at most k-1, because the affine part is dense in that integral generic fiber.
- On every component of the generic projective fiber over G, their intersection is finite. On any selected component B dominating G it is nonempty. These fibers all have dimension k by the divisor calculation.
- The cuts are proper on Wbar and on the intersections of W with each other irreducible component of the original affine zero set V(Q). In particular, the cuts do not force a full-dimensional retained component into an intersection with a different original component.

For each function field of the relevant base stratum, the good tuples of hyperplanes form a nonempty Zariski-open subset of the hyperplane parameter space. Coefficients can still be chosen in the ground field C: a nonzero polynomial with coefficients in a field extension of an infinite field cannot vanish on every tuple from the ground field. There are finitely many conditions, so they can be imposed simultaneously. Successive proper hyperplane cuts reduce dimension by one on every surviving component.

Let B' be an irreducible component of the cut B dominating G. It has dimension N-1 and is generically finite over G. Choose a component W' of the cut Wbar containing B'. It has dimension N.

The component W' dominates the full base. Indeed its projected image is closed because W' is projective over the base, and the image contains G because it contains the image of B'. If its image were proper, irreducibility and the fact that G is a hypersurface would force that image to equal G. Then its generic fiber over G would have dimension one, contradicting the finite generic G-fibers of the sliced Wbar.

The generic full-base fiber of W' has affine witnesses by the first slicing condition. Consequently W'_aff is dense in W'. It is an irreducible component of the explicit affine zero set

```math
Z=V(Q_1,\ldots,Q_q,L_1(1,w),\ldots,L_k(1,w)),
```

where the L_j are the chosen linear forms. To see the component assertion, W'_aff has dimension N. Its possible intersection with another original incidence component has dimension at most N-1 after the generic cuts. It therefore cannot be contained in that other component's cut. Inside W itself it is a component of the proper cut by construction.

The additional circuits for the affine cuts use O(r^2) gates, since k<=r.

## 4. A finite local family at witness infinity

Choose a generic point b of B'. Because B' is generically finite over the polynomial graph G, its projection to x is generically finite and separable. We can choose b so that B' is smooth and locally projects biholomorphically to x-space, and so that b lies on no other component of the infinity divisor on W'.

Choose i with w_i(b) nonzero, and use the projective chart w_i=1. Define

```math
\epsilon=w_0/w_i.
```

The underlying local central set epsilon=0 is precisely the chosen B' branch. It need not be a reduced divisor. Its output coordinate is y=f(x). On this witness chart the map

```math
\Psi=(x,\epsilon):W'\cap\{w_i\ne0\}\longrightarrow\mathbb A^{n+1}
```

has an isolated fiber at b. The finite holomorphic-germ theorem applies also when W' is singular. Since both source and target have dimension n+1, its analytic image has full dimension. Thus there is a finite proper representative onto a neighborhood of (a,0), where a is the x-coordinate of b.

The map is generically finite and separable. The images of its singular source locus and of the critical locus on its smooth part have dimension at most n. Their algebraic closures are proper subsets of the target. Hence they are contained in the zero set of a nonzero polynomial Delta(x,epsilon). Write

```math
\Delta(x,\epsilon)=\epsilon^\ell
   \bigl(\Delta_0(x)+\epsilon\Delta_1(x,\epsilon)\bigr),
\qquad \Delta_0\ne0.
```

Move b generically along B' so that Delta_0(a) is nonzero, and take a fresh finite representative there. There is a fixed small polydisc U in x-space and a positive eta such that, over U, every parameter satisfying 0<|epsilon|<eta avoids the discriminant. The finite proper map over that fixed parameter is an unramified covering of U. Since U is simply connected, it splits into holomorphic sheets.

Let h_epsilon(x) be the y-coordinate of any one such sheet. Properness keeps the selected roots in the same local cluster. At epsilon=0 the reduced central cluster is the single B' branch, whose y-coordinate is f(x). A compactness argument therefore gives

```math
h_\epsilon\longrightarrow f
\quad\text{locally uniformly on }U
\quad\text{as }\epsilon\longrightarrow0.
```

The convergence does not require a consistent choice of sheet as epsilon varies. If it failed on a compact subset, a sequence of offending source points would have a limit in the proper central fiber, whose output must be f at its limiting x-coordinate. That is a contradiction.

The affine witness coordinates may diverge as epsilon tends to zero. Only the compactified local coordinates and the output y enter this convergence argument.

## 5. The small affine equations survive specialization

For each nonzero epsilon, return to the original affine witness chart. The same local branches satisfy the explicit small system

```math
Q(x,y,w)=0,\qquad
L_1(1,w)=\cdots=L_k(1,w)=0,\qquad
\epsilon w_i-1=0.
```

No saturation, projective-closure equations, or computed discriminant is used by this system. The cuts cost O(r^2) gates, and the last equation costs O(1).

It remains to check the component hypothesis of the finite-branch Taylor-jet lemma. The coordinate w_i is nonconstant on W'_aff: it tends to infinity along the selected boundary branch, or equivalently epsilon is nonconstant on its finite local family. For every other irreducible component C of Z, the intersection

```math
E_C=W'_{\mathrm{aff}}\cap C
```

has dimension at most N-1. Consider w_i restricted to each of its finitely many irreducible components. If that restriction is constant, it contributes one exceptional value c. If it is nonconstant, its generic fiber at w_i=c has dimension at most N-2. Generic fiber dimension bounds exclude only a proper algebraic subset of the one-dimensional parameter line, hence only finitely many c.

Outside the resulting finite exceptional set, every nonempty irreducible component of W'_aff intersected with w_i=c has dimension N-1, because it is a nonzero principal fiber divisor on the integral variety W'_aff. It cannot be contained in the corresponding fiber of any other C. It is therefore an irreducible component of the entire small specialized zero set Z intersected with w_i=c.

Taking c=1/epsilon, all but finitely many nonzero parameters have this property. The sheets from Section 4 lie on components that dominate x, because each sheet is defined on the open polydisc U. Those components have dimension N-1=n, exactly as required by the finite-branch Taylor-jet lemma. A sequence of parameters tending to zero and avoiding the finite exception set is enough.

## 6. Border complexity

For each selected epsilon, apply the finite-branch Taylor-jet lemma with Taylor order d to h_epsilon. The incidence size is bounded polynomially in n+r+q+s, independently of epsilon, multiplicity, and elimination degree. Every degree-d Taylor polynomial at a permissible generic center has a border circuit of size

```math
\mathop{\mathrm{poly}}(n+r+q+s+d).
```

Choose permissible centers a_epsilon tending to a fixed point a of U. Such centers exist in every sub-polydisc because the excluded locus is a proper algebraic subset on the selected finite branch. Uniform convergence on a fixed polydisc gives convergence of all derivatives of order at most d by Cauchy estimates, including at the moving centers. Consequently the degree-d Taylor polynomials converge coefficientwise to the degree-d Taylor polynomial of f at a, which is f itself.

The fixed-size border circuit class is closed in the finite-dimensional coefficient space of polynomials of degree at most d. It therefore contains f. This proves the stated bound.

## 7. Jets of an omitted algebraic branch

The polynomial-graph hypothesis can be replaced by an irreducible hypersurface H in the (x,y)-space that dominates x-space. Let h be a chosen local holomorphic branch of H over a polydisc in x-space. Suppose W is dominant over the full (x,y)-space and its projected image omits a nonempty Zariski-open subset of H. Then for every Taylor order D, at permissible generic centers on that branch,

```math
\underline L(J_a^D h)\le\mathop{\mathrm{poly}}(n+r+q+s+D).
```

The bound is independent of the degree of H. This is a bound on a fixed jet, not a bound for the full defining equation of H.

**Proof.** Let g_H be an irreducible defining equation of H. Use g_H in place of y-f(x) in Section 2. It is still a nonzero regular function on the dominant integral source Wbar, so its zero divisor has the same dimensions. Sections 2 and 3 then give a boundary component B' generically finite over H, on a retained component W' dominating the whole base.

Because H is a hypersurface dominating n-dimensional x-space, its projection to x is generically finite. In characteristic zero it is generically separable. At a generic point of the specified holomorphic branch, both H to x and B' to H are locally unramified. A generic point of that H branch lifts to B' because the image of B' contains an open dense subset of H. Choose one lift. The reduced central branch then has output h(x), and the finite-map construction in Section 4 produces h_epsilon converging locally uniformly to h on a fixed smaller polydisc.

The small affine equations and generic-specialization proof in Section 5 are unchanged. Apply their finite-branch Taylor-jet bound with order D. The moving-center Cauchy argument in Section 6 now gives the Taylor polynomial J_a^D h as the coefficientwise limit. No step requires computing g_H or bounding its degree. This proves the displayed bound. For a specified generic center a, permissible centers for the perturbed branches can tend to a; closedness gives the asserted jet at a itself. ∎

## 8. Missing-side hypersurface degenerations

Let F(t,x,y) be a polynomial with F(0,x,y) nonzero, and suppose that y-f(x) divides F(0,x,y), with f of degree at most d. Suppose that, along a sequence of admissible nonzero parameters tau tending to zero, there are polynomial-size closed existential incidences whose accepted sets A_tau are dense in the (x,y)-space and satisfy

```math
A_\tau\cap V(F(\tau,x,y))=\varnothing.
```

The incidence sizes have one bound s,q,r independent of tau; their constants may depend on tau. Exact existential presentations of the complements of those hypersurfaces are a special case. Then

```math
\underline L(f)\le\mathop{\mathrm{poly}}(n+r+q+s+d).
```

**Proof.** The fixed-polydisc root-cluster argument in `HYPERSURFACE_DEGENERATION.md`, Section 2, applies to F without any circuit bound on F. It supplies holomorphic algebraic sheets h_tau with locally uniform limit f. Each sheet lies on a hypersurface component H_tau dominating x-space.

Density of A_tau selects a dominant component of one of its accepting-path incidences. Its projected image omits H_tau, so Section 7 applies to the selected sheet. Its degree-d jets at generic centers therefore have one polynomial border-size bound, independent of tau and of the degree of H_tau. Moving the centers to a fixed center and passing to the locally uniform limit gives f, as in Section 6. ∎

It is enough for A_tau to omit a nonempty Zariski-open subset of the selected H_tau, rather than the entire zero set. The stronger displayed omission is convenient because it avoids having to specify in advance which root-cluster sheet is selected. This corollary still does not assert anything about arbitrary higher-quantifier predicates.

## 9. Consequences and limits

Subject to the pinned permanent border lower bound, no polynomial-size existential incidence can have a dense accepted image that omits a nonempty Zariski-open subset of the permanent graph. The same lower bound already excludes an existential incidence accepting that graph, by the original singular-witness argument. Thus both direct existential graph acceptance and a dense existential set with that omitted graph boundary encounter an arithmetic-circuit obstruction.

More explicitly, write NP_C(nu) for polynomial-size nondeterministic complex BSS computation trees with arbitrary complex constants, and define coNP_C(nu) by complementation. If the permanent graph were in NP_C(nu), SINGULAR_WITNESS.md, Section 5 would imply polynomial border circuits. If it were in coNP_C(nu), its complement would be a dense NP_C(nu) set omitting the graph; Section 1 would imply the same circuits. The imported lower bound excludes both possibilities. Uniform NP_C and coNP_C are included in their nonuniform counterparts, so the corresponding uniform nonmembership conclusions follow as well.

The lemma does not establish the requested P_C versus NP_C separation. It gives no existential verifier for a hard language. Its hypothesis that the omitted component is a polynomial graph with polynomially bounded output degree matters. General elimination boundaries can have exponentially large degree, and a hard coefficient of such a boundary is not automatically a low-degree graph degeneration.

## Primary references used in the geometry

- Riemenschneider, Chapter 6, Theorem 6.22 and Corollary 6.29: finite holomorphic germs from isolated fibers and coverings away from a discriminant. https://www.math.uni-hamburg.de/home/riemenschneider/bookchap06.pdf
- Stacks Project, tag 01WC: projective morphisms are proper. https://stacks.math.columbia.edu/tag/01WC
- Stacks Project, tag 02RK: components of an effective Cartier divisor on an integral variety have dimension one less. https://stacks.math.columbia.edu/tag/02RK
- Stacks Project, tag 02NV: generically finite morphisms. https://stacks.math.columbia.edu/tag/02NV

The generic-cut and generic-specialization arguments are supplied above; these references do not by themselves state the circuit-complexity conclusion.
