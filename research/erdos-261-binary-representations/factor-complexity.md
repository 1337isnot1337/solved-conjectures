# Aperiodic digits of a rational weighted binary sum have positive entropy

Let $e_1,e_2,\ldots$ be binary digits for which $x=\sum_{j\ge1}j e_j2^{-j}$ is rational. Let $p(L)$ be the number of distinct contiguous words of length $L$ occurring in the digit string. Then either the string is eventually periodic, or for every sufficiently large $L$,
```math
 p(L)>2^{L/100}.
```
In particular **every weighted binary representation of $1/3$ has exponential factor complexity**, by the [denominator obstruction](periodic-digits.md). This applies to the canonical digits discussed by [Borwein and Loring, p. 391](https://www.cecm.sfu.ca/~pborwein/PAPERS/P46.pdf). Exponential complexity within a single expansion does not count distinct expansions of the target in [Erdős #261](https://www.erdosproblems.com/261).

## Repeated words give rational approximations

Let $Q$ be a positive denominator of $x$, and set
```math
 y_i=\sum_{h\ge1}e_{i+h}2^{-h},\quad
 z_i=\sum_{h\ge1}h e_{i+h}2^{-h},\quad
 R_i=i y_i+z_i .
```
Since $R_i$ is the remaining weighted tail scaled by $2^i$, $QR_i$ is an integer. If the words after positions $i,j$ agree for $L$ digits, then
```math
 |y_i-y_j|\le 2^{-L},\qquad |z_i-z_j|\le (L+2)2^{-L}.
```
Consequently, for distinct $i,j\in[N,2N]$, the number $r_i=(R_j-R_i)/(j-i)$ approximates $y_i$ to within $(2N+L+2)2^{-L}$, and it has denominator at most $Q|j-i|$.

Suppose $p(L)\le2^{L/100}$ for arbitrarily large $L$. For each such $L$ let $N=\lfloor2^{L/4}\rfloor$, so the number of words in question is at most $N^{1/20}$ for large $N$. At distance threshold $D$, call a position bad if no other occurrence of its word in $[N,2N]$ lies within distance $D$. The bad positions of each word are spaced more than $D$ apart. There are at most $p(L)(1+N/D)$ bad positions.

Use the two thresholds $D=\lfloor N^{1/3}\rfloor$ and $d=\lfloor N^{1/8}\rfloor$. Partition $[N,2N]$ into disjoint blocks of length $B=\lfloor N^{1/4}\rfloor$, discarding the last incomplete block. Blocks containing a bad position at threshold $D$ contain altogether at most $B p(L)(1+N/D)=o(N)$ positions. The bad positions at threshold $d$ separately number $o(N)$. Thus there is a whole block with no bad position at threshold $D$, and an index $i$ in its first half which is also good at threshold $d$.

Choose a rational approximation at each index of this block, using the small threshold at $i$. All have denominator at most $QD$ and the approximation at $i$ has denominator $s\le Qd$ in lowest terms. All lie in $[0,1]$, because a rational of denominator at most $QD$ strictly outside this interval differs from it by at least $1/(QD)$, much larger than the error. On consecutive positions in the block,
```math
 r_{u+1}=2r_u-e_{u+1}.
```
Indeed the same relation holds for $y_u$. The difference for the rationals has magnitude at most $3(2N+L+2)2^{-L}$ and denominator at most $(QD)^2$, so it is zero for large $N$.

## A long rational binary segment forces a periodic tail

The last relation and the interval bounds say that at least $b=\lfloor B/2\rfloor-1$ successive digits after $i$ agree with an ordinary binary expansion of $r_i$. Its preperiod $a$ is at most $1+\log_2 s$ and its period $t$ at most $s$, including the two choices at a dyadic endpoint. Extend those digits periodically forever and retain the original prefix through $i$, obtaining a weighted sum $x'$. On scaling by $2^i$, the denominator of its tail divides $2^a(2^t-1)^2$, by summing the periodic geometric series and its derivative. Since $x$ and $x'$ agree through digit $i+b$,
```math
 2^i|x-x'|\le(i+b+2)2^{-b}.
```
Here $b$ grows like $N^{1/4}/2$, while $s\le QN^{1/8}$. For large $N$ this bound is smaller than $1/[Q2^a(2^t-1)^2]$, forcing $x=x'$ by rational separation.

If the periodic tail is constant, agreement past its start forces the original continuation to be identical: a constant tail attains the least or greatest possible residual. Otherwise its least period is bounded by a constant $T(Q)$ independent of $L$, by the [finite-period theorem](periodic-digits.md). Once the periodic tail has started, every run of identical digits has length less than $T(Q)$. If the two expansions first differed at some $j>i+b$, the weight $j2^{-j}$ would have to be compensated by later digits. The total later weight is $(j+2)2^{-j}$. At least one of the next $T(Q)$ positions in the periodic expansion has the same digit as at $j$, so its weight cannot contribute toward that compensation. It is at least $j2^{-T(Q)}2^{-j}$, more than $2\cdot2^{-j}$ for sufficiently large $N$. This contradiction shows that the original expansion itself is eventually periodic.

One consequence is that a nonterminating expansion whose support has zero upper Banach density cannot give a rational number. Indeed every sufficiently long word then has at most $o(L)$ ones, uniformly over its starting position, so there are only $2^{o(L)}$ such words. An eventually periodic support of zero upper Banach density is finite. Zero ordinary density permits arbitrary finite words far out in the sequence, so the argument above does not settle that weaker sparsity hypothesis.
