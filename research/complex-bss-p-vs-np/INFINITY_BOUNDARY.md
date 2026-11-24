# Dense projections and witnesses at infinity

Status: research note. The examples and the sufficient criterion below are proved. A separately reviewed compactification argument now excludes the dense omitted-graph presentation itself, conditional on the imported permanent border lower bound; see the final section. No BSS separation is proved.

The positive incidence route tries to project an existential set onto the permanent graph. A distinct route would start from an existential set whose projection is dense and whose missing hypersurface is the permanent graph. In that setting, a missing input has no affine witness. Compactness suggests looking for a witness at infinity. Two different obstructions must be handled: individual homogenized equations can acquire spurious components, and even the true projective closure can have witnesses at infinity over every ordinary feasible input.

## 1. Two quadratic equations already defeat naive homogenization

Let `t` be the input parameter and `u,v` be existential witness variables. Consider

```math
tu-1=0,\qquad v-u^2=0.
```

There is a witness exactly when `t != 0`; then it is unique:

```math
u=t^{-1},\qquad v=t^{-2}.
```

Compactify only the witness variables, over the unchanged affine parameter line, using `[U:V:W]` with `u=U/W`, `v=V/W`. Homogenizing the two displayed equations separately gives

```math
tU-W=0,\qquad VW-U^2=0.
```

At `W=0`, the point `[U:V:W]=[0:1:0]` satisfies both equations for every complex `t`. Thus

```math
\exists[U:V:W]\in\mathbb P^2:
W=0,\quad tU-W=0,\quad VW-U^2=0
```

is true for every input. It does not distinguish the genuinely missing input `t=0`.

The true projective closure is instead

```math
tU-W=0,\qquad tV-U=0.
```

Indeed these equations force `V != 0` in projective space and give the parametrization

```math
[U:V:W]=[t:1:t^2].
```

Its points at infinity occur exactly at `t=0`.

This discrepancy is precisely saturation. In `C[t,U,V,W]`, set

```math
J=(tU-W,VW-U^2),\qquad K=(tU-W,tV-U).
```

Then

```math
W(tV-U)=t(VW-U^2)+U(tU-W),
```

so `K` is contained in `J:W^infinity`. Conversely `J` is contained in `K`, and the quotient by `K` is the domain `C[t,V]`, in which `W=t^2V` is nonzero. Hence `K:W^infinity=K`, proving

```math
J:W^\infty=K.
```

The needed equation is not obtained by merely setting the homogenizing variable to zero in the original equations.

## 2. Repeated squaring gives exponential escape order

For an integer `r>=1`, introduce `r+1` witnesses and only `r+1` equations:

```math
tu_0=1,\qquad u_{i+1}=u_i^2\quad(0\le i<r).
```

The verifier uses `O(r)` arithmetic operations and equality tests. The projection is still `t!=0`, and its unique witnesses satisfy

```math
u_i=t^{-2^i}.
```

The individual relative homogenizations in `[U_0:...:U_r:W]` are

```math
tU_0-W=0,\qquad U_{i+1}W-U_i^2=0\quad(0\le i<r).
```

At `W=0` these equations force `U_0=...=U_{r-1}=0` but leave `U_r` nonzero. Thus the same point

```math
[U_0:\cdots:U_r:W]=[0:\cdots:0:1:0]
```

is a spurious solution at infinity for every `t`.

The true projective closure is the graph of the regular map

```math
t\longmapsto
[t^{2^r-1}:t^{2^r-2}:t^{2^r-4}:\cdots:1:t^{2^r}].
```

This map is defined at every `t` because its `U_r` coordinate is one. Its graph is closed and agrees with the original incidence on the dense open set `t!=0`, so it is exactly the projective closure. In the chart `U_r=1`, a boundary branch has

```math
W=t^{2^r}.
```

Therefore affine witness coordinates can have pole order `2^r`, and the projective homogenizing coordinate can vanish to order `2^r`, despite the `O(r)` quadratic input description. A proposed certificate listing all Laurent or Taylor coefficients only through a polynomial order has no general justification.

This is not a circuit-size lower bound. The high exponents have short repeated-squaring circuits. In this example the full true closure even has a polynomial-size circuit presentation:

```math
U_i-t^{2^r-2^i}U_r=0\quad(0\le i<r),
\qquad W-t^{2^r}U_r=0.
```

Binary powering computes all coefficients in `O(r^2)` arithmetic operations. The example disproves a polynomial *dense jet-length* bound and naive equationwise homogenization; it does not disprove all sparse or circuit descriptions of arcs, or prove that saturation always costs exponential circuit size.

## 3. One Jacobian test does not remove the spurious component

Work in the chart `U_r=1` at the spurious infinity point. The witness variables are `U_0,...,U_{r-1},W`. At that point the first equation has differential

```math
t\,dU_0-dW,
```

the last quadratic equation has differential `dW`, and every intermediate quadratic equation has zero differential. When `r>=2`, the witness Jacobian has rank at most two, below its square size `r+1`, for every parameter `t`.

Thus adding a first singularity or Jacobian-determinant condition does not isolate the true missing input. At `r=1`, the determinant does happen to be `t`; the longer chain shows why that favorable small example is insufficient.

No assertion is made here that every possible deflation or saturation algorithm requires many steps. The explicit conclusion is that the single rank test is sound neither as a universal repair nor as a certificate of genuine escape.

## 4. True closure alone is insufficient when witness fibers are large

Consider `tu=1` with an extra unconstrained witness `v`. The affine projection is again `t!=0`. Its true projective closure in the same projective plane is already the irreducible saturated equation

```math
tU-W=0.
```

Its boundary has `[0:1:0]` over every `t`, including every feasible input. This point is not a homogenization artifact: it is the limit `v -> infinity` of genuine witnesses while `u=1/t` stays fixed.

Consequently even replacing a naive homogenization by the exact projective closure does not make 'there exists a witness at infinity' characterize the missing-input locus. Positive-dimensional witness fibers must be controlled as well.

## 5. A valid sufficient condition

Let `a` denote `N` input coordinates. Let `I` be a closed affine incidence subset of `A^N x A^r`; polynomial inequalities can be made equations by adjoining inverse witnesses. Let `S` be its projection to `A^N`. Assume:

1. `S` contains a dense open subset of `A^N`.
2. An irreducible hypersurface `G=V(g)` is generically disjoint from `S`.
3. Every irreducible component of `I` that dominates `A^N` has generic fiber dimension zero.
4. The true projective closure `Z` of `I` in `A^N x P^r`, including the saturation needed to remove artificial infinity components, has a polynomial-size family of division-free defining arithmetic circuits whose outputs are homogeneous in the projective witness coordinates.

The fourth condition concerns an actual presentation of `Z`, not the unproved promise that a naive homogenization defines it. For uniform NP_C membership the presentations must also be uniformly constructible. A nonuniform polynomial-size presentation is still a useful geometric statement but should be labeled as such.

Let

```math
B=Z\cap\{W=0\},\qquad E=\pi(B),
```

where `W` is the homogenizing coordinate and `pi` is the parameter projection.

### Proposition 5.1

Under these hypotheses, `E` is a proper closed subset of `A^N` and contains `G`. In particular `G` is an irreducible hypersurface component of `E`. The circuit presentation in condition 4 makes membership in `E` existential with polynomially many complex witness coordinates and polynomial verification cost.

**Proof.** The projection from `A^N x P^r` to `A^N` is proper, so images of closed subsets are closed. This gives closedness of `E`.

At least one component of `I` dominates the base. Its projective closure has closed dense image and therefore maps onto all of `A^N`. At a point of the dense open subset of `G` where no affine witness exists, its entire projective fiber lies in `W=0`. Thus that dense subset is contained in `E`; closedness gives `G subset E`.

For a component of `I` that dominates the base, condition 3 makes its dimension `N`. Its projective closure is not contained in `W=0`, so every component of its boundary has dimension at most `N-1`. Such a boundary cannot dominate the base. A component of `I` that does not dominate the base has projective closure whose image is its proper closed image closure, so its boundary cannot dominate the base either. There are finitely many components. Their boundary images are therefore a finite union of proper closed subsets. This proves that `E` is proper. Since `G` has codimension one, it is a component of this proper closed set.

To express membership existentially, choose a nonzero homogeneous witness vector `Z=(Z_0,...,Z_r)` satisfying the defining equations of the true closure and `W=0`. Nonzeroness can be written

```math
\sum_{i=0}^r b_iZ_i=1
```

with `r+1` additional existential coordinates. The arithmetic circuits are evaluated on these witnesses. If an HN encoding requires quadratic equations, introduce one gate variable per circuit operation. This adds only a polynomial number of witnesses and equations. ∎

The usual generic-branch argument applied to a small decider for `E` exposes a nonzero multiple of `g`, because the generic output on `G` is acceptance and the generic ambient output is rejection. If `g=y-per_m(X)`, this would transfer to permanent border complexity. The condition that needs work is the size and correctness of the true projective-closure presentation, not the elementary properness argument.

### Consequence of the singular-witness jet lemma

There is a stronger obstruction when `G` is a polynomial graph. The singular-witness jet lemma, proved and separately reviewed in `SINGULAR_WITNESS.md`, says that a polynomial-degree graph which is the image closure of an irreducible component of a polynomial-size existential incidence already has polynomial border complexity. It does not require a deterministic decision procedure.

Apply this to the existential boundary presentation in Proposition 5.1. Write its zero set, including the inverse witnesses enforcing a nonzero homogeneous vector, as a finite union of irreducible components `J_i`. The image closures `C_i=closure(pi(J_i))` are irreducible closed subsets of `E`, and their union is `E`. Since `G` is an irreducible component of `E`, at least one `C_i` is exactly `G`: irreducibility first gives `G subset C_i`, and maximality of `G` as an irreducible component then gives equality. On that incidence component the output coordinate is the polynomial defining the graph, so the jet lemma applies.

Consequently, conditional on the imported permanent border lower bound, no family satisfying the polynomial-size boundary-presentation condition above can have the permanent graph as such a boundary image component. This rules out that particular positive boundary-certificate repair. This particular argument concerns an existential boundary presentation. The stronger omitted-graph argument described below instead works from a dense existential presentation directly, without requiring small equations for its true closure.

The generic-branch implication remains mathematically valid, but for a permanent-graph component the existential boundary presentation would already contradict the lower bound before any assumption about `HN_C` is made.

### What generic slicing can and cannot do

The zero-dimensional generic-fiber condition has a geometric remedy. Choose a dominating component with maximal generic fiber dimension `d`, and intersect the incidence with `d` generic affine linear equations in the witness coordinates. For a generic choice, some component of this slice still dominates the base and has generic fiber dimension zero; all remaining dominating components also have zero-dimensional generic fibers. The added equations use only `O(r^2)` coefficients and operations. This is an existence statement over C; choosing the generic constants efficiently is a separate uniformity issue.

Slicing does not itself compute a saturated projective closure. The repeated-squaring examples have unique affine witnesses already and still produce spurious infinity components under equationwise homogenization. Thus finite fibers and correct saturation are independent requirements.

## 6. What the stronger compactification argument changes

An attempted conversion of a dense existential presentation into a positive boundary certificate would have to provide either:

- a polynomial-size presentation of its genuine projective boundary after controlling generic fiber dimension, with a proof that the boundary projection is proper and contains the graph; or
- another polynomial-size incidence that isolates genuine escape from the spurious and vertical infinity components.

The examples show precisely why 'homogenize the gate equations and ask for a nonzero solution with W=0' is not such a construction. They also show why a polynomial bound on the length of a dense jet certificate cannot be assumed from polynomially many quadratic gate equations.

A separate argument in `DENSE_BOUNDARY_BARRIER.md` avoids constructing a boundary certificate. It uses the true projective closure only to choose a boundary component and a finite local family. At a nonzero parameter `epsilon`, that family is still defined by the original small affine incidence, generic affine witness slices, and one equation `epsilon w_i=1`. Local algebraic-branch Taylor jets then recover a polynomial omitted graph in the border limit. The original affine equations retain their small size; equations for the projective closure are never supplied to the circuit.

That argument has passed independent written-file reviews by the graph-hardness and incidence-route workers. Conditional on the imported permanent border lower bound, it excludes a polynomial-size dense existential image that generically omits the permanent graph. Thus the failure of naive homogenization does not leave this dense omitted-graph construction as an untested route. A separation proof still needs a different bridge from the permanent border lower bound to an actual hard language in `NP_C`.
