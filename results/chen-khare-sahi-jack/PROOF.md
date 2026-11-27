# A counterexample to the Jack semiring conjecture

Take $`n=5`$, the source parameter $`\sigma=1`$, the target parameter $`\tau=3/2`$, and the partitions $`\lambda=(3,2)\succ\mu=(3,1,1)`$. Put $`F_\nu=P_\nu(x;\tau)/P_\nu(1^5;\tau)`$. Then the coefficient of the column Schur polynomial $`s_{(1^5)}`$ in $`F_\lambda-F_\mu`$ is $`1/4522`$. Every element of the proposed Schur semiring with degree five, leading first part at most three, and value zero at $`1^5`$ has a nonpositive column coefficient. This disproves Chen–Khare–Sahi Conjecture 4, equation (4.5). Here dominance compares partitions of the same size by all prefix sums. The proposed semiring consists of finite nonnegative real sums of products of individual normalized source Jacks and normalized differences for such pairs. At $`\sigma=1`$ the source Jacks are Schur polynomials. The argument extends to every $`n\ge5`$ and $`1\lt \tau\lt 2`$. [Chen–Khare–Sahi, §4.2](https://arxiv.org/html/2509.19649v2#S4.SS2)

## A sign restriction on the Schur semiring

Fix $`d\le n`$. Every homogeneous symmetric polynomial of degree $`d`$ in $`n`$ variables has a unique stable homogeneous lift, since all partitions of $`d`$ have at most $`n`$ parts. In these degrees, multiplication of homogeneous factors agrees with stable multiplication whenever the total degree is at most $`n`$. On the stable symmetric functions let $`E`$ denote the homomorphism $`p_k\mapsto(-1)^{k-1}`$. This is the standard involution $`\omega`$, followed by evaluation on the single variable $`1`$. Hence $`E(s_\rho)=1`$ if $`\rho`$ is a single column, and zero for every other nonempty shape, because $`\omega`$ transposes Schur shapes and one-variable evaluation kills shapes with two or more rows. On degree $`d`$ polynomials $`E`$ extracts the coefficient of $`s_{(1^d)}`$.

Let $`S_\rho=s_\rho(x)/s_\rho(1^n)`$. Each nonzero generator $`S_a`$ or $`S_a-S_b`$ with $`a\succ b`$ has positive leading coefficient in lexicographic monomial order $`x_1>\cdots>x_n`$. Its leading monomial is $`x^a`$, by Schur triangularity and the fact that strict dominance implies strict lexicographic order. Products add leading exponents. In a finite nonnegative sum the lexicographically greatest of the leading monomials survives. All generators are homogeneous, so a putative representation of a homogeneous polynomial can be restricted to the terms of its degree.

Suppose a nonzero homogeneous semiring element has leading first part at most three and vanishes at $`1^n`$. Every product in its representation with positive scalar coefficient must have at least one nonzero difference, because the pure products have value one and every difference vanishes at $`1^n`$. The upper partition of a strict dominance difference has first part at least two, because the column partition is minimal. Two such differences in a product would give first part at least four. Every contributing product thus has precisely one difference. Its $`E`$-value is nonpositive, since $`E(S_a)=0`$ for that upper partition and $`E`$ is nonnegative on every individual normalized Schur polynomial. Adding the products preserves this sign restriction.

## Evaluating the target

For general $`n\ge5`$, put $`F_\rho=P_\rho(x;\tau)/P_\rho(1^n;\tau)`$. The authors' target parameter is the reciprocal of Stanley's parameter, so $`\alpha=1/\tau`$. For a homogeneous symmetric function $`f`$ of degree $`d`$ write $`f(1^u)`$ for the polynomial specialization $`p_k\mapsto u`$. On each power-sum monomial $`p_\rho`$ we have $`E(p_\rho)=(-1)^{d-\ell(\rho)}`$, hence $`E(f)=(-1)^d f(1^{-1})`$. Stanley's Theorem 5.4 gives $`J_\rho(1^u;\alpha)=\prod_{(i,j)\in\rho}(u-i+1+\alpha(j-1))`$ for the integral Jack form. Both sides are polynomials in $`u`$, so the formula holds at $`u=-1`$. The shape-dependent scalar relating the monic and integral forms cancels in the normalized polynomial. Therefore

```math
E(F_\rho)=\prod_{(i,j)\in\rho}\frac{i-\alpha(j-1)}{n-i+1+\alpha(j-1)}.
```

[Stanley, Theorem 5.4, p. 93](https://math.mit.edu/~rstan/pubs/pubfiles/73.pdf#page=18) · [Chen–Khare–Sahi, parameter convention](https://arxiv.org/html/2509.19649v2#S1.SS2.SSS1)

At $`n=5`$ and $`\alpha=2/3`$, the four boxes shared by $`(3,2)`$ and $`(3,1,1)`$ yield the product $`(1/5)(1/17)(-1/19)(1/2)=-1/3230`$. The extra boxes $`(2,2)`$ and $`(3,1)`$ give factors $`2/7`$ and $`1`$, respectively. The resulting column coefficient is

```math
E(F_{(3,2)}-F_{(3,1,1)})
=-\frac1{11305}+\frac1{3230}=\frac1{4522}>0.
```

The normalized Jack difference vanishes at $`1^5`$ and has leading shape $`(3,2)`$ by monomial triangularity. The positive normalization does not change that leading exponent, and the second polynomial has strictly smaller leading shape. The positive column coefficient violates the sign restriction. More generally, the coefficient is

```math
\frac{2(n+1)(1-\alpha)(2\alpha-1)(1+\alpha)}
 {n(n-1)(n-2)(n+\alpha)(n+2\alpha)(n-1+\alpha)}.
```

All denominator factors are positive for $`n\ge5`$ and $`1/2\lt \alpha\lt 1`$. In that interval the numerator is positive as well. The same leading shape and vanishing at $`1^n`$ give nonmembership throughout the stated family. The disproof concerns the specified algebraic representation of the Jack difference. The separate pointwise majorization inequality is consistent with it.
