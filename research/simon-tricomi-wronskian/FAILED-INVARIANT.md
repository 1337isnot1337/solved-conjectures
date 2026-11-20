# Failure of individual derivative-column positivity

This is an obstruction to one proposed proof method, not a counterexample to Simon's conjecture. It supersedes the favorable three-point diagnostic in PROGRESS.md.

Let n equal 6, let $`2<b<8/3`$, and put $`d=b+1`$. These parameters satisfy $`0<b<d\leq n`$ and lie above $`\mathcal E_6`$, because the two integer parts are 2 and 3. Put $`a=d-n=b-5`$.

Let $`C_1(z)`$ be the defining size-seven determinant with b replaced by $`b+1`$ only in column j equal to one, leaving every Pochhammer factor unchanged. Then $`C_1(z)<0`$ for all sufficiently small positive z. The derivative of $`D^6_{b,d}`$ is the negative of b times the sum of all seven replacement determinants, so a negative individual term does not decide the derivative's sign.

## Exact asymptotic calculation

Write $`\delta_j=1`$ if $`j=1`$, and zero otherwise. The entries are

```math
(a+j)_i\Psi(b+\delta_j,
b+\delta_j+1-a-i-j,z).
```

The elementary Tricomi integral gives a power asymptotic when its second shape exceeds the first, a logarithm at equality, and a finite beta-integral limit otherwise. In the leading upper-left block $`0\leq i,j\leq2`$, this yields

```math
A_{ij}(z)\sim
z^{i-5}z^{j-\delta_j}
\frac{(b-5+j)_i\Gamma(5-i-j+\delta_j)}
{\Gamma(b+\delta_j)}.
```

Its determinant therefore has order $`z^{-10}`$. Direct polynomial algebra gives the coefficient

```math
\det_{0\leq i,j\leq2}
\left[
\frac{(b-5+j)_i\Gamma(5-i-j+\delta_j)}
{\Gamma(b+\delta_j)}
\right]
=\frac{24(b-1)(3b-8)}{b\Gamma(b)^3}<0.
```

The lower-right block $`3\leq i,j\leq6`$ tends to

```math
B_{ij}=\frac{\Gamma(i+j-5)}{\Gamma(b-5+j)}.
```

All its column denominators are positive. Its determinant is

```math
\det B=
\frac{144}{\Gamma(b-2)\Gamma(b-1)\Gamma(b)\Gamma(b+1)}>0.
```

For completeness, the off-diagonal blocks do not change the leading coefficient. Scale the first three rows by $`z^{5-i}`$ and the first three columns by $`z^{-j+\delta_j}`$. The normalized upper-left block tends to the invertible matrix displayed above. The normalized upper-right block is $`O(z^3|\log z|)`$, while the normalized lower-left block is $`O(z^{-2}|\log z|)`$. Their contribution to the Schur complement is $`O(z|\log z|^2)`$, which tends to zero. The lower-right block tends to B. Hence

```math
C_1(z)\sim
\frac{24(b-1)(3b-8)}{b\Gamma(b)^3}
\frac{144}{\Gamma(b-2)\Gamma(b-1)\Gamma(b)\Gamma(b+1)}
z^{-10}<0.
```

Thus the stronger individual-column positivity statement is false throughout a parameter interval inside the conjecture's remaining range. Any determinant-derivative proof must account for cancellation among the column replacements. No conclusion about the full conjecture follows from this obstruction.

The asymptotics are the standard integral limits also recorded as Lemma 5 in [Simon's source](https://arxiv.org/pdf/1207.6464). The coefficient determinants above are finite exact algebra, not floating-point certificates.
