# A supplied exclusion polynomial removes the extraneous poles

Research checkpoint, 23 November 2026 (America/Chicago). This note strengthens the special one-equation consequence of a generic accepting path. A small exclusion polynomial removes every extraneous logarithmic pole without factoring that polynomial. The remaining normalization is a specific polynomial remainder with integer multiplicity values. That remainder is not proved easy. An irreducible exclusion polynomial, or a supplied small factor list, does give a complete extraction of normalized finite jets.

## 1. The simple-pole presentation

Work over `C`, with arbitrary complex circuit constants. Let `x=(x_1,...,x_n)`, and suppose

```math
P=R^eQ\ne0,\qquad e\ge1,\qquad
R\text{ irreducible},\qquad
\gcd(R,G)=1,\qquad \mathop{\mathrm{rad}}(Q)\mid G.
\tag{1}
```

The nonzero polynomials `P,G` have a shared division-free circuit of size at most `s`. These are exactly the divisorial hypotheses in the one-equation case of [SATURATED_PATH_RADICAL_JETS.md](SATURATED_PATH_RADICAL_JETS.md), Section 2. They are not asserted for an arbitrary constant combination of several equality tests.

Choose a constant direction `v` with `partial_v R` nonzero. Define

```math
B_v=G\frac{\partial_vP}{P},\qquad
T_v=G\frac{\partial_vQ}{Q}.
```

Then

```math
B_v=eG\frac{\partial_vR}{R}+T_v,
\qquad T_v\in\mathbb C[x],\qquad
\deg T_v\le\deg G-1
\tag{2}
```

when `T_v` is nonzero. Indeed, write `Q=c product_j q_j^{m_j}` into distinct irreducible factors. Each `q_j` divides `G`, so

```math
T_v=\sum_j m_j(G/q_j)\partial_vq_j
```

is polynomial and has the stated degree. This identity proves polynomiality; it does not supply the unknown factors or circuits for the quotients `G/q_j`.

The rational function `B_v` has a pole of order exactly one along `R=0` and no other finite divisorial pole. To check exactness, `R` divides neither `G` nor the nonzero derivative `partial_v R`, whose degree is smaller than `deg R`. Hence the first summand of (2) has an uncanceled simple `R` pole, while the second summand is polynomial. Differentiating a circuit gate by gate and forming `B_v` costs `O(s+n)` arithmetic operations, including the final division on its defined domain. No power `G^K`, reduced denominator, or factorization is computed.

In particular, the adaptive coefficient here is supplied by the accepting path. This is within the explicit allowance for input-dependent coefficients in the separate tau note [NONRATIONAL_POLE_FILTERS.md](../shub-smale-tau/NONRATIONAL_POLE_FILTERS.md), Section 3. That note's fixed-filter obstruction does not prohibit (2).

## 2. The exact remainder and its integer values

To state the one-variable normalization, choose `v` generically and put `x=a+tv`, where `a` consists of `n` independent parameters and `K=C(a)`. Write the resulting polynomials as `p,r,q,g` and the resulting rational function as `B`. The generic choice can make the highest homogeneous part of every nonconstant irreducible factor of `RG` nonzero at `v`. Consequently each such factor has positive `t` degree, has constant nonzero leading coefficient, and remains irreducible in `K[t]`: translation is an automorphism of `C[a,t]`, and primitivity permits Gauss's lemma. Distinct factors remain coprime. In particular,

```math
\gcd(r,g)=1,\qquad r\text{ is squarefree in }K[t].
```

Equation (2) becomes

```math
B=g\frac{p'}p=eg\frac{r'}r+T,
\qquad T=g\frac{q'}q\in K[t],\qquad \deg_tT<\deg_tg.
\tag{3}
```

If `g` is constant, then `q` is constant and `T=0`; in that case `B/(eg)=r'/r` already gives the normalized logarithmic derivative. Otherwise let

```math
\mathcal A_g=\{u/v\in K(t):\gcd(v,g)=1\}.
```

Reduction modulo `g` is defined on this localized ring because each allowed denominator is a unit in `K[t]/(g)`. Equation (3) shows that `B` belongs to this ring and that

```math
T=\text{the unique polynomial of degree below }\deg g
   \text{ representing }B\bmod g.
\tag{4}
```

This is a statement about the rational function after algebraic cancellation. The supplied expression `g p'/p` can have undefined intermediate divisions at a root of `g`; (4) does not certify its regular value by evaluating those gates there.

Suppose in addition that `g` is squarefree. At any root `beta` in an algebraic closure of `K`, let `m_beta=ord_beta(q)`, including `m_beta=0` when that exclusion root is unused. Then

```math
T(\beta)=m_\beta g'(\beta),\qquad
m_\beta\in\mathbb Z_{\ge0},\qquad
m_\beta\le\deg P\le2^{O(s)}.
\tag{5}
```

For `m_beta>0`, substitute `g=(t-beta)u` and `q=(t-beta)^{m_beta}w` with `u(beta)w(beta)` nonzero. The constant term of `g q'/q` is `m_beta u(beta)`, and `u(beta)=g'(beta)`. For `m_beta=0`, the expression vanishes at `beta`. Thus `T/g'` modulo `g` is the interpolation of the multiplicities of `p` on the exclusion roots. Those values are constant on the roots belonging to each irreducible factor of `g` over `K`.

The integers in (5) have short binary descriptions. Neither a generic extension of the field nor an HN decision oracle has been shown to output these regular multiplicities or their aggregate interpolation with polynomially many BSS operations. The modular-inverse example in [IMPLICIT_SYLVESTER_FRONTIER.md](IMPLICIT_SYLVESTER_FRONTIER.md), Section 4.1, has continuously varying values; it does not refute a method specific to the integer profile (5).

## 3. Complete jet extraction when the exclusion factors are supplied

Assume now that a complete list of the distinct irreducible factors `g_1,...,g_r` of `G` in `C[x]` is supplied, with total shared circuit size `sigma`. No routine producing that list from `G` is assumed. By (1), there are nonnegative integers `m_i` and a nonzero scalar `c` such that

```math
Q=c\prod_{i=1}^r g_i^{m_i}.
\tag{6}
```

For each fixed instance these integers and `e` may be used as scalar constants in the nonuniform circuit bound below. Alternatively they may be supplied explicitly. Finding them uniformly is not part of the claim. Their binary lengths are `O(s+1)` because `m_i,e<=deg P`.

Let `J_b^D` denote the total-degree Taylor jet through degree `D` at `b`, written in increment variables. At a center where `P(b) product_i g_i(b)` is nonzero, (6) gives in the truncated power-series ring

```math
J_b^D\log\frac{R(x)}{R(b)}
 =\frac1e\left(
 J_b^D\log\frac{P(x)}{P(b)}
 -\sum_{i=1}^r m_iJ_b^D\log\frac{g_i(x)}{g_i(b)}
 \right).
\tag{7}
```

All logarithms here are finite algebraic operations: for a series `1+u` with `u(0)=0`, use `sum_(j=1)^D (-1)^(j+1)u^j/j` modulo terms of degree above `D`. Apply the finite exponential `sum_(j=0)^D h^j/j!` to the right-hand side of (7). The result is exactly

```math
J_b^D\frac{R(x)}{R(b)}.
\tag{8}
```

Gatewise evaluation at `b+epsilon X`, keeping the `D+1` coefficients of `epsilon`, computes all required input jets in `O((s+sigma+n+1)(D+1)^2)` gates. The polynomial logarithms, their weighted sum, and the final exponential can be computed by truncated convolution in `O((r+1)(D+1)^3)` further gates. Thus a fixed absolute constant `C` gives the safe bound

```math
L\left(J_b^D\frac{R}{R(b)}\right)
 \le C(s+\sigma+n+r+1)(D+1)^3.
\tag{9}
```

Every multiplication, division by a nonzero scalar, and truncated convolution is charged. The allowed complex scalar constants include the center, the nonzero normalization values, and the integers in (7). The bound concerns the model with arbitrary constants and makes no constant-free claim.

For any target center `a` with `R(a)!=0`, permissible centers `b` form a dense open set and can tend to `a`. The normalized jets (8) converge coefficientwise to `J_a^D(R/R(a))`. Border-closure therefore gives the same bound as (9) for its border circuit complexity, even when some exclusion factors vanish at `a`. This is performed in the full coefficient space before any BCJS grid pullback.

An irreducible nonconstant `G` is the special case `r=1`, `g_1=G`, `sigma<=s`. Then `Q=cG^m`, and (7) uses only the supplied circuits for `P,G`. A constant `G` gives `Q` constant and the usual pure-power extraction. These are complete positive cases, independent of the degrees and multiplicities of the supplied exclusion factors.

## 4. Remaining scope

For the universal quadratic resultant, the target center has resultant value one and the needed jet order in the [reviewed BCJS extraction](FOURIER_RESULTANT_FILTER.md) is polynomial in the matrix size. Thus a hypothetical polynomial-time HN decider cannot always yield a one-equation generic accepting presentation with an irreducible exclusion polynomial, or with a polynomial-size supplied complete factor list, under the standing permanent border lower bound. This is a restriction on such presentations, not a proof that arbitrary HN deciders have them.

For an unrestricted exclusion `G`, (4) is the remaining specific operation. Its circuit size is not bounded here by the sizes of `P,G` and the requested jet order. Dutta--Jindal--Pandey--Sinhababu, *Arithmetic Circuit Complexity of Division and Truncation*, CCC 2021, DOI [10.4230/LIPIcs.CCC.2021.25](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.CCC.2021.25), Theorem 4 and Section 3.3, retain a polynomial dependence on the divisor degree, including in their border extension. Their Section 4 discusses unrestricted reduced-form recovery as a high-degree gcd/division problem. Those results do not supply the missing bound for (4).

The simple-pole identity removes extraneous pole support using the actual exclusion circuit. It leaves the normalization of the surviving support unresolved. No fixed-level complex polynomial-hierarchy definition of that normalized aggregate is proved here.
