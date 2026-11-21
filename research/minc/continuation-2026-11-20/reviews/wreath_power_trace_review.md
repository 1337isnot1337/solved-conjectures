# Lieb's permanental dominance conjecture

Date: 20 November 2026, America/Chicago.

Independent review of
[`wreath_power_trace_obstruction.md`](../inequalities/wreath_power_trace_obstruction.md).
The group action, character degree, Fourier normalization, polynomial norm
argument, and resulting obstruction all check. This is a review of an
auxiliary construction. It does not resolve MINC Conjecture 42 or Problem 2,
and it adds zero full resolutions.

## 1. The permutation action and the representation agree

Use the destination-indexed action from the note:

```math
(\mathbf g,\pi)(i,j)=(\pi(i),g_{\pi(i)}(j)).
```

Its multiplication law is

```math
(\mathbf g,\pi)(\mathbf h,\tau)
 =(\mathbf k,\pi\tau),\qquad
k_i=g_i h_{\pi^{-1}(i)}.
```

Indeed, applying the two permutations to $`(i,j)`$ gives
$`(\pi\tau(i),g_{\pi\tau(i)}h_{\tau(i)}(j))`$, which is the
displayed law. If $`P_\pi`$ moves tensor position $`i`$ to
$`\pi(i)`$, then

```math
P_\pi\bigotimes_i\rho(h_i)P_\pi^{-1}
 =\bigotimes_i\rho(h_{\pi^{-1}(i)}).
```

Consequently $`R(\mathbf g,\pi)=(\bigotimes_i\rho(g_i))P_\pi`$
is a representation of this particular permutation subgroup. No inverse
or change of convention is missing.

For $`B=C\otimes A`$, direct multiplication of its entries gives

```math
\begin{aligned}
a_{(\mathbf g,\pi)}(B)
 &=\prod_{i,j}c_{i,\pi(i)}a_{j,g_{\pi(i)}(j)}\\
 &=a_\pi(C^{\circ n})\prod_i a_{g_i}(A).
\end{aligned}
```

The second equality only relabels the $`m`$ base factors. It introduces
no multiplicity. The PSD property of $`B`$ follows, for example, by
using tensor products of Gram vectors for $`C`$ and $`A`$.

Let $`F=\sum_{g\in G}a_g(A)\rho(g)`$. Summing the base factors
before taking the trace gives exactly

```math
\sum_{\mathbf g}\left(\prod_i a_{g_i}(A)\right)
       \operatorname{tr}R(\mathbf g,\pi)
 =\operatorname{tr}(F^{\otimes m}P_\pi)
 =\prod_{c\in\operatorname{Cycles}(\pi)}\operatorname{tr}F^{|c|}.
```

The last identity follows by contracting tensor indices along each cycle.
Since all factors are the same $`F`$, either orientation of a cycle
gives the same power trace. Tensoring with the inflated top representation
of character $`\psi`$, of degree $`q`$, gives character degree
$`d^m q`$. Division by this degree gives the main note's formula (1).
There is no additional division by $`|G|`$, $`|K|`$, or $`|H|`$.

The matrix $`F`$ is PSD. One way to check the convention directly is
to observe that $`g\mapsto a_g(A)`$ is a positive-definite function.
For any vector $`u`$, the product
$`a_g(A)\langle u,\rho(g)u\rangle`$ is also a matrix coefficient
of a unitary representation. Its sum over $`G`$ is nonnegative,
because the average of that representation is an orthogonal projection.
Thus $`\langle u,Fu\rangle\geq0`$, with the compatible inner
product convention. Equivalently one may use the dual Fourier convention.

The generalized matrix function with any character is likewise real and
nonnegative on a PSD matrix. Thus an upper bound obtained by taking
absolute values of its individual terms is an ordinary real inequality.

## 2. Degree-one characters

A linear character restricted to the direct product $`G^m`$ is a
product of linear characters $`\alpha_i`$ of its factors. Conjugation
by the top group forces $`\alpha_i`$ to be constant on each orbit
of $`K`$. If $`K`$ is transitive, all $`\alpha_i`$ equal one
character $`\alpha`$. Dividing by $`\prod_i\alpha(g_i)`$
leaves a character trivial on the base, so it factors through $`K`$.
This proves the stated classification without an assumption that $`G`$
is transitive.

For such a character, the Fourier factor is the scalar
$`f_{G,\alpha}(A)`$. Therefore the normalized subgroup function is
exactly

```math
f_{G,\alpha}(A)^m f_{K,\psi}(C^{\circ n}).
```

The statement extends orbit by orbit when $`K`$ is not transitive.
It does not compare this product with $`\operatorname{per}(C\otimes A)`$
for arbitrary $`C`$.

## 3. The factorial in the identical-copy denominator

The classical apolar norm used here is

```math
\|p\|_a^2=\sum_\alpha\alpha!|p_\alpha|^2
          =\mathbb E|p(Z)|^2,
```

where the coordinates of $`Z`$ are independent standard circular
complex Gaussians. The factor $`\alpha!`$, rather than
$`\alpha!/|\alpha|!`$, is essential.

The note's self-contained proof of the homogeneous product inequality is
valid. On polynomials, the adjoint of multiplication $`L_f`$ is
$`\overline f(D)`$. Leibniz's rule yields

```math
L_f^*L_f=
\sum_\alpha\frac1{\alpha!}
L_{\partial^\alpha f}L_{\partial^\alpha f}^*.
```

Every summand is a nonnegative quadratic form on polynomials. If $`f`$
is homogeneous of degree $`k`$, the terms with $`|\alpha|=k`$
sum to

```math
\sum_{|\alpha|=k}\frac{|\partial^\alpha f|^2}{\alpha!}I
 =\sum_{|\alpha|=k}\alpha!|f_\alpha|^2I
 =\|f\|_a^2I.
```

It follows that $`\|fg\|_a^2\geq\|f\|_a^2\|g\|_a^2`$.
There is no missing degree factorial. In fact, this argument only needs
$`f`$ homogeneous; the main note applies it with two homogeneous
factors.

For a homogeneous $`p`$ of positive degree $`n`$, write
$`M_m=\|p^m\|_a^2`$ and $`P=M_1`$. The monomial norm identity
$`\sum_j\|\partial_j f\|_a^2=(\deg f)\|f\|_a^2`$
gives

```math
nmM_m=m^2\sum_j\|p^{m-1}\partial_jp\|_a^2
 \geq m^2 M_{m-1}\sum_j\|\partial_jp\|_a^2
 =nm^2PM_{m-1}.
```

Hence $`M_m\geq mP M_{m-1}`$, and induction gives
$`M_m\geq m!P^m`$. As a separate check of the coefficients, Euler's
identity and complex Gaussian integration by parts give the same equation
$`nM_m=m\sum_j\mathbb E|p|^{2m-2}|\partial_jp|^2`$.

Choose linear forms with Gaussian covariance matrix $`A`$, and set
$`p`$ to their product. Wick's identity gives

```math
P=\operatorname{per}A,\qquad
M_m=\operatorname{per}(J_m\otimes A).
```

Thus the claimed bound

```math
\operatorname{per}(J_m\otimes A)
 \geq m!\operatorname{per}(A)^m
```

is proved for every nonempty PSD $`A`$ and every positive integer
$`m`$. A zero form makes both sides zero. This is a specialization of
Marcus's block-permanent conjecture. It does not establish Pate's stronger
factor $`(m!)^n`$ multiplying $`\operatorname{per}(A)^m`$.

The exact norm and Gaussian normalization are independently confirmed by
the Introduction, equation (2), and Theorem 7 of
[Aldaz, Bravo and Render (2025)](https://link.springer.com/article/10.1186/s13660-025-03343-1).
Their article identifies the homogeneous product inequality as classical.
No novelty claim is attached to this norm argument or its consequence.

## 4. The obstruction and its quantifiers

Put $`S=\operatorname{tr}F/d`$. For every cycle length $`\ell`$,
PSD gives $`\operatorname{tr}F^\ell\leq(\operatorname{tr}F)^\ell`$.
Also $`|\psi(\pi)|\leq q`$. When $`C=J_m`$, these estimates give

```math
f_{G\wr K,\chi}(J_m\otimes A)
 \leq |K|S^m\leq m!S^m.
```

If $`S\leq\operatorname{per}A`$, the factorial denominator bound
therefore proves dominance for this construction for every $`m`$, every
$`K\leq S_m`$, and every top character $`\psi`$. The hypothesis
only concerns the normalized trace of the base block. Its largest
eigenvalue may exceed the permanent.

The four displayed core traces agree with the existing exact certificates:

| Core | Trace | Character degree | Normalized trace |
| --- | ---: | ---: | ---: |
| Shchesnovich | 1398896000 | 5 | 279779200 |
| Tran | 960 | 5 | 192 |
| Octahedral | 336 | 5 | 336/5 |
| Drury | 4200 | 14 | 300 |

These are applications of the general obstruction. They are not a finite
search for new conjecture cases. No additional subgroup enumeration was
needed: the action and trace identity were derived directly above.

The independent asymptotic bound in the main note also checks. If
$`h(A)=\prod_i a_{ii}>0`$, iterated Lieb--Fischer applied after
reordering by the original vector index gives
$`\operatorname{per}(J_m\otimes A)\geq(m!)^n h(A)^m`$.
Thus for fixed $`A,G,\rho`$, with $`n\geq2`$,

```math
\frac{f_{G\wr K,\chi}(J_m\otimes A)}
 {\operatorname{per}(J_m\otimes A)}
 \leq\frac{(S/h(A))^m}{(m!)^{n-1}}\longrightarrow0.
```

This latter conclusion does not need $`S\leq\operatorname{per}A`$.
The factorial bounds involving $`P`$ and $`h(A)`$ do not uniformly
dominate one another, so neither should be called the stronger bound
without further conditions. A zero diagonal entry in a PSD matrix gives
a zero row and column; the relevant functions then vanish.

## 5. A general block metric requires a self-Chollet violation

The main note's subsequent general-$`C`$ extension also checks. Assume
$`n\geq2`$, $`h(A)>0`$, and all diagonal entries of $`C`$ are
positive. Diagonal congruence can make $`C`$ a correlation matrix.
Both the subgroup function and the permanent of $`C\otimes A`$
acquire the same scale factor, and
$`\operatorname{per}(|C|^2)/\operatorname{per}(C)^2`$ is unchanged.
Thus this normalization loses no nonvanishing cases.

Write $`U=\operatorname{per}C`$ and
$`Q=\operatorname{per}(|C|^2)`$. Taking absolute values before
comparing the cycle weights gives

```math
f_{G\wr K,\chi}(C\otimes A)
 \leq S^m\operatorname{per}(|C|^{\circ n})
 \leq S^mQ.
```

Here the sum over $`K`$ is bounded by the full permanent of a
nonnegative matrix. The last step uses $`|c_{ij}|\leq1`$ and
$`n\geq2`$. It does not compare complex summands term by term.

Applying Lieb--Fischer to the two natural principal-block partitions of
$`C\otimes A`$ gives

```math
\operatorname{per}(C\otimes A)
 \geq\max\{P^m,h(A)^m U^n\}.
```

The maximum of two positive numbers bounds their weighted geometric mean.
Using weights $`1-2/n`$ and $`2/n`$, which are nonnegative even at
$`n=2`$, gives

```math
\operatorname{per}(C\otimes A)
 \geq P^{m(1-2/n)}h(A)^{2m/n}U^2.
```

Consequently

```math
\frac{f_{G\wr K,\chi}(C\otimes A)}
 {\operatorname{per}(C\otimes A)}
 \leq\kappa_A^m
 \frac{\operatorname{per}(|C|^2)}{\operatorname{per}(C)^2},
\qquad
\kappa_A=\frac{S}{P^{1-2/n}h(A)^{2/n}}.
```

No self-Chollet inequality is assumed in deriving this estimate. If
$`\kappa_A\leq1`$, any actual dominance violation from this
construction would force
$`\operatorname{per}(|C|^2)>\operatorname{per}(C)^2`$. When
$`0<\kappa_A<1`$, it would require the larger ratio
$`\operatorname{per}(|C|^2)/\operatorname{per}(C)^2>\kappa_A^{-m}`$.
If $`\kappa_A=0`$, then $`F=0`$, so the subgroup function is zero
and a violation is impossible.

The core diagonal products were independently checked from the matrices
in the existing exact checkers. The Shchesnovich Gram diagonal is
$`(40,22,52,34,75)`$; Tran's is $`(3,3,3,3,1)`$; the octahedral
diagonal is $`(1,1,2,2,2,2)`$; Drury's unnormalized diagonal is
$`(1,1,2,2,2,2,2)`$. They give:

| Core | $`h(A)`$ | Exact $`\kappa_A^n=S^n/(P^{n-2}h(A)^2)`$ |
| --- | ---: | ---: |
| Shchesnovich | 116688000 | 88389238039897945309795 / 378681867924813026457741 |
| Tran | 81 | 2097152 / 6751269 |
| Octahedral | 16 | 1058841 / 9765625 |
| Drury | 32 | 1953125 / 56623104 |

Every fraction is strictly below one. These integer comparisons are
reproduced in [`wreath_core_factor_checks.py`](wreath_core_factor_checks.py).
That checker consumes the already reviewed trace/permanent certificates;
it does not assert a new verification of their underlying matrices.

If $`A`$ or $`C`$ has a zero diagonal entry, PSD forces the
corresponding row and column to vanish. The subgroup function and permanent
of the tensor matrix are then both zero, so there is no counterexample and
no quotient to evaluate. These cases must be handled before normalization.

## 6. Remaining scope and source status

For general PSD $`C`$, its permutation monomials can have phases.
Multiplying individual inequalities for the cycle traces by those weights
does not preserve their direction. Even a valid bound on that weighted
sum still needs comparison with $`\operatorname{per}(C\otimes A)`$.
The general block-permanent conjecture cannot be assumed for that step.

A current primary-source check found
[Tubbenhauer, *Positivity in symmetric webs and block permanents*](https://arxiv.org/abs/2611.22058),
submitted 17 November 2026. Its abstract and
[author's account](https://dtubbenhauer.com/blockpermanents.html)
report partial block-count and block-size regimes. They do not claim the
general conjecture. The present review does not audit that preprint's
proofs, and none of those reported partial results is used above.

The identical-copy obstruction is unconditional under the stated base
normalized-character hypothesis. The general block-metric result is an
exact upper bound and a conditional transfer obstruction. It does not
assume or prove self-Chollet for $`C`$. Nonseparable Gram blocks, other
subgroup couplings, and other character constructions also remain outside
these conclusions. The full MINC questions remain open in this work.
