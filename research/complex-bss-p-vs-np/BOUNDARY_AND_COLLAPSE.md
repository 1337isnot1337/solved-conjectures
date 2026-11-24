# Boundary extraction and the quantitative hierarchy threshold

Status: research reductions. The statements below isolate sufficient conditions for the requested separation. They do not construct the needed incidence family or compressed protocol.

## 1. A generic boundary lemma

For a constructible subset `S` of `A^N(C)`, define its algebraic boundary by

```math
\partial_{\mathrm{alg}}S=\overline{S}^{\mathrm{Zar}}\cap
\overline{\mathbb A^N(\mathbb C)\setminus S}^{\mathrm{Zar}}.
```

This definition is specified because other conventions for an algebraic boundary occur in the literature.

**Lemma 1.1.** Suppose a total algebraic computation tree of depth `T`, permitting division where defined and equality tests, decides `S`. Let `H=V(g)` be an irreducible hypersurface contained in `∂_alg S`, with `g` a nonconstant irreducible polynomial. Then some nonzero polynomial `P` has

```math
g\mid P,\qquad L(P)=O(T+1).
```

**Proof.** A dense constructible subset of an irreducible affine space contains a nonempty open subset: write it as a finite union of locally closed sets; one such set has closure the entire affine space and is therefore open there. Consequently `S` and its complement cannot both be dense, since their respective nonempty open subsets would intersect. They cannot both be nondense either, since their union is the entire affine space. Exactly one is dense.

Let `E` be the nondense one. The other set has closure the entire ambient space, so `∂_alg S=closure(E)` and `H⊂closure(E)`. Unroll the decision tree. Its leaf cells partition `E` into finitely many constructible cells, accepting if `E=S` and rejecting otherwise. The rational-register numerator/denominator construction in [the canonical graph proof](../bss-permanent-graph/PROOF.md), Lemma 2 expresses each cell by polynomial equations and inequations, using only `O(T+1)` arithmetic operations along each path.

Because `H` is irreducible and is covered by the finitely many closed sets obtained by intersecting `H` with the closures of these cells, there is a cell `C` with `H⊂closure(C)`. If every equation on its path had identically zero numerator, `C` would be nonempty and open in the whole affine space. That would make `E` dense, a contradiction. Thus a nonzero equality numerator `P` occurs. It vanishes on `C`, hence on `H`, so `g|P`. The path supplies a division-free straight-line program of length `O(T+1)` for `P`. ∎

The lemma treats a boundary on which the decider generically accepts and a boundary on which it generically rejects in the same way. It does not assume that the whole boundary is a single hypersurface. It also does not require deciding membership in `H` separately from membership in `S`.

**Corollary 1.2.** If `deg g=d`, the approximate-factor theorem gives

```math
\underline L(g)=O\!\left(d^{10}(T+1)\right).
```

This is a coarse bound obtained from Bürgisser, arXiv:1812.06828v1, Theorem 1.3, using schoolbook multiplication and matrix multiplication. A family of polynomial-degree irreducible boundary components of polynomial-time decidable constructible sets therefore has polynomial border complexity.

This corollary is a direct extension of the generic-branch exclusion-complexity argument. It is recorded for use in the proposed incidence attack, not claimed as a new lower-bound theorem.

## 2. How an incidence construction would finish the proof

Suppose there is a uniform family of polynomial systems

```math
E_m(z,w)=0
```

with polynomially many parameter coordinates `z`, witness coordinates `w`, equations, and arithmetic gates for their evaluation. Let

```math
S_m=\{z:\exists w\ E_m(z,w)=0\}.
```

Auxiliary gate variables turn the equations into a polynomial-size system of quadratic equations, so `S=(S_m)` is uniformly in `NP_C`. The projection is constructible by the usual elimination theorem over algebraically closed fields.

Assume that `∂_alg S_m` has an irreducible hypersurface component `V(g_m)` of degree polynomial in `m`. Under `HN_C∈P_C`, the reduction to HN followed by the hypothetical decider gives a polynomial-time decider for `S_m`, so Corollary 1.2 makes `g_m` border-easy.

At this point one still needs a circuit-preserving link from `g_m` to the permanent graph. A sufficient link is an explicit polynomial-size substitution of its variables, perhaps with a formal parameter and a controlled nonzero trailing coefficient, whose result has `y−per_m(X)` as a factor. A polynomial-size affine substitution with

```math
g_m(\ell_1(X,y),\ldots,\ell_N(X,y))
=c\big(y-\mathop{\mathrm{per}}_m(X)\big),\qquad c\ne0,
```

is the simplest case. Composition with the substitution preserves polynomial border complexity. Applying the approximate-factor bound to the nonzero resulting polynomial gives polynomial border complexity for `y−per_m(X)`, and hence for `per_m`, a contradiction.

For a factor of a polynomial already known only to have small border complexity, the needed source is stronger than merely the display in Theorem 1.3: Bürgisser's Proposition 3.4 has `L̲(f)` on its right-hand side, and Section 3.3, equation (11), reconstructs the degree-`d` factor from its local implicit series. Together with Lemma 2.3(3), this yields a bound polynomial in `L̲(f)`, `d`, and the number of variables. Over `C`, the field extension step of that proof is unnecessary.

For a degeneration, two approximation parameters may first be used, one for the small border circuit and one for the variable substitution. The diagonal-specialization argument in Bürgisser's Lemma 2.3(1) replaces the first parameter by a sufficiently high power of the second. This preserves the required trailing coefficient. Such powers are allowed scalar constants in the Laurent-series border model; no polynomial bound on their exponent is required for the imported lower bound.

These observations justify an incidence-to-boundary strategy with actual equations and a controlled polynomial relation. They do not supply the incidence family. The following two qualifications prevent common false shortcuts.

### 2.1 A variety projection needs its own circuit argument

**Lemma 2.1 (linear projection to a graph).** Let `π:A^N→A^(r+1)` be a surjective linear map, let `G=V(y−f(x))`, and let `H=V(g)` be an irreducible hypersurface in `A^N`. If the Zariski closure of `π(H)` is `G`, then

```math
H=\pi^{-1}(G),\qquad
g=c\,(y-f(x))\circ\pi
```

for some nonzero scalar `c`.

**Proof.** Since `G` is closed, `π(H)⊂G`, so `H⊂V((y−f)∘π)`. A linear change of ambient coordinates turns the surjective map into a coordinate projection. Under that change, `(y−f)∘π` is the same irreducible graph polynomial with extra unused variables, and it remains irreducible. Its zero set and `H` are irreducible hypersurfaces, and inclusion forces equality. Their irreducible defining equations differ by a scalar. ∎

Thus a coordinate projection of an ambient hypersurface to the permanent graph does not conceal additional witness geometry: the hypersurface must be a cylinder over that graph. This does not rule out the intended incidence strategy, but it specifies what such a projection must establish.

If the proposed component has higher codimension, or is only a hypersurface inside another variety, the conclusion above is not automatic. A generic branch may expose an equation of the ambient incidence variety that has no useful relation to the permanent. An arbitrary set-theoretic projection must not be silently treated as a projection of arithmetic circuits.

### 2.2 Extract the factor before specializing the multiple

The branch polynomial is a multiple of `g_m`, rather than `g_m` itself. A substitution can annihilate its cofactor. For example `P=z(y−f(x))` is a nonzero small multiple of `y−f(x)`, but setting `z=0` turns `P` into zero. It is invalid to apply a lower bound to this zero specialization. The valid order is to extract a border circuit for the low-degree component `g_m` first, then apply the explicit substitution or degeneration to `g_m`.

## 3. Quantitative cost of collapsing a growing prefix

The weighted protocol in [PROTOCOL.md](PROTOCOL.md) has a correct prefix with `2m` alternating blocks. The standard consequence of `P_C=NP_C` eliminates every fixed number of blocks. That statement has no uniform polynomial exponent for an unbounded number of blocks.

Here is a quantitative version that keeps track of the actual resource loss. It is a bound for the usual transcript-compilation method, not a lower bound against every possible method of evaluating quantified formulas.

Fix a hypothetical polynomial-time HN decider. Fix a standard uniform reduction that encodes the accepting computation of a clocked BSS verifier as a polynomial system. The reduction includes register values, discrete control choices, and nonzero-division witnesses; products are converted to quadratic gate equations. For some fixed constants `A≥2` and `q≥2`, one additional existential block can therefore be eliminated with the resource bound

```math
t_{j+1}(N)\le A\big(t_j(N)+N\big)^q.
```

The same bound handles a universal block by complementing its predicate, applying an existential block, and complementing again. The quantity `t_j` includes the cost of evaluating the already-eliminated suffix, constructing the next HN instance, and the required fixed-machine interpretation overhead. The exponent `q` can be enlarged to cover all these polynomial overheads. A shared universal interpreter can reduce repetition of program descriptions, but does not remove the time or witness-size term `t_j` in this transcript construction.

**Lemma 3.1.** If `t_0(N)≤N^a` for a fixed `a≥1` and `N≥2`, then there is a constant `B` depending only on `A,q,a` such that

```math
t_h(N)\le\exp\!\big(Bq^h\log N\big)
=N^{Bq^h}.
```

**Proof.** Enlarge each bound to `u_j≥max{t_j,N,1}` so that

```math
u_{j+1}\le A2^q u_j^q.
```

Writing `v_j=log u_j`, one has `v_(j+1)≤qv_j+log(A2^q)`. Iteration gives

```math
v_h\le q^h v_0+
\frac{q^h-1}{q-1}\log(A2^q).
```

Since `v_0=O(log N)` and `N≥2`, this is `O(q^h log N)` with a constant independent of `N,h`. ∎

For `h=2m` this bound is far too large to contradict the known permanent-graph lower bound. It does not prove that every evaluator needs this much time; it shows precisely why invoking the ordinary fixed-level hierarchy collapse does not establish a polynomial-time evaluator for the existing protocol.

## 4. A sufficient sub-log-log alternation criterion

The graph proof in `GRAPH_HARDNESS.md` gives more than an unspecified superpolynomial lower bound. The pinned permanent border lower bound and its factor-reduction cost imply that, for some `η>0`, every algebraic graph decider at size `m` has time at least

```math
\exp\!\big(\eta(\log m)^{4/3}\big)
```

for all sufficiently large `m`. Indeed, the border circuit obtained from a time-`T` decider has size `O(m^10(T+1)+m²)`, and the factor `m^10` removes only `O(log m)` from the logarithm of the imported lower bound.

Suppose a uniform quantified formula for the graph had size `N=m^{O(1)}`, a polynomial-time quantifier-free predicate, and `h=h(m)` quantifier blocks. Under the hypothetical HN decider, Lemma 3.1 would give a graph decider with

```math
\log T(m)=O\!\big(q^{h(m)}\log m\big).
```

It would contradict the imported lower bound whenever

```math
q^{h(m)}=o\!\big((\log m)^{1/3}\big).
```

In particular, the condition

```math
h(m)=o(\log\log m)
```

would suffice for every fixed hypothetical polynomial HN exponent. For a bound `h(m)≤δ log log m`, a sufficient condition is `δ log q<1/3`. Merely writing `h=O(log log m)` leaves its coefficient uncontrolled, while the exponent of a hypothetical HN decider is also uncontrolled. A tunable family of protocols with arbitrarily small positive `δ` would suffice, provided each chosen protocol remains uniformly constructible and of polynomial size.

No protocol meeting these conditions has been obtained. This criterion narrows the quantitative target without claiming a hierarchy membership theorem that has not been proved.

## 5. Independent review of the current weighted protocol

The review checked the following assertions in [PROTOCOL.md](PROTOCOL.md):

- The Ryser-type identity holds for all complex matrices; expanding by the image of a row-to-column map gives the stated cancellation.
- `D=m+1` bounds each variable's degree, and Horner evaluation gives a polynomial-time predicate.
- The `exists a_1, forall r_1, ..., exists a_m, forall r_m` prefix has both completeness and soundness with the stated dependence on earlier challenges.
- The degree-two interpolation lemma proves that moving all challenges before all messages accepts every input and claimed value.
- At `m=2`, `X=I_2`, moving all messages before challenges rejects the correct value `1`, because the terminal polynomial would need to depend on the first challenge without permission to do so.

These checks establish the exact failures of two proposed quantifier reorderings. They do not preclude a different compressed protocol.

## 6. Testing a direct flat-case transfer

Research calculation, 23 November 2026 (America/Chicago). The tensor product in Definition A.1 of the [pinned Anthropic paper](https://github.com/anthropics/formal-math/tree/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp) is not multiplication of polynomials in the same variable blocks. The following exact example rules out replacing that distinction by a divisibility-monotonicity assertion for ordinary coefficient tensors. It does not contradict Appendix E or establish anything about nonzero multiples of the universal resultant.

Put `D=2^s>=4` and `d=D-1`, and define

```math
f_D(x,y)=1+\sum_{i=0}^{d}x^{d-i}y^i,
\qquad Q=x-y.
```

Then

```math
f_DQ=x^D-y^D+x-y.                                 \tag{1}
```

The factor `f_D` is irreducible over `C`. In the localization where `x!=0`, use `w=1/x,t=y/x`. Up to the unit `w^(-d)`, the polynomial becomes

```math
w^d+q(t),\qquad q(t)=1+t+\cdots+t^d.
```

For any nontrivial `D`-th root of unity `zeta`, the polynomial `q` has a simple root at `zeta`. Eisenstein's criterion at the prime `t-zeta` of `C[t]` proves irreducibility in `C[t,w]`, and hence after localizing `w`. A factor of `f_D` that becomes a unit under the corresponding localization of `C[x,y]` would be a scalar times a power of `x`. Its constant term one excludes such a nonconstant factor. This proves the claim in `C[x,y]`.

Let `T(f)` be the coefficient tensor with the powers of `x` as one index and the powers of `y` as the other. In the bases `1,x,...,x^d` and `1,y,...,y^d`, the matrix of `T(f_D)` is the invertible anti-diagonal matrix `J` plus `E_(0,0)`. Its determinant equals `det J`, since `(J^(-1))_(0,0)=0`. Thus

```math
\mathop{\mathrm{rank}}T(f_D)=D,
\qquad
\mathop{\mathrm{rank}}T(f_DQ)=2.                  \tag{2}
```

The second equality follows from (1): its two independent separated terms are `a(x)*1` and `-1*a(y)`, where `a(z)=z^D+z`. Both circuits have size `O(s)`. For the first, use

```math
\sum_{i=0}^{D-1}x^{D-1-i}y^i
 =\prod_{j=0}^{s-1}(x^{2^j}+y^{2^j}),
```

with shared successive squarings. The product in (1) has an equally short repeated-squaring circuit. The cofactor itself is linear and has constant circuit size.

### Separate homogeneity does not restore the inequality

For blocks `X=(x_0,x_1)` and `Y=(y_0,y_1)`, separately homogenize:

```math
F_D(X,Y)=x_0^d y_0^d+
 \sum_{i=0}^{d}x_1^{d-i}x_0^i y_1^i y_0^{d-i}.
```

This polynomial is bihomogeneous of degree `(d,d)` and irreducible. Indeed, it dehomogenizes to `f_D`, and neither `x_0` nor `y_0` divides it; localization at `x_0y_0` gives the claim. Its coefficient matrix in the degree-`d` monomial bases is an identity matrix plus one off-diagonal elementary matrix, so has rank `D`.

The cofactor `Q_h=x_1y_0-x_0y_1` has bidegree `(1,1)`, and direct multiplication gives

```math
F_DQ_h
 =(x_1^D+x_1x_0^d)y_0^D
   -x_0^D(y_1^D+y_1y_0^d).                        \tag{3}
```

Its coefficient matrix has rank exactly two. All circuits still have size `O(s)`: substitute `a=x_1y_0,b=x_0y_1` in the product formula above and add `(x_0y_0)^d`.

### Exact consequence for the proposed price transfer

Matrix rank is a spectral point in the pinned paper's Definition A.1. More generally, on two parties every nonzero tensor of rank `r` is equivalent under mutual restrictions to the wire of dimension `r`. Lemma A.2 therefore makes the values in (2) equal to `D^gamma` and `2^gamma` for any spectral point having positive wire exponent `gamma`. Hence an inequality

```math
\varphi(T(FQ))\ge\varphi(T(F))
```

is false even for an irreducible bihomogeneous `F` and a cofactor of constant degree and circuit size.

The correct operation is local convolution. If `mu_X,mu_Y` multiply monomials within each variable block, then

```math
T(FQ)=(\mu_X\otimes\mu_Y)(T(F)\otimes T(Q)).
```

This gives a restriction of the tensor product, hence an upper bound by `varphi(T(F))varphi(T(Q))`. It does not give a restriction in the reverse direction; the ranks in (2) prohibit one.

The distinction also appears on a whole graph. Put an independent copy of `F_D` on every edge, with separate two-variable blocks at its two ends, and multiply these edge polynomials. On the half-edge coefficient indices, the resulting tensor is equivalent to a product of dimension-`D` wires. Its polynomial circuit nevertheless has size `O(|E|s)`. Multiplication by the product of the corresponding `Q_h` changes these to dimension-two wires with another `O(|E|)` gates. This does not instantiate the hard network polynomial of Appendix E: the node coordinates here are high-degree monomials in the actual input variables. They are not independent variables indexed by all incident edge strings. In particular, this high-degree coefficient tensor is not the tensor of the part linear in each original node block. Lemma E.4 applies to arbitrary circuits but bounds that linear-in-each-block part; it does not bound the high-degree tensor used here.

A direct resultant argument using prices must prove a different invariant or a tensor construction for which the needed circuit decomposition and cofactor inequality both hold. This example excludes the ordinary coefficient-tensor shortcut only. Its irreducible factor is not the resultant, and its cheap circuits make no arithmetic-circuit lower-bound claim.

Independent check: `ph_bridge_fresh` verified irreducibility, both rank calculations, the homogenized product identity, and the circuit costs. This is a separate model-worker review, not human refereeing or formal verification.
