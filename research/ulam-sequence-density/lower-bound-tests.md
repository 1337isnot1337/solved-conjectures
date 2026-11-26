# Tests of lower-bound arguments

Use the genuine sequence $`U`$, $`F=\{2,3,47,69\}`$ and $`T=U\setminus F`$. All numerical results below can be reproduced with `python3 research/ulam-sequence-density/density_probes.py`. The script constructs Ulam numbers by incremental pair addition, then checks the membership decision at **every integer from 3 to 524,288** by a separate integer-polynomial convolution. It subtracts diagonal pairs and divides by two before counting distinct unordered pairs. [Probe](density_probes.py)

## A moment estimate that would rule out zero density

For any finite set of test integers $`W\subseteq[1,X]`$, put $`r=r_T`$ as in the [parent-chain theorem](parents.md). The integer inequality $`2r-r^2\le\mathbf1_{\{r=1\}}`$ and the covering of $`Q_F`$ give

```math
\sum_{n\in W} (2r(n)-r(n)^2) \ \le\ \#(W\cap Q_F)\ \le\ 5A(X).
```

Consequently, a lower bound $`cX`$ for the left side with a fixed $`c>0`$ on an unbounded sequence of scales would prove positive upper density. If it held at every sufficiently large dyadic scale, monotonicity of $`A`$ would give lower density at least $`c/10`$. Convergence to a natural density would still require a separate argument.

For the finite test we used $`b=409258580447/10^{12}`$, the rounded value of Steinerberger's empirical angular frequency divided by $`2\pi`$. In $`(X/2,X]`$ retain the integers for which $`\lvert\{bn\}-1/2\rvert<1/8`$. The braces denote fractional part. We inspected several central widths and report the round width 1/8; this is an exploratory choice. The membership test for this window uses integer arithmetic. [Steinerberger's frequency](https://arxiv.org/abs/1507.00267v6)

| $X$ | Targets in the window with exactly one restricted pair | Sum of $2r-r^2$ |
| ---: | ---: | ---: |
| 8,192 | 53 | 50 |
| 32,768 | 212 | 188 |
| 131,072 | 757 | 679 |
| 524,288 | 2,932 | 2,394 |

Among the 38,865 Ulam numbers through 524,288, exactly 10,721 have both parents outside the four. The largest depth obtained by repeatedly following the larger parent is 1,314 edges. A single chain gives a lower bound on the total count, but the depth calculation supplies no uniform linear bound. The moment test needs a lower estimate for the number of restricted pairs in the window *and* control of coincidences between those pairs. The finite phase measurements supply neither estimate on unbounded scales.

## Which additions does the preceding half force?

Fix $`x`$, let $`B=U\cap[1,x]`$, and work in $`(x,2x]`$. Write $`P`$ for the targets with exactly one representation from $`B`$, and $`V`$ for those with at most one. Every actual new term belongs to $`V`$. At a target in $`P`$, a competing representation would need one new term $`t\in V`$ and one $`b\in B`$, since two integers larger than $`x`$ already sum to more than $`2x`$. Therefore every member of $`P\setminus(V+B)`$ is forced into the sequence.

| $x$ | Old-pair singletons $P$ | Forced by this test | Actual new terms |
| ---: | ---: | ---: | ---: |
| 2,048 | 142 | 0 | 162 |
| 8,192 | 359 | 1 | 632 |
| 32,768 | 723 | 0 | 2,460 |
| 65,536 | 1,199 | 0 | 4,844 |

The empty forced set at several scales rules out a positive pointwise lower bound from this one pass at those scales. It also identifies the loss: a position in $`V`$ with no actual Ulam term can suppress a valid inference. Tracking all later choices one at a time recovers the defining recursion, which by itself gives no scale-independent estimate. The [dilation argument](dilations.md) gives a different sufficient condition for a positive natural density.

## Why uniqueness for accepted terms cannot settle density

There are infinite extensions of **any finite genuine prefix** with zero density and with positive density that both give every selected nonseed exactly one representation by distinct smaller selected terms. The zero-density extension can even have polynomial growth. These statements describe the relaxation obtained by dropping the requirement on omitted integers. Ross discusses an arithmetic-progression example for other seeds. [Ross, Chapter 3](https://asset.library.wisc.edu/1711.dl/6DJJQWLMRTYIH8U/R/file-fb00e.pdf)

Let $`p<q`$ be the final two terms of the chosen prefix. Append $`p+jq`$ for $`j=1,2,\ldots`$. The first new value is the largest sum of two distinct old terms. At each subsequent value, no two old terms suffice. An old term added to a new one must be 0 modulo $`q`$, so that old term is exactly $`q`$. Two new terms have residue $`2p`$ modulo $`q`$, distinct from $`p`$. The resulting sequence has density $`1/q`$. If the prefix contains any term $`f`$ other than $`p,q`$, the omitted numbers $`p+jq+f`$ each have a unique representation for large $`j`$: they exceed every old-old sum, their residue excludes two new summands, and only $`f`$ among the old terms has its residue. The greedy rule would admit them.

For a zero-density extension, append just $`q`$ terms of this progression, then repeat from the new final pair. At stage $`i`$ write $`m_i`$ for the current length and $`p_i<q_i`$ for the last two terms. Then

```math
m_{i+1}=m_i+q_i,\qquad q_{i+1}=q_i^2+p_i.
```

Each finite extension has the uniqueness property just proved, and later terms cannot alter earlier representations. Since $`m_i\le q_i`$, we have $`m_{i+1}/q_{i+1}\le2/q_i\to0`$. At the $`j`$th new term the ratio of index to value is at most $`m_i/q_i+1/q_i`$, uniformly for $`1\le j\le q_i`$. Between terms the counting ratio only decreases. This proves zero density. After the first stage, $`q_i\le2m_i^2`$, so the term of index $`n=m_i+j`$ is at most $`(j+1)q_i\le2n^3`$. Thus even a polynomial growth bound combined with uniqueness on selected terms would leave both density alternatives possible.
