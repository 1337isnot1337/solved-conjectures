# Asymptotic uncrossing from simultaneous separation

Status: a proved consequence of the already established separator with two
shared parties. This result does not determine the matrix multiplication
exponent. It replaces the earlier unresolved status of zero asymptotic
uncrossing overhead. No claim of an original separator is made.

Work over $`\mathbb C`$ and fix four parties $`A,B,C,D`$. Put

```math
X_q=U_{ABC}(q)U_{ABD}(q),\qquad
Y_q=U_{ABCD}(q)W_{AB}(q).
```

All products are regrouped by party. For every integer $`q\ge2`$,

```math
X_q\gtrsim Y_q.                                      \tag{1}
```

More explicitly, for fixed $`q`$ there are exact restrictions

```math
U_{ABCD}(r_N)X_q^{\otimes N}\ge Y_q^{\otimes N},
\qquad \log_q r_N=O_q(N^{2/3}).                       \tag{2}
```

Thus the source-only full-unit overhead exponent $`\beta`$ defined in
[UNCROSSING_OVERHEAD.md](UNCROSSING_OVERHEAD.md) is zero. Finite conversion with no overhead,
equal-power conversion with no overhead, and conversion using the same
full unit on both sides can still fail, as the determinant and exterior
arguments already show.

## 1. The partial direct sum that was missing

Index $`i,j,h`$ in $`\mathbb Z/q\mathbb Z`$ and write

```math
X_q=\sum_{i,j} e_{ij}^{A}\otimes e_{ij}^{B}
                 \otimes e_i^{C}\otimes e_j^{D}.
```

For $`h\in\mathbb Z/q\mathbb Z`$, let

```math
T_h=\sum_i e_{i,h-i}^{A}\otimes e_{i,h-i}^{B}
                 \otimes e_i^{C}\otimes e_{h-i}^{D}.
```

Then $`X_q=\sum_hT_h`$. The spaces spanned by
$`\{e_{i,h-i}:i\in\mathbb Z/q\mathbb Z\}`$ are disjoint as $`h`$
varies, at each of $`A,B`$. The $`C,D`$ spaces are shared. Each
$`T_h`$ is locally isomorphic to $`U_{ABCD}(q)`$: at $`A,B`$ relabel
$`(i,h-i)`$ by $`i`$, leave $`C`$ alone, and at $`D`$ relabel
$`h-i`$ by $`i`$. The last relabelling depends on $`h`$. This is
allowed after the simultaneous separator has supplied an independent
$`h`$ tag at the shared parties; it is not asserted as a map on the
unseparated $`D`$ space.

Let $`F`$ be any normalized four-party spectral point and let
$`p=\log_qF(W_{AB}(q))`$. For $`p>0`$, the proved powered
partial-sum inequality with shared parties $`C,D`$ and free pair
$`A,B`$ gives

```math
F(X_q)^{1/p}\ge\sum_hF(T_h)^{1/p}
=q\,q^{1/p}.
```

Therefore $`F(X_q)\ge q^{1+p}=F(Y_q)`$. If $`p=0`$, retaining
one block gives $`F(X_q)\ge F(T_0)=q=F(Y_q)`$. The conclusion holds
for every normalized spectral point. Strassen duality gives (1).

This invokes the separator in [MULTIPLE_PARTY_SEPARATOR.md](MULTIPLE_PARTY_SEPARATOR.md), whose
published source is Huanyi Zhou, *Asymptotic Rank of Weighted Graph
Tensors via Completely Positive Bounds*,
[arXiv:2610.34273v3](https://arxiv.org/html/2610.34273v3), Theorem 3.4
and Corollary 3.5. The argument is an application of that existing
result to the displayed Latin partition of $`X_q`$.

## 2. Explicit polynomial degeneration before cancellation

We give the construction with a general integer $`m\ge2`$. In this
section $`h,i,j`$ indexing $`X_m`$ are residues modulo $`m`$, while
polynomial indices $`a,b,u,v`$ are ordinary integers.

Use the four-party polynomial tensor

```math
Q_m=\sum_{0\le a,b,u\lt m}
 e_u^A\otimes e_{a+b+u}^B\otimes e_a^C\otimes e_b^D.
```

Its rank is at most $`3m-2`$: evaluate the three input polynomials
at $`3m-2`$ distinct complex points and interpolate their product.
Thus $`U_{ABCD}(3m-2)\ge Q_m`$ by explicit local linear maps.

In $`X_mQ_m`$, the $`A,B`$ factors know the block label
$`h=i+j\pmod m`$, represented in $`\{0,\ldots,m-1\}`$. Apply the
following diagonal powers of a parameter $`t`$:

```math
\begin{array}{c|c}
\text{party}&\text{exponent}\\ \hline
A&2hu
\\ B&-2hv+2h^2+4(m-1)^2
\\ C&a^2
\\ D&b^2.
\end{array}
```

Every local exponent is nonnegative. At $`B`$, this follows from
$`0\le v\le3m-3`$ and

```math
2hv-2h^2\le4(m-1)^2
\qquad(0\le h\lt m).
```

On the support of $`Q_m`$, where $`v=a+b+u`$, the total exponent is

```math
4(m-1)^2+(a-h)^2+(b-h)^2.                          \tag{3}
```

Its minimum $`e=4(m-1)^2`$ occurs exactly when $`a=b=h`$.
Relabel local output coordinates as follows. At $`A`$, output
$`(h,i,u)`$. At $`B`$, output $`(h,i,v-2h)`$ when
$`0\le v-2h<m`$, and output zero otherwise. At $`C`$, output
$`(a,i)`$. At $`D`$, output $`(b,b-j\pmod m)`$. On the minimum
terms these are respectively

```math
(h,i,u),\quad(h,i,u),\quad(h,i),\quad(h,i).
```

The coefficient of $`t^e`$ is consequently
$`U_{ABCD}(m)Y_m`$. No off-minimum term contributes to this coefficient.
Equation (3) also bounds the total polynomial degree by
$`6(m-1)^2`$. We have proved a polynomial degeneration

```math
U_{ABCD}(3m-2)X_m\ \unrhd\ U_{ABCD}(m)Y_m,         \tag{4}
```

with explicit nonnegative local parameter exponents and output degree
at most $`6(m-1)^2`$.

One can already deduce (1) from (4): replace $`3m-2`$ by $`3m`$,
cancel the common full unit of size $`m`$ in the asymptotic preorder,
and then apply the result with $`m=q^b`$ as $`b\to\infty`$. The
following argument supplies a quantitative exact restriction instead.

## 3. Interpolate once, then recycle an exact catalyst

Fix positive integers $`b,\ell,k`$ and set $`m=q^b`$. Tensor
$`\ell`$ copies of the polynomial construction above using one
parameter. The output has degree at most
$`6\ell(m-1)^2`$, and its coefficient of
$`t^{4\ell(m-1)^2}`$ is

```math
U_{ABCD}(m^\ell)Y_m^{\otimes\ell}.
```

Let $`L=6\ell(m-1)^2+1`$. Coefficient extraction from $`L`$
distinct evaluations is a linear combination of their output tensors.
Each evaluation is a restriction of the same source. Taking their full
direct sum and adding the local maps therefore gives the exact
restriction

```math
U_{ABCD}\bigl(L(3m-2)^\ell\bigr)X_m^{\otimes\ell}
\ge U_{ABCD}(m^\ell)Y_m^{\otimes\ell}.             \tag{5}
```

Put

```math
C=U_{ABCD}(m^\ell),\quad
r=L3^\ell,\quad T=X_m^{\otimes\ell},\quad
S=Y_m^{\otimes\ell}.
```

Since $`m^\ell r\ge L(3m-2)^\ell`$, equation (5) gives
$`C\,U_{ABCD}(r)T\ge CS`$. This relation is exact. Applying its
local maps repeatedly to the same $`C`$ factor and one fresh $`T`$
factor at each step yields, by induction,

```math
C\,U_{ABCD}(r^k)T^{\otimes k}\ge CS^{\otimes k}.
```

Contract the final $`C`$ factor to a nonzero scalar. Paying for the
initial catalyst by a full unit gives

```math
U_{ABCD}\bigl(m^\ell(L3^\ell)^k\bigr)
 X_q^{\otimes b\ell k}\ge Y_q^{\otimes b\ell k}.   \tag{6}
```

There is no iteration of approximate degenerations in this step.
Interpolation occurs before recycling, so errors and parameter degrees
do not grow through successive catalyst uses.

For $`N=s^3`$, choose $`b=\ell=k=s`$. The logarithm of the source
unit size in (6) is

```math
s^2+s\log_q\bigl(6s(q^s-1)^2+1\bigr)
+s^2\log_q3=O_q(s^2)=O_q(N^{2/3}).                 \tag{7}
```

For an arbitrary $`N\ge1`$, put $`s=\lfloor N^{1/3}\rfloor`$
and $`a=N-s^3`$. Then $`0\le a\le3s^2+3s`$. The elementary
restriction $`X_q\ge U_{ABCD}(q)`$, obtained by retaining
$`i=j`$ at $`A,B`$, implies

```math
U_{ABCD}(q)X_q\ge U_{ABCD}(q^2)\ge Y_q,
```

because the displayed expression for $`Y_q`$ has $`q^2`$ rank-one
terms. Apply this to the remaining $`a`$ factors. An explicit valid
choice in (2) is therefore

```math
r_N=q^{s^2+a}
 \left[3^s\bigl(6s(q^s-1)^2+1\bigr)\right]^s.
```

Its logarithm obeys (7) plus $`a=O(s^2)`$, proving (2).

For the generalization to any pair of intersecting subset units, see
[GENERAL_FREE_SET_SEPARATOR.md](GENERAL_FREE_SET_SEPARATOR.md).

## 4. What this changes

For every normalized four-party point,

```math
u(ABC)+u(ABD)\ge1+d_{AB}.
```

Thus the intersecting two-face uncrossing inequality is now proved.
The earlier upper bound $`\beta\le1/5`$ remains a valid but nonsharp
construction. The determinant and exterior finite obstructions remain
valid. The scalar tripod countermodel already satisfies this inequality,
and the four-label resource certificate already allows it at zero cost.
Consequently the original triangle-perimeter target and the exact
tetrahedral overhead $`\gamma=0`$ remain separate obligations.
