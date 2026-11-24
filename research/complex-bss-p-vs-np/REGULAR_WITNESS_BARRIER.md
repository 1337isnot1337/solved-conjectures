# A limitation of regular implicit witness systems

Status: proved restricted observation. The formerly unresolved singular extension is now proved in [SINGULAR_WITNESS.md](SINGULAR_WITNESS.md). This is an implicit-function argument, not a proof of `P_C != NP_C`.

## 1. Exact hypothesis

Let `x=(x_1,...,x_n)` be parameter variables and `z=(z_1,...,z_r)` be unknown variables. Let

```math
F=(F_1,\ldots,F_r)\in\mathbb C[x,z]^r
```

be computed by a division-free arithmetic circuit of total size `s`. Assume there is a complex point `(a,b)` with

```math
F(a,b)=0,\qquad
\det\!\left(\frac{\partial F_i}{\partial z_j}(a,b)\right)\ne0.
```

Let `z=Z(x)` be the unique formal implicit solution at this point. Suppose its first coordinate is a polynomial `f(x)` of degree at most `d`. Equivalently, the local solution branch is contained in the graph equation `z_1=f(x)`.

**Proposition 1.** Under these hypotheses, `f` has an arithmetic circuit of size polynomial in `s,n,r,d`, using arbitrary complex constants.

The constants can include the coordinates of `(a,b)` and the entries of the inverse Jacobian. No claim is made that these constants can be found efficiently from the input system; for a nonuniform circuit upper bound their existence is enough.

## 2. Proof by truncated Newton iteration

Introduce a formal scalar `t` and new variables `X=(X_1,...,X_n)`, and substitute

```math
x=a+tX.
```

Work in the ring `C[X][[t]]`. The unknown solution has constant term `b`. Let `J(x,z)` be the Jacobian matrix with respect to `z`; its constant matrix `J(a,b)` is invertible.

Starting with `z^(0)=b`, use Newton iteration

```math
z^{(k+1)}=z^{(k)}-
J(a+tX,z^{(k)})^{-1}F(a+tX,z^{(k)}).
```

Compute each iterate modulo `t^(d+1)`. The formal Newton argument shows that the error order doubles, so `O(log(d+1))` iterations determine the first `d+1` coefficients of the implicit solution. For completeness, if an iterate is correct modulo `t^e`, Taylor expansion gives

```math
F(z+\Delta)=F(z)+J(z)\Delta+O(t^{2e})
```

when `Delta` has order at least `e`. Taking `Delta=-J(z)^{-1}F(z)` cancels the residual modulo `t^(2e)`. The Jacobian remains invertible because its constant term remains `J(a,b)`.

Each operation on truncated series is represented by operations on its `d+1` coefficient polynomials in `X`. Addition costs `O(d+1)` gates and multiplication costs `O((d+1)^2)` gates by convolution. Evaluating the circuit for `F` at truncated inputs therefore has cost polynomial in `s,d`. Differentiating the circuit by the product rule provides all `r^2` Jacobian entries with polynomial overhead in `s,r`.

Matrix inversion also has polynomial cost. Write `J=J_0+E` where `J_0=J(a,b)` and every entry of `E` has positive `t` order. Then modulo `t^(d+1)`,

```math
J^{-1}=
\left(\sum_{j=0}^{d}(-J_0^{-1}E)^j\right)J_0^{-1}.
```

There are only `d+1` matrix powers of size `r`, each implemented by a polynomial number of truncated-series operations. All entries of `J_0^{-1}` are scalar constants. This gives a division-free circuit of size polynomial in `s,r,d` for the entire truncated solution.

The first coordinate of that solution is `f(a+tX)`. Since `deg f≤d`, its truncation through `t^d` is exact. Setting `t=1` in the coefficient representation gives `f(a+X)`, and substituting `X=x-a` gives `f(x)` at a further `O(n)` cost. ∎

## 3. Consequence for the proposed incidence route

Subject to the imported permanent circuit lower bound, no polynomial-size family of witness systems satisfying the hypotheses above can have `z_1=per_m(X)` with `r,s` polynomial in `m`. This excludes a specific tempting construction: a small square polynomial system with an ordinary nonsingular implicit witness branch whose output is the permanent.

The same argument applies when a larger collection of equations admits a square subsystem with invertible witness Jacobian and the resulting unique local branch satisfies the remaining equations and the permanent graph equation. Those additional facts must be proved; they cannot be inferred just by deleting equations.

This is a restriction on regular implicit presentations. A generic NP_C certificate need not come with such a presentation. Repeated factors and singular components can make every available witness Jacobian singular.

## 4. A precise sufficient condition for singular perturbations

**Proposition 2.** Suppose `F_epsilon(x,z)` has arithmetic circuit size at most `s` for every member of a sequence of nonzero complex parameters tending to zero. Suppose there is a fixed complex polydisc `U` centered at `a`, and holomorphic solution branches `Z_epsilon:U→C^r`, such that

```math
F_\epsilon(x,Z_\epsilon(x))=0,\qquad
\det\partial_zF_\epsilon(a,Z_\epsilon(a))\ne0.
```

If the first coordinate of `Z_epsilon` converges uniformly on compact subsets of `U` to a polynomial `f` of degree at most `d`, then `f` has border complexity polynomial in `s,n,r,d`.

**Proof.** For each nonzero parameter, the Newton computation in Proposition 1 produces the degree-`d` Taylor polynomial of the first coordinate at `a`, with the same polynomial circuit-size bound. This use of the computation does not require that the whole coordinate function be polynomial. The constants `Z_epsilon(a)` and the inverse Jacobian entries can depend on the parameter, which is allowed in a circuit degeneration. The several-variable Cauchy integral formula implies coefficientwise convergence of these degree-`d` Taylor polynomials to the Taylor polynomial of `f`. Since `deg f≤d`, this last Taylor polynomial is exactly `f`. Thus `f` lies in the coefficientwise closure of the size-bounded circuits. Bürgisser's Theorem 2.4 identifies this with approximative complexity over `C`. ∎

The fixed polydisc and locally uniform convergence are substantive hypotheses. Convergence of root values separately at each parameter point is not enough.

## 5. The singular extension is now proved

The original checkpoint left a specific gap: a singular witness system needed a perturbation on one fixed input polydisc whose bounded Taylor coefficients converge to the intended graph. Pointwise convergence of root values was insufficient.

[SINGULAR_WITNESS.md](SINGULAR_WITNESS.md) now supplies that argument. Generic witness slices and square linear combinations isolate a local graph component. A finite proper holomorphic map provides a fixed neighborhood; a generic scalar perturbation avoids its discriminant. Properness gives locally uniform convergence, and truncated Newton iteration gives polynomial-size circuits for every fixed Taylor order. The coefficientwise limit has polynomial border complexity, independently of multiplicity and elimination degree.

The stronger statement needs border complexity, whereas Proposition 1 gives an exact circuit in the regular case. Its application excludes polynomial-size existential presentations of the permanent graph under the imported border lower bound. It does not separate P_C from NP_C.
