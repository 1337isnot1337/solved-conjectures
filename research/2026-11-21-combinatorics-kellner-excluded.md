# Kellner's conjectures

Status: excluded from new-result credit. The calculation below was derived during this campaign, but the subsequent independent priority audit located Yutaro Matsuno, *A resolution of Kellner's conjectures on Wilson quotients*, arXiv:2607.10106v1 (July 2026), whose abstract expressly reports an explicit generating function and resolutions of the same two conjectures. This note records an independent rediscovery, not a new solution. No proof-assistant verification is used.

Prior source: <https://arxiv.org/abs/2607.10106>. The hit was found by the separate graph/number-theory reviewer through a global GitHub search for Kellner and conjecture, in the reference header of <https://github.com/facebookresearch/atlas-lean/blob/1a0797072fdfea7590571cfbef8a2c0541020dde/MathlibExt/NumberTheory/WilsonQuotient.lean>. Searches restricted to the original paper identifier did not locate it. Primary PDF access remains under audit; the matched prior title and abstract already prevent claiming novelty here.

## Source and exact scope

Bernd C. Kellner, *Wilson's theorem modulo higher prime powers I: Fermat and Wilson quotients*, arXiv:2509.05235v1, 5 September 2025, <https://arxiv.org/html/2509.05235v1>.

Conjecture 1.4 states that the number of nonzero monomials of the polynomial $`\psi_n`$ is $`\sum_{w=1}^n p(w)`$, where $`p(w)`$ is the integer partition function. Conjecture 4.6 gives its evaluations at the two constant tuples $`(1,\ldots,1)`$ and $`(-1,\ldots,-1)`$, together with their exponential generating functions. We prove both for every $`n\ge1`$. We also prove both weighted-degree assertions and the specified Bell-polynomial coefficient proposed in Remark 4.5.

All statements concern the exact polynomials defined by the source's Theorem 4.1; we do not infer a polynomial identity from prime congruences.

## 1. The defining recurrence

Write $`(a)_k=a(a-1)\cdots(a-k+1)`$. The signed Stirling numbers $`s(n,k)`$ satisfy $`(a)_n=\sum_k s(n,k)a^k`$. The exponential partial Bell polynomials $`B_{n,k}`$ are normalized by

```math
\frac1{k!}\left(\sum_{j\ge1}y_j\frac{z^j}{j!}\right)^k
=\sum_{n\ge k}B_{n,k}(y_1,\ldots,y_{n-k+1})\frac{z^n}{n!}.
```

With $`\psi_0=0`$, the source defines

```math
\psi_n=n\psi_{n-1}+\sigma_n^*+\Psi_n,\tag{1}
```

where

```math
\sigma_n^*=(-1)^nB_n(-x_1,-1!x_2,\ldots,-(n-1)!x_n)
```

and

```math
\Psi_n=\sum_{\nu=2}^n\sum_{k=0}^{\min(\nu,n-\nu)}
(-1)^{\nu+1}s(\nu+1,k+1)(n)_k
B_{n-k,\nu}(\psi_1,\ldots,\psi_{n-k-\nu+1}).\tag{2}
```

This is a genuine recursive definition: every $`\psi`$ in (2) has index at most $`n-1`$.

We work in $`R[[z]]`$, where $`R=\mathbb Q[x_1,x_2,\ldots]`$. At each fixed power of $`z`$, only finitely many variables and summands occur. All exponentials, logarithms and powers below are formal.

## 2. A closed generating function

Set

```math
P(z)=\sum_{n\ge1}\psi_n\frac{z^n}{n!},\qquad
A(z)=\sum_{j\ge1}\frac{(-1)^{j-1}}j x_jz^j,\qquad E(z)=e^{A(z)}.
```

The complete Bell generating function gives

```math
\sum_{n\ge1}\sigma_n^*\frac{z^n}{n!}=E(z)-1.\tag{3}
```

For fixed $`\nu,k`$, the Bell identity gives

```math
\sum_{n\ge\nu+k}(n)_k B_{n-k,\nu}(\psi_1,\ldots)
\frac{z^n}{n!}=z^k\frac{P(z)^\nu}{\nu!}.
```

Also

```math
\sum_{k=0}^{\nu}s(\nu+1,k+1)z^k=(z-1)_\nu.
```

Consequently, multiplying (1) by $`z^n/n!`$ and summing yields

```math
P=zP+E-1+\sum_{\nu\ge2}(-1)^{\nu+1}\binom{z-1}{\nu}P^\nu.\tag{4}
```

The sum is well-defined because $`P\in zR[[z]]`$, so its $`\nu`$-th summand has order at least $`\nu`$. The formal binomial theorem states

```math
(1-P)^{z-1}
=1-(z-1)P+\sum_{\nu\ge2}(-1)^\nu\binom{z-1}{\nu}P^\nu.
```

Inserting this in (4) and canceling the linear terms gives exactly

```math
(1-P)^{z-1}=E=e^A.\tag{5}
```

Since $`z-1`$ is a unit and $`1-P`$ has constant term one, taking the formal logarithm is valid. Thus

```math
\boxed{\displaystyle
P(z)=1-\exp\left(-\frac1{1-z}
\sum_{j\ge1}\frac{(-1)^{j-1}}j x_jz^j\right).}\tag{6}
```

This derivation uses the exact recurrence in Theorem 4.1. Conversely (6), (5) and the formal binomial theorem recover that recurrence. There is no extra choice of a root or branch.

## 3. Every coefficient and the term-count conjecture

Let $`\alpha=(a_1,a_2,\ldots)`$ be a finitely supported sequence of nonnegative integers, not all zero. Put

```math
w=\sum_{j\ge1}j a_j,\qquad \ell=\sum_{j\ge1}a_j,
\qquad x^\alpha=\prod_{j\ge1}x_j^{a_j}.
```

Expanding the exponential in (6) separately in the variables gives

```math
[x^\alpha]P(z)
=\frac{(-1)^{w+1}z^w}{\prod_j a_j!j^{a_j}}(1-z)^{-\ell}.
```

It follows that

```math
\boxed{\displaystyle
[x^\alpha]\psi_n=
\begin{cases}
\dfrac{(-1)^{w+1}n!}{\prod_j a_j!j^{a_j}}
\binom{n-w+\ell-1}{\ell-1},&1\le w\le n,\\[6pt]
0,&w>n.
\end{cases}}\tag{7}
```

The constant coefficient is zero. Every factor in the absolute value of the first case is strictly positive. Thus every monomial of weighted degree $`w`$ occurs, for every $`1\le w\le n`$, and no other monomials occur. Such monomials are in bijection with the integer partitions of $`w`$, with $`a_j`$ parts of size $`j`$. Therefore

```math
\boxed{\#\psi_n=\sum_{w=1}^np(w)\qquad(n\ge1),}
```

proving Conjecture 1.4. Formula (7) gives more information: the sign of a coefficient depends only on its weighted degree, and is $`(-1)^{w+1}`$. Its absolute value is integral, since $`w!/\prod_j a_j!j^{a_j}`$ counts permutations with those cycle multiplicities, and $`n!/w!`$ is an integer.

## 4. The special-values conjecture

Let $`\varepsilon\in\{1,-1\}`$ and substitute $`x_j=\varepsilon`$ for every $`j`$. Then $`A(z)=\varepsilon\log(1+z)`$, so (6) becomes

```math
\boxed{\displaystyle
\sum_{n\ge1}\psi_n(\varepsilon,\ldots,\varepsilon)\frac{z^n}{n!}
=1-(1+z)^{-\varepsilon/(1-z)}.}\tag{8}
```

Define $`\overline H_n=\sum_{j=1}^n(-1)^{j+1}/j`$. We have

```math
\frac{\log(1+z)}{1-z}=\sum_{n\ge1}\overline H_nz^n.
```

Applying the complete Bell generating function to (8) gives

```math
\boxed{\displaystyle
\psi_n(\varepsilon,\ldots,\varepsilon)
=-B_n(-\varepsilon\overline H_1,
-\varepsilon 2!\overline H_2,\ldots,-\varepsilon n!\overline H_n).}\tag{9}
```

The two sign choices in (8) and (9) are precisely Conjecture 4.6. The same argument proves these identities for an arbitrary constant parameter $`\varepsilon`$, not only $`\pm1`$.

## 5. The assertions in Remark 4.5

Assign weight $`j`$ to $`x_j`$. Let $`F^{[n]}`$ denote the homogeneous component of weight $`n`$. Equation (7) implies that $`\psi_n`$ has maximum weight $`n`$. The maximum-weight part of (6) is obtained by replacing $`(1-z)^{-1}`$ with 1: positive powers of $`z`$ coming from that factor lower the variable weight relative to the series degree. Hence

```math
\sum_{n\ge1}\psi_n^{[n]}\frac{z^n}{n!}=1-e^{-A(z)}.
\tag{10}
```

In particular, after extracting $`x_1^n`$, the Bell identity yields

```math
\begin{aligned}
[x_1^n]B_{n,k}(\psi_1,\ldots,\psi_{n-k+1})
&=n![u^n]\frac{(1-e^{-u})^k}{k!}
\\ &=(-1)^{n-k}S_2(n,k).
\end{aligned}\tag{11}
```

To justify the first equality directly: every factor $`\psi_j`$ has weight at most $`j`$. A monomial of weight $`n`$ in a Bell product of series degree $`n`$ must therefore use maximum-weight terms in every factor, and then only $`x_1`$-terms can contribute to $`x_1^n`$. The final equality is the ordinary exponential generating function of the Stirling numbers of the second kind. Since $`S_2(n,k)>0`$ for $`1\le k\le n`$, the Bell polynomial has maximum weight exactly $`n`$, proving that assertion and its specified coefficient.

For $`\Psi_n`$, the term $`n\psi_{n-1}`$ in (1) has weight at most $`n-1`$. Combining (3) and (10) therefore gives

```math
\sum_{n\ge1}\Psi_n^{[n]}\frac{z^n}{n!}
=2-e^{A(z)}-e^{-A(z)}.\tag{12}
```

For even $`n\ge2`$, its coefficient of $`x_1^n`$ is $`-2`$. For odd $`n\ge3`$, its coefficient of $`x_1^{n-2}x_2`$ is $`n(n-1)`$, as seen by expanding the two exponentials with $`A=x_1z-x_2z^2/2+\cdots`$. Thus the maximum weight of $`\Psi_n`$ is exactly $`n`$ for every $`n\ge2`$. This proves the remaining assertion of Remark 4.5.

## Verification and scope

The proof is formal and applies to every index. The separate graph/number-theory reviewer independently derived (4), (6) and (7) directly from the source recurrence before reading this manuscript, and obtained the same specializations. Finite symbolic calculations would only check transcription; they are not the proof. Further verifier construction was stopped once the prior resolution was located. This note is an excluded rediscovery, not a new result or an externally peer-reviewed manuscript.
