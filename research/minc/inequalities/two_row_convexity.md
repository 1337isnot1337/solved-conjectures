# Lih–Wang convexity inequality

For any doubly stochastic matrix with at most two distinct rows, the permanent is convex on the **entire** segment from the uniform matrix $`J`$ to the matrix. It is strictly convex for a nonuniform matrix. The class allows arbitrary row multiplicities and any number of different columns, and transposition gives the same theorem with rows and columns exchanged. This gives the full chord on these matrices in every order. The [Lih–Wang conjecture](https://yair-lavi.com/mincs-list/conjecture-34/index.html) asks for the half-chord on all doubly stochastic matrices.

## Curvature as a five-point comparison

Write $`m,r>0`$ for the row multiplicities, $`n=m+r`$, $`p=m/n`$, and $`q_j=m u_j=1-r v_j`$, where $`u,v`$ are the distinct rows. Write $`f`$ for the density of the sum of independent Bernoulli variables of probabilities $`q_j`$ relative to $`\pi=\mathop{\mathrm{Bin}}(n,p)`$. The sum of the probabilities is $`m`$. The normalized radial permanent $`H(t)=\mathop{\mathrm{per}}(J+t(A-J))/(n!/n^n)`$ is $`(T_t f)(m)`$, where $`T_t`$ keeps each bit with probability $`t`$ and refreshes it at parameter $`p`$ otherwise. This follows directly by choosing the columns assigned to the $`m`$ copies of the first row. [Binomial occupation formula](binary_occupation.md)

It suffices to show $`H''(1)\ge0`$ for every such matrix. Applying the endpoint result to $`J+t(A-J)`$ then gives $`t^2H''(t)\ge0`$ for $`0<t\le1`$, and continuity includes zero. The positive binomial generator is
```math
 L f(k)=(n-k)p(f(k)-f(k+1))+k(1-p)(f(k)-f(k-1)).
```
Since $`T_t=\exp((\log t)L)`$, we have $`H''(1)=[(L^2-L)f](m)`$. This linear functional of $`f`$ is symmetric and multiaffine in the $`q_j`$. By the fixed-sum pair argument in the [rank-two monotonicity proof](rank_two_monotonicity.md), a minimizer has $`s`$ coordinates equal to one, $`z`$ equal to zero and all interior coordinates equal.

If the vector is deterministic, $`f`$ is supported at $`m`$, and the coefficient of $`f(m)`$ in $`n^2(L^2-L)f(m)`$ is $`6m^2r^2-mr(m+r)>0`$. Otherwise, put $`a=m-s`$, $`b=r-z`$. These are positive integers and the count has law $`s+\mathop{\mathrm{Bin}}(a+b,a/(a+b))`$. In this case $`f(m)>0`$. For example,
```math
 \frac{f(m+1)}{f(m)}=\frac{a(m+1)}{m(a+1)}.
```
When $`r\ge2`$ the ratio at $`m+2`$ is $`a^2(b-1)\,r(m+1)(m+2)/(b(a+1)(a+2)m^2(r-1))`$. Reflection exchanges $`(a,m)`$ with $`(b,r)`$ for the two ratios to the left. Multiplying by the corresponding coefficients of the generator squared cancels $`r-1`$ or $`m-1`$. The resulting formula remains valid at $`r=1`$ or $`m=1`$ since $`b=1`$ or $`a=1`$ then makes the absent term zero.

Explicitly, $`n^2H''(1)/f(m)`$ equals
```math
 E=6m^2r^2-mr(m+r)+U(a,b,m,r)+U(b,a,r,m),
```
where
```math
 U(a,b,m,r)=
 \frac{r^2(m+1)(m+2)a^2(b-1)}{b(a+1)(a+2)}
 -\frac{2mr(2r-1)a(m+1)}{a+1}.
```
For comparison, the coefficients at $`f(m+1),f(m+2)`$ of $`n^2(L^2-L)f(m)`$ before inserting the ratios are $`-2m^2r(2r-1)`$ and $`m^2r(r-1)`$.

## Integer polynomial certificate

Substitute $`m=a+s`$, $`r=b+z`$ and clear the positive denominator $`D=ab(a+1)(a+2)(b+1)(b+2)`$. The polynomial $`N=DE`$, in the four nonnegative integer variables $`(a-1,b-1,s,z)`$, has coordinatewise degree at most $`(6,6,2,2)`$ by the displayed formula. All its coefficients in the product basis of binomial polynomials are nonnegative integers. The numbers of strictly positive coefficients for each pair of last two degrees are as follows.

| Degree in $`s`$ / degree in $`z`$ | 0 | 1 | 2 |
| --- | ---: | ---: | ---: |
| 0 | 0 | 17 | 16 |
| 1 | 17 | 20 | 16 |
| 2 | 16 | 16 | 13 |

The [standard-library certificate](verify_two_row_convexity.py) computes the coefficients directly by successive forward differences in each coordinate. Specifically, in degree $`j`$ it applies the weights $`(-1)^{j-i}\binom ji`$ to values at $`i=0,\ldots,j`$. Newton interpolation is exact by the degree bounds, and every binomial basis element is nonnegative at every nonnegative integer. This proves the sign in all orders. The checker also verifies the generator formula against second derivatives obtained independently by multiplying Bernoulli generating polynomials.

Strict convexity follows for $`A\ne J`$ because $`H'(0)=0`$ and $`H(1)>H(0)`$ by the van der Waerden equality case. Thus this convex polynomial is not affine on any interval. Curvature can vanish at an individual endpoint; for example $`(a,b,s,z)=(1,1,1,0)`$ gives zero by substitution.

Hwang studied radial convexity on the first half and had earlier established monotonicity for block matrices and for the all-but-one-identical-row family. The search included the original abstracts, the 2005 permanent survey and the live catalogue. No prior proof of the full-segment two-row-type theorem was identified in those sources, and historical priority has not been independently established. [Hwang on convexity](https://doi.org/10.1080/03081089108818095) · [Hwang on monotonicity](https://doi.org/10.1016/0024-3795(86)90296-X) · [Cheon and Wanless](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf)
