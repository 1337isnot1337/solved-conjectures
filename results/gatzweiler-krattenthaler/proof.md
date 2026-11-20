# Gatzweiler–Krattenthaler conjecture

Cinna Davis and GPT-6.2 Astra, 20 November 2026.

**Status: previously disproved; excluded from new-resolution claims.** The [CoPEER archive](https://github.com/qqliu/CoPEER/blob/105523fdaf018b62eaf2883347724dfe79935611/mathematics/discoveries/entries/number-theory/fake-gaussian-positivity-counterexample.md) contains an exact counterexample to Conjecture 4, with an internal deposition date of 11 September 2026. Its [public repository commit](https://github.com/qqliu/CoPEER/commit/105523fdaf018b62eaf2883347724dfe79935611) is dated 24 October 2026. The complete source binding and arithmetic were independently checked on 20 November 2026. The five-factor family below is retained as an independently found exposition of the same already resolved conjecture.


## Statement and scope

Gatzweiler and Krattenthaler state the following as Conjecture 4 in *A positivity conjecture for a quotient of q-binomial coefficients*, Ramanujan Journal **69** (2026), Article 13, [doi:10.1007/s11139-025-01285-2](https://doi.org/10.1007/s11139-025-01285-2), [arXiv:2502.06032v3](https://arxiv.org/abs/2502.06032v3).

Let $`m\ge n\ge1`$ be integers and let $`a_1,\ldots,a_n`$ be nonnegative integers. If

```math
F_{m,a}(q)=\prod_{i=1}^{n}\left(\frac{1-q^{m+i}}{1-q^i}\right)^{a_i}
```

is a polynomial, then its coefficients are nonnegative.

The conjecture is false. The counterexample below refutes this full shifted-product assertion. It makes no claim about Conjecture 1 of the same paper, concerning quotients of two Gaussian binomial coefficients, or Conjecture 3, which requires a symmetric exponent sequence. It also makes no claim about Stanton's original symmetric conjecture, which assumes polynomiality for every shift.

## Theorem

For every positive integer $`r`$, set $`m=33r`$, $`n=30r`$, and

```math
a_i=\begin{cases}1,&i\in\{17r,18r,21r,27r,30r\},\\0,&\text{otherwise.}\end{cases}
```

Then $`m\ge n`$, all $`a_i`$ are nonnegative integers, and $`F_{m,a}(q)`$ is an integer polynomial with

```math
[q^{50r}]F_{m,a}(q)=-1.
```

## Proof

Define

```math
P(q)=\frac{(1-q^{50})(1-q^{51})(1-q^{54})(1-q^{60})(1-q^{63})}
{(1-q^{17})(1-q^{18})(1-q^{21})(1-q^{27})(1-q^{30})}.
```

The five numerator exponents are obtained by adding $`33`$ to the five denominator exponents. Consequently the claimed family is exactly $`F_{m,a}(q)=P(q^r)`$.

### Polynomiality

Write $`\Phi_d(q)`$ for the $`d`$th cyclotomic polynomial. The identity $`q^k-1=\prod_{d\mid k}\Phi_d(q)`$ gives

```math
P(q)=\Phi_2(q)\Phi_4(q)\Phi_5(q)\Phi_{10}(q)\Phi_{12}(q)
\Phi_{20}(q)\Phi_{25}(q)\Phi_{50}(q)\Phi_{51}(q)
\Phi_{54}(q)\Phi_{60}(q)\Phi_{63}(q).
```

For completeness, the factor cancellation can be checked from this table. The first column lists every cyclotomic index occurring in a denominator factor; $`u_d`$ and $`v_d`$ are its numerator and denominator multiplicities. The remaining numerator indices are listed in the last row.

| $`d`$ | $`u_d`$ | $`v_d`$ | $`u_d-v_d`$ |
| :--- | ---: | ---: | ---: |
| $`1`$ | 5 | 5 | 0 |
| $`2`$ | 3 | 2 | 1 |
| $`3`$ | 4 | 4 | 0 |
| $`5`$ | 2 | 1 | 1 |
| $`6`$ | 2 | 2 | 0 |
| $`7`$ | 1 | 1 | 0 |
| $`9`$ | 2 | 2 | 0 |
| $`10`$ | 2 | 1 | 1 |
| $`15`$ | 1 | 1 | 0 |
| $`17`$ | 1 | 1 | 0 |
| $`18`$ | 1 | 1 | 0 |
| $`21`$ | 1 | 1 | 0 |
| $`27`$ | 1 | 1 | 0 |
| $`30`$ | 1 | 1 | 0 |
| Each of $`4,12,20,25,50,51,54,60,63`$ | 1 | 0 | 1 |

There are five factors $`1-q^k`$ in each of the numerator and denominator, so their signs cancel. Every remaining factor is an integer polynomial. Hence $`P\in\mathbb Z[q]`$ and therefore $`P(q^r)\in\mathbb Z[q]`$.

### A negative coefficient

Let

```math
H(q)=\frac1{(1-q^{17})(1-q^{18})(1-q^{21})(1-q^{27})(1-q^{30})}
\in\mathbb Z[[q]].
```

Its coefficient of $`q^{50}`$ counts the nonnegative integer solutions of

```math
17b_1+18b_2+21b_3+27b_4+30b_5=50.
```

There are none. Three or more summands have total at least $`3\cdot17=51`$. No single permitted summand is $`50`$. Two summands cannot total $`50`$, since the complements of the permitted summands are

```math
50-\{17,18,21,27,30\}=\{33,32,29,23,20\},
```

which is disjoint from $`\{17,18,21,27,30\}`$. Thus $`[q^{50}]H(q)=0`$ and $`H(0)=1`$.

The numerator of $`P(q)`$ is $`1-q^{50}`$ modulo $`q^{51}`$. It follows that

```math
[q^{50}]P(q)=[q^{50}]H(q)-H(0)=0-1=-1.
```

Substituting $`q^r`$ for $`q`$ preserves the coefficient at the correspondingly dilated exponent. Hence $`[q^{50r}]P(q^r)=-1`$ for every $`r\ge1`$, proving the theorem. $`\square`$

## Why the construction works

Polynomiality is controlled by divisibility: every denominator root of unity must have enough multiplicity in the numerator. Positivity imposes a different condition. The reciprocal denominator can only have terms at nonnegative combinations of its exponents. Here the first numerator exponent is a gap in that additive semigroup. The numerator therefore introduces a negative coefficient before any other numerator term can change it.

More generally, suppose a quotient $`N(q)/D(q)`$ of products of factors $`1-q^k`$ is a polynomial, the smallest numerator exponent is $`T`$ with multiplicity $`c>0`$, and $`T`$ is not a nonnegative combination of the denominator exponents. Then $`[q^T]N(q)/D(q)=-c`$. This follows by the same formal-power-series argument. The construction above realizes that obstruction while satisfying the required common shift and $`m\ge n`$.

## Verification and provenance

The proof is elementary and does not depend on a search bound, a floating-point calculation, a computer algebra system, or Lean. The file [verify.py](verify.py) independently checks cyclotomic valuations, exact polynomial division, the complete coefficient vector and the semigroup gap using only Python integers and the standard library. It reports degree $`165`$, value $`P(1)=100`$, and negative coefficients $`-1`$ at degrees $`50,67,98,115`$. Only the degree-$`50`$ coefficient is needed for the proof.

A bounded mixed-integer feasibility search suggested the support. That search was a discovery tool, not a proof of either polynomiality or negativity. Exact integer checks and a separate independent review then confirmed the argument. No minimality claim is made.

The [literature record](literature.md) documents the earlier CoPEER disproof and corrects the initial, incomplete prior-resolution search. Its witness has $`n=21`$, $`m=22`$, $`a_6=a_{21}=1`$, and $`a_{14}=a_{18}=a_{20}=2`$, with coefficient $`[q^{43}]F=-1`$. The public commit predates this note. Our different five-factor family is retained as exposition and is excluded from new-resolution claims. This note is unrefereed.
