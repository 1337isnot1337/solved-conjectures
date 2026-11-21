# The endpoint condition does not characterize boundary monotonicity

Research date: 20 November 2026 (America/Chicago). This is an obstruction to a proposed shortcut for Minc Problem 8. It is not a solution of that classification problem, not a new disproof of the already false universal monotonicity assertion, and not a counted conjecture resolution.

## Scope and sources

The current [Problem 8 page](https://yair-lavi.com/mincs-list/problem-8/index.html) asks for the boundary doubly stochastic matrices $`B`$ for which

```math
q_B(t)=\mathop{\mathrm{per}}((1-t)J_N+tB)
```

is increasing for $`0\le t\le1`$. It states the necessary endpoint condition $`\sigma_{N-1}(B)\le N^2\mathop{\mathrm{per}}B`$. It does not claim sufficiency. All circulants, and more generally matrices with a transitive row or column symmetry group, are already covered by the page's prior results.

Here $`\sigma_k`$ denotes the sum of all $`k`$-by-$`k`$ permanental minors, with $`\sigma_0=1`$. The required external input is the Jerrum family in Section 2, Example 1 of I. M. Wanless, [*The Holens–Đoković conjecture on permanents fails!*](https://users.monash.edu.au/~iwanless/papers/HolDjokLAA.pdf), Linear Algebra and its Applications 286 (1999), 273–285, DOI [10.1016/S0024-3795(98)10177-5](https://doi.org/10.1016/S0024-3795(98)10177-5). At fixed regular degree at least three, that family has a near-perfect/perfect matching ratio growing exponentially with the graph's order. Only the existence of ratios larger than a specified quadratic polynomial is used below. No exact exponent from the poorly extracted scan is needed.

## Endpoint derivatives

For any doubly stochastic $`B`$ of order $`N`$,

```math
q_B'(1)=N\mathop{\mathrm{per}}B-\frac{\sigma_{N-1}(B)}N,
```

and

```math
q_B''(1)=N(N-1)\mathop{\mathrm{per}}B
-\frac{2(N-1)}N\sigma_{N-1}(B)
+\frac4{N^2}\sigma_{N-2}(B).
```

To check the second formula, expand

```math
q_B(t)=\sum_{k=0}^N
\frac{(N-k)!}{N^{N-k}}\sigma_k(B)t^k(1-t)^{N-k}.
```

Only $`k=N,N-1,N-2`$ contribute to the second derivative at one. The last contribution has coefficient $`2!\times2!=4`$.

## Direct-sum obstruction

**Proposition.** There are boundary doubly stochastic matrices $`B`$ for which $`q_B'(1)>0`$ but $`q_B'(t)<0`$ at an interior point. Thus the endpoint condition, even with strict inequality, does not characterize Problem 8's monotone directions.

**Proof.** First suppose a doubly stochastic matrix $`A`$ of order $`n`$ satisfies

```math
R_1(A):=\frac{\sigma_{n-1}(A)}{\mathop{\mathrm{per}}A}=2n^2.
```

Put $`R_2(A)=\sigma_{n-2}(A)/\mathop{\mathrm{per}}A`$ and $`B=A\oplus A`$, of order $`N=2n`$. Direct-sum convolution of the matching numbers gives

```math
\frac{\sigma_{N-1}(B)}{\mathop{\mathrm{per}}B}=2R_1(A)=N^2,
```

```math
\frac{\sigma_{N-2}(B)}{\mathop{\mathrm{per}}B}
=2R_2(A)+R_1(A)^2.
```

Hence $`q_B'(1)=0`$, but

```math
\frac{q_B''(1)}{\mathop{\mathrm{per}}B}
=-2n(2n-1)+\frac{2R_2(A)+4n^4}{n^2}
=2n+\frac{2R_2(A)}{n^2}>0.
```

Therefore $`q_B'(t)<0`$ for all $`t<1`$ sufficiently close to one. The endpoint condition holds at equality, while radial monotonicity fails.

It remains to produce the required core and strengthen the endpoint inequality. The cited Jerrum–Wanless family supplies a $`k`$-regular zero-one matrix $`M`$ of some order $`n`$ such that

```math
k\frac{\sigma_{n-1}(M)}{\mathop{\mathrm{per}}M}>2n^2.
```

Indeed, the left-hand ratio grows exponentially in the family parameter while $`n`$ grows linearly. With $`C=M/k`$, homogeneity gives $`R_1(C)>2n^2`$. Consider the continuous doubly stochastic path

```math
A_s=(1-s)I_n+sC,\qquad0\le s\le1.
```

Every doubly stochastic matrix has positive permanent, so $`R_1(A_s)`$ is continuous. It starts at $`R_1(I_n)=n`$ and ends above $`2n^2`$. Let $`s_0`$ be its first value with $`R_1(A_{s_0})=2n^2`$. Then $`0<s_0<1`$ and $`R_1(A_s)<2n^2`$ for $`s<s_0`$.

For $`B_0=A_{s_0}\oplus A_{s_0}`$, choose an interior $`t_*`$ with $`q_{B_0}'(t_*)<0`$, as proved above. Continuity in $`s`$ preserves this strict inequality for $`B_s=A_s\oplus A_s`$ when $`s<s_0`$ is sufficiently close to $`s_0`$. At the same time,

```math
\frac{q_{B_s}'(1)}{\mathop{\mathrm{per}}B_s}
=2n-\frac{R_1(A_s)}n>0.
```

Each $`B_s`$ lies on the boundary because its off-diagonal blocks are zero. If rational entries are desired, choose such an $`s`$ rational; $`C`$ is rational. This proves the proposition. No numerical search is used. $`\square`$

The radial derivative is also positive close to zero for every nonuniform doubly stochastic direction, since

```math
q_B''(0)=\frac{(N-2)!}{N^{N-2}}(\|B\|_F^2-1)>0.
```

Consequently the strictly positive-endpoint examples above have at least two interior stationary points. A general claim that radial permanents have only one interior turning point would therefore also fail.

## Review and remaining problem

The inequalities worker independently checked both endpoint derivative formulas, the direct-sum convolutions, and the positive-curvature calculation. The only external existence input is the published exponential Jerrum–Wanless ratio. Matching counts before normalization and subpermanent sums after normalization differ by the displayed factor $`k`$.

This excludes endpoint positivity and a single-turning-point argument as full characterizations. A structural description of all monotone boundary matrices is still missing. The proof does not yield another named open conjecture explicitly stated on the current Problem 8 page. The campaign therefore moves to Problem 1 rather than enlarging a finite example table.
