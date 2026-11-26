# Erdős–Pyber–Tuza rainbow six-cycle conjecture

**Status: partial.** A completely balanced six-coloring whose colors depend on differences in a prime-order group always has a rainbow six-cycle. For arbitrary finite abelian groups of admissible order, a proper full color sumset cannot have a nontrivial period. General completely balanced colorings remain open.

The $C_6$ assertion is the open cycle clause of the Erdős–Pyber–Tuza question in Erdős, *Some of my favorite solved and unsolved problems in graph theory*, 1993, p. 346, and a subproblem of [Erdős #811](https://www.erdosproblems.com/811). The six-color rainbow $K_4$ clause has already been [disproved by Clemen and Wagner](https://arxiv.org/abs/2303.15476). The disjoint-triangle subproblem is tracked separately in [#809](https://github.com/1337isnot1337/solved-conjectures/issues/809).

## Cayley formulation and the cycle

Let $A$ be a finite abelian group of order $6t+1$, with its nonzero elements partitioned into six sets $D_i$ of size $t$ satisfying $D_i=-D_i$. Give $x,y$ color $i$ if $y-x\in D_i$. This gives precisely the completely balanced colorings on $A$ invariant under every translation. The integer $t$ is even, since $A$ is of odd order and each $D_i$ is symmetric and excludes zero.

A rainbow $C_6$ exists if and only if $0\in D_1+\cdots+D_6$. One direction follows by orienting the cycle. For the converse, take representatives $d_i\in D_i$ with total zero. They are nonzero, pairwise distinct, and no two are negatives. Thus no proper zero-sum subset has size 1, 2, 4, or 5. Two distinct zero-sum triples cannot share two representatives, since their third terms would be equal. If they share just one, complement either triple to get two zero-sum triples sharing two. Consequently the only possible proper zero-sum subsets are a single complementary pair of triples. If that pair exists, put the six representatives in an order alternating between the two triples; otherwise any order works. In either case no proper contiguous segment of the ordered sequence sums to zero. Its successive partial sums from zero therefore form a simple six-cycle using the six colors.

## Prime order

**Theorem.** If $p=6t+1$ is prime, then $D_1+\cdots+D_6=\mathbb Z_p$.

For $t=2$, the sets are the pairs $\{\pm r\}$ with $1\le r\le6$. As the subset sums of $1,\ldots,6$ include every integer from 0 to 21, the signed sums include every odd integer from $-21$ to 21 and hence every residue modulo 13. Henceforth $t\ge4$.

For any pair $B,C$ of distinct color classes the set $B+C$ is symmetric and misses zero because $B\cap C=\varnothing$. Thus it has even size. Cauchy–Davenport gives size at least $2t-1$, so the actual lower bound is $2t$. Call the pair small if equality $2t$ holds.

By the [Hamidoune–Rødseth inverse theorem](https://doi.org/10.4064/aa-92-3-251-262), a small pair $B,C$ is contained in two arithmetic progressions of length $t+1$ with the same nonzero difference. Its hypotheses hold: both sets have size at least 4, and the sumset of size $2t$ is at most $p-4$. After scaling the common difference to 1, a symmetric $t$-set $E$ inside a cyclic interval $P$ of size $t+1$ is also inside $-P$, so $|P\cap(-P)|\ge t$. Because $2(t+1)<p$, the two intervals are equal or shifted by exactly one step (in either direction). In the equal case the odd-length interval is centered at zero, and $E$ is that centered interval with zero deleted. In the shifted case, the intersection is a symmetric interval of length $t$, and $E$ is exactly that interval. For this difference there is only one symmetric interval of each of the two lengths: reflection forces the start $a$ of a length-$L$ interval to satisfy $2a=-(L-1)$ modulo $p$. Thus disjoint $B,C$ must have different types.

The two types can be distinguished without choosing a difference: the interval type is a true $t$-term arithmetic progression, whose self-sumset has size $2t-1$. The punctured type has self-sumset of size $2t+1$: scaling again, $\{\pm1,\ldots,\pm(t/2)\}+\{\pm1,\ldots,\pm(t/2)\}$ is the entire integer interval $[-t,t]$ modulo $p$, since $t/2\ge2$. In particular the punctured type cannot be a $t$-term progression with a different difference. Therefore the graph on colors joining small pairs is bipartite, with the arithmetic-progression sets on one side.

Split the colors into two triples. Each triple has a pair that is not small, so two disjoint pairs have sumsets of size at least $2t+2$, and the remaining pair has sumset of size at least $2t$. Applying Cauchy–Davenport twice to the three pair sumsets gives full coverage, as the sum of these lower bounds minus 2 is $6t+2>p$.

## Composite orders: a proper sumset must be aperiodic

Let $S=D_1+\cdots+D_6$ and suppose $S\ne A$. Its stabilizer $H=\{h:S+h=S\}$ cannot have order $h>1$, as follows. In the quotient of order $m=(6t+1)/h$, write $B_i$ for the image of $D_i$. The quotient sum is proper and aperiodic. Every partial sum of the $B_i$ is also aperiodic, since a period of any partial sum persists under adding the remaining sets.

Both $m$ and $h$ are coprime to 6. If $m=6k+1$, then $t/h=k+(1-1/h)/6>k$, so $|B_i|\ge k+1$ for each $i$. Aperiodic [Kneser's theorem](https://doi.org/10.5802/jtnb.618), applied repeatedly, gives quotient sum size at least $6(k+1)-5=m$, a contradiction.

If $m=6k+5$, put $L=k+1$ and $\Delta=(h+1)/6$. Then $t=Lh-\Delta$, and each $|B_i|\ge L$. A minimum-size $B_i$ uses $L$ fibers and leaves at most $\Delta$ places unoccupied in any of those fibers. Two minimum-size images are therefore disjoint: each would use more than half of a shared fiber. They are symmetric, so the presence of two minimum-size images forces $L$ even (otherwise both would contain zero).

The images cover the quotient, including its zero coset since $h>1$. Write $R=\sum_i|B_i|-m$ for the redundancy. Since $6L=m+1$, one has $R\ge1$; Kneser's bound and properness give $R\le4$. If $R=1$ all six images are minimum-size, which contradicts their disjointness because their sizes sum to $m+1$. If $R=2$ exactly one image has size $L+1$ and all others are minimum-size. It overlaps their pairwise disjoint union in exactly two fibers. Each shared fiber can contribute at most $\Delta$ elements to that larger color, so its size is at most $(L-1)h+2\Delta<Lh-\Delta=t$. The strict inequality follows from $h>1$ and $3\Delta=(h+1)/2$.

If $R=3$, at least four images are minimum-size; if $R=4$, at least three are. Pair the six colors so that there are two minimum-size pairs when $R=3$, or one when $R=4$. For each such pair, disjointness and symmetry imply its sumset is even and excludes zero. The aperiodic lower bound $2L-1$ therefore improves to $2L$. For the other pairs use the aperiodic lower bound without the extra unit. Combining the pair sumsets with Kneser gives at least $m+R-5$ plus the number of improved pairs, hence at least $m$ in either case. This is again a contradiction.

Thus every proper $S$ has trivial stabilizer. This conclusion does not rule out a proper aperiodic $S$ in a composite-order group. Nor do these arguments resolve any general non-Cayley coloring.

## Source and priority

The original Erdős–Tuza chapter, [Axenovich–Clemen](https://arxiv.org/abs/2209.13867), [Clemen–Wagner](https://arxiv.org/abs/2303.15476), the [July 2026 working report](https://www.erdosproblemaday.com/report/811), and result searches for completely balanced rainbow $C_6$ and circulant/Cayley colorings were checked. The working report already rules out using the simple lexicographic-power construction to produce counterexamples; that is different from ruling out prime-order translation-invariant colorings. No earlier proof of the two Cayley assertions above was found in the inspected sources. This is a bounded search, not a priority guarantee. Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
