# Gessel–Lin–Zeng conjecture

Status: open in this investigation. The work below derives a usable recurrence and rejects two possible stronger invariants. It does not prove or disprove the conjecture.

## Statement and literature

For $`k\ge1`$, let

```math
M_k=\{\bar1,1,1,\bar2,2,2,\ldots,\bar k,k,k\},
\qquad \bar1<1<\bar2<2<\cdots<\bar k\lt k.
```

For $`S\subseteq[k]`$, delete $`\bar j`$ when $`j\in S`$. Consider words in the remaining multiset such that every entry between the two copies of $`j`$ is larger than $`j`$. Let $`A_{k,S}(x)`$ count these words by internal descents and put

```math
A_{k,i}(x)=\sum_{|S|=i}A_{k,S}(x).
```

The conjecture states that every $`A_{k,i}`$ is real-rooted, for every $`k\ge1`$ and $`0\le i\le k`$.

Primary source: Ira Gessel, Zhicong Lin and Jiang Zeng, *Jacobi-Stirling polynomials and P-partitions*, European Journal of Combinatorics 33(8) (2012), 1987–2000, [DOI](https://doi.org/10.1016/j.ejc.2012.06.008), [full preprint](https://arxiv.org/pdf/1201.0622), Conjecture 15. The original normalization has an additional factor of $`x`$, which does not affect real-rootedness. Its Proposition 6 gives the equivalent coefficient recurrence.

A recent partial result is Shi-Mei Ma and Ming-Xin Wang, *Binomial expansions of Jacobi-Stirling numbers and real-rootedness of Jacobi-Stirling descent polynomials*, [arXiv:2610.03111](https://arxiv.org/abs/2610.03111), October 2026. It covers $`i\in\{1,2,3,k-2,k-1\}`$, in fact all nonnegative combinations over the corresponding fixed-size deletion sets. The endpoints $`i=0,k`$ were known. The abstract and the author's maintained [SymCat statement](https://www.symmetricfunctions.com/realRootedSetPartitions.htm) were checked; direct retrieval of the recent full paper was unavailable. The original 2012 paper was read in full text.

Both search engines were used for the exact author names, `Jacobi-Stirling real-rooted conjecture`, `Conjecture 15`, the 2026 paper title, and later proof or counterexample queries. No full resolution was located. This bounded search does not establish priority or certify that no unpublished result exists.

## Exact insertion recurrence

Define

```math
S_Lp=(1+Lx)p+x(1-x)p'.
```

This is the descent polynomial operator for inserting one new largest letter into a word of length $`L`$. Inserting an adjacent pair of identical largest letters has the same effect on internal descents.

Starting with $`A_{0,0}=1`$ and interpreting out-of-range subscripts as zero, the recurrence is

```math
A_{k,i}=S_{3k-2-i}
\left(S_{3k-3-i}A_{k-1,i}+A_{k-1,i-1}\right).
```

If the largest barred letter is retained, first insert it, and then insert the adjacent unbarred pair. If it is deleted, insert only the pair. Both intermediate words in the outer operator have length $`3k-2-i`$. This proves the recurrence without an assumption about real-rootedness.

For example,

```math
\begin{aligned}
A_{1,0}&=1+x,& A_{1,1}&=1,
\\ A_{2,0}&=1+14x+21x^2+4x^3,&
A_{2,1}&=2+12x+6x^2,& A_{2,2}&=1+2x.
\end{aligned}
```

The degree is $`2k-i-1`$ for $`k\ge1`$. Each individual $`S_L`$ preserves the relevant real-rootedness class, but this alone does not justify the sum of its two inputs. A sufficient interlacing relation between those inputs remains to be proved.

## Stronger invariants that fail

The plain bivariate polynomial $`\sum_i A_{k,i}(x)y^i`$ is not real-stable. Already at $`k=2`$, its discriminant as a quadratic in $`y`$ is

```math
4x(x^3-10x^2-7x-4),
```

which is negative at $`x=1`$. Specialization at a real variable value preserves real stability or produces zero, so this rules out that route.

Weighting the $`i`$th term by $`1/i!`$ also fails. At $`k=4,y=-10`$, three times the specialization is

```math
33-2516x+54434x^2+84048x^3-276249x^4-171792x^5+4764x^6+1728x^7.
```

This squarefree polynomial has only five real roots, as verified by exact Sturm counting. Hence this weighting cannot provide a stable polynomial for all $`k`$.

## Unproved candidate and remaining gap

The different weighting

```math
B_k(x,y)=\sum_{i=0}^k\binom{k}{i}A_{k,i}(x)y^i
```

has survived preliminary positive-direction line checks. No proof of its real stability is known here. In particular, finite tests are not used to assert the invariant. Proving real stability would imply the original conjecture by taking coefficients in $`y`$, but a stability-preserving recurrence for $`B_k`$ has not been obtained.

The script [probe.py](probe.py) reproduces the recurrence, both failed weighting routes, and a small exact sanity check for the remaining candidate. These are checks of a proposed proof method, not a new verified range claimed as a mathematical result.
