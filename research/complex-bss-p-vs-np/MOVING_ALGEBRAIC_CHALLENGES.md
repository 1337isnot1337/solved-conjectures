# Moving finite algebraic challenges: an admissible case and a collision failure

Status: the all-multiple worker independently read the full argument and reported no gap, then separately checked the escape addition. The local finite-cover argument below gives an actual block incidence under its stated generic admissibility hypothesis. It does not discretize an arbitrary continuous universal prefix. The collision and escape examples are exact and show where a naive complete-fiber expansion fails. Root integration and formal verification are separate from this written review.

## 1. Finite algebraic challenge families

Let a=(x,y,c), where c has p complex coordinates, and let

```math
Z=\{(a,z):Q(a,z)=0\}\subseteq\mathbb C^{n+1+p}\times\mathbb C^r.
```

Assume that there is a nonempty Zariski-open subset U of a-space over which Z to U is a finite étale morphism of constant degree delta. Thus each fiber consists of exactly delta distinct complex points, and near each a in U those points are distinct holomorphic branches. The equations Q have polynomially many variables and individual circuits of size at most L. No bound on delta or on a defining discriminant for U is assumed.

Consider a verifier with local complex witnesses w of dimension at most q:

```math
y=f(x)\quad\Longleftrightarrow\quad
\exists c\ \forall z\,[Q(a,z)=0\Longrightarrow
\exists w\ E(a,z,w)=0],                            \tag{1}
```

where f is a real-coefficient polynomial of degree d and each residual E has an individual circuit of size at most L. Suppose, in addition, that the set of x for which the true instance admits a successful c with a in U is Zariski dense in input space.

Under these assumptions, the reviewed block-KKT argument gives

```math
\underline L(f)\le\mathop{\mathrm{poly}}(n,p,r,q,L,d), \tag{2}
```

independently of delta. The same conclusion holds for a bounded-time BSS body in place of E=0, with its cost and input dimensions included.

## 2. Actual expanded incidence and local completeness

Introduce one pair (z_i,w_i) for each i=1,...,delta and impose

```math
Q(a,z_i)=0,\qquad E(a,z_i,w_i)=0
\quad(1\le i\le\delta).                            \tag{3}
```

Retain the open conditions a in U and pairwise distinctness of the z_i. On this open subset, the delta slots enumerate every point of the challenge fiber, since that fiber has exactly delta distinct points. Consequently its projected image is contained in the graph of f. The generic admissibility hypothesis makes this projected image dense in that graph.

The distinctness conditions are open. For vector-valued z they can be expressed as finite unions of basic coordinate-difference inequations; their number and their circuit size are not charged to the eventual incidence, because they are used only to choose a local component. Likewise no equation or circuit for the open set U is inserted into (3).

The admissible expanded set is open in the zero set (3). Its closure is a union of actual irreducible components of that zero set. One component W has projected closure equal to the graph. This is the exact component hypothesis of the local block-KKT theorem. Each block has local variables (z_i,w_i), of dimension at most r+q, and depends only on the shared (x,y,c). The small systems selected by that theorem have the active equalities and normalized stationarity equations explicitly displayed in BLOCK_KKT_FINITE_EXISTENTIAL_EXTENSION.md, Section 5.

Equivalently, at a generic point of W, choose disjoint small neighborhoods around the distinct challenge roots. Finite étaleness supplies one root in each neighborhood for every nearby a. Full witness arrays in those neighborhoods necessarily enumerate the entire fiber; they cannot silently repeat one branch and omit another. The local isolating balls in the KKT proof preserve precisely this completeness.

For a BSS body, choose one accepting path per challenge slot. There are finitely many full path assignments. One has dense graph image. Its conditions are block-supported equations and inequations, and a generic component point avoids all selected inequation zeros. The same local component argument then applies.

No algorithm for enumerating the delta roots is used. The full finite array only selects W. The block-KKT proof retains polynomially many complete local blocks and cancels the derivatives of their root coordinates as well as their other witnesses. This supplies a concrete normalized incidence; it is not a finite sampling claim without witness equations.

## 3. A collision can invalidate the expansion

Take one parameter y, one challenge z, and

```math
Q(y,z)=z(z-y).
```

Consider the exact statement

```math
y=0\quad\Longleftrightarrow\quad
\forall z\,[z(z-y)=0\Longrightarrow z=0].           \tag{4}
```

For nonzero y, the root z=y falsifies the predicate. At y=0, the only root is zero and the predicate holds.

Expanding two existential challenge slots without enforcing complete enumeration gives

```math
z_1(z_1-y)=z_2(z_2-y)=0,\qquad z_1=z_2=0.
```

Its zero set is simply z_1=z_2=0 with y arbitrary. It has one irreducible component projecting onto all y-space. The true graph y=0 is a proper subvariety of that component, not an actual component. No smaller neighborhood around its point at y=0 makes the full zero set project only to y=0.

Pairwise distinctness fixes completeness over the étale open y nonzero, but then it excludes every true instance. At the true graph, the two generic roots collide. This violates the generic admissibility hypothesis in Section 1 exactly.

Thus a proposal to replace a continuous challenge by the roots of a small finite polynomial must account for correct certificates lying on the discriminant. Simply creating a fixed number of existential root slots does not account for their multiplicities or enforce that all distinct challenges are represented.

One exact way to enforce a complete root multiset of a univariate degree-delta polynomial is to equate all coefficients of its product of linear root factors. That uses delta roots and coefficient constraints coupling all slots. It is not block-supported, and no circuit bound polynomial in log(delta) follows. Invoking this representation would reintroduce the exponential coefficient or witness operation that the finite-cover argument avoided.

### Escape without a finite-root collision

There is a separate failure even when all finite roots remain simple. Set

```math
Q(y,z)=z(yz-1).
```

Universal verification of z=0 over these roots again defines exactly y=0. For nonzero y the roots are 0 and 1/y; at y=0 the only root is 0. The derivative in z is -1 along the zero section and +1 along yz=1. Thus the root map is étale and quasi-finite everywhere, but it is not finite or proper: one root escapes to infinity as y tends to zero.

Two existential root slots may both be zero for every y, so the incomplete expansion again has a dominant image. Local nonsingularity of every finite root does not repair it. The finite-map hypothesis in Section 1 controls precisely this missing branch at infinity; the generic correct-point condition cannot be dropped by replacing finite étale with merely étale or quasi-finite.

## 4. A moving hole defeats rationally computed challenges

The sampling failure need not be limited to constant challenges. The zero graph also has the exact formula

```math
y=0\quad\Longleftrightarrow\quad
\forall z\in\mathbb C\ \exists u\in\mathbb C:
y\big((z^2-x)u-1\big)=0.                           \tag{5}
```

For nonzero y, a complex square root of x supplies a bad challenge; for y=0 all challenges pass. Suppose a finite list of challenges were returned by a bounded-time complex BSS computation on generic (x,y). On one ambient generic branch, every challenge is a rational function r_i(x,y). No such rational function can satisfy r_i(x,y)^2=x identically: the valuation at the prime x of a square is even, whereas that of x is one. Consequently all r_i(x,y)^2-x are nonzero rational functions. On a nonempty open set with y nonzero, every proposed challenge passes with u=1/(r_i^2-x), even though (5) is false.

This rules out a generic deterministic rational sampling shortcut for this formula, including arbitrary complex machine constants. It does not rule out algebraic moving challenges: the equation z^2=x supplies them with a small finite incidence. That cover is étale over x nonzero and is consistent with Section 1. The distinction explains why algebraic challenge equations, their completeness, and their discriminant behavior all need to be supplied explicitly.

## 5. Remaining continuous-quantifier gap

For a genuinely continuous universal predicate with dense proper accepted fibers, no construction here produces a small finite challenge incidence that both detects every bad fiber and satisfies the generic completeness condition needed in Section 1.

An elimination discriminant may describe candidate bad points but also contain good points. A chart compactification may add missing witnesses at infinity. A finite root family may collide on every correct certificate. None of those facts is repaired merely by saying that critical points are algebraic.

A complete conversion therefore needs actual challenge equations, proof that all false outputs are detected, control of roots at infinity and multiplicity changes, and a small normalization that preserves local completeness at correct instances. The notes above establish one admissible case and preserve explicit failures of two simpler substitutes. They do not provide such a conversion for arbitrary PH_C.
