# Jack majorization for two columns and their rectangular shifts

Let λ and μ be partitions of the same size in at most $`n`$ variables. Append zero parts to length $`n`$. If λ dominates μ and $`\lambda_1-\lambda_n\le2`$, the normalized Jack difference at $`\tau`$ belongs to the **Jack cone** at $`\sigma`$ for every $`0\le\sigma<\tau\le\infty`$. The cone permits nonnegative sums of normalized dominance differences. Chen–Khare–Sahi Conjecture 4 asks for membership in the larger semiring, for all partitions. Their Theorem 4.9 treats all partitions in two variables and one family in higher rank. [Chen–Khare–Sahi, §4.2](https://arxiv.org/html/2509.19649v2#S4.SS2)

The Jack polynomials used below are the usual specializations of the stable Jack symmetric functions, as the authors explicitly identify them after (2.10). For degrees at most the number of variables, their displayed power-sum pairing also agrees directly with this definition. Above that range, the separately described finite power-sum convention requires care. [Source definitions](https://arxiv.org/html/2509.19649v2#S2.SS3) · [Repository convention audit](https://github.com/1337isnot1337/solved-conjectures/blob/0db30f09c60bb63c1bc27a22ab0e5044647be4aa/results/chen-khare-sahi-macdonald/SOURCE_AUDIT.md)

Subtract the common rectangular partition of height $`n`$ and width $`\lambda_n`$. This is possible because $`\mu_n\ge\lambda_n`$ by dominance. Both first parts after subtraction are at most two. Reinserting the rectangle multiplies every Jack polynomial by the same power of $`x_1\cdots x_n`$, with value one at the normalization point, and sends each source difference to another source difference. This is the rectangular shift of Chen–Khare–Sahi §3.2.1. It suffices to consider the chain $`\lambda_i=(2^i,1^{d-2i})`$ of degree $`d`$, indexed by $`\max(0,d-n)\le i\le\lfloor d/2\rfloor`$. Higher $`i`$ means higher dominance.

Write $`P_i(w)`$ for the standard monic Jack function of shape $`\lambda_i`$ in Stanley’s parameter $`w=\alpha=1/\tau`$, $`V_i(w)=P_i(w)(1^n)`$, and $`F_i(w)=P_i(w)/V_i(w)`$. Set $`u=1/\sigma`$ and $`v=1/\tau`$, so $`0\le v<u\le\infty`$. First work in the stable ring with all $`0\le i\le\lfloor d/2\rfloor`$, then specialize to $`n`$ variables. Let $`(x)_l=x(x+1)\cdots(x+l-1)`$ and $`x^{\underline l}=x(x-1)\cdots(x-l+1)`$. Empty products equal one.

## Connection coefficients

Set $`s=d-2i`$ and $`l=i-j`$. For finite $`u>v\ge0`$,

```math
 P_i(v)=\sum_{j=0}^i R_{ij}(u,v)P_j(u),\qquad
 R_{ij}(u,v)=
 \frac{(s+1)_{2l}(u-v)_l}{l!(u+s+l)_l(v+s+1)_l}.
```

The scalar array is the transpose of the binary Jack connection in Chen–Khare–Sahi (4.8) after the parameter substitution. Equivalently these are classical Gegenbauer connection coefficients after adjusting normalization. Here the array acts on stable two-column Jack functions, with a different rank-dependent normalization. [Chen–Khare–Sahi, equation (4.8)](https://arxiv.org/html/2509.19649v2#S4.SS2) · [Gegenbauer connection](https://dlmf.nist.gov/18.18.E16)

Let $`A_{ir}(w)=[m_{\lambda_r}]P_i(w)`$. Dividing Stanley’s integral-form expansion (46) by its leading coefficient gives, for $`m=i-r`$,

```math
 A_{ir}(w)=\frac{(d-2r)!}{(d-2i)!}\,
   \frac1{m!(w+d-2i+1)_m}.
```
No other monomials occur. Put $`z_k=k(w+d-k)`$. The second factor is $`1/\prod_{p=r}^{i-1}(z_i-z_p)`$. The nodes $`z_0,\dots,z_{\lfloor d/2\rfloor}`$ are distinct for $`w\ge0`$. The inverse matrix $`B(w)`$ has entries

```math
 B_{ir}(w)=\frac{(d-2r)!}{(d-2i)!}
  \frac{(-1)^m}{m!(w+d-i-r)_m}.
```
Indeed, after cancellation of the factorial ratio, $`(BA)_{ir}`$ is the sum of $`1/\prod_{r\le p\le i,\ p\ne k}(z_k-z_p)`$ over $`r\le k\le i`$. For $`i>r`$ this is the leading coefficient in the Lagrange interpolation formula for the constant polynomial one, hence zero. For $`i=r`$ the matrix entry is one. [Stanley, Proposition 7.2, equation (46), printed p. 105](https://math.mit.edu/~rstan/pubs/pubfiles/73.pdf#page=30)

The coefficient of $`P_j(u)`$ is $`(A(v)B(u))_{ij}`$. Set $`l=i-j`$, substitute $`m=i-k`$ in the matrix product, and extract $`(s+1)_{2l}/[l!(u+s+l)_l]`$. The remaining factor is

```math
 (-1)^l\sum_{m=0}^l(-1)^m\binom lm\frac{(u+s+l)_m}{(v+s+1)_m}
 =(-1)^l\frac{(v+1-u-l)_l}{(v+s+1)_l}
 =\frac{(u-v)_l}{(v+s+1)_l}.
```

The first equality is finite Chu–Vandermonde summation. This proves the coefficient formula, including $`l=0`$. [Finite Chu–Vandermonde identity](https://dlmf.nist.gov/15.4.E24)

## The normalized rows

Specialize to $`n`$ variables. Terms with $`j<\max(0,d-n)`$ vanish. The hook evaluation and leading coefficient give, for $`a=d-i`$, $`b=i`$, $`s=a-b`$,

```math
 V_i(w)=\frac{n^{\underline a}(n+w)^{\underline b}}
                   {(w+a)^{\underline b}s!b!}.
```
It is positive for every retained index, including at $`w=0`$. Thus

```math
 K_{ij}(u,v)=R_{ij}(u,v)V_j(u)/V_i(v)
```
is nonnegative and its rows sum to one by evaluation of the connection formula at $`1^n`$. It satisfies $`F_i(v)=\sum_j K_{ij}F_j(u)`$. [Stanley, Theorems 5.4 and 5.6](https://math.mit.edu/~rstan/pubs/pubfiles/73.pdf)

Suppose first that $`0<u-v\le1`$. For adjacent retained indices $`i-1,i`$ and every retained $`j<i`$, cancellation gives

```math
 \frac{K_{ij}}{K_{i-1,j}}=
 \frac{i(n-a)}{(n+v-i+1)(v+a+1)}
 \left(1+\frac{(u-v-1)(v+s+1)}{l(u+s+l)}\right).
```
Indeed the quotient $`R_{ij}/R_{i-1,j}`$ equals

```math
 \frac{(s+1)(s+2)}{(v+s+1)(v+s+2)}
 \frac{(u-v+l-1)(v+s+l+1)}{l(u+s+l)}.
```

The first factor also appears in $`V_i(v)/V_{i-1}(v)`$, whose remaining factors are $`(n+v-i+1)/(n-a)`$ and $`(v+a+1)/i`$. The parenthesized factor in the displayed ratio for $`K`$ is at most one. Its prefactor is strictly less than one since $`a\ge i`$ and $`n>a`$. All denominators are positive. Consequently $`K_{ij}<K_{i-1,j}`$ for every retained $`j<i`$.

Subtracting the rows gives the following cone expression.

```math
 F_i(v)-F_{i-1}(v)
 =\sum_{j\lt i}(K_{i-1,j}-K_{ij})\big(F_i(u)-F_j(u)\big),
```
where only retained $`j`$ occur. Each summand is a source-parameter dominance difference and every coefficient is positive. Telescoping gives the claim for any two indices. For finite $`u-v>1`$, subdivide $`[v,u]`$ into finitely many steps of length at most one and compose the cone expressions. All intermediate shapes remain in the same chain.

For $`u=\infty`$, fix $`v<\infty`$. For finite $`u>v`$ the matrix $`K(u,v)`$ factors into the row-stochastic matrices for its short steps, by successive changes of basis. Each short-step matrix preserves increasing functions of the chain index by the displayed row difference, so their product does too. Applying this observation to upper-tail indicators gives $`\sum_{j\ge r}(K_{ij}-K_{i-1,j})\ge0`$. As $`u\to\infty`$, $`R_{ij}(u,v)\to A_{ij}(v)`$, $`P_j(u)\to m_{\lambda_j}`$, and $`V_j(u)\to m_{\lambda_j}(1^n)>0`$. The tail inequalities persist. Finite summation by parts expands the target difference in adjacent normalized monomial differences at this endpoint. The case $`v=0`$, corresponding to target parameter $`\tau=\infty`$, was already included in the finite connection and norm formulas.

## Independent check

Run `python3 research/chen-khare-sahi/check_two_columns.py` from the repository root. An independent calculation diagonalizes the Jack differential operator in the elementary-product basis. Through degree 14 the exact rational tests check 1,836 monomial coefficients, 5,958 hook evaluations, 2,979 transition rows, 7,686 cumulative inequalities and 1,848 strict short-step coefficient comparisons. The written proof treats arbitrary degree and rank. [Checker](check_two_columns.py) · [Tracking issue](https://github.com/1337isnot1337/solved-conjectures/issues/201)
