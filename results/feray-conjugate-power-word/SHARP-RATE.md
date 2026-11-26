# Leading total-variation asymptotic for Féray's word

This strengthens [the proof](PROOF.md) for the exact word $W=X^2Y^{-1}XY$ to
```math
d_\mathrm{TV}(\mathcal L(W),\mathop{\mathrm{Unif}}(S_n))
=\frac{e^{-1}}{n-1}+O(n^{-2}).
```
The key is to retain the standard character instead of bounding it by a pointwise worst case. This refinement is not needed for either numbered conjecture.

## 1. Fourier coefficients that survive averaging

Put $U=\mathop{\mathrm{Unif}}(S_n)$. All the characters below are ordinary, not normalized. A conjugation-invariant law has density in the orthonormal basis of irreducible characters in $L^2(U)$; its coefficient on $`\chi`$ is $\mathbf E\chi(W)$ because symmetric-group characters are real. The conditional class factorization of the main proof gives the exact formula
```math
\mathbf E\chi(W)=\frac{\mathbf E[\chi(X^2)\chi(X)]}{d_\chi}.
```
Indeed, conditional on the type of $X$, the scalar Fourier transforms multiply, and the trace is the dimension times their product. This formula includes sign characters and their twists.

Let $F(g)$ and $C_i(g)$ count fixed points and $i$-cycles. The standard character is $\xi=F-1$, of dimension $n-1$, and $F(X^2)=F(X)+2C_2(X)$. For uniform $X$,
```math
\mathbf E F=1,\qquad \mathbf E F(F-1)=1,\qquad
\mathbf E C_2=\frac12,\qquad\mathbf E[FC_2]=\frac12
```
as soon as $n\ge 3$, by marking the indicated disjoint cycles. Consequently
```math
\mathbf E[\xi(X^2)\xi(X)]
=\mathbf E[(F-1)^2+2(F-1)C_2]=1.
```
For its sign twist the same expectation has the extra factor $\mathop{\mathrm{sgn}}(X)$, since $\mathop{\mathrm{sgn}}(X^2)=1$. Each marked-cycle term after expansion uses at most 3 letters. For $n\ge5$, the remaining uniform permutation has equally likely signs, so the sign-twisted coefficient is zero. The sign character itself has coefficient zero as already noted in the main proof.

The rank of a partition $\lambda$ in this argument means $`r(\lambda)=n-\max(\lambda_1,\lambda'_1)`$. At rank 2 the only characters, up to sign twist, are those of $`(n-2,2)`$ and $`(n-2,1,1)`$ for large $`n`$. They have dimensions $`n(n-3)/2`$ and $`(n-1)(n-2)/2`$, and character polynomials
```math
\binom{F}{2}+C_2-F,\qquad
\binom{F-1}{2}-C_2,
```
respectively. The first follows from the permutation representation on two-element subsets, decomposed as $`1+\xi+\chi^{(n-2,2)}`$; the second follows from $`\bigwedge^2`$ of the standard representation and the identity $`\chi_{\wedge^2 V}(g)=(\chi_V(g)^2-\chi_V(g^2))/2`$. Applying a sign twist leaves the absolute values unchanged. The products of these polynomials evaluated at $X$ and $X^2$ have bounded absolute expectations, since $C_2(X^2)=2C_4(X)$ and all fixed-degree moments of $F,C_2,C_4$ are uniformly bounded. To see the last assertion, expand each fixed-degree power into falling factorials: the expectation of $\prod_{i}(C_i)_{m_i}$ is $\prod_i i^{-m_i}$ when $n\ge\sum i m_i$ and zero otherwise, by counting ordered marked disjoint cycles. Each rank-2 coefficient is thus $O(n^{-2})$.

## 2. Bound the higher ranks in $`L^1(U)`$

Let $P_{\ge3}$ be the orthogonal projection onto the span of characters of rank at least 3 in the space of central functions. For a cycle type $\lambda$ of $X$ write $f_\lambda$ for the density of the corresponding conditional law of $W$ with respect to $U$. On the good event $\mathop{\mathrm{cyc}}(X)\le6\log_2 n$, use the same $q_n=(\log\log n+O(1))/\log n$ as in the main proof, bounding the exponent for both power classes. Put $s_n=2-4q_n$. The conditional trace formula, Parseval, and Cauchy–Schwarz give
```math
\|P_{\ge3}f_\lambda\|_{L^1(U)}
\le \|P_{\ge3}f_\lambda\|_{L^2(U)}
\le \left(\sum_{\chi:\,r(\chi)\ge3}d_\chi^{-s_n}\right)^{1/2}.
```
[Liebeck–Shalev, Proposition 2.5](https://doi.org/10.1112/S0024611504014935), in the form [Teyssier–Thévenin v4, Eq. (6.3)](https://arxiv.org/html/2411.04347v4#S6.SS2), gives $\sum_{r(\chi)\ge3}d_\chi^{-1}=O(n^{-3})$. Their displayed set keeps one side of each pair of transposed partitions; adding the other side increases the bound by at most a factor of two. Monotonicity of the finite $\ell^p$ norms gives the preceding square root as
```math
O(n^{-3s_n/2})=O((\log n)^6/n^3).
```

The bad event has probability $O(n^{-5})$, by the same cycle-enumerator estimate as before. For any $\lambda$, bound $`\|P_{\ge3}f_\lambda\|_1`$ by $`\|f_\lambda\|_1=1`$ plus the norms of the finitely many removed modes. A conditional coefficient on $`\chi`$ has absolute value at most $`d_\chi`$ and $`\|\chi\|_1\le1`$. All these removed dimensions are $O(n^2)$, so the contribution from bad $\lambda$ to the averaged norm is $O(n^{-3})$. Averaging densities and applying the triangle inequality shows that the rank-$`\ge3`$ portion of the full density is $O((\log n)^6/n^3)$ in $L^1(U)$.

## 3. Read off the leading term

Let $f=d\mathcal L(W)/dU$. Combining the preceding estimates gives
```math
\left\|f-1-\frac{F-1}{n-1}\right\|_{L^1(U)}=O(n^{-2}).
```
A nonnegative integer random variable $`F`$ of mean 1 satisfies $`\mathbf E|F-1|=2\Pr(F=0)`$, since the only negative value of $`F-1`$ occurs at 0. Uniform permutations satisfy $`\Pr(F=0)=\sum_{j=0}^n(-1)^j/j!=e^{-1}+O(1/(n+1)!)`$ by inclusion–exclusion. Therefore
```math
\frac12\|f-1\|_1=\frac{\Pr_U(F=0)}{n-1}+O(n^{-2})
=\frac{e^{-1}}{n-1}+O(n^{-2}).
```
