# Independent review of the paired-core divisibility obstruction

Reviewed on 20 November 2026 (America/Chicago). The reviewed draft is
[c36_paired_row_divisibility.md](c36_paired_row_divisibility.md).
The argument passes this review. It excludes a construction method and does
not resolve Kräuter's conjecture or add an attaining order.

## Coefficient normalization

Suppose a sign matrix of order $`N`$ has $`p`$ identical row pairs and $`q`$
other rows, where $`2p+q=N`$. Replace each pair by one variable of target
degree two, and each other row by a variable of target degree one. The
permanent equals $`2^p`$ times the corresponding coefficient in the product
of the $`N`$ column forms.

Expand every column form as $`S-2H_j`$. In a contribution using $`k`$ of the
negative-support terms, let $`u`$ be the number of paired variables touched
by their monomial. Its residual multinomial coefficient has denominator
$`2^{p-u}`$. Thus, after multiplication by the row-labeling factor $`2^p`$,
that contribution is an integer multiple of

```math
2^{k+u}(N-k)!.
```

Since at most $`q`$ selected factors can be accommodated by the singleton
variables and each touched paired variable accommodates at most two,

```math
u\geq \max\left(0,\left\lceil\frac{k-q}{2}\right\rceil\right).
```

Legendre's factorial valuation gives exactly the draft's lower bound

```math
F(N,q)=\min_{0\leq k\leq N}
\left[
N+\max\left(0,\left\lceil\frac{k-q}{2}\right\rceil\right)
-s_2(N-k)
\right].
```

No division by a nonintegral coefficient is used. Zero contributions cause
no exception.

## Arbitrary border and equation (21a)

For one core pair, write the two row forms as $`L+Y`$ and $`L+Z`$, with
border variables $`y_1,\ldots,y_d`$. Its product is

```math
L^2+L(Y+Z)+YZ.
```

Every coefficient of $`Y+Z`$ is even. In the squarefree quotient in the
border variables, every coefficient of $`YZ`$ is also even: the coefficient
of $`y_a y_b`$, with $`a\ne b`$, is the sum of two signs. Terms $`y_a^2`$
cannot enter the permanent. This checks the case of two distinct border
variables explicitly; it is not enough to inspect one-column borders.

If $`a`$ pairs supply one border variable and $`b`$ pairs supply two, put
$`h=a+b`$. Those choices contribute $`2^h`$. Precisely $`a+2b`$ bottom rows
must then supply core variables. The core coefficient consequently comes
from $`N`$ sign forms with $`N/2-h`$ surviving pairs and $`2h`$ singleton
forms. It is divisible by $`2^{F(N,2h)}`$. Necessarily
$`0\leq h\leq\min(d,N/2)`$.

For every $`k`$, the exact identity

```math
h+\max\left(0,\left\lceil\frac{k-2h}{2}\right\rceil\right)
=\max\left(h,\left\lceil\frac{k}{2}\right\rceil\right)
\geq \left\lceil\frac{k}{2}\right\rceil
```

implies, on taking minima,

```math
h+F(N,2h)\geq F(N,0).
```

There is no interchange of incompatible minimizers here: the comparison
holds separately for every $`k`$. Hence an arbitrary sign border preserves
the guaranteed divisor $`2^{F(N,0)}`$ of the paired core. This inheritance
holds for every even $`N`$, independently of the later binary-order choice.

## The excluded orders

For

```math
N=2^{r+1}+2d,\qquad
r\geq d+1+\lfloor\log_2(2d+1)\rfloor,
```

the two cases $`N-k\geq2^{r+1}`$ and $`N-k<2^{r+1}`$ in the draft give

```math
F(N,2h)=N+d-h-r\quad(0\leq h\leq d).
```

Equality is attained at $`k=2d+1`$. The first case uses
$`s_2(j)\leq\lfloor\log_2(2d+1)\rfloor`$ for $`0\leq j\leq2d`$;
the second uses $`s_2(N-k)\leq r+1`$. Both bounds are valid under the
displayed hypothesis.

For $`n=N+d`$, every bordered permanent is divisible by $`2^{n-r}`$.
Also $`2^{r+1}\leq n+1<2^{r+2}`$, so Kräuter's proposed least positive
magnitude is $`2^{n-r-1}`$. The extra factor of two therefore rules out
attainment at all these orders. Row signs, row and column permutations,
and transposition preserve the magnitude and the divisibility conclusion.

The theorem also excludes a family with a uniformly bounded but varying
border width as an all-order construction. Choose a fixed larger width
$`d`$ of the same parity as the orders considered. A core with a smaller
admissible width can be trimmed by whole row pairs and the same number of
columns to produce a paired core with width exactly $`d`$. The theorem
then applies on its infinite sequence of orders. This observation does
not exclude widths growing with the order.

## Verification and scope

The companion exact checker was run successfully. The proof, rather than
the checked finite range, supplies the infinite quantifiers. The draft
also records the relevant historical limitation: the complete older
divisibility papers were not obtained, so this review makes no claim of
priority for the auxiliary bound.

The remaining construction problem is unchanged: a successful general
family must avoid this fixed-width paired-core obstruction, or use
border width that grows with the order.
