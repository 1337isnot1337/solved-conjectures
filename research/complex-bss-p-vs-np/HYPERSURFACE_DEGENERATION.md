# Graph factors in degenerations of existential hypersurfaces

Status: a consequence of the independently reviewed local algebraic-branch jet lemma, independently reviewed by the graph-hardness worker and the integrator. No novelty claim is made. The statement is a barrier to a proposed construction, not a separation of `P_C` from `NP_C`.

The jet lemma used below is proved in [SINGULAR_WITNESS.md](SINGULAR_WITNESS.md), Sections 1–4.

## 1. Statement

Let `x=(x_1,...,x_n)`, let `f(x)` be a polynomial of degree at most `d`, and let

```math
F(t,x,y)\in\mathbb C[t,x,y],\qquad F(0,x,y)\ne0.
```

Assume `y-f(x)` divides `F(0,x,y)`. For every sufficiently small nonzero complex `tau`, suppose `V(F(tau,x,y))` has an existential complex incidence presentation using at most `r` witness coordinates, `q` equations, and a shared arithmetic circuit of size at most `s`. The presentations may depend on `tau`, and all their scalar constants may depend on `tau`. Equations and inequations are allowed, provided inequations are converted into inverse-witness equations at polynomial cost. It suffices to have these presentations along a sequence tending to zero outside the finite exceptional parameter set below.

Then the reviewed local algebraic-branch jet lemma implies

```math
\underline L(f)\le \mathop{\mathrm{poly}}(s,q,n,r,d).
```

No bound on the degree or circuit complexity of `F` is required for this implication. `F` is used to prove existence and convergence of a local root cluster, not as a circuit which computes that cluster.

## 2. A fixed holomorphic root cluster

Write

```math
F(0,x,y)=(y-f(x))^e A(x,y),
\qquad e\ge1,\qquad A(x,f(x))\ne0.
```

Here `e` is maximal, so the final displayed polynomial in `x` is nonzero. We first record an elementary discriminant fact. Regard `F` as a polynomial in `y` over `C(t,x)`. Its monic squarefree part has rational-function coefficients and a nonzero discriminant, because the characteristic is zero. Clearing its coefficient denominators, the leading coefficient of `F`, the scalar factors in the squarefree decomposition, and the discriminant gives a nonzero polynomial `D(t,x)` with the following property: whenever `D(t,x)!=0`, the distinct roots of `F(t,x,y)` are exactly the simple roots of this squarefree part, specialized at `(t,x)`. In particular those roots form an unramified cover locally in `(t,x)`.

Factor out the largest power of `t` from `D`:

```math
D(t,x)=t^k\bigl(D_0(x)+tD_1(x)+\cdots\bigr),
\qquad D_0\ne0.
```

Choose a center `a` with

```math
D_0(a)A(a,f(a))\ne0.
```

Choose a small polydisc `U` around `a` and a radius `rho>0` such that `D_0` is bounded away from zero on its closure and

```math
A(x,f(x)+w)\ne0
\qquad(x\in\overline U,\ |w|\le\rho).
```

After decreasing `U` and `rho` if needed, the compact set with `|w|=rho` has a positive lower bound for the absolute value of `F(0,x,f(x)+w)`. Uniform convergence of `F(t,...)` to `F(0,...)` and Rouché's theorem show that for every sufficiently small nonzero `tau`, and every `x` in `U`, there are exactly `e` roots counted with multiplicity in

```math
|y-f(x)|<\rho.
```

At the same time `D(tau,x)` is nonzero on `U`. Thus the distinct roots in this cluster form a nonempty finite unramified cover of `U`. Finiteness and properness for this selected cluster follow from the bounded disk and the absence of roots on its boundary. Since `U` is simply connected, the cover splits into holomorphic sheets. Select one and write it as

```math
y=h_\tau(x).
```

Every such choice satisfies `h_tau -> f` locally uniformly as `tau -> 0`. Indeed, if convergence failed on a compact subset of `U`, a sequence of roots staying a fixed distance from `f(x)` would have a convergent subsequence. Its limit would be a root of `F(0,x,y)` in the selected closed cluster. The only such root is `y=f(x)`, which is a contradiction.

This argument allows repeated factors of `F`: the squarefree part supplies the covering, while Rouché's theorem supplies nonemptiness and confines the roots. No unjustified derivative-nonvanishing assumption about the original `F` is used.

## 3. Lifting the selected branch to an incidence component

Fix one admissible nonzero `tau`. The holomorphic sheet lies on an irreducible component `H_tau` of the hypersurface `V(F(tau,x,y))`. Its graph over a nonempty open subset of `U` is Zariski dense in `H_tau`: it has dimension `n`, and an irreducible hypersurface component has that same dimension.

Take an existential incidence presentation of this hypersurface. The images of its finitely many irreducible components cover the hypersurface. Taking image closures gives finitely many irreducible closed subsets whose union is the hypersurface. Hence some incidence component has image closure exactly `H_tau`. The component dominates the `x` coordinates. Its image contains a nonempty Zariski-open subset of `H_tau` by constructibility. A generic point of the selected holomorphic branch therefore lifts to that component.

The local algebraic-branch jet lemma applies to this chosen branch. In its proof, generic affine witness slices make the selected source component generically finite over `x`; the branch lifts at generic centers, and the square-system perturbation computes its bounded Taylor jets. The uniform bound is polynomial in `s,q,n,r,D`, independent of the degrees of the hypersurface and incidence components.

Consequently, for every admissible `tau`, degree-`d` Taylor jets of `h_tau` at permissible generic centers have one common polynomial border-size bound.

## 4. Passing to the polynomial limit

Choose a sequence `tau_j -> 0` of admissible nonzero parameters. Choose permissible generic centers `a_j` tending to a fixed point `a` of `U`. Such centers exist in every small ball because the excluded loci are proper algebraic or analytic subsets of the selected local branch.

The locally uniform convergence `h_tau_j -> f` and uniform Cauchy estimates on a fixed smaller polydisc imply convergence of every derivative through order `d` at these moving centers. Thus

```math
J^d_{a_j}h_{\tau_j}\longrightarrow f
```

coefficientwise after each jet is written in the original input variables. Every jet has the same polynomial border-size bound. The bounded-size border class is closed in this bounded-degree coefficient space, so the limit has that bound as well. This proves the stated implication.

## 5. Consequence for the resultant-initial-factor route

The homogeneous quadratic resultant has a polynomial-size existential presentation: a nonzero common root is a witness. A polynomial-size division-free substitution, polynomial in the remaining inputs and using Laurent functions of `t` as scalar coefficients, preserves such a presentation. Laurent dependence on `t` causes no problem after fixing a nonzero scalar `tau`; negative powers are scalar constants. A specialized resultant can be multiplied by a scalar Laurent power of `t` to make its first nonzero coefficient the `t=0` polynomial, without changing any nonzero-parameter zero set. More general substitutions are covered only when their actual defined-division conditions still give the stated existential presentations of the nonzero-parameter zero sets.

Therefore, if the normalized initial resultant had `y-per_m(X)` as a factor, the proposition would already give polynomial border circuits for the permanent. Subject to the imported permanent border lower bound, no such polynomial-size existential hypersurface degeneration can exist. An arbitrary multiplier produced by an HN decider is not the obstruction at this stage; the positive existential family with that graph-factor limit would itself be incompatible with the lower bound.

This statement concerns an actual polynomial-size substitution and a genuine initial factor. It does not apply to an interior coefficient, an additive combination of separately described zero sets, or a formal coefficient-extraction operation whose zero set has no small existential presentation. Those distinctions are exactly why the BCJS permanent coefficient does not by itself yield the desired BSS separation.
