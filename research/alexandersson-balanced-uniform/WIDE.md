# Balanced arrays of uniform matroids: simple negative roots for wide arrays

## Result

Let $1\le r\le d$. For $0\le k\le n$, let $a_k$ count the binary $n\times d$ arrays with every column of sum $k$ and every row of sum at most $r$. Put $P_{n,r,d}(q)=\sum_k a_k q^k$.

For every $n\ge 2$, every integer $d\ge \frac12 n^2\log(2n)$, and every $1\le r\le d$, all zeros of $P_{n,r,d}$ are simple and negative. Here $\log$ denotes the natural logarithm. For $n=0$ or $n=1$ the nonconstant possibilities have degree at most one. This establishes an unbounded region of Alexandersson's conjecture but does not cover all aspect ratios.

## Proof

Write $m=\lfloor nr/d\rfloor$. There are no arrays of a given column sum $k>m$, by total count. For every $0\le k\le m$, build an array by assigning consecutive groups of $k$ positions in the cyclic list $1,2,\ldots,n,1,2,\ldots$ to the successive columns. A group has no repeated row because $k\le n$. The largest row sum is $\lceil dk/n\rceil\le r$. Thus $a_k>0$ for all these $k$, and $P$ has degree $m$.

The unconstrained count is
```math
 B_k=\binom nk^d.
```
Choose independently in each column a uniform $k$-subset of the rows. For any fixed row its sum is a $`\mathop{\mathrm{Bin}}(d,k/n)`$ random variable, whether or not different row sums are independent. For an interior index $1\le k<m$, the slack satisfies
```math
 r-\mathbb E(\text{row sum})=r-dk/n\ge d/n
```
because $r\ge dm/n$ and $k\le m-1$. The one-sided Hoeffding bound for sums of $d$ independent $[0,1]$-valued variables gives
```math
 \Pr(\text{one fixed row exceeds }r)\le \exp(-2d/n^2).
```
The union bound over the rows now gives
```math
 a_k\ge (1-n\exp(-2d/n^2))B_k\ge B_k/2 \qquad (1\le k\lt m).
```
For all indices, including the top one, we have $a_k\le B_k$. We need no lower bound on the top coefficient.

For every $1\le k<m$,
```math
 \frac{a_k^2}{a_{k-1}a_{k+1}}
 \ge \frac14\left(\frac{(k+1)(n-k+1)}{k(n-k)}\right)^d
 =\frac14\left(1+\frac{n+1}{k(n-k)}\right)^d
 \ge \frac14(1+2/n)^{2d}>4.
```
The last strict inequality follows from
```math
 d\log(1+2/n)>\frac{2d}{n+2}
 \ge \frac{n^2}{n+2}\log(2n)\ge\log 4
```
for $n\ge2$, using $\log(1+x)>x/(1+x)$ for $x>0$. If $m<2$, no ratio is needed.

For completeness, an elementary sign test finishes the proof. Set $R_i=a_{i-1}/a_i$ and $x_i=2R_i$ for $1\le i\le m$. The displayed ratio inequalities say $R_{i+1}>4R_i$. At $q=-x_i$, the term of index $i-1$ has magnitude exactly half that of index $i$, and the term of index $i+1$, when present, has magnitude less than half that of index $i$. On each side of index $i$, magnitudes decrease strictly as one moves away, because the ratios $R_j$ increase. Each tail, as an alternating sum starting with the opposite sign to the middle term, can subtract no more than the magnitude of its nearest term. The middle term therefore determines the sign of $P(-x_i)$, namely $(-1)^i$. With $P(0)>0$ and $0<x_1<\cdots<x_m$, there is a root in each of the $m$ successive intervals from $0$ through $-x_1,\ldots,-x_m$. The polynomial has degree $m$, so these roots are all its roots and are simple.

## Additional bound at the top coefficient

An independent elementary estimate, applicable to every admissible index including $k=m$, is
```math
 \binom nk^d/(d+1)^{n-1}\le a_k\le\binom nk^d.
```
Consider the number of column-sum-$`k`$ arrays with a prescribed vector of row sums. If two prescribed row sums $a,b$ have $a\ge b+2$, fix all other rows. In each column, the number of 1s still required from the two remaining rows is 0, 1, or 2, or is infeasible. Let $h$ be the number of columns requiring 2 and $s=a+b-2h$ be the number requiring 1 for any feasible choice. The count of assignments is $\binom{s}{a-h}$, with impossible choices counted as 0. Moving one unit from $a$ to $b$ changes it to $\binom{s}{a-h-1}$, which is at least as large because $a-h>s/2$. This holds for each choice of all other rows. Successive moves therefore show that a most frequent row-sum vector can be assumed to consist of entries differing by at most one. It satisfies the cap $r$. There are at most $(d+1)^{n-1}$ possible row-sum vectors because their sum is fixed, so the count of this vector is at least the indicated fraction of the unconstrained total.

## Source, priority, and exact scope

- [Per Alexandersson, SymCat, *Real-rooted polynomials: open problems*, “Balanced arrays of uniform matroids”](https://www.symmetricfunctions.com/realRootedOpenProblems.htm#conjBalancedArrays), displayed version dated November 22, 2026; see also the [author-maintained TeX source](https://github.com/PerAlexandersson/symmetricfunctions.com/blob/master/tex-source/realRootedOpenProblems.tex#L2839-L2861). The conjecture asks for real-rootedness for every $n,r,d$, with the exact binary row-cap and column-balance formulation above. The author lists finite evidence for rank 2 and notes that its matching count does not transfer real-rootedness to this polynomial. The wide-array theorem above applies to every allowable rank uniformly.
- [Wassily Hoeffding, *Probability Inequalities for Sums of Bounded Random Variables* (1963), Theorem 2](https://doi.org/10.1080/01621459.1963.10500830) supplies the probability bound. The final real-root criterion is proved directly.
- Searches for the exact named conjecture, balanced binary matrices with constant column sums and row caps, and related diagonal-count real-rootedness did not find an earlier theorem for this range. This is a bounded priority search, not a claim that no overlapping proof exists.
