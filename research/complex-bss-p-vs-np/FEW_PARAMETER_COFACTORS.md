# Cofactors depending on few easy polynomial parameters

Research status, 23 November 2026. This extends [COMPOSITION_MULTIPLES.md](COMPOSITION_MULTIPLES.md). It proves a restricted all-multiple result, not the full exclusion-complexity lower bound. Arbitrary complex constants are allowed throughout.

## 1. A local composition lemma

Let `R` be a nonconstant polynomial in `N` variables `A`. Let `h_1,...,h_k` be polynomials with a shared division-free circuit of size `S`. Suppose

```math
F=R\,q(R,h_1,\ldots,h_k)\ne0,
\qquad q\in\mathbb C[T,Y_1,\ldots,Y_k],
```

and that `F` has a division-free circuit of size `L`. There is no degree or circuit bound on `q`. For any center `a` and Taylor order `D>=0`,

```math
\underline L(J_a^D R)
\le C(L+S+N+k+1)(D+1)^3
\binom{D+k+1}{k+1},
```

with an absolute constant `C`, after adjusting circuit conventions by a constant factor. In particular this bound is polynomial in `L+S+N+D` when `k` is fixed.

### Proof: at generic points the output depends analytically on few small functions

Put `K=C(h_1,...,h_k)`, a subfield of `C(A)`. There are two cases.

First suppose `R` is transcendental over `K`. The polynomial

```math
\Phi(T)=Tq(T,h_1,\ldots,h_k)\in K[T]
```

is nonzero and has positive degree. Indeed, if `q(T,h)` were zero in `K[T]`, its evaluation at `R` would make `F=0`; and multiplying a nonzero polynomial in `T` by `T` produces positive degree. Characteristic zero implies `Phi'(T)!=0`. Transcendence of `R` then gives `Phi'(R)!=0` in `C(A)`.

Consequently, at every point of a nonempty Zariski-open set, the equation

```math
Z=Tq(T,Y_1,\ldots,Y_k)
```

has nonzero derivative with respect to `T` at

```math
(T,Y,Z)=(R(b),h(b),F(b)).
```

The analytic implicit-function theorem supplies a holomorphic function `Gamma_b` of `k+1` variables such that, near `A=b`,

```math
R(A)=\Gamma_b(F(A),h_1(A),\ldots,h_k(A)).
```

Now suppose instead that `R` is algebraic over `K`. Its minimal polynomial over `K` is separable, since the field has characteristic zero. Clear its coefficient denominators and represent those coefficients by polynomials in `h`. This produces a polynomial `P(T,Y)` such that

```math
P(R,h)=0,
\qquad \partial_TP(R,h)\ne0.
```

The derivative remains nonzero after denominator clearing because the clearing denominator is a nonzero element of `K`. At each point of a nonempty Zariski-open set, the implicit-function theorem now gives a holomorphic function of only `k` variables with

```math
R(A)=\Gamma_b(h_1(A),\ldots,h_k(A))
```

near `b`. This conclusion does not require algebraic independence of the `h_i`: the polynomial equation and its nonzero `T` derivative permit the implicit function on an ambient neighborhood of `h(b)`.

### Proof: the Taylor polynomial has a small circuit

In either case, write `u_1,...,u_p` for the small functions used as arguments of `Gamma_b`. We have `p<=k+1`, and their shared circuit size is at most `L+S`. The degree-`D` Taylor polynomial of `Gamma_b` at `u(b)` has at most

```math
B_p=\binom{D+p}{p}
```

coefficients. All these coefficients are permitted scalar constants, irrespective of the degrees of `q` and `P`.

Substitute `A=b+tX` into the circuits for the `u_i` and evaluate modulo `t^(D+1)`. This produces their homogeneous-component circuits at cost `O((L+S+N)(D+1)^2)`. Every `u_i(b+tX)-u_i(b)` has positive `t` order. Therefore the Taylor polynomial of `Gamma_b` through total degree `D` suffices to compute `J_b^D R` exactly. Evaluate its at most `B_p` monomials in the truncated ring. Precomputing the first `D` powers of each argument, then multiplying at most `p` factors for each monomial, costs

```math
O\bigl(p(D+1)^3+pB_p(D+1)^2\bigr)
```

arithmetic gates. Addition and scalar multiplication fit inside this bound. Set `t=1` and translate from `X` to `A-b`. This gives the stated circuit bound for `J_b^D R` at every permitted generic center `b`.

Choose such centers tending to the specified point `a`. The polynomial `R` is fixed, so its derivatives are continuous. The Taylor polynomials `J_b^D R`, written in the original `A` coordinates, converge coefficientwise to `J_a^D R`. They all have degree at most `D` and the same circuit-size bound. Closure therefore proves the border bound at `a`. No algorithm for choosing the local inverse coefficients is asserted. QED.

## 2. Consequences for quadratic resultant multiples

Use the quadratic resultant `R_N`, BCJS grid specialization, and three-evaluation hard-coefficient filter specified in [FOURIER_RESULTANT_FILTER.md](FOURIER_RESULTANT_FILTER.md). Assume the pinned permanent border lower bound.

For a fixed integer `k`, consider a nonzero multiple

```math
F_N=R_N\,q_N(R_N,h_{N,1},\ldots,h_{N,k}).
```

Let `L_N` be the circuit size of `F_N`, and let `S_N` be the shared circuit size of the `h_{N,i}`. There is no degree or circuit bound on `q_N`. Then

```math
L_N+S_N
\ge\exp\!\left(\Omega_k((\log N)^{4/3})\right).
```

**Derivation.** Let `a_0` be the point in the full quadratic-coefficient space corresponding to the grid origin, and write the affine BCJS grid map as `sigma(A)=a_0+ell(A)`, with `ell` linear. Apply the lemma to the original, nonzero `F_N` in its full coefficient space, whose dimension is `N binom(N+1,2)=O(N^3)`. Choose the largest `m=3^r+1` with `5m^2<=N`, and use Taylor order `D=m^2=Theta(N)`. This produces a border circuit of size polynomial in `L_N+S_N+N`, with polynomial exponent depending on the fixed `k`, for `J_{a_0}^D R_N`.

Only now pull this jet back along the grid map. Homogeneous Taylor expansion gives the exact identity

```math
(J_{a_0}^D R_N)(a_0+\ell(A))
=J_0^D(R_N\circ\sigma)(A)
=J_0^D P_N^{grid}(A).
```

The affine substitution adds only polynomial overhead. The three-evaluation character projector extracts the hard degree-`D` component. BCJS Lemma 3.3 and Appendix A.1 project this component to the permanent of size `m-1`, which is `Theta(sqrt(N))`: the smallest allowed grid size strictly exceeding `m-1` is `m` itself. The imported lower bound gives the conclusion.

Applying the lemma before specialization is necessary. A cofactor may vanish identically on the grid; for example it may equal a coefficient that the grid map sets to zero. The nonvanishing hypothesis is used only for the original `F_N`, and no nonvanishing of its specialized polynomial is required.

The explicit binomial overhead also gives a bound when k grows with N. There cannot be a family with `L_N+S_N=N^{O(1)}` and

```math
k_N=o((\log N)^{1/3})
```

of the displayed form. In that range,

```math
\log\binom{D+k_N+1}{k_N+1}
=O((k_N+1)\log N)
=o((\log N)^{4/3}),
```

which is smaller than the logarithm of the imported permanent lower bound. Thus a cofactor cannot conceal the hard resultant jet by depending polynomially on the resultant and this few additional polynomial quantities computed by small circuits.

Taking `k=0` recovers the composition-multiple result. It also gives a shorter proof of that result: at generic centers where `phi'(R)` is nonzero, invert `phi` analytically, use its first `D` inverse coefficients as constants, and pass to any specified center by a border limit. This is the proof given in `COMPOSITION_MULTIPLES.md`; moving the center handles arbitrary ramification at the specified point.

## 3. Exact limitation

The cofactor must be **polynomial** in the displayed arguments. Allowing arbitrary rational dependence makes the condition vacuous: with `h_1=F`, one can write `Q=h_1/R`. In that case `R q(R,h)` is independent of `R`, so the positive-degree and nonzero-derivative argument fails. The proof does not cover that case.

For an arbitrary cofactor `Q(A)`, no small set of small-circuit polynomial parameters `h_i` is known in which `Q` is polynomial together with `R`. Taking all coefficient variables as the `h_i` gives a parameter count of order `N^3`; the binomial Taylor overhead is then exponential and does not contradict the available lower bound. Taking `h_1=Q` is also unhelpful when no small circuit for `Q` is known.

The generic-branch lemma for BSS decision trees produces an unrestricted cofactor. It does not establish the hypothesis of this note. Therefore the all-nonzero-multiple criterion and the complex BSS separation remain unresolved.

## Verification scope

The only analytic inputs are the ordinary complex implicit-function theorem, separability in characteristic zero, continuity of finite Taylor jets, and the coefficientwise closure characterization of border circuits. The resultant extraction uses the explicitly cited BCJS lemmas and the already written character-filter proof. This is a written mathematical deduction, with no Lean formalization, novelty claim, or claimed full separation.
