# Jiahao Zhang's conjecture

Status: unresolved. Exact finite screens and failed proof routes only. Tracking: [issue 190](https://github.com/1337isnot1337/solved-conjectures/issues/190).

## Full target and source

Jiahao Zhang, *Characteristic Chow Polynomials of Layered-Permutation Intervals*, [arXiv:2610.33037v1](https://arxiv.org/html/2610.33037v1), Conjecture 2.14, dated 15 October 2026.

For all integers `a,b>=1`, except `(1,1)`, the conjecture concerns

```math
\delta_{a,b}(s)=\Gamma_{a,b}(s)-\Gamma_{a,b-1}(s).
```

It asserts nonnegative coefficients, nonpositive real zeros, and interlacing `Gamma_(a,b-1) preceq delta_(a,b)`. The source uses unoriented alternation when the two degrees are equal. Since the difference has a zero at zero and the preceding polynomial has positive coefficients, the orientation of a strict interlacing certificate is forced in the cases tested below.

The source already proves the cases `min(a,b)<=4`, proves an eventual result for each fixed width, and reports exact checks through `a,b<=16` and along the diagonal through 24. Extending these finite ranges is not a resolution and is not counted as one.

## Source recurrence and independent diagonal identity

The boundary values are `Gamma_(a,0)=1`, `Gamma_(a,1)=1+(a-1)s`, and `Gamma_(1,b)=1+(b-1)s`. Put `f_0=f_1=1` and `f_m=f_(m-1)-s f_(m-2)`. For `a,b>=2`,

```math
\Gamma_{a,b}=\Gamma_{a-1,b}+\Gamma_{a,b-1}
 +(s-1)\Gamma_{a-1,b-1}-\mathbf1_{a=b}s f_{a-1}.
```

The source's independent diagonal generating function is

```math
\sum_{n\ge0}\Gamma_{n,n}(s)Z^n
=\frac{(1-Z)(1-sZ)}{1-Z+sZ^2}
 \frac1{\sqrt{1-2(1+s)Z+(1-s)^2Z^2}}.
```

With `D_n(s)=sum_k binom(n,k)^2 s^k`, this gives

```math
\Gamma_{n,n}=D_n-s\sum_{j=0}^{n-1}f_jD_{n-1-j}.
```

The checker verifies that every computed diagonal entry from the two-dimensional recurrence agrees with this independent convolution. For `b>a`, another exact source consequence is `delta_(a,b)=s(1+sum_(r=1)^(a-1) Gamma_(r,b-1))`.

## Exact diagnostics completed on 21 November 2026

| Run | Region | Number of pairs | Result |
| --- | --- | ---: | --- |
| Exact real-root count | Diagonal and its two neighbors through 30 | 85 | All difference polynomials have the expected number of real roots |
| Signed remainder chain | Diagonal and its two neighbors through 70 | 205 | Every strict interlacing certificate passed |
| Signed remainder chain | All ordered pairs `1<=a,b<=45`, except `(1,1)` | 2,024 | Every strict interlacing certificate passed |

These are finite observations. No extrapolation to all parameters is justified by them.

The signed remainder test uses primitive integer polynomials and positive normalization only. Starting from `g=delta` and `p=Gamma_previous`, equal degrees are reduced by `lc(g)*p-lc(p)*g`. It then forms successive negative Euclidean remainders. A strict one-degree decrease with a positive leading coefficient at every step gives the real-root and interlacing certificate. In a future search, failure of this strict test would need separate review because the conjecture permits common roots.

Reproduce from this directory:

```sh
python check.py --N 30 --method roots
python check.py --N 70 --method proper
python check.py --N 45 --method proper --full
```

The code requires SymPy. The recorded JSONL files preserve each completed row and the total pair count.

## Proof routes examined

Transforming the diagonal by `s=(x-1)/(x+1)` gives polynomials

```math
h_n(x)=\sum_j\gamma_{n,n,j}(x-1)^j(x+1)^{n-1-j}.
```

The first five are

```math
\begin{aligned}
h_1&=1,\\
h_2&=3x-1,\\
h_3&=12x^2-8x,\\
h_4&=45x^3-31x^2-13x+7,\\
h_5&=165x^4-110x^3-92x^2+46x+7.
\end{aligned}
```

Their monic normalizations do not obey an ordinary scalar three-term orthogonal-polynomial recurrence: a fit at the first nontrivial step fails at the next. The tempting claim that each `Gamma_(n,n)` interlaces `D_n` also fails already at `n=4`, so a direct comparison with the Delannoy/Legendre sequence does not prove the conjecture.

At a zero of `Gamma_(a-1,a)`, the diagonal recurrence reduces to `(s-1)Gamma_(a-1,a-1)-s f_(a-1)`. A proof by alternating signs would require a bound on the correction term at these zeros. No such bound has been established here. The rational factor in the diagonal generating function suggests an asymptotic approach but does not give an all-degree proof.

## Priority audit

The current arXiv abstract page showed only version 1. Both search engines were queried by exact title, arXiv identifier, author, “gamma-difference,” and Conjecture 2.14. Retrieved results were the original and bibliographic mirrors. Global GitHub issue searches for `2610.33037` and the combination “layered-permutation” and “Chow” returned no preexisting target before issue 190 was created. Searches of the local repository's existing Markdown found no match. GitHub code search returned a rate-limit error and supplies no negative evidence.

This is a bounded audit attached to unresolved research. No new resolution or complete proof is claimed.
