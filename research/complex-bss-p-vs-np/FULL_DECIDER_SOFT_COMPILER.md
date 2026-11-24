# A polynomial-size rational soft compiler for total BSS deciders

Research checkpoint, 23 November 2026 (America/Chicago). This is a positive simulation statement, checked in full in two independent written reviews: [first review](FULL_DECIDER_SOFT_COMPILER_REVIEW.md) and [second review](FULL_DECIDER_SECOND_REVIEW.md). Its limit is pointwise in the input. The theorem supplies neither a polynomial border circuit for a discontinuous indicator nor a procedure for extracting a defining polynomial of its support.

## 1. Model and statement

Fix a deterministic complex BSS machine `M` with a finite program and a finite list of arbitrary complex constants. Arithmetic `+,-,*`, division on its defined domain, equality branches, copying, and the standard finite-control and tape-shift operations each have unit cost. Input length is the number of complex input coordinates, with any discrete encoding coordinates counted as part of the input. Fix a length `n` and a time bound `T` for which `M` halts on every input in `C^n`, never executing division by zero, and outputs a bit `b_M(x)` in `{0,1}`. A halting state is padded by identity transitions to time `T`.

There is an effectively constructible rational straight-line circuit

```math
F_{n,T}(x,\epsilon)
```

with `O_M(T(n+T)+n+1)` gates, using only the constants of `M` and zero and one, such that the following statements hold.

1. For every fixed input `x`, every division gate of the circuit is defined for all sufficiently small nonzero complex `epsilon`.
2. Every gate value has a holomorphic extension to `epsilon=0` after fixing `x`.
3. At the output,

```math
F_{n,T}(x,\epsilon)=b_M(x)+O_x(\epsilon).
                                                        \tag{1}
```

The displayed size is polynomial in the charged BSS running time and input length. No size-dependent complex constants are introduced. The construction uses one common deformation parameter at every discontinuous gate; it needs no hierarchy of deformation exponents. If `T=T(n)` is an effectively specified polynomial time bound for a fixed machine, the construction is uniform.

The theorem also holds when correctness and totality are required only on a fixed input subset: the conclusions are then restricted to that subset. We use the all-input form in this note.

## 2. An oblivious circuit with two total discontinuous gates

Introduce the total functions

```math
\delta(z)=
\begin{cases}1&z=0,\\0&z\ne0,\end{cases}
\qquad
\iota(z)=
\begin{cases}0&z=0,\\z^{-1}&z\ne0.\end{cases}
                                                        \tag{2}
```

Unroll `T` complete transitions of the fixed machine. Only `n+O_M(T)+O_M(1)` tape coordinates can affect or be affected by these transitions: the finite program accesses finitely many fixed offsets, and at most `T` unit shifts occur. Retain a padded buffer of that many coordinates. At each time, retain one Boolean indicator for every control state. For every possible instruction, compute its candidate register update; implement a candidate division `u/v` as `u*iota(v)` even when that instruction is inactive. Multiply each candidate update and its successor-state indicator by the current one-hot control indicator and sum the candidates. An equality branch uses `delta(z)` and `1-delta(z)` to select its two successors. A shift copies the buffer coordinates at the corresponding offset. The padded halting state retains both the data and its output bit.

At an exact reachable configuration, precisely one control indicator is one. Thus inactive instructions contribute zero, including inactive divisions by zero. The active instruction agrees with the original machine because any active division is defined. Induction on time proves that this straight-line simulation has exactly the machine's configuration and output after each transition. It is an ordinary arithmetic circuit augmented with (2), has

```math
S=O_M(T(n+T)+n+1)
```

gates, and has `r=O_M(T)` occurrences of `delta` or `iota`. Each fixed machine instruction contributes only constantly many discontinuous gates per time step; copying or shifting the padded buffer introduces none.

This construction is for the standard BSS tape model just stated. An alternative RAM presentation must first be translated with its charged polynomial simulation overhead; arbitrary uncharged addressing or exponentiation is not added to the model.

## 3. One common deformation scale

Replace every occurrence of the two gates (2) by

```math
\delta_\epsilon(z)=\frac{\epsilon}{z^2+\epsilon},
\qquad
\iota_\epsilon(z)=\frac{z^3}{z^4+\epsilon}.          \tag{3}
```

Each replacement uses a bounded number of arithmetic gates and one division. The size increases by `O(r)`. Every gate uses the same `epsilon`; no repeated-squaring chain of deformation scales is required.

Fix an arbitrary input `x`. We induct through the circuit in a topological order. The invariant is that each computed value is a holomorphic germ at zero and equals its exact value in the circuit of Section 2 modulo `epsilon`. Input coordinates and constants are exact. Addition, subtraction, and multiplication preserve the invariant because the exact values are finite.

For either discontinuous gate, its incoming value has the form

```math
z_\epsilon=z_0+O(\epsilon).                        \tag{4}
```

If `z_0!=0`, both denominators in (3) have nonzero constant terms. Direct expansion gives

```math
\delta_\epsilon(z_\epsilon)=O(\epsilon),
\qquad
\iota_\epsilon(z_\epsilon)=z_0^{-1}+O(\epsilon).
                                                        \tag{5}
```

If `z_0=0`, (4) instead gives

```math
\delta_\epsilon(z_\epsilon)
 =\frac1{1+z_\epsilon^2/\epsilon}
 =1+O(\epsilon),
```

and

```math
\iota_\epsilon(z_\epsilon)
 =\frac{z_\epsilon^3}{\epsilon}
   \frac1{1+z_\epsilon^4/\epsilon}
 =O(\epsilon^2).                                  \tag{6}
```

In this case the two original denominators in (3) have leading term `epsilon`, with coefficient one. They are not the zero rational germ. Equations (5)--(6) prove the induction invariant and (1).

Each circuit denominator, after the fixed input is substituted, is a nonzero rational function of `epsilon`. It has no zeros or poles in a sufficiently small punctured disc. There are finitely many gates, so a single sufficiently small punctured disc works for all of them. This establishes actual complex limits, not merely formal expressions. The radius can depend on the fixed input; no joint neighborhood in the input variables is claimed.

The rational output automatically has a supplied division-free numerator and denominator of linear shared circuit size. At every rational gate maintain a pair `(P_i,Q_i)` for its value `P_i/Q_i`, starting with `(x_i,1)` and `(c,1)`. The update rules are

```math
(P_1,Q_1)\mathbin{\pm}(P_2,Q_2)
  \longmapsto(P_1Q_2\mathbin{\pm}P_2Q_1,Q_1Q_2),
```

```math
(P_1,Q_1)(P_2,Q_2)\longmapsto(P_1P_2,Q_1Q_2),
\qquad
\frac{(P_1,Q_1)}{(P_2,Q_2)}
  \longmapsto(P_1Q_2,Q_1P_2).
```

Shared subcircuits prevent duplication, so this costs a bounded number of polynomial gates per original gate. For every fixed input, induction shows that each `Q_i` is a nonzero polynomial in `epsilon`. In a division update, the original divisor `P_2/Q_2` is a nonzero germ by the preceding proof, so `P_2` is nonzero too. Thus the final supplied pair `(A,B)` has `O(S)` shared size and `B(x,epsilon)` is not the zero polynomial for any fixed input. The pair need not be reduced.

## 4. What the compiler does not normalize

For a closed hypersurface decided by the machine, the circuit in Section 3 tends to one on that hypersurface and zero on its complement. It may have a positive generic deformation order and a different specialized order. Even when the false-input order is constant, its generic leading coefficient can have additional poles on false hypersurfaces, as the [complete-program tests](SOFT_TRANSITION_ORDER_JUMPS.md) show.

This distinction persists when all gates have finite fixed-input limits. Coefficientwise border complexity of a polynomial concerns a single polynomial limit in the input variables. Equation (1) instead fixes the input before taking the deformation limit. A function that is zero on an ambient open set and one on its boundary cannot be a polynomial. No coefficientwise circuit limit computing that indicator is asserted.

## 5. A concrete sufficient condition on a supplied denominator

The following condition would make the pointwise compiler useful for boundary extraction. It is stronger than its proved conclusion.

Let `R` be a nonconstant irreducible polynomial in `N` input coordinates over `C`. Suppose division-free polynomial circuits of total size `S` are supplied for `A(x,epsilon)` and a nonzero `B(x,epsilon)`. Assume that `B(x,epsilon)` is not the zero polynomial in `epsilon` at any fixed input, and that the fixed-input limit of `A/B` is one on `R=0` and zero elsewhere. Require also the following local nonvanishing property of this particular supplied denominator:

> For every `x_0` with `R(x_0)!=0`, there are a complex neighborhood `U` of `x_0` and a real number `eta>0` such that `B(x,epsilon)!=0` for all `x` in `U` and all `0<|epsilon|<eta`.

Write the first nonzero deformation terms as

```math
A=\epsilon^a A_a(x)+\cdots,\qquad
B=\epsilon^b B_b(x)+\cdots.
```

The numerator is nonzero because the limit is one somewhere on `R=0`. At a generic false input both leading coefficients are nonzero, so the limit zero forces `a>b`.

We next show that every irreducible factor of `B_b` is `R`. Suppose instead that `Q` is another irreducible factor. Choose a smooth point `x_0` of `Q=0` outside `R=0` and outside all other factors of `B_b`. A generic complex line through `x_0`, parameterized by `t`, has

```math
B_b(x_0+tv)=t^e u(t),\qquad e\ge1,\quad u(0)\ne0.
```

Choose `rho>0` so that `|t|<rho` stays inside `U`. Set

```math
q_\epsilon(t)=\epsilon^{-b}B(x_0+tv,\epsilon).
```

Its degree in `t` has a finite bound `L` independent of `epsilon`, and its coefficients converge to those of `t^e u(t)`. If the local nonvanishing condition held, `q_epsilon` would have no root with `|t|<rho`. Its constant coefficient `c_0(epsilon)` would then be nonzero. The fundamental theorem of algebra gives

```math
q_\epsilon(t)=c_0(\epsilon)
 \prod_{j=1}^{d_\epsilon}(1-t/\alpha_j),
\qquad d_\epsilon\le L,\quad |\alpha_j|\ge\rho.
```

Consequently its coefficient of `t^e` satisfies

```math
|c_e(\epsilon)|
\le |c_0(\epsilon)|\binom{L}{e}\rho^{-e}.
```

This also holds when `d_epsilon<e`, with left side zero. But `c_0(epsilon)` tends to zero and `c_e(epsilon)` tends to the nonzero number `u(0)`, a contradiction. The bound `L` may be large; this is a proof of root persistence, not an algorithm that enumerates roots. Thus `V(B_b)` is contained in `V(R)`.

If `B_b` did not vanish identically on `R=0`, choose a point of `R=0` with `B_b!=0`. Since `a>b`, the limit of `A/B` at that point would be zero, contradicting correctness. Therefore `R` divides `B_b`. Unique factorization over `C` now gives

```math
B_b=cR^k,\qquad c\in\mathbb C^*,\quad k\ge1.       \tag{7}
```

For these binary division-free arithmetic circuits of size `S`, both `b` and `k` are at most `2^(O(S))`; this follows from the usual repeated degree bound at multiplication gates.

There is a direct small border circuit for any fixed-degree Taylor jet of `R` from this hypothesis. Fix a center `c_0` with `R(c_0)!=0` and let `J_(c_0)^D` denote the Taylor polynomial through total degree `D`. Introduce a scalar bookkeeping variable `u`, compute modulo `u^(D+1)`, and form

```math
V_\epsilon(u,x)
=\frac{B(c_0+u(x-c_0),\epsilon)}{B(c_0,\epsilon)}.
```

Its constant coefficient in `u` is exactly one, and its coefficients converge as `epsilon` tends to zero to those of

```math
\left(\frac{R(c_0+u(x-c_0))}{R(c_0)}\right)^k.
```

Compute the finite logarithm of `V_epsilon`, multiply it by `1/k`, and compute its finite exponential, always modulo `u^(D+1)`. Finally set `u=1`. The resulting degree-`D` polynomial in `x` converges coefficientwise to

```math
J_{c_0}^D\left(\frac{R(x)}{R(c_0)}\right).          \tag{8}
```

Truncated polynomial arithmetic at the original `S` gates costs `O(S(D+1)^2)`. Direct finite log and exp evaluation costs `O((D+1)^3)`, and the input substitution costs `O(N)`. Thus the border circuit size for (8) is bounded by

```math
C\big((S+N+1)(D+1)^2+(D+1)^3\big)                \tag{9}
```

for an absolute constant `C`. The integer `k` is an allowed nonuniform scalar constant here; if its binary expansion is supplied, it can instead be constructed in `O(log k)` arithmetic operations. No algorithm for discovering `k` is asserted. No initial coefficient of `B` has to be computed as a separate circuit: the ratio defining `V_epsilon` cancels the factor `epsilon^b` automatically. For sufficiently small nonzero `epsilon`, its scalar denominator is nonzero because its leading coefficient at `c_0` is nonzero.

This condition concerns the **supplied denominator**, not merely local boundedness of the rational output. Multiplying numerator and denominator by the same polynomial leaves the output unchanged and can introduce arbitrary extra denominator zeros. Even if output boundedness were available, a reduced numerator-denominator representation cannot be assumed to have small circuits without an additional theorem. The current compiler proves neither the local nonvanishing condition nor such a reduction.

## 6. Remaining bridge

Applied to a hypothetical polynomial-time HN decider, Sections 1--3 provide polynomial-size rational circuits with the correct pointwise indicator limit on every coefficient input. Section 3 already supplies polynomial-size division-free numerator and denominator circuits with every fixed-input denominator germ nonzero. Section 5 specifies the remaining sufficient normalization property: local nonvanishing of that supplied denominator on every false neighborhood. It would expose a pure power of the irreducible boundary and recover its bounded-degree jets at polynomial border cost.

The [complete-program tests](SOFT_TRANSITION_ORDER_JUMPS.md), Sections 4--6, show why a common false-input order, signed pole multiplicity, polynomial-length generic prefixes, and pointwise holomorphicity do not supply that normalization. A construction of the required denominator from a full HN decider remains unproved.
