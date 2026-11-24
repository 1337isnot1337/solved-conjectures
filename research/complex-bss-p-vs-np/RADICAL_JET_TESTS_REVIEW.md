# Review of the two radical-jet stress tests

Reviewed additions: Section 6 of [SATURATED_PATH_RADICAL_JETS.md](SATURATED_PATH_RADICAL_JETS.md).

Status: both exact examples pass independent verification. They disprove the two indicated shortcuts, not the radical-jet closure assertion.

## 1. Identical input jets and different radical jets

Take $`M=2^s\ge2`$,
```math
f(t)=(1-t)^M,\qquad
g(t)=(1-t)^M-(-t)^M.
```
Both have value one at zero and share every Taylor coefficient below degree $`M`$. Their circuits have size $`O(s)`$.

The equation $`g(t)=0`$ implies $`t\ne0`$ and
```math
\left(\frac{1-t}{-t}\right)^M=1.
```
Thus the roots are $`t=(1-\xi)^{-1}`$ for the $`M`$-th roots of unity $`\xi\ne1`$. These are $`M-1`$ distinct points. The degree-$`M`$ terms of $`g`$ cancel, while its degree-$`M-1`$ coefficient is nonzero, so $`\deg g=M-1`$. These roots exhaust its degree and prove squarefreeness.

The normalized radicals are therefore $`1-t`$ and $`g`$, whose linear coefficients are $`-1`$ and $`-M`$. Any rule whose entire input is a bounded truncation of the original Taylor series fails on these inputs once its cutoff is below $`M`$. A rule using the complete circuits or other centers is not ruled out; both radical outputs are themselves small circuits.

The explicit condition $`M\ge2`$ avoids the degenerate $`M=1`$ case, where $`g=1`$.

## 2. Exponentially many multiplicity classes in a short circuit

The digit polynomials $`B_j`$ have algebraic coefficients and satisfy $`B_j(\zeta^a)=a_j`$. With one transcendental scalar $`\tau`$,
```math
A_j=B_j+\tau(t^D-1),
\qquad
P=\prod_{j=0}^{m-1}A_j^{2^j},
\qquad D=2^m,
```
the values at $`\zeta^a`$ are unchanged. The zero factors are exactly the indices with $`a_j=0`$.

For each such factor, its derivative is
```math
B_j'(\zeta^a)+\tau D(\zeta^a)^{D-1}.
```
The first term is algebraic and the coefficient of $`\tau`$ is a nonzero algebraic number, so the derivative cannot vanish. Each zero factor is simple. Valuations of a product add, giving
```math
\mathop{\mathrm{ord}}_{\zeta^a} P
=\sum_{j:a_j=0}2^j=D-1-a.
```
For $`0\le a\le D-2`$, these values give every positive integer from $`D-1`$ down to one. At $`a=D-1`$, the value is zero and the point is not a root of $`P`$.

The shared digit circuits use $`O(m^2)`$ gates, the correction $`t^D-1`$ is shared, and exponentiation by $`2^j`$ uses $`j`$ squarings per factor, with total $`O(m^2)`$ cost. One fixed transcendental constant is allowed by the stated complex constant model.

Consequently the number of multiplicity classes is superpolynomial in the supplied circuit size. This invalidates a strategy that enumerates all distinct multiplicities under an assumed polynomial bound. It establishes no hardness of the radical of this particular $`P`$.
