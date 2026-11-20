# Real van der Waerden radius

**Scope:** Minc Problem 13 (Sinkhorn's real van der Waerden radius). The theorem below improves a general lower bound for the Frobenius-radius version of the question; **it does not determine the sharp radius** and therefore **does not resolve Problem 13**. No finite-order extension is counted as a resolution.

**Status:** Complete written deduction from the published 2026 subpermanent estimate, submitted for independent mathematical and priority review on 20 November 2026. No Lean verification. Coordination: [issue #141](https://github.com/1337isnot1337/solved-conjectures/issues/141), under [#139](https://github.com/1337isnot1337/solved-conjectures/issues/139).

## Exact target and partial theorem

Let J_n be the all-1/n matrix, d_n=n!/n^n, and let b(n) be the largest radius such that every **real** n-by-n matrix A with all row and column sums one satisfies

~~~math
\|A-J_n\|_F\le b(n)\quad\Longrightarrow\quad
\operatorname{per}A\ge d_n.
~~~

Entries of A need not be nonnegative. The source fixes the Frobenius norm for the catalogued problem.

**Theorem (nonsharp all-order lower bounds).** For n>=4,

~~~math
b(n)\ge\frac{1}{2\sqrt n}.
\tag{1}
~~~

For n>=64 one has the stronger

~~~math
b(n)\ge\frac{1}{\sqrt n}.
\tag{2}
~~~

More generally, let c_* be the unique positive solution of exp(c_*/2)=1+c_* (c_*=2.5128624172...). Then

~~~math
\liminf_{n\to\infty}\sqrt n\,b(n)\ge\sqrt{c_*}
=1.5852010652\ldots.
\tag{3}
~~~

In all three cases, the permanent inequality is strict for A different from J_n when its distance is at most the stated lower bound.

This improves the previously recorded generic nonnegativity-ball radius 1/(n-1) in order (1) for n>=6, and changes the asymptotic rate of the displayed lower bound from O(1/n) to Omega(1/sqrt(n)). These bounds are **not asserted to be optimal**. A search of the current catalog and selected literature did not locate this deduction, but that does **not** establish novelty.

## Imported estimate: Lavi's zero-margin lemma

For a matrix X and 0<=k<=n, let sigma_k(X) denote the sum of permanents of all k-by-k submatrices, with sigma_0=1. Write Q=I_n-J_n. Lemma 3.1 of Y. Lavi, *The Marcus–Minc Transform Inequality*, arXiv:2609.29262v1 (24 September 2026), proves that if X is real, has zero row and column sums, and has operator norm <=1, then for 2<=k<=n,

~~~math
|\sigma_k(X)|\le
\frac{\sigma_k(Q)}{n-1}\|X\|_F^2,
\qquad \sigma_k(Q)\ge0.
\tag{4}
~~~

This is **credited prior work**, not a theorem proved here. The lemma's proof uses the permutation-invariant one-factor marginals of a projected tensor, the singular-value decomposition, and a positive-operator Cauchy-Schwarz inequality. Its hypotheses apply to real matrices with *negative* entries. Source: https://arxiv.org/html/2609.29262v1#S3 .

By applying (4) to X/s with s=||X||op>0, for arbitrary nonzero zero-margin X with s<=1, homogeneity gives

~~~math
|\sigma_k(X)|\le
\frac{\sigma_k(Q)}{n-1}\|X\|_F^2s^{k-2}
\qquad(2\le k\le n).
\tag{5}
~~~

The scaled bound is the only nontrivial external inequality used below.

## Exact permanent expansion and the positive quadratic term

Let A=J_n+X, where X has zero margins, and r=||X||F. Expanding the permanent by the positions chosen from X gives

~~~math
\frac{\operatorname{per}(J_n+X)}{d_n}
=\sum_{k=0}^n\frac{n^k}{(n)_k}\sigma_k(X),
\qquad (n)_k=\frac{n!}{(n-k)!}.
\tag{6}
~~~

We have sigma_1(X)=0. Also,

~~~math
\sigma_2(X)
=\frac12\sum_{i,j}x_{ij}
\sum_{\substack{i'\ne i\\j'\ne j}}x_{i'j'}
=\frac12\|X\|_F^2.
\tag{7}
~~~

Indeed the inner sum equals x_ij because X has zero row and column sums. The quadratic contribution in (6) is therefore

~~~math
\frac{n}{2(n-1)}r^2.
\tag{8}
~~~

Define

~~~math
T_n(t)=\frac{\operatorname{per}(J_n+tQ)}{d_n}
=\sum_{k=0}^n\frac{n^k}{(n)_k}\sigma_k(Q)t^k
=\sum_{j=0}^n\frac{(nt)^j(1-t)^{n-j}}{j!}.
\tag{9}
~~~

The coefficients of T_n are all nonnegative by (4), and its first terms are 1+(n/2)t^2. In particular, for t>0 the function (T_n(t)-1)/t^2 is nondecreasing.

Using (5), (6), (7), and (9), and assuming X is nonzero and s<=1, yields

~~~math
\begin{aligned}
\frac{\operatorname{per}(J_n+X)}{d_n}
&\ge1+\frac{nr^2}{2(n-1)}
-\frac{r^2}{n-1}
\sum_{k=3}^n\frac{n^k}{(n)_k}
\sigma_k(Q)s^{k-2}\\
&=1+\frac{r^2}{n-1}
\left(n-\frac{T_n(s)-1}{s^2}\right).
\end{aligned}
\tag{10}
~~~

Since 0<s<=r, the expression in parentheses is nonnegative whenever

~~~math
T_n(r)\le1+nr^2.
\tag{11}
~~~

If the inequality in (11) is strict, (10) makes per(J_n+X)>d_n for X nonzero.

This reduction is valid for **every** zero-margin real X of a given Frobenius norm. There is no entrywise nonnegativity assumption or finite-dimensional search.

## Universal analytic bound

For 0<=t<1, the truncated-exponential form of (9) and positivity of the omitted exponential terms give

~~~math
T_n(t)\le(1-t)^n
\exp\!\left(\frac{nt}{1-t}\right).
~~~

Moreover,

~~~math
\log(1-t)+\frac{t}{1-t}
=\int_0^t\frac{u}{(1-u)^2}\,du
\le\frac{t^2}{2(1-t)^2}.
~~~

Therefore

~~~math
T_n(t)\le
\exp\!\left(\frac{nt^2}{2(1-t)^2}\right).
\tag{12}
~~~

If r<1 and

~~~math
\frac{nr^2}{2(1-r)^2}<\log(1+nr^2),
\tag{13}
~~~

then (12) implies (11) strictly.

For n>=4, set r=1/(2sqrt(n)). Then r<=1/4, nr^2=1/4, and

~~~math
\frac{nr^2}{2(1-r)^2}\le\frac{2}{9}
<\log(5/4)=\log(1+nr^2).
~~~

The strict elementary comparison follows from log x > 2(x-1)/(x+1) for x>1, with x=5/4. This proves (1).

For n>=64, set r=1/sqrt(n). Then r<=1/8, nr^2=1, and

~~~math
\frac{nr^2}{2(1-r)^2}\le\frac{32}{49}
<\frac23<\log2=\log(1+nr^2).
~~~

Again the logarithmic comparison follows from log x > 2(x-1)/(x+1), now with x=2. This proves (2).

Finally fix any a>0 satisfying exp(a/2)<1+a, and choose r=sqrt(a/n). Since r tends to zero,

~~~math
\frac{nr^2}{2(1-r)^2}\longrightarrow\frac a2
<\log(1+a)=\log(1+nr^2).
~~~

Thus (13) holds for all sufficiently large n, proving b(n)>=sqrt(a/n) eventually. The continuous function log(1+a)-a/2 is positive on (0,c_*), zero at c_*, and negative beyond c_*; its strictly decreasing derivative after a=1 gives uniqueness of the positive root. Letting a tend to c_* from below gives (3). Nothing here locates the actual sharp radius b(n).

## Checks, comparison, and limitations

- This is a written **all-order analytic deduction**, not a finite test or a numerical extrapolation.
- The two constants used for the explicit thresholds are rational and checked algebraically: 2/9<log(5/4) and 32/49<log2. The decimal value of c_* is explanatory only.
- The proof imports Lavi's published-in-preprint Lemma 3.1, so independent audit of that lemma and this deduction is appropriate before a novelty claim.
- The source page currently gives b(n)>=51/[50(n-1)] for all n>=5, and b(3), b(4) exactly, with other finite-order estimates. Our bound does not replace stronger individual-order estimates.
- There is no upper bound on b(n) here and no equality classification of the *optimal* radius. **Completed full Minc entries from this note: zero.**

## Priority sources

1. Yair Lavi, [Minc Problem 13: Real van der Waerden radius](https://yair-lavi.com/mincs-list/problem-13/index.html), accessed 20 November 2026. Full target, historical work, and currently displayed lower bounds.
2. Yair Lavi, [*The Marcus–Minc Transform Inequality*](https://arxiv.org/html/2609.29262v1), arXiv:2609.29262v1, 24 September 2026; especially Lemma 3.1 and Section 4. Zero-margin estimate (4), exact expansion (6), and the properties of Q are credited inputs.
3. R. Sinkhorn, *A neighborhood in which the van der Waerden permanent conjecture is valid*, Linear and Multilinear Algebra 10 (1981), 217–221, DOI: 10.1080/03081088108817413. Original question, cited via the current catalog rather than an independently retrieved full text.
4. G.-S. Cheon and I. M. Wanless, *An update on Minc's survey of open problems involving permanents*, Linear Algebra Appl. 403 (2005), 314–342, DOI: 10.1016/j.laa.2005.02.030.

Search terms used for exclusion: "real van der Waerden radius", "Sinkhorn permanent neighbourhood" / "neighborhood", "Frobenius radius", "line sum one negative entries", and "sqrt(n) permanent radius"; searches included the original/current catalog and arXiv sources. No search alone proves priority.
