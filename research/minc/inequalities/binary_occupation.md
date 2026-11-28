# Gyires’s ratio inequality

Let $J$ have all entries $1/n$, and let $d_n=n!/n^n$. If a doubly stochastic matrix $A$ has at most two distinct rows, then every row-stochastic $L$ of the same order satisfies

```math
\mathop{\mathrm{per}}(LA)\le \mathop{\mathrm{per}}A. \tag{1}
```

The rows of $L$ may be chosen independently. Transposition gives the corresponding column statement. Consequently, if $A$ has at most two distinct rows **and** at most two distinct columns, all three terms $`\mathop{\mathrm{per}}(AA^T)`$, $`\mathop{\mathrm{per}}(A^TA)`$, $`\mathop{\mathrm{per}}(A^2)`$ are at most $`\mathop{\mathrm{per}}A`$. Its Gyires ratio is at least $`\mathop{\mathrm{per}}A\ge d_n`$, with equality with $d_n$ precisely at $J$ by van der Waerden's theorem. Different partitions on the row and column sides and unequal class sizes are allowed. For just two row types, (1) already covers $A^TA$ and every positive power of $A$.

## A binomial probability inequality

Let $0\le q_i\le1$, $\sum_{i=1}^n q_i=m$ with $0<m<n$ an integer. Write $\mu_q$ for the distribution of the sum of independent Bernoulli variables of probabilities $q_i$, and $\pi$ for the binomial law of parameters $n,p=m/n$. The density $f_q(k)=\mu_q(k)/\pi(k)$ is nondecreasing up to $m$ and nonincreasing thereafter.

For an elementary proof, fix any $k$ and minimize the required signed adjacent difference over the slice $\sum q_i=m$. The difference is symmetric and affine in each coordinate separately. An extremizer can be chosen with only one distinct coordinate value in $(0,1)$. Indeed, along a pair of coordinates with fixed sum the objective is affine in the square of their difference. Choose a minimizer maximizing $\sum q_i^2$. If two interior coordinates differ, the current pair lies strictly inside the interval of possible squared differences. The objective must be constant on that interval, so moving to the far endpoint contradicts maximality. This extremal principle is Hoeffding's Corollary 2.1. [Hoeffding’s original paper](https://repository.lib.ncsu.edu/bitstream/1840.4/2268/1/ISMS_1955_128.pdf)

At such a vector $\mu_q$ is a point mass at $m$ or the distribution of $`s+\mathop{\mathrm{Bin}}(l,h/l)`$, with $s$ coordinates equal to one and $`h=m-s\in\{1,\ldots,l-1\}`$. Its density relative to $\pi$ is log-concave on its integer support. Indeed, $f_q(k+1)/f_q(k)$ is a positive constant times

```math
\frac{k+1}{k+1-s}\frac{s+l-k}{n-k},
```

and both factors are nonincreasing. At the mean, $\mu_q(m)/\mu_q(m-1)=1+1/(l-h)\ge1+1/(n-m)=\pi(m)/\pi(m-1)$. On the other side, $\mu_q(m)/\mu_q(m+1)=1+1/h\ge1+1/m=\pi(m)/\pi(m+1)$. This proves every required difference at every extremizer, including zero probabilities off the support.

## Arbitrary stochastic row mixing

Write the two rows of $A$ as $u,v$, of multiplicities $m,n-m$. Column balance says $q_j=m u_j=1-(n-m)v_j$. Let $A_k$ contain $k$ copies of $u$ and $n-k$ copies of $v$. Expansion by the columns assigned to the first row group gives

```math
\mathop{\mathrm{per}}(A_k)=\frac{k!(n-k)!}{m^k(n-m)^{n-k}}\mu_q(k)=d_n f_q(k).
```

The density inequality gives $`\mathop{\mathrm{per}}(A_k)\le\mathop{\mathrm{per}}(A_m)`$. Each row of $LA$ is a convex combination of $u,v$. Multilinearity expresses its permanent as an average of these row-repetition permanents and proves (1). The one-row-type case is $A=J$.

## Monotonicity toward the boundary

There is a broader application to Friedland and Minc's Problem 8. Take $p=m/n$ as above and vectors $a,b\in[0,1]^n$ with both coordinate sums $m$. The matrix

```math
A_{ij}=\frac1n\left(1+\frac{(a_i-p)(b_j-p)}{p(1-p)}\right) \tag{2}
```

is doubly stochastic. Nonnegativity follows by writing the bracket as $a_i b_j/p+(1-a_i)(1-b_j)/(1-p)$. For every such pair the permanent increases strictly along $J+t(A-J)$ for $0\le t\le1$ whenever $A\ne J$. This includes the two-row case by taking $a_i$ to be its group indicator. Both vectors may also take arbitrarily many distinct values. The proof uses the integer value of $np$.

For any $a,b$ of common mean $p$, expand the two terms in the preceding bracket, then sum over permutations. For each intermediate count $k$, the number of bijections respecting a choice of $k$ rows and $k$ columns is $k!(n-k)!$. Hence, with inner product in $L^2(\pi)$,

```math
\mathop{\mathrm{per}}(A)/d_n=\sum_k\mu_a(k)\mu_b(k)/\pi(k)=\langle f_a,f_b\rangle_\pi.
```

Independently retain each of $n$ binary coordinates with probability $t$ and refresh it from $`\mathop{\mathrm{Bernoulli}}(p)`$ otherwise. Write $T_t$ for the induced count kernel. It is reversible for $\pi$ and $T_t f_b=f_{p\mathbf1+t(b-p\mathbf1)}$. The last identity follows by evolving the law of the independent bits and applying reversibility. Thus the normalized radial permanent is $H(t)=\langle f_a,T_t f_b\rangle_\pi$. At $0<t\le1$, its derivative is

```math
t H'(t)=\sum_{k=0}^{n-1}\pi(k)(n-k)p\,\Delta f_a(k)\,\Delta (T_t f_b)(k),\qquad \Delta g(k)=g(k+1)-g(k).
```

Indeed, under the time change $t=e^{-s}$ the count chain has upward rate $(n-k)p$ and downward rate $k(1-p)$. Differentiate its semigroup and use detailed balance to obtain the displayed Dirichlet form. Both densities are nondecreasing up to the same integer $m$ and nonincreasing after it. Every summand is nonnegative. The polynomial $H$ is strictly increasing for $A\ne J$, since any plateau would make it constant and van der Waerden's equality case gives $H(1)>H(0)=1$.

## Scope and sources

The open targets are [Gyires’s ratio inequality](https://yair-lavi.com/mincs-list/conjecture-20/index.html) and [Friedland and Minc’s boundary problem](https://yair-lavi.com/mincs-list/problem-8/index.html). David London had already studied rank-two permanents using a pairing of associated polynomials. The binomial representation here makes no claim of historical priority. The proofs above do not give Gyires's inequality for arbitrary rank-two matrices or characterize all monotone boundary directions. [London’s 1981 paper](https://doi.org/10.1080/03081088108817382)
