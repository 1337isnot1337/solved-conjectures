# Binomial Eulerian interlacing conjecture

Status: complete short deduction from Haglund–Zhang's published theorem; **not counted as a new solution because the prior-resolution audit is unresolved**.

Issue: [#90](https://github.com/1337isnot1337/solved-conjectures/issues/90).

## Statement

Let

```math
\widetilde A_n(x)=\sum_{\pi\in S_n}(1+x)^{\operatorname{fix}(\pi)}
x^{\operatorname{exc}(\pi)}.
```

Then $\widetilde A_n$ and $\widetilde A_{n+1}$ strictly interlace for every $n\geq1$.

The weak statement is listed as open on the [current SymCat page](https://www.symmetricfunctions.com/realRootedOpenProblems.htm). The proof below is a direct deduction from the stronger refined-row theorem in [Haglund–Zhang (2019)](https://zhangbiaomath.github.io/papers/2019-aam-bino_eulerian.pdf). It is not a new method.

## Published ingredients and conventions

Use $f\preceq g$ for the oriented weak interlacing convention of Haglund–Zhang: equal degrees are allowed, with $f$ alternating to the left of $g$; otherwise $\deg g=\deg f+1$.

For a positive integer sequence $s=(s_1,s_2,\ldots)$, define

```math
p_{m,k}(x)=
\sum_{\substack{0\leq e_i<s_i\\e_m=k}}
(1+x)^{\operatorname{col}'(e)}x^{\operatorname{asc}(e)},
\qquad 0\leq k<s_m.
```

Here $e_0=0,s_0=1$, and both statistics count adjacent comparisons with indices $0,\ldots,m-1$: a collision means $e_i/s_i=e_{i+1}/s_{i+1}$, and an ascent means strict inequality. The terminal comparison with $e_{m+1}=0,s_{m+1}=1$ is excluded from $\operatorname{col}'$.

Haglund–Zhang Theorem 1.1 proves that the row $(p_{m,0},\ldots,p_{m,s_m-1})$ is an interlacing sequence. Their Lemma 2.1 gives its recurrence. Their Lemma 2.3 gives closure under sums when every summand has the same interlacer.

Put

```math
E_m(x)=(1+x)p_{m,0}(x)+\sum_{k=1}^{s_m-1}p_{m,k}(x).
```

This restores the terminal collision. Setting the next entry to zero gives the exact identity

```math
p_{m+1,0}(x)=E_m(x).
```

For $s=(2,3,4,\ldots)$, Haglund–Zhang Section 3.1 identifies $E_m=\widetilde A_{m+1}$. Thus $p_{n,0}=\widetilde A_n$ for $n\geq1$, including $p_{1,0}=1+x=\widetilde A_1$.

## Weak interlacing for every sequence of positive integers

Let $f=p_{m+1,0}=E_m$. The next refined row satisfies

```math
f\preceq p_{m+1,k}\quad\text{for every }k.
```

Every $p_{m+1,k}$ has nonnegative coefficients. Hence all roots of $f$ are nonpositive, and $f\preceq xf$. Applying the sum closure gives

```math
E_m=f\preceq
xf+\sum_{k=0}^{s_{m+1}-1}p_{m+1,k}
=E_{m+1}.
```

This proves consecutive weak interlacing for the binomial $s$-Eulerian polynomials for every fixed infinite positive integer sequence $s$. The binomial Eulerian case follows by specialization.

## Strictness for the binomial Eulerian sequence

Now take $s_m=m+1$. Since consecutive positive integers are coprime, the refined recurrence simplifies to

```math
p_{m+1,0}=(1+x)p_{m,0}+\sum_{j=1}^{m}p_{m,j},
```

and, for $1\leq k\leq m+1$,

```math
p_{m+1,k}
=x\sum_{j=0}^{k-1}p_{m,j}
+\sum_{j=k}^{m}p_{m,j}.
```

The initial row is $(1+x,x)$.

**No common row zero.** No real number is a zero of every member of a refined row. The initial row has no common zero. If all members of row $m+1$ vanished at $a$, then

```math
p_{m+1,0}(a)-p_{m+1,1}(a)=p_{m,0}(a)=0,
```

and

```math
p_{m+1,k+1}(a)-p_{m+1,k}(a)
=(a-1)p_{m,k}(a)=0
\qquad(1\leq k\leq m).
```

The value $a=1$ is impossible because every row member has positive coefficients at $1$. Thus the preceding row would have a common zero, contradicting induction.

**Sign lemma.** Suppose $f$ has simple negative zeros and $f\preceq g$, with both polynomials having positive leading coefficients and the same degree. At a zero $a$ of $f$, either $g(a)=0$ or $g(a)/f'(a)<0$. This follows immediately by ordering the zeros in the interlacing pattern. Consequently, at each zero of the first row member, all nonzero values of the other row members have the same sign.

Start with $\widetilde A_1=1+x$. Assume $\widetilde A_m=p_{m,0}$ has simple negative zeros. Every $p_{m,k}$ has degree $m$ and positive leading coefficient: the initial row has this property, and the displayed recurrence preserves it. The ordered-row theorem and the sign lemma show that at a zero $a$ of $p_{m,0}$ all nonzero $p_{m,k}(a)$ have one sign. The no-common-zero result ensures at least one such value is nonzero. Therefore

```math
\widetilde A_{m+1}(a)
=\sum_{k=1}^{m}p_{m,k}(a)\ne0.
```

The already proved weak interlacing and absence of common zeros imply strict interlacing. In particular, the $m+1$ roots of $\widetilde A_{m+1}$ are simple. They are negative because its coefficients and constant term are positive. This closes the induction.

## Prior-work obstruction

The proof is complete as a deduction, but it is not yet eligible as a new resolution.

1. Haglund–Zhang's refined theorem already contains all ingredients of the weak conclusion. Any description must credit that source directly.
2. [Athanasiadis (2025), arXiv:2302.00754v5](https://arxiv.org/html/2302.00754v5), Section 3, proves closely related row and column interlacing for Eulerian transforms.
3. [Liu–Yan (2025), DOI 10.1016/j.aam.2024.102776](https://doi.org/10.1016/j.aam.2024.102776), explicitly states that diagonal binomial-transform sequences are generalized Sturm sequences. Its introduction identifies the binomial Eulerian polynomial as one such transform. The accessible publisher material does not reveal all hypotheses of Theorem 5.1, so overlap has not yet been fully determined.
4. The later [Yan–Liu (2025), DOI 10.1016/j.disc.2025.114598](https://doi.org/10.1016/j.disc.2025.114598) also studies recurrence criteria for Eulerian and derangement interlacing.

A catalog label is not sufficient evidence of novelty when these primary sources raise a specific prior-resolution concern. The result stays in research, with no solved-count change.
