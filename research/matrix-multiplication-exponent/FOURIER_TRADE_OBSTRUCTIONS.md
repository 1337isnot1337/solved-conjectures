# Fourier form of the geodesic trade and the resolvent bottleneck

Status: an exact failed construction and a proved obstruction to its
specified coefficient-factorization repair. These maps produce an
explicit off-diagonal tensor. They do not give the geodesic trade in
[GEODESIC_UNIT_TRADE.md](GEODESIC_UNIT_TRADE.md).

Use indices in $`\mathbb Z/q`$ and a primitive complex q-th root $`\zeta`$.
A local Fourier change on $`U_{ABC}(q)`$ gives the cyclic convolution
$`\sum_{\alpha+\beta+\gamma=0}A_\alpha B_\beta C_\gamma`$, up to a
nonzero scalar. Therefore the source

```math
S_{q,q}=U_{ABC}(q)W_{AD}(q)W_{BD}(q)W_{CD}(q)
```

can be written with party coordinates
$`A_{\alpha,a},B_{\beta,b},C_{\gamma,s},D_{a,b,s}`$ and constraint
$`\alpha+\beta+\gamma=0`$. Apply the maps

```math
A_{\alpha,a}\longmapsto A_{a,a+\alpha},\qquad
B_{\beta,b}\longmapsto B_{b,b-\beta},\qquad
C_{\gamma,s}\longmapsto C_{s,s-\gamma},
```

and send $`D_{a,b,s}`$ to $`D_{a,b}`$ when $`s=a`$, to zero otherwise.
Putting $`k=a+\alpha`$ and $`l=b-\beta`$, the result is exactly

```math
Z_q=\sum_{a,b,k,l\in\mathbb Z/q}
 A_{a,k}B_{b,l}C_{a,b+k-l}D_{a,b}.
```

The desired tensor is its $`k=l`$ part:

```math
T_{q,q}=\sum_{a,b,k}A_{a,k}B_{b,k}C_{a,b}D_{a,b}.
```

Extra factors $`W_{AD}(t)W_{BD}(t)`$ can be contracted at D to
$`W_{AB}(t)`$, so the same construction gives $`Z_qW_{AB}(t)`$ from
$`S_{q,qt}`$. Increasing this untouched factor does not remove the
explicit off-diagonal terms.

Let P act on an AB wire coordinate k by $`\zeta^k`$. Formally, the
projection of Z onto equal wire coordinates is

```math
Z-[P,(\mathop{\mathrm{ad}}P)^{-1}Z],
```

where the inverse is used only off the diagonal. For the displayed
terms, with $`y=b+k-l`$, its scalar is

```math
\frac1{\zeta^k-\zeta^l}
 =\zeta^{-l}\,\frac1{\zeta^{y-b}-1}\qquad(k\ne l).
```

The first factor is local at B. The second is the matrix
$`K_{y,b}=1/(\zeta^{y-b}-1)`$ off the diagonal and zero on it.
Use the Fourier vectors $`\chi_m(b)=\zeta^{mb}`$. Its eigenvalues are

```math
\lambda_m=m-\frac{q-1}{2},\qquad 0\le m\lt q.
```

Indeed,

```math
\lambda_m=\sum_{\substack{r\in\mathbb Z/q\\r\ne0}}
              \frac{\zeta^{-mr}}{\zeta^r-1}.
```

Pair the $`r`$ and $`-r`$ terms to get $`\lambda_0=-(q-1)/2`$.
For $`0\le m\lt q-1`$, subtraction gives
$`\lambda_{m+1}-\lambda_m=-\sum_{r\ne0}\zeta^{-(m+1)r}=1`$.
Thus K has rank q for even q and q-1 for odd q.

If one implements this multiplier only by factoring a coefficient
matrix between C and D, while retaining the equality of their first
indices a, that matrix is $`I_q\otimes K`$ and has rank q times the
rank of K. The existing q-dimensional CD wire is insufficient for
that direct factorization. The first-index equality currently comes
from its label s; it is not a free condition supplied by the original
GHZ label, which was consumed in the Fourier convolution.

This is only an obstruction to the stated C/D coefficient-factorization
repair. It is not a lower bound for arbitrary A/B/C mixing, a
matrix-valued completion using a large flag, or source-only full-unit
overhead two. In particular it does not prove that a truncated-Weyl
commutator construction is impossible; such a construction must also
solve the coefficient-factorization issue identified here.
The complete off-support coefficient of one later Weyl candidate is
preserved in [OPERATOR_TRADE_OBSTRUCTIONS.md](OPERATOR_TRADE_OBSTRUCTIONS.md).
