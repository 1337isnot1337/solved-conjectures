# Singular existential graph presentations and border circuits

Status: written lemma independently reviewed by the weighted-protocol and incidence-route agents. No novelty is claimed. The argument imports the standard finite-holomorphic-map theorem specified in Section 8. It has not been formalized. It does not prove `P_C != NP_C`.

The point of this note is to distinguish an existential incidence whose image is a graph from an existential incidence with a dense image whose *missing boundary* is a graph. This note covers the first situation. The separately proved [dense-boundary theorem](DENSE_BOUNDARY_BARRIER.md) covers the second.

## 1. Statements and complexity convention

All varieties and circuits are over `C`. Circuit size counts arithmetic operations; permitting all scalar constants for free changes comparisons with the pinned permanent lower bound by only the number of input and constant gates used. A multi-output division-free circuit is shared across its outputs. We write `Lbar` for border arithmetic circuit complexity over `C`.

Let `x=(x_1,...,x_n)` and `z=(z_1,...,z_r)`, and let

```math
V=V(Q_1,\ldots,Q_q)\subseteq\mathbb C^{n+r}
```

where the `Q_i` have a common circuit of size `s`. Assume that an **irreducible component** `W` of `V` dominates `C^n` under projection to `x`. Assume also that the coordinate `z_1` on `W` agrees with a rational function `h(x)` in `C(x)`. The word component is essential: an arbitrary subvariety of the zero set would not suffice.

**Jet lemma.** For every integer `D>=0`, there is a nonempty Zariski-open subset of `C^n` such that, at every center `a` in that subset, the degree-`D` Taylor polynomial

```math
J^D_a h(x)
=\sum_{|\alpha|\le D}
\frac{\partial^\alpha h(a)}{\alpha!}(x-a)^\alpha
```

has border complexity bounded by one fixed polynomial in `s,q,n,r,D`. The bound does not involve the degrees of the `Q_i`, the degree of `h`, the degree of `W`, the multiplicity of `W` in the equation system, or the generic number of witnesses.

**Polynomial graph corollary.** If `h=f` is a polynomial of degree at most `d`, then

```math
\underline L(f)\le \mathop{\mathrm{poly}}(s,q,n,r,d).
```

The same conclusions hold for a constructible incidence described by equations and inequations. Replace an inequation `g!=0` by `ug-1=0` with a new witness coordinate. The number of equations, witnesses, and gates grows polynomially.

All points, slicing coefficients, inverse matrices, and root coordinates introduced below are allowed complex circuit constants. Their effective computation is not asserted or needed for this nonuniform upper bound.

**Finite-branch jet variant.** The same jet bound holds if `dim W=n`, projection `W→C^n` is dominant, and `h` is the first coordinate of any one holomorphic local inverse `xi:U→W` of that generically finite projection. In this variant `h` may be algebraic rather than rational. Permissible generic Taylor centers can be chosen in every nonempty sub-polydisc of `U`. The branch must be a local inverse of this finite-dimensional component; an arbitrary holomorphic section of a component with positive-dimensional fibers would not suffice. The proof below explains this variant at the end of Section 4.

## 2. Reduction to an isolated square witness system

Write `dim W=n+t`. On a nonempty open subset of the reduced variety `W`, the variety is smooth and the projection to `x` has differential rank `n`. To see the rank assertion, the algebraically independent coordinates `x_1,...,x_n` can be extended to a transcendence basis of `C(W)`; in characteristic zero their differentials are linearly independent. Some corresponding Jacobian minor is therefore nonzero on a nonempty open set. Choose a point of this set that lies on no other irreducible component of `V` and at which `h` is regular.

Choose `t` affine linear equations in the witness coordinates, with differentials independent on the `t`-dimensional kernel of this projection. Near the chosen point, their intersection with `W` is a smooth `n`-dimensional submanifold `W'`, and projection from `W'` to `x` is a local biholomorphism. Globally, choose the irreducible component of the sliced zero set containing this local submanifold. It dominates `C^n`; the dominance follows already from the nonempty analytic open set in its image. Its local coordinates have the form

```math
z=\xi(x),\qquad \xi_1(x)=h(x).
```

The slicing adds at most `r` affine equations, at cost `O(r^2)`. At a generic point of `W'`, the full sliced system has only this reduced component locally. Denote the sliced equations by `P_1,...,P_{q+t}`.

We next choose `r` constant linear combinations of the `P_i`. At a point `(a,b)` where `W'` is the local graph above, the equations `P_i(a,z)=0` have an isolated zero at `b`. Thus their ideal in the local analytic ring `C{z-b}` is primary to its maximal ideal. One can choose

```math
H_j(x,z)=\sum_i c_{ji}P_i(x,z),\qquad 1\le j\le r,
```

such that `H(a,z)=0` also has an isolated zero at `b`. Here is the elementary prime-avoidance argument. At each stage, the current zero set has finitely many positive-dimensional irreducible germs. None can be contained in the zero set of every `P_i(a,z)`, since that common zero is isolated. For each such germ, the linear combinations vanishing identically on it form a proper linear subspace of the coefficient space. Choose coefficients outside the finite union of these subspaces. The dimension drops by one on each positive-dimensional component. After `r` choices only an isolated germ remains.

The algebraic zero set `V(H)` contains `W'`. The isolated fiber at `(a,b)` implies that its local dimension there is at most `n`; since it is defined by `r` equations in `n+r` variables, all local components have dimension at least `n`. Consequently `W'` is an irreducible component of `V(H)`. There may be other components. Move to a generic point of `W'` outside their intersections. Near that point the *reduced* zero set of `H` is exactly `W'`, and therefore is the graph `z=xi(x)`. No assertion that the equations are reduced, or that their witness Jacobian is invertible on this graph, has been made.

The common circuit size of `H` is

```math
S=O\bigl(s+r(q+r)\bigr).
```

## 3. A perturbation with a fixed input neighborhood

Consider the polynomial map

```math
\Phi:\mathbb C^{n+r}\longrightarrow\mathbb C^{n+r},
\qquad \Phi(x,z)=(x,H(x,z)).
```

At a point `(a,b)` selected above, `(a,b)` is isolated in the fiber over `(a,0)`. The finite-holomorphic-map theorem therefore supplies a finite proper representative of this map germ. Its image contains a neighborhood of `(a,0)`. Here finiteness means properness with finite fibers. The reduced central fiber over `(x,0)` in this representative is the single point `(x,xi(x))`, after shrinking the neighborhood in `x`.

In particular `Phi` is dominant. In characteristic zero it is generically finite and generically unramified. Equivalently, the polynomial

```math
J(x,z)=\det\partial_zH(x,z)
```

is not identically zero. The algebraic critical set `V(J)` has dimension at most `n+r-1`, so the Zariski closure of its image under `Phi` is a proper algebraic subset of the target. Choose a nonzero polynomial `Delta(x,v)` vanishing on that closure. Its degree and circuit size are irrelevant to this existence argument.

Choose a constant vector `c` such that `Delta(x,epsilon c)` is not the zero polynomial. Such a vector exists: expand `Delta` into its homogeneous parts in `v`; at least one part remains nonzero after a suitable constant specialization of its direction. Write

```math
\Delta(x,\epsilon c)
=\epsilon^k\bigl(\Delta_0(x)+\epsilon\Delta_1(x)+\cdots\bigr),
\qquad \Delta_0\ne0.
```

We may move the base point again, within the good open set of `W'`, so that `Delta_0(a)!=0`. The projection of that good set contains a nonempty Zariski-open set `O` in `C^n`. Replace `O` by its nonempty intersection with `D(Delta_0)`. For every center in this intersection choose a good point of `W'` lying over it and a new finite representative of `Phi` there. This supplies the open set claimed in the jet lemma. Work in a sufficiently small closed polydisc around the selected center, contained in the neighborhood of its finite representative and in the holomorphic domain of `xi`.

Choose a slightly smaller polydisc `U` with compact closure, on which `Delta_0` is bounded away from zero. Since the remaining expression is a polynomial, for all sufficiently small nonzero `epsilon`,

```math
\Delta(x,\epsilon c)\ne0\qquad(x\in\overline U).
```

For such `epsilon`, the portion of

```math
H(x,z)=\epsilon c
```

in the chosen finite representative is a nonempty finite unramified covering of `U`. It is nonempty because the local finite map is surjective onto a neighborhood of `(a,0)`. It is a covering because it is proper and every point has invertible witness Jacobian. The polydisc `U` is simply connected, so each sheet is the graph of a single-valued holomorphic function

```math
Z_\epsilon:U\longrightarrow\mathbb C^r.
```

Choose any sheet. As `epsilon` tends to zero these functions converge uniformly on compact subsets of `U` to `xi`. Here is a direct proof, without exchanging an unjustified pair of limits. Fix a compact `K` contained in `U`. The inverse image under the proper finite representative of

```math
K\times\{\epsilon c:|\epsilon|\le\epsilon_0\}
```

is compact for sufficiently small `epsilon_0`. If uniform convergence failed, there would be points `x_j` in `K`, numbers `epsilon_j` tending to zero, and corresponding roots whose distance from `xi(x_j)` stayed bounded below. A convergent subsequence would limit to a root of `H(x,z)=0` in the chosen representative. That central root is uniquely `z=xi(x)`, a contradiction. This proof works for any choices of the sheets as the parameter varies.

The neighborhood and convergence bounds may depend on all the original equations. Their radii, local degree, and multiplicities have no role in the circuit-size estimate.

## 4. Circuits for bounded Taylor jets

Fix one sufficiently small nonzero `epsilon`. Let `b_epsilon=Z_epsilon(a)` and let

```math
J_\epsilon=\partial_zH(a,b_\epsilon).
```

This matrix is invertible. Substitute `x=a+tX`, and calculate the formal solution of

```math
H(a+tX,z)=\epsilon c
```

modulo `t^(D+1)`, with constant term `b_epsilon`. Truncated Newton iteration computes it in `O(log(D+2))` rounds. If an iterate has residual of order at least `e`, subtracting the inverse Jacobian times that residual cancels the error through order `2e-1`. The constant term of the Jacobian remains `J_epsilon` throughout.

Each truncated series has `D+1` coefficient polynomials in `X`. Addition costs `O(D+1)` gates and multiplication by convolution costs `O((D+1)^2)`. Forward differentiation of the circuit for `H` computes all witness derivatives with `O(Sr)` gates. A matrix `J=J_epsilon+E` with `E` of positive `t`-order can be inverted modulo `t^(D+1)` using

```math
J^{-1}
=\left(\sum_{j=0}^{D}(-J_\epsilon^{-1}E)^j\right)J_\epsilon^{-1}.
```

The entries of `J_epsilon^{-1}` and `b_epsilon` are scalar circuit constants. Ordinary matrix multiplication and convolution give, for example, a bound of the form

```math
B(S,n,r,D)
=O\!\left(n+
\left(Sr(D+1)^2+r^3(D+1)^3\right)\log(D+2)\right)
```

for the circuit computing the degree-`D` Taylor polynomial of the first coordinate of `Z_epsilon`, after translating back from `X=x-a`. Adjusting the absolute constant handles `D=0`. No bound on `deg H` enters: we evaluate the original circuit at truncated series.

Uniform convergence on compact subsets of `U` and the multivariate Cauchy integral formula imply convergence of every derivative of order at most `D` at `a`. These Taylor polynomials therefore converge coefficientwise to `J^D_a h`. They all have size at most `B`. Bürgisser's Theorem 2.4, over `C`, identifies this coefficientwise closure with border complexity. This proves the jet lemma. Taking `D=d` proves the polynomial graph corollary.

For the finite-branch variant, start with the given `n`-dimensional component and its local inverse; no initial witness slicing is needed. Choose the square combinations and discard other components exactly as above. Each bad algebraic subset of this component has dimension less than `n`; its projection has closure of dimension less than `n`. Thus generic permitted centers meet every sub-polydisc on the selected inverse branch. The perturbation converges to this branch, and the Taylor-jet calculation uses only its local holomorphic first coordinate, not rationality. Every step and the same complexity bound therefore apply.

## 5. From existential BSS verifiers to the hypothesis

Suppose membership in the graph of a polynomial `f:C^n→C` is accepted by a nondeterministic complex BSS computation tree of depth `T`, with at most `w` witness coordinates and arbitrary fixed complex constants. There are finitely many accepting paths. Each path is a constructible set in `(x,y,witnesses)`, and its projection is contained in the graph. Since the graph is irreducible and the finitely many projected constructible sets cover it, one path has projection dense in the graph.

Encode that path by its straight-line computation transcript. Introduce a coordinate for each register value produced along the path. For addition and multiplication use the equations `v-a-b=0` and `v-ab=0`. For division `v=a/b` use `bv-a=0` and `bu-1=0`. Encode each nonzero branch by an inverse witness; encode each zero branch by its zero equation. The resulting system has `O(T+n+w)` variables, equations, and circuit size up to a polynomial overhead for the chosen BSS register model. Its projection is exactly the accepting path's projected set.

Some irreducible component of this zero set has projection dense in the graph. Each component's projection is contained in the graph because every equation solution encodes a valid accepting computation with every required denominator nonzero. Choose the component with dense projection and take `z_1=y`. It satisfies Section 1.

Consequently a polynomial-degree family whose graphs have polynomial-size existential complex BSS presentations has polynomial border complexity. Conditional on the pinned permanent border lower bound, the permanent graph therefore has no such polynomial-size existential presentation. This conclusion is nonuniform, permits arbitrary complex constants, and includes uniform `NP_C` as a special case.

This does **not** separate `P_C` from `NP_C`. A language can lie outside both classes. In particular the conclusion rules out the graph-in-`NP_C` shortcut; it supplies no language in `NP_C` outside `P_C`.

## 6. Limits of high-degree rational outputs

The bounded Taylor order in the jet lemma allows a further useful consequence. Let `h_j` be rational functions, holomorphic on one fixed nonempty polydisc `U`, converging locally uniformly to a polynomial `f` of degree at most `d`. Suppose for each `j` an incidence as in Section 1 presents `h_j`, with the same bounds `s,q,n,r`, even if the degrees of `h_j` are unbounded.

Choose a point `a` in `U`. For each `j`, choose a permissible generic Taylor center `a_j` within distance `1/j` of `a`. This is possible because its permissible set contains a nonempty Zariski-open set and hence meets every complex open ball. Shrink the balls so they remain in `U`. Cauchy estimates on a fixed smaller neighborhood of `a` show convergence of the derivatives of `h_j` at `a_j` to the corresponding derivatives of `f` at `a`. Therefore

```math
J^d_{a_j}h_j\longrightarrow f
```

coefficientwise after translating each Taylor polynomial back to the original `x` variables. Every term has border size at most the same `B`. The size-`B` border class is closed, by its definition or Bürgisser's Theorem 2.4. Hence `Lbar(f)<=B`.

There is no need for one incidence neighborhood or one perturbation to work simultaneously for all `j`. The limits are composed by closedness, and the circuit bound is uniform.

### Application to the six-resultant filter target

The weighted-protocol note constructs

```math
F_n(t,X,y)=S(t,A_m(X))-yS(t,A_m(I_n))
=t^s\bigl(\kappa(\mathop{\mathrm{per}}_n(X)-y)+tB_n(t,X,y)\bigr),
\qquad\kappa\ne0.
```

For every sufficiently small nonzero `tau`, the denominator `S(tau,A_m(I_n))` is nonzero. The zero set of `F_n(tau,X,y)` is exactly the graph of

```math
h_\tau(X)=
\frac{S(\tau,A_m(X))}{S(\tau,A_m(I_n))}.
```

These functions converge locally uniformly in `X` to `per_n(X)` as `tau` tends to zero: cancel the common `tau^s`; the denominator tends to the nonzero scalar `kappa`, and the numerator is a polynomial in `(tau,X)` tending to `kappa per_n(X)`.

If `V(F_n)` had polynomial-size existential complex BSS presentations, specializing `t=tau` would give presentations of all these graphs with the same size bound. Section 6 would give polynomial border circuits for the permanent. Subject to the imported permanent border lower bound, such existential presentations cannot exist. Thus the proposed six-resultant incidence accepting the zero set is excluded already by the lower bound; assuming `HN_C` in `P_C` adds nothing to that obstruction.

## 7. What the argument does not cover

The hypothesis concerns a component of an existential incidence whose projection is the desired graph. It does not concern a graph merely contained in the closure of a dense image. In a dense existential set with a missing hypersurface, generic witness components can dominate the whole ambient space; there need be no component projecting to the missing hypersurface.

Likewise, this argument does not place the permanent graph in a fixed higher level of the complex polynomial hierarchy, eliminate universal quantifiers, or prove an upper bound for the size of a decision tree for `HN_C`. It does not show that every boundary component of an `NP_C` language has a small border circuit.

The distinction is visible already in one witness equation. The set defined by `exists u: u g(x)-1=0` is the dense open complement of `V(g)`. The incidence component projects densely to the whole input space. The missing hypersurface `V(g)` is not an image component to which the jet lemma could be applied.

## 8. Imported results and version record

1. Peter Bürgisser, *The Complexity of Factors of Multivariate Polynomials*, arXiv **1812.06828v1**, 17 December 2018. Theorem 2.4 identifies approximative complexity with the Zariski closure of bounded-size straight-line programs, and over `C` with the ordinary coefficientwise closure. URL: <https://arxiv.org/html/1812.06828v1>. This is the only complexity theorem required by the singular-witness argument itself. The permanent lower bound is a separate conditional input to its applications.

2. Oswald Riemenschneider, online singularities manuscript, Chapter 6, *Dimension and multiplicity*, **Theorem 6.22**, printed pages 155–156: an isolated point in the fiber of a holomorphic map germ is equivalent to finiteness of that germ. **Corollary 6.29**, printed page 160, supplies the local covering away from a discriminant and openness. URL: <https://www.math.uni-hamburg.de/home/riemenschneider/bookchap06.pdf>, online file consulted 23 November 2026. The chapter is undated and has unfinished cross-references; no publication or revision date is inferred. The numbered finite-map statements were inspected in the author's hosted text. The rest of Section 3 proves the parameter-uniform specialization needed here.

3. Generic smooth points, the rank criterion for a dominant map in characteristic zero, the dimension of a polynomial image, and the multivariate Cauchy integral formula are standard background facts used as stated. The local reduction and the new complexity implications are proved in Sections 2–6.

Review status: the local finite-map mechanism was independently checked in discussion by the incidence-route agent and the parent. The weighted-protocol agent and the incidence-route agent then independently reviewed Sections 2–6, including the NP-verifier conversion and moving-center limit, and reported no gap. The incidence-route review supplied the explicit open-set and Jacobian-constant-term wording now included above. The finite-branch variant records the locality already used in the reviewed proof. This is written mathematical review; no Lean or other formal verification is asserted. No claim of novelty or of a completed separation is made.
