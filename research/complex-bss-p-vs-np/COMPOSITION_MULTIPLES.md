# High-degree univariate compositions cannot hide the hard resultant jet

Research status, 23 November 2026. This note proves a restricted nonzero-multiple lower bound, using the permanent border lower bound adopted by the repository and the BCJS resultant specialization. It does not prove a lower bound for every nonzero multiple of a resultant, and does not settle `P_C != NP_C` or Bürgisser's Conjecture 1.1.

The restriction is substantial: the cofactor must be a polynomial in the resultant itself. Its degree, coefficients, and circuit complexity are unrestricted. No argument below shows that a generic accepting branch of an HN decider produces a cofactor of this form.

## 1. A degree-independent jet lemma for univariate compositions

Let `R` be a nonconstant polynomial in `N` variables over `C`. Let `phi` be any nonconstant univariate polynomial, and suppose that

```math
F(A)=\phi(R(A))
```

has a division-free arithmetic circuit of size `L`. Constants are arbitrary complex scalars. Let `a` be any point of `C^N`, and let `D>=0`.

**Lemma.** The degree-`D` Taylor polynomial `J_a^D R` has border arithmetic complexity bounded by one fixed polynomial in `L+N+D+1`. The bound is independent of `deg R`, `deg phi`, and the multiplicity of the equation `phi(t)=phi(R(a))` at `t=R(a)`.

For example, a coarse bound of the form

```math
\underline L(J_a^D R)
\le C(L+N+1)(D+1)^3
```

holds with an absolute constant `C`, after increasing `C` to account for input and scalar gates. The exponent is not asserted to be optimal.

### Proof

Since the field has characteristic zero and `phi` is nonconstant, `phi'` is a nonzero polynomial. Since `R` is nonconstant, `phi'(R)` is also a nonzero polynomial. Thus

```math
U=\{b\in\mathbb C^N:\phi'(R(b))\ne0\}
```

is a nonempty Zariski-open set.

Fix `b` in `U`. The analytic inverse-function theorem gives a holomorphic inverse of `phi` near `R(b)`. Consequently, on a neighborhood of `b`,

```math
R(A)=R(b)+\sum_{j\ge1}c_{b,j}(F(A)-F(b))^j
```

for scalar coefficients `c_{b,j}`. For a degree-`D` Taylor polynomial, only the first `D` coefficients are needed: the function `F(A)-F(b)` has positive order at `b`. These coefficients, `R(b)`, and `F(b)` are permitted complex circuit constants. Their computation is not required in a nonuniform upper bound.

Substitute `A=b+tX` into the given circuit for `F`, and evaluate it modulo `t^(D+1)`. Store each truncated series as its `D+1` homogeneous-component circuits. Addition costs `O(D+1)` gates, and multiplication costs `O((D+1)^2)` gates. Thus the truncated input expression costs `O(L(D+1)^2+N)` gates, independently of its formal degree. Apply Horner's rule to the degree-`D` polynomial

```math
R(b)+\sum_{j=1}^{D}c_{b,j}T^j,
```

again in the truncated ring. This takes `O((D+1)^3)` gates. Set `t=1` and translate `X=A-b`. The resulting polynomial is exactly `J_b^D R` and has circuit size at most `C(L+N+1)(D+1)^3`.

Choose points `b` of `U` tending to the specified center `a`. The polynomial `R` is fixed, so its derivatives are continuous. The coefficients of `J_b^D R`, in the original `A` coordinates, tend to those of `J_a^D R`. All the approximants have degree at most `D` and the same circuit-size bound. The coefficientwise closure characterization of border complexity therefore gives the asserted bound at `a`.

In particular `phi'(R(a))` may vanish to arbitrarily high order: the inverse is used at nearby regular centers, not at the prescribed center. Inverse-series constants may diverge as those centers approach `a`, which is permitted for border circuits; the output Taylor polynomials still converge. The bound is uniform in `R`, `phi`, and `a`, although the scalar constants are not. QED.

## 2. Application to polynomial compositions of the quadratic resultant

Let `R_N` be the resultant of `N` generic homogeneous quadrics in `N` variables. Use the notation of [FOURIER_RESULTANT_FILTER.md](FOURIER_RESULTANT_FILTER.md). For `m=3^r+1`, `s=m^2`, and `N>=5s`, let `P_N^grid(A)` be the BCJS grid specialization of `R_N`. It satisfies `P_N^grid(0)=1`.

BCJS Lemmas 3.4 and 3.6 imply that the triangle counts of every monomial in this specialization are all congruent modulo three. BCJS Lemma 3.7 identifies its degree-`s` component with `kappa H_m`, where `kappa!=0` and `H_m` has an explicit polynomial-size projection to the permanent family. Hence the three-evaluation character projector proved in `FOURIER_RESULTANT_FILTER.md` satisfies

```math
\Pi_1 J_0^sP_N^{grid}=\kappa H_m.
```

**Theorem.** Assume the pinned permanent border lower bound. For every sufficiently large `N` and every nonconstant univariate polynomial `phi_N` over `C`,

```math
L(\phi_N(R_N))
\ge\exp\!\left(\Omega((\log N)^{4/3})\right),
```

where the constant in `Omega` is independent of `phi_N` and its degree.

**Proof.** Suppose `F_N=phi_N(R_N)` has size `L`. Apply the BCJS specialization to its circuit. This gives a circuit of size `L+poly(N)` for `phi_N(P_N^grid)`. The lemma with `D=s` gives a border circuit of size `poly(L+N)` for `J_0^s P_N^grid`. The character projector uses three copies, and the BCJS projection then gives

```math
\underline L(\mathop{\mathrm{per}}_k)
\le\mathop{\mathrm{poly}}(L+N)
```

for `k=m-1=Theta(m)`. This dimension relation follows directly from BCJS Lemma 3.3 and its Appendix A.1: when the input permanent has size `m-1`, the smallest permitted grid size `3^r+1` strictly exceeding it is `m`. For each sufficiently large `N`, take the largest permitted `m` with `5m^2<=N`. Then `m=Theta(sqrt(N))`. The imported permanent lower bound is `exp(Omega((log k)^(4/3)))`; polynomial overhead therefore gives the stated lower bound on `L`. All choices and constants in the jet lemma have one fixed polynomial size bound, so its exponent does not depend on `phi_N`. QED.

In particular this applies to every nonzero multiple of the form

```math
R_N\,q_N(R_N),
\qquad 0\ne q_N\in\mathbb C[T],
```

and to all powers `R_N^e`, for arbitrary integers `e>=1`. The cofactor can have arbitrarily high degree. The proof does not require a small circuit for `q_N` or `phi_N`.

## 3. What remains uncontrolled

A generic accepting branch of a hypothetical HN decider yields a nonzero polynomial `F_N=R_N Q_N` with `Q_N` an arbitrary polynomial in all coefficient variables. It gives no reason for `Q_N` to belong to the one-variable subalgebra `C[R_N]`. Even an affine coefficient polynomial `1+a_*` lies outside that subalgebra when `deg R_N>1`.

The theorem therefore handles multiplicity and arbitrary univariate functions of the resultant, but not independent dependence of the cofactor on the coefficient parameters. The all-multiple criterion in [RESULTANT_EXCLUSION.md](RESULTANT_EXCLUSION.md) remains open.

The obstruction to a universal *linear* logarithmic-jet filter can be stated exactly. If `R(0)=1`, and `M` is any degree-`D` monomial with `D>=1`, then for the elementary unit cofactor `Q=1+lambda M`,

```math
\log(RQ)\equiv\log R+\lambda M
\pmod{(A)^{D+1}}.
```

Every such `Q` has an `O(D)`-gate circuit. Thus any fixed linear operator on degree-`D` jets which annihilates the perturbation from every one of these cofactors annihilates every degree-`D` homogeneous polynomial. In particular it cannot retain a nonzero hard component of that degree. This rules out that linear filtering principle; it does not rule out nonlinear recovery depending on the circuit for `F_N`.

Natural resultant symmetries also do not force an arbitrary cofactor into `C[R_N]`. The orbit-dimension and masking argument in [SYMMETRY_JET_BARRIER.md](SYMMETRY_JET_BARRIER.md) explains a different limitation of fixed low-dimensional symmetry families. Neither argument proves that a small circuit for some general `R_N Q_N` exists.

## Sources and verification scope

- BCJS, *Multivariate Resultants: Complexity and Applications to Real Feasibility*, author manuscript, Section 3, specifically Lemmas 3.4, 3.6, 3.7 and the grid-to-permanent projection in Lemma 3.3 and Appendix A.1: https://bhargavcs.github.io/files/resultants-and-etr.pdf .
- The pinned Anthropic paper and formal statements: https://github.com/anthropics/formal-math/tree/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp . This note uses the repository's standing imported premise and does not re-audit it.
- The homogeneous truncation and coefficientwise closure arguments are also used in `SINGULAR_WITNESS.md`, Section 4. Bürgisser, arXiv:1812.06828v1, Theorem 2.4 gives the closure characterization of border complexity used here.

The composition lemma and its application are written deductions from these ingredients. No priority claim, Lean formalization, or external peer review is claimed. The target BSS separation remains unresolved.
