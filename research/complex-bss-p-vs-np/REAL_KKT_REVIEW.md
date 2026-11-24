# Independent review of the real critical-point extension

Review status: Sections 1–8 of `REAL_KKT_RADICAL_EXTENSION.md` survived two independent adversarial passes. Sections 9–10 then received the separate review recorded in Section 8 below and also passed. The statements remain presentation obstructions. They are not a separation of the BSS decision classes, and no novelty or formal-verification claim is made.

## 1. Exact hypotheses reviewed

The target f is a real-coefficient polynomial of degree d. The variables x,y range over the complex numbers in the original presentation, and c is a tuple of p complex witnesses. A finite, possibly enormous family of residual polynomials E_beta has individual circuit size at most L. Their common-zero incidence projects exactly onto the graph y=f(x).

The proof concludes a border circuit bound polynomial in n,p,L,d. It does not charge the cardinality of the finite residual family. This independence is supported by selecting one active set of at most 2p+1 constraints after the existence argument. Only that set's constants and circuits enter the final small incidence.

The real-coefficient assumption is sufficient for the permanent. The reviewed proof restricts the input x and output y to real values before optimization. Its complex algebraic conclusion follows from polynomial identity on a real open set. It does not use complex conjugation as an operation of a BSS machine.

## 2. Bounded witnesses and compactness

The Baire step is valid. On a closed real input box K, the subset K_r of inputs with a witness of norm at most r is closed. A convergent input sequence admits a convergent witness subsequence in that compact ball; the finitely many residual equations pass to the limit. The K_r cover K, so one has nonempty relative interior. Every nonempty relatively open subset of a full-dimensional closed box meets its ordinary interior, allowing a smaller real open box whose closure still has the witness bound.

The output f is bounded on that smaller closed box. Consequently one fixed witness-output ball contains a true witness strictly inside it for every input there. The radius can vary in a nonempty interval, which supplies the freedom required by the subsequent generic choice.

The approximate feasible sets are closed and bounded, hence compact, and contain a true witness. Their maximum output exists. If these maxima failed to converge uniformly to f, a violating sequence of inputs and maximizing witnesses would have a convergent subsequence. Every residual would vanish at its limit, contradicting graph soundness. No continuity of the maximizer or selection of one maximizing witness as a function is needed.

## 3. Generic regularity of every active set

For each subset I of constraints, the map

```math
(x,w)\longmapsto(x,F_I(x,w))
```

has differential rank equal to n plus the rank of the w-gradients of its selected constraints. If the map is dominant, every irreducible component of its critical locus has projected dimension smaller than the target dimension: restrict the differential to that component and use the characteristic-zero equality of generic differential rank and image dimension. If the map is nondominant, its full image already lies in a proper algebraic subset. Thus a nonzero polynomial vanishing on the bad values exists in both cases. Properness of this map is unnecessary.

The specialization of its level coordinates to t times positive offsets, with the ball coordinate equal to R squared plus t times a positive offset, is not identically forced into that bad polynomial. At t=1 the offsets and radius vary over real open sets of level coordinates. A nonzero polynomial cannot vanish on the whole of such a set. The finitely many choices of I can therefore be handled simultaneously. Their number can be enormous; the argument is existential and no large product is subsequently computed in a circuit.

After removing the largest common t-power from the finite product of bad-value polynomials, its leading coefficient is a nonzero polynomial in x. A real input box can be chosen away from its zero set. Compactness of that box gives one positive upper bound on t for which no bad value occurs anywhere on the box. This is the required fixed-domain statement. In particular all active gradients are independent and at most 2p+1 constraints are active.

Asymptotic critical values do not create a missing case: optimization takes place in the explicitly bounded witness-output ball, and the regularity claim concerns all finite points at the chosen levels.

## 4. Normalized critical incidences

At a maximum, the manifold where the active constraints stay equalities is locally feasible because every inactive constraint remains strict. The objective's differential vanishes on its tangent space. Linear independence of active gradients gives the displayed normalized multipliers. Nonconvexity causes no problem for this argument, and no sign condition on the multipliers is needed for the subsequent algebraic incidence.

The active set cannot be empty because the objective gradient is nonzero. The number of selected residuals, multipliers, and stationarity equations is polynomial in p. Real and imaginary parts of each original residual have circuits of size O(L), and gatewise differentiation has polynomial overhead. The final active-set incidence therefore has the claimed small complex algebraic description.

On every reduced irreducible component, weighting the active equations' differentials by the multipliers gives

```math
dy+\sum_j A_j\,dx_j-B\,dt=0.
```

This bounds the projected dimension in (x,t,y) by n+1. It applies to all complex components, including components with no real maximizing points. Extra complex components therefore cannot make the projected closure fill the whole ambient (x,t,y)-space.

## 5. No fixed active subset or holomorphic maximum is assumed

The maximizer may change active set and algebraic component as x and t vary. The draft avoids needing a fixed selection. There are finitely many projected components. Those not dominating the (x,t)-base can all be excluded on a smaller fixed box times a sufficiently short positive interval. For a component not confined to t=0, a nonzero polynomial of its base-image ideal can have its largest t-power divided out, because that ideal is prime and does not contain t. Its nonzero t=0 specialization supplies the required fixed-box exclusion.

Every remaining projected closure is an irreducible hypersurface dominating (x,t). The product of their defining equations vanishes at every maximum. Passing to the uniform limit gives a polynomial vanishing on (x,f(x)) over a real open set, hence identically. The graph polynomial therefore divides the t=0 specialization of at least one of the hypersurface equations.

There is no assertion that a real maximizing branch itself extends holomorphically to a common complex polydisc. The existing algebraic root-cluster lemma supplies complex holomorphic sheets only after selecting the hypersurface with the initial graph factor. This distinction removes a potential fixed-domain gap.

## 6. Actual components after specialization

The selected total-space source Z is an actual component of a small active-set incidence. Its intersections with other components have dimension at most dim Z minus one. At a generic t-value, their nonvertical fibers have dimension at most dim Z minus two; vertical components contribute only finitely many exceptional values. Each nonempty irreducible component of Z at that t-value has dimension dim Z minus one. It cannot be contained in another total component's fiber and therefore remains an actual component of the small specialized incidence.

Dominance onto the selected hypersurface implies that the projected image contains a dense open subset of that hypersurface. Its omitted closed complement has dimension at most n. Outside finitely many t-values its fibers have dimension at most n-1, while every hypersurface fiber component has dimension n. Every such component is therefore dominated by a component of the specialized source.

These are exactly the component and generic-lifting hypotheses needed to apply the already reviewed root-cluster and finite-branch Taylor-jet lemmas. Their common complex polydisc and moving-center argument give the final border limit. No equations for the elimination hypersurface, discriminant, or large genericity product need to be computed.

## 7. Limits of this approval

The approved statement concerns a finite conjunction of polynomial residual equations with polynomially many complex existential parameters and small individual residual circuits. It is stronger than the earlier conservation-identity obstruction because radical-only soundness is permitted.

It supplies no permanent-graph definition of that form and no separation of P_C from NP_C. It also does not by itself cover an arbitrary universal quantifier over a complex continuum, where infinitely many active constraints and parameter selection require different arguments.

The proof uses real inequalities and compactness only to select a small complex algebraic incidence nonuniformly. No real order test is inserted into the original complex BSS verifier. No uniform algorithm for selecting the offsets, active set, component, or border-circuit constants is asserted.

## 8. Separate review of the local and finite-Boolean extensions

The local component form in Section 9 is valid under its actual-component hypothesis. The smooth locus where projection to x is a submersion, with all other full-variety components removed, is a nonempty Zariski-open subset of W. Its projected image contains an open subset of x-space. That open subset meets real x-space, because real points are Zariski dense. The target f has real coefficients, so its output is real there even though its witness coordinates may be complex.

A local holomorphic section through the chosen good point supplies true witnesses near that input. The complement of the other components contains a product neighborhood. One may choose a closed real witness-output ball strictly inside the witness factor of this neighborhood, shrink the real input box, and keep the true section inside a smaller concentric ball. There is a nonempty interval of permissible radii. Small expanded balls remain in the isolating neighborhood. Thus every limiting feasible point lies on W and has output f(x), exactly as required by the compactness argument. The argument does not pretend that an arbitrary subvariety inside a larger component can be isolated this way.

The finite Boolean-universal BSS extension in Section 10 is also valid. There are finitely many Boolean challenges and finitely many time-bounded computation paths for each. Fixing one accepting path for each challenge produces a finite family of basic constructible sets in the same polynomially many complex parameters. Every equality and inequation on a path has an individual circuit of size O(T) after gatewise numerator-denominator conversion. No inverse witness is added for every inequation, which would incorrectly increase the witness dimension by the size of the full Boolean domain.

Each basic constructible set is open in its equation variety. Its closure is a union of actual components of that variety, and each retained component has a dense open subset in the constructible set. Since the graph is closed and every feasible point projects into it, the retained components also project into it. A finite family of such images covering an irreducible graph has one dense image. The local component form therefore applies with polynomial witness dimension and individual residual size.

This verifies the claimed obstruction for a prefix consisting of polynomially many complex existential witnesses followed by a finite Boolean universal block and an arbitrary bounded-time deterministic complex BSS predicate. It does not turn an arbitrary complex universal block into a finite one, and supplies no general PH_C collapse.
