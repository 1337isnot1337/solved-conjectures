# Hadamard partition sectors

Research checkpoint, 20 November 2026 (America/Chicago).

**Status.** This note gives exact formulas in every Hadamard order. The
contributions from partitions with at most three blocks depend only on the
order. The four-block contribution is determined by the distribution of
four-column correlations, whose first two moments are also fixed. These
formulas do not prove nonvanishing or Wanless's valuation conjecture.
They add no completed Minc-list entry and no finite-order extension.
Historical priority of these identities is not asserted.

## 1. Definitions and the exact coefficient functional

Let $`H=(h_{ij})`$ be a normalized real Hadamard matrix of order
$`n\equiv0\pmod4`$: its first row and first column consist of ones and
$`HH^{\mathsf T}=nI`$. Every column has product one. Set

```math
s(S)=\sum_{j=1}^n\prod_{i\in S}h_{ij}
\qquad(S\subseteq[n]).
```

For $`1\le r\le n`$, let

```math
T_r(H)=(-1)^{n-r}
\sum_{\substack{\pi\text{ a partition of }[n]\\|\pi|=r}}
\prod_{S\in\pi}(|S|-1)!s(S).
\tag{1}
```

The usual set-partition inversion gives

```math
\mathop{\mathrm{per}}H=\sum_{r=1}^nT_r(H).
\tag{2}
```

For completeness, expand the permanent as a sum over all maps from rows
to columns and apply the partition-lattice inclusion-exclusion that
retains only injective maps. A block $`S`$ assigned one column contributes
$`s(S)`$, and its Möbius factor is
$`(-1)^{|S|-1}(|S|-1)!`$. This proves (2).

For a homogeneous polynomial $`P(x_1,\ldots,x_r)`$ of degree $`n`$, define

```math
\mathcal L_{n,r}P=
\sum_{\substack{\alpha_1+\cdots+\alpha_r=n\\\alpha_a\ge1}}
\left(\prod_{a=1}^r(\alpha_a-1)!\right)
[x_1^{\alpha_1}\cdots x_r^{\alpha_r}]P.
\tag{3}
```

Put

```math
P_r(H;x)=
\sum_{j_1,\ldots,j_r=1}^n
\prod_{i=1}^n\left(\sum_{a=1}^rx_a h_{i,j_a}\right).
\tag{4}
```

Expanding (4) assigns every row to one of $`r`$ labelled blocks. Summing
the column labels gives the product of the corresponding $`s(S)`$.
Requiring positive exponents excludes empty blocks, and division by
$`r!`$ removes their labelling. Thus

```math
\boxed{T_r(H)=\frac{(-1)^{n-r}}{r!}\mathcal L_{n,r}P_r(H;x).}
\tag{5}
```

This identity does not reduce the unrestricted problem to a fixed number
of sectors: $`r`$ still ranges up to $`n`$.

## 2. The first three sectors are universal

Every column has product one, so

```math
P_1(H;x)=nx^n,\qquad T_1(H)=-n!.
\tag{6}
```

Two distinct columns have a quotient sign vector with equally many
positive and negative coordinates. It follows that

```math
P_2(H;x,y)=n(x+y)^n+n(n-1)(x^2-y^2)^{n/2}.
\tag{7}
```

Now take three distinct columns $`a,b,c`$. Multiply the $`i`$th linear
factor by $`h_{ic}`$. Their product is unchanged, because the product of
column $`c`$ is one. The two quotient signs

```math
u_i=h_{ia}h_{ic},\qquad v_i=h_{ib}h_{ic}
```

satisfy $`\sum_i u_i=\sum_i v_i=\sum_i u_iv_i=0`$. Therefore each of
the four sign patterns $`(u_i,v_i)`$ occurs exactly $`n/4`$ times.
Define

```math
Q(x,y,z)=x^4+y^4+z^4-2x^2y^2-2x^2z^2-2y^2z^2.
\tag{8}
```

The product of the four forms $`z\pm x\pm y`$ is $`Q`$. Splitting the
column triples in (4) into equality patterns gives

```math
\boxed{\begin{aligned}
P_3(H;x,y,z)={}&n(x+y+z)^n\\
&+n(n-1)\bigl(((x+y)^2-z^2)^{n/2}
 +((x+z)^2-y^2)^{n/2}
 +((y+z)^2-x^2)^{n/2}\bigr)\\
&+n(n-1)(n-2)Q(x,y,z)^{n/4}.
\end{aligned}}
\tag{9}
```

Equations (5)--(9) prove that $`T_1,T_2,T_3`$ depend only on $`n`$.
No classification of Hadamard matrices is used.

## 3. A closed harmonic formula for the two-block term

Write $`H_k=\sum_{j=1}^k1/j`$ for a harmonic number. Then

```math
\boxed{T_2(H)=n!\left(nH_{n-1}
 -2(n-1)H_{n/2}+(n-1)H_{n/4}\right).}
\tag{10}
```

Here the symbol $`H_k`$ in the scalar formula denotes a harmonic number,
not a Hadamard matrix.

To prove (10), note first that $`s(S)=s(S^c)`$, since every column has
product one. Orthogonality of columns gives

```math
\sum_{|S|=k}s(S)^2
=n{n\choose k}+n(n-1)[x^k](1-x^2)^{n/2}.
\tag{11}
```

Indeed, expand the square as a sum over two column indices. Equal
indices contribute $`{n\choose k}`$ each. Unequal indices have $`n/2`$
positive and $`n/2`$ negative quotient signs.

Hence

```math
T_2=\frac12\sum_{k=1}^{n-1}(k-1)!(n-k-1)!
\left(n{n\choose k}
 +n(n-1)[x^k](1-x^2)^{n/2}\right).
\tag{12}
```

The first summand totals $`n!H_{n-1}`$. For the second, the beta integral
and $`n/2`$ even give

```math
\begin{aligned}
&\sum_{\ell=1}^{n/2-1}(-1)^\ell{n/2\choose\ell}
(2\ell-1)!(n-2\ell-1)!\\
&\quad=(n-1)!\int_0^1
\frac{(1-2t)^{n/2}-(1-t)^n-t^n}{t(1-t)}\,dt\\
&\quad=2(n-1)!\left(H_{n-1}-2H_{n/2}+H_{n/4}\right).
\end{aligned}
\tag{13}
```

For the last equality, use symmetry about $`t=1/2`$ to replace the
denominator by $`t`$ with a factor two, and use

```math
\int_0^1\frac{(1-2t)^{2m}-1}{t}\,dt=-2H_{2m}+H_m.
```

Substitution in (12) proves (10).

The harmonic expression need not be a two-adic integer. For example,
at $`n=12`$ it equals $`1929/770`$, with valuation minus one. Thus even
an entire partition sector can have smaller two-adic valuation than
$`n!`$. A proof of Wanless's valuation cannot simply discard each sector
separately.

## 4. The four-column distribution determines the fourth sector

For four distinct columns put

```math
c_{abcd}=\sum_{i=1}^nh_{ia}h_{ib}h_{ic}h_{id},
\qquad
\nu_c=\#\{\{a,b,c,d\}:c_{abcd}=c\}.
\tag{14}
```

Divide the first three columns pointwise by the fourth. The resulting
three sign vectors have zero first and second correlations; their
third correlation is $`c_{abcd}`$. Fourier inversion on three signs
therefore gives the exact pattern counts

```math
N_{u,v,w}=\frac{n+uvw\,c_{abcd}}8,
\qquad u,v,w\in\{-1,1\}.
\tag{15}
```

In particular $`(n\pm c_{abcd})/8`$ are nonnegative integers. Put

```math
R(x)=\sum_{a=1}^4x_a^4-2\sum_{a<b}x_a^2x_b^2,
\qquad p(x)=x_1x_2x_3x_4,
```

and

```math
G_c(x)=
\bigl(R(x)+8p(x)\bigr)^{(n+c)/8}
\,\bigl(R(x)-8p(x)\bigr)^{(n-c)/8}.
\tag{16}
```

Equation (15) and the identities

```math
\prod_{uvw=\pm1}(x_4+u x_1+v x_2+w x_3)=R(x)\pm8p(x)
```

give

```math
\prod_{i=1}^n\left(\sum_{a=1}^4x_a h_{i,j_a}\right)
=G_{c_{j_1j_2j_3j_4}}(x)
\tag{17}
```

whenever the four column indices are distinct. The polynomial $`G_c`$
is symmetric in its four variables.

For an explicit complete formula, let $`\Pi_{4,2}`$ be the seven
partitions of four labelled positions into two nonempty blocks. Let
$`X_B=\sum_{a\in B}x_a`$ and $`X=\sum_ax_a`$. Splitting column labels
by their equality patterns gives

```math
\begin{aligned}
P_4(H;x)={}&nX^n
 +n(n-1)\sum_{\{B,C\}\in\Pi_{4,2}}
 (X_B^2-X_C^2)^{n/2}\\
&+n(n-1)(n-2)
\sum_{\{a,b\}\subseteq[4]}
 Q(x_a+x_b,x_c,x_d)^{n/4}\\
&+24\sum_c\nu_cG_c(x),
\end{aligned}
\tag{18}
```

where in the middle line $`\{c,d\}=[4]\setminus\{a,b\}`$.
The symmetry of $`Q`$ makes their order irrelevant. Formula (5) then
evaluates $`T_4`$ from $`\nu_c`$ alone.

## 5. Two universal moments and the remaining freedom

The four-column correlations satisfy

```math
\boxed{\sum_c\nu_c c=\frac{n^2(n-1)(n-2)}{24},\qquad
\sum_c\nu_c c^2=\frac{n^3(n-1)(n-2)}{24}.}
\tag{19}
```

For the first identity, sum (14) over unordered column quadruples.
The first row contributes $`{n\choose4}`$. Every other row is balanced
and contributes $`{n/2\choose2}`$, because its elementary-symmetric
generating polynomial is $`(1-x^2)^{n/2}`$. Thus the sum equals
$`{n\choose4}+(n-1){n/2\choose2}`$, which is the first expression in
(19). Squaring (14) instead gives a sum over ordered pairs of rows.
Equal rows contribute $`{n\choose4}`$ each; unequal rows give balanced
quotient vectors and contribute $`{n/2\choose2}`$ each. This is exactly
$`n`$ times the first sum.

The first two moments do not determine the entire spectrum. For the
Sylvester matrix of order 16 and a standard closed-quadruple switch of
that matrix, the exact spectra are

| Matrix | $`\nu_{-8}`$ | $`\nu_0`$ | $`\nu_8`$ | $`\nu_{16}`$ |
| --- | ---: | ---: | ---: | ---: |
| Sylvester | 0 | 1680 | 0 | 140 |
| Switched | 64 | 1488 | 192 | 76 |

Their first moments are both 2240 and their second moments are both
35840. Their permanents are respectively 50692096 and 17137664, values
already appearing in Wanless's 2005 computations. This is a check of
the identities and of the surviving freedom, not a new order result.

## 6. What is still required

Wanless's proposed congruence is

```math
\mathop{\mathrm{per}}H\equiv n!
\pmod{2^{n-s_2(n)+1}}.
```

Since $`T_1=-n!`$ and $`-n!\equiv n!`$ for this modulus, it is
equivalent to

```math
\sum_{r=2}^n T_r(H)\equiv0
\pmod{2^{n-s_2(n)+1}}.
\tag{20}
```

The formulas above compute the first three terms and reduce the fourth
to a constrained one-variable correlation distribution. They do not
prove (20), do not bound the remaining sectors, and do not justify
interchanging exact cancellation with termwise valuation estimates.
The missing statement is an aggregate congruence for all sectors.

## 7. Verification and sources

Run `python research/minc/nov20-independent/sign/hadamard_partition_sectors.py`.
The checker constructs normalized Hadamard matrices of orders 4, 8,
12 and 16, including two inequivalent examples at order 16. It verifies
the first three sectors by a direct set-partition recursion independent
of (7)--(10), checks every four-column pattern and both correlation
moments, checks (17) at two exact integer tuples for every quadruple,
and independently computes the permanents by subset dynamic
programming. For orders 4 and 8 it also reconstructs the full permanent
from all sectors. These checks validate the algebra; the proofs above
supply the all-order statements.

Primary sources and current status checked in this investigation:

- [Lavi's exact P5 statement](https://yair-lavi.com/mincs-list/problem-5/index.html)
  leaves arbitrary-order nonvanishing open. Its modern finite and binary
  criteria are not independently reproved here.
- I. M. Wanless, *Permanents of matrices of signed ones*, Linear and
  Multilinear Algebra 53 (2005), 427--433,
  [complete author PDF](https://users.monash.edu.au/~iwanless/papers/wangconjLAMA.pdf),
  DOI [10.1080/03081080500093990](https://doi.org/10.1080/03081080500093990).
  The paper proposes the valuation invariant and gives the order-16
  values used above.
- U. Chabaud, *On the permanent of Sylvester-Hadamard matrices*,
  [arXiv:1802.08001](https://arxiv.org/abs/1802.08001), gives the earlier
  result for the Sylvester family, not for arbitrary Hadamards.

The preceding repository [characteristic-three checkpoint](../../sign-matrices/wang_hadamard_characteristic_three.md)
already records the set-partition expansion and explains why its
general two-adic step is missing. The new work in this note is the
explicit sector extraction and correlation-distribution calculation.
These are direct deductions from classical orthogonality and partition
inversion. They are retained without a priority claim.
