# Kauers–Koutschan recurrence conjecture

Write $a_n$ for the number of permutations $\pi$ of $[n]$ satisfying $\pi(i+2)-\pi(i)\ne2$ for every $1\le i\le n-2$, including $a_0=1$. We prove that $\sum_{i=0}^8 P_i(n)a_{n+i}=0$ for every $n\ge0$, with exactly the polynomials listed in A189281. Row $i$ of the accompanying coefficient table gives $P_i$ in ascending degree, starting at row zero. We also verify the published order-thirteen operator. [Conjecture 10](https://arxiv.org/abs/2202.07966) · [OEIS operators](https://oeis.org/A189281) · [Coefficient table](operator.txt)

## 1. Inclusion–exclusion on two chains

Put $p=\lceil n/2\rceil$ and $q=\lfloor n/2\rfloor$. The odd and even positions, in their natural orders, form two chains of lengths $p,q$. The values form two chains with the same lengths. An offending pair is an oriented adjacency of a value chain that maps to an oriented adjacency of a position chain under $\pi^{-1}$.

Use inclusion–exclusion on these value-chain adjacencies. A selected subset groups each value chain into an ordered list of blocks of consecutive values of the same parity. A block of length $\ell$ has sign $(-1)^{\ell-1}$. Assign each block to one of the position chains. Within that chain its entries must be consecutive, in the specified order. If $k_i$ blocks go to position chain $i$, there are $k_i!$ orders for them, provided they fill that chain. Blocks are distinguishable by their original value intervals. This counts every permutation satisfying the selected adjacencies exactly once.

Let $u_i$ mark the length of position chain $i$, and $v_j$ the length of value chain $j$. Let $x_1,x_2$ be independent unit exponential random variables, so $\mathbb E x_i^k=k!$. Summing a nonempty signed block gives $z/(1+z)$. Summing the ordered list of such blocks in each value chain gives the generating function

```math
 F(u,v)=\mathbb E\prod_{j=1}^{2}
 \left(1-\sum_{i=1}^{2}x_i\frac{u_i v_j}{1+u_i v_j}\right)^{-1}.
```

Then $a_n$ is the coefficient of $u_1^p u_2^q v_1^p v_2^q$ in $F$. All series and expectations here are coefficientwise, so each uses only finitely many moments.

## 2. A Schur moment

Realize $x_i=|g_i|^2$ for independent complex Gaussian coordinates with density $\pi^{-1}e^{-|z|^2}$. Write $D=\mathrm{diag}(u_1,u_2)$ and $`T=gg^*-I`$. The matrix determinant lemma gives

```math
 \det(I-vDT)=
 \prod_i(1+u_i v)\left(1-\sum_i x_i\frac{u_i v}{1+u_i v}\right).
```

For a two-part partition $\lambda=(r,j)$ with $r\ge j\ge0$, write $s_\lambda$ for its Schur character. The two-variable Cauchy identity gives

```math
 F(u,v)=\prod_{i,j}(1+u_i v_j)
 \sum_{\lambda} s_\lambda(v_1,v_2)\,\mathbb E\,s_\lambda(DT).
\tag{1}
```

Indeed, for eigenvalues $z_1,z_2$ of $DT$, the Cauchy kernel is $\prod_{i,j}(1-z_i v_j)^{-1}$. This identity also follows directly by summing the two-variable alternant formula for $s_{(r,j)}$. It extends to all matrices by polynomial identity in each homogeneous degree.

The random matrix $T$ is invariant in law under unitary conjugation. For $\rho_\lambda=\det^j\otimes\mathrm{Sym}^{r-j}$ on $\mathbb C^2$, the expectation $\mathbb E\rho_\lambda(T)$ commutes with every $\rho_\lambda(U)$, $U\in U(2)$. This representation is irreducible. On homogeneous polynomials, the diagonal torus separates the monomials and the two off-diagonal infinitesimal operators connect adjacent monomials, proving irreducibility of the symmetric power. The determinant twist preserves it. Schur’s lemma and the trace therefore give

```math
 \mathbb E\,s_\lambda(DT)=s_\lambda(u_1,u_2)\,
 \frac{\mathbb E\,s_\lambda(T)}{r-j+1}.
\tag{2}
```

Let $t=|g_1|^2+|g_2|^2$. It has density $te^{-t}$ on the positive half-line. The eigenvalues of $T$ are $t-1,-1$. Put $k=r+1$, so the dimension in (2) is $k-j$. The alternant formula has denominator $(t-1)-(-1)=t$, which cancels the factor $t$ in the density. Define $`D_\ell=\int_0^\infty e^{-t}(t-1)^\ell\,dt`$. Integration by parts gives $D_0=1$ and $D_{\ell+1}=(\ell+1)D_\ell+(-1)^{\ell+1}$, the derangement numbers. The scalar in (2) is exactly

```math
 C(k,j)=\frac{(-1)^jD_k-(-1)^kD_j}{k-j}.
\tag{3}
```

## 3. Extracting the count

For each subset $S$ of the four cells of a $`2`$-by-$`2`$ square, write $d=|S|$ and let $r_i,c_i$ be its row and column sums. Selecting these numerator factors in (1) leaves total degree $n-d$ on each side. Put

```math
 m=n-d+1,\qquad J=\min(p-r_1,q-r_2,p-c_1,q-c_2).
```

The weights of $s_{(k-1,j)}(u_1,u_2)$ are the monomials of total degree $k+j-1$ with each exponent at least $j$, each with coefficient one. The same applies to $v$. Thus

```math
 a_n=\sum_{S\subseteq[2]\times[2]}\ \sum_{j=0}^{J} C(m-j,j).
\tag{4}
```

A negative upper limit gives zero. For every nonempty inner sum $2J\le m-1$, so its denominators are nonzero. This proves the formula including $n=0$.

## 4. A two-step recurrence for the full sum

For $m\ge0$ define

```math
 T_m=\sum_{0\le j\lt m-j}C(m-j,j)
 =\sum_{\substack{0\le k\le m\\2k\ne m}}
       \frac{(-1)^{m-k}D_k}{2k-m},\qquad
 U_m=\sum_{k=0}^{m}(-1)^{m-k}D_k .
```

The second expression for $T_m$ pairs $k$ with $m-k$. In $T_{m+2}$ separate the endpoints $0,m+2$. Together they contribute $D_{m+1}$ by the derangement recurrence. At each interior index $k+1$, substitute $D_{k+1}=(k+1)D_k+(-1)^{k+1}$. The constant terms sum to zero by $k\leftrightarrow m-k$. Writing $k+1=(2k-m)/2+(m+2)/2$ in the remaining terms yields

```math
 T_{m+2}=D_{m+1}-\frac{m+2}{2}T_m-\frac12 U_m
       +\frac12\,\mathbf{1}_{2\mid m}(-1)^{m/2}D_{m/2}.
\tag{5}
```

Also $U_{m+1}=D_{m+1}-U_m$. The half-index terms $E_j=(-1)^jD_j$ satisfy $E_{j+1}=-(j+1)E_j+1$.

## 5. Exact substitution into the conjectured operators

Here are the finite polynomial identities completing the proof. The included checker expands them over $\mathbb Q$, using the coefficients in A189281. We describe the arithmetic explicitly so that the identity can be replayed in another algebra system. [Checker](verify.py) · [Original operator](operator.txt) · [Published factorization of the order-thirteen operator](https://oeis.org/A189281)

For $t=4,\ldots,18$ write $A_t=a_{2h+t}$, where $h\ge0$ is arbitrary. Treat $T_{2h},T_{2h+1},D_{2h},U_{2h},E_h,1$ as six independent indeterminates over $\mathbb Q[h]$, with $B$ representing $1$ in the inhomogeneous recurrences. Generate the required positive shifts by (5) and the three first-order recurrences above. For each numerator subset take $s=t+1-d$ and let $J_0$ be the cutoff in (4) calculated at $n=t$. The contribution to $A_t$ is

```math
 T_{2h+s}-
 \sum_{i=J_0+1}^{\lfloor(s-1)/2\rfloor}
 \frac{(-1)^s(E_{h+s-i}-E_{h+i})}{s-2i}.
\tag{6}
```

Indeed the full sum includes exactly those omitted pairs with $j=h+i$. Formula (3) gives the displayed summand. All denominator factors are nonzero rational constants. Each computed $A_t$ is thus a linear form in the six indeterminates with polynomial coefficients in $h$.

Applying the original order-eight operator gives the following six coefficients in the indicated order.

| Base index | $T_{2h}$ | $T_{2h+1}$ | $D_{2h}$ | $U_{2h}$ | $E_h$ | $B$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| $2h+4$ | 0 | 0 | 0 | 0 | 0 | 0 |
| $2h+5$ | 0 | 0 | 0 | 0 | 0 | 0 |

The checker verifies the same two polynomial identities for the equivalent order-thirteen operator using van Hoeij’s factorization. For $n=0,1,2,3$ direct substitution of (4) gives residual zero for both operators. Every $n\ge0$ occurs in these four initial indices or one of the two polynomial identities, proving the conjecture.
