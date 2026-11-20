# MacMahon–Andrews conjecture

The MacMahon sequence starts at $a_1=1$. At each subsequent step it appends the least positive integer absent from the consecutive sums of the existing sequence. In particular every positive integer eventually has a consecutive-sum representation. Andrews conjectured $a_k\sim k\log k/\log\log k$. Erdős repeated the conjecture and asked whether the growth is superlinear and subpolynomial relative to linear growth. The problem archive credits Porubský with a pointwise lower bound for the counting function along a subsequence, namely $\limsup A(x)/\pi(x)\ge1/\log 2$. I found no resolution of Andrews's asymptotic. [Andrews (1975)](https://doi.org/10.1080/00029890.1975.11993980) · [Erdős (1977), p. 70](https://www.renyi.hu/~p_erdos/1977-27.pdf) · [Erdős Problems wiki, #359](https://erdosproblems.ai/wiki/problems/integer_sequences/E0359) · [OEIS A002048](https://oeis.org/A002048) · [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/68)

## A lower bound for the reciprocal sum on every scale

Let $A$ be any increasing sequence of positive integers such that all sufficiently large integers are sums of consecutive terms of $A$. Then

```math
\sum_{a\in A,\ a\le X}\frac1a
\ \ge\ \frac{\log\log X}{\log 2}-O(1).
\tag{1}
```

More locally, uniformly for $X\ge Y\ge2$,

```math
\sum_{a\in A,\ \sqrt Y<a\le X}\frac1a
\ \ge\ \frac{\log\log X-\log\log Y}{\log 2}
        -O\left(\frac1{\log Y}\right).
\tag{2}
```

The constants may depend on the finite number of exceptions to coverage. The proof uses only coverage and strictly increasing positive integer terms. Moser uses the related count of windows by length for the sequence of ordinary primes. The problem archive's summary of Porubský's paper records the pointwise limsup but gives no statement about (1) or (2). I could not obtain that paper's full text to check priority for these estimates. [Moser (1963), p. 159](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/99CB1E53FB57B2D2084D58D2383B1905/S0008439500051675a.pdf/on_the_sum_of_consecutive_primes.pdf) · [Bibliographic record of Porubský's results](https://erdosproblems.ai/wiki/problems/integer_sequences/E0359)

### Proof

Write $R(x)$ for the number of consecutive blocks of $A$ whose sum is at most $x$, including blocks with one term. Coverage implies $R(x)\ge x-O(1)$. A block of length $h$ starting at $a$ has sum at least both $ah$ and $h^2/2$. Define $T(a,h)=\max(ah,h^2/2)$ and

```math
g(x)=\frac{1}{x(\log(2x)+4)},\qquad w(x)=-g'(x)\quad(x\ge1).
```

The weight $w$ is positive. For a fixed starting term $a$, integrating the upper bound given by $T(a,h)$ against $w$ on $[1,X]$ gives at most $\sum_{h\ge1}g(T(a,h))$. To bound this, put $L=\log(2a)$ and split at $h=2a$. Then

```math
a\sum_{h\ge1}g(T(a,h))
\le \frac1{L+4}
 +\log\frac{2L+4}{L+4}
 +\frac1{2L+4}
\le \log 2.
```

For the first two terms, sum the decreasing function $1/(h(\log(2ah)+4))$ for $h\le2a$ using the first term and its integral. For the last term, use $\log(h^2)\ge2L$ and $\sum_{h>2a}h^{-2}\le 1/(2a)$. The final inequality follows from

```math
\log 2-\log\frac{2L+4}{L+4}
 =-\log\left(1-\frac2{L+4}\right)
 \ge\frac2{L+4}.
```

Only $a\le X$ matter on $[1,X]$. The lower bound from coverage and integration by parts gives

```math
\int_1^X R(x)w(x)\,dx
 \ge \int_1^X g(x)\,dx-Xg(X)-O(1)
 =\log\log X-O(1).
```

Combining the per-start upper bounds proves (1). For (2), integrate over $[Y,X]$. The starting terms at most $\sqrt Y$ are at most $\sqrt Y$ in number and each permits at most $\sqrt{2x}$ lengths. Thus their aggregate contribution to the integral is at most

```math
\sqrt Y\int_Y^\infty\sqrt{2x}\,w(x)\,dx
 \ll \frac1{\log Y}.
```

The lower bound from coverage is $\log\log X-\log\log Y-O(1/\log Y)$, with the boundary terms estimated by $xg(x)\ll1/\log Y$ at $x\ge Y$. Apply the same per-start bound for the remaining terms to obtain (2).

## The mean representation count under the conjectured asymptotic

Suppose more generally that $a_k\sim c k\log k/\log\log k$ for some $c>0$. Its counting function then satisfies $A(t)\sim c^{-1}t\log\log t/\log t$. Put $H=H(x)$ for the maximum length of a block of sum at most $x$. The initial block has the smallest sum among blocks of each length, so $H$ is the largest index for which $\sum_{k\le H} a_k\le x$. Partial summation and asymptotic inversion give

```math
H\sim 2\sqrt{\frac{x\log\log x}{c\log x}}.
```

For a fixed length $h$, at most $A(x/h)$ blocks have sum at most $x$, since each such block starts at a term at most $x/h$. At least $A(x/h)-h+1$ do, since all blocks of length $h$ ending at a term at most $x/h$ qualify. Summing yields

```math
R(x)=x\int_{x/H}^{x}\frac{A(t)}{t^2}\,dt + O\bigl(A(x)+H^2\bigr)
    \sim \frac{\log 2}{c}\,x\log\log x.
```

The integral comparison for the sum over lengths uses the monotonicity of $A(x/h)$, with error at most $A(x)$. In the integral, $\log(x/H)=(1/2+o(1))\log x$, so $\log\log t\sim\log\log x$ uniformly in the range and $\int_{x/H}^x dt/(t\log t)\to\log2$. At Andrews's predicted $c=1$, the mean number of representations is therefore asymptotic to $(\log 2)\log\log x$. Recovering the density of the integers with zero representations using blocks of length at least two requires more information about the multiplicities. The mean alone leaves that density undetermined.
